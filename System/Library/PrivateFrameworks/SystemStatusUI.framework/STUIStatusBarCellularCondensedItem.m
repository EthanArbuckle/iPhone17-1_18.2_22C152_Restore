@interface STUIStatusBarCellularCondensedItem
+ (STUIStatusBarIdentifier)animatedTypeDisplayIdentifier;
+ (STUIStatusBarIdentifier)dualNameDisplayIdentifier;
+ (STUIStatusBarIdentifier)dualSignalStrengthDisplayIdentifier;
+ (STUIStatusBarIdentifier)dualSingleLineNameAndTypeDisplayIdentifier;
+ (STUIStatusBarIdentifier)dualSingleLineNameDisplayIdentifier;
+ (STUIStatusBarIdentifier)sosSignalStrengthDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6;
- (BOOL)_animateServiceType:(int64_t)a3 prefixLength:(int64_t *)a4 currentType:(int64_t)a5;
- (BOOL)_showCallFowardingForEntry:(id)a3;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)reducesFontSize;
- (STUIStatusBarCellularCondensedItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (STUIStatusBarCellularNetworkTypeView)animatedNetworkTypeView;
- (STUIStatusBarDualCellularSignalView)dualSignalView;
- (STUIStatusBarEmergencySignalView)sosSignalView;
- (STUIStatusBarMultilineStringView)dualNameView;
- (STUIStatusBarStringView)dualSingleLineNameAndTypeView;
- (STUIStatusBarStringView)dualSingleLineNameView;
- (_NSRange)_nonCondensedFontRangeForEntry:(id)a3;
- (id)_fontForEntry:(id)a3 styleAttributes:(id)a4 baselineOffset:(double *)a5;
- (id)_singleCellularEntryMatching:(id)a3;
- (id)_stringForCellularType:(int64_t)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)entryForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_animatedNetworkTypeView;
- (void)_create_dualNameView;
- (void)_create_dualSignalView;
- (void)_create_dualSingleLineNameAndTypeView;
- (void)_create_dualSingleLineNameView;
- (void)_create_sosSignalView;
- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4;
- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4;
- (void)setAnimatedNetworkTypeView:(id)a3;
- (void)setDualNameView:(id)a3;
- (void)setDualSignalView:(id)a3;
- (void)setDualSingleLineNameAndTypeView:(id)a3;
- (void)setDualSingleLineNameView:(id)a3;
- (void)setReducesFontSize:(BOOL)a3;
- (void)setSosSignalView:(id)a3;
@end

@implementation STUIStatusBarCellularCondensedItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 identifier];
  v9 = [(id)objc_opt_class() dualSignalStrengthDisplayIdentifier];

  if (v8 == v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarCellularCondensedItem;
    unsigned __int8 v12 = [(STUIStatusBarItem *)&v14 canEnableDisplayItem:v7 fromData:v6];
  }
  else
  {
    v10 = [v7 identifier];

    v11 = [(STUIStatusBarCellularCondensedItem *)self entryForDisplayItemWithIdentifier:v10];
    unsigned __int8 v12 = [v11 isEnabled];
  }
  return v12;
}

+ (STUIStatusBarIdentifier)dualSignalStrengthDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualSignalStrengthDisplayIdentifier"];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() dualSignalStrengthDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v11 = [(STUIStatusBarCellularCondensedItem *)self dualSignalView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() dualNameDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v11 = [(STUIStatusBarCellularCondensedItem *)self dualNameView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v11 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v11 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        }
        else
        {
          id v9 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];

          if (v9 == v4)
          {
            uint64_t v11 = [(STUIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
          }
          else
          {
            id v10 = [(id)objc_opt_class() sosSignalStrengthDisplayIdentifier];

            if (v10 == v4)
            {
              uint64_t v11 = [(STUIStatusBarCellularCondensedItem *)self sosSignalView];
            }
            else
            {
              v14.receiver = self;
              v14.super_class = (Class)STUIStatusBarCellularCondensedItem;
              uint64_t v11 = [(STUIStatusBarCellularItem *)&v14 viewForIdentifier:v4];
            }
          }
        }
      }
    }
  }
  unsigned __int8 v12 = (void *)v11;

  return v12;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v197[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v185.receiver = self;
  v185.super_class = (Class)STUIStatusBarCellularCondensedItem;
  v173 = v9;
  id v171 = [(STUIStatusBarCellularItem *)&v185 applyUpdate:v9 toDisplayItem:v10];
  uint64_t v11 = [v10 identifier];
  v172 = [(STUIStatusBarCellularCondensedItem *)self entryForDisplayItemWithIdentifier:v11];

  unsigned __int8 v12 = [v10 identifier];
  v13 = [(id)objc_opt_class() dualSignalStrengthDisplayIdentifier];
  LODWORD(v9) = v12 == v13;

  if (v9)
  {
    v33 = [(STUIStatusBarItem *)self statusBar];
    v34 = [v33 currentAggregatedData];

    v35 = [(STUIStatusBarCellularCondensedItem *)self dualSignalView];
    v36 = [v35 topSignalView];
    v37 = [v34 cellularEntry];
    BOOL v38 = [(STUIStatusBarCellularItem *)self _updateSignalView:v36 withUpdate:v173 entry:v37 forceShowingDisabledSignalBars:1];

    v39 = [(STUIStatusBarCellularCondensedItem *)self dualSignalView];
    v40 = [v39 bottomSignalView];
    v41 = [v34 secondaryCellularEntry];
    BOOL v42 = [(STUIStatusBarCellularItem *)self _updateSignalView:v40 withUpdate:v173 entry:v41 forceShowingDisabledSignalBars:1];

    if ([v173 dataChanged]) {
      [v10 setEnabled:v38 & v42];
    }
    goto LABEL_104;
  }
  objc_super v14 = [v10 identifier];
  v15 = [(id)objc_opt_class() dualNameDisplayIdentifier];
  v16 = v14;
  if (v14 == v15) {
    goto LABEL_20;
  }
  v17 = [v10 identifier];
  id v5 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];
  v18 = v17;
  if (v17 == v5)
  {
LABEL_19:

    v16 = v15;
LABEL_20:

LABEL_21:
    v43 = [(STUIStatusBarItem *)self statusBar];
    v34 = [v43 currentAggregatedData];

    double v181 = 0.0;
    v182 = &v181;
    uint64_t v183 = 0x2020000000;
    char v184 = 0;
    v44 = [(STUIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global];
    __int16 v180 = 0;
    if (v44)
    {
      v165 = 0;
      v168 = 0;
    }
    else
    {
      v176[0] = MEMORY[0x1E4F143A8];
      v176[1] = 3221225472;
      v177 = (__CFString *(*)(uint64_t, void *, __int16 *))__64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2;
      v178 = &unk_1E6AA3710;
      v179 = &v181;
      v45 = [v34 cellularEntry];
      __64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2((uint64_t)v176, v45, (unsigned char *)&v180 + 1);
      v165 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v43 = [v34 secondaryCellularEntry];
      v177((uint64_t)v176, v43, &v180);
      v168 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!*((unsigned char *)v182 + 24)
        && [(__CFString *)v165 length]
        && [(__CFString *)v168 length]
        && ([(__CFString *)v165 isEqualToString:v168] & 1) == 0)
      {
        *((unsigned char *)v182 + 24) = 1;
      }
    }
    int v46 = [v10 isEnabled];
    if (v46)
    {
      v43 = +[STUIStatusBarSettingsDomain rootSettings];
      id v4 = [v43 itemSettings];
      if ([v4 showBothDualCarrierNames]) {
        BOOL v47 = *((unsigned char *)v182 + 24) != 0;
      }
      else {
        BOOL v47 = 0;
      }
      id v5 = [v10 identifier];
      id v6 = [(id)objc_opt_class() nameDisplayIdentifier];
      uint64_t v48 = v47 ^ (v5 == v6);
    }
    else
    {
      uint64_t v48 = 0;
    }
    [v10 setEnabled:v48];
    if (v46)
    {
    }
    if (!*((unsigned char *)v182 + 24) || ![v10 isEnabled]) {
      goto LABEL_103;
    }
    v49 = [v10 identifier];
    v50 = [(id)objc_opt_class() nameDisplayIdentifier];
    BOOL v51 = v49 == v50;

    if (v51)
    {
      if (HIBYTE(v180) || !(_BYTE)v180)
      {
        if ([v172 type]) {
          goto LABEL_103;
        }
        v95 = [v34 secondaryCellularEntry];
        BOOL v96 = [v95 type] == 0;

        if (v96) {
          goto LABEL_103;
        }
      }
      v61 = [(STUIStatusBarCellularItem *)self serviceNameView];
      [(__CFString *)v61 setText:v168];
      v62 = [v34 secondaryCellularEntry];
      v63 = [v62 crossfadeString];
      [(__CFString *)v61 setAlternateText:v63];
    }
    else
    {
      v52 = [v10 identifier];
      v53 = [(id)objc_opt_class() dualNameDisplayIdentifier];
      BOOL v54 = v52 == v53;

      if (v54)
      {
        v61 = [(STUIStatusBarCellularCondensedItem *)self dualNameView];
        v82 = [(__CFString *)v61 stringViews];
        v83 = [v82 firstObject];
        [v83 setText:v165];

        v84 = [(__CFString *)v61 stringViews];
        v85 = [v84 firstObject];
        [v85 setMarqueeRunning:1];

        v86 = [(__CFString *)v61 stringViews];
        v87 = [v86 lastObject];
        [v87 setText:v168];

        v62 = [(__CFString *)v61 stringViews];
        v63 = [v62 lastObject];
        [v63 setMarqueeRunning:1];
      }
      else
      {
        v55 = [(STUIStatusBarItem *)self statusBar];
        uint64_t v162 = [v55 effectiveUserInterfaceLayoutDirection];

        v56 = &stru_1F2F86950;
        if (v165) {
          v56 = v165;
        }
        v57 = v56;
        uint64_t v58 = [(__CFString *)v57 length];
        if (v168 && [(__CFString *)v168 length])
        {
          if ([(__CFString *)v57 length])
          {
            v59 = v168;
            if (v162) {
              v60 = v168;
            }
            else {
              v60 = v57;
            }
            if (v162) {
              v59 = v57;
            }
            v61 = [(__CFString *)v60 stringByAppendingFormat:@" • %@", v59];
          }
          else
          {
            v61 = v168;

            uint64_t v58 = [(__CFString *)v61 length];
          }
        }
        else
        {
          v61 = v57;
        }
        v64 = [v10 identifier];
        v65 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];
        BOOL v66 = v64 == v65;

        if (v66)
        {
          v97 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
          [v97 setText:v61];

          v62 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
          [v62 setMarqueeRunning:1];
LABEL_101:

          goto LABEL_102;
        }
        v67 = [v10 identifier];
        v68 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];
        BOOL v69 = v67 == v68;

        if (!v69)
        {
LABEL_102:

LABEL_103:
          _Block_object_dispose(&v181, 8);
LABEL_104:

          goto LABEL_105;
        }
        v70 = [v173 styleAttributes];
        v62 = (void *)[v70 copy];

        v71 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        uint64_t v156 = objc_msgSend(v62, "fontForStyle:", objc_msgSend(v71, "fontStyle"));

        uint64_t v157 = v58;
        uint64_t v72 = [v62 textColor];
        uint64_t v73 = *MEMORY[0x1E4FB06F8];
        uint64_t v74 = *MEMORY[0x1E4FB0700];
        v196[0] = *MEMORY[0x1E4FB06F8];
        v196[1] = v74;
        v197[0] = v156;
        v197[1] = v72;
        v155 = (void *)v72;
        v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v197 forKeys:v196 count:2];
        v159 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v61 attributes:v158];
        v75 = -[STUIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", [v172 type]);
        if (v75
          || ([v34 secondaryCellularEntry],
              v76 = objc_claimAutoreleasedReturnValue(),
              -[STUIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", [v76 type]), uint64_t v77 = objc_claimAutoreleasedReturnValue(), v76, v157 = objc_msgSend(v159, "length"), (v75 = (void *)v77) != 0))
        {
          v154 = v75;
          if ([v75 length])
          {
            double v175 = 0.0;
            v153 = [(STUIStatusBarCellularCondensedItem *)self _fontForEntry:v172 styleAttributes:v62 baselineOffset:&v175];
            id v78 = objc_alloc(MEMORY[0x1E4F28B18]);
            v194[0] = v73;
            v194[1] = v74;
            v195[0] = v153;
            v195[1] = v155;
            v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v195 forKeys:v194 count:2];
            v80 = (void *)[v78 initWithString:v154 attributes:v79];

            if (v162) {
              uint64_t v157 = [v159 length] - v157;
            }
            v81 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v158];
            [v159 insertAttributedString:v81 atIndex:v157];

            [v159 insertAttributedString:v80 atIndex:v157 + (v162 == 0)];
          }
        }
        else
        {
          v154 = 0;
        }
        v123 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        [v123 setAttributedText:v159];

        v124 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        [v124 setMarqueeRunning:1];

        v63 = (void *)v156;
      }
    }

    goto LABEL_101;
  }
  id v4 = [v10 identifier];
  id v6 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];
  if (v4 == v6)
  {

    v18 = v5;
    goto LABEL_19;
  }
  v19 = [v10 identifier];
  v20 = [(id)objc_opt_class() nameDisplayIdentifier];
  BOOL v21 = v19 == v20;

  if (v21) {
    goto LABEL_21;
  }
  v22 = [v10 identifier];
  v23 = [(id)objc_opt_class() typeDisplayIdentifier];
  BOOL v24 = v22 == v23;

  if (v24)
  {
    if ([v10 isEnabled]
      && (([v173 styleAttributesChanged] & 1) != 0 || objc_msgSend(v173, "dataChanged")))
    {
      v88 = [v173 styleAttributes];
      v34 = (void *)[v88 copy];

      double v181 = 0.0;
      v89 = [(STUIStatusBarCellularCondensedItem *)self _fontForEntry:v172 styleAttributes:v34 baselineOffset:&v181];
      double v90 = v181;
      [v10 baselineOffset];
      if (v90 != v91)
      {
        [v10 setBaselineOffset:v181];
        v92 = [v10 region];
        v93 = [v92 layout];
        [v93 invalidate];
      }
      [v34 setFont:v89];
      uint64_t v169 = [(STUIStatusBarCellularCondensedItem *)self _nonCondensedFontRangeForEntry:v172];
      uint64_t v163 = v94;
      if (v169 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v174.receiver = self;
        v174.super_class = (Class)STUIStatusBarCellularCondensedItem;
        [(STUIStatusBarItem *)&v174 applyStyleAttributes:v34 toDisplayItem:v10];
      }
      else
      {
        id v109 = objc_alloc(MEMORY[0x1E4F28E48]);
        v110 = [(STUIStatusBarCellularItem *)self networkTypeView];
        v111 = [v110 text];
        uint64_t v112 = *MEMORY[0x1E4FB06F8];
        v193[0] = v89;
        uint64_t v113 = *MEMORY[0x1E4FB0700];
        uint64_t v160 = v112;
        v192[0] = v112;
        v192[1] = v113;
        v114 = [v34 textColor];
        v193[1] = v114;
        v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:2];
        v166 = (void *)[v109 initWithString:v111 attributes:v115];

        v116 = (void *)MEMORY[0x1E4FB08E0];
        v117 = [v89 fontDescriptor];
        v118 = [v117 fontDescriptorWithSymbolicTraits:0];
        [v89 pointSize];
        v119 = objc_msgSend(v116, "fontWithDescriptor:size:", v118);

        v190[1] = v113;
        v191[0] = v119;
        v190[0] = v160;
        v120 = [v34 textColor];
        v191[1] = v120;
        v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v191 forKeys:v190 count:2];
        objc_msgSend(v166, "setAttributes:range:", v121, v169, v163);

        v122 = [(STUIStatusBarCellularItem *)self networkTypeView];
        [v122 setAttributedText:v166];
      }
      goto LABEL_104;
    }
    goto LABEL_105;
  }
  v25 = [v10 identifier];
  v26 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];
  BOOL v27 = v25 == v26;

  if (v27)
  {
    if (!v172) {
      goto LABEL_105;
    }
    if ([v172 isEnabled])
    {
      v34 = -[STUIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", [v172 type]);
      int v98 = [v10 isEnabled];
      if (v34) {
        int v99 = v98;
      }
      else {
        int v99 = 0;
      }
      if (v99 == 1)
      {
        uint64_t v100 = [v172 isBootstrapCellular] ^ 1;
LABEL_91:
        [v10 setEnabled:v100];
        if ([v10 isEnabled]
          && (([v173 styleAttributesChanged] & 1) != 0 || objc_msgSend(v173, "dataChanged")))
        {
          v105 = [(STUIStatusBarCellularItem *)self typeStringProvider];

          if (v105)
          {
            v106 = [(STUIStatusBarCellularItem *)self typeStringProvider];
            objc_msgSend(v106, "animatedTypeDisplayItemSpacingFactorForCellularType:", objc_msgSend(v172, "type"));
            double v108 = v107;
          }
          else
          {
            double v108 = 1.0;
          }
          v126 = [(STUIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
          v127 = [v173 styleAttributes];
          +[STUIStatusBarWifiSignalView widthForIconSize:](STUIStatusBarWifiSignalView, "widthForIconSize:", [v127 iconSize]);
          [v126 setFixedWidth:v108 * v128];

          double v181 = NAN;
          uint64_t v129 = [v172 type];
          v130 = [(STUIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
          BOOL v167 = -[STUIStatusBarCellularCondensedItem _animateServiceType:prefixLength:currentType:](self, "_animateServiceType:prefixLength:currentType:", v129, &v181, [v130 type]);

          v131 = [v173 styleAttributes];
          v132 = (void *)[v131 copy];

          double v175 = 0.0;
          v170 = [(STUIStatusBarCellularCondensedItem *)self _fontForEntry:v172 styleAttributes:v132 baselineOffset:&v175];
          double v133 = v175;
          [v10 baselineOffset];
          if (v133 != v134)
          {
            [v10 setBaselineOffset:v175];
            v135 = [v10 region];
            v136 = [v135 layout];
            [v136 invalidate];
          }
          [v132 setFont:v170];
          uint64_t v137 = [(STUIStatusBarCellularCondensedItem *)self _nonCondensedFontRangeForEntry:v172];
          uint64_t v164 = v138;
          uint64_t v139 = v137;
          if (v137 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v140 = [(STUIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
            objc_msgSend(v140, "setText:prefixLength:withStyleAttributes:forType:animated:", v34, *(void *)&v181, v132, objc_msgSend(v172, "type"), v167);
          }
          else
          {
            id v141 = objc_alloc(MEMORY[0x1E4F28E48]);
            uint64_t v142 = *MEMORY[0x1E4FB06F8];
            v189[0] = v170;
            uint64_t v143 = *MEMORY[0x1E4FB0700];
            uint64_t v161 = v142;
            v188[0] = v142;
            v188[1] = v143;
            v144 = [v132 textColor];
            v189[1] = v144;
            v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v189 forKeys:v188 count:2];
            v140 = (void *)[v141 initWithString:v34 attributes:v145];

            v146 = (void *)MEMORY[0x1E4FB08E0];
            v147 = [v170 fontDescriptor];
            v148 = [v147 fontDescriptorWithSymbolicTraits:0];
            [v170 pointSize];
            v149 = objc_msgSend(v146, "fontWithDescriptor:size:", v148);

            v186[1] = v143;
            v187[0] = v149;
            v186[0] = v161;
            v150 = [v132 textColor];
            v187[1] = v150;
            v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:v186 count:2];
            objc_msgSend(v140, "setAttributes:range:", v151, v139, v164);

            v152 = [(STUIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
            objc_msgSend(v152, "setAttributedText:prefixLength:forType:animated:", v140, *(void *)&v181, objc_msgSend(v172, "type"), v167);
          }
        }
        goto LABEL_104;
      }
    }
    else
    {
      [v10 isEnabled];
      v34 = 0;
    }
    uint64_t v100 = 0;
    goto LABEL_91;
  }
  v28 = [v10 identifier];
  v29 = [(id)objc_opt_class() sosSignalStrengthDisplayIdentifier];
  BOOL v30 = v28 == v29;

  if (v172) {
    BOOL v31 = v30;
  }
  else {
    BOOL v31 = 0;
  }
  if (v31)
  {
    BOOL v32 = [v10 isEnabled]
       && ([v172 isBootstrapCellular] & 1) == 0
       && [v172 showsSOSWhenDisabled]
       && (unint64_t)([v172 status] == 1);
    [v10 setEnabled:v32];
    if ([v10 isEnabled])
    {
      v101 = [(STUIStatusBarCellularCondensedItem *)self sosSignalView];
      v102 = [v101 signalView];
      [(STUIStatusBarCellularItem *)self _updateSignalView:v102 withUpdate:v173 entry:v172 forceShowingDisabledSignalBars:1];

      if ([v172 sosAvailable]) {
        double v103 = 1.0;
      }
      else {
        double v103 = 0.3;
      }
      v34 = [(STUIStatusBarCellularCondensedItem *)self sosSignalView];
      v104 = [v34 sosView];
      [v104 setAlpha:v103];

      goto LABEL_104;
    }
  }
LABEL_105:

  return v171;
}

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STUIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_261];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    id v8 = v7;
    goto LABEL_4;
  }
  uint64_t v10 = [(id)objc_opt_class() typeDisplayIdentifier];
  uint64_t v11 = v4;
  if ((id)v10 == v4) {
    goto LABEL_12;
  }
  unsigned __int8 v12 = (void *)v10;
  uint64_t v13 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];
  if ((id)v13 == v4)
  {

    uint64_t v11 = v12;
LABEL_12:

    goto LABEL_13;
  }
  objc_super v14 = (void *)v13;
  id v15 = [(id)objc_opt_class() nameDisplayIdentifier];

  if (v15 == v4)
  {
LABEL_13:
    id v8 = [(STUIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_263];
    if (v8) {
      goto LABEL_4;
    }
  }
  id v16 = [(id)objc_opt_class() nameDisplayIdentifier];

  if (v16 != v4
    || ([(STUIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_265], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)STUIStatusBarCellularCondensedItem;
    id v7 = [(STUIStatusBarCellularItem *)&v17 entryForDisplayItemWithIdentifier:v4];
    goto LABEL_3;
  }
LABEL_4:

  return v8;
}

+ (STUIStatusBarIdentifier)animatedTypeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"animatedTypeDisplayIdentifier"];
}

- (id)_singleCellularEntryMatching:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  id v5 = [(STUIStatusBarItem *)self statusBar];
  id v6 = [v5 currentAggregatedData];

  id v7 = [v6 cellularEntry];
  if (v4[2](v4, v7))
  {
    id v8 = [v6 secondaryCellularEntry];
    char v9 = v4[2](v4, v8);

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [v6 cellularEntry];
LABEL_9:
      objc_super v14 = (void *)v10;
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v11 = [v6 cellularEntry];
  if (v4[2](v4, v11))
  {
  }
  else
  {
    unsigned __int8 v12 = [v6 secondaryCellularEntry];
    int v13 = v4[2](v4, v12);

    if (v13)
    {
      uint64_t v10 = [v6 secondaryCellularEntry];
      goto LABEL_9;
    }
  }
  objc_super v14 = 0;
LABEL_11:

  return v14;
}

uint64_t __72__STUIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled]) {
    uint64_t v3 = [v2 isBootstrapCellular] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __72__STUIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    uint64_t v3 = [v2 isBootstrapCellular] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (STUIStatusBarDualCellularSignalView)dualSignalView
{
  dualSignalView = self->_dualSignalView;
  if (!dualSignalView)
  {
    [(STUIStatusBarCellularCondensedItem *)self _create_dualSignalView];
    dualSignalView = self->_dualSignalView;
  }
  return dualSignalView;
}

+ (STUIStatusBarIdentifier)dualSingleLineNameAndTypeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualSingleLineNameAndTypeDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)dualNameDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualNameDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)sosSignalStrengthDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"sosSignalStrengthDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)dualSingleLineNameDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualSingleLineNameDisplayIdentifier"];
}

uint64_t __72__STUIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 wifiCallingEnabled]) {
    uint64_t v3 = [v2 isBootstrapCellular] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (STUIStatusBarEmergencySignalView)sosSignalView
{
  sosSignalView = self->_sosSignalView;
  if (!sosSignalView)
  {
    [(STUIStatusBarCellularCondensedItem *)self _create_sosSignalView];
    sosSignalView = self->_sosSignalView;
  }
  return sosSignalView;
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  uint64_t v9 = [(id)objc_opt_class() typeDisplayIdentifier];
  if (v8 == (void *)v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [v7 identifier];
  uint64_t v12 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];
  if (v11 == (void *)v12)
  {

    goto LABEL_7;
  }
  int v13 = (void *)v12;
  objc_super v14 = [v7 identifier];
  id v15 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];

  if (v14 != v15)
  {
    v16.receiver = self;
    v16.super_class = (Class)STUIStatusBarCellularCondensedItem;
    [(STUIStatusBarItem *)&v16 applyStyleAttributes:v6 toDisplayItem:v7];
  }
LABEL_8:
}

- (void)_create_dualSignalView
{
  uint64_t v3 = [STUIStatusBarDualCellularSignalView alloc];
  id v4 = -[STUIStatusBarDualCellularSignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualSignalView = self->_dualSignalView;
  self->_dualSignalView = v4;

  id v6 = [(STUIStatusBarDualCellularSignalView *)self->_dualSignalView topSignalView];
  [v6 setNumberOfBars:4];

  id v7 = [(STUIStatusBarDualCellularSignalView *)self->_dualSignalView bottomSignalView];
  [v7 setNumberOfBars:4];
}

- (STUIStatusBarCellularCondensedItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarCellularCondensedItem;
  id v4 = [(STUIStatusBarCellularItem *)&v6 initWithIdentifier:a3 statusBar:a4];
  [(STUIStatusBarCellularCondensedItem *)v4 setReducesFontSize:1];
  return v4;
}

- (void)setReducesFontSize:(BOOL)a3
{
  self->_reducesFontSize = a3;
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA9740], *MEMORY[0x1E4FA97C8], 0);
}

- (void)_create_sosSignalView
{
  uint64_t v3 = [STUIStatusBarEmergencySignalView alloc];
  id v4 = -[STUIStatusBarEmergencySignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sosSignalView = self->_sosSignalView;
  self->_sosSignalView = v4;

  id v6 = [(STUIStatusBarEmergencySignalView *)self->_sosSignalView signalView];
  [v6 setNumberOfBars:4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedNetworkTypeView, 0);
  objc_storeStrong((id *)&self->_sosSignalView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameAndTypeView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameView, 0);
  objc_storeStrong((id *)&self->_dualNameView, 0);
  objc_storeStrong((id *)&self->_dualSignalView, 0);
}

BOOL __64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled])
  {
    uint64_t v3 = [v2 string];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

__CFString *__64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 status] == 5 || (objc_msgSend(v5, "wifiCallingEnabled") & 1) != 0)
  {
    *a3 = 1;
LABEL_4:
    id v6 = [v5 string];
    goto LABEL_5;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *a3 = 0;
  if ([v5 status] != 1 && objc_msgSend(v5, "status") != 2) {
    goto LABEL_4;
  }
  id v6 = @"– –";
LABEL_5:

  return v6;
}

- (id)_stringForCellularType:(int64_t)a3
{
  id v5 = [(STUIStatusBarCellularItem *)self typeStringProvider];

  if (!v5
    || ([(STUIStatusBarCellularItem *)self typeStringProvider],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 stringForCellularType:a3 condensed:1],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (a3 == 7)
    {
      id v8 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v9 = v8;
      uint64_t v10 = @"5GE[condensed]";
      uint64_t v11 = @"5G  ᴇ";
    }
    else
    {
      if (a3 == 3)
      {
        id v8 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v9 = v8;
        uint64_t v10 = @"E";
      }
      else
      {
        if (a3 != 2)
        {
LABEL_11:
          v13.receiver = self;
          v13.super_class = (Class)STUIStatusBarCellularCondensedItem;
          id v7 = [(STUIStatusBarCellularItem *)&v13 _stringForCellularType:a3];
          goto LABEL_12;
        }
        id v8 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v9 = v8;
        uint64_t v10 = @"G";
      }
      uint64_t v11 = &stru_1F2F86950;
    }
    id v7 = [v8 localizedStringForKey:v10 value:v11 table:0];

    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  return v7;
}

- (id)_fontForEntry:(id)a3 styleAttributes:(id)a4 baselineOffset:(double *)a5
{
  id v8 = a3;
  id v9 = [a4 smallFont];
  uint64_t v10 = [(STUIStatusBarCellularItem *)self typeStringProvider];

  uint64_t v11 = v9;
  if (v10)
  {
    uint64_t v12 = [(STUIStatusBarCellularItem *)self typeStringProvider];
    uint64_t v11 = objc_msgSend(v12, "condensedFontForCellularType:defaultFont:baselineOffset:", objc_msgSend(v8, "type"), v9, a5);
  }
  return v11;
}

- (_NSRange)_nonCondensedFontRangeForEntry:(id)a3
{
  uint64_t v3 = [a3 type];
  NSUInteger v4 = (v3 & 0xFFFFFFFFFFFFFFFELL) == 12;
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC) {
    NSUInteger v5 = 2;
  }
  else {
    NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v4;
  result.location = v5;
  return result;
}

- (BOOL)_showCallFowardingForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STUIStatusBarItem *)self statusBar];
  id v6 = [(id)v5 currentAggregatedData];
  id v7 = [v6 secondaryCellularEntry];

  LOBYTE(v5) = [v4 callForwardingEnabled];
  if (v5) {
    char v8 = 1;
  }
  else {
    char v8 = [v7 callForwardingEnabled];
  }

  return v8;
}

- (BOOL)_animateServiceType:(int64_t)a3 prefixLength:(int64_t *)a4 currentType:(int64_t)a5
{
  if ((unint64_t)(a3 - 11) >= 3) {
    return a3 == 10 && (unint64_t)(a5 - 11) < 3;
  }
  if (a4) {
    *a4 = 2;
  }
  return a5 == 10;
}

- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] != 1) {
    goto LABEL_11;
  }
  char v8 = [v7 identifier];
  id v9 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];

  if (v8 == v9)
  {
    uint64_t v12 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
LABEL_6:
    objc_super v13 = v12;
    if (v12)
    {
      [v12 setMarqueeRunning:0];
      objc_super v14 = v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke;
      v23[3] = &unk_1E6AA36C8;
      v23[4] = v13;
LABEL_10:
      id v21 = v13;
      [v6 addCompletionHandler:v14];

      goto LABEL_11;
    }
    goto LABEL_8;
  }
  uint64_t v10 = [v7 identifier];
  uint64_t v11 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];

  if (v10 == v11)
  {
    uint64_t v12 = [(STUIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
    goto LABEL_6;
  }
LABEL_8:
  id v15 = [v7 identifier];
  objc_super v16 = [(id)objc_opt_class() dualNameDisplayIdentifier];

  if (v15 == v16)
  {
    objc_super v13 = [(STUIStatusBarCellularCondensedItem *)self dualNameView];
    objc_super v17 = [v13 stringViews];
    v18 = [v17 firstObject];
    [v18 setMarqueeRunning:0];

    v19 = [v13 stringViews];
    v20 = [v19 lastObject];
    [v20 setMarqueeRunning:0];

    objc_super v14 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2;
    v22[3] = &unk_1E6AA36C8;
    v22[4] = v13;
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setMarqueeRunning:1];
  }
  return result;
}

void __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [*(id *)(a1 + 32) stringViews];
    uint64_t v5 = [v4 firstObject];
    [v5 setMarqueeRunning:1];

    id v7 = [*(id *)(a1 + 32) stringViews];
    id v6 = [v7 lastObject];
    [v6 setMarqueeRunning:1];
  }
}

- (STUIStatusBarMultilineStringView)dualNameView
{
  dualNameView = self->_dualNameView;
  if (!dualNameView)
  {
    [(STUIStatusBarCellularCondensedItem *)self _create_dualNameView];
    dualNameView = self->_dualNameView;
  }
  return dualNameView;
}

- (void)_create_dualNameView
{
  uint64_t v3 = [STUIStatusBarMultilineStringView alloc];
  id v4 = -[STUIStatusBarMultilineStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualNameView = self->_dualNameView;
  self->_dualNameView = v4;

  [(STUIStatusBarMultilineStringView *)self->_dualNameView setNumberOfLines:2];
  id v6 = [(STUIStatusBarMultilineStringView *)self->_dualNameView stringViews];
  id v9 = [v6 firstObject];

  [v9 setTextAlignment:1];
  [v9 setFontStyle:2];
  [v9 setMarqueeEnabled:1];
  id v7 = [(STUIStatusBarMultilineStringView *)self->_dualNameView stringViews];
  char v8 = [v7 lastObject];

  [v8 setTextAlignment:1];
  [v8 setFontStyle:2];
  [v8 setMarqueeEnabled:1];
}

- (STUIStatusBarStringView)dualSingleLineNameView
{
  dualSingleLineNameView = self->_dualSingleLineNameView;
  if (!dualSingleLineNameView)
  {
    [(STUIStatusBarCellularCondensedItem *)self _create_dualSingleLineNameView];
    dualSingleLineNameView = self->_dualSingleLineNameView;
  }
  return dualSingleLineNameView;
}

- (void)_create_dualSingleLineNameView
{
  uint64_t v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualSingleLineNameView = self->_dualSingleLineNameView;
  self->_dualSingleLineNameView = v4;

  [(STUIStatusBarStringView *)self->_dualSingleLineNameView setNumberOfLines:1];
  [(STUIStatusBarStringView *)self->_dualSingleLineNameView setFontStyle:0];
  [(STUIStatusBarStringView *)self->_dualSingleLineNameView setMarqueeEnabled:1];
  id v6 = self->_dualSingleLineNameView;
  LODWORD(v7) = 1132068864;
  [(STUIStatusBarStringView *)v6 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (STUIStatusBarStringView)dualSingleLineNameAndTypeView
{
  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  if (!dualSingleLineNameAndTypeView)
  {
    [(STUIStatusBarCellularCondensedItem *)self _create_dualSingleLineNameAndTypeView];
    dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  }
  return dualSingleLineNameAndTypeView;
}

- (void)_create_dualSingleLineNameAndTypeView
{
  uint64_t v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  self->_dualSingleLineNameAndTypeView = v4;

  [(STUIStatusBarStringView *)self->_dualSingleLineNameAndTypeView setNumberOfLines:1];
  [(STUIStatusBarStringView *)self->_dualSingleLineNameAndTypeView setFontStyle:0];
  [(STUIStatusBarStringView *)self->_dualSingleLineNameAndTypeView setMarqueeEnabled:1];
  id v6 = self->_dualSingleLineNameAndTypeView;
  LODWORD(v7) = 1132068864;
  [(STUIStatusBarStringView *)v6 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (STUIStatusBarCellularNetworkTypeView)animatedNetworkTypeView
{
  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  if (!animatedNetworkTypeView)
  {
    [(STUIStatusBarCellularCondensedItem *)self _create_animatedNetworkTypeView];
    animatedNetworkTypeView = self->_animatedNetworkTypeView;
  }
  return animatedNetworkTypeView;
}

- (void)_create_animatedNetworkTypeView
{
  uint64_t v3 = [STUIStatusBarCellularNetworkTypeView alloc];
  id v4 = -[STUIStatusBarCellularNetworkTypeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  self->_animatedNetworkTypeView = v4;
  MEMORY[0x1F41817F8](v4, animatedNetworkTypeView);
}

- (BOOL)reducesFontSize
{
  return self->_reducesFontSize;
}

- (void)setDualSignalView:(id)a3
{
}

- (void)setDualNameView:(id)a3
{
}

- (void)setDualSingleLineNameView:(id)a3
{
}

- (void)setDualSingleLineNameAndTypeView:(id)a3
{
}

- (void)setSosSignalView:(id)a3
{
}

- (void)setAnimatedNetworkTypeView:(id)a3
{
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  v54[1] = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    int64_t v7 = a3 - a4;
    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularCondensedItem;
    char v8 = objc_msgSendSuper2(&v48, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3 - a4, 0, a5, 1);
    id v9 = [a1 dualSignalStrengthDisplayIdentifier];
    uint64_t v10 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v9 priority:v7 + 7];
    uint64_t v11 = [v8 signalStrengthPlacement];
    v54[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    uint64_t v13 = [v10 excludingPlacements:v12];

    objc_super v14 = [a1 dualSingleLineNameDisplayIdentifier];
    id v15 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v14 priority:v7 + 3];
    objc_super v16 = [v8 namePlacement];
    v53 = v16;
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    uint64_t v18 = [v15 excludingPlacements:v17];

    v19 = [v8 typePlacement];
    v45 = (void *)v13;
    uint64_t v52 = v13;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    id v21 = [v19 requiringAnyPlacements:v20];

    v22 = [a1 dualSingleLineNameAndTypeDisplayIdentifier];
    v23 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:v7 + 5];
    BOOL v24 = [v8 namePlacement];
    v51[0] = v24;
    v51[1] = v18;
    uint64_t v25 = v18;
    v43 = (void *)v18;
    v51[2] = v21;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
    v44 = [v23 excludingPlacements:v26];

    BOOL v27 = [v8 signalStrengthPlacement];
    v50[0] = v27;
    v50[1] = v13;
    v28 = [v8 warningPlacement];
    v50[2] = v28;
    v29 = [v8 rawPlacement];
    v50[3] = v29;
    BOOL v30 = [v8 namePlacement];
    v50[4] = v30;
    v50[5] = v25;
    v50[6] = v44;
    v50[7] = v21;
    BOOL v31 = [v8 callForwardingPlacement];
    v50[8] = v31;
    BOOL v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:9];
    v33 = +[STUIStatusBarDisplayItemPlacementGroup groupWithPriority:a4 placements:v32];

    v34 = [v8 signalStrengthPlacement];
    [v33 setSignalStrengthPlacement:v34];

    v35 = [v8 warningPlacement];
    [v33 setWarningPlacement:v35];

    v36 = [v8 namePlacement];
    [v33 setNamePlacement:v36];

    [v33 setTypePlacement:v21];
    v37 = [v8 callForwardingPlacement];
    [v33 setCallForwardingPlacement:v37];

    BOOL v38 = [v8 rawPlacement];
    [v33 setRawPlacement:v38];

    [v33 setDualSignalStrengthPlacement:v45];
    [v33 setDualNamePlacement:v43];
    [v33 setDualNameAndTypePlacement:v44];
    v39 = [v8 placementsAffectedByAirplaneMode];
    v49 = v45;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    v41 = [v39 arrayByAddingObjectsFromArray:v40];
    [v33 setPlacementsAffectedByAirplaneMode:v41];
  }
  else
  {
    v47.receiver = a1;
    v47.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularCondensedItem;
    v33 = objc_msgSendSuper2(&v47, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3, a4, a5);
  }
  return v33;
}

@end