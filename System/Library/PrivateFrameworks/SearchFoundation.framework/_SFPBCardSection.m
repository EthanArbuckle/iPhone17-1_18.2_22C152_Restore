@interface _SFPBCardSection
- (BOOL)canBeHidden;
- (BOOL)forceEnable3DTouch;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldHideInAmbientMode;
- (BOOL)shouldShowInSmartDialog;
- (NSArray)commands;
- (NSArray)leadingSwipeButtonItems;
- (NSArray)parameterKeyPaths;
- (NSArray)previewButtonItems;
- (NSArray)punchoutOptions;
- (NSArray)referencedCommands;
- (NSArray)trailingSwipeButtonItems;
- (NSData)jsonData;
- (NSString)cardSectionDetail;
- (NSString)cardSectionId;
- (NSString)emphasisSubjectId;
- (NSString)previewButtonItemsTitle;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)resultIdentifier;
- (_SFPBAppEntityAnnotation)appEntityAnnotation;
- (_SFPBCard)nextCard;
- (_SFPBCardSection)initWithDictionary:(id)a3;
- (_SFPBCardSection)initWithFacade:(id)a3;
- (_SFPBCardSection)initWithJSON:(id)a3;
- (_SFPBCardSectionValue)value;
- (_SFPBColor)backgroundColor;
- (_SFPBCommand)command;
- (_SFPBCommand)previewCommand;
- (_SFPBCommand)secondaryCommand;
- (_SFPBUserReportRequest)userReportRequest;
- (id)commandsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)leadingSwipeButtonItemsAtIndex:(unint64_t)a3;
- (id)parameterKeyPathsAtIndex:(unint64_t)a3;
- (id)previewButtonItemsAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)referencedCommandsAtIndex:(unint64_t)a3;
- (id)trailingSwipeButtonItemsAtIndex:(unint64_t)a3;
- (int)increasedContrastMode;
- (int)requiredLevelOfDetail;
- (int)separatorStyle;
- (int)type;
- (unint64_t)commandsCount;
- (unint64_t)hash;
- (unint64_t)leadingSwipeButtonItemsCount;
- (unint64_t)parameterKeyPathsCount;
- (unint64_t)previewButtonItemsCount;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)referencedCommandsCount;
- (unint64_t)trailingSwipeButtonItemsCount;
- (void)addCommands:(id)a3;
- (void)addLeadingSwipeButtonItems:(id)a3;
- (void)addParameterKeyPaths:(id)a3;
- (void)addPreviewButtonItems:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)addReferencedCommands:(id)a3;
- (void)addTrailingSwipeButtonItems:(id)a3;
- (void)clearCommands;
- (void)clearLeadingSwipeButtonItems;
- (void)clearParameterKeyPaths;
- (void)clearPreviewButtonItems;
- (void)clearPunchoutOptions;
- (void)clearReferencedCommands;
- (void)clearTrailingSwipeButtonItems;
- (void)setAppEntityAnnotation:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setCardSectionDetail:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommands:(id)a3;
- (void)setEmphasisSubjectId:(id)a3;
- (void)setForceEnable3DTouch:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIncreasedContrastMode:(int)a3;
- (void)setLeadingSwipeButtonItems:(id)a3;
- (void)setNextCard:(id)a3;
- (void)setParameterKeyPaths:(id)a3;
- (void)setPreviewButtonItems:(id)a3;
- (void)setPreviewButtonItemsTitle:(id)a3;
- (void)setPreviewCommand:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setReferencedCommands:(id)a3;
- (void)setRequiredLevelOfDetail:(int)a3;
- (void)setResultIdentifier:(id)a3;
- (void)setSecondaryCommand:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setShouldHideInAmbientMode:(BOOL)a3;
- (void)setShouldShowInSmartDialog:(BOOL)a3;
- (void)setTrailingSwipeButtonItems:(id)a3;
- (void)setType:(int)a3;
- (void)setUserReportRequest:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCardSection

- (_SFPBCardSection)initWithFacade:(id)a3
{
  uint64_t v369 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v361.receiver = self;
  v361.super_class = (Class)_SFPBCardSection;
  v5 = [(_SFPBCardSection *)&v361 init];

  if (v5)
  {
    v6 = [v4 nextCard];

    if (v6)
    {
      v7 = [_SFPBCard alloc];
      v8 = [v4 nextCard];
      v9 = [(_SFPBCard *)v7 initWithFacade:v8];
      [(_SFPBCardSection *)v5 setNextCard:v9];
    }
    v10 = [v4 commands];
    v331 = v5;
    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v11 = 0;
    }

    long long v359 = 0u;
    long long v360 = 0u;
    long long v357 = 0u;
    long long v358 = 0u;
    v330 = v4;
    v12 = [v4 commands];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v357 objects:v368 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v358;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v358 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[_SFPBAbstractCommand alloc] initWithFacade:*(void *)(*((void *)&v357 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v357 objects:v368 count:16];
      }
      while (v14);
    }

    [(_SFPBCardSection *)v331 setCommands:v11];
    v18 = [v4 parameterKeyPaths];
    if (v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v19 = 0;
    }

    long long v355 = 0u;
    long long v356 = 0u;
    long long v353 = 0u;
    long long v354 = 0u;
    v20 = [v4 parameterKeyPaths];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v353 objects:v367 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v354;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v354 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(id *)(*((void *)&v353 + 1) + 8 * j);
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v353 objects:v367 count:16];
      }
      while (v22);
    }

    v328 = v19;
    [(_SFPBCardSection *)v331 setParameterKeyPaths:v19];
    v26 = [v330 cardSectionId];

    if (v26)
    {
      v27 = [v330 cardSectionId];
      [(_SFPBCardSection *)v331 setCardSectionId:v27];
    }
    v28 = [v330 resultIdentifier];

    if (v28)
    {
      v29 = [v330 resultIdentifier];
      [(_SFPBCardSection *)v331 setResultIdentifier:v29];
    }
    v30 = [v330 userReportRequest];

    if (v30)
    {
      v31 = [_SFPBUserReportRequest alloc];
      v32 = [v330 userReportRequest];
      v33 = [(_SFPBUserReportRequest *)v31 initWithFacade:v32];
      [(_SFPBCardSection *)v331 setUserReportRequest:v33];
    }
    v34 = [v330 command];

    if (v34)
    {
      v35 = [_SFPBCommand alloc];
      v36 = [v330 command];
      v37 = [(_SFPBCommand *)v35 initWithFacade:v36];
      [(_SFPBCardSection *)v331 setCommand:v37];
    }
    v38 = [v330 previewCommand];

    if (v38)
    {
      v39 = [_SFPBCommand alloc];
      v40 = [v330 previewCommand];
      v41 = [(_SFPBCommand *)v39 initWithFacade:v40];
      [(_SFPBCardSection *)v331 setPreviewCommand:v41];
    }
    v42 = [v330 previewButtonItems];
    if (v42)
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v43 = 0;
    }

    long long v351 = 0u;
    long long v352 = 0u;
    long long v349 = 0u;
    long long v350 = 0u;
    v44 = [v330 previewButtonItems];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v349 objects:v366 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v350;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v350 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v349 + 1) + 8 * k)];
          if (v49) {
            [v43 addObject:v49];
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v349 objects:v366 count:16];
      }
      while (v46);
    }

    [(_SFPBCardSection *)v331 setPreviewButtonItems:v43];
    v50 = [v330 cardSectionDetail];

    if (v50)
    {
      v51 = [v330 cardSectionDetail];
      [(_SFPBCardSection *)v331 setCardSectionDetail:v51];
    }
    v52 = [v330 previewButtonItemsTitle];

    if (v52)
    {
      v53 = [v330 previewButtonItemsTitle];
      [(_SFPBCardSection *)v331 setPreviewButtonItemsTitle:v53];
    }
    v54 = [v330 backgroundColor];

    if (v54)
    {
      v55 = [_SFPBColor alloc];
      v56 = [v330 backgroundColor];
      v57 = [(_SFPBColor *)v55 initWithFacade:v56];
      [(_SFPBCardSection *)v331 setBackgroundColor:v57];
    }
    -[_SFPBCardSection setShouldHideInAmbientMode:](v331, "setShouldHideInAmbientMode:", [v330 shouldHideInAmbientMode]);
    v58 = [v330 leadingSwipeButtonItems];
    v329 = v11;
    if (v58)
    {
      id v332 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v332 = 0;
    }

    long long v347 = 0u;
    long long v348 = 0u;
    long long v345 = 0u;
    long long v346 = 0u;
    v59 = [v330 leadingSwipeButtonItems];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v345 objects:v365 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v346;
      do
      {
        for (uint64_t m = 0; m != v61; ++m)
        {
          if (*(void *)v346 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v345 + 1) + 8 * m)];
          if (v64) {
            [v332 addObject:v64];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v345 objects:v365 count:16];
      }
      while (v61);
    }

    [(_SFPBCardSection *)v331 setLeadingSwipeButtonItems:v332];
    v65 = [v330 trailingSwipeButtonItems];
    id v326 = v43;
    if (v65)
    {
      id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v66 = 0;
    }

    long long v343 = 0u;
    long long v344 = 0u;
    long long v341 = 0u;
    long long v342 = 0u;
    v67 = [v330 trailingSwipeButtonItems];
    uint64_t v68 = [v67 countByEnumeratingWithState:&v341 objects:v364 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v342;
      do
      {
        for (uint64_t n = 0; n != v69; ++n)
        {
          if (*(void *)v342 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(void *)(*((void *)&v341 + 1) + 8 * n), v326);
          if (v72) {
            [v66 addObject:v72];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v341 objects:v364 count:16];
      }
      while (v69);
    }

    [(_SFPBCardSection *)v331 setTrailingSwipeButtonItems:v66];
    v73 = [v330 punchoutOptions];
    if (v73)
    {
      id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v74 = 0;
    }

    long long v339 = 0u;
    long long v340 = 0u;
    long long v337 = 0u;
    long long v338 = 0u;
    v75 = [v330 punchoutOptions];
    uint64_t v76 = [v75 countByEnumeratingWithState:&v337 objects:v363 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v338;
      do
      {
        for (iuint64_t i = 0; ii != v77; ++ii)
        {
          if (*(void *)v338 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v337 + 1) + 8 * ii)];
          if (v80) {
            [v74 addObject:v80];
          }
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v337 objects:v363 count:16];
      }
      while (v77);
    }

    [(_SFPBCardSection *)v331 setPunchoutOptions:v74];
    id v4 = v330;
    v81 = [v330 punchoutPickerTitle];

    if (v81)
    {
      v82 = [v330 punchoutPickerTitle];
      [(_SFPBCardSection *)v331 setPunchoutPickerTitle:v82];
    }
    v83 = objc_msgSend(v330, "punchoutPickerDismissText", v326);

    if (v83)
    {
      v84 = [v330 punchoutPickerDismissText];
      [(_SFPBCardSection *)v331 setPunchoutPickerDismissText:v84];
    }
    -[_SFPBCardSection setCanBeHidden:](v331, "setCanBeHidden:", [v330 canBeHidden]);
    -[_SFPBCardSection setHasTopPadding:](v331, "setHasTopPadding:", [v330 hasTopPadding]);
    -[_SFPBCardSection setHasBottomPadding:](v331, "setHasBottomPadding:", [v330 hasBottomPadding]);
    -[_SFPBCardSection setSeparatorStyle:](v331, "setSeparatorStyle:", [v330 separatorStyle]);
    v85 = [v330 referencedCommands];
    if (v85)
    {
      id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v86 = 0;
    }

    long long v335 = 0u;
    long long v336 = 0u;
    long long v333 = 0u;
    long long v334 = 0u;
    v87 = [v330 referencedCommands];
    uint64_t v88 = [v87 countByEnumeratingWithState:&v333 objects:v362 count:16];
    if (v88)
    {
      uint64_t v89 = v88;
      uint64_t v90 = *(void *)v334;
      do
      {
        for (juint64_t j = 0; jj != v89; ++jj)
        {
          if (*(void *)v334 != v90) {
            objc_enumerationMutation(v87);
          }
          v92 = [[_SFPBCommand alloc] initWithFacade:*(void *)(*((void *)&v333 + 1) + 8 * jj)];
          if (v92) {
            [v86 addObject:v92];
          }
        }
        uint64_t v89 = [v87 countByEnumeratingWithState:&v333 objects:v362 count:16];
      }
      while (v89);
    }

    v5 = v331;
    [(_SFPBCardSection *)v331 setReferencedCommands:v86];
    -[_SFPBCardSection setForceEnable3DTouch:](v331, "setForceEnable3DTouch:", [v330 forceEnable3DTouch]);
    -[_SFPBCardSection setShouldShowInSmartDialog:](v331, "setShouldShowInSmartDialog:", [v330 shouldShowInSmartDialog]);
    v93 = [v330 appEntityAnnotation];

    if (v93)
    {
      v94 = [_SFPBAppEntityAnnotation alloc];
      v95 = [v330 appEntityAnnotation];
      v96 = [(_SFPBAppEntityAnnotation *)v94 initWithFacade:v95];
      [(_SFPBCardSection *)v331 setAppEntityAnnotation:v96];
    }
    v97 = [v330 emphasisSubjectId];

    if (v97)
    {
      v98 = [v330 emphasisSubjectId];
      [(_SFPBCardSection *)v331 setEmphasisSubjectId:v98];
    }
    -[_SFPBCardSection setIncreasedContrastMode:](v331, "setIncreasedContrastMode:", [v330 increasedContrastMode]);
    v99 = [v330 secondaryCommand];

    if (v99)
    {
      v100 = [_SFPBCommand alloc];
      v101 = [v330 secondaryCommand];
      v102 = [(_SFPBCommand *)v100 initWithFacade:v101];
      [(_SFPBCardSection *)v331 setSecondaryCommand:v102];
    }
    -[_SFPBCardSection setRequiredLevelOfDetail:](v331, "setRequiredLevelOfDetail:", [v330 requiredLevelOfDetail]);
    v103 = objc_alloc_init(_SFPBCardSectionValue);
    [(_SFPBCardSection *)v331 setValue:v103];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:1];
      v104 = [[_SFPBAppLinkCardSection alloc] initWithFacade:v330];
      v105 = [(_SFPBCardSection *)v331 value];
      [v105 setAppLinkCardSection:v104];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:2];
      v106 = [[_SFPBDescriptionCardSection alloc] initWithFacade:v330];
      v107 = [(_SFPBCardSection *)v331 value];
      [v107 setDescriptionCardSection:v106];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:3];
      v108 = [[_SFPBKeyValueDataCardSection alloc] initWithFacade:v330];
      v109 = [(_SFPBCardSection *)v331 value];
      [v109 setKeyValueDataCardSection:v108];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:4];
      v110 = [[_SFPBMapCardSection alloc] initWithFacade:v330];
      v111 = [(_SFPBCardSection *)v331 value];
      [v111 setMapCardSection:v110];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:5];
      v112 = [[_SFPBMediaInfoCardSection alloc] initWithFacade:v330];
      v113 = [(_SFPBCardSection *)v331 value];
      [v113 setMediaInfoCardSection:v112];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:6];
      v114 = [[_SFPBMediaPlayerCardSection alloc] initWithFacade:v330];
      v115 = [(_SFPBCardSection *)v331 value];
      [v115 setMediaPlayerCardSection:v114];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:7];
      v116 = [[_SFPBNowPlayingCardSection alloc] initWithFacade:v330];
      v117 = [(_SFPBCardSection *)v331 value];
      [v117 setNowPlayingCardSection:v116];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:8];
      v118 = [[_SFPBRichTitleCardSection alloc] initWithFacade:v330];
      v119 = [(_SFPBCardSection *)v331 value];
      [v119 setRichTitleCardSection:v118];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:9];
      v120 = [[_SFPBRowCardSection alloc] initWithFacade:v330];
      v121 = [(_SFPBCardSection *)v331 value];
      [v121 setRowCardSection:v120];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:10];
      v122 = [[_SFPBScoreboardCardSection alloc] initWithFacade:v330];
      v123 = [(_SFPBCardSection *)v331 value];
      [v123 setScoreboardCardSection:v122];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:11];
      v124 = [[_SFPBSocialMediaPostCardSection alloc] initWithFacade:v330];
      v125 = [(_SFPBCardSection *)v331 value];
      [v125 setSocialMediaPostCardSection:v124];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:12];
      v126 = [[_SFPBStockChartCardSection alloc] initWithFacade:v330];
      v127 = [(_SFPBCardSection *)v331 value];
      [v127 setStockChartCardSection:v126];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:13];
      v128 = [[_SFPBTableHeaderRowCardSection alloc] initWithFacade:v330];
      v129 = [(_SFPBCardSection *)v331 value];
      [v129 setTableHeaderRowCardSection:v128];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(_SFPBCardSection *)v331 setType:14];
        v130 = [[_SFPBTableRowCardSection alloc] initWithFacade:v330];
        v131 = [(_SFPBCardSection *)v331 value];
        [v131 setTableRowCardSection:v130];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:15];
      v132 = [[_SFPBTextColumnsCardSection alloc] initWithFacade:v330];
      v133 = [(_SFPBCardSection *)v331 value];
      [v133 setTextColumnsCardSection:v132];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  [(_SFPBCardSection *)v331 setType:16];
                  v134 = [[_SFPBTitleCardSection alloc] initWithFacade:v330];
                  v135 = [(_SFPBCardSection *)v331 value];
                  [v135 setTitleCardSection:v134];
                }
              }
            }
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:17];
      v136 = [[_SFPBTrackListCardSection alloc] initWithFacade:v330];
      v137 = [(_SFPBCardSection *)v331 value];
      [v137 setTrackListCardSection:v136];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:18];
      v138 = [[_SFPBAudioPlaybackCardSection alloc] initWithFacade:v330];
      v139 = [(_SFPBCardSection *)v331 value];
      [v139 setAudioPlaybackCardSection:v138];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:19];
      v140 = [[_SFPBFlightCardSection alloc] initWithFacade:v330];
      v141 = [(_SFPBCardSection *)v331 value];
      [v141 setFlightCardSection:v140];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:20];
      v142 = [[_SFPBActivityIndicatorCardSection alloc] initWithFacade:v330];
      v143 = [(_SFPBCardSection *)v331 value];
      [v143 setActivityIndicatorCardSection:v142];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:21];
      v144 = [[_SFPBWebCardSection alloc] initWithFacade:v330];
      v145 = [(_SFPBCardSection *)v331 value];
      [v145 setWebCardSection:v144];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:22];
      v146 = [[_SFPBMessageCardSection alloc] initWithFacade:v330];
      v147 = [(_SFPBCardSection *)v331 value];
      [v147 setMessageCardSection:v146];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:23];
      v148 = [[_SFPBDetailedRowCardSection alloc] initWithFacade:v330];
      v149 = [(_SFPBCardSection *)v331 value];
      [v149 setDetailedRowCardSection:v148];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:24];
      v150 = [[_SFPBImagesCardSection alloc] initWithFacade:v330];
      v151 = [(_SFPBCardSection *)v331 value];
      [v151 setImagesCardSection:v150];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:25];
      v152 = [[_SFPBSuggestionCardSection alloc] initWithFacade:v330];
      v153 = [(_SFPBCardSection *)v331 value];
      [v153 setSuggestionCardSection:v152];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:26];
      v154 = [[_SFPBSelectableGridCardSection alloc] initWithFacade:v330];
      v155 = [(_SFPBCardSection *)v331 value];
      [v155 setSelectableGridCardSection:v154];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:27];
      v156 = [[_SFPBSectionHeaderCardSection alloc] initWithFacade:v330];
      v157 = [(_SFPBCardSection *)v331 value];
      [v157 setSectionHeaderCardSection:v156];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:28];
      v158 = [[_SFPBMetaInfoCardSection alloc] initWithFacade:v330];
      v159 = [(_SFPBCardSection *)v331 value];
      [v159 setMetaInfoCardSection:v158];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:29];
      v160 = [[_SFPBWatchListCardSection alloc] initWithFacade:v330];
      v161 = [(_SFPBCardSection *)v331 value];
      [v161 setWatchListCardSection:v160];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:30];
      v162 = [[_SFPBMapsDetailedRowCardSection alloc] initWithFacade:v330];
      v163 = [(_SFPBCardSection *)v331 value];
      [v163 setMapsDetailedRowCardSection:v162];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:31];
      v164 = [[_SFPBButtonCardSection alloc] initWithFacade:v330];
      v165 = [(_SFPBCardSection *)v331 value];
      [v165 setButtonCardSection:v164];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:32];
      v166 = [[_SFPBHorizontalButtonCardSection alloc] initWithFacade:v330];
      v167 = [(_SFPBCardSection *)v331 value];
      [v167 setHorizontalButtonCardSection:v166];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:33];
      v168 = [[_SFPBVerticalLayoutCardSection alloc] initWithFacade:v330];
      v169 = [(_SFPBCardSection *)v331 value];
      [v169 setVerticalLayoutCardSection:v168];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:34];
      v170 = [[_SFPBProductCardSection alloc] initWithFacade:v330];
      v171 = [(_SFPBCardSection *)v331 value];
      [v171 setProductCardSection:v170];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:35];
      v172 = [[_SFPBHorizontalScrollCardSection alloc] initWithFacade:v330];
      v173 = [(_SFPBCardSection *)v331 value];
      [v173 setHorizontalScrollCardSection:v172];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:36];
      v174 = [[_SFPBMediaRemoteControlCardSection alloc] initWithFacade:v330];
      v175 = [(_SFPBCardSection *)v331 value];
      [v175 setMediaRemoteControlCardSection:v174];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:37];
      v176 = [[_SFPBMapPlaceCardSection alloc] initWithFacade:v330];
      v177 = [(_SFPBCardSection *)v331 value];
      [v177 setMapPlaceCardSection:v176];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:38];
      v178 = [[_SFPBCompactRowCardSection alloc] initWithFacade:v330];
      v179 = [(_SFPBCardSection *)v331 value];
      [v179 setCompactRowCardSection:v178];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:39];
      v180 = [[_SFPBWorldMapCardSection alloc] initWithFacade:v330];
      v181 = [(_SFPBCardSection *)v331 value];
      [v181 setWorldMapCardSection:v180];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:40];
      v182 = [[_SFPBAttributionFooterCardSection alloc] initWithFacade:v330];
      v183 = [(_SFPBCardSection *)v331 value];
      [v183 setAttributionFooterCardSection:v182];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:41];
      v184 = [[_SFPBGridCardSection alloc] initWithFacade:v330];
      v185 = [(_SFPBCardSection *)v331 value];
      [v185 setGridCardSection:v184];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:42];
      v186 = [[_SFPBPersonHeaderCardSection alloc] initWithFacade:v330];
      v187 = [(_SFPBCardSection *)v331 value];
      [v187 setPersonHeaderCardSection:v186];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:43];
      v188 = [[_SFPBColorBarCardSection alloc] initWithFacade:v330];
      v189 = [(_SFPBCardSection *)v331 value];
      [v189 setColorBarCardSection:v188];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:44];
      v190 = [[_SFPBSplitCardSection alloc] initWithFacade:v330];
      v191 = [(_SFPBCardSection *)v331 value];
      [v191 setSplitCardSection:v190];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:45];
      v192 = [[_SFPBLinkPresentationCardSection alloc] initWithFacade:v330];
      v193 = [(_SFPBCardSection *)v331 value];
      [v193 setLinkPresentationCardSection:v192];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:46];
      v194 = [[_SFPBFindMyCardSection alloc] initWithFacade:v330];
      v195 = [(_SFPBCardSection *)v331 value];
      [v195 setFindMyCardSection:v194];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:47];
      v196 = [[_SFPBHeroCardSection alloc] initWithFacade:v330];
      v197 = [(_SFPBCardSection *)v331 value];
      [v197 setHeroCardSection:v196];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:48];
      v198 = [[_SFPBNewsCardSection alloc] initWithFacade:v330];
      v199 = [(_SFPBCardSection *)v331 value];
      [v199 setNewsCardSection:v198];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:49];
      v200 = [[_SFPBMiniCardSection alloc] initWithFacade:v330];
      v201 = [(_SFPBCardSection *)v331 value];
      [v201 setMiniCardSection:v200];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:50];
      v202 = [[_SFPBInfoCardSection alloc] initWithFacade:v330];
      v203 = [(_SFPBCardSection *)v331 value];
      [v203 setInfoCardSection:v202];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:51];
      v204 = [[_SFPBCollectionCardSection alloc] initWithFacade:v330];
      v205 = [(_SFPBCardSection *)v331 value];
      [v205 setCollectionCardSection:v204];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:52];
      v206 = [[_SFPBCombinedCardSection alloc] initWithFacade:v330];
      v207 = [(_SFPBCardSection *)v331 value];
      [v207 setCombinedCardSection:v206];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:53];
      v208 = [[_SFPBResponseWrapperCardSection alloc] initWithFacade:v330];
      v209 = [(_SFPBCardSection *)v331 value];
      [v209 setResponseWrapperCardSection:v208];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:54];
      v210 = [[_SFPBListenToCardSection alloc] initWithFacade:v330];
      v211 = [(_SFPBCardSection *)v331 value];
      [v211 setListenToCardSection:v210];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:55];
      v212 = [[_SFPBWatchNowCardSection alloc] initWithFacade:v330];
      v213 = [(_SFPBCardSection *)v331 value];
      [v213 setWatchNowCardSection:v212];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:56];
      v214 = [[_SFPBStrokeAnimationCardSection alloc] initWithFacade:v330];
      v215 = [(_SFPBCardSection *)v331 value];
      [v215 setStrokeAnimationCardSection:v214];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:57];
      v216 = [[_SFPBButtonListCardSection alloc] initWithFacade:v330];
      v217 = [(_SFPBCardSection *)v331 value];
      [v217 setButtonListCardSection:v216];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:58];
      v218 = [[_SFPBCommandRowCardSection alloc] initWithFacade:v330];
      v219 = [(_SFPBCardSection *)v331 value];
      [v219 setCommandRowCardSection:v218];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:59];
      v220 = [[_SFPBLeadingTrailingCardSection alloc] initWithFacade:v330];
      v221 = [(_SFPBCardSection *)v331 value];
      [v221 setLeadingTrailingCardSection:v220];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:60];
      v222 = [[_SFPBHeroTitleCardSection alloc] initWithFacade:v330];
      v223 = [(_SFPBCardSection *)v331 value];
      [v223 setHeroTitleCardSection:v222];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:61];
      v224 = [[_SFPBArchiveViewCardSection alloc] initWithFacade:v330];
      v225 = [(_SFPBCardSection *)v331 value];
      [v225 setArchiveViewCardSection:v224];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:63];
      v226 = [[_SFPBAppIconCardSection alloc] initWithFacade:v330];
      v227 = [(_SFPBCardSection *)v331 value];
      [v227 setAppIconCardSection:v226];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:64];
      v228 = [[_SFPBLargeTitleDetailedRowCardSection alloc] initWithFacade:v330];
      v229 = [(_SFPBCardSection *)v331 value];
      [v229 setLargeTitleDetailedRowCardSection:v228];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:90];
      v230 = [[_SFPBSafariTableOfContentsCardSection alloc] initWithFacade:v330];
      v231 = [(_SFPBCardSection *)v331 value];
      [v231 setSafariTableOfContentsCardSection:v230];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:200];
      v232 = [[_SFPBRFSummaryItemShortNumberCardSection alloc] initWithFacade:v330];
      v233 = [(_SFPBCardSection *)v331 value];
      [v233 setRfSummaryItemShortNumberCardSection:v232];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:201];
      v234 = [[_SFPBRFSummaryItemTextCardSection alloc] initWithFacade:v330];
      v235 = [(_SFPBCardSection *)v331 value];
      [v235 setRfSummaryItemTextCardSection:v234];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:202];
      v236 = [[_SFPBRFSummaryItemStandardCardSection alloc] initWithFacade:v330];
      v237 = [(_SFPBCardSection *)v331 value];
      [v237 setRfSummaryItemStandardCardSection:v236];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:203];
      v238 = [[_SFPBRFFactItemShortNumberCardSection alloc] initWithFacade:v330];
      v239 = [(_SFPBCardSection *)v331 value];
      [v239 setRfFactItemShortNumberCardSection:v238];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:204];
      v240 = [[_SFPBRFFactItemStandardCardSection alloc] initWithFacade:v330];
      v241 = [(_SFPBCardSection *)v331 value];
      [v241 setRfFactItemStandardCardSection:v240];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:205];
      v242 = [[_SFPBRFLongItemStandardCardSection alloc] initWithFacade:v330];
      v243 = [(_SFPBCardSection *)v331 value];
      [v243 setRfLongItemStandardCardSection:v242];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:206];
      v244 = [[_SFPBRFPrimaryHeaderRichCardSection alloc] initWithFacade:v330];
      v245 = [(_SFPBCardSection *)v331 value];
      [v245 setRfPrimaryHeaderRichCardSection:v244];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:207];
      v246 = [[_SFPBRFPrimaryHeaderStandardCardSection alloc] initWithFacade:v330];
      v247 = [(_SFPBCardSection *)v331 value];
      [v247 setRfPrimaryHeaderStandardCardSection:v246];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:208];
      v248 = [[_SFPBRFReferenceFootnoteCardSection alloc] initWithFacade:v330];
      v249 = [(_SFPBCardSection *)v331 value];
      [v249 setRfReferenceFootnoteCardSection:v248];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:209];
      v250 = [[_SFPBRFReferenceRichCardSection alloc] initWithFacade:v330];
      v251 = [(_SFPBCardSection *)v331 value];
      [v251 setRfReferenceRichCardSection:v250];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:210];
      v252 = [[_SFPBRFSimpleItemRichCardSection alloc] initWithFacade:v330];
      v253 = [(_SFPBCardSection *)v331 value];
      [v253 setRfSimpleItemRichCardSection:v252];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:211];
      v254 = [[_SFPBRFSimpleItemStandardCardSection alloc] initWithFacade:v330];
      v255 = [(_SFPBCardSection *)v331 value];
      [v255 setRfSimpleItemStandardCardSection:v254];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:212];
      v256 = [[_SFPBRFSummaryItemAlignedTextCardSection alloc] initWithFacade:v330];
      v257 = [(_SFPBCardSection *)v331 value];
      [v257 setRfSummaryItemAlignedTextCardSection:v256];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:213];
      v258 = [[_SFPBRFExpandableStandardCardSection alloc] initWithFacade:v330];
      v259 = [(_SFPBCardSection *)v331 value];
      [v259 setRfExpandableStandardCardSection:v258];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:214];
      v260 = [[_SFPBRFFactItemButtonCardSection alloc] initWithFacade:v330];
      v261 = [(_SFPBCardSection *)v331 value];
      [v261 setRfFactItemButtonCardSection:v260];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:215];
      v262 = [[_SFPBRFFactItemHeroNumberCardSection alloc] initWithFacade:v330];
      v263 = [(_SFPBCardSection *)v331 value];
      [v263 setRfFactItemHeroNumberCardSection:v262];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:216];
      v264 = [[_SFPBRFPrimaryHeaderMarqueeCardSection alloc] initWithFacade:v330];
      v265 = [(_SFPBCardSection *)v331 value];
      [v265 setRfPrimaryHeaderMarqueeCardSection:v264];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:217];
      v266 = [[_SFPBRFSummaryItemDetailedTextCardSection alloc] initWithFacade:v330];
      v267 = [(_SFPBCardSection *)v331 value];
      [v267 setRfSummaryItemDetailedTextCardSection:v266];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:218];
      v268 = [[_SFPBRFSimpleItemPlayerCardSection alloc] initWithFacade:v330];
      v269 = [(_SFPBCardSection *)v331 value];
      [v269 setRfSimpleItemPlayerCardSection:v268];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:219];
      v270 = [[_SFPBRFSummaryItemPairCardSection alloc] initWithFacade:v330];
      v271 = [(_SFPBCardSection *)v331 value];
      [v271 setRfSummaryItemPairCardSection:v270];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:220];
      v272 = [[_SFPBRFSummaryItemPairNumberCardSection alloc] initWithFacade:v330];
      v273 = [(_SFPBCardSection *)v331 value];
      [v273 setRfSummaryItemPairNumberCardSection:v272];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:221];
      v274 = [[_SFPBRFFactItemShortHeroNumberCardSection alloc] initWithFacade:v330];
      v275 = [(_SFPBCardSection *)v331 value];
      [v275 setRfFactItemShortHeroNumberCardSection:v274];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:222];
      v276 = [[_SFPBRFFactItemDetailedNumberCardSection alloc] initWithFacade:v330];
      v277 = [(_SFPBCardSection *)v331 value];
      [v277 setRfFactItemDetailedNumberCardSection:v276];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:223];
      v278 = [[_SFPBRFFactItemHeroButtonCardSection alloc] initWithFacade:v330];
      v279 = [(_SFPBCardSection *)v331 value];
      [v279 setRfFactItemHeroButtonCardSection:v278];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:224];
      v280 = [[_SFPBRFFactItemImageRightCardSection alloc] initWithFacade:v330];
      v281 = [(_SFPBCardSection *)v331 value];
      [v281 setRfFactItemImageRightCardSection:v280];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:225];
      v282 = [[_SFPBRFSummaryItemSwitchV2CardSection alloc] initWithFacade:v330];
      v283 = [(_SFPBCardSection *)v331 value];
      [v283 setRfSummaryItemSwitchV2CardSection:v282];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:226];
      v284 = [[_SFPBRFTableHeaderCardSection alloc] initWithFacade:v330];
      v285 = [(_SFPBCardSection *)v331 value];
      [v285 setRfTableHeaderCardSection:v284];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:227];
      v286 = [[_SFPBRFTableRowCardSection alloc] initWithFacade:v330];
      v287 = [(_SFPBCardSection *)v331 value];
      [v287 setRfTableRowCardSection:v286];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:228];
      v288 = [[_SFPBRFSimpleItemVisualElementCardSection alloc] initWithFacade:v330];
      v289 = [(_SFPBCardSection *)v331 value];
      [v289 setRfSimpleItemVisualElementCardSection:v288];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:229];
      v290 = [[_SFPBRFSummaryItemPlayerCardSection alloc] initWithFacade:v330];
      v291 = [(_SFPBCardSection *)v331 value];
      [v291 setRfSummaryItemPlayerCardSection:v290];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:230];
      v292 = [[_SFPBRFSummaryItemImageRightCardSection alloc] initWithFacade:v330];
      v293 = [(_SFPBCardSection *)v331 value];
      [v293 setRfSummaryItemImageRightCardSection:v292];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:231];
      v294 = [[_SFPBRFSummaryItemButtonCardSection alloc] initWithFacade:v330];
      v295 = [(_SFPBCardSection *)v331 value];
      [v295 setRfSummaryItemButtonCardSection:v294];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:232];
      v296 = [[_SFPBRFSimpleItemReverseRichCardSection alloc] initWithFacade:v330];
      v297 = [(_SFPBCardSection *)v331 value];
      [v297 setRfSimpleItemReverseRichCardSection:v296];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:233];
      v298 = [[_SFPBRFSimpleItemRichSearchResultCardSection alloc] initWithFacade:v330];
      v299 = [(_SFPBCardSection *)v331 value];
      [v299 setRfSimpleItemRichSearchResultCardSection:v298];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:234];
      v300 = [[_SFPBRFPrimaryHeaderStackedImageCardSection alloc] initWithFacade:v330];
      v301 = [(_SFPBCardSection *)v331 value];
      [v301 setRfPrimaryHeaderStackedImageCardSection:v300];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:235];
      v302 = [[_SFPBRFReferenceItemLogoCardSection alloc] initWithFacade:v330];
      v303 = [(_SFPBCardSection *)v331 value];
      [v303 setRfReferenceItemLogoCardSection:v302];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:236];
      v304 = [[_SFPBRFReferenceItemButtonCardSection alloc] initWithFacade:v330];
      v305 = [(_SFPBCardSection *)v331 value];
      [v305 setRfReferenceItemButtonCardSection:v304];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:237];
      v306 = [[_SFPBRFButtonCardSection alloc] initWithFacade:v330];
      v307 = [(_SFPBCardSection *)v331 value];
      [v307 setRfButtonCardSection:v306];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:238];
      v308 = [[_SFPBRFBinaryButtonCardSection alloc] initWithFacade:v330];
      v309 = [(_SFPBCardSection *)v331 value];
      [v309 setRfBinaryButtonCardSection:v308];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:239];
      v310 = [[_SFPBRFReferenceCenteredCardSection alloc] initWithFacade:v330];
      v311 = [(_SFPBCardSection *)v331 value];
      [v311 setRfReferenceCenteredCardSection:v310];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:240];
      v312 = [[_SFPBRFSecondaryHeaderStandardCardSection alloc] initWithFacade:v330];
      v313 = [(_SFPBCardSection *)v331 value];
      [v313 setRfSecondaryHeaderStandardCardSection:v312];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:241];
      v314 = [[_SFPBRFSecondaryHeaderEmphasizedCardSection alloc] initWithFacade:v330];
      v315 = [(_SFPBCardSection *)v331 value];
      [v315 setRfSecondaryHeaderEmphasizedCardSection:v314];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:242];
      v316 = [[_SFPBRFMapCardSection alloc] initWithFacade:v330];
      v317 = [(_SFPBCardSection *)v331 value];
      [v317 setRfMapCardSection:v316];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:243];
      v318 = [[_SFPBRFReferenceStandardCardSection alloc] initWithFacade:v330];
      v319 = [(_SFPBCardSection *)v331 value];
      [v319 setRfReferenceStandardCardSection:v318];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:744];
      v320 = [[_SFPBRFMultiButtonCardSection alloc] initWithFacade:v330];
      v321 = [(_SFPBCardSection *)v331 value];
      [v321 setRfMultiButtonCardSection:v320];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_SFPBCardSection *)v331 setType:745];
      v322 = [[_SFPBRFDisambiguationTitleCardSection alloc] initWithFacade:v330];
      v323 = [(_SFPBCardSection *)v331 value];
      [v323 setRfDisambiguationTitleCardSection:v322];
    }
    v324 = v331;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCommand, 0);
  objc_storeStrong((id *)&self->_emphasisSubjectId, 0);
  objc_storeStrong((id *)&self->_appEntityAnnotation, 0);
  objc_storeStrong((id *)&self->_referencedCommands, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
  objc_storeStrong((id *)&self->_trailingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_previewButtonItemsTitle, 0);
  objc_storeStrong((id *)&self->_cardSectionDetail, 0);
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_previewCommand, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_userReportRequest, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_parameterKeyPaths, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_nextCard, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (int)requiredLevelOfDetail
{
  return self->_requiredLevelOfDetail;
}

- (_SFPBCommand)secondaryCommand
{
  return self->_secondaryCommand;
}

- (int)increasedContrastMode
{
  return self->_increasedContrastMode;
}

- (NSString)emphasisSubjectId
{
  return self->_emphasisSubjectId;
}

- (_SFPBAppEntityAnnotation)appEntityAnnotation
{
  return self->_appEntityAnnotation;
}

- (BOOL)shouldShowInSmartDialog
{
  return self->_shouldShowInSmartDialog;
}

- (BOOL)forceEnable3DTouch
{
  return self->_forceEnable3DTouch;
}

- (NSArray)referencedCommands
{
  return self->_referencedCommands;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (NSArray)trailingSwipeButtonItems
{
  return self->_trailingSwipeButtonItems;
}

- (NSArray)leadingSwipeButtonItems
{
  return self->_leadingSwipeButtonItems;
}

- (BOOL)shouldHideInAmbientMode
{
  return self->_shouldHideInAmbientMode;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)previewButtonItemsTitle
{
  return self->_previewButtonItemsTitle;
}

- (NSString)cardSectionDetail
{
  return self->_cardSectionDetail;
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (_SFPBCommand)previewCommand
{
  return self->_previewCommand;
}

- (_SFPBCommand)command
{
  return self->_command;
}

- (_SFPBUserReportRequest)userReportRequest
{
  return self->_userReportRequest;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (NSArray)parameterKeyPaths
{
  return self->_parameterKeyPaths;
}

- (NSArray)commands
{
  return self->_commands;
}

- (_SFPBCard)nextCard
{
  return self->_nextCard;
}

- (_SFPBCardSectionValue)value
{
  return self->_value;
}

- (int)type
{
  return self->_type;
}

- (_SFPBCardSection)initWithDictionary:(id)a3
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v156.receiver = self;
  v156.super_class = (Class)_SFPBCardSection;
  v5 = [(_SFPBCardSection *)&v156 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setType:](v5, "setType:", [v6 intValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBCardSectionValue alloc] initWithDictionary:v7];
      [(_SFPBCardSection *)v5 setValue:v8];
    }
    v111 = (void *)v7;
    v112 = v6;
    uint64_t v9 = [v4 objectForKeyedSubscript:@"nextCard"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[_SFPBCard alloc] initWithDictionary:v9];
      [(_SFPBCardSection *)v5 setNextCard:v10];
    }
    v110 = (void *)v9;
    id v11 = [v4 objectForKeyedSubscript:@"commands"];
    objc_opt_class();
    v126 = v11;
    if (objc_opt_isKindOfClass())
    {
      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v152 objects:v163 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v153;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v153 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v152 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [[_SFPBAbstractCommand alloc] initWithDictionary:v17];
              [(_SFPBCardSection *)v5 addCommands:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v152 objects:v163 count:16];
        }
        while (v14);
      }
    }
    id v19 = [v4 objectForKeyedSubscript:@"parameterKeyPaths"];
    objc_opt_class();
    v125 = v19;
    if (objc_opt_isKindOfClass())
    {
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v148 objects:v162 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v149;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v149 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v148 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v26 = (void *)[v25 copy];
              [(_SFPBCardSection *)v5 addParameterKeyPaths:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v148 objects:v162 count:16];
        }
        while (v22);
      }
    }
    v27 = [v4 objectForKeyedSubscript:@"cardSectionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[v27 copy];
      [(_SFPBCardSection *)v5 setCardSectionId:v28];
    }
    v29 = [v4 objectForKeyedSubscript:@"resultIdentifier"];
    objc_opt_class();
    v124 = v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [(_SFPBCardSection *)v5 setResultIdentifier:v30];
    }
    v109 = v27;
    uint64_t v31 = [v4 objectForKeyedSubscript:@"userReportRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBUserReportRequest alloc] initWithDictionary:v31];
      [(_SFPBCardSection *)v5 setUserReportRequest:v32];
    }
    v108 = (void *)v31;
    v33 = [v4 objectForKeyedSubscript:@"command"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBCommand alloc] initWithDictionary:v33];
      [(_SFPBCardSection *)v5 setCommand:v34];
    }
    uint64_t v35 = [v4 objectForKeyedSubscript:@"previewCommand"];
    objc_opt_class();
    v123 = (void *)v35;
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBCommand alloc] initWithDictionary:v35];
      [(_SFPBCardSection *)v5 setPreviewCommand:v36];
    }
    v37 = [v4 objectForKeyedSubscript:@"previewButtonItems"];
    objc_opt_class();
    v122 = v37;
    v127 = v4;
    if (objc_opt_isKindOfClass())
    {
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v144 objects:v161 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v145;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v145 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v144 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v44 = [[_SFPBButtonItem alloc] initWithDictionary:v43];
              [(_SFPBCardSection *)v5 addPreviewButtonItems:v44];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v144 objects:v161 count:16];
        }
        while (v40);
      }
    }
    uint64_t v45 = [v4 objectForKeyedSubscript:@"cardSectionDetail"];
    objc_opt_class();
    v121 = v45;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v46 = (void *)[v45 copy];
      [(_SFPBCardSection *)v5 setCardSectionDetail:v46];
    }
    uint64_t v47 = [v4 objectForKeyedSubscript:@"previewButtonItemsTitle"];
    objc_opt_class();
    v120 = v47;
    if (objc_opt_isKindOfClass())
    {
      v48 = (void *)[v47 copy];
      [(_SFPBCardSection *)v5 setPreviewButtonItemsTitle:v48];
    }
    uint64_t v49 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    v119 = (void *)v49;
    if (objc_opt_isKindOfClass())
    {
      v50 = [[_SFPBColor alloc] initWithDictionary:v49];
      [(_SFPBCardSection *)v5 setBackgroundColor:v50];
    }
    v51 = [v4 objectForKeyedSubscript:@"shouldHideInAmbientMode"];
    objc_opt_class();
    v118 = v51;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", [v51 BOOLValue]);
    }
    v52 = [v4 objectForKeyedSubscript:@"leadingSwipeButtonItems"];
    objc_opt_class();
    v117 = v52;
    if (objc_opt_isKindOfClass())
    {
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v53 = v52;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v140 objects:v160 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v141;
        do
        {
          for (uint64_t m = 0; m != v55; ++m)
          {
            if (*(void *)v141 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void *)(*((void *)&v140 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v59 = [[_SFPBButtonItem alloc] initWithDictionary:v58];
              [(_SFPBCardSection *)v5 addLeadingSwipeButtonItems:v59];
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v140 objects:v160 count:16];
        }
        while (v55);
      }
    }
    uint64_t v60 = [v4 objectForKeyedSubscript:@"trailingSwipeButtonItems"];
    objc_opt_class();
    v116 = v60;
    if (objc_opt_isKindOfClass())
    {
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v61 = v60;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v136 objects:v159 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v137;
        do
        {
          for (uint64_t n = 0; n != v63; ++n)
          {
            if (*(void *)v137 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = *(void *)(*((void *)&v136 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v67 = [[_SFPBButtonItem alloc] initWithDictionary:v66];
              [(_SFPBCardSection *)v5 addTrailingSwipeButtonItems:v67];
            }
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v136 objects:v159 count:16];
        }
        while (v63);
      }
    }
    uint64_t v68 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    v115 = v68;
    if (objc_opt_isKindOfClass())
    {
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v69 = v68;
      uint64_t v70 = [v69 countByEnumeratingWithState:&v132 objects:v158 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v133;
        do
        {
          for (iuint64_t i = 0; ii != v71; ++ii)
          {
            if (*(void *)v133 != v72) {
              objc_enumerationMutation(v69);
            }
            uint64_t v74 = *(void *)(*((void *)&v132 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v75 = [[_SFPBPunchout alloc] initWithDictionary:v74];
              [(_SFPBCardSection *)v5 addPunchoutOptions:v75];
            }
          }
          uint64_t v71 = [v69 countByEnumeratingWithState:&v132 objects:v158 count:16];
        }
        while (v71);
      }
    }
    uint64_t v76 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v77 = (void *)[v76 copy];
      [(_SFPBCardSection *)v5 setPunchoutPickerTitle:v77];
    }
    uint64_t v78 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v79 = (void *)[v78 copy];
      [(_SFPBCardSection *)v5 setPunchoutPickerDismissText:v79];
    }
    v80 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v80 BOOLValue]);
    }
    v81 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v114 = v81;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v81 BOOLValue]);
    }
    v82 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v113 = v82;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v82 BOOLValue]);
    }
    v105 = v80;
    v107 = v76;
    v83 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v83 intValue]);
    }
    v104 = v83;
    v106 = v78;
    v84 = [v4 objectForKeyedSubscript:@"referencedCommands"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v85 = v84;
      uint64_t v86 = [v85 countByEnumeratingWithState:&v128 objects:v157 count:16];
      if (v86)
      {
        uint64_t v87 = v86;
        uint64_t v88 = *(void *)v129;
        do
        {
          for (juint64_t j = 0; jj != v87; ++jj)
          {
            if (*(void *)v129 != v88) {
              objc_enumerationMutation(v85);
            }
            uint64_t v90 = *(void *)(*((void *)&v128 + 1) + 8 * jj);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v91 = [[_SFPBCommand alloc] initWithDictionary:v90];
              [(_SFPBCardSection *)v5 addReferencedCommands:v91];
            }
          }
          uint64_t v87 = [v85 countByEnumeratingWithState:&v128 objects:v157 count:16];
        }
        while (v87);
      }

      id v4 = v127;
    }
    v92 = [v4 objectForKeyedSubscript:@"forceEnable3DTouch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", [v92 BOOLValue]);
    }
    v93 = [v4 objectForKeyedSubscript:@"shouldShowInSmartDialog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", [v93 BOOLValue]);
    }
    v94 = [v4 objectForKeyedSubscript:@"appEntityAnnotation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v95 = [[_SFPBAppEntityAnnotation alloc] initWithDictionary:v94];
      [(_SFPBCardSection *)v5 setAppEntityAnnotation:v95];
    }
    v96 = [v4 objectForKeyedSubscript:@"emphasisSubjectId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v97 = (void *)[v96 copy];
      [(_SFPBCardSection *)v5 setEmphasisSubjectId:v97];
    }
    v98 = [v4 objectForKeyedSubscript:@"increasedContrastMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setIncreasedContrastMode:](v5, "setIncreasedContrastMode:", [v98 intValue]);
    }
    v99 = [v4 objectForKeyedSubscript:@"secondaryCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v100 = [[_SFPBCommand alloc] initWithDictionary:v99];
      [(_SFPBCardSection *)v5 setSecondaryCommand:v100];
    }
    v101 = [v127 objectForKeyedSubscript:@"requiredLevelOfDetail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSection setRequiredLevelOfDetail:](v5, "setRequiredLevelOfDetail:", [v101 intValue]);
    }
    v102 = v5;

    id v4 = v127;
  }

  return v5;
}

- (_SFPBCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCardSection *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appEntityAnnotation)
  {
    id v4 = [(_SFPBCardSection *)self appEntityAnnotation];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appEntityAnnotation"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appEntityAnnotation"];
    }
  }
  if (self->_backgroundColor)
  {
    uint64_t v7 = [(_SFPBCardSection *)self backgroundColor];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"backgroundColor"];
    }
  }
  unint64_t v10 = 0x1E4F28000uLL;
  if (self->_canBeHidden)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v11 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_cardSectionDetail)
  {
    id v12 = [(_SFPBCardSection *)self cardSectionDetail];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"cardSectionDetail"];
  }
  if (self->_cardSectionId)
  {
    uint64_t v14 = [(_SFPBCardSection *)self cardSectionId];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"cardSectionId"];
  }
  if (self->_command)
  {
    v16 = [(_SFPBCardSection *)self command];
    uint64_t v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"command"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"command"];
    }
  }
  if ([(NSArray *)self->_commands count])
  {
    id v19 = [MEMORY[0x1E4F1CA48] array];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v20 = self->_commands;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v129 objects:v138 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v130;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v130 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = [*(id *)(*((void *)&v129 + 1) + 8 * i) dictionaryRepresentation];
          if (v25)
          {
            [v19 addObject:v25];
          }
          else
          {
            v26 = [MEMORY[0x1E4F1CA98] null];
            [v19 addObject:v26];
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v129 objects:v138 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"commands"];
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if (self->_emphasisSubjectId)
  {
    v27 = [(_SFPBCardSection *)self emphasisSubjectId];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"emphasisSubjectId"];
  }
  if (self->_forceEnable3DTouch)
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardSection forceEnable3DTouch](self, "forceEnable3DTouch"));
    [v3 setObject:v29 forKeyedSubscript:@"forceEnable3DTouch"];
  }
  if (self->_hasBottomPadding)
  {
    v30 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v30 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v31 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_increasedContrastMode)
  {
    uint64_t v32 = [(_SFPBCardSection *)self increasedContrastMode];
    if (v32 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E5A2F070[v32];
    }
    [v3 setObject:v33 forKeyedSubscript:@"increasedContrastMode"];
  }
  if ([(NSArray *)self->_leadingSwipeButtonItems count])
  {
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v35 = self->_leadingSwipeButtonItems;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v125 objects:v137 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v126;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v126 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = [*(id *)(*((void *)&v125 + 1) + 8 * j) dictionaryRepresentation];
          if (v40)
          {
            [v34 addObject:v40];
          }
          else
          {
            uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
            [v34 addObject:v41];
          }
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v125 objects:v137 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKeyedSubscript:@"leadingSwipeButtonItems"];
    unint64_t v10 = 0x1E4F28000;
  }
  if (self->_nextCard)
  {
    v42 = [(_SFPBCardSection *)self nextCard];
    uint64_t v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"nextCard"];
    }
    else
    {
      v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"nextCard"];
    }
  }
  if (self->_parameterKeyPaths)
  {
    uint64_t v45 = [(_SFPBCardSection *)self parameterKeyPaths];
    uint64_t v46 = (void *)[v45 copy];
    [v3 setObject:v46 forKeyedSubscript:@"parameterKeyPaths"];
  }
  if ([(NSArray *)self->_previewButtonItems count])
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v48 = self->_previewButtonItems;
    uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v121 objects:v136 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v122;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v122 != v51) {
            objc_enumerationMutation(v48);
          }
          id v53 = [*(id *)(*((void *)&v121 + 1) + 8 * k) dictionaryRepresentation];
          if (v53)
          {
            [v47 addObject:v53];
          }
          else
          {
            uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
            [v47 addObject:v54];
          }
        }
        uint64_t v50 = [(NSArray *)v48 countByEnumeratingWithState:&v121 objects:v136 count:16];
      }
      while (v50);
    }

    [v3 setObject:v47 forKeyedSubscript:@"previewButtonItems"];
    unint64_t v10 = 0x1E4F28000;
  }
  if (self->_previewButtonItemsTitle)
  {
    uint64_t v55 = [(_SFPBCardSection *)self previewButtonItemsTitle];
    uint64_t v56 = (void *)[v55 copy];
    [v3 setObject:v56 forKeyedSubscript:@"previewButtonItemsTitle"];
  }
  if (self->_previewCommand)
  {
    v57 = [(_SFPBCardSection *)self previewCommand];
    uint64_t v58 = [v57 dictionaryRepresentation];
    if (v58)
    {
      [v3 setObject:v58 forKeyedSubscript:@"previewCommand"];
    }
    else
    {
      v59 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v59 forKeyedSubscript:@"previewCommand"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA48] array];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v61 = self->_punchoutOptions;
    uint64_t v62 = [(NSArray *)v61 countByEnumeratingWithState:&v117 objects:v135 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v118;
      do
      {
        for (uint64_t m = 0; m != v63; ++m)
        {
          if (*(void *)v118 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = [*(id *)(*((void *)&v117 + 1) + 8 * m) dictionaryRepresentation];
          if (v66)
          {
            [v60 addObject:v66];
          }
          else
          {
            v67 = [MEMORY[0x1E4F1CA98] null];
            [v60 addObject:v67];
          }
        }
        uint64_t v63 = [(NSArray *)v61 countByEnumeratingWithState:&v117 objects:v135 count:16];
      }
      while (v63);
    }

    [v3 setObject:v60 forKeyedSubscript:@"punchoutOptions"];
    unint64_t v10 = 0x1E4F28000;
  }
  if (self->_punchoutPickerDismissText)
  {
    uint64_t v68 = [(_SFPBCardSection *)self punchoutPickerDismissText];
    id v69 = (void *)[v68 copy];
    [v3 setObject:v69 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v70 = [(_SFPBCardSection *)self punchoutPickerTitle];
    uint64_t v71 = (void *)[v70 copy];
    [v3 setObject:v71 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if ([(NSArray *)self->_referencedCommands count])
  {
    uint64_t v72 = [MEMORY[0x1E4F1CA48] array];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    v73 = self->_referencedCommands;
    uint64_t v74 = [(NSArray *)v73 countByEnumeratingWithState:&v113 objects:v134 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v114;
      do
      {
        for (uint64_t n = 0; n != v75; ++n)
        {
          if (*(void *)v114 != v76) {
            objc_enumerationMutation(v73);
          }
          uint64_t v78 = [*(id *)(*((void *)&v113 + 1) + 8 * n) dictionaryRepresentation];
          if (v78)
          {
            [v72 addObject:v78];
          }
          else
          {
            v79 = [MEMORY[0x1E4F1CA98] null];
            [v72 addObject:v79];
          }
        }
        uint64_t v75 = [(NSArray *)v73 countByEnumeratingWithState:&v113 objects:v134 count:16];
      }
      while (v75);
    }

    [v3 setObject:v72 forKeyedSubscript:@"referencedCommands"];
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if (self->_requiredLevelOfDetail)
  {
    uint64_t v80 = [(_SFPBCardSection *)self requiredLevelOfDetail];
    if (v80 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v80);
      v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v81 = off_1E5A2F070[v80];
    }
    [v3 setObject:v81 forKeyedSubscript:@"requiredLevelOfDetail"];
  }
  if (self->_resultIdentifier)
  {
    v82 = [(_SFPBCardSection *)self resultIdentifier];
    v83 = (void *)[v82 copy];
    [v3 setObject:v83 forKeyedSubscript:@"resultIdentifier"];
  }
  if (self->_secondaryCommand)
  {
    v84 = [(_SFPBCardSection *)self secondaryCommand];
    id v85 = [v84 dictionaryRepresentation];
    if (v85)
    {
      [v3 setObject:v85 forKeyedSubscript:@"secondaryCommand"];
    }
    else
    {
      uint64_t v86 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v86 forKeyedSubscript:@"secondaryCommand"];
    }
  }
  if (self->_separatorStyle)
  {
    uint64_t v87 = [(_SFPBCardSection *)self separatorStyle];
    if (v87 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v87);
      uint64_t v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v88 = off_1E5A2F090[v87];
    }
    [v3 setObject:v88 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_shouldHideInAmbientMode)
  {
    uint64_t v89 = objc_msgSend(*(id *)(v10 + 3792), "numberWithBool:", -[_SFPBCardSection shouldHideInAmbientMode](self, "shouldHideInAmbientMode"));
    [v3 setObject:v89 forKeyedSubscript:@"shouldHideInAmbientMode"];
  }
  if (self->_shouldShowInSmartDialog)
  {
    uint64_t v90 = objc_msgSend(*(id *)(v10 + 3792), "numberWithBool:", -[_SFPBCardSection shouldShowInSmartDialog](self, "shouldShowInSmartDialog"));
    [v3 setObject:v90 forKeyedSubscript:@"shouldShowInSmartDialog"];
  }
  if ([(NSArray *)self->_trailingSwipeButtonItems count])
  {
    v91 = [MEMORY[0x1E4F1CA48] array];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v92 = self->_trailingSwipeButtonItems;
    uint64_t v93 = [(NSArray *)v92 countByEnumeratingWithState:&v109 objects:v133 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v110;
      do
      {
        for (iuint64_t i = 0; ii != v94; ++ii)
        {
          if (*(void *)v110 != v95) {
            objc_enumerationMutation(v92);
          }
          v97 = [*(id *)(*((void *)&v109 + 1) + 8 * ii) dictionaryRepresentation];
          if (v97)
          {
            [v91 addObject:v97];
          }
          else
          {
            v98 = [MEMORY[0x1E4F1CA98] null];
            [v91 addObject:v98];
          }
        }
        uint64_t v94 = [(NSArray *)v92 countByEnumeratingWithState:&v109 objects:v133 count:16];
      }
      while (v94);
    }

    [v3 setObject:v91 forKeyedSubscript:@"trailingSwipeButtonItems"];
  }
  if (self->_type)
  {
    uint64_t v99 = [(_SFPBCardSection *)self type];
    v100 = @"0";
    switch((int)v99)
    {
      case 0:
        break;
      case 1:
        v100 = @"1";
        break;
      case 2:
        v100 = @"2";
        break;
      case 3:
        v100 = @"3";
        break;
      case 4:
        v100 = @"4";
        break;
      case 5:
        v100 = @"5";
        break;
      case 6:
        v100 = @"6";
        break;
      case 7:
        v100 = @"7";
        break;
      case 8:
        v100 = @"8";
        break;
      case 9:
        v100 = @"9";
        break;
      case 10:
        v100 = @"10";
        break;
      case 11:
        v100 = @"11";
        break;
      case 12:
        v100 = @"12";
        break;
      case 13:
        v100 = @"13";
        break;
      case 14:
        v100 = @"14";
        break;
      case 15:
        v100 = @"15";
        break;
      case 16:
        v100 = @"16";
        break;
      case 17:
        v100 = @"17";
        break;
      case 18:
        v100 = @"18";
        break;
      case 19:
        v100 = @"19";
        break;
      case 20:
        v100 = @"20";
        break;
      case 21:
        v100 = @"21";
        break;
      case 22:
        v100 = @"22";
        break;
      case 23:
        v100 = @"23";
        break;
      case 24:
        v100 = @"24";
        break;
      case 25:
        v100 = @"25";
        break;
      case 26:
        v100 = @"26";
        break;
      case 27:
        v100 = @"27";
        break;
      case 28:
        v100 = @"28";
        break;
      case 29:
        v100 = @"29";
        break;
      case 30:
        v100 = @"30";
        break;
      case 31:
        v100 = @"31";
        break;
      case 32:
        v100 = @"32";
        break;
      case 33:
        v100 = @"33";
        break;
      case 34:
        v100 = @"34";
        break;
      case 35:
        v100 = @"35";
        break;
      case 36:
        v100 = @"36";
        break;
      case 37:
        v100 = @"37";
        break;
      case 38:
        v100 = @"38";
        break;
      case 39:
        v100 = @"39";
        break;
      case 40:
        v100 = @"40";
        break;
      case 41:
        v100 = @"41";
        break;
      case 42:
        v100 = @"42";
        break;
      case 43:
        v100 = @"43";
        break;
      case 44:
        v100 = @"44";
        break;
      case 45:
        v100 = @"45";
        break;
      case 46:
        v100 = @"46";
        break;
      case 47:
        v100 = @"47";
        break;
      case 48:
        v100 = @"48";
        break;
      case 49:
        v100 = @"49";
        break;
      case 50:
        v100 = @"50";
        break;
      case 51:
        v100 = @"51";
        break;
      case 52:
        v100 = @"52";
        break;
      case 53:
        v100 = @"53";
        break;
      case 54:
        v100 = @"54";
        break;
      case 55:
        v100 = @"55";
        break;
      case 56:
        v100 = @"56";
        break;
      case 57:
        v100 = @"57";
        break;
      case 58:
        v100 = @"58";
        break;
      case 59:
        v100 = @"59";
        break;
      case 60:
        v100 = @"60";
        break;
      case 61:
        v100 = @"61";
        break;
      case 63:
        v100 = @"63";
        break;
      case 64:
        v100 = @"64";
        break;
      case 200:
        v100 = @"200";
        break;
      case 201:
        v100 = @"201";
        break;
      case 202:
        v100 = @"202";
        break;
      case 203:
        v100 = @"203";
        break;
      case 204:
        v100 = @"204";
        break;
      case 205:
        v100 = @"205";
        break;
      case 206:
        v100 = @"206";
        break;
      case 207:
        v100 = @"207";
        break;
      case 208:
        v100 = @"208";
        break;
      case 209:
        v100 = @"209";
        break;
      case 210:
        v100 = @"210";
        break;
      case 211:
        v100 = @"211";
        break;
      case 212:
        v100 = @"212";
        break;
      case 213:
        v100 = @"213";
        break;
      case 214:
        v100 = @"214";
        break;
      case 215:
        v100 = @"215";
        break;
      case 216:
        v100 = @"216";
        break;
      case 217:
        v100 = @"217";
        break;
      case 218:
        v100 = @"218";
        break;
      case 219:
        v100 = @"219";
        break;
      case 220:
        v100 = @"220";
        break;
      case 221:
        v100 = @"221";
        break;
      case 222:
        v100 = @"222";
        break;
      case 223:
        v100 = @"223";
        break;
      case 224:
        v100 = @"224";
        break;
      case 225:
        v100 = @"225";
        break;
      case 226:
        v100 = @"226";
        break;
      case 227:
        v100 = @"227";
        break;
      case 228:
        v100 = @"228";
        break;
      case 229:
        v100 = @"229";
        break;
      case 230:
        v100 = @"230";
        break;
      case 231:
        v100 = @"231";
        break;
      case 232:
        v100 = @"232";
        break;
      case 233:
        v100 = @"233";
        break;
      case 234:
        v100 = @"234";
        break;
      case 235:
        v100 = @"235";
        break;
      case 236:
        v100 = @"236";
        break;
      case 237:
        v100 = @"237";
        break;
      case 238:
        v100 = @"238";
        break;
      case 239:
        v100 = @"239";
        break;
      case 240:
        v100 = @"240";
        break;
      case 241:
        v100 = @"241";
        break;
      case 242:
        v100 = @"242";
        break;
      case 243:
        v100 = @"243";
        break;
      case 244:
        v100 = @"244";
        break;
      case 245:
        v100 = @"245";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v99);
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v3 setObject:v100 forKeyedSubscript:@"type"];
  }
  if (self->_userReportRequest)
  {
    v101 = [(_SFPBCardSection *)self userReportRequest];
    v102 = [v101 dictionaryRepresentation];
    if (v102)
    {
      [v3 setObject:v102 forKeyedSubscript:@"userReportRequest"];
    }
    else
    {
      v103 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v103 forKeyedSubscript:@"userReportRequest"];
    }
  }
  if (self->_value)
  {
    v104 = [(_SFPBCardSection *)self value];
    v105 = [v104 dictionaryRepresentation];
    if (v105)
    {
      [v3 setObject:v105 forKeyedSubscript:@"value"];
    }
    else
    {
      v106 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v106 forKeyedSubscript:@"value"];
    }
  }
  id v107 = v3;

  return v107;
}

- (unint64_t)hash
{
  uint64_t v38 = 2654435761 * self->_type;
  unint64_t v37 = [(_SFPBCardSectionValue *)self->_value hash];
  unint64_t v36 = [(_SFPBCard *)self->_nextCard hash];
  uint64_t v35 = [(NSArray *)self->_commands hash];
  uint64_t v34 = [(NSArray *)self->_parameterKeyPaths hash];
  NSUInteger v33 = [(NSString *)self->_cardSectionId hash];
  NSUInteger v32 = [(NSString *)self->_resultIdentifier hash];
  unint64_t v31 = [(_SFPBUserReportRequest *)self->_userReportRequest hash];
  unint64_t v30 = [(_SFPBCommand *)self->_command hash];
  unint64_t v29 = [(_SFPBCommand *)self->_previewCommand hash];
  uint64_t v28 = [(NSArray *)self->_previewButtonItems hash];
  NSUInteger v27 = [(NSString *)self->_cardSectionDetail hash];
  NSUInteger v26 = [(NSString *)self->_previewButtonItemsTitle hash];
  unint64_t v3 = [(_SFPBColor *)self->_backgroundColor hash];
  if (self->_shouldHideInAmbientMode) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v24 = v4;
  unint64_t v25 = v3;
  uint64_t v23 = [(NSArray *)self->_leadingSwipeButtonItems hash];
  uint64_t v22 = [(NSArray *)self->_trailingSwipeButtonItems hash];
  uint64_t v21 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v20 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v5 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v18 = v6;
  NSUInteger v19 = v5;
  if (self->_hasTopPadding) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v17 = v7;
  if (self->_hasBottomPadding) {
    uint64_t v8 = 2654435761;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = 2654435761 * self->_separatorStyle;
  uint64_t v10 = [(NSArray *)self->_referencedCommands hash];
  if (self->_forceEnable3DTouch) {
    uint64_t v11 = 2654435761;
  }
  else {
    uint64_t v11 = 0;
  }
  if (self->_shouldShowInSmartDialog) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = [(_SFPBAppEntityAnnotation *)self->_appEntityAnnotation hash];
  NSUInteger v14 = [(NSString *)self->_emphasisSubjectId hash];
  uint64_t v15 = 2654435761 * self->_increasedContrastMode;
  return v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v38 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(_SFPBCommand *)self->_secondaryCommand hash] ^ (2654435761 * self->_requiredLevelOfDetail);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_121;
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_121;
  }
  uint64_t v6 = [(_SFPBCardSection *)self value];
  uint64_t v7 = [v4 value];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v8 = [(_SFPBCardSection *)self value];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(_SFPBCardSection *)self value];
    uint64_t v11 = [v4 value];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self nextCard];
  uint64_t v7 = [v4 nextCard];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v13 = [(_SFPBCardSection *)self nextCard];
  if (v13)
  {
    NSUInteger v14 = (void *)v13;
    uint64_t v15 = [(_SFPBCardSection *)self nextCard];
    v16 = [v4 nextCard];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self commands];
  uint64_t v7 = [v4 commands];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v18 = [(_SFPBCardSection *)self commands];
  if (v18)
  {
    NSUInteger v19 = (void *)v18;
    NSUInteger v20 = [(_SFPBCardSection *)self commands];
    uint64_t v21 = [v4 commands];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self parameterKeyPaths];
  uint64_t v7 = [v4 parameterKeyPaths];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v23 = [(_SFPBCardSection *)self parameterKeyPaths];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    unint64_t v25 = [(_SFPBCardSection *)self parameterKeyPaths];
    NSUInteger v26 = [v4 parameterKeyPaths];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self cardSectionId];
  uint64_t v7 = [v4 cardSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v28 = [(_SFPBCardSection *)self cardSectionId];
  if (v28)
  {
    unint64_t v29 = (void *)v28;
    unint64_t v30 = [(_SFPBCardSection *)self cardSectionId];
    unint64_t v31 = [v4 cardSectionId];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self resultIdentifier];
  uint64_t v7 = [v4 resultIdentifier];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v33 = [(_SFPBCardSection *)self resultIdentifier];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    uint64_t v35 = [(_SFPBCardSection *)self resultIdentifier];
    unint64_t v36 = [v4 resultIdentifier];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self userReportRequest];
  uint64_t v7 = [v4 userReportRequest];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v38 = [(_SFPBCardSection *)self userReportRequest];
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    uint64_t v40 = [(_SFPBCardSection *)self userReportRequest];
    uint64_t v41 = [v4 userReportRequest];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self command];
  uint64_t v7 = [v4 command];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v43 = [(_SFPBCardSection *)self command];
  if (v43)
  {
    v44 = (void *)v43;
    uint64_t v45 = [(_SFPBCardSection *)self command];
    uint64_t v46 = [v4 command];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self previewCommand];
  uint64_t v7 = [v4 previewCommand];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v48 = [(_SFPBCardSection *)self previewCommand];
  if (v48)
  {
    uint64_t v49 = (void *)v48;
    uint64_t v50 = [(_SFPBCardSection *)self previewCommand];
    uint64_t v51 = [v4 previewCommand];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self previewButtonItems];
  uint64_t v7 = [v4 previewButtonItems];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v53 = [(_SFPBCardSection *)self previewButtonItems];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    uint64_t v55 = [(_SFPBCardSection *)self previewButtonItems];
    uint64_t v56 = [v4 previewButtonItems];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self cardSectionDetail];
  uint64_t v7 = [v4 cardSectionDetail];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v58 = [(_SFPBCardSection *)self cardSectionDetail];
  if (v58)
  {
    v59 = (void *)v58;
    uint64_t v60 = [(_SFPBCardSection *)self cardSectionDetail];
    id v61 = [v4 cardSectionDetail];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self previewButtonItemsTitle];
  uint64_t v7 = [v4 previewButtonItemsTitle];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v63 = [(_SFPBCardSection *)self previewButtonItemsTitle];
  if (v63)
  {
    uint64_t v64 = (void *)v63;
    v65 = [(_SFPBCardSection *)self previewButtonItemsTitle];
    uint64_t v66 = [v4 previewButtonItemsTitle];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self backgroundColor];
  uint64_t v7 = [v4 backgroundColor];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v68 = [(_SFPBCardSection *)self backgroundColor];
  if (v68)
  {
    id v69 = (void *)v68;
    uint64_t v70 = [(_SFPBCardSection *)self backgroundColor];
    uint64_t v71 = [v4 backgroundColor];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  int shouldHideInAmbientMode = self->_shouldHideInAmbientMode;
  if (shouldHideInAmbientMode != [v4 shouldHideInAmbientMode]) {
    goto LABEL_121;
  }
  uint64_t v6 = [(_SFPBCardSection *)self leadingSwipeButtonItems];
  uint64_t v7 = [v4 leadingSwipeButtonItems];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v74 = [(_SFPBCardSection *)self leadingSwipeButtonItems];
  if (v74)
  {
    uint64_t v75 = (void *)v74;
    uint64_t v76 = [(_SFPBCardSection *)self leadingSwipeButtonItems];
    uint64_t v77 = [v4 leadingSwipeButtonItems];
    int v78 = [v76 isEqual:v77];

    if (!v78) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self trailingSwipeButtonItems];
  uint64_t v7 = [v4 trailingSwipeButtonItems];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v79 = [(_SFPBCardSection *)self trailingSwipeButtonItems];
  if (v79)
  {
    uint64_t v80 = (void *)v79;
    v81 = [(_SFPBCardSection *)self trailingSwipeButtonItems];
    v82 = [v4 trailingSwipeButtonItems];
    int v83 = [v81 isEqual:v82];

    if (!v83) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self punchoutOptions];
  uint64_t v7 = [v4 punchoutOptions];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v84 = [(_SFPBCardSection *)self punchoutOptions];
  if (v84)
  {
    id v85 = (void *)v84;
    uint64_t v86 = [(_SFPBCardSection *)self punchoutOptions];
    uint64_t v87 = [v4 punchoutOptions];
    int v88 = [v86 isEqual:v87];

    if (!v88) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self punchoutPickerTitle];
  uint64_t v7 = [v4 punchoutPickerTitle];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v89 = [(_SFPBCardSection *)self punchoutPickerTitle];
  if (v89)
  {
    uint64_t v90 = (void *)v89;
    v91 = [(_SFPBCardSection *)self punchoutPickerTitle];
    v92 = [v4 punchoutPickerTitle];
    int v93 = [v91 isEqual:v92];

    if (!v93) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self punchoutPickerDismissText];
  uint64_t v7 = [v4 punchoutPickerDismissText];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v94 = [(_SFPBCardSection *)self punchoutPickerDismissText];
  if (v94)
  {
    uint64_t v95 = (void *)v94;
    v96 = [(_SFPBCardSection *)self punchoutPickerDismissText];
    v97 = [v4 punchoutPickerDismissText];
    int v98 = [v96 isEqual:v97];

    if (!v98) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  canBeHiddeuint64_t n = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_121;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_121;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_121;
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_121;
  }
  uint64_t v6 = [(_SFPBCardSection *)self referencedCommands];
  uint64_t v7 = [v4 referencedCommands];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v103 = [(_SFPBCardSection *)self referencedCommands];
  if (v103)
  {
    v104 = (void *)v103;
    v105 = [(_SFPBCardSection *)self referencedCommands];
    v106 = [v4 referencedCommands];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  int forceEnable3DTouch = self->_forceEnable3DTouch;
  if (forceEnable3DTouch != [v4 forceEnable3DTouch]) {
    goto LABEL_121;
  }
  int shouldShowInSmartDialog = self->_shouldShowInSmartDialog;
  if (shouldShowInSmartDialog != [v4 shouldShowInSmartDialog]) {
    goto LABEL_121;
  }
  uint64_t v6 = [(_SFPBCardSection *)self appEntityAnnotation];
  uint64_t v7 = [v4 appEntityAnnotation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v110 = [(_SFPBCardSection *)self appEntityAnnotation];
  if (v110)
  {
    long long v111 = (void *)v110;
    long long v112 = [(_SFPBCardSection *)self appEntityAnnotation];
    long long v113 = [v4 appEntityAnnotation];
    int v114 = [v112 isEqual:v113];

    if (!v114) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSection *)self emphasisSubjectId];
  uint64_t v7 = [v4 emphasisSubjectId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_120;
  }
  uint64_t v115 = [(_SFPBCardSection *)self emphasisSubjectId];
  if (v115)
  {
    long long v116 = (void *)v115;
    long long v117 = [(_SFPBCardSection *)self emphasisSubjectId];
    long long v118 = [v4 emphasisSubjectId];
    int v119 = [v117 isEqual:v118];

    if (!v119) {
      goto LABEL_121;
    }
  }
  else
  {
  }
  int increasedContrastMode = self->_increasedContrastMode;
  if (increasedContrastMode != [v4 increasedContrastMode]) {
    goto LABEL_121;
  }
  uint64_t v6 = [(_SFPBCardSection *)self secondaryCommand];
  uint64_t v7 = [v4 secondaryCommand];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_120:

    goto LABEL_121;
  }
  uint64_t v121 = [(_SFPBCardSection *)self secondaryCommand];
  if (!v121)
  {

LABEL_124:
    int requiredLevelOfDetail = self->_requiredLevelOfDetail;
    BOOL v126 = requiredLevelOfDetail == [v4 requiredLevelOfDetail];
    goto LABEL_122;
  }
  long long v122 = (void *)v121;
  long long v123 = [(_SFPBCardSection *)self secondaryCommand];
  long long v124 = [v4 secondaryCommand];
  int v125 = [v123 isEqual:v124];

  if (v125) {
    goto LABEL_124;
  }
LABEL_121:
  BOOL v126 = 0;
LABEL_122:

  return v126;
}

- (void)writeTo:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_SFPBCardSection *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(_SFPBCardSection *)self value];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBCardSection *)self nextCard];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  [(_SFPBCardSection *)self commands];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v80;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v80 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v79 objects:v89 count:16];
    }
    while (v9);
  }

  [(_SFPBCardSection *)self parameterKeyPaths];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v75 objects:v88 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v76;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v76 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v75 objects:v88 count:16];
    }
    while (v14);
  }

  int v17 = [(_SFPBCardSection *)self cardSectionId];
  if (v17) {
    PBDataWriterWriteStringField();
  }

  uint64_t v18 = [(_SFPBCardSection *)self resultIdentifier];
  if (v18) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v19 = [(_SFPBCardSection *)self userReportRequest];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v20 = [(_SFPBCardSection *)self command];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v21 = [(_SFPBCardSection *)self previewCommand];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  [(_SFPBCardSection *)self previewButtonItems];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v72;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v72 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v71 objects:v87 count:16];
    }
    while (v24);
  }

  int v27 = [(_SFPBCardSection *)self cardSectionDetail];
  if (v27) {
    PBDataWriterWriteStringField();
  }

  uint64_t v28 = [(_SFPBCardSection *)self previewButtonItemsTitle];
  if (v28) {
    PBDataWriterWriteStringField();
  }

  unint64_t v29 = [(_SFPBCardSection *)self backgroundColor];
  if (v29) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBCardSection *)self shouldHideInAmbientMode]) {
    PBDataWriterWriteBOOLField();
  }
  [(_SFPBCardSection *)self leadingSwipeButtonItems];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v86 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v68;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v68 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v67 objects:v86 count:16];
    }
    while (v32);
  }

  [(_SFPBCardSection *)self trailingSwipeButtonItems];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v85 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v64;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v64 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v63 objects:v85 count:16];
    }
    while (v37);
  }

  [(_SFPBCardSection *)self punchoutOptions];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v84 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v60;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v60 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v59 objects:v84 count:16];
    }
    while (v42);
  }

  uint64_t v45 = [(_SFPBCardSection *)self punchoutPickerTitle];
  if (v45) {
    PBDataWriterWriteStringField();
  }

  uint64_t v46 = [(_SFPBCardSection *)self punchoutPickerDismissText];
  if (v46) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBCardSection *)self referencedCommands];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = [v47 countByEnumeratingWithState:&v55 objects:v83 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v56;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v56 != v50) {
          objc_enumerationMutation(v47);
        }
        PBDataWriterWriteSubmessage();
        ++v51;
      }
      while (v49 != v51);
      uint64_t v49 = [v47 countByEnumeratingWithState:&v55 objects:v83 count:16];
    }
    while (v49);
  }

  if ([(_SFPBCardSection *)self forceEnable3DTouch]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCardSection *)self shouldShowInSmartDialog]) {
    PBDataWriterWriteBOOLField();
  }
  int v52 = [(_SFPBCardSection *)self appEntityAnnotation];
  if (v52) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v53 = [(_SFPBCardSection *)self emphasisSubjectId];
  if (v53) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCardSection *)self increasedContrastMode]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v54 = [(_SFPBCardSection *)self secondaryCommand];
  if (v54) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBCardSection *)self requiredLevelOfDetail]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setRequiredLevelOfDetail:(int)a3
{
  self->_int requiredLevelOfDetail = a3;
}

- (void)setSecondaryCommand:(id)a3
{
}

- (void)setIncreasedContrastMode:(int)a3
{
  self->_int increasedContrastMode = a3;
}

- (void)setEmphasisSubjectId:(id)a3
{
  self->_emphasisSubjectId = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAppEntityAnnotation:(id)a3
{
}

- (void)setShouldShowInSmartDialog:(BOOL)a3
{
  self->_int shouldShowInSmartDialog = a3;
}

- (void)setForceEnable3DTouch:(BOOL)a3
{
  self->_int forceEnable3DTouch = a3;
}

- (id)referencedCommandsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_referencedCommands objectAtIndexedSubscript:a3];
}

- (unint64_t)referencedCommandsCount
{
  return [(NSArray *)self->_referencedCommands count];
}

- (void)addReferencedCommands:(id)a3
{
  id v4 = a3;
  referencedCommands = self->_referencedCommands;
  id v8 = v4;
  if (!referencedCommands)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_referencedCommands;
    self->_referencedCommands = v6;

    id v4 = v8;
    referencedCommands = self->_referencedCommands;
  }
  [(NSArray *)referencedCommands addObject:v4];
}

- (void)clearReferencedCommands
{
}

- (void)setReferencedCommands:(id)a3
{
  self->_referencedCommands = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSeparatorStyle:(int)a3
{
  self->_int separatorStyle = a3;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_int hasBottomPadding = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_int hasTopPadding = a3;
}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_canBeHiddeuint64_t n = a3;
}

- (void)setPunchoutPickerDismissText:(id)a3
{
  self->_punchoutPickerDismissText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPunchoutPickerTitle:(id)a3
{
  self->_punchoutPickerTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_punchoutOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)punchoutOptionsCount
{
  return [(NSArray *)self->_punchoutOptions count];
}

- (void)addPunchoutOptions:(id)a3
{
  id v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  id v8 = v4;
  if (!punchoutOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    id v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  [(NSArray *)punchoutOptions addObject:v4];
}

- (void)clearPunchoutOptions
{
}

- (void)setPunchoutOptions:(id)a3
{
  self->_punchoutOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)trailingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_trailingSwipeButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)trailingSwipeButtonItemsCount
{
  return [(NSArray *)self->_trailingSwipeButtonItems count];
}

- (void)addTrailingSwipeButtonItems:(id)a3
{
  id v4 = a3;
  trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  id v8 = v4;
  if (!trailingSwipeButtonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_trailingSwipeButtonItems;
    self->_trailingSwipeButtonItems = v6;

    id v4 = v8;
    trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  }
  [(NSArray *)trailingSwipeButtonItems addObject:v4];
}

- (void)clearTrailingSwipeButtonItems
{
}

- (void)setTrailingSwipeButtonItems:(id)a3
{
  self->_trailingSwipeButtonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)leadingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_leadingSwipeButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)leadingSwipeButtonItemsCount
{
  return [(NSArray *)self->_leadingSwipeButtonItems count];
}

- (void)addLeadingSwipeButtonItems:(id)a3
{
  id v4 = a3;
  leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  id v8 = v4;
  if (!leadingSwipeButtonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_leadingSwipeButtonItems;
    self->_leadingSwipeButtonItems = v6;

    id v4 = v8;
    leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  }
  [(NSArray *)leadingSwipeButtonItems addObject:v4];
}

- (void)clearLeadingSwipeButtonItems
{
}

- (void)setLeadingSwipeButtonItems:(id)a3
{
  self->_leadingSwipeButtonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setShouldHideInAmbientMode:(BOOL)a3
{
  self->_int shouldHideInAmbientMode = a3;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setPreviewButtonItemsTitle:(id)a3
{
  self->_previewButtonItemsTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCardSectionDetail:(id)a3
{
  self->_cardSectionDetail = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)previewButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_previewButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)previewButtonItemsCount
{
  return [(NSArray *)self->_previewButtonItems count];
}

- (void)addPreviewButtonItems:(id)a3
{
  id v4 = a3;
  previewButtonItems = self->_previewButtonItems;
  id v8 = v4;
  if (!previewButtonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_previewButtonItems;
    self->_previewButtonItems = v6;

    id v4 = v8;
    previewButtonItems = self->_previewButtonItems;
  }
  [(NSArray *)previewButtonItems addObject:v4];
}

- (void)clearPreviewButtonItems
{
}

- (void)setPreviewButtonItems:(id)a3
{
  self->_previewButtonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPreviewCommand:(id)a3
{
}

- (void)setCommand:(id)a3
{
}

- (void)setUserReportRequest:(id)a3
{
}

- (void)setResultIdentifier:(id)a3
{
  self->_resultIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCardSectionId:(id)a3
{
  self->_cardSectionId = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)parameterKeyPathsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parameterKeyPaths objectAtIndexedSubscript:a3];
}

- (unint64_t)parameterKeyPathsCount
{
  return [(NSArray *)self->_parameterKeyPaths count];
}

- (void)addParameterKeyPaths:(id)a3
{
  id v4 = a3;
  parameterKeyPaths = self->_parameterKeyPaths;
  id v8 = v4;
  if (!parameterKeyPaths)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_parameterKeyPaths;
    self->_parameterKeyPaths = v6;

    id v4 = v8;
    parameterKeyPaths = self->_parameterKeyPaths;
  }
  [(NSArray *)parameterKeyPaths addObject:v4];
}

- (void)clearParameterKeyPaths
{
}

- (void)setParameterKeyPaths:(id)a3
{
  self->_parameterKeyPaths = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)commandsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_commands objectAtIndexedSubscript:a3];
}

- (unint64_t)commandsCount
{
  return [(NSArray *)self->_commands count];
}

- (void)addCommands:(id)a3
{
  id v4 = a3;
  commands = self->_commands;
  id v8 = v4;
  if (!commands)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_commands;
    self->_commands = v6;

    id v4 = v8;
    commands = self->_commands;
  }
  [(NSArray *)commands addObject:v4];
}

- (void)clearCommands
{
}

- (void)setCommands:(id)a3
{
  self->_commands = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setNextCard:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

@end