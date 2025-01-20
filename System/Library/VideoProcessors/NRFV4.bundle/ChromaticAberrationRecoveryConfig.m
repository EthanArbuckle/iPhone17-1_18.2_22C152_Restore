@interface ChromaticAberrationRecoveryConfig
+ (int)getCARConfigForInputFrame:(id)a3 staticParameters:(id)a4 bounds:(id)a5 carConfig:(id *)a6;
@end

@implementation ChromaticAberrationRecoveryConfig

+ (int)getCARConfigForInputFrame:(id)a3 staticParameters:(id)a4 bounds:(id)a5 carConfig:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  char v250 = 0;
  v249 = v10;
  if (!v9 || !v11 || !a6)
  {
    int v33 = FigSignalErrorAt();
    v19 = 0;
    v247 = 0;
    v248 = 0;
    id v38 = 0;
    id v40 = 0;
    id v17 = 0;
    v15 = 0;
    v14 = 0;
    goto LABEL_55;
  }
  *(_OWORD *)&a6->var4 = 0u;
  *(_OWORD *)&a6[1].var1[2] = 0u;
  *(_OWORD *)&a6->var3.var0[6] = 0u;
  *(_OWORD *)&a6->var3.var1[3] = 0u;
  *(_OWORD *)&a6->var2.var1[5] = 0u;
  *(_OWORD *)&a6->var3.var0[2] = 0u;
  *(_OWORD *)&a6->var2.var0[4] = 0u;
  *(_OWORD *)&a6->var2.var1[1] = 0u;
  *(_OWORD *)&a6->var1[3] = 0u;
  *(_OWORD *)a6->var2.var0 = 0u;
  *(_OWORD *)&a6->var0 = 0u;
  v13 = -[SoftISPInputFrame metadata]((uint64_t)v9);
  v14 = v13;
  if (!v13)
  {
    int v33 = FigSignalErrorAt();
    v19 = 0;
    v247 = 0;
    v248 = 0;
    id v38 = 0;
    id v40 = 0;
    id v17 = 0;
    v15 = 0;
    goto LABEL_55;
  }
  v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if (!v15)
  {
    int v33 = FigSignalErrorAt();
    v19 = 0;
    v247 = 0;
    v248 = 0;
    id v38 = 0;
    id v40 = 0;
    id v17 = 0;
    goto LABEL_55;
  }
  v16 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v10);
  id v17 = [v16 objectForKey:v15];

  if (!v17)
  {
    int v33 = FigSignalErrorAt();
    v19 = 0;
LABEL_68:
    v248 = 0;
    goto LABEL_69;
  }
  v18 = -[SoftISPInputFrame metadata]((uint64_t)v9);
  v19 = [v10 moduleConfigForInputFrameMetadata:v18];

  if (!v19) {
    goto LABEL_67;
  }
  LOBYTE(a6[1].var1[4]) = -[SoftISPInputFrame cfaLayout]((uint64_t)v9) == 3;
  v20 = -[SoftISPInputFrame metadata]((uint64_t)v9);
  v251[0] = 0;
  id v17 = v17;
  objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"PracticalFocalLength", 0, 0.0);
  float v22 = v21;
  LODWORD(v23) = 1.0;
  objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"PixelSize", v251, v23);
  float v25 = v24;

  a6->var0 = v25;
  if (v251[0])
  {
    a6->var0 = v25 / 1000.0;

    goto LABEL_10;
  }
  int v171 = FigSignalErrorAt();

  if (v171)
  {
LABEL_67:
    int v33 = FigSignalErrorAt();
    goto LABEL_68;
  }
LABEL_10:
  float v26 = v22 / 1000.0;
  int v27 = -[SoftISPInputFrame frameID]((uint64_t)v9);
  v28 = [v19 objectForKeyedSubscript:@"ChromaticAberration"];
  v29 = v28;
  if (!v28)
  {
    *(_OWORD *)a6->var1 = xmmword_263481E4C;
    *(_OWORD *)&a6->var1[3] = *(long long *)((char *)&xmmword_263481E4C + 12);
    uint64_t v34 = v27 & 0xFFFF0000;
    if (LOBYTE(a6[1].var1[4]))
    {
      if (v34 == 158466048)
      {
        *(_OWORD *)a6->var2.var0 = xmmword_263481E68;
        *(_OWORD *)&a6->var2.var0[3] = *(long long *)((char *)&xmmword_263481E68 + 12);
        *(_OWORD *)a6->var2.var1 = xmmword_263481E84;
        *(_OWORD *)&a6->var2.var1[3] = *(long long *)((char *)&xmmword_263481E84 + 12);
        *(_OWORD *)a6->var3.var0 = xmmword_263481EA0;
        *(_OWORD *)&a6->var3.var0[3] = *(long long *)((char *)&xmmword_263481EA0 + 12);
        v35 = &xmmword_263481EBC;
        goto LABEL_31;
      }
    }
    else if (v34 == 158466048)
    {
      *(_OWORD *)a6->var2.var0 = xmmword_263481ED8;
      *(_OWORD *)&a6->var2.var0[3] = *(long long *)((char *)&xmmword_263481ED8 + 12);
      *(_OWORD *)a6->var2.var1 = xmmword_263481EF4;
      *(_OWORD *)&a6->var2.var1[3] = *(long long *)((char *)&xmmword_263481EF4 + 12);
      *(_OWORD *)a6->var3.var0 = xmmword_263481F10;
      *(_OWORD *)&a6->var3.var0[3] = *(long long *)((char *)&xmmword_263481F10 + 12);
      v35 = &xmmword_263481F2C;
LABEL_31:
      *(_OWORD *)&a6->var3.var1[3] = *(long long *)((char *)v35 + 12);
      *(_OWORD *)a6->var3.var1 = *v35;
      v248 = 0;
      for (uint64_t i = 0; i != 7; ++i)
      {
        v49 = (float *)((char *)&a6->var0 + i * 4);
        v49[15] = v26 * a6->var2.var1[i];
        v49[29] = v26 * a6->var3.var1[i];
      }
      v247 = 0;
      id v38 = 0;
      id v40 = 0;
      goto LABEL_51;
    }
    v247 = 0;
    v248 = 0;
    id v38 = 0;
    id v40 = 0;
LABEL_54:
    int v33 = 0;
    goto LABEL_55;
  }
  v248 = v28;
  if (LOBYTE(a6[1].var1[4]))
  {
    v30 = [v28 objectForKeyedSubscript:@"QSUB"];
    uint64_t v31 = [v30 objectForKeyedSubscript:@"Lateral"];

    v32 = (void *)v31;
    if (!v31)
    {
LABEL_13:
      int v33 = FigSignalErrorAt();
LABEL_69:
      v247 = 0;
      id v38 = 0;
      id v40 = 0;
      goto LABEL_55;
    }
  }
  else
  {
    v36 = [v28 objectForKeyedSubscript:@"QSUM"];
    uint64_t v37 = [v36 objectForKeyedSubscript:@"Lateral"];

    v32 = (void *)v37;
    if (!v37)
    {
      v32 = [v29 objectForKeyedSubscript:@"Lateral"];
      if (!v32) {
        goto LABEL_13;
      }
    }
  }
  id v38 = [v32 objectForKeyedSubscript:@"RadialModel"];
  uint64_t v39 = [v32 objectForKeyedSubscript:@"RadialOrder"];
  id v40 = (id)v39;
  v247 = v32;
  if (!v38 || !v39) {
    goto LABEL_60;
  }
  v246 = v19;
  v242 = v15;
  v243 = v14;
  v244 = v12;
  id v38 = v38;
  id v40 = v40;
  v41 = [v38 objectAtIndexedSubscript:0];
  v42 = [v41 objectForKeyedSubscript:@"Color"];
  if (![v42 isEqualToString:@"R"]) {
    goto LABEL_47;
  }
  id v245 = v17;
  v43 = [v38 objectAtIndexedSubscript:0];
  v44 = [v43 objectForKeyedSubscript:@"Component"];
  if ([v44 isEqualToString:@"Base"])
  {
    v45 = [v38 objectAtIndexedSubscript:1];
    v46 = [v45 objectForKeyedSubscript:@"Color"];
    if (![v46 isEqualToString:@"B"])
    {
LABEL_45:

      goto LABEL_46;
    }
    v237 = [v38 objectAtIndexedSubscript:1];
    v232 = [v237 objectForKeyedSubscript:@"Component"];
    if ([v232 isEqualToString:@"Base"])
    {
      v227 = [v38 objectAtIndexedSubscript:2];
      v222 = [v227 objectForKeyedSubscript:@"Color"];
      if ([v222 isEqualToString:@"R"])
      {
        v216 = [v38 objectAtIndexedSubscript:2];
        v210 = [v216 objectForKeyedSubscript:@"Component"];
        if ([v210 isEqualToString:@"PFL"])
        {
          v200 = [v38 objectAtIndexedSubscript:3];
          v195 = [v200 objectForKeyedSubscript:@"Color"];
          if ([v195 isEqualToString:@"B"])
          {
            v188 = [v38 objectAtIndexedSubscript:3];
            [v188 objectForKeyedSubscript:@"Component"];
            v47 = id v193 = v40;
            int v205 = [v47 isEqualToString:@"PFL"];

            id v40 = v193;
          }
          else
          {
            int v205 = 0;
          }
        }
        else
        {
          int v205 = 0;
        }

        id v17 = v245;
        v19 = v246;
        if (!v205) {
          goto LABEL_49;
        }
        v41 = [v40 objectAtIndex:0];
        [v41 floatValue];
        if (v50 != 0.0)
        {
          id v17 = v245;
          goto LABEL_48;
        }
        v42 = [v38 objectAtIndexedSubscript:0];
        v43 = [v42 objectForKeyedSubscript:@"Coefficients"];
        v44 = [v43 objectAtIndex:0];
        [v44 floatValue];
        if (v51 != 0.0) {
          goto LABEL_46;
        }
        v45 = [v38 objectAtIndexedSubscript:2];
        v46 = [v45 objectForKeyedSubscript:@"Coefficients"];
        v237 = [v46 objectAtIndex:0];
        [v237 floatValue];
        if (v52 != 0.0) {
          goto LABEL_44;
        }
        v232 = [v38 objectAtIndexedSubscript:1];
        v227 = [v232 objectForKeyedSubscript:@"Coefficients"];
        v222 = [v227 objectAtIndex:0];
        [v222 floatValue];
        if (v53 == 0.0)
        {
          v217 = [v38 objectAtIndexedSubscript:3];
          v211 = [v217 objectForKeyedSubscript:@"Coefficients"];
          [v211 objectAtIndex:0];
          v61 = v194 = v40;
          [v61 floatValue];
          float v63 = v62;

          id v40 = v194;
          id v17 = v245;
          v19 = v246;
          if (v63 == 0.0)
          {
            v64 = [v194 objectAtIndex:1];
            [v64 floatValue];
            float v66 = v65;
            v67 = [v194 objectAtIndex:2];
            [v67 floatValue];
            float v69 = v68;
            v70 = [v194 objectAtIndex:3];
            [v70 floatValue];
            float v72 = v71;
            v73 = [v194 objectAtIndex:4];
            [v73 floatValue];
            float v75 = v74;
            v76 = [v194 objectAtIndex:5];
            [v76 floatValue];
            float v78 = v77;
            v79 = [v194 objectAtIndex:6];
            [v79 floatValue];
            float v81 = v80;
            v82 = [v194 objectAtIndex:7];
            [v82 floatValue];
            float v84 = v83;

            a6->var1[0] = v66;
            a6->var1[1] = v69;
            a6->var1[2] = v72;
            a6->var1[3] = v75;
            a6->var1[4] = v78;
            a6->var1[5] = v81;
            a6->var1[6] = v84;
            v238 = [v38 objectAtIndexedSubscript:0];
            v233 = [v238 objectForKeyedSubscript:@"Coefficients"];
            v228 = [v233 objectAtIndex:1];
            [v228 floatValue];
            float v86 = v85;
            v223 = [v38 objectAtIndexedSubscript:0];
            v218 = [v223 objectForKeyedSubscript:@"Coefficients"];
            v212 = [v218 objectAtIndex:2];
            [v212 floatValue];
            float v88 = v87;
            v206 = [v38 objectAtIndexedSubscript:0];
            v201 = [v206 objectForKeyedSubscript:@"Coefficients"];
            v196 = [v201 objectAtIndex:3];
            [v196 floatValue];
            float v90 = v89;
            v189 = [v38 objectAtIndexedSubscript:0];
            v184 = [v189 objectForKeyedSubscript:@"Coefficients"];
            v180 = [v184 objectAtIndex:4];
            [v180 floatValue];
            float v92 = v91;
            v176 = [v38 objectAtIndexedSubscript:0];
            v172 = [v176 objectForKeyedSubscript:@"Coefficients"];
            v93 = [v172 objectAtIndex:5];
            [v93 floatValue];
            float v95 = v94;
            v96 = [v38 objectAtIndexedSubscript:0];
            v97 = [v96 objectForKeyedSubscript:@"Coefficients"];
            v98 = [v97 objectAtIndex:6];
            [v98 floatValue];
            float v100 = v99;
            v101 = [v38 objectAtIndexedSubscript:0];
            v102 = [v101 objectForKeyedSubscript:@"Coefficients"];
            v103 = [v102 objectAtIndex:7];
            [v103 floatValue];
            float v105 = v104;

            a6->var2.var0[0] = v86;
            a6->var2.var0[1] = v88;
            a6->var2.var0[2] = v90;
            a6->var2.var0[3] = v92;
            a6->var2.var0[4] = v95;
            a6->var2.var0[5] = v100;
            a6->var2.var0[6] = v105;
            v239 = [v38 objectAtIndexedSubscript:2];
            v234 = [v239 objectForKeyedSubscript:@"Coefficients"];
            v229 = [v234 objectAtIndex:1];
            [v229 floatValue];
            float v107 = v106;
            v224 = [v38 objectAtIndexedSubscript:2];
            v219 = [v224 objectForKeyedSubscript:@"Coefficients"];
            v213 = [v219 objectAtIndex:2];
            [v213 floatValue];
            float v109 = v108;
            v207 = [v38 objectAtIndexedSubscript:2];
            v202 = [v207 objectForKeyedSubscript:@"Coefficients"];
            v197 = [v202 objectAtIndex:3];
            [v197 floatValue];
            float v111 = v110;
            v190 = [v38 objectAtIndexedSubscript:2];
            v185 = [v190 objectForKeyedSubscript:@"Coefficients"];
            v181 = [v185 objectAtIndex:4];
            [v181 floatValue];
            float v113 = v112;
            v177 = [v38 objectAtIndexedSubscript:2];
            v173 = [v177 objectForKeyedSubscript:@"Coefficients"];
            v114 = [v173 objectAtIndex:5];
            [v114 floatValue];
            float v116 = v115;
            v117 = [v38 objectAtIndexedSubscript:2];
            v118 = [v117 objectForKeyedSubscript:@"Coefficients"];
            v119 = [v118 objectAtIndex:6];
            [v119 floatValue];
            float v121 = v120;
            v122 = [v38 objectAtIndexedSubscript:2];
            v123 = [v122 objectForKeyedSubscript:@"Coefficients"];
            v124 = [v123 objectAtIndex:7];
            [v124 floatValue];
            float v126 = v125;

            a6->var2.var1[0] = v107;
            a6->var2.var1[1] = v109;
            a6->var2.var1[2] = v111;
            a6->var2.var1[3] = v113;
            a6->var2.var1[4] = v116;
            a6->var2.var1[5] = v121;
            a6->var2.var1[6] = v126;
            v240 = [v38 objectAtIndexedSubscript:1];
            v235 = [v240 objectForKeyedSubscript:@"Coefficients"];
            v230 = [v235 objectAtIndex:1];
            [v230 floatValue];
            float v128 = v127;
            v225 = [v38 objectAtIndexedSubscript:1];
            v220 = [v225 objectForKeyedSubscript:@"Coefficients"];
            v214 = [v220 objectAtIndex:2];
            [v214 floatValue];
            float v130 = v129;
            v208 = [v38 objectAtIndexedSubscript:1];
            v203 = [v208 objectForKeyedSubscript:@"Coefficients"];
            v198 = [v203 objectAtIndex:3];
            [v198 floatValue];
            float v132 = v131;
            v191 = [v38 objectAtIndexedSubscript:1];
            v186 = [v191 objectForKeyedSubscript:@"Coefficients"];
            v182 = [v186 objectAtIndex:4];
            [v182 floatValue];
            float v134 = v133;
            v178 = [v38 objectAtIndexedSubscript:1];
            v174 = [v178 objectForKeyedSubscript:@"Coefficients"];
            v135 = [v174 objectAtIndex:5];
            [v135 floatValue];
            float v137 = v136;
            v138 = [v38 objectAtIndexedSubscript:1];
            v139 = [v138 objectForKeyedSubscript:@"Coefficients"];
            v140 = [v139 objectAtIndex:6];
            [v140 floatValue];
            float v142 = v141;
            v143 = [v38 objectAtIndexedSubscript:1];
            v144 = [v143 objectForKeyedSubscript:@"Coefficients"];
            v145 = [v144 objectAtIndex:7];
            [v145 floatValue];
            float v147 = v146;

            a6->var3.var0[0] = v128;
            a6->var3.var0[1] = v130;
            a6->var3.var0[2] = v132;
            a6->var3.var0[3] = v134;
            a6->var3.var0[4] = v137;
            a6->var3.var0[5] = v142;
            a6->var3.var0[6] = v147;
            v241 = [v38 objectAtIndexedSubscript:3];
            v236 = [v241 objectForKeyedSubscript:@"Coefficients"];
            v231 = [v236 objectAtIndex:1];
            [v231 floatValue];
            float v149 = v148;
            v226 = [v38 objectAtIndexedSubscript:3];
            v221 = [v226 objectForKeyedSubscript:@"Coefficients"];
            v215 = [v221 objectAtIndex:2];
            [v215 floatValue];
            float v151 = v150;
            v209 = [v38 objectAtIndexedSubscript:3];
            v204 = [v209 objectForKeyedSubscript:@"Coefficients"];
            v199 = [v204 objectAtIndex:3];
            [v199 floatValue];
            float v153 = v152;
            v192 = [v38 objectAtIndexedSubscript:3];
            v187 = [v192 objectForKeyedSubscript:@"Coefficients"];
            v183 = [v187 objectAtIndex:4];
            [v183 floatValue];
            float v155 = v154;
            v179 = [v38 objectAtIndexedSubscript:3];
            v175 = [v179 objectForKeyedSubscript:@"Coefficients"];
            v156 = [v175 objectAtIndex:5];
            [v156 floatValue];
            float v158 = v157;
            v159 = [v38 objectAtIndexedSubscript:3];
            v160 = [v159 objectForKeyedSubscript:@"Coefficients"];
            v161 = [v160 objectAtIndex:6];
            [v161 floatValue];
            float v163 = v162;
            v164 = [v38 objectAtIndexedSubscript:3];
            v165 = [v164 objectForKeyedSubscript:@"Coefficients"];
            v166 = [v165 objectAtIndex:7];
            [v166 floatValue];
            float v168 = v167;

            uint64_t v169 = 0;
            a6->var3.var1[0] = v149;
            a6->var3.var1[1] = v151;
            a6->var3.var1[2] = v153;
            a6->var3.var1[3] = v155;
            a6->var3.var1[4] = v158;
            a6->var3.var1[5] = v163;
            a6->var3.var1[6] = v168;
            do
            {
              v170 = (float *)((char *)&a6->var0 + v169 * 4);
              v170[15] = v26 * a6->var2.var1[v169];
              v170[29] = v26 * a6->var3.var1[v169++];
            }
            while (v169 != 7);
            id v40 = v194;

            v14 = v243;
            v12 = v244;
            v15 = v242;
            id v17 = v245;
            v19 = v246;
            goto LABEL_51;
          }
          goto LABEL_49;
        }
      }
    }
LABEL_44:

    goto LABEL_45;
  }
LABEL_46:

  id v17 = v245;
LABEL_47:

LABEL_48:
  v19 = v246;
LABEL_49:
  int v54 = FigSignalErrorAt();

  if (v54)
  {
    int v33 = FigSignalErrorAt();
    v14 = v243;
    v12 = v244;
    v15 = v242;
    goto LABEL_55;
  }
  v14 = v243;
  v12 = v244;
  v15 = v242;
LABEL_51:
  unsigned int v55 = -[SoftISPInputFrame firstPixel]((uint64_t)v9);
  v56.n64_u64[0] = offsetForPixelComponentWithFirstPixel(1u, v55).n64_u64[0];
  *(_WORD *)&a6->var6 = v56.n64_u16[2];
  *(_WORD *)&a6->var4 = v56.n64_u16[0];
  v57.n64_u64[0] = offsetForPixelComponentWithFirstPixel(2u, v55).n64_u64[0];
  HIWORD(a6[1].var0) = v57.n64_u16[2];
  LOWORD(a6[1].var0) = v57.n64_u16[0];
  uint64_t v58 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v12);
  HIWORD(a6[1].var1[0]) = WORD2(v58);
  LOWORD(a6[1].var1[0]) = v58;
  objc_msgSend(v14, "cmi_simdUInt2ValueForKey:defaultValue:found:", *MEMORY[0x263F2F5B0], &v250, 0.0);
  *(float32x2_t *)&a6[1].var1[2] = vcvt_f32_u32(v59);
  if (!v250)
  {
LABEL_60:
    int v33 = FigSignalErrorAt();
    goto LABEL_55;
  }
  if ((int)-[SoftISPStaticParameters deviceGeneration]((uint64_t)v249) > 100) {
    goto LABEL_54;
  }
  int v33 = 0;
  BYTE2(a6[1].var1[4]) = 1;
LABEL_55:

  return v33;
}

@end