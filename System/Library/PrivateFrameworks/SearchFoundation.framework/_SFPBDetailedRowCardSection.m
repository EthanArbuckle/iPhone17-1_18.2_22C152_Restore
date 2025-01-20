@interface _SFPBDetailedRowCardSection
- (BOOL)buttonItemsAreTrailing;
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecondaryTitleDetached;
- (BOOL)preventThumbnailImageScaling;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldUseCompactDisplay;
- (NSArray)buttonItems;
- (NSArray)descriptions;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBActionItem)action;
- (_SFPBButton)button;
- (_SFPBColor)backgroundColor;
- (_SFPBDetailedRowCardSection)initWithDictionary:(id)a3;
- (_SFPBDetailedRowCardSection)initWithFacade:(id)a3;
- (_SFPBDetailedRowCardSection)initWithJSON:(id)a3;
- (_SFPBFormattedText)secondaryTitle;
- (_SFPBFormattedText)trailingBottomText;
- (_SFPBFormattedText)trailingMiddleText;
- (_SFPBFormattedText)trailingTopText;
- (_SFPBImage)secondaryTitleImage;
- (_SFPBImage)thumbnail;
- (_SFPBImage)trailingThumbnail;
- (_SFPBRichText)footnote;
- (_SFPBRichText)richTrailingBottomText;
- (_SFPBRichText)richTrailingMiddleText;
- (_SFPBRichText)richTrailingTopText;
- (_SFPBRichText)title;
- (_SFPBRichText)topText;
- (id)buttonItemsAtIndex:(unint64_t)a3;
- (id)descriptionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)buttonItemsCount;
- (unint64_t)descriptionsCount;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addButtonItems:(id)a3;
- (void)addDescriptions:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearButtonItems;
- (void)clearDescriptions;
- (void)clearPunchoutOptions;
- (void)setAction:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setButtonItemsAreTrailing:(BOOL)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setDescriptions:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIsSecondaryTitleDetached:(BOOL)a3;
- (void)setPreventThumbnailImageScaling:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setRichTrailingBottomText:(id)a3;
- (void)setRichTrailingMiddleText:(id)a3;
- (void)setRichTrailingTopText:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleImage:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setShouldUseCompactDisplay:(BOOL)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopText:(id)a3;
- (void)setTrailingBottomText:(id)a3;
- (void)setTrailingMiddleText:(id)a3;
- (void)setTrailingThumbnail:(id)a3;
- (void)setTrailingTopText:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBDetailedRowCardSection

- (_SFPBDetailedRowCardSection)initWithFacade:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBDetailedRowCardSection *)self init];

  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v7 = 0;
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v112 objects:v118 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v113 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v112 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v112 objects:v118 count:16];
      }
      while (v10);
    }

    [(_SFPBDetailedRowCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBDetailedRowCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBDetailedRowCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBDetailedRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBDetailedRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBDetailedRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBDetailedRowCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBDetailedRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBDetailedRowCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 thumbnail];

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      v26 = [v4 thumbnail];
      v27 = [(_SFPBImage *)v25 initWithFacade:v26];
      [(_SFPBDetailedRowCardSection *)v5 setThumbnail:v27];
    }
    if ([v4 hasPreventThumbnailImageScaling]) {
      -[_SFPBDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", [v4 preventThumbnailImageScaling]);
    }
    v28 = [v4 title];

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      v30 = [v4 title];
      v31 = [(_SFPBRichText *)v29 initWithFacade:v30];
      [(_SFPBDetailedRowCardSection *)v5 setTitle:v31];
    }
    v32 = [v4 secondaryTitle];

    if (v32)
    {
      v33 = [_SFPBFormattedText alloc];
      v34 = [v4 secondaryTitle];
      v35 = [(_SFPBFormattedText *)v33 initWithFacade:v34];
      [(_SFPBDetailedRowCardSection *)v5 setSecondaryTitle:v35];
    }
    v36 = [v4 secondaryTitleImage];

    if (v36)
    {
      v37 = [_SFPBImage alloc];
      v38 = [v4 secondaryTitleImage];
      v39 = [(_SFPBImage *)v37 initWithFacade:v38];
      [(_SFPBDetailedRowCardSection *)v5 setSecondaryTitleImage:v39];
    }
    if ([v4 hasIsSecondaryTitleDetached]) {
      -[_SFPBDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", [v4 isSecondaryTitleDetached]);
    }
    v40 = [v4 descriptions];
    if (v40)
    {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v41 = 0;
    }

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v103 = v4;
    v42 = [v4 descriptions];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v108 objects:v117 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v109;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v109 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [[_SFPBRichText alloc] initWithFacade:*(void *)(*((void *)&v108 + 1) + 8 * j)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v108 objects:v117 count:16];
      }
      while (v44);
    }

    [(_SFPBDetailedRowCardSection *)v5 setDescriptions:v41];
    v48 = [v103 footnote];

    if (v48)
    {
      v49 = [_SFPBRichText alloc];
      v50 = [v103 footnote];
      v51 = [(_SFPBRichText *)v49 initWithFacade:v50];
      [(_SFPBDetailedRowCardSection *)v5 setFootnote:v51];
    }
    v52 = [v103 trailingTopText];

    if (v52)
    {
      v53 = [_SFPBFormattedText alloc];
      v54 = [v103 trailingTopText];
      v55 = [(_SFPBFormattedText *)v53 initWithFacade:v54];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingTopText:v55];
    }
    v56 = [v103 trailingMiddleText];

    if (v56)
    {
      v57 = [_SFPBFormattedText alloc];
      v58 = [v103 trailingMiddleText];
      v59 = [(_SFPBFormattedText *)v57 initWithFacade:v58];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingMiddleText:v59];
    }
    v60 = [v103 trailingBottomText];

    if (v60)
    {
      v61 = [_SFPBFormattedText alloc];
      v62 = [v103 trailingBottomText];
      v63 = [(_SFPBFormattedText *)v61 initWithFacade:v62];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingBottomText:v63];
    }
    v64 = [v103 action];

    if (v64)
    {
      v65 = [_SFPBActionItem alloc];
      v66 = [v103 action];
      v67 = [(_SFPBActionItem *)v65 initWithFacade:v66];
      [(_SFPBDetailedRowCardSection *)v5 setAction:v67];
    }
    v68 = [v103 button];

    if (v68)
    {
      v69 = [_SFPBButton alloc];
      v70 = [v103 button];
      v71 = [(_SFPBButton *)v69 initWithFacade:v70];
      [(_SFPBDetailedRowCardSection *)v5 setButton:v71];
    }
    if ([v103 hasShouldUseCompactDisplay]) {
      -[_SFPBDetailedRowCardSection setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", [v103 shouldUseCompactDisplay]);
    }
    v72 = [v103 buttonItems];
    v102 = v5;
    if (v72)
    {
      id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v73 = 0;
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v74 = [v103 buttonItems];
    uint64_t v75 = [v74 countByEnumeratingWithState:&v104 objects:v116 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v105;
      do
      {
        for (uint64_t k = 0; k != v76; ++k)
        {
          if (*(void *)v105 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v104 + 1) + 8 * k)];
          if (v79) {
            [v73 addObject:v79];
          }
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v104 objects:v116 count:16];
      }
      while (v76);
    }

    v5 = v102;
    [(_SFPBDetailedRowCardSection *)v102 setButtonItems:v73];
    id v4 = v103;
    v80 = [v103 trailingThumbnail];

    if (v80)
    {
      v81 = [_SFPBImage alloc];
      v82 = [v103 trailingThumbnail];
      v83 = [(_SFPBImage *)v81 initWithFacade:v82];
      [(_SFPBDetailedRowCardSection *)v102 setTrailingThumbnail:v83];
    }
    if (objc_msgSend(v103, "hasButtonItemsAreTrailing", v102)) {
      -[_SFPBDetailedRowCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", [v103 buttonItemsAreTrailing]);
    }
    v84 = [v103 topText];

    if (v84)
    {
      v85 = [_SFPBRichText alloc];
      v86 = [v103 topText];
      v87 = [(_SFPBRichText *)v85 initWithFacade:v86];
      [(_SFPBDetailedRowCardSection *)v5 setTopText:v87];
    }
    v88 = [v103 richTrailingTopText];

    if (v88)
    {
      v89 = [_SFPBRichText alloc];
      v90 = [v103 richTrailingTopText];
      v91 = [(_SFPBRichText *)v89 initWithFacade:v90];
      [(_SFPBDetailedRowCardSection *)v5 setRichTrailingTopText:v91];
    }
    v92 = [v103 richTrailingMiddleText];

    if (v92)
    {
      v93 = [_SFPBRichText alloc];
      v94 = [v103 richTrailingMiddleText];
      v95 = [(_SFPBRichText *)v93 initWithFacade:v94];
      [(_SFPBDetailedRowCardSection *)v5 setRichTrailingMiddleText:v95];
    }
    v96 = [v103 richTrailingBottomText];

    if (v96)
    {
      v97 = [_SFPBRichText alloc];
      v98 = [v103 richTrailingBottomText];
      v99 = [(_SFPBRichText *)v97 initWithFacade:v98];
      [(_SFPBDetailedRowCardSection *)v5 setRichTrailingBottomText:v99];
    }
    v100 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richTrailingBottomText, 0);
  objc_storeStrong((id *)&self->_richTrailingMiddleText, 0);
  objc_storeStrong((id *)&self->_richTrailingTopText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_trailingThumbnail, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_trailingTopText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBRichText)richTrailingBottomText
{
  return self->_richTrailingBottomText;
}

- (_SFPBRichText)richTrailingMiddleText
{
  return self->_richTrailingMiddleText;
}

- (_SFPBRichText)richTrailingTopText
{
  return self->_richTrailingTopText;
}

- (_SFPBRichText)topText
{
  return self->_topText;
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (_SFPBImage)trailingThumbnail
{
  return self->_trailingThumbnail;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (_SFPBButton)button
{
  return self->_button;
}

- (_SFPBActionItem)action
{
  return self->_action;
}

- (_SFPBFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (_SFPBFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (_SFPBFormattedText)trailingTopText
{
  return self->_trailingTopText;
}

- (_SFPBRichText)footnote
{
  return self->_footnote;
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (BOOL)isSecondaryTitleDetached
{
  return self->_isSecondaryTitleDetached;
}

- (_SFPBImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (_SFPBFormattedText)secondaryTitle
{
  return self->_secondaryTitle;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (NSString)type
{
  return self->_type;
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

- (_SFPBDetailedRowCardSection)initWithDictionary:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v114.receiver = self;
  v114.super_class = (Class)_SFPBDetailedRowCardSection;
  v5 = [(_SFPBDetailedRowCardSection *)&v114 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v110 objects:v117 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v111 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v110 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBDetailedRowCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v110 objects:v117 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    v101 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBDetailedRowCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    v100 = v16;
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBDetailedRowCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    v99 = v18;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v98 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v97 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v96 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBDetailedRowCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v95 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    v94 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBDetailedRowCardSection *)v5 setBackgroundColor:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    v93 = (void *)v26;
    v27 = &off_1E5A2D000;
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBImage alloc] initWithDictionary:v26];
      [(_SFPBDetailedRowCardSection *)v5 setThumbnail:v28];
    }
    v29 = [v4 objectForKeyedSubscript:@"preventThumbnailImageScaling"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", [v29 BOOLValue]);
    }
    v81 = v29;
    uint64_t v30 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    v92 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBRichText alloc] initWithDictionary:v30];
      [(_SFPBDetailedRowCardSection *)v5 setTitle:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"secondaryTitle"];
    objc_opt_class();
    v91 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBFormattedText alloc] initWithDictionary:v32];
      [(_SFPBDetailedRowCardSection *)v5 setSecondaryTitle:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"secondaryTitleImage"];
    objc_opt_class();
    v90 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBImage alloc] initWithDictionary:v34];
      [(_SFPBDetailedRowCardSection *)v5 setSecondaryTitleImage:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"isSecondaryTitleDetached"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", [v36 BOOLValue]);
    }
    v80 = v36;
    v37 = [v4 objectForKeyedSubscript:@"descriptions"];
    objc_opt_class();
    v89 = v37;
    if (objc_opt_isKindOfClass())
    {
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v106 objects:v116 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v107;
        do
        {
          for (uint64_t j = 0; j != v40; ++j)
          {
            if (*(void *)v107 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v106 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v44 = [[_SFPBRichText alloc] initWithDictionary:v43];
              [(_SFPBDetailedRowCardSection *)v5 addDescriptions:v44];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v106 objects:v116 count:16];
        }
        while (v40);
      }

      v27 = &off_1E5A2D000;
    }
    uint64_t v45 = [v4 objectForKeyedSubscript:@"footnote"];
    objc_opt_class();
    v88 = (void *)v45;
    if (objc_opt_isKindOfClass())
    {
      v46 = [[_SFPBRichText alloc] initWithDictionary:v45];
      [(_SFPBDetailedRowCardSection *)v5 setFootnote:v46];
    }
    uint64_t v47 = [v4 objectForKeyedSubscript:@"trailingTopText"];
    objc_opt_class();
    v87 = (void *)v47;
    if (objc_opt_isKindOfClass())
    {
      v48 = [[_SFPBFormattedText alloc] initWithDictionary:v47];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingTopText:v48];
    }
    uint64_t v49 = [v4 objectForKeyedSubscript:@"trailingMiddleText"];
    objc_opt_class();
    v86 = (void *)v49;
    if (objc_opt_isKindOfClass())
    {
      v50 = [[_SFPBFormattedText alloc] initWithDictionary:v49];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingMiddleText:v50];
    }
    uint64_t v51 = [v4 objectForKeyedSubscript:@"trailingBottomText"];
    objc_opt_class();
    v85 = (void *)v51;
    if (objc_opt_isKindOfClass())
    {
      v52 = [[_SFPBFormattedText alloc] initWithDictionary:v51];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingBottomText:v52];
    }
    uint64_t v53 = [v4 objectForKeyedSubscript:@"action"];
    objc_opt_class();
    v84 = (void *)v53;
    if (objc_opt_isKindOfClass())
    {
      v54 = [[_SFPBActionItem alloc] initWithDictionary:v53];
      [(_SFPBDetailedRowCardSection *)v5 setAction:v54];
    }
    uint64_t v55 = [v4 objectForKeyedSubscript:@"button"];
    objc_opt_class();
    v83 = (void *)v55;
    if (objc_opt_isKindOfClass())
    {
      v56 = [[_SFPBButton alloc] initWithDictionary:v55];
      [(_SFPBDetailedRowCardSection *)v5 setButton:v56];
    }
    v57 = [v4 objectForKeyedSubscript:@"shouldUseCompactDisplay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", [v57 BOOLValue]);
    }
    v58 = objc_msgSend(v4, "objectForKeyedSubscript:", @"buttonItems", v57);
    objc_opt_class();
    v82 = v58;
    if (objc_opt_isKindOfClass())
    {
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v59 = v58;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v102 objects:v115 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v103;
        do
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v103 != v62) {
              objc_enumerationMutation(v59);
            }
            uint64_t v64 = *(void *)(*((void *)&v102 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v65 = [[_SFPBButtonItem alloc] initWithDictionary:v64];
              [(_SFPBDetailedRowCardSection *)v5 addButtonItems:v65];
            }
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v102 objects:v115 count:16];
        }
        while (v61);
      }

      v27 = &off_1E5A2D000;
    }
    v66 = [v4 objectForKeyedSubscript:@"trailingThumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v67 = (void *)[objc_alloc((Class)v27[448]) initWithDictionary:v66];
      [(_SFPBDetailedRowCardSection *)v5 setTrailingThumbnail:v67];
    }
    v68 = [v4 objectForKeyedSubscript:@"buttonItemsAreTrailing"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDetailedRowCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", [v68 BOOLValue]);
    }
    v69 = [v4 objectForKeyedSubscript:@"topText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v70 = [[_SFPBRichText alloc] initWithDictionary:v69];
      [(_SFPBDetailedRowCardSection *)v5 setTopText:v70];
    }
    v71 = [v4 objectForKeyedSubscript:@"richTrailingTopText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v72 = [[_SFPBRichText alloc] initWithDictionary:v71];
      [(_SFPBDetailedRowCardSection *)v5 setRichTrailingTopText:v72];
    }
    id v73 = [v4 objectForKeyedSubscript:@"richTrailingMiddleText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v74 = [[_SFPBRichText alloc] initWithDictionary:v73];
      [(_SFPBDetailedRowCardSection *)v5 setRichTrailingMiddleText:v74];
    }
    uint64_t v75 = [v4 objectForKeyedSubscript:@"richTrailingBottomText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v76 = [[_SFPBRichText alloc] initWithDictionary:v75];
      [(_SFPBDetailedRowCardSection *)v5 setRichTrailingBottomText:v76];
    }
    uint64_t v77 = v5;
  }
  return v5;
}

- (_SFPBDetailedRowCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBDetailedRowCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBDetailedRowCardSection *)self dictionaryRepresentation];
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
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_action)
  {
    id v4 = [(_SFPBDetailedRowCardSection *)self action];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"action"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"action"];
    }
  }
  if (self->_backgroundColor)
  {
    uint64_t v7 = [(_SFPBDetailedRowCardSection *)self backgroundColor];
    uint64_t v8 = [v7 dictionaryRepresentation];
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
  if (self->_button)
  {
    uint64_t v10 = [(_SFPBDetailedRowCardSection *)self button];
    uint64_t v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"button"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"button"];
    }
  }
  if ([(NSArray *)self->_buttonItems count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v14 = self->_buttonItems;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v101 objects:v107 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v102 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v101 + 1) + 8 * i) dictionaryRepresentation];
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v101 objects:v107 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"buttonItems"];
  }
  if (self->_buttonItemsAreTrailing)
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
    [v3 setObject:v21 forKeyedSubscript:@"buttonItemsAreTrailing"];
  }
  if (self->_canBeHidden)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v22 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_descriptions count])
  {
    v23 = [MEMORY[0x1E4F1CA48] array];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v24 = self->_descriptions;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v97 objects:v106 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v98;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v98 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v97 + 1) + 8 * j) dictionaryRepresentation];
          if (v29)
          {
            [v23 addObject:v29];
          }
          else
          {
            uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
            [v23 addObject:v30];
          }
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v97 objects:v106 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"descriptions"];
  }
  if (self->_footnote)
  {
    v31 = [(_SFPBDetailedRowCardSection *)self footnote];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"footnote"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"footnote"];
    }
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v34 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v35 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_isSecondaryTitleDetached)
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached"));
    [v3 setObject:v36 forKeyedSubscript:@"isSecondaryTitleDetached"];
  }
  if (self->_preventThumbnailImageScaling)
  {
    v37 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling"));
    [v3 setObject:v37 forKeyedSubscript:@"preventThumbnailImageScaling"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    id v38 = [MEMORY[0x1E4F1CA48] array];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v39 = self->_punchoutOptions;
    uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v93 objects:v105 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v94;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v94 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = [*(id *)(*((void *)&v93 + 1) + 8 * k) dictionaryRepresentation];
          if (v44)
          {
            [v38 addObject:v44];
          }
          else
          {
            uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
            [v38 addObject:v45];
          }
        }
        uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v93 objects:v105 count:16];
      }
      while (v41);
    }

    [v3 setObject:v38 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v46 = [(_SFPBDetailedRowCardSection *)self punchoutPickerDismissText];
    uint64_t v47 = (void *)[v46 copy];
    [v3 setObject:v47 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v48 = [(_SFPBDetailedRowCardSection *)self punchoutPickerTitle];
    uint64_t v49 = (void *)[v48 copy];
    [v3 setObject:v49 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_richTrailingBottomText)
  {
    v50 = [(_SFPBDetailedRowCardSection *)self richTrailingBottomText];
    uint64_t v51 = [v50 dictionaryRepresentation];
    if (v51)
    {
      [v3 setObject:v51 forKeyedSubscript:@"richTrailingBottomText"];
    }
    else
    {
      v52 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v52 forKeyedSubscript:@"richTrailingBottomText"];
    }
  }
  if (self->_richTrailingMiddleText)
  {
    uint64_t v53 = [(_SFPBDetailedRowCardSection *)self richTrailingMiddleText];
    v54 = [v53 dictionaryRepresentation];
    if (v54)
    {
      [v3 setObject:v54 forKeyedSubscript:@"richTrailingMiddleText"];
    }
    else
    {
      uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v55 forKeyedSubscript:@"richTrailingMiddleText"];
    }
  }
  if (self->_richTrailingTopText)
  {
    v56 = [(_SFPBDetailedRowCardSection *)self richTrailingTopText];
    v57 = [v56 dictionaryRepresentation];
    if (v57)
    {
      [v3 setObject:v57 forKeyedSubscript:@"richTrailingTopText"];
    }
    else
    {
      v58 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v58 forKeyedSubscript:@"richTrailingTopText"];
    }
  }
  if (self->_secondaryTitle)
  {
    id v59 = [(_SFPBDetailedRowCardSection *)self secondaryTitle];
    uint64_t v60 = [v59 dictionaryRepresentation];
    if (v60)
    {
      [v3 setObject:v60 forKeyedSubscript:@"secondaryTitle"];
    }
    else
    {
      uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v61 forKeyedSubscript:@"secondaryTitle"];
    }
  }
  if (self->_secondaryTitleImage)
  {
    uint64_t v62 = [(_SFPBDetailedRowCardSection *)self secondaryTitleImage];
    v63 = [v62 dictionaryRepresentation];
    if (v63)
    {
      [v3 setObject:v63 forKeyedSubscript:@"secondaryTitleImage"];
    }
    else
    {
      uint64_t v64 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v64 forKeyedSubscript:@"secondaryTitleImage"];
    }
  }
  if (self->_separatorStyle)
  {
    uint64_t v65 = [(_SFPBDetailedRowCardSection *)self separatorStyle];
    if (v65 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v65);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = off_1E5A2F090[v65];
    }
    [v3 setObject:v66 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_shouldUseCompactDisplay)
  {
    v67 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay"));
    [v3 setObject:v67 forKeyedSubscript:@"shouldUseCompactDisplay"];
  }
  if (self->_thumbnail)
  {
    v68 = [(_SFPBDetailedRowCardSection *)self thumbnail];
    v69 = [v68 dictionaryRepresentation];
    if (v69)
    {
      [v3 setObject:v69 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v70 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v70 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_title)
  {
    v71 = [(_SFPBDetailedRowCardSection *)self title];
    v72 = [v71 dictionaryRepresentation];
    if (v72)
    {
      [v3 setObject:v72 forKeyedSubscript:@"title"];
    }
    else
    {
      id v73 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v73 forKeyedSubscript:@"title"];
    }
  }
  if (self->_topText)
  {
    v74 = [(_SFPBDetailedRowCardSection *)self topText];
    uint64_t v75 = [v74 dictionaryRepresentation];
    if (v75)
    {
      [v3 setObject:v75 forKeyedSubscript:@"topText"];
    }
    else
    {
      uint64_t v76 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v76 forKeyedSubscript:@"topText"];
    }
  }
  if (self->_trailingBottomText)
  {
    uint64_t v77 = [(_SFPBDetailedRowCardSection *)self trailingBottomText];
    v78 = [v77 dictionaryRepresentation];
    if (v78)
    {
      [v3 setObject:v78 forKeyedSubscript:@"trailingBottomText"];
    }
    else
    {
      v79 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v79 forKeyedSubscript:@"trailingBottomText"];
    }
  }
  if (self->_trailingMiddleText)
  {
    v80 = [(_SFPBDetailedRowCardSection *)self trailingMiddleText];
    v81 = [v80 dictionaryRepresentation];
    if (v81)
    {
      [v3 setObject:v81 forKeyedSubscript:@"trailingMiddleText"];
    }
    else
    {
      v82 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v82 forKeyedSubscript:@"trailingMiddleText"];
    }
  }
  if (self->_trailingThumbnail)
  {
    v83 = [(_SFPBDetailedRowCardSection *)self trailingThumbnail];
    v84 = [v83 dictionaryRepresentation];
    if (v84)
    {
      [v3 setObject:v84 forKeyedSubscript:@"trailingThumbnail"];
    }
    else
    {
      v85 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v85 forKeyedSubscript:@"trailingThumbnail"];
    }
  }
  if (self->_trailingTopText)
  {
    v86 = [(_SFPBDetailedRowCardSection *)self trailingTopText];
    v87 = [v86 dictionaryRepresentation];
    if (v87)
    {
      [v3 setObject:v87 forKeyedSubscript:@"trailingTopText"];
    }
    else
    {
      v88 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v88 forKeyedSubscript:@"trailingTopText"];
    }
  }
  if (self->_type)
  {
    v89 = [(_SFPBDetailedRowCardSection *)self type];
    v90 = (void *)[v89 copy];
    [v3 setObject:v90 forKeyedSubscript:@"type"];
  }
  id v91 = v3;

  return v91;
}

- (unint64_t)hash
{
  uint64_t v41 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v40 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v38 = v4;
  NSUInteger v39 = v3;
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v36 = v6;
  uint64_t v37 = v5;
  NSUInteger v7 = [(NSString *)self->_type hash];
  uint64_t v34 = 2654435761 * self->_separatorStyle;
  NSUInteger v35 = v7;
  unint64_t v33 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v8 = [(_SFPBImage *)self->_thumbnail hash];
  if (self->_preventThumbnailImageScaling) {
    uint64_t v9 = 2654435761;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v31 = v9;
  unint64_t v32 = v8;
  unint64_t v30 = [(_SFPBRichText *)self->_title hash];
  unint64_t v29 = [(_SFPBFormattedText *)self->_secondaryTitle hash];
  unint64_t v10 = [(_SFPBImage *)self->_secondaryTitleImage hash];
  if (self->_isSecondaryTitleDetached) {
    uint64_t v11 = 2654435761;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v27 = v11;
  unint64_t v28 = v10;
  uint64_t v26 = [(NSArray *)self->_descriptions hash];
  unint64_t v12 = [(_SFPBRichText *)self->_footnote hash];
  unint64_t v13 = [(_SFPBFormattedText *)self->_trailingTopText hash];
  unint64_t v14 = [(_SFPBFormattedText *)self->_trailingMiddleText hash];
  unint64_t v15 = [(_SFPBFormattedText *)self->_trailingBottomText hash];
  unint64_t v16 = [(_SFPBActionItem *)self->_action hash];
  unint64_t v17 = [(_SFPBButton *)self->_button hash];
  if (self->_shouldUseCompactDisplay) {
    uint64_t v18 = 2654435761;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [(NSArray *)self->_buttonItems hash];
  unint64_t v20 = [(_SFPBImage *)self->_trailingThumbnail hash];
  if (self->_buttonItemsAreTrailing) {
    uint64_t v21 = 2654435761;
  }
  else {
    uint64_t v21 = 0;
  }
  unint64_t v22 = v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(_SFPBRichText *)self->_topText hash];
  unint64_t v23 = v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v12 ^ v13 ^ v14 ^ v15 ^ v22 ^ [(_SFPBRichText *)self->_richTrailingTopText hash];
  unint64_t v24 = [(_SFPBRichText *)self->_richTrailingMiddleText hash];
  return v23 ^ v24 ^ [(_SFPBRichText *)self->_richTrailingBottomText hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v7 = [(_SFPBDetailedRowCardSection *)self punchoutOptions];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBDetailedRowCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v12 = [(_SFPBDetailedRowCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBDetailedRowCardSection *)self punchoutPickerTitle];
    unint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v17 = [(_SFPBDetailedRowCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBDetailedRowCardSection *)self punchoutPickerDismissText];
    unint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_120;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_120;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v25 = [(_SFPBDetailedRowCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBDetailedRowCardSection *)self type];
    unint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v31 = [(_SFPBDetailedRowCardSection *)self backgroundColor];
  if (v31)
  {
    unint64_t v32 = (void *)v31;
    unint64_t v33 = [(_SFPBDetailedRowCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v36 = [(_SFPBDetailedRowCardSection *)self thumbnail];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBDetailedRowCardSection *)self thumbnail];
    NSUInteger v39 = [v4 thumbnail];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  int preventThumbnailImageScaling = self->_preventThumbnailImageScaling;
  if (preventThumbnailImageScaling != [v4 preventThumbnailImageScaling]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v42 = [(_SFPBDetailedRowCardSection *)self title];
  if (v42)
  {
    uint64_t v43 = (void *)v42;
    uint64_t v44 = [(_SFPBDetailedRowCardSection *)self title];
    uint64_t v45 = [v4 title];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self secondaryTitle];
  uint64_t v6 = [v4 secondaryTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v47 = [(_SFPBDetailedRowCardSection *)self secondaryTitle];
  if (v47)
  {
    v48 = (void *)v47;
    uint64_t v49 = [(_SFPBDetailedRowCardSection *)self secondaryTitle];
    v50 = [v4 secondaryTitle];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self secondaryTitleImage];
  uint64_t v6 = [v4 secondaryTitleImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v52 = [(_SFPBDetailedRowCardSection *)self secondaryTitleImage];
  if (v52)
  {
    uint64_t v53 = (void *)v52;
    v54 = [(_SFPBDetailedRowCardSection *)self secondaryTitleImage];
    uint64_t v55 = [v4 secondaryTitleImage];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  int isSecondaryTitleDetached = self->_isSecondaryTitleDetached;
  if (isSecondaryTitleDetached != [v4 isSecondaryTitleDetached]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self descriptions];
  uint64_t v6 = [v4 descriptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v58 = [(_SFPBDetailedRowCardSection *)self descriptions];
  if (v58)
  {
    id v59 = (void *)v58;
    uint64_t v60 = [(_SFPBDetailedRowCardSection *)self descriptions];
    uint64_t v61 = [v4 descriptions];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self footnote];
  uint64_t v6 = [v4 footnote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v63 = [(_SFPBDetailedRowCardSection *)self footnote];
  if (v63)
  {
    uint64_t v64 = (void *)v63;
    uint64_t v65 = [(_SFPBDetailedRowCardSection *)self footnote];
    v66 = [v4 footnote];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self trailingTopText];
  uint64_t v6 = [v4 trailingTopText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v68 = [(_SFPBDetailedRowCardSection *)self trailingTopText];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(_SFPBDetailedRowCardSection *)self trailingTopText];
    v71 = [v4 trailingTopText];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self trailingMiddleText];
  uint64_t v6 = [v4 trailingMiddleText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v73 = [(_SFPBDetailedRowCardSection *)self trailingMiddleText];
  if (v73)
  {
    v74 = (void *)v73;
    uint64_t v75 = [(_SFPBDetailedRowCardSection *)self trailingMiddleText];
    uint64_t v76 = [v4 trailingMiddleText];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self trailingBottomText];
  uint64_t v6 = [v4 trailingBottomText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v78 = [(_SFPBDetailedRowCardSection *)self trailingBottomText];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(_SFPBDetailedRowCardSection *)self trailingBottomText];
    v81 = [v4 trailingBottomText];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self action];
  uint64_t v6 = [v4 action];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v83 = [(_SFPBDetailedRowCardSection *)self action];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(_SFPBDetailedRowCardSection *)self action];
    v86 = [v4 action];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self button];
  uint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v88 = [(_SFPBDetailedRowCardSection *)self button];
  if (v88)
  {
    v89 = (void *)v88;
    v90 = [(_SFPBDetailedRowCardSection *)self button];
    id v91 = [v4 button];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  int shouldUseCompactDisplay = self->_shouldUseCompactDisplay;
  if (shouldUseCompactDisplay != [v4 shouldUseCompactDisplay]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self buttonItems];
  uint64_t v6 = [v4 buttonItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v94 = [(_SFPBDetailedRowCardSection *)self buttonItems];
  if (v94)
  {
    long long v95 = (void *)v94;
    long long v96 = [(_SFPBDetailedRowCardSection *)self buttonItems];
    long long v97 = [v4 buttonItems];
    int v98 = [v96 isEqual:v97];

    if (!v98) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self trailingThumbnail];
  uint64_t v6 = [v4 trailingThumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v99 = [(_SFPBDetailedRowCardSection *)self trailingThumbnail];
  if (v99)
  {
    long long v100 = (void *)v99;
    long long v101 = [(_SFPBDetailedRowCardSection *)self trailingThumbnail];
    long long v102 = [v4 trailingThumbnail];
    int v103 = [v101 isEqual:v102];

    if (!v103) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  int buttonItemsAreTrailing = self->_buttonItemsAreTrailing;
  if (buttonItemsAreTrailing != [v4 buttonItemsAreTrailing]) {
    goto LABEL_120;
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self topText];
  uint64_t v6 = [v4 topText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v105 = [(_SFPBDetailedRowCardSection *)self topText];
  if (v105)
  {
    long long v106 = (void *)v105;
    long long v107 = [(_SFPBDetailedRowCardSection *)self topText];
    uint64_t v108 = [v4 topText];
    int v109 = [v107 isEqual:v108];

    if (!v109) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self richTrailingTopText];
  uint64_t v6 = [v4 richTrailingTopText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v110 = [(_SFPBDetailedRowCardSection *)self richTrailingTopText];
  if (v110)
  {
    long long v111 = (void *)v110;
    long long v112 = [(_SFPBDetailedRowCardSection *)self richTrailingTopText];
    long long v113 = [v4 richTrailingTopText];
    int v114 = [v112 isEqual:v113];

    if (!v114) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self richTrailingMiddleText];
  uint64_t v6 = [v4 richTrailingMiddleText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_119;
  }
  uint64_t v115 = [(_SFPBDetailedRowCardSection *)self richTrailingMiddleText];
  if (v115)
  {
    v116 = (void *)v115;
    v117 = [(_SFPBDetailedRowCardSection *)self richTrailingMiddleText];
    uint64_t v118 = [v4 richTrailingMiddleText];
    int v119 = [v117 isEqual:v118];

    if (!v119) {
      goto LABEL_120;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self richTrailingBottomText];
  uint64_t v6 = [v4 richTrailingBottomText];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_119:

    goto LABEL_120;
  }
  uint64_t v120 = [(_SFPBDetailedRowCardSection *)self richTrailingBottomText];
  if (!v120)
  {

LABEL_123:
    BOOL v125 = 1;
    goto LABEL_121;
  }
  v121 = (void *)v120;
  v122 = [(_SFPBDetailedRowCardSection *)self richTrailingBottomText];
  v123 = [v4 richTrailingBottomText];
  char v124 = [v122 isEqual:v123];

  if (v124) {
    goto LABEL_123;
  }
LABEL_120:
  BOOL v125 = 0;
LABEL_121:

  return v125;
}

- (void)writeTo:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBDetailedRowCardSection *)self punchoutOptions];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBDetailedRowCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBDetailedRowCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBDetailedRowCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBDetailedRowCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBDetailedRowCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBDetailedRowCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBDetailedRowCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v13 = [(_SFPBDetailedRowCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBDetailedRowCardSection *)self thumbnail];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBDetailedRowCardSection *)self preventThumbnailImageScaling]) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v15 = [(_SFPBDetailedRowCardSection *)self title];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBDetailedRowCardSection *)self secondaryTitle];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBDetailedRowCardSection *)self secondaryTitleImage];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBDetailedRowCardSection *)self isSecondaryTitleDetached]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v18 = [(_SFPBDetailedRowCardSection *)self descriptions];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v20);
  }

  unint64_t v23 = [(_SFPBDetailedRowCardSection *)self footnote];
  if (v23) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v24 = [(_SFPBDetailedRowCardSection *)self trailingTopText];
  if (v24) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v25 = [(_SFPBDetailedRowCardSection *)self trailingMiddleText];
  if (v25) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v26 = [(_SFPBDetailedRowCardSection *)self trailingBottomText];
  if (v26) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v27 = [(_SFPBDetailedRowCardSection *)self action];
  if (v27) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v28 = [(_SFPBDetailedRowCardSection *)self button];
  if (v28) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBDetailedRowCardSection *)self shouldUseCompactDisplay]) {
    PBDataWriterWriteBOOLField();
  }
  int v29 = [(_SFPBDetailedRowCardSection *)self buttonItems];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v31);
  }

  uint64_t v34 = [(_SFPBDetailedRowCardSection *)self trailingThumbnail];
  if (v34) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBDetailedRowCardSection *)self buttonItemsAreTrailing]) {
    PBDataWriterWriteBOOLField();
  }
  int v35 = [(_SFPBDetailedRowCardSection *)self topText];
  if (v35) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v36 = [(_SFPBDetailedRowCardSection *)self richTrailingTopText];
  if (v36) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v37 = [(_SFPBDetailedRowCardSection *)self richTrailingMiddleText];
  if (v37) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v38 = [(_SFPBDetailedRowCardSection *)self richTrailingBottomText];
  if (v38) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDetailedRowCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setRichTrailingBottomText:(id)a3
{
}

- (void)setRichTrailingMiddleText:(id)a3
{
}

- (void)setRichTrailingTopText:(id)a3
{
}

- (void)setTopText:(id)a3
{
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  self->_int buttonItemsAreTrailing = a3;
}

- (void)setTrailingThumbnail:(id)a3
{
}

- (id)buttonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_buttonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)buttonItemsCount
{
  return [(NSArray *)self->_buttonItems count];
}

- (void)addButtonItems:(id)a3
{
  id v4 = a3;
  buttonItems = self->_buttonItems;
  id v8 = v4;
  if (!buttonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_buttonItems;
    self->_buttonItems = v6;

    id v4 = v8;
    buttonItems = self->_buttonItems;
  }
  [(NSArray *)buttonItems addObject:v4];
}

- (void)clearButtonItems
{
}

- (void)setButtonItems:(id)a3
{
  self->_buttonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  self->_int shouldUseCompactDisplay = a3;
}

- (void)setButton:(id)a3
{
}

- (void)setAction:(id)a3
{
}

- (void)setTrailingBottomText:(id)a3
{
}

- (void)setTrailingMiddleText:(id)a3
{
}

- (void)setTrailingTopText:(id)a3
{
}

- (void)setFootnote:(id)a3
{
}

- (id)descriptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_descriptions objectAtIndexedSubscript:a3];
}

- (unint64_t)descriptionsCount
{
  return [(NSArray *)self->_descriptions count];
}

- (void)addDescriptions:(id)a3
{
  id v4 = a3;
  descriptions = self->_descriptions;
  id v8 = v4;
  if (!descriptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_descriptions;
    self->_descriptions = v6;

    id v4 = v8;
    descriptions = self->_descriptions;
  }
  [(NSArray *)descriptions addObject:v4];
}

- (void)clearDescriptions
{
}

- (void)setDescriptions:(id)a3
{
  self->_descriptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsSecondaryTitleDetached:(BOOL)a3
{
  self->_int isSecondaryTitleDetached = a3;
}

- (void)setSecondaryTitleImage:(id)a3
{
}

- (void)setSecondaryTitle:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  self->_int preventThumbnailImageScaling = a3;
}

- (void)setThumbnail:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setSeparatorStyle:(int)a3
{
  self->_int separatorStyle = a3;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
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
  self->_int canBeHidden = a3;
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
    uint64_t v7 = self->_punchoutOptions;
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

@end