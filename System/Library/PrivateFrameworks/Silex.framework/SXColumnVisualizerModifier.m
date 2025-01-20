@interface SXColumnVisualizerModifier
- (id)componentLayoutWithJSON:(id)a3;
- (id)componentStyleWithJSON:(id)a3;
- (id)containerComponentWithJSON:(id)a3;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXColumnVisualizerModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  v190[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v158 = [MEMORY[0x263EFF980] array];
  v148 = v7;
  v8 = [v7 layoutOptions];
  v9 = [v8 columnLayout];

  v10 = [(SXColumnVisualizerModifier *)self componentStyleWithJSON:&unk_26D5941E8];
  v11 = [(SXColumnVisualizerModifier *)self componentStyleWithJSON:&unk_26D594210];
  v12 = [(SXColumnVisualizerModifier *)self componentStyleWithJSON:&unk_26D594238];
  v13 = [(SXColumnVisualizerModifier *)self componentStyleWithJSON:&unk_26D594260];
  v14 = [v6 componentStyles];
  v15 = [v10 identifier];
  v147 = v10;
  [v14 setObject:v10 forKey:v15];

  v16 = [v6 componentStyles];
  v17 = [v11 identifier];
  v146 = v11;
  [v16 setObject:v11 forKey:v17];

  v153 = v6;
  v18 = [v6 componentStyles];
  v19 = [v12 identifier];
  v155 = v12;
  [v18 setObject:v12 forKey:v19];

  v20 = [v6 componentStyles];
  v21 = [v13 identifier];
  v157 = v13;
  [v20 setObject:v13 forKey:v21];

  v190[0] = @"both";
  v189[0] = @"ignoreViewportPadding";
  v189[1] = @"columnRange";
  v187[0] = @"start";
  v187[1] = @"length";
  v188[0] = &unk_26D593B18;
  v22 = NSNumber;
  v23 = [v9 documentLayout];
  v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "columns"));
  v188[1] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v188 forKeys:v187 count:2];
  v190[1] = v25;
  v189[2] = @"minimumHeight";
  v26 = [NSNumber numberWithUnsignedInteger:25];
  v190[2] = v26;
  v27 = [NSDictionary dictionaryWithObjects:v190 forKeys:v189 count:3];
  v145 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v27];

  v185[0] = @"minimumWidth";
  v28 = NSNumber;
  [v9 leftScreenMargin];
  v29 = objc_msgSend(v28, "numberWithDouble:");
  v186[0] = v29;
  v185[1] = @"maximumWidth";
  v30 = NSNumber;
  [v9 leftScreenMargin];
  v31 = objc_msgSend(v30, "numberWithDouble:");
  v186[1] = v31;
  v185[2] = @"minimumHeight";
  v32 = [NSNumber numberWithUnsignedInteger:25];
  v186[2] = v32;
  v33 = [NSDictionary dictionaryWithObjects:v186 forKeys:v185 count:3];
  v152 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v33];

  v183[0] = @"minimumWidth";
  v34 = NSNumber;
  [v9 rightScreenMargin];
  v35 = objc_msgSend(v34, "numberWithDouble:");
  v184[0] = v35;
  v183[1] = @"maximumWidth";
  v36 = NSNumber;
  [v9 rightScreenMargin];
  v37 = objc_msgSend(v36, "numberWithDouble:");
  v184[1] = v37;
  v183[2] = @"minimumHeight";
  v38 = [NSNumber numberWithUnsignedInteger:25];
  v184[2] = v38;
  v39 = [NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:3];
  v151 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v39];

  v181[0] = @"minimumWidth";
  v40 = NSNumber;
  [v9 leftMargin];
  v41 = objc_msgSend(v40, "numberWithDouble:");
  v182[0] = v41;
  v181[1] = @"maximumWidth";
  v42 = NSNumber;
  [v9 leftMargin];
  v43 = objc_msgSend(v42, "numberWithDouble:");
  v182[1] = v43;
  v181[2] = @"minimumHeight";
  v44 = [NSNumber numberWithUnsignedInteger:25];
  v182[2] = v44;
  v45 = [NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:3];
  v150 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v45];

  v179[0] = @"minimumWidth";
  v46 = NSNumber;
  [v9 rightMargin];
  v47 = objc_msgSend(v46, "numberWithDouble:");
  v180[0] = v47;
  v179[1] = @"maximumWidth";
  v48 = NSNumber;
  [v9 rightMargin];
  v49 = objc_msgSend(v48, "numberWithDouble:");
  v180[1] = v49;
  v179[2] = @"minimumHeight";
  v50 = [NSNumber numberWithUnsignedInteger:25];
  v180[2] = v50;
  v51 = [NSDictionary dictionaryWithObjects:v180 forKeys:v179 count:3];
  v149 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v51];

  v177[0] = @"minimumWidth";
  v52 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "gutter"));
  v178[0] = v52;
  v177[1] = @"maximumWidth";
  v53 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "gutter"));
  v178[1] = v53;
  v177[2] = @"minimumHeight";
  v54 = [NSNumber numberWithUnsignedInteger:25];
  v178[2] = v54;
  v55 = [NSDictionary dictionaryWithObjects:v178 forKeys:v177 count:3];
  v56 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v55];

  v175[0] = @"minimumWidth";
  v57 = NSNumber;
  [v9 columnWidth];
  v58 = objc_msgSend(v57, "numberWithDouble:");
  v176[0] = v58;
  v175[1] = @"maximumWidth";
  v59 = NSNumber;
  [v9 columnWidth];
  v60 = objc_msgSend(v59, "numberWithDouble:");
  v176[1] = v60;
  v175[2] = @"minimumHeight";
  v61 = [NSNumber numberWithUnsignedInteger:25];
  v176[2] = v61;
  v62 = [NSDictionary dictionaryWithObjects:v176 forKeys:v175 count:3];
  v63 = [(SXColumnVisualizerModifier *)self componentLayoutWithJSON:v62];

  v64 = [v6 componentLayouts];
  v65 = [v56 identifier];
  v154 = v56;
  [v64 setObject:v56 forKey:v65];

  v66 = [v6 componentLayouts];
  v67 = [v63 identifier];
  v156 = v63;
  [v66 setObject:v63 forKey:v67];

  v68 = [v6 componentLayouts];
  v69 = [v145 identifier];
  [v68 setObject:v145 forKey:v69];

  v70 = [v6 componentLayouts];
  v71 = [v150 identifier];
  [v70 setObject:v150 forKey:v71];

  v72 = [v6 componentLayouts];
  v73 = [v149 identifier];
  [v72 setObject:v149 forKey:v73];

  v74 = [v6 componentLayouts];
  v75 = [v152 identifier];
  [v74 setObject:v152 forKey:v75];

  v76 = [v6 componentLayouts];
  v77 = [v151 identifier];
  [v76 setObject:v151 forKey:v77];

  [v9 leftScreenMargin];
  if (v78 > 0.0)
  {
    v173[0] = @"layout";
    v79 = [v152 identifier];
    v173[1] = @"style";
    v174[0] = v79;
    v80 = [v147 identifier];
    v174[1] = v80;
    v81 = [NSDictionary dictionaryWithObjects:v174 forKeys:v173 count:2];
    v82 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v81];
    v83 = [v82 JSONRepresentation];
    [v158 addObject:v83];
  }
  [v9 leftMargin];
  if (v84 > 0.0)
  {
    v171[0] = @"layout";
    v85 = [v150 identifier];
    v171[1] = @"style";
    v172[0] = v85;
    v86 = [v11 identifier];
    v172[1] = v86;
    v87 = [NSDictionary dictionaryWithObjects:v172 forKeys:v171 count:2];
    v88 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v87];
    v89 = [v88 JSONRepresentation];
    [v158 addObject:v89];
  }
  v90 = [v148 layoutOptions];
  v91 = [v90 columnLayout];
  unint64_t v92 = [v91 numberOfColumns];

  if (v92)
  {
    uint64_t v93 = 0;
    do
    {
      v169[0] = @"layout";
      v94 = [v156 identifier];
      v169[1] = @"style";
      v170[0] = v94;
      v95 = [v157 identifier];
      v170[1] = v95;
      v96 = [NSDictionary dictionaryWithObjects:v170 forKeys:v169 count:2];
      v97 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v96];
      v98 = [v97 JSONRepresentation];
      [v158 addObject:v98];

      if (++v93 < v92 && [v9 gutter] >= 1)
      {
        v167[0] = @"layout";
        v99 = [v154 identifier];
        v167[1] = @"style";
        v168[0] = v99;
        v100 = [v155 identifier];
        v168[1] = v100;
        v101 = [NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:2];
        v102 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v101];
        v103 = [v102 JSONRepresentation];
        [v158 addObject:v103];
      }
    }
    while (v92 != v93);
  }
  [v9 rightMargin];
  if (v104 > 0.0)
  {
    v165[0] = @"layout";
    v105 = [v149 identifier];
    v165[1] = @"style";
    v166[0] = v105;
    v106 = [v11 identifier];
    v166[1] = v106;
    v107 = [NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:2];
    v108 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v107];
    v109 = [v108 JSONRepresentation];
    [v158 addObject:v109];
  }
  [v9 rightScreenMargin];
  if (v110 > 0.0)
  {
    v163[0] = @"layout";
    v111 = [v151 identifier];
    v163[1] = @"style";
    v164[0] = v111;
    v112 = [v147 identifier];
    v164[1] = v112;
    v113 = [NSDictionary dictionaryWithObjects:v164 forKeys:v163 count:2];
    v114 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v113];
    v115 = [v114 JSONRepresentation];
    [v158 addObject:v115];
  }
  v116 = [v153 components];
  v161[0] = @"layout";
  v117 = [v145 identifier];
  v162[0] = v117;
  v162[1] = &unk_26D594288;
  v161[1] = @"contentDisplay";
  v161[2] = @"components";
  v162[2] = v158;
  v118 = [NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:3];
  v119 = [(SXColumnVisualizerModifier *)self containerComponentWithJSON:v118];
  [v116 insertComponent:v119 atIndex:0];

  v120 = [MEMORY[0x263F089D8] string];
  [v9 viewportSize];
  v121 = NSStringFromCGSize(v191);
  [v120 appendFormat:@"Viewport: %@\n", v121];

  [v9 constrainedViewportSize];
  v122 = NSStringFromCGSize(v192);
  [v120 appendFormat:@"Constrained Viewport: %@\n", v122];

  [v9 leftScreenMargin];
  uint64_t v124 = v123;
  [v9 rightScreenMargin];
  objc_msgSend(v120, "appendFormat:", @"Viewport Padding: %.0f/%.0f\n", v124, v125);
  [v9 leftMargin];
  uint64_t v127 = v126;
  [v9 rightMargin];
  objc_msgSend(v120, "appendFormat:", @"Document Margin: %lu/%lu\n", v127, v128);
  objc_msgSend(v120, "appendFormat:", @"Columns: %lu\n", objc_msgSend(v9, "numberOfColumns"));
  [v9 columnWidth];
  objc_msgSend(v120, "appendFormat:", @"ColumnWidth: %.0f\n", v129);
  objc_msgSend(v120, "appendFormat:", @"Gutter: %lu\n", objc_msgSend(v9, "gutter"));
  v130 = [v9 documentLayout];
  uint64_t v131 = [v130 width];
  v132 = [v9 documentLayout];
  uint64_t v133 = [v132 columns];
  v134 = [v9 documentLayout];
  uint64_t v135 = [v134 margin];
  v136 = [v9 documentLayout];
  [v120 appendFormat:@"Document Layout: {width: %lu, columns: %lu, margin: %lu, gutter: %lu}\n", v131, v133, v135, objc_msgSend(v136, "gutter")];

  [v9 contentScaleFactor];
  [v120 appendFormat:@"Content Scale: %.2f", v137];
  v138 = [SXTextComponent alloc];
  v159[0] = @"identifier";
  v139 = [MEMORY[0x263F08C38] UUID];
  v140 = [v139 UUIDString];
  v160[0] = v140;
  v160[1] = @"text";
  v159[1] = @"role";
  v159[2] = @"type";
  v160[2] = @"text";
  v159[3] = @"layout";
  v141 = [v145 identifier];
  v159[4] = @"text";
  v160[3] = v141;
  v160[4] = v120;
  v142 = [NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:5];
  v143 = [(SXJSONObject *)v138 initWithJSONObject:v142 andVersion:@"1.28"];

  v144 = [v153 components];
  [v144 insertComponent:v143 atIndex:0];
}

- (id)componentLayoutWithJSON:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  id v6 = [(SXJSONObject *)[SXComponentLayout alloc] initWithJSONObject:v3 andVersion:@"1.28"];
  return v6;
}

- (id)componentStyleWithJSON:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  id v6 = [(SXJSONObject *)[SXComponentStyle alloc] initWithJSONObject:v3 andVersion:@"1.28"];
  return v6;
}

- (id)containerComponentWithJSON:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  [v3 setObject:@"container" forKey:@"role"];
  [v3 setObject:@"container" forKey:@"type"];
  id v6 = [(SXJSONObject *)[SXContainerComponent alloc] initWithJSONObject:v3 andVersion:@"1.28"];

  return v6;
}

@end