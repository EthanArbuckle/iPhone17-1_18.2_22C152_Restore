@interface UIMaterial
@end

@implementation UIMaterial

void __30___UIMaterial_materialMapping__block_invoke()
{
  v0 = +[UIDevice currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 6)
  {
    self;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  else
  {
    if (v1 == 4)
    {
      self;
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v3 = -[_UIMaterial initWithBlur:]((id *)[_UIMaterial alloc], 7);
      [v2 setObject:v3 forKeyedSubscript:@"systemBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"secondarySystemBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tertiarySystemBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"systemGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"secondarySystemGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tertiarySystemGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tableBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tableCellGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tableCellPlainBackgroundColor"];
      long long v144 = xmmword_186B972A0;
      long long v145 = xmmword_186B972B0;
      long long v146 = xmmword_186B972C0;
      long long v147 = xmmword_186B972D0;
      long long v148 = xmmword_186B92B40;
      v4 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v5 = [_UIMaterial alloc];
      v140 = v4;
      if (v5)
      {
        v6 = -[_UIMaterial initWithVisualEffect:](v5, v4);
        v7 = v6;
        if (v6) {
          *((unsigned char *)v6 + 8) = 1;
        }
      }
      else
      {
        v7 = 0;
      }
      [v2 setObject:v7 forKeyedSubscript:@"systemBlueColor"];

      long long v144 = xmmword_186B972E0;
      long long v145 = xmmword_186B972F0;
      long long v146 = xmmword_186B97300;
      long long v147 = xmmword_186B97310;
      long long v148 = xmmword_186B92B40;
      v8 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v9 = [_UIMaterial alloc];
      v138 = v8;
      if (v9)
      {
        v10 = -[_UIMaterial initWithVisualEffect:](v9, v8);
        v11 = v10;
        if (v10) {
          *((unsigned char *)v10 + 8) = 1;
        }
      }
      else
      {
        v11 = 0;
      }
      [v2 setObject:v11 forKeyedSubscript:@"systemGreenColor"];

      long long v144 = xmmword_186B97320;
      long long v145 = xmmword_186B97330;
      long long v146 = xmmword_186B97340;
      long long v147 = xmmword_186B97350;
      long long v148 = xmmword_186B92B40;
      v12 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v13 = [_UIMaterial alloc];
      v136 = v12;
      if (v13)
      {
        v14 = -[_UIMaterial initWithVisualEffect:](v13, v12);
        v15 = v14;
        if (v14) {
          *((unsigned char *)v14 + 8) = 1;
        }
      }
      else
      {
        v15 = 0;
      }
      [v2 setObject:v15 forKeyedSubscript:@"systemOrangeColor"];

      long long v144 = xmmword_186B97360;
      long long v145 = xmmword_186B97370;
      long long v146 = xmmword_186B97380;
      long long v147 = xmmword_186B97390;
      long long v148 = xmmword_186B92B40;
      v16 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v17 = [_UIMaterial alloc];
      v134 = v16;
      if (v17)
      {
        v18 = -[_UIMaterial initWithVisualEffect:](v17, v16);
        v19 = v18;
        if (v18) {
          *((unsigned char *)v18 + 8) = 1;
        }
      }
      else
      {
        v19 = 0;
      }
      [v2 setObject:v19 forKeyedSubscript:@"systemRedColor"];

      long long v144 = xmmword_186B973A0;
      long long v145 = xmmword_186B973B0;
      long long v146 = xmmword_186B973C0;
      long long v147 = xmmword_186B973D0;
      long long v148 = xmmword_186B92B40;
      v20 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v21 = [_UIMaterial alloc];
      v132 = v20;
      if (v21)
      {
        v22 = -[_UIMaterial initWithVisualEffect:](v21, v20);
        v23 = v22;
        if (v22) {
          *((unsigned char *)v22 + 8) = 1;
        }
      }
      else
      {
        v23 = 0;
      }
      [v2 setObject:v23 forKeyedSubscript:@"systemYellowColor"];

      long long v144 = xmmword_186B973E0;
      long long v145 = xmmword_186B973F0;
      long long v146 = xmmword_186B97400;
      long long v147 = xmmword_186B97410;
      long long v148 = xmmword_186B92B40;
      v24 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v25 = [_UIMaterial alloc];
      if (v25)
      {
        v26 = -[_UIMaterial initWithVisualEffect:](v25, v24);
        v27 = v26;
        if (v26) {
          *((unsigned char *)v26 + 8) = 1;
        }
      }
      else
      {
        v27 = 0;
      }
      [v2 setObject:v27 forKeyedSubscript:@"systemPinkColor"];

      long long v144 = xmmword_186B97420;
      long long v145 = xmmword_186B97430;
      long long v146 = xmmword_186B97440;
      long long v147 = xmmword_186B97450;
      long long v148 = xmmword_186B92B40;
      v28 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v29 = [_UIMaterial alloc];
      if (v29)
      {
        v30 = -[_UIMaterial initWithVisualEffect:](v29, v28);
        v31 = v30;
        if (v30) {
          *((unsigned char *)v30 + 8) = 1;
        }
      }
      else
      {
        v31 = 0;
      }
      [v2 setObject:v31 forKeyedSubscript:@"systemIndigoColor"];

      long long v144 = xmmword_186B97460;
      long long v145 = xmmword_186B97470;
      long long v146 = xmmword_186B97480;
      long long v147 = xmmword_186B97490;
      long long v148 = xmmword_186B92B40;
      v32 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v33 = [_UIMaterial alloc];
      if (v33)
      {
        v34 = -[_UIMaterial initWithVisualEffect:](v33, v32);
        v35 = v34;
        if (v34) {
          *((unsigned char *)v34 + 8) = 1;
        }
      }
      else
      {
        v35 = 0;
      }
      [v2 setObject:v35 forKeyedSubscript:@"systemPurpleColor"];

      long long v144 = xmmword_186B974A0;
      long long v145 = xmmword_186B974B0;
      long long v146 = xmmword_186B974C0;
      long long v147 = xmmword_186B974D0;
      long long v148 = xmmword_186B92B40;
      v36 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v37 = [_UIMaterial alloc];
      if (v37)
      {
        v38 = -[_UIMaterial initWithVisualEffect:](v37, v36);
        v39 = v38;
        if (v38) {
          *((unsigned char *)v38 + 8) = 1;
        }
      }
      else
      {
        v39 = 0;
      }
      [v2 setObject:v39 forKeyedSubscript:@"systemMintColor"];

      long long v144 = xmmword_186B974E0;
      long long v145 = xmmword_186B974F0;
      long long v146 = xmmword_186B97500;
      long long v147 = xmmword_186B97510;
      long long v148 = xmmword_186B92B40;
      v40 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v41 = [_UIMaterial alloc];
      if (v41)
      {
        v42 = -[_UIMaterial initWithVisualEffect:](v41, v40);
        v43 = v42;
        if (v42) {
          *((unsigned char *)v42 + 8) = 1;
        }
      }
      else
      {
        v43 = 0;
      }
      [v2 setObject:v43 forKeyedSubscript:@"systemCyanColor"];

      long long v144 = xmmword_186B97520;
      long long v145 = xmmword_186B97530;
      long long v146 = xmmword_186B97540;
      long long v147 = xmmword_186B97550;
      long long v148 = xmmword_186B92B40;
      v44 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v144 alpha:1.0];
      v45 = [_UIMaterial alloc];
      if (v45)
      {
        v46 = -[_UIMaterial initWithVisualEffect:](v45, v44);
        v47 = v46;
        if (v46) {
          *((unsigned char *)v46 + 8) = 1;
        }
      }
      else
      {
        v47 = 0;
      }
      [v2 setObject:v47 forKeyedSubscript:@"systemTealColor"];

      v48 = [_UIMaterial alloc];
      if (v48) {
        v49 = [(_UIMaterial *)v48 initWithVibrancy:4 forBlurEffectStyle:9];
      }
      else {
        v49 = 0;
      }
      [v2 setObject:v49 forKeyedSubscript:@"systemFillColor"];

      v50 = [_UIMaterial alloc];
      if (v50) {
        v51 = [(_UIMaterial *)v50 initWithVibrancy:5 forBlurEffectStyle:9];
      }
      else {
        v51 = 0;
      }
      [v2 setObject:v51 forKeyedSubscript:@"secondarySystemFillColor"];

      v52 = [_UIMaterial alloc];
      if (v52) {
        v53 = [(_UIMaterial *)v52 initWithVibrancy:6 forBlurEffectStyle:9];
      }
      else {
        v53 = 0;
      }
      [v2 setObject:v53 forKeyedSubscript:@"tertiarySystemFillColor"];

      v54 = [_UIMaterial alloc];
      if (v54) {
        v55 = [(_UIMaterial *)v54 initWithVibrancy:0 forBlurEffectStyle:9];
      }
      else {
        v55 = 0;
      }
      [v2 setObject:v55 forKeyedSubscript:@"labelColor"];

      v56 = [_UIMaterial alloc];
      if (v56) {
        v57 = [(_UIMaterial *)v56 initWithVibrancy:1 forBlurEffectStyle:9];
      }
      else {
        v57 = 0;
      }
      [v2 setObject:v57 forKeyedSubscript:@"secondaryLabelColor"];

      v58 = [_UIMaterial alloc];
      if (v58) {
        v59 = [(_UIMaterial *)v58 initWithVibrancy:2 forBlurEffectStyle:9];
      }
      else {
        v59 = 0;
      }
      [v2 setObject:v59 forKeyedSubscript:@"tertiaryLabelColor"];

      v60 = [_UIMaterial alloc];
      if (v60) {
        v61 = [(_UIMaterial *)v60 initWithVibrancy:3 forBlurEffectStyle:9];
      }
      else {
        v61 = 0;
      }
      [v2 setObject:v61 forKeyedSubscript:@"quaternaryLabelColor"];

      v62 = [_UIMaterial alloc];
      if (v62) {
        v63 = [(_UIMaterial *)v62 initWithVibrancy:7 forBlurEffectStyle:9];
      }
      else {
        v63 = 0;
      }
      [v2 setObject:v63 forKeyedSubscript:@"separatorColor"];
      [v2 setObject:v63 forKeyedSubscript:@"opaqueSeparatorColor"];

      v64 = v140;
    }
    else
    {
      self;
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v3 = -[_UIMaterial initWithBlur:]((id *)[_UIMaterial alloc], 9);
      [v2 setObject:v3 forKeyedSubscript:@"systemBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"secondarySystemBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tertiarySystemBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"systemGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"secondarySystemGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tertiarySystemGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tableBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tableCellGroupedBackgroundColor"];
      [v2 setObject:v3 forKeyedSubscript:@"tableCellPlainBackgroundColor"];
      v65 = [_UIMaterial alloc];
      if (v65) {
        v66 = [(_UIMaterial *)v65 initWithVibrancy:5 forBlurEffectStyle:9];
      }
      else {
        v66 = 0;
      }
      [v2 setObject:v66 forKeyedSubscript:@"_switchOffColor"];

      long long v144 = xmmword_186B974A0;
      long long v145 = xmmword_186B97560;
      long long v146 = xmmword_186B97570;
      long long v147 = xmmword_186B97580;
      long long v148 = xmmword_186B92B40;
      v143[0] = xmmword_186B97590;
      v143[1] = xmmword_186B975A0;
      v143[2] = xmmword_186B975B0;
      v143[3] = xmmword_186B975C0;
      v143[4] = xmmword_186B92B40;
      v67 = +[UIVibrancyEffect _vibrantEffectWithLightCAColorMatrix:&v144 darkCAColorMatrix:v143 alpha:1.0];
      v68 = [_UIMaterial alloc];
      if (v68)
      {
        v69 = -[_UIMaterial initWithVisualEffect:](v68, v67);
        v70 = v69;
        if (v69) {
          *((unsigned char *)v69 + 8) = 1;
        }
      }
      else
      {
        v70 = 0;
      }
      [v2 setObject:v70 forKeyedSubscript:@"systemRedColor"];

      v71 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](48.475, 6.905, -51.525, 91.932, 54.282, -4.146);
      v72 = [_UIMaterial alloc];
      if (v72)
      {
        v73 = -[_UIMaterial initWithVisualEffect:](v72, v71);
        v74 = v73;
        if (v73) {
          *((unsigned char *)v73 + 8) = 1;
        }
      }
      else
      {
        v74 = 0;
      }
      [v2 setObject:v74 forKeyedSubscript:@"systemOrangeColor"];

      v75 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](48.262, 28.262, -51.738, 94.219, 78.139, -1.859);
      v76 = [_UIMaterial alloc];
      if (v76)
      {
        v77 = -[_UIMaterial initWithVisualEffect:](v76, v75);
        v78 = v77;
        if (v77) {
          *((unsigned char *)v77 + 8) = 1;
        }
      }
      else
      {
        v78 = 0;
      }
      [v2 setObject:v78 forKeyedSubscript:@"systemYellowColor"];

      v79 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-30.944, 26.706, -16.434, 11.265, 74.405, 26.955);
      v80 = [_UIMaterial alloc];
      if (v80)
      {
        v81 = -[_UIMaterial initWithVisualEffect:](v80, v79);
        v82 = v81;
        if (v81) {
          *((unsigned char *)v81 + 8) = 1;
        }
      }
      else
      {
        v82 = 0;
      }
      [v2 setObject:v82 forKeyedSubscript:@"systemGreenColor"];

      v83 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-50.597, 27.443, 23.913, 24.238, 75.618, 74.048);
      v84 = [_UIMaterial alloc];
      if (v84)
      {
        v85 = -[_UIMaterial initWithVisualEffect:](v84, v83);
        v86 = v85;
        if (v85) {
          *((unsigned char *)v85 + 8) = 1;
        }
      }
      else
      {
        v86 = 0;
      }
      [v2 setObject:v86 forKeyedSubscript:@"systemMintColor"];

      v87 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-30.679, 19.521, 28.541, 16.214, 69.544, 78.954);
      v88 = [_UIMaterial alloc];
      v141 = v71;
      v142 = v67;
      v137 = v79;
      v139 = v75;
      v133 = v87;
      v135 = v83;
      if (v88)
      {
        v89 = -[_UIMaterial initWithVisualEffect:](v88, v87);
        v90 = v89;
        if (v89) {
          *((unsigned char *)v89 + 8) = 1;
        }
      }
      else
      {
        v90 = 0;
      }
      [v2 setObject:v90 forKeyedSubscript:@"systemTealColor"];

      v91 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-29.99, 18.24, 40.6, 26.993, 70.123, 87.773);
      v92 = [_UIMaterial alloc];
      if (v92)
      {
        v93 = -[_UIMaterial initWithVisualEffect:](v92, v91);
        v94 = v93;
        if (v93) {
          *((unsigned char *)v93 + 8) = 1;
        }
      }
      else
      {
        v94 = 0;
      }
      [v2 setObject:v94 forKeyedSubscript:@"systemCyanColor"];

      v95 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-45.718, 2.122, 54.282, 1.386, 49.224, 97.464);
      v96 = [_UIMaterial alloc];
      if (v96)
      {
        v97 = -[_UIMaterial initWithVisualEffect:](v96, v95);
        v98 = v97;
        if (v97) {
          *((unsigned char *)v97 + 8) = 1;
        }
      }
      else
      {
        v98 = 0;
      }
      [v2 setObject:v98 forKeyedSubscript:@"systemBlueColor"];

      v99 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-11.75, -12.53, 37.66, 34.283, 33.503, 87.623);
      v100 = [_UIMaterial alloc];
      if (v100)
      {
        v101 = -[_UIMaterial initWithVisualEffect:](v100, v99);
        v102 = v101;
        if (v101) {
          *((unsigned char *)v101 + 8) = 1;
        }
      }
      else
      {
        v102 = 0;
      }
      [v2 setObject:v102 forKeyedSubscript:@"systemIndigoColor"];

      v103 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](21.691, -14.779, 40.121, 73.393, 33.783, 93.393);
      v104 = [_UIMaterial alloc];
      if (v104)
      {
        v105 = -[_UIMaterial initWithVisualEffect:](v104, v103);
        v106 = v105;
        if (v105) {
          *((unsigned char *)v105 + 8) = 1;
        }
      }
      else
      {
        v106 = 0;
      }
      [v2 setObject:v106 forKeyedSubscript:@"systemPurpleColor"];

      v107 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](56.855, -25.495, -9.815, 105.312, 26.882, 42.562);
      v108 = [_UIMaterial alloc];
      if (v108)
      {
        v109 = -[_UIMaterial initWithVisualEffect:](v108, v107);
        v110 = v109;
        if (v109) {
          *((unsigned char *)v109 + 8) = 1;
        }
      }
      else
      {
        v110 = 0;
      }
      [v2 setObject:v110 forKeyedSubscript:@"systemPinkColor"];

      v111 = +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](11.937, 0.167, -14.733, 61.393, 49.633, 34.723);
      v112 = [_UIMaterial alloc];
      if (v112)
      {
        v113 = -[_UIMaterial initWithVisualEffect:](v112, v111);
        v114 = v113;
        if (v113) {
          *((unsigned char *)v113 + 8) = 1;
        }
      }
      else
      {
        v114 = 0;
      }
      [v2 setObject:v114 forKeyedSubscript:@"systemBrownColor"];

      v115 = [_UIMaterial alloc];
      if (v115) {
        v116 = [(_UIMaterial *)v115 initWithVibrancy:4 forBlurEffectStyle:9];
      }
      else {
        v116 = 0;
      }
      [v2 setObject:v116 forKeyedSubscript:@"systemFillColor"];

      v117 = [_UIMaterial alloc];
      if (v117) {
        v118 = [(_UIMaterial *)v117 initWithVibrancy:5 forBlurEffectStyle:9];
      }
      else {
        v118 = 0;
      }
      [v2 setObject:v118 forKeyedSubscript:@"secondarySystemFillColor"];

      v119 = [_UIMaterial alloc];
      if (v119) {
        v120 = [(_UIMaterial *)v119 initWithVibrancy:6 forBlurEffectStyle:9];
      }
      else {
        v120 = 0;
      }
      [v2 setObject:v120 forKeyedSubscript:@"tertiarySystemFillColor"];

      v121 = [_UIMaterial alloc];
      if (v121) {
        v122 = [(_UIMaterial *)v121 initWithVibrancy:0 forBlurEffectStyle:9];
      }
      else {
        v122 = 0;
      }
      [v2 setObject:v122 forKeyedSubscript:@"labelColor"];

      v123 = [_UIMaterial alloc];
      if (v123) {
        v124 = [(_UIMaterial *)v123 initWithVibrancy:1 forBlurEffectStyle:9];
      }
      else {
        v124 = 0;
      }
      [v2 setObject:v124 forKeyedSubscript:@"secondaryLabelColor"];

      v125 = [_UIMaterial alloc];
      if (v125) {
        v126 = [(_UIMaterial *)v125 initWithVibrancy:2 forBlurEffectStyle:9];
      }
      else {
        v126 = 0;
      }
      [v2 setObject:v126 forKeyedSubscript:@"tertiaryLabelColor"];

      v127 = [_UIMaterial alloc];
      if (v127) {
        v128 = [(_UIMaterial *)v127 initWithVibrancy:3 forBlurEffectStyle:9];
      }
      else {
        v128 = 0;
      }
      [v2 setObject:v128 forKeyedSubscript:@"quaternaryLabelColor"];

      v129 = [_UIMaterial alloc];
      if (v129) {
        v130 = [(_UIMaterial *)v129 initWithVibrancy:7 forBlurEffectStyle:9];
      }
      else {
        v130 = 0;
      }
      [v2 setObject:v130 forKeyedSubscript:@"separatorColor"];
      [v2 setObject:v130 forKeyedSubscript:@"opaqueSeparatorColor"];

      v64 = v142;
    }
  }
  v131 = (void *)qword_1EB25DE88;
  qword_1EB25DE88 = (uint64_t)v2;
}

@end