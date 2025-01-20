@interface NSCharacterSet(TTRAdditions)
+ (id)hashtagTokenAllowedCharacters;
+ (id)makeFormatCharacters;
+ (uint64_t)emojis;
+ (uint64_t)subtractOtherPunctuationCharactersFrom:()TTRAdditions;
@end

@implementation NSCharacterSet(TTRAdditions)

+ (id)hashtagTokenAllowedCharacters
{
  v0 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
  v1 = [MEMORY[0x1E4F28B88] emojis];
  [v0 formUnionWithCharacterSet:v1];

  v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-_"];
  [v0 formUnionWithCharacterSet:v2];

  v3 = [MEMORY[0x1E4F28B88] makeFormatCharacters];
  [v0 formUnionWithCharacterSet:v3];

  v4 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  [v0 formUnionWithCharacterSet:v4];

  v5 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v0 formUnionWithCharacterSet:v5];

  [MEMORY[0x1E4F28B88] subtractOtherPunctuationCharactersFrom:v0];

  return v0;
}

+ (uint64_t)emojis
{
  return MEMORY[0x1F4113C80]();
}

+ (id)makeFormatCharacters
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v3 = xmmword_1B9BF1390;
  long long v4 = xmmword_1B9BF13A0;
  long long v5 = xmmword_1B9BF13B0;
  long long v6 = xmmword_1B9BF13C0;
  long long v7 = xmmword_1B9BF13D0;
  long long v8 = xmmword_1B9BF13E0;
  long long v9 = xmmword_1B9BF13F0;
  long long v10 = xmmword_1B9BF1400;
  long long v11 = xmmword_1B9BF1410;
  long long v12 = xmmword_1B9BF1420;
  long long v13 = xmmword_1B9BF1430;
  long long v14 = xmmword_1B9BF1440;
  long long v15 = xmmword_1B9BF1450;
  long long v16 = xmmword_1B9BF1460;
  long long v17 = xmmword_1B9BF1470;
  long long v18 = xmmword_1B9BF1480;
  long long v19 = xmmword_1B9BF1490;
  long long v20 = xmmword_1B9BF14A0;
  long long v21 = xmmword_1B9BF14B0;
  long long v22 = xmmword_1B9BF14C0;
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  for (uint64_t i = 0; i != 320; i += 16)
    objc_msgSend(v0, "addCharactersInRange:", *(void *)((char *)&v3 + i), *(void *)((char *)&v3 + i + 8), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17,
      v18,
      v19,
      v20,
      v21,
      v22);

  return v0;
}

+ (uint64_t)subtractOtherPunctuationCharactersFrom:()TTRAdditions
{
  uint64_t v4 = 0;
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  long long v6 = xmmword_1B9BF14D0;
  long long v7 = xmmword_1B9BF14E0;
  long long v8 = xmmword_1B9BF14F0;
  long long v9 = xmmword_1B9BF1500;
  long long v10 = xmmword_1B9BF1510;
  long long v11 = xmmword_1B9BF1520;
  long long v12 = xmmword_1B9BF1530;
  long long v13 = xmmword_1B9BF1540;
  long long v14 = xmmword_1B9BF1550;
  long long v15 = xmmword_1B9BF1560;
  long long v16 = xmmword_1B9BF1570;
  long long v17 = xmmword_1B9BF1580;
  long long v18 = xmmword_1B9BF1590;
  long long v19 = xmmword_1B9BF15A0;
  long long v20 = xmmword_1B9BF15B0;
  long long v21 = xmmword_1B9BF15C0;
  long long v22 = xmmword_1B9BF15D0;
  long long v23 = xmmword_1B9BF15E0;
  long long v24 = xmmword_1B9BF15F0;
  long long v25 = xmmword_1B9BF1600;
  long long v26 = xmmword_1B9BF1610;
  long long v27 = xmmword_1B9BF1620;
  long long v28 = xmmword_1B9BF1630;
  long long v29 = xmmword_1B9BF1640;
  long long v30 = xmmword_1B9BF1650;
  long long v31 = xmmword_1B9BF1660;
  long long v32 = xmmword_1B9BF1670;
  long long v33 = xmmword_1B9BF1680;
  long long v34 = xmmword_1B9BF1690;
  long long v35 = xmmword_1B9BF16A0;
  long long v36 = xmmword_1B9BF16B0;
  long long v37 = xmmword_1B9BF16C0;
  long long v38 = xmmword_1B9BF16D0;
  long long v39 = xmmword_1B9BF16E0;
  long long v40 = xmmword_1B9BF16F0;
  long long v41 = xmmword_1B9BF1700;
  long long v42 = xmmword_1B9BF1710;
  long long v43 = xmmword_1B9BF1720;
  long long v44 = xmmword_1B9BF1730;
  long long v45 = xmmword_1B9BF1740;
  long long v46 = xmmword_1B9BF1750;
  long long v47 = xmmword_1B9BF1760;
  long long v48 = xmmword_1B9BF1770;
  long long v49 = xmmword_1B9BF1780;
  long long v50 = xmmword_1B9BF1790;
  long long v51 = xmmword_1B9BF17A0;
  long long v52 = xmmword_1B9BF17B0;
  long long v53 = xmmword_1B9BF17C0;
  long long v54 = xmmword_1B9BF17D0;
  long long v55 = xmmword_1B9BF17E0;
  long long v56 = xmmword_1B9BF17F0;
  long long v57 = xmmword_1B9BF1800;
  long long v58 = xmmword_1B9BF1810;
  long long v59 = xmmword_1B9BF1820;
  long long v60 = xmmword_1B9BF1830;
  long long v61 = xmmword_1B9BF1840;
  long long v62 = xmmword_1B9BF1850;
  long long v63 = xmmword_1B9BF1860;
  long long v64 = xmmword_1B9BF1870;
  long long v65 = xmmword_1B9BF1880;
  long long v66 = xmmword_1B9BF1890;
  long long v67 = xmmword_1B9BF18A0;
  long long v68 = xmmword_1B9BF18B0;
  long long v69 = xmmword_1B9BF18C0;
  long long v70 = xmmword_1B9BF18D0;
  long long v71 = xmmword_1B9BF18E0;
  long long v72 = xmmword_1B9BF18F0;
  long long v73 = xmmword_1B9BF1900;
  long long v74 = xmmword_1B9BF1910;
  long long v75 = xmmword_1B9BF1920;
  long long v76 = xmmword_1B9BF1930;
  long long v77 = xmmword_1B9BF1940;
  long long v78 = xmmword_1B9BF1950;
  long long v79 = xmmword_1B9BF1960;
  long long v80 = xmmword_1B9BF1970;
  long long v81 = xmmword_1B9BF1980;
  long long v82 = xmmword_1B9BF1990;
  long long v83 = xmmword_1B9BF19A0;
  long long v84 = xmmword_1B9BF19B0;
  long long v85 = xmmword_1B9BF19C0;
  long long v86 = xmmword_1B9BF19D0;
  long long v87 = xmmword_1B9BF19E0;
  long long v88 = xmmword_1B9BF19F0;
  long long v89 = xmmword_1B9BF1A00;
  long long v90 = xmmword_1B9BF1A10;
  long long v91 = xmmword_1B9BF1A20;
  long long v92 = xmmword_1B9BF1A30;
  long long v93 = xmmword_1B9BF1A40;
  long long v94 = xmmword_1B9BF1A50;
  long long v95 = xmmword_1B9BF1A60;
  long long v96 = xmmword_1B9BF1A70;
  long long v97 = xmmword_1B9BF1A80;
  long long v98 = xmmword_1B9BF1A90;
  long long v99 = xmmword_1B9BF1AA0;
  long long v100 = xmmword_1B9BF1AB0;
  long long v101 = xmmword_1B9BF1AC0;
  long long v102 = xmmword_1B9BF1AD0;
  long long v103 = xmmword_1B9BF1AE0;
  long long v104 = xmmword_1B9BF1AF0;
  long long v105 = xmmword_1B9BF1B00;
  long long v106 = xmmword_1B9BF1B10;
  long long v107 = xmmword_1B9BF1B20;
  long long v108 = xmmword_1B9BF1B30;
  long long v109 = xmmword_1B9BF1B40;
  long long v110 = xmmword_1B9BF1B50;
  long long v111 = xmmword_1B9BF1B60;
  long long v112 = xmmword_1B9BF1B70;
  long long v113 = xmmword_1B9BF1B80;
  long long v114 = xmmword_1B9BF1B90;
  long long v115 = xmmword_1B9BF1BA0;
  long long v116 = xmmword_1B9BF1BB0;
  long long v117 = xmmword_1B9BF1BC0;
  long long v118 = xmmword_1B9BF1BD0;
  long long v119 = xmmword_1B9BF1BE0;
  long long v120 = xmmword_1B9BF1BF0;
  long long v121 = xmmword_1B9BF1C00;
  long long v122 = xmmword_1B9BF1C10;
  long long v123 = xmmword_1B9BF1C20;
  long long v124 = xmmword_1B9BF1C30;
  long long v125 = xmmword_1B9BF1C40;
  long long v126 = xmmword_1B9BF1C50;
  long long v127 = xmmword_1B9BF1C60;
  long long v128 = xmmword_1B9BF1C70;
  long long v129 = xmmword_1B9BF1C80;
  long long v130 = xmmword_1B9BF1C90;
  long long v131 = xmmword_1B9BF1CA0;
  long long v132 = xmmword_1B9BF1CB0;
  long long v133 = xmmword_1B9BF1CC0;
  long long v134 = xmmword_1B9BF1CD0;
  long long v135 = xmmword_1B9BF1CE0;
  long long v136 = xmmword_1B9BF1CF0;
  long long v137 = xmmword_1B9BF1D00;
  long long v138 = xmmword_1B9BF1D10;
  long long v139 = xmmword_1B9BF1D20;
  long long v140 = xmmword_1B9BF1D30;
  long long v141 = xmmword_1B9BF1D40;
  long long v142 = xmmword_1B9BF1D50;
  long long v143 = xmmword_1B9BF1D60;
  long long v144 = xmmword_1B9BF1D70;
  long long v145 = xmmword_1B9BF1D80;
  long long v146 = xmmword_1B9BF1D90;
  long long v147 = xmmword_1B9BF1DA0;
  long long v148 = xmmword_1B9BF1DB0;
  long long v149 = xmmword_1B9BF1DC0;
  long long v150 = xmmword_1B9BF1DD0;
  long long v151 = xmmword_1B9BF1DE0;
  long long v152 = xmmword_1B9BF1DF0;
  long long v153 = xmmword_1B9BF1E00;
  long long v154 = xmmword_1B9BF1E10;
  long long v155 = xmmword_1B9BF1E20;
  long long v156 = xmmword_1B9BF1E30;
  long long v157 = xmmword_1B9BF1E40;
  long long v158 = xmmword_1B9BF1E50;
  long long v159 = xmmword_1B9BF1E60;
  long long v160 = xmmword_1B9BF1E70;
  long long v161 = xmmword_1B9BF1E80;
  long long v162 = xmmword_1B9BF1E90;
  long long v163 = xmmword_1B9BF1EA0;
  long long v164 = xmmword_1B9BF1EB0;
  long long v165 = xmmword_1B9BF1EC0;
  long long v166 = xmmword_1B9BF1ED0;
  long long v167 = xmmword_1B9BF1EE0;
  long long v168 = xmmword_1B9BF1EF0;
  long long v169 = xmmword_1B9BF1F00;
  long long v170 = xmmword_1B9BF1F10;
  long long v171 = xmmword_1B9BF1F20;
  long long v172 = xmmword_1B9BF1F30;
  long long v173 = xmmword_1B9BF1F40;
  long long v174 = xmmword_1B9BF1F50;
  long long v175 = xmmword_1B9BF1F60;
  long long v176 = xmmword_1B9BF1F70;
  long long v177 = xmmword_1B9BF1F80;
  long long v178 = xmmword_1B9BF1F90;
  long long v179 = xmmword_1B9BF1FA0;
  long long v180 = xmmword_1B9BF1FB0;
  long long v181 = xmmword_1B9BF1FC0;
  long long v182 = xmmword_1B9BF1FD0;
  long long v183 = xmmword_1B9BF1FE0;
  long long v184 = xmmword_1B9BF1FF0;
  long long v185 = xmmword_1B9BF2000;
  long long v186 = xmmword_1B9BF2010;
  long long v187 = xmmword_1B9BF2020;
  long long v188 = xmmword_1B9BF2030;
  do
  {
    uint64_t result = objc_msgSend(a3, "removeCharactersInRange:", *(void *)((char *)&v6 + v4), *(void *)((char *)&v6 + v4 + 8), v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
               v21,
               v22,
               v23,
               v24,
               v25,
               v26,
               v27,
               v28,
               v29,
               v30,
               v31,
               v32,
               v33,
               v34,
               (void)v35);
    v4 += 16;
  }
  while (v4 != 2928);
  return result;
}

@end