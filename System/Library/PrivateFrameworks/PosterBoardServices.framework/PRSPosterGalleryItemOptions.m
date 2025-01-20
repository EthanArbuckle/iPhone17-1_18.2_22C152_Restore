@interface PRSPosterGalleryItemOptions
+ (BOOL)supportsSecureCoding;
+ (id)itemOptionsWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)allowsSystemSuggestedComplications;
- (BOOL)allowsSystemSuggestedComplicationsInLandscape;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHero;
- (BOOL)isOnlyEligibleForMadeForFocusSection;
- (BOOL)shouldShowAsShuffleStack;
- (NSArray)modularComplications;
- (NSArray)modularLandscapeComplications;
- (NSString)descriptiveTextLocalizationKey;
- (NSString)displayNameLocalizationKey;
- (NSString)spokenNameLocalizationKey;
- (PRSPosterGalleryItemOptions)init;
- (PRSPosterGalleryItemOptions)initWithCoder:(id)a3;
- (PRSPosterGalleryItemOptions)initWithModularComplications:(id)a3 modularLandscapeComplications:(id)a4 inlineComplication:(id)a5 allowsSystemSuggestedComplications:(BOOL)a6 allowsSystemSuggestedComplicationsInLandscape:(BOOL)a7 featuredConfidenceLevel:(int64_t)a8 displayNameLocalizationKey:(id)a9 spokenNameLocalizationKey:(id)a10 descriptiveTextLocalizationKey:(id)a11 hero:(BOOL)a12 shouldShowAsShuffleStack:(BOOL)a13 photoSubtype:(int64_t)a14 focus:(int64_t)a15 onlyEligibleForMadeForFocusSection:(BOOL)a16;
- (PRSPosterGalleryItemOptions)initWithProactiveRepresentation:(id)a3;
- (PRSPosterGallerySuggestedComplication)inlineComplication;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)proactiveRepresentation;
- (int64_t)featuredConfidenceLevel;
- (int64_t)focus;
- (int64_t)photoSubtype;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterGalleryItemOptions

- (PRSPosterGalleryItemOptions)init
{
  LOBYTE(v4) = 0;
  LOWORD(v3) = 0;
  return -[PRSPosterGalleryItemOptions initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:](self, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", 0, 0, 0, 0, 0, 1, 0, 0, 0, v3, 0, 0, v4);
}

- (PRSPosterGalleryItemOptions)initWithModularComplications:(id)a3 modularLandscapeComplications:(id)a4 inlineComplication:(id)a5 allowsSystemSuggestedComplications:(BOOL)a6 allowsSystemSuggestedComplicationsInLandscape:(BOOL)a7 featuredConfidenceLevel:(int64_t)a8 displayNameLocalizationKey:(id)a9 spokenNameLocalizationKey:(id)a10 descriptiveTextLocalizationKey:(id)a11 hero:(BOOL)a12 shouldShowAsShuffleStack:(BOOL)a13 photoSubtype:(int64_t)a14 focus:(int64_t)a15 onlyEligibleForMadeForFocusSection:(BOOL)a16
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  v42.receiver = self;
  v42.super_class = (Class)PRSPosterGalleryItemOptions;
  v27 = [(PRSPosterGalleryItemOptions *)&v42 init];
  if (v27)
  {
    uint64_t v28 = [v21 copy];
    modularComplications = v27->_modularComplications;
    v27->_modularComplications = (NSArray *)v28;

    uint64_t v30 = [v22 copy];
    modularLandscapeComplications = v27->_modularLandscapeComplications;
    v27->_modularLandscapeComplications = (NSArray *)v30;

    uint64_t v32 = [v23 copy];
    inlineComplication = v27->_inlineComplication;
    v27->_inlineComplication = (PRSPosterGallerySuggestedComplication *)v32;

    v27->_allowsSystemSuggestedComplications = a6;
    v27->_allowsSystemSuggestedComplicationsInLandscape = a7;
    v27->_featuredConfidenceLevel = a8;
    uint64_t v34 = [v24 copy];
    displayNameLocalizationKey = v27->_displayNameLocalizationKey;
    v27->_displayNameLocalizationKey = (NSString *)v34;

    uint64_t v36 = [v25 copy];
    spokenNameLocalizationKey = v27->_spokenNameLocalizationKey;
    v27->_spokenNameLocalizationKey = (NSString *)v36;

    uint64_t v38 = [v26 copy];
    descriptiveTextLocalizationKey = v27->_descriptiveTextLocalizationKey;
    v27->_descriptiveTextLocalizationKey = (NSString *)v38;

    v27->_hero = a12;
    v27->_shouldShowAsShuffleStack = a13;
    v27->_photoSubtype = a14;
    v27->_focus = a15;
    v27->_onlyEligibleForMadeForFocusSection = a16;
  }

  return v27;
}

- (PRSPosterGalleryItemOptions)initWithProactiveRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 modularComplications];
  id v25 = objc_msgSend(v4, "bs_map:", &__block_literal_global_1);

  v5 = [v3 modularLandscapeComplications];
  id v23 = objc_msgSend(v5, "bs_map:", &__block_literal_global_15);

  id v24 = [v3 inlineComplication];
  v6 = [v24 posterBoardRepresentation];
  unsigned int v22 = [v3 allowsSystemSuggestedComplications];
  unsigned int v21 = [v3 allowsSystemSuggestedComplicationsInLandscape];
  uint64_t v7 = [v3 featuredConfidenceLevel];
  v8 = [v3 displayNameLocalizationKey];
  v9 = [v3 spokenNameLocalizationKey];
  v10 = [v3 descriptiveTextLocalizationKey];
  char v11 = [v3 isHero];
  char v12 = [v3 shouldShowAsShuffleStack];
  uint64_t v13 = [v3 photoSubtype];
  if ((unint64_t)(v13 - 1) >= 8) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13;
  }
  uint64_t v15 = [v3 focus];
  if ((unint64_t)(v15 - 1) >= 9) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v7 != 2) {
    uint64_t v7 = v7 == 1;
  }
  LOBYTE(v20) = [v3 isOnlyEligibleForMadeForFocusSection];
  BYTE1(v19) = v12;
  LOBYTE(v19) = v11;
  v17 = -[PRSPosterGalleryItemOptions initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:](self, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", v25, v23, v6, v22, v21, v7, v8, v9, v10, v19, v14, v16, v20);

  return v17;
}

uint64_t __63__PRSPosterGalleryItemOptions_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 posterBoardRepresentation];
}

uint64_t __63__PRSPosterGalleryItemOptions_initWithProactiveRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 posterBoardRepresentation];
}

- (id)proactiveRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4B270]) initWithPosterBoardRepresentation:self];
  return v2;
}

+ (id)itemOptionsWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = NSStringFromSelector(sel_modularComplications);
  uint64_t v7 = [v5 objectForKey:v6];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  unint64_t v12 = 0x1E4F1C000uLL;
  v125 = v11;
  v126 = v5;
  if (v11)
  {
    id v127 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v132 objects:v137 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v133;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v133 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v132 + 1) + 8 * i);
          uint64_t v19 = objc_opt_class();
          id v20 = v18;
          if (v19)
          {
            if (objc_opt_isKindOfClass()) {
              unsigned int v21 = v20;
            }
            else {
              unsigned int v21 = 0;
            }
          }
          else
          {
            unsigned int v21 = 0;
          }
          id v22 = v21;

          if (v22)
          {
            uint64_t v23 = +[PRSPosterGallerySuggestedComplication suggestedComplicationWithDictionaryRepresentation:v22 error:a4];
            id v24 = (id)v23;
            if (a4 && *a4)
            {
              v31 = 0;
              uint64_t v32 = v126;
              id v33 = v13;
              goto LABEL_143;
            }
            if (v23) {
              [v127 addObject:v23];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v132 objects:v137 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v25 = [v127 copy];
    id v127 = (id)v25;
    id v5 = v126;
    unint64_t v12 = 0x1E4F1C000;
  }
  else
  {
    id v127 = 0;
  }
  id v26 = NSStringFromSelector(sel_modularLandscapeComplications);
  v27 = [v5 objectForKey:v26];
  uint64_t v28 = objc_opt_class();
  id v29 = v27;
  if (v28)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
  id v33 = v30;

  id v124 = v33;
  if (v33)
  {
    id v22 = objc_alloc_init(*(Class *)(v12 + 2632));
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v24 = v33;
    uint64_t v34 = [v24 countByEnumeratingWithState:&v128 objects:v136 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v129;
      while (2)
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v129 != v36) {
            objc_enumerationMutation(v24);
          }
          uint64_t v38 = *(void **)(*((void *)&v128 + 1) + 8 * j);
          uint64_t v39 = objc_opt_class();
          id v40 = v38;
          if (v39)
          {
            if (objc_opt_isKindOfClass()) {
              v41 = v40;
            }
            else {
              v41 = 0;
            }
          }
          else
          {
            v41 = 0;
          }
          id v42 = v41;

          if (v42)
          {
            uint64_t v43 = +[PRSPosterGallerySuggestedComplication suggestedComplicationWithDictionaryRepresentation:v42 error:a4];
            id v44 = (id)v43;
            if (a4 && *a4)
            {
              v31 = 0;
              uint64_t v32 = v126;
              id v33 = v124;
              goto LABEL_141;
            }
            if (v43) {
              [v22 addObject:v43];
            }
          }
        }
        uint64_t v35 = [v24 countByEnumeratingWithState:&v128 objects:v136 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }

    uint64_t v45 = [v22 copy];
    id v22 = (id)v45;
    id v33 = v124;
  }
  else
  {
    id v22 = 0;
  }
  v46 = NSStringFromSelector(sel_inlineComplication);
  uint64_t v32 = v126;
  v47 = [v126 objectForKey:v46];
  uint64_t v48 = objc_opt_class();
  id v49 = v47;
  if (v48)
  {
    if (objc_opt_isKindOfClass()) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
  }
  else
  {
    v50 = 0;
  }
  id v42 = v50;

  if (!v42)
  {
    id v24 = 0;
LABEL_65:
    v51 = NSStringFromSelector(sel_allowsSystemSuggestedComplications);
    v52 = [v126 objectForKey:v51];
    uint64_t v53 = objc_opt_class();
    id v54 = v52;
    if (v53)
    {
      if (objc_opt_isKindOfClass()) {
        v55 = v54;
      }
      else {
        v55 = 0;
      }
    }
    else
    {
      v55 = 0;
    }
    id v44 = v55;

    if (v44) {
      unsigned int v116 = [v44 BOOLValue];
    }
    else {
      unsigned int v116 = 0;
    }
    v56 = NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
    v57 = [v126 objectForKey:v56];
    uint64_t v58 = objc_opt_class();
    id v59 = v57;
    if (v58)
    {
      if (objc_opt_isKindOfClass()) {
        v60 = v59;
      }
      else {
        v60 = 0;
      }
    }
    else
    {
      v60 = 0;
    }
    id v61 = v60;

    v122 = v61;
    if (v61) {
      unsigned int v115 = [v61 BOOLValue];
    }
    else {
      unsigned int v115 = 0;
    }
    v62 = NSStringFromSelector(sel_featuredConfidenceLevel);
    v63 = [v126 objectForKey:v62];
    uint64_t v64 = objc_opt_class();
    id v65 = v63;
    if (v64)
    {
      if (objc_opt_isKindOfClass()) {
        v66 = v65;
      }
      else {
        v66 = 0;
      }
    }
    else
    {
      v66 = 0;
    }
    id v67 = v66;

    v121 = v67;
    if (v67) {
      uint64_t v114 = [v67 integerValue];
    }
    else {
      uint64_t v114 = 0;
    }
    v68 = NSStringFromSelector(sel_displayNameLocalizationKey);
    v69 = [v126 objectForKey:v68];
    uint64_t v70 = objc_opt_class();
    id v71 = v69;
    if (v70)
    {
      if (objc_opt_isKindOfClass()) {
        v72 = v71;
      }
      else {
        v72 = 0;
      }
    }
    else
    {
      v72 = 0;
    }
    id v120 = v72;

    v73 = [v126 objectForKey:@"hero"];
    uint64_t v74 = objc_opt_class();
    id v75 = v73;
    if (v74)
    {
      if (objc_opt_isKindOfClass()) {
        v76 = v75;
      }
      else {
        v76 = 0;
      }
    }
    else
    {
      v76 = 0;
    }
    id v77 = v76;

    if (v77)
    {
      id v78 = v77;
    }
    else
    {
      v79 = [v126 objectForKey:@"blankTemplate"];
      uint64_t v80 = objc_opt_class();
      id v81 = v79;
      if (v80)
      {
        if (objc_opt_isKindOfClass()) {
          v82 = v81;
        }
        else {
          v82 = 0;
        }
      }
      else
      {
        v82 = 0;
      }
      id v83 = v82;

      id v78 = v83;
      if (!v78)
      {
        char v119 = 0;
LABEL_108:
        v84 = NSStringFromSelector(sel_shouldShowAsShuffleStack);
        v85 = [v126 objectForKey:v84];
        uint64_t v86 = objc_opt_class();
        id v87 = v85;
        if (v86)
        {
          if (objc_opt_isKindOfClass()) {
            v88 = v87;
          }
          else {
            v88 = 0;
          }
        }
        else
        {
          v88 = 0;
        }
        id v89 = v88;

        v118 = v89;
        if (v89) {
          char v113 = [v89 BOOLValue];
        }
        else {
          char v113 = 0;
        }
        v90 = NSStringFromSelector(sel_photoSubtype);
        v91 = [v126 objectForKey:v90];
        uint64_t v92 = objc_opt_class();
        id v93 = v91;
        if (v92)
        {
          if (objc_opt_isKindOfClass()) {
            v94 = v93;
          }
          else {
            v94 = 0;
          }
        }
        else
        {
          v94 = 0;
        }
        id v95 = v94;

        if (v95) {
          uint64_t v112 = [v95 integerValue];
        }
        else {
          uint64_t v112 = 0;
        }
        v96 = NSStringFromSelector(sel_focus);
        v97 = [v126 objectForKey:v96];
        uint64_t v98 = objc_opt_class();
        id v99 = v97;
        if (v98)
        {
          if (objc_opt_isKindOfClass()) {
            v100 = v99;
          }
          else {
            v100 = 0;
          }
        }
        else
        {
          v100 = 0;
        }
        id v101 = v100;

        v117 = v95;
        if (v101) {
          uint64_t v102 = [v101 integerValue];
        }
        else {
          uint64_t v102 = 0;
        }
        v103 = [v126 objectForKey:@"onlyEligibleForMadeForFocusSection"];
        uint64_t v104 = objc_opt_class();
        id v105 = v103;
        if (v104)
        {
          if (objc_opt_isKindOfClass()) {
            v106 = v105;
          }
          else {
            v106 = 0;
          }
        }
        else
        {
          v106 = 0;
        }
        id v33 = v124;
        id v107 = v106;

        if (v107) {
          char v108 = [v107 BOOLValue];
        }
        else {
          char v108 = 0;
        }
        LOBYTE(v111) = v108;
        BYTE1(v110) = v113;
        LOBYTE(v110) = v119;
        v31 = objc_msgSend(objc_alloc((Class)a1), "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", v127, v22, v24, v116, v115, v114, v120, 0, 0, v110, v112, v102, v111);

LABEL_141:
        goto LABEL_142;
      }
    }
    char v119 = [v78 BOOLValue];

    goto LABEL_108;
  }
  id v24 = +[PRSPosterGallerySuggestedComplication suggestedComplicationWithDictionaryRepresentation:v42 error:a4];
  if (!a4 || !*a4) {
    goto LABEL_65;
  }
  v31 = 0;
LABEL_142:

LABEL_143:
  return v31;
}

- (id)dictionaryRepresentation
{
  v35[12] = *MEMORY[0x1E4F143B8];
  id v33 = NSStringFromSelector(sel_modularComplications);
  v34[0] = v33;
  uint64_t v3 = [(NSArray *)self->_modularComplications bs_map:&__block_literal_global_44];
  uint64_t v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v21 = (void *)v3;
  v35[0] = v3;
  v31 = NSStringFromSelector(sel_modularLandscapeComplications);
  v34[1] = v31;
  uint64_t v5 = [(NSArray *)self->_modularLandscapeComplications bs_map:&__block_literal_global_47];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v30 = v6;
  uint64_t v32 = v4;
  id v20 = (void *)v5;
  v35[1] = v5;
  id v29 = NSStringFromSelector(sel_inlineComplication);
  v34[2] = v29;
  uint64_t inlineComplication = (uint64_t)self->_inlineComplication;
  uint64_t v28 = inlineComplication;
  if (!inlineComplication)
  {
    uint64_t inlineComplication = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = (void *)inlineComplication;
  v35[2] = inlineComplication;
  v27 = NSStringFromSelector(sel_allowsSystemSuggestedComplications);
  v34[3] = v27;
  id v26 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_allowsSystemSuggestedComplications];
  v35[3] = v26;
  uint64_t v25 = NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
  v34[4] = v25;
  id v24 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_allowsSystemSuggestedComplicationsInLandscape];
  v35[4] = v24;
  uint64_t v23 = NSStringFromSelector(sel_featuredConfidenceLevel);
  v34[5] = v23;
  id v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_featuredConfidenceLevel];
  v35[5] = v22;
  uint64_t v8 = NSStringFromSelector(sel_displayNameLocalizationKey);
  v35[6] = self->_displayNameLocalizationKey;
  v34[6] = v8;
  v34[7] = @"hero";
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hero];
  v35[7] = v9;
  v10 = NSStringFromSelector(sel_shouldShowAsShuffleStack);
  v34[8] = v10;
  id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldShowAsShuffleStack];
  v35[8] = v11;
  unint64_t v12 = NSStringFromSelector(sel_photoSubtype);
  v34[9] = v12;
  id v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_photoSubtype];
  v35[9] = v13;
  uint64_t v14 = NSStringFromSelector(sel_focus);
  v34[10] = v14;
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_focus];
  v35[10] = v15;
  v34[11] = @"onlyEligibleForMadeForFocusSection";
  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_onlyEligibleForMadeForFocusSection];
  v35[11] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:12];

  if (!v28) {
  if (!v30)
  }

  if (!v32) {
  return v17;
  }
}

uint64_t __55__PRSPosterGalleryItemOptions_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __55__PRSPosterGalleryItemOptions_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v7) = self->_onlyEligibleForMadeForFocusSection;
  LOWORD(v6) = *(_WORD *)&self->_hero;
  return (id)objc_msgSend(v4, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", self->_modularComplications, self->_modularLandscapeComplications, self->_inlineComplication, self->_allowsSystemSuggestedComplications, self->_allowsSystemSuggestedComplicationsInLandscape, self->_featuredConfidenceLevel, self->_displayNameLocalizationKey, self->_spokenNameLocalizationKey, self->_descriptiveTextLocalizationKey, v6, self->_photoSubtype, self->_focus, v7);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PRSPosterGalleryItemOptions *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v9 = v7;

    if (v9)
    {
      v10 = [MEMORY[0x1E4F4F738] builder];
      modularComplications = self->_modularComplications;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke;
      v82[3] = &unk_1E5D00878;
      unint64_t v12 = v9;
      id v83 = v12;
      id v13 = (id)[v10 appendObject:modularComplications counterpart:v82];
      modularLandscapeComplications = self->_modularLandscapeComplications;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_2;
      v80[3] = &unk_1E5D00878;
      uint64_t v15 = v12;
      id v81 = v15;
      id v16 = (id)[v10 appendObject:modularLandscapeComplications counterpart:v80];
      uint64_t inlineComplication = self->_inlineComplication;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_3;
      v78[3] = &unk_1E5D00878;
      v18 = v15;
      v79 = v18;
      id v19 = (id)[v10 appendObject:inlineComplication counterpart:v78];
      BOOL allowsSystemSuggestedComplications = self->_allowsSystemSuggestedComplications;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_4;
      v76[3] = &unk_1E5D008A0;
      unsigned int v21 = v18;
      id v77 = v21;
      id v22 = (id)[v10 appendBool:allowsSystemSuggestedComplications counterpart:v76];
      BOOL allowsSystemSuggestedComplicationsInLandscape = self->_allowsSystemSuggestedComplicationsInLandscape;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_5;
      v74[3] = &unk_1E5D008A0;
      id v24 = v21;
      id v75 = v24;
      id v25 = (id)[v10 appendBool:allowsSystemSuggestedComplicationsInLandscape counterpart:v74];
      int64_t featuredConfidenceLevel = self->_featuredConfidenceLevel;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_6;
      v72[3] = &unk_1E5D008C8;
      v27 = v24;
      id v73 = v27;
      id v28 = (id)[v10 appendInteger:featuredConfidenceLevel counterpart:v72];
      displayNameLocalizationKey = self->_displayNameLocalizationKey;
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_7;
      v70[3] = &unk_1E5D00878;
      id v30 = v27;
      id v71 = v30;
      id v31 = (id)[v10 appendObject:displayNameLocalizationKey counterpart:v70];
      spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_8;
      v68[3] = &unk_1E5D00878;
      id v33 = v30;
      id v69 = v33;
      id v34 = (id)[v10 appendObject:spokenNameLocalizationKey counterpart:v68];
      descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_9;
      v66[3] = &unk_1E5D00878;
      id v36 = v33;
      id v67 = v36;
      id v37 = (id)[v10 appendObject:descriptiveTextLocalizationKey counterpart:v66];
      BOOL hero = self->_hero;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_10;
      v64[3] = &unk_1E5D008A0;
      id v39 = v36;
      id v65 = v39;
      id v40 = (id)[v10 appendBool:hero counterpart:v64];
      BOOL shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_11;
      v62[3] = &unk_1E5D008A0;
      id v42 = v39;
      id v63 = v42;
      id v43 = (id)[v10 appendBool:shouldShowAsShuffleStack counterpart:v62];
      int64_t photoSubtype = self->_photoSubtype;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_12;
      v60[3] = &unk_1E5D008C8;
      id v45 = v42;
      id v61 = v45;
      id v46 = (id)[v10 appendInteger:photoSubtype counterpart:v60];
      int64_t focus = self->_focus;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_13;
      v58[3] = &unk_1E5D008C8;
      id v48 = v45;
      id v59 = v48;
      id v49 = (id)[v10 appendInteger:focus counterpart:v58];
      BOOL onlyEligibleForMadeForFocusSection = self->_onlyEligibleForMadeForFocusSection;
      uint64_t v53 = MEMORY[0x1E4F143A8];
      uint64_t v54 = 3221225472;
      v55 = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_14;
      v56 = &unk_1E5D008A0;
      id v57 = v48;
      id v51 = (id)[v10 appendBool:onlyEligibleForMadeForFocusSection counterpart:&v53];
      char v8 = objc_msgSend(v10, "isEqual", v53, v54, v55, v56);
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 40);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_9(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_10(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_11(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 11);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_12(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 72);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_13(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 80);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_14(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 12);
}

- (unint64_t)hash
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v4 = self->_modularComplications;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)[v3 appendObject:*(void *)(*((void *)&v34 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v6);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v10 = self->_modularLandscapeComplications;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v30 + 1) + 8 * v14++), (void)v30);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v12);
  }

  id v16 = (id)[v3 appendObject:self->_inlineComplication];
  id v17 = (id)[v3 appendBool:self->_allowsSystemSuggestedComplications];
  id v18 = (id)[v3 appendBool:self->_allowsSystemSuggestedComplicationsInLandscape];
  id v19 = (id)[v3 appendInteger:self->_featuredConfidenceLevel];
  id v20 = (id)[v3 appendObject:self->_displayNameLocalizationKey];
  id v21 = (id)[v3 appendObject:self->_spokenNameLocalizationKey];
  id v22 = (id)[v3 appendObject:self->_descriptiveTextLocalizationKey];
  id v23 = (id)[v3 appendBool:self->_hero];
  id v24 = (id)[v3 appendBool:self->_shouldShowAsShuffleStack];
  id v25 = (id)[v3 appendInteger:self->_photoSubtype];
  id v26 = (id)[v3 appendInteger:self->_focus];
  id v27 = (id)[v3 appendBool:self->_onlyEligibleForMadeForFocusSection];
  unint64_t v28 = [v3 hash];

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryItemOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSStringFromSelector(sel_modularComplications);
  uint64_t v38 = [v3 decodeArrayOfObjectsOfClass:v4 forKey:v5];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_modularLandscapeComplications);
  long long v37 = [v3 decodeArrayOfObjectsOfClass:v6 forKey:v7];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_inlineComplication);
  long long v36 = [v3 decodeObjectOfClass:v8 forKey:v9];

  v10 = NSStringFromSelector(sel_allowsSystemSuggestedComplications);
  unsigned int v35 = [v3 decodeBoolForKey:v10];

  uint64_t v11 = NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
  unsigned int v34 = [v3 decodeBoolForKey:v11];

  uint64_t v12 = NSStringFromSelector(sel_featuredConfidenceLevel);
  uint64_t v33 = [v3 decodeIntegerForKey:v12];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = NSStringFromSelector(sel_displayNameLocalizationKey);
  id v15 = [v3 decodeObjectOfClass:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_spokenNameLocalizationKey);
  id v18 = [v3 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v19 = objc_opt_class();
  id v20 = NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  id v21 = [v3 decodeObjectOfClass:v19 forKey:v20];

  id v22 = NSStringFromSelector(sel_isHero);
  LOBYTE(v20) = [v3 decodeBoolForKey:v22];

  id v23 = NSStringFromSelector(sel_shouldShowAsShuffleStack);
  LOBYTE(v22) = [v3 decodeBoolForKey:v23];

  id v24 = NSStringFromSelector(sel_photoSubtype);
  uint64_t v25 = [v3 decodeIntegerForKey:v24];

  id v26 = NSStringFromSelector(sel_focus);
  uint64_t v27 = [v3 decodeIntegerForKey:v26];

  unint64_t v28 = NSStringFromSelector(sel_isOnlyEligibleForMadeForFocusSection);
  LOBYTE(v7) = [v3 decodeBoolForKey:v28];

  LOBYTE(v32) = (_BYTE)v7;
  BYTE1(v31) = (_BYTE)v22;
  LOBYTE(v31) = (_BYTE)v20;
  id v29 = -[PRSPosterGalleryItemOptions initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:](self, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", v38, v37, v36, v35, v34, v33, v15, v18, v21, v31, v25, v27, v32);

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  modularComplications = self->_modularComplications;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_modularComplications);
  [v5 encodeObject:modularComplications forKey:v6];

  modularLandscapeComplications = self->_modularLandscapeComplications;
  uint64_t v8 = NSStringFromSelector(sel_modularLandscapeComplications);
  [v5 encodeObject:modularLandscapeComplications forKey:v8];

  uint64_t inlineComplication = self->_inlineComplication;
  v10 = NSStringFromSelector(sel_inlineComplication);
  [v5 encodeObject:inlineComplication forKey:v10];

  BOOL allowsSystemSuggestedComplications = self->_allowsSystemSuggestedComplications;
  uint64_t v12 = NSStringFromSelector(sel_allowsSystemSuggestedComplications);
  [v5 encodeBool:allowsSystemSuggestedComplications forKey:v12];

  BOOL allowsSystemSuggestedComplicationsInLandscape = self->_allowsSystemSuggestedComplicationsInLandscape;
  uint64_t v14 = NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
  [v5 encodeBool:allowsSystemSuggestedComplicationsInLandscape forKey:v14];

  int64_t featuredConfidenceLevel = self->_featuredConfidenceLevel;
  uint64_t v16 = NSStringFromSelector(sel_featuredConfidenceLevel);
  [v5 encodeInteger:featuredConfidenceLevel forKey:v16];

  displayNameLocalizationKey = self->_displayNameLocalizationKey;
  id v18 = NSStringFromSelector(sel_displayNameLocalizationKey);
  [v5 encodeObject:displayNameLocalizationKey forKey:v18];

  spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
  id v20 = NSStringFromSelector(sel_spokenNameLocalizationKey);
  [v5 encodeObject:spokenNameLocalizationKey forKey:v20];

  descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
  id v22 = NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  [v5 encodeObject:descriptiveTextLocalizationKey forKey:v22];

  BOOL hero = self->_hero;
  id v24 = NSStringFromSelector(sel_isHero);
  [v5 encodeBool:hero forKey:v24];

  BOOL shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
  id v26 = NSStringFromSelector(sel_shouldShowAsShuffleStack);
  [v5 encodeBool:shouldShowAsShuffleStack forKey:v26];

  int64_t photoSubtype = self->_photoSubtype;
  unint64_t v28 = NSStringFromSelector(sel_photoSubtype);
  [v5 encodeInteger:photoSubtype forKey:v28];

  int64_t focus = self->_focus;
  long long v30 = NSStringFromSelector(sel_focus);
  [v5 encodeInteger:focus forKey:v30];

  BOOL onlyEligibleForMadeForFocusSection = self->_onlyEligibleForMadeForFocusSection;
  NSStringFromSelector(sel_isOnlyEligibleForMadeForFocusSection);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:onlyEligibleForMadeForFocusSection forKey:v32];
}

- (NSArray)modularComplications
{
  return self->_modularComplications;
}

- (NSArray)modularLandscapeComplications
{
  return self->_modularLandscapeComplications;
}

- (PRSPosterGallerySuggestedComplication)inlineComplication
{
  return self->_inlineComplication;
}

- (BOOL)allowsSystemSuggestedComplications
{
  return self->_allowsSystemSuggestedComplications;
}

- (BOOL)allowsSystemSuggestedComplicationsInLandscape
{
  return self->_allowsSystemSuggestedComplicationsInLandscape;
}

- (int64_t)featuredConfidenceLevel
{
  return self->_featuredConfidenceLevel;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (BOOL)isHero
{
  return self->_hero;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (int64_t)photoSubtype
{
  return self->_photoSubtype;
}

- (int64_t)focus
{
  return self->_focus;
}

- (BOOL)isOnlyEligibleForMadeForFocusSection
{
  return self->_onlyEligibleForMadeForFocusSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_modularLandscapeComplications, 0);
  objc_storeStrong((id *)&self->_modularComplications, 0);
}

@end