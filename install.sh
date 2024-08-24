#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.4-alpha
# date: 2024-08-24 16:10:12

lower__28_v0() {
    local text=$1
    __AMBER_VAL_0=$(echo "${text}" | tr '[:upper:]' '[:lower:]');
    __AS=$?;
    __AF_lower28_v0="${__AMBER_VAL_0}";
    return 0
}
confirm__78_v0() {
    local prompt=$1
    local default_yes=$2
    local choice_default=$(if [ ${default_yes} != 0 ]; then echo " [\x1b[1mY/\x1b[0mn]"; else echo " [y/\x1b[1mN\x1b[0m]"; fi)
            printf "\x1b[1m${prompt}\x1b[0m${choice_default}";
        __AS=$?
        read -s -n 1;
        __AS=$?
        printf "
";
        __AS=$?
    __AMBER_VAL_1=$(echo $REPLY);
    __AS=$?;
    lower__28_v0 "${__AMBER_VAL_1}";
    __AF_lower28_v0__71_18="${__AF_lower28_v0}";
    local result="${__AF_lower28_v0__71_18}"
    __AF_confirm78_v0=$(echo $([ "_${result}" != "_y" ]; echo $?) '||' $(echo $([ "_${result}" != "_" ]; echo $?) '&&' ${default_yes} | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
    return 0
}
exit__80_v0() {
    local code=$1
    exit "${code}";
    __AS=$?
}
printf__82_v0() {
    local format=$1
    local args=("${!2}")
    args=("${format}" "${args[@]}");
    __AS=$?
    printf "${args[@]}";
    __AS=$?
}
echo_success__90_v0() {
    local message=$1
    __AMBER_ARRAY_0=("${message}");
    printf__82_v0 "\x1b[1;3;97;42m %s \x1b[0m
" __AMBER_ARRAY_0[@];
    __AF_printf82_v0__126_5="$__AF_printf82_v0";
    echo "$__AF_printf82_v0__126_5" > /dev/null 2>&1
}
error__92_v0() {
    local message=$1
    local exit_code=$2
    __AMBER_ARRAY_1=("${message}");
    printf__82_v0 "\x1b[1;3;97;41m %s \x1b[0m
" __AMBER_ARRAY_1[@];
    __AF_printf82_v0__134_5="$__AF_printf82_v0";
    echo "$__AF_printf82_v0__134_5" > /dev/null 2>&1
    if [ $(echo ${exit_code} '>' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        exit__80_v0 ${exit_code};
        __AF_exit80_v0__135_24="$__AF_exit80_v0";
        echo "$__AF_exit80_v0__135_24" > /dev/null 2>&1
fi
}

echo_success__90_v0 "Bienvenue dans l'installeur aeroServer";
__AF_echo_success90_v0__4_1="$__AF_echo_success90_v0";
echo "$__AF_echo_success90_v0__4_1" > /dev/null 2>&1
echo_success__90_v0 "mise à jour de l'OS...";
__AF_echo_success90_v0__6_1="$__AF_echo_success90_v0";
echo "$__AF_echo_success90_v0__6_1" > /dev/null 2>&1
sudo apt update;
__AS=$?;
if [ $__AS != 0 ]; then
    error__92_v0 "Mise à jour de l'OS impossible" 1;
    __AF_error92_v0__8_2="$__AF_error92_v0";
    echo "$__AF_error92_v0__8_2" > /dev/null 2>&1
fi
sudo apt upgrade;
__AS=$?;
if [ $__AS != 0 ]; then
    error__92_v0 "Mise à jour de l'OS impossible" 1;
    __AF_error92_v0__12_2="$__AF_error92_v0";
    echo "$__AF_error92_v0__12_2" > /dev/null 2>&1
fi
confirm__78_v0 "Voulez vous installer le module camera ?" 0;
__AF_confirm78_v0__15_4="$__AF_confirm78_v0";
if [ "$__AF_confirm78_v0__15_4" != 0 ]; then
    echo_success__90_v0 "Installation du module camera...";
    __AF_echo_success90_v0__16_2="$__AF_echo_success90_v0";
    echo "$__AF_echo_success90_v0__16_2" > /dev/null 2>&1
fi