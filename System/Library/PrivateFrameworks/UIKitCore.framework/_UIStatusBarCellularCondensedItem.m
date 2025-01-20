@interface _UIStatusBarCellularCondensedItem
+ (_UIStatusBarIdentifier)animatedTypeDisplayIdentifier;
+ (_UIStatusBarIdentifier)dualNameDisplayIdentifier;
+ (_UIStatusBarIdentifier)dualSignalStrengthDisplayIdentifier;
+ (_UIStatusBarIdentifier)dualSingleLineNameAndTypeDisplayIdentifier;
+ (_UIStatusBarIdentifier)dualSingleLineNameDisplayIdentifier;
+ (_UIStatusBarIdentifier)sosSignalStrengthDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6;
- (BOOL)_animateServiceType:(int64_t)a3 prefixLength:(int64_t *)a4 currentType:(int64_t)a5;
- (BOOL)_showCallFowardingForEntry:(id)a3;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)reducesFontSize;
- (_NSRange)_nonCondensedFontRangeForEntry:(id)a3;
- (_UIStatusBarCellularCondensedItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (_UIStatusBarCellularNetworkTypeView)animatedNetworkTypeView;
- (_UIStatusBarDualCellularSignalView)dualSignalView;
- (_UIStatusBarEmergencySignalView)sosSignalView;
- (_UIStatusBarMultilineStringView)dualNameView;
- (_UIStatusBarStringView)dualSingleLineNameAndTypeView;
- (_UIStatusBarStringView)dualSingleLineNameView;
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

@implementation _UIStatusBarCellularCondensedItem

+ (_UIStatusBarIdentifier)dualSignalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualSignalStrengthDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)dualNameDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualNameDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)dualSingleLineNameDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualSingleLineNameDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)dualSingleLineNameAndTypeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dualSingleLineNameAndTypeDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)sosSignalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"sosSignalStrengthDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)animatedTypeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"animatedTypeDisplayIdentifier"];
}

- (_UIStatusBarCellularCondensedItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarCellularCondensedItem;
  v4 = [(_UIStatusBarCellularItem *)&v6 initWithIdentifier:a3 statusBar:a4];
  [(_UIStatusBarCellularCondensedItem *)v4 setReducesFontSize:1];
  return v4;
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"cellularEntry", @"secondaryCellularEntry", 0);
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 identifier];
  v9 = [(id)objc_opt_class() dualSignalStrengthDisplayIdentifier];

  if (v8 == v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStatusBarCellularCondensedItem;
    unsigned __int8 v12 = [(_UIStatusBarItem *)&v14 canEnableDisplayItem:v7 fromData:v6];
  }
  else
  {
    v10 = [v7 identifier];

    v11 = [(_UIStatusBarCellularCondensedItem *)self entryForDisplayItemWithIdentifier:v10];
    unsigned __int8 v12 = [v11 isEnabled];
  }
  return v12;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v199[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v187.receiver = self;
  v187.super_class = (Class)_UIStatusBarCellularCondensedItem;
  v175 = v8;
  id v173 = [(_UIStatusBarCellularItem *)&v187 applyUpdate:v8 toDisplayItem:v9];
  v10 = [v9 identifier];
  v174 = [(_UIStatusBarCellularCondensedItem *)self entryForDisplayItemWithIdentifier:v10];

  v11 = [v9 identifier];
  unsigned __int8 v12 = [(id)objc_opt_class() dualSignalStrengthDisplayIdentifier];
  LODWORD(v8) = v11 == v12;

  if (v8)
  {
    v33 = [(_UIStatusBarItem *)self statusBar];
    v34 = [v33 currentAggregatedData];

    v35 = [(_UIStatusBarCellularCondensedItem *)self dualSignalView];
    v36 = [v35 topSignalView];
    v37 = [v34 cellularEntry];
    BOOL v38 = [(_UIStatusBarCellularItem *)self _updateSignalView:v36 withUpdate:v175 entry:v37 forceShowingDisabledSignalBars:1];

    v39 = [(_UIStatusBarCellularCondensedItem *)self dualSignalView];
    v40 = [v39 bottomSignalView];
    v41 = [v34 secondaryCellularEntry];
    BOOL v42 = [(_UIStatusBarCellularItem *)self _updateSignalView:v40 withUpdate:v175 entry:v41 forceShowingDisabledSignalBars:1];

    if ([v175 dataChanged]) {
      [v9 setEnabled:v38 & v42];
    }
    goto LABEL_105;
  }
  v13 = [v9 identifier];
  objc_super v14 = [(id)objc_opt_class() dualNameDisplayIdentifier];
  v15 = v13;
  if (v13 == v14) {
    goto LABEL_19;
  }
  v16 = [v9 identifier];
  v17 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];
  v18 = v16;
  if (v16 == v17)
  {
LABEL_18:

    v15 = v14;
LABEL_19:

LABEL_20:
    v43 = [(_UIStatusBarItem *)self statusBar];
    v34 = [v43 currentAggregatedData];

    double v183 = 0.0;
    v184 = &v183;
    uint64_t v185 = 0x2020000000;
    char v186 = 0;
    v44 = [(_UIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_482];
    __int16 v182 = 0;
    if (v44)
    {
      v45 = 0;
      v46 = 0;
    }
    else
    {
      v178[0] = MEMORY[0x1E4F143A8];
      v178[1] = 3221225472;
      v179 = (__CFString *(*)(uint64_t, void *, __int16 *))__63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2;
      v180 = &unk_1E5305548;
      v181 = &v183;
      v47 = [v34 cellularEntry];
      __63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2((uint64_t)v178, v47, (unsigned char *)&v182 + 1);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v48 = [v34 secondaryCellularEntry];
      v179((uint64_t)v178, v48, &v182);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!*((unsigned char *)v184 + 24)
        && [(__CFString *)v46 length]
        && [(__CFString *)v45 length]
        && ([(__CFString *)v46 isEqualToString:v45] & 1) == 0)
      {
        *((unsigned char *)v184 + 24) = 1;
      }
    }
    int v49 = [v9 isEnabled];
    if (v49)
    {
      if (_UIInternalPreferencesRevisionOnce != -1) {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      }
      int v50 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1) {
        goto LABEL_27;
      }
      int v153 = _UIInternalPreference_UIStatusBarShowBothDualCarrierNames;
      if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UIStatusBarShowBothDualCarrierNames) {
        goto LABEL_27;
      }
      while (v50 >= v153)
      {
        _UIInternalPreferenceSync(v50, &_UIInternalPreference_UIStatusBarShowBothDualCarrierNames, @"UIStatusBarShowBothDualCarrierNames", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        BOOL v51 = 0;
        int v153 = _UIInternalPreference_UIStatusBarShowBothDualCarrierNames;
        if (v50 == _UIInternalPreference_UIStatusBarShowBothDualCarrierNames) {
          goto LABEL_28;
        }
      }
      if (!byte_1E8FD544C) {
LABEL_27:
      }
        BOOL v51 = 0;
      else {
        BOOL v51 = *((unsigned char *)v184 + 24) != 0;
      }
LABEL_28:
      v5 = [v9 identifier];
      v4 = [(id)objc_opt_class() nameDisplayIdentifier];
      uint64_t v52 = v51 ^ (v5 == v4);
    }
    else
    {
      uint64_t v52 = 0;
    }
    [v9 setEnabled:v52];
    if (v49)
    {
    }
    if (!*((unsigned char *)v184 + 24) || ![v9 isEnabled]) {
      goto LABEL_104;
    }
    v53 = [v9 identifier];
    v54 = [(id)objc_opt_class() nameDisplayIdentifier];
    BOOL v55 = v53 == v54;

    if (v55)
    {
      if (HIBYTE(v182) || !(_BYTE)v182)
      {
        if ([v174 type]) {
          goto LABEL_104;
        }
        v97 = [v34 secondaryCellularEntry];
        BOOL v98 = [v97 type] == 0;

        if (v98) {
          goto LABEL_104;
        }
      }
      v64 = [(_UIStatusBarCellularItem *)self serviceNameView];
      [(__CFString *)v64 setText:v45];
      v65 = [v34 secondaryCellularEntry];
      v66 = [v65 crossfadeString];
      [(__CFString *)v64 setAlternateText:v66];
    }
    else
    {
      v56 = [v9 identifier];
      v57 = [(id)objc_opt_class() dualNameDisplayIdentifier];
      BOOL v58 = v56 == v57;

      if (v58)
      {
        v64 = [(_UIStatusBarCellularCondensedItem *)self dualNameView];
        v83 = [(__CFString *)v64 stringViews];
        v84 = [v83 firstObject];
        [v84 setText:v46];

        v85 = [(__CFString *)v64 stringViews];
        v86 = [v85 firstObject];
        [v86 setMarqueeRunning:1];

        v87 = [(__CFString *)v64 stringViews];
        v88 = [v87 lastObject];
        [v88 setText:v45];

        v65 = [(__CFString *)v64 stringViews];
        v66 = [v65 lastObject];
        [v66 setMarqueeRunning:1];
      }
      else
      {
        v59 = [(_UIStatusBarItem *)self statusBar];
        uint64_t v167 = [v59 effectiveUserInterfaceLayoutDirection];

        v60 = &stru_1ED0E84C0;
        if (v46) {
          v60 = v46;
        }
        v61 = v60;
        uint64_t v170 = [(__CFString *)v61 length];
        if (v45 && [(__CFString *)v45 length])
        {
          if ([(__CFString *)v61 length])
          {
            if (v167) {
              v62 = v45;
            }
            else {
              v62 = v61;
            }
            if (v167) {
              v63 = v61;
            }
            else {
              v63 = v45;
            }
            v64 = [(__CFString *)v62 stringByAppendingFormat:@" • %@", v63];
          }
          else
          {
            v64 = v45;

            uint64_t v170 = [(__CFString *)v64 length];
          }
        }
        else
        {
          v64 = v61;
        }
        v67 = [v9 identifier];
        v68 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];
        BOOL v69 = v67 == v68;

        if (v69)
        {
          v99 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
          [v99 setText:v64];

          v65 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
          [v65 setMarqueeRunning:1];
LABEL_102:

          goto LABEL_103;
        }
        v70 = [v9 identifier];
        v71 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];
        BOOL v72 = v70 == v71;

        if (!v72)
        {
LABEL_103:

LABEL_104:
          _Block_object_dispose(&v183, 8);
LABEL_105:

          goto LABEL_106;
        }
        v73 = [v175 styleAttributes];
        v65 = (void *)[v73 copy];

        v74 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        uint64_t v160 = objc_msgSend(v65, "fontForStyle:", objc_msgSend(v74, "fontStyle"));

        uint64_t v75 = [v65 textColor];
        uint64_t v154 = *(void *)off_1E52D2048;
        uint64_t v76 = *(void *)off_1E52D2048;
        uint64_t v155 = *(void *)off_1E52D2040;
        v198[0] = *(void *)off_1E52D2040;
        v198[1] = v76;
        v199[0] = v160;
        v199[1] = v75;
        v159 = (void *)v75;
        v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:v198 count:2];
        v164 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v64 attributes:v162];
        v77 = -[_UIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", [v174 type]);
        if (v77
          || ([v34 secondaryCellularEntry],
              v78 = objc_claimAutoreleasedReturnValue(),
              -[_UIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", [v78 type]), uint64_t v79 = objc_claimAutoreleasedReturnValue(), v78, v170 = objc_msgSend(v164, "length"), (v77 = (void *)v79) != 0))
        {
          v158 = v77;
          if ([v77 length])
          {
            double v177 = 0.0;
            v157 = [(_UIStatusBarCellularCondensedItem *)self _fontForEntry:v174 styleAttributes:v65 baselineOffset:&v177];
            id v80 = objc_alloc(MEMORY[0x1E4F28B18]);
            v196[0] = v155;
            v196[1] = v154;
            v197[0] = v157;
            v197[1] = v159;
            v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v197 forKeys:v196 count:2];
            v156 = (void *)[v80 initWithString:v158 attributes:v81];

            if (v167) {
              uint64_t v170 = [v164 length] - v170;
            }
            v82 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v162];
            [v164 insertAttributedString:v82 atIndex:v170];

            [v164 insertAttributedString:v156 atIndex:v170 + (v167 == 0)];
          }
        }
        else
        {
          v158 = 0;
        }
        v125 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        [v125 setAttributedText:v164];

        v126 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        [v126 setMarqueeRunning:1];

        v66 = (void *)v160;
      }
    }

    goto LABEL_102;
  }
  v19 = [v9 identifier];
  v5 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];
  if (v19 == v5)
  {

    v18 = v17;
    goto LABEL_18;
  }
  v4 = [v9 identifier];
  v20 = [(id)objc_opt_class() nameDisplayIdentifier];
  BOOL v21 = v4 == v20;

  if (v21) {
    goto LABEL_20;
  }
  v22 = [v9 identifier];
  v23 = [(id)objc_opt_class() typeDisplayIdentifier];
  BOOL v24 = v22 == v23;

  if (v24)
  {
    if ([v9 isEnabled]
      && (([v175 styleAttributesChanged] & 1) != 0 || objc_msgSend(v175, "dataChanged")))
    {
      v89 = [v175 styleAttributes];
      v34 = (void *)[v89 copy];

      double v183 = 0.0;
      v90 = [(_UIStatusBarCellularCondensedItem *)self _fontForEntry:v174 styleAttributes:v34 baselineOffset:&v183];
      double v91 = v183;
      [v9 baselineOffset];
      if (v91 != v92)
      {
        [v9 setBaselineOffset:v183];
        v93 = [v9 region];
        v94 = [v93 layout];
        [v94 invalidate];
      }
      [v34 setFont:v90];
      uint64_t v95 = [(_UIStatusBarCellularCondensedItem *)self _nonCondensedFontRangeForEntry:v174];
      uint64_t v168 = v96;
      uint64_t v171 = v95;
      if (v95 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v176.receiver = self;
        v176.super_class = (Class)_UIStatusBarCellularCondensedItem;
        [(_UIStatusBarItem *)&v176 applyStyleAttributes:v34 toDisplayItem:v9];
      }
      else
      {
        id v111 = objc_alloc(MEMORY[0x1E4F28E48]);
        v112 = [(_UIStatusBarCellularItem *)self networkTypeView];
        v113 = [v112 text];
        uint64_t v114 = *(void *)off_1E52D2040;
        v195[0] = v90;
        uint64_t v115 = *(void *)off_1E52D2048;
        uint64_t v165 = v114;
        v194[0] = v114;
        v194[1] = v115;
        v116 = [v34 textColor];
        v195[1] = v116;
        v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v195 forKeys:v194 count:2];
        v118 = (void *)[v111 initWithString:v113 attributes:v117];

        v119 = [v90 fontDescriptor];
        v120 = [v119 fontDescriptorWithSymbolicTraits:0];
        [v90 pointSize];
        v121 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v120);

        v192[1] = v115;
        v193[0] = v121;
        v192[0] = v165;
        v122 = [v34 textColor];
        v193[1] = v122;
        v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:2];
        objc_msgSend(v118, "setAttributes:range:", v123, v171, v168);

        v124 = [(_UIStatusBarCellularItem *)self networkTypeView];
        [v124 setAttributedText:v118];
      }
      goto LABEL_105;
    }
    goto LABEL_106;
  }
  v25 = [v9 identifier];
  v26 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];
  BOOL v27 = v25 == v26;

  if (v27)
  {
    if (!v174) {
      goto LABEL_106;
    }
    if ([v174 isEnabled])
    {
      v34 = -[_UIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", [v174 type]);
      int v100 = [v9 isEnabled];
      if (v34) {
        int v101 = v100;
      }
      else {
        int v101 = 0;
      }
      if (v101 == 1)
      {
        uint64_t v102 = [v174 isBootstrapCellular] ^ 1;
LABEL_92:
        [v9 setEnabled:v102];
        if ([v9 isEnabled]
          && (([v175 styleAttributesChanged] & 1) != 0 || objc_msgSend(v175, "dataChanged")))
        {
          v107 = [(_UIStatusBarCellularItem *)self typeStringProvider];

          if (v107)
          {
            v108 = [(_UIStatusBarCellularItem *)self typeStringProvider];
            objc_msgSend(v108, "animatedTypeDisplayItemSpacingFactorForCellularType:", objc_msgSend(v174, "type"));
            double v110 = v109;
          }
          else
          {
            double v110 = 1.0;
          }
          v128 = [(_UIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
          v129 = [v175 styleAttributes];
          +[_UIStatusBarWifiSignalView widthForIconSize:](_UIStatusBarWifiSignalView, "widthForIconSize:", [v129 iconSize]);
          [v128 setFixedWidth:v110 * v130];

          double v183 = NAN;
          uint64_t v131 = [v174 type];
          v132 = [(_UIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
          BOOL v169 = -[_UIStatusBarCellularCondensedItem _animateServiceType:prefixLength:currentType:](self, "_animateServiceType:prefixLength:currentType:", v131, &v183, [v132 type]);

          v133 = [v175 styleAttributes];
          v134 = (void *)[v133 copy];

          double v177 = 0.0;
          v172 = [(_UIStatusBarCellularCondensedItem *)self _fontForEntry:v174 styleAttributes:v134 baselineOffset:&v177];
          double v135 = v177;
          [v9 baselineOffset];
          if (v135 != v136)
          {
            [v9 setBaselineOffset:v177];
            v137 = [v9 region];
            v138 = [v137 layout];
            [v138 invalidate];
          }
          [v134 setFont:v172];
          uint64_t v139 = [(_UIStatusBarCellularCondensedItem *)self _nonCondensedFontRangeForEntry:v174];
          uint64_t v166 = v140;
          uint64_t v141 = v139;
          if (v139 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v142 = [(_UIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
            objc_msgSend(v142, "setText:prefixLength:withStyleAttributes:forType:animated:", v34, *(void *)&v183, v134, objc_msgSend(v174, "type"), v169);
          }
          else
          {
            id v143 = objc_alloc(MEMORY[0x1E4F28E48]);
            uint64_t v144 = *(void *)off_1E52D2040;
            v191[0] = v172;
            uint64_t v145 = *(void *)off_1E52D2048;
            uint64_t v161 = v144;
            v190[0] = v144;
            v190[1] = v145;
            v146 = [v134 textColor];
            v191[1] = v146;
            v147 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v191 forKeys:v190 count:2];
            v142 = (void *)[v143 initWithString:v34 attributes:v147];

            v148 = [v172 fontDescriptor];
            v149 = [v148 fontDescriptorWithSymbolicTraits:0];
            [v172 pointSize];
            v163 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v149);

            v188[1] = v145;
            v189[0] = v163;
            v188[0] = v161;
            v150 = [v134 textColor];
            v189[1] = v150;
            v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v189 forKeys:v188 count:2];
            objc_msgSend(v142, "setAttributes:range:", v151, v141, v166);

            v152 = [(_UIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
            objc_msgSend(v152, "setAttributedText:prefixLength:forType:animated:", v142, *(void *)&v183, objc_msgSend(v174, "type"), v169);
          }
        }
        goto LABEL_105;
      }
    }
    else
    {
      [v9 isEnabled];
      v34 = 0;
    }
    uint64_t v102 = 0;
    goto LABEL_92;
  }
  v28 = [v9 identifier];
  v29 = [(id)objc_opt_class() sosSignalStrengthDisplayIdentifier];
  BOOL v30 = v28 == v29;

  if (v174) {
    BOOL v31 = v30;
  }
  else {
    BOOL v31 = 0;
  }
  if (v31)
  {
    BOOL v32 = [v9 isEnabled]
       && [v174 showsSOSWhenDisabled]
       && (unint64_t)([v174 status] == 1);
    [v9 setEnabled:v32];
    if ([v9 isEnabled])
    {
      v103 = [(_UIStatusBarCellularCondensedItem *)self sosSignalView];
      v104 = [v103 signalView];
      [(_UIStatusBarCellularItem *)self _updateSignalView:v104 withUpdate:v175 entry:v174 forceShowingDisabledSignalBars:1];

      if ([v174 sosAvailable]) {
        double v105 = 1.0;
      }
      else {
        double v105 = 0.3;
      }
      v34 = [(_UIStatusBarCellularCondensedItem *)self sosSignalView];
      v106 = [v34 sosView];
      [v106 setAlpha:v105];

      goto LABEL_105;
    }
  }
LABEL_106:

  return v173;
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
  v10 = (void *)v9;
  v11 = [v7 identifier];
  uint64_t v12 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];
  if (v11 == (void *)v12)
  {

    goto LABEL_7;
  }
  v13 = (void *)v12;
  objc_super v14 = [v7 identifier];
  v15 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];

  if (v14 != v15)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UIStatusBarCellularCondensedItem;
    [(_UIStatusBarItem *)&v16 applyStyleAttributes:v6 toDisplayItem:v7];
  }
LABEL_8:
}

- (id)_stringForCellularType:(int64_t)a3
{
  v5 = [(_UIStatusBarCellularItem *)self typeStringProvider];

  if (!v5
    || ([(_UIStatusBarCellularItem *)self typeStringProvider],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 stringForCellularType:a3 condensed:1],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (a3 == 7)
    {
      id v8 = @"5GE[condensed]";
      uint64_t v9 = @"5G  ᴇ";
    }
    else
    {
      if (a3 == 3)
      {
        id v8 = @"E";
      }
      else
      {
        if (a3 != 2)
        {
LABEL_11:
          v11.receiver = self;
          v11.super_class = (Class)_UIStatusBarCellularCondensedItem;
          id v7 = [(_UIStatusBarCellularItem *)&v11 _stringForCellularType:a3];
          goto LABEL_12;
        }
        id v8 = @"G";
      }
      uint64_t v9 = v8;
    }
    id v7 = _UINSLocalizedStringWithDefaultValue(v8, v9);
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
  v10 = [(_UIStatusBarCellularItem *)self typeStringProvider];

  objc_super v11 = v9;
  if (v10)
  {
    uint64_t v12 = [(_UIStatusBarCellularItem *)self typeStringProvider];
    objc_super v11 = objc_msgSend(v12, "condensedFontForCellularType:defaultFont:baselineOffset:", objc_msgSend(v8, "type"), v9, a5);
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

- (id)_singleCellularEntryMatching:(id)a3
{
  NSUInteger v4 = (uint64_t (**)(id, void *))a3;
  NSUInteger v5 = [(_UIStatusBarItem *)self statusBar];
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
  objc_super v11 = [v6 cellularEntry];
  if (v4[2](v4, v11))
  {
  }
  else
  {
    uint64_t v12 = [v6 secondaryCellularEntry];
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

- (BOOL)_showCallFowardingForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIStatusBarItem *)self statusBar];
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
  char v9 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];

  if (v8 == v9)
  {
    uint64_t v12 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
LABEL_6:
    int v13 = v12;
    if (v12)
    {
      [v12 setMarqueeRunning:0];
      objc_super v14 = v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke;
      v23[3] = &unk_1E52DC698;
      v23[4] = v13;
LABEL_10:
      id v21 = v13;
      [v6 addCompletionHandler:v14];

      goto LABEL_11;
    }
    goto LABEL_8;
  }
  uint64_t v10 = [v7 identifier];
  objc_super v11 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];

  if (v10 == v11)
  {
    uint64_t v12 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
    goto LABEL_6;
  }
LABEL_8:
  v15 = [v7 identifier];
  objc_super v16 = [(id)objc_opt_class() dualNameDisplayIdentifier];

  if (v15 == v16)
  {
    int v13 = [(_UIStatusBarCellularCondensedItem *)self dualNameView];
    v17 = [v13 stringViews];
    v18 = [v17 firstObject];
    [v18 setMarqueeRunning:0];

    v19 = [v13 stringViews];
    v20 = [v19 lastObject];
    [v20 setMarqueeRunning:0];

    objc_super v14 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2;
    v22[3] = &unk_1E52DC698;
    v22[4] = v13;
    goto LABEL_10;
  }
LABEL_11:
}

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_236_0];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    char v8 = v7;
    goto LABEL_4;
  }
  uint64_t v10 = [(id)objc_opt_class() typeDisplayIdentifier];
  objc_super v11 = v4;
  if ((id)v10 == v4) {
    goto LABEL_12;
  }
  uint64_t v12 = (void *)v10;
  uint64_t v13 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];
  if ((id)v13 == v4)
  {

    objc_super v11 = v12;
LABEL_12:

    goto LABEL_13;
  }
  objc_super v14 = (void *)v13;
  id v15 = [(id)objc_opt_class() nameDisplayIdentifier];

  if (v15 == v4)
  {
LABEL_13:
    char v8 = [(_UIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_238_1];
    if (v8) {
      goto LABEL_4;
    }
  }
  id v16 = [(id)objc_opt_class() nameDisplayIdentifier];

  if (v16 != v4
    || ([(_UIStatusBarCellularCondensedItem *)self _singleCellularEntryMatching:&__block_literal_global_240], (char v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)_UIStatusBarCellularCondensedItem;
    id v7 = [(_UIStatusBarCellularItem *)&v17 entryForDisplayItemWithIdentifier:v4];
    goto LABEL_3;
  }
LABEL_4:

  return v8;
}

- (_UIStatusBarDualCellularSignalView)dualSignalView
{
  dualSignalView = self->_dualSignalView;
  if (!dualSignalView)
  {
    [(_UIStatusBarCellularCondensedItem *)self _create_dualSignalView];
    dualSignalView = self->_dualSignalView;
  }
  return dualSignalView;
}

- (void)_create_dualSignalView
{
  uint64_t v3 = [_UIStatusBarDualCellularSignalView alloc];
  id v4 = -[_UIStatusBarDualCellularSignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualSignalView = self->_dualSignalView;
  self->_dualSignalView = v4;

  id v6 = [(_UIStatusBarDualCellularSignalView *)self->_dualSignalView topSignalView];
  [v6 setNumberOfBars:4];

  id v7 = [(_UIStatusBarDualCellularSignalView *)self->_dualSignalView bottomSignalView];
  [v7 setNumberOfBars:4];
}

- (_UIStatusBarMultilineStringView)dualNameView
{
  dualNameView = self->_dualNameView;
  if (!dualNameView)
  {
    [(_UIStatusBarCellularCondensedItem *)self _create_dualNameView];
    dualNameView = self->_dualNameView;
  }
  return dualNameView;
}

- (void)_create_dualNameView
{
  uint64_t v3 = [_UIStatusBarMultilineStringView alloc];
  id v4 = -[_UIStatusBarMultilineStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualNameView = self->_dualNameView;
  self->_dualNameView = v4;

  [(_UIStatusBarMultilineStringView *)self->_dualNameView setNumberOfLines:2];
  id v6 = [(_UIStatusBarMultilineStringView *)self->_dualNameView stringViews];
  id v9 = [v6 firstObject];

  [v9 setTextAlignment:1];
  [v9 setFontStyle:2];
  [v9 setMarqueeEnabled:1];
  id v7 = [(_UIStatusBarMultilineStringView *)self->_dualNameView stringViews];
  char v8 = [v7 lastObject];

  [v8 setTextAlignment:1];
  [v8 setFontStyle:2];
  [v8 setMarqueeEnabled:1];
}

- (_UIStatusBarStringView)dualSingleLineNameView
{
  dualSingleLineNameView = self->_dualSingleLineNameView;
  if (!dualSingleLineNameView)
  {
    [(_UIStatusBarCellularCondensedItem *)self _create_dualSingleLineNameView];
    dualSingleLineNameView = self->_dualSingleLineNameView;
  }
  return dualSingleLineNameView;
}

- (void)_create_dualSingleLineNameView
{
  uint64_t v3 = [_UIStatusBarStringView alloc];
  id v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualSingleLineNameView = self->_dualSingleLineNameView;
  self->_dualSingleLineNameView = v4;

  [(UILabel *)self->_dualSingleLineNameView setNumberOfLines:1];
  [(_UIStatusBarStringView *)self->_dualSingleLineNameView setFontStyle:0];
  [(UILabel *)self->_dualSingleLineNameView setMarqueeEnabled:1];
  id v6 = self->_dualSingleLineNameView;
  LODWORD(v7) = 1132068864;
  [(UIView *)v6 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (_UIStatusBarStringView)dualSingleLineNameAndTypeView
{
  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  if (!dualSingleLineNameAndTypeView)
  {
    [(_UIStatusBarCellularCondensedItem *)self _create_dualSingleLineNameAndTypeView];
    dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  }
  return dualSingleLineNameAndTypeView;
}

- (void)_create_dualSingleLineNameAndTypeView
{
  uint64_t v3 = [_UIStatusBarStringView alloc];
  id v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  self->_dualSingleLineNameAndTypeView = v4;

  [(UILabel *)self->_dualSingleLineNameAndTypeView setNumberOfLines:1];
  [(_UIStatusBarStringView *)self->_dualSingleLineNameAndTypeView setFontStyle:0];
  [(UILabel *)self->_dualSingleLineNameAndTypeView setMarqueeEnabled:1];
  id v6 = self->_dualSingleLineNameAndTypeView;
  LODWORD(v7) = 1132068864;
  [(UIView *)v6 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (_UIStatusBarEmergencySignalView)sosSignalView
{
  sosSignalView = self->_sosSignalView;
  if (!sosSignalView)
  {
    [(_UIStatusBarCellularCondensedItem *)self _create_sosSignalView];
    sosSignalView = self->_sosSignalView;
  }
  return sosSignalView;
}

- (void)_create_sosSignalView
{
  uint64_t v3 = [_UIStatusBarEmergencySignalView alloc];
  id v4 = -[_UIStatusBarEmergencySignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sosSignalView = self->_sosSignalView;
  self->_sosSignalView = v4;

  id v6 = [(_UIStatusBarEmergencySignalView *)self->_sosSignalView signalView];
  [v6 setNumberOfBars:4];
}

- (_UIStatusBarCellularNetworkTypeView)animatedNetworkTypeView
{
  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  if (!animatedNetworkTypeView)
  {
    [(_UIStatusBarCellularCondensedItem *)self _create_animatedNetworkTypeView];
    animatedNetworkTypeView = self->_animatedNetworkTypeView;
  }
  return animatedNetworkTypeView;
}

- (void)_create_animatedNetworkTypeView
{
  uint64_t v3 = [_UIStatusBarCellularNetworkTypeView alloc];
  id v4 = -[_UIStatusBarCellularNetworkTypeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  self->_animatedNetworkTypeView = v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() dualSignalStrengthDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v11 = [(_UIStatusBarCellularCondensedItem *)self dualSignalView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() dualNameDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v11 = [(_UIStatusBarCellularCondensedItem *)self dualNameView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() dualSingleLineNameDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v11 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() dualSingleLineNameAndTypeDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v11 = [(_UIStatusBarCellularCondensedItem *)self dualSingleLineNameAndTypeView];
        }
        else
        {
          id v9 = [(id)objc_opt_class() animatedTypeDisplayIdentifier];

          if (v9 == v4)
          {
            uint64_t v11 = [(_UIStatusBarCellularCondensedItem *)self animatedNetworkTypeView];
          }
          else
          {
            id v10 = [(id)objc_opt_class() sosSignalStrengthDisplayIdentifier];

            if (v10 == v4)
            {
              uint64_t v11 = [(_UIStatusBarCellularCondensedItem *)self sosSignalView];
            }
            else
            {
              v14.receiver = self;
              v14.super_class = (Class)_UIStatusBarCellularCondensedItem;
              uint64_t v11 = [(_UIStatusBarCellularItem *)&v14 viewForIdentifier:v4];
            }
          }
        }
      }
    }
  }
  uint64_t v12 = (void *)v11;

  return v12;
}

- (BOOL)reducesFontSize
{
  return self->_reducesFontSize;
}

- (void)setReducesFontSize:(BOOL)a3
{
  self->_reducesFontSize = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedNetworkTypeView, 0);
  objc_storeStrong((id *)&self->_sosSignalView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameAndTypeView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameView, 0);
  objc_storeStrong((id *)&self->_dualNameView, 0);
  objc_storeStrong((id *)&self->_dualSignalView, 0);
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  v54[1] = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    int64_t v7 = a3 - a4;
    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularCondensedItem;
    id v8 = objc_msgSendSuper2(&v48, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3 - a4, 0, a5, 1);
    id v9 = [a1 dualSignalStrengthDisplayIdentifier];
    id v10 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v9 priority:v7 + 7];
    uint64_t v11 = [v8 signalStrengthPlacement];
    v54[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    uint64_t v13 = [v10 excludingPlacements:v12];

    objc_super v14 = [a1 dualSingleLineNameDisplayIdentifier];
    id v15 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v14 priority:v7 + 3];
    id v16 = [v8 namePlacement];
    v53 = v16;
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    uint64_t v18 = [v15 excludingPlacements:v17];

    v19 = [v8 typePlacement];
    v45 = (void *)v13;
    uint64_t v52 = v13;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    id v21 = [v19 requiringAnyPlacements:v20];

    v22 = [a1 dualSingleLineNameAndTypeDisplayIdentifier];
    v23 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:v7 + 5];
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
    v33 = +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:a4 placements:v32];

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
    int v49 = v45;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    v41 = [v39 arrayByAddingObjectsFromArray:v40];
    [v33 setPlacementsAffectedByAirplaneMode:v41];
  }
  else
  {
    v47.receiver = a1;
    v47.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularCondensedItem;
    v33 = objc_msgSendSuper2(&v47, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3, a4, a5);
  }
  return v33;
}

@end