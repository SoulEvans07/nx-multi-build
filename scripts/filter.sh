#!/usr/bin/env bash
echo "filter: $AFFECTED"

REGIONAL=("voucher-fe" "leaflet-be")

# Filter elements in AFFECTED that are also in REGIONAL
regionalAffected=()
defaultAffected=()
for element in ${AFFECTED[@]}; do
  if [[ " ${REGIONAL[@]} " =~ " $element " ]]; then
    regionalAffected+=("\"$element\"")
  else
    defaultAffected+=("\"$element\"")
  fi
done

# Print the regionalAffected array
echo "regional: ${regionalAffected[@]}"
echo "default: ${defaultAffected[@]}"

echo "toJSON"
echo "regional: [$(echo ${regionalAffected[@]} | tr ' ' ',')]"
echo "default: [$(echo ${defaultAffected[@]} | tr ' ' ',')]"

echo "regional=[$(echo ${regionalAffected[@]} | tr ' ' ',')]" >> $GITHUB_OUTPUT
echo "default=[$(echo ${defaultAffected[@]} | tr ' ' ',')]" >> $GITHUB_OUTPUT