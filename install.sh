#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.4-alpha
# date: 2024-08-28 09:34:56

split__21_v0() {
    local text=$1
    local delimiter=$2
    __AMBER_ARRAY_0=();
    local result=("${__AMBER_ARRAY_0[@]}")
    IFS="${delimiter}" read -rd '' -a result < <(printf %s "$text");
    __AS=$?
    __AF_split21_v0=("${result[@]}");
    return 0
}
lower__28_v0() {
    local text=$1
    __AMBER_VAL_0=$(echo "${text}" | tr '[:upper:]' '[:lower:]');
    __AS=$?;
    __AF_lower28_v0="${__AMBER_VAL_0}";
    return 0
}
shell_isset__70_v0() {
    local name=$1
    [[ ! -z ${!name+z} ]];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_shell_isset70_v0=0;
        return 0
fi
    __AF_shell_isset70_v0=1;
    return 0
}
shell_constant_set__71_v0() {
    local name=$1
    local val=$2
    readonly $name="$val" 2> /dev/null;
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_shell_constant_set71_v0=''
return $__AS
fi
}
shell_var_get__74_v0() {
    local name=$1
    __AMBER_VAL_1=$(echo ${!name});
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_shell_var_get74_v0=''
return $__AS
fi;
    __AF_shell_var_get74_v0="${__AMBER_VAL_1}";
    return 0
}
is_command__76_v0() {
    local command=$1
    [ -x "$(command -v ${command})" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_is_command76_v0=0;
        return 0
fi
    __AF_is_command76_v0=1;
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
    __AMBER_VAL_2=$(echo $REPLY);
    __AS=$?;
    lower__28_v0 "${__AMBER_VAL_2}";
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
    __AMBER_ARRAY_1=("${message}");
    printf__82_v0 "\x1b[1;3;97;42m %s \x1b[0m
" __AMBER_ARRAY_1[@];
    __AF_printf82_v0__126_5="$__AF_printf82_v0";
    echo "$__AF_printf82_v0__126_5" > /dev/null 2>&1
}
error__92_v0() {
    local message=$1
    local exit_code=$2
    __AMBER_ARRAY_2=("${message}");
    printf__82_v0 "\x1b[1;3;97;41m %s \x1b[0m
" __AMBER_ARRAY_2[@];
    __AF_printf82_v0__134_5="$__AF_printf82_v0";
    echo "$__AF_printf82_v0__134_5" > /dev/null 2>&1
    if [ $(echo ${exit_code} '>' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        exit__80_v0 ${exit_code};
        __AF_exit80_v0__135_24="$__AF_exit80_v0";
        echo "$__AF_exit80_v0__135_24" > /dev/null 2>&1
fi
}
depends__103_v0() {
    local command=("${!1}")
    local exit_on_error=$2
    local installer=$3
    split__21_v0 "${command[0]}" "/";
    __AF_split21_v0__5_27=("${__AF_split21_v0[@]}");
    local package_command=("${__AF_split21_v0__5_27[@]}")
    is_command__76_v0 "${package_command[1]}";
    __AF_is_command76_v0__6_25="$__AF_is_command76_v0";
    local command_exist="$__AF_is_command76_v0__6_25"
    local install_failed=0
    if [ $(echo  '!' ${command_exist} | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        echo -e $"${package_command[1]} command could not be found, install package ${package_command[0]}";
        __AS=$?
        shell_isset__70_v0 "DEPENDS_INSTALLER";
        __AF_shell_isset70_v0__10_12="$__AF_shell_isset70_v0";
        if [ $(echo "$__AF_shell_isset70_v0__10_12" '||' $([ "_${installer}" == "_" ]; echo $?) | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
            shell_isset__70_v0 "DEPENDS_INSTALL_AUTO";
            __AF_shell_isset70_v0__11_21="$__AF_shell_isset70_v0";
            shell_var_get__74_v0 "DEPENDS_INSTALL_AUTO";
            __AS=$?;
            __AF_shell_var_get74_v0__11_68="${__AF_shell_var_get74_v0}";
            confirm__78_v0 "Would you like to install it ?" 0;
            __AF_confirm78_v0__11_117="$__AF_confirm78_v0";
            if [ $(echo $(echo "$__AF_shell_isset70_v0__11_21" '&&' $([ "_${__AF_shell_var_get74_v0__11_68}" != "_1" ]; echo $?) | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') '||' "$__AF_confirm78_v0__11_117" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
                # let installer =
                shell_var_get__74_v0 "DEPENDS_INSTALLER";
                __AS=$?;
                __AF_shell_var_get74_v0__13_30="${__AF_shell_var_get74_v0}";
                local cmd="${__AF_shell_var_get74_v0__13_30} ${package_command[0]}"
                ${cmd};
                __AS=$?;
if [ $__AS != 0 ]; then
                    if [ ${exit_on_error} != 0 ]; then
                        exit__80_v0 1;
                        __AF_exit80_v0__15_36="$__AF_exit80_v0";
                        echo "$__AF_exit80_v0__15_36" > /dev/null 2>&1
fi
                    __AF_depends103_v0=0;
                    return 0
fi
fi
else
            if [ ${exit_on_error} != 0 ]; then
                exit__80_v0 1;
                __AF_exit80_v0__20_31="$__AF_exit80_v0";
                echo "$__AF_exit80_v0__20_31" > /dev/null 2>&1
fi
            __AF_depends103_v0=0;
            return 0
fi
fi
    __AF_depends103_v0=1;
    return 0
}
shell_constant_set__71_v0 "DEPENDS_INSTALLER" "sudo apt install";
__AS=$?;
__AF_shell_constant_set71_v0__4_8="$__AF_shell_constant_set71_v0";
echo "$__AF_shell_constant_set71_v0__4_8" > /dev/null 2>&1
shell_constant_set__71_v0 "DEPENDS_INSTALL_AUTO" "1";
__AS=$?;
__AF_shell_constant_set71_v0__5_8="$__AF_shell_constant_set71_v0";
echo "$__AF_shell_constant_set71_v0__5_8" > /dev/null 2>&1
sudo apt install bc;
__AS=$?;
if [ $__AS != 0 ]; then
    error__92_v0 "Mise à jour de l'OS impossible" 1;
    __AF_error92_v0__8_2="$__AF_error92_v0";
    echo "$__AF_error92_v0__8_2" > /dev/null 2>&1
fi
echo_success__90_v0 "Bienvenue dans l'installeur aeroServer";
__AF_echo_success90_v0__11_1="$__AF_echo_success90_v0";
echo "$__AF_echo_success90_v0__11_1" > /dev/null 2>&1
echo_success__90_v0 "mise à jour de l'OS...";
__AF_echo_success90_v0__13_1="$__AF_echo_success90_v0";
echo "$__AF_echo_success90_v0__13_1" > /dev/null 2>&1
sudo apt update;
__AS=$?;
if [ $__AS != 0 ]; then
    error__92_v0 "Mise à jour de l'OS impossible" 1;
    __AF_error92_v0__15_2="$__AF_error92_v0";
    echo "$__AF_error92_v0__15_2" > /dev/null 2>&1
fi
sudo apt upgrade;
__AS=$?;
if [ $__AS != 0 ]; then
    error__92_v0 "Mise à jour de l'OS impossible" 1;
    __AF_error92_v0__19_2="$__AF_error92_v0";
    echo "$__AF_error92_v0__19_2" > /dev/null 2>&1
fi
__AMBER_ARRAY_3=("php/php");
depends__103_v0 __AMBER_ARRAY_3[@] 1 "";
__AF_depends103_v0__22_1="$__AF_depends103_v0";
echo "$__AF_depends103_v0__22_1" > /dev/null 2>&1
confirm__78_v0 "Voulez vous installer le module camera ?" 0;
__AF_confirm78_v0__24_4="$__AF_confirm78_v0";
if [ "$__AF_confirm78_v0__24_4" != 0 ]; then
    echo_success__90_v0 "Installation du module camera...";
    __AF_echo_success90_v0__25_2="$__AF_echo_success90_v0";
    echo "$__AF_echo_success90_v0__25_2" > /dev/null 2>&1
fi