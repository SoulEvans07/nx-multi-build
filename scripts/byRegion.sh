#!/usr/bin/env bash
echo "filter: $AFFECTED"

CZ=("only-cz")
HU=("leaflet-be" "voucher-fe")
SK=("leaflet-be" "voucher-fe" "only-sk")

# Filter elements in AFFECTED that are also in REGIONAL
czAffected=()
huAffected=()
skAffected=()
defaultAffected=()
for element in ${AFFECTED[@]}; do
  if [[ " ${CZ[@]} " =~ " $element " ]]; then
    czAffected+=("\"$element\"")
  elif [[ " ${HU[@]} " =~ " $element " ]]; then
    huAffected+=("\"$element\"")
  elif [[ " ${SK[@]} " =~ " $element " ]]; then
    skAffected+=("\"$element\"")
  else
    defaultAffected+=("\"$element\"")
  fi
done

echo "cz: ${czAffected[@]}"
echo "hu: ${huAffected[@]}"
echo "sk: ${skAffected[@]}"
echo "default: ${defaultAffected[@]}"

echo "toJSON"
echo "cz: [$(echo ${czAffected[@]} | tr ' ' ',')]"
echo "hu: [$(echo ${huAffected[@]} | tr ' ' ',')]"
echo "sk: [$(echo ${skAffected[@]} | tr ' ' ',')]"
echo "default: [$(echo ${defaultAffected[@]} | tr ' ' ',')]"

echo "cz=${czAffected[@]}" >> $GITHUB_OUTPUT
echo "hu=${huAffected[@]}" >> $GITHUB_OUTPUT
echo "sk=${skAffected[@]}" >> $GITHUB_OUTPUT
echo "default=${defaultAffected[@]}" >> $GITHUB_OUTPUT
echo "cz_array=[$(echo ${czAffected[@]} | tr ' ' ',')]" >> $GITHUB_OUTPUT
echo "hu_array=[$(echo ${huAffected[@]} | tr ' ' ',')]" >> $GITHUB_OUTPUT
echo "sk_array=[$(echo ${skAffected[@]} | tr ' ' ',')]" >> $GITHUB_OUTPUT
echo "default_array=[$(echo ${defaultAffected[@]} | tr ' ' ',')]" >> $GITHUB_OUTPUT
