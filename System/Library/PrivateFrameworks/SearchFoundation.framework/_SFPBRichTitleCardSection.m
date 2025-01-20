@interface _SFPBRichTitleCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)hideVerticalDivider;
- (BOOL)isCentered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)reviewNewLine;
- (BOOL)subtitleIsEmphasized;
- (BOOL)thumbnailCropCircle;
- (BOOL)titleNoWrap;
- (NSArray)buttonItems;
- (NSArray)moreGlyphs;
- (NSArray)offers;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)auxiliaryBottomText;
- (NSString)auxiliaryMiddleText;
- (NSString)auxiliaryTopText;
- (NSString)contentAdvisory;
- (NSString)descriptionText;
- (NSString)footnote;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)ratingText;
- (NSString)reviewText;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (_SFPBActionItem)playAction;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)imageOverlay;
- (_SFPBImage)reviewGlyph;
- (_SFPBImage)titleImage;
- (_SFPBRichText)richSubtitle;
- (_SFPBRichTitleCardSection)initWithDictionary:(id)a3;
- (_SFPBRichTitleCardSection)initWithFacade:(id)a3;
- (_SFPBRichTitleCardSection)initWithJSON:(id)a3;
- (float)rating;
- (id)buttonItemsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)moreGlyphsAtIndex:(unint64_t)a3;
- (id)offersAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)auxiliaryAlignment;
- (int)auxiliaryBottomTextColor;
- (int)playActionAlign;
- (int)separatorStyle;
- (int)titleAlign;
- (int)titleWeight;
- (unint64_t)buttonItemsCount;
- (unint64_t)hash;
- (unint64_t)moreGlyphsCount;
- (unint64_t)offersCount;
- (unint64_t)punchoutOptionsCount;
- (void)addButtonItems:(id)a3;
- (void)addMoreGlyphs:(id)a3;
- (void)addOffers:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearButtonItems;
- (void)clearMoreGlyphs;
- (void)clearOffers;
- (void)clearPunchoutOptions;
- (void)setAuxiliaryAlignment:(int)a3;
- (void)setAuxiliaryBottomText:(id)a3;
- (void)setAuxiliaryBottomTextColor:(int)a3;
- (void)setAuxiliaryMiddleText:(id)a3;
- (void)setAuxiliaryTopText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setContentAdvisory:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setHideVerticalDivider:(BOOL)a3;
- (void)setImageOverlay:(id)a3;
- (void)setIsCentered:(BOOL)a3;
- (void)setMoreGlyphs:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPlayAction:(id)a3;
- (void)setPlayActionAlign:(int)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setRating:(float)a3;
- (void)setRatingText:(id)a3;
- (void)setReviewGlyph:(id)a3;
- (void)setReviewNewLine:(BOOL)a3;
- (void)setReviewText:(id)a3;
- (void)setRichSubtitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleIsEmphasized:(BOOL)a3;
- (void)setThumbnailCropCircle:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAlign:(int)a3;
- (void)setTitleImage:(id)a3;
- (void)setTitleNoWrap:(BOOL)a3;
- (void)setTitleWeight:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRichTitleCardSection

- (_SFPBRichTitleCardSection)initWithFacade:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRichTitleCardSection *)self init];

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

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v110 objects:v117 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v111 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v110 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v110 objects:v117 count:16];
      }
      while (v10);
    }

    [(_SFPBRichTitleCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBRichTitleCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBRichTitleCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBRichTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBRichTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBRichTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBRichTitleCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBRichTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBRichTitleCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(_SFPBRichTitleCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(_SFPBRichTitleCardSection *)v5 setSubtitle:v27];
    }
    v28 = [v4 contentAdvisory];

    if (v28)
    {
      v29 = [v4 contentAdvisory];
      [(_SFPBRichTitleCardSection *)v5 setContentAdvisory:v29];
    }
    v30 = [v4 titleImage];

    if (v30)
    {
      v31 = [_SFPBImage alloc];
      v32 = [v4 titleImage];
      v33 = [(_SFPBImage *)v31 initWithFacade:v32];
      [(_SFPBRichTitleCardSection *)v5 setTitleImage:v33];
    }
    if ([v4 hasIsCentered]) {
      -[_SFPBRichTitleCardSection setIsCentered:](v5, "setIsCentered:", [v4 isCentered]);
    }
    v34 = [v4 descriptionText];

    if (v34)
    {
      v35 = [v4 descriptionText];
      [(_SFPBRichTitleCardSection *)v5 setDescriptionText:v35];
    }
    v36 = [v4 rating];

    if (v36)
    {
      v37 = [v4 rating];
      [v37 floatValue];
      -[_SFPBRichTitleCardSection setRating:](v5, "setRating:");
    }
    v38 = [v4 ratingText];

    if (v38)
    {
      v39 = [v4 ratingText];
      [(_SFPBRichTitleCardSection *)v5 setRatingText:v39];
    }
    v40 = [v4 reviewGlyph];

    if (v40)
    {
      v41 = [_SFPBImage alloc];
      v42 = [v4 reviewGlyph];
      v43 = [(_SFPBImage *)v41 initWithFacade:v42];
      [(_SFPBRichTitleCardSection *)v5 setReviewGlyph:v43];
    }
    v44 = [v4 reviewText];

    if (v44)
    {
      v45 = [v4 reviewText];
      [(_SFPBRichTitleCardSection *)v5 setReviewText:v45];
    }
    if ([v4 hasReviewNewLine]) {
      -[_SFPBRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", [v4 reviewNewLine]);
    }
    v46 = [v4 moreGlyphs];
    if (v46)
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v47 = 0;
    }

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v48 = [v4 moreGlyphs];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v106 objects:v116 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v107;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v107 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [[_SFPBImage alloc] initWithFacade:*(void *)(*((void *)&v106 + 1) + 8 * j)];
          if (v53) {
            [v47 addObject:v53];
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v106 objects:v116 count:16];
      }
      while (v50);
    }

    [(_SFPBRichTitleCardSection *)v5 setMoreGlyphs:v47];
    v54 = [v4 auxiliaryTopText];

    if (v54)
    {
      v55 = [v4 auxiliaryTopText];
      [(_SFPBRichTitleCardSection *)v5 setAuxiliaryTopText:v55];
    }
    v56 = [v4 auxiliaryMiddleText];

    if (v56)
    {
      v57 = [v4 auxiliaryMiddleText];
      [(_SFPBRichTitleCardSection *)v5 setAuxiliaryMiddleText:v57];
    }
    v58 = [v4 auxiliaryBottomText];

    if (v58)
    {
      v59 = [v4 auxiliaryBottomText];
      [(_SFPBRichTitleCardSection *)v5 setAuxiliaryBottomText:v59];
    }
    if ([v4 hasAuxiliaryBottomTextColor]) {
      -[_SFPBRichTitleCardSection setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", [v4 auxiliaryBottomTextColor]);
    }
    v60 = [v4 auxiliaryAlignment];

    if (v60)
    {
      v61 = [v4 auxiliaryAlignment];
      -[_SFPBRichTitleCardSection setAuxiliaryAlignment:](v5, "setAuxiliaryAlignment:", [v61 intValue]);
    }
    if ([v4 hasHideVerticalDivider]) {
      -[_SFPBRichTitleCardSection setHideVerticalDivider:](v5, "setHideVerticalDivider:", [v4 hideVerticalDivider]);
    }
    if ([v4 hasTitleAlign]) {
      -[_SFPBRichTitleCardSection setTitleAlign:](v5, "setTitleAlign:", [v4 titleAlign]);
    }
    v62 = [v4 titleWeight];

    if (v62)
    {
      v63 = [v4 titleWeight];
      -[_SFPBRichTitleCardSection setTitleWeight:](v5, "setTitleWeight:", [v63 intValue]);
    }
    if ([v4 hasTitleNoWrap]) {
      -[_SFPBRichTitleCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", [v4 titleNoWrap]);
    }
    if ([v4 hasThumbnailCropCircle]) {
      -[_SFPBRichTitleCardSection setThumbnailCropCircle:](v5, "setThumbnailCropCircle:", [v4 thumbnailCropCircle]);
    }
    v64 = [v4 imageOverlay];

    if (v64)
    {
      v65 = [_SFPBImage alloc];
      v66 = [v4 imageOverlay];
      v67 = [(_SFPBImage *)v65 initWithFacade:v66];
      [(_SFPBRichTitleCardSection *)v5 setImageOverlay:v67];
    }
    v68 = [v4 playAction];

    if (v68)
    {
      v69 = [_SFPBActionItem alloc];
      v70 = [v4 playAction];
      v71 = [(_SFPBActionItem *)v69 initWithFacade:v70];
      [(_SFPBRichTitleCardSection *)v5 setPlayAction:v71];
    }
    if ([v4 hasPlayActionAlign]) {
      -[_SFPBRichTitleCardSection setPlayActionAlign:](v5, "setPlayActionAlign:", [v4 playActionAlign]);
    }
    v72 = [v4 offers];
    if (v72)
    {
      id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v73 = 0;
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v97 = v4;
    v74 = [v4 offers];
    uint64_t v75 = [v74 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v103;
      do
      {
        for (uint64_t k = 0; k != v76; ++k)
        {
          if (*(void *)v103 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = [[_SFPBMediaOffer alloc] initWithFacade:*(void *)(*((void *)&v102 + 1) + 8 * k)];
          if (v79) {
            [v73 addObject:v79];
          }
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v102 objects:v115 count:16];
      }
      while (v76);
    }

    [(_SFPBRichTitleCardSection *)v5 setOffers:v73];
    v80 = [v4 footnote];

    if (v80)
    {
      v81 = [v4 footnote];
      [(_SFPBRichTitleCardSection *)v5 setFootnote:v81];
    }
    v82 = [v4 richSubtitle];

    if (v82)
    {
      v83 = [_SFPBRichText alloc];
      v84 = [v4 richSubtitle];
      v85 = [(_SFPBRichText *)v83 initWithFacade:v84];
      [(_SFPBRichTitleCardSection *)v5 setRichSubtitle:v85];
    }
    if ([v4 hasSubtitleIsEmphasized]) {
      -[_SFPBRichTitleCardSection setSubtitleIsEmphasized:](v5, "setSubtitleIsEmphasized:", [v4 subtitleIsEmphasized]);
    }
    v86 = [v4 buttonItems];
    v96 = v5;
    if (v86)
    {
      id v87 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v87 = 0;
    }

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v88 = [v4 buttonItems];
    uint64_t v89 = [v88 countByEnumeratingWithState:&v98 objects:v114 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v99;
      do
      {
        for (uint64_t m = 0; m != v90; ++m)
        {
          if (*(void *)v99 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v98 + 1) + 8 * m)];
          if (v93) {
            [v87 addObject:v93];
          }
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v98 objects:v114 count:16];
      }
      while (v90);
    }

    v5 = v96;
    [(_SFPBRichTitleCardSection *)v96 setButtonItems:v87];
    v94 = v96;

    id v4 = v97;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_richSubtitle, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_imageOverlay, 0);
  objc_storeStrong((id *)&self->_auxiliaryBottomText, 0);
  objc_storeStrong((id *)&self->_auxiliaryMiddleText, 0);
  objc_storeStrong((id *)&self->_auxiliaryTopText, 0);
  objc_storeStrong((id *)&self->_moreGlyphs, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_ratingText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (BOOL)subtitleIsEmphasized
{
  return self->_subtitleIsEmphasized;
}

- (_SFPBRichText)richSubtitle
{
  return self->_richSubtitle;
}

- (NSString)footnote
{
  return self->_footnote;
}

- (NSArray)offers
{
  return self->_offers;
}

- (int)playActionAlign
{
  return self->_playActionAlign;
}

- (_SFPBActionItem)playAction
{
  return self->_playAction;
}

- (_SFPBImage)imageOverlay
{
  return self->_imageOverlay;
}

- (BOOL)thumbnailCropCircle
{
  return self->_thumbnailCropCircle;
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (int)titleWeight
{
  return self->_titleWeight;
}

- (int)titleAlign
{
  return self->_titleAlign;
}

- (BOOL)hideVerticalDivider
{
  return self->_hideVerticalDivider;
}

- (int)auxiliaryAlignment
{
  return self->_auxiliaryAlignment;
}

- (int)auxiliaryBottomTextColor
{
  return self->_auxiliaryBottomTextColor;
}

- (NSString)auxiliaryBottomText
{
  return self->_auxiliaryBottomText;
}

- (NSString)auxiliaryMiddleText
{
  return self->_auxiliaryMiddleText;
}

- (NSString)auxiliaryTopText
{
  return self->_auxiliaryTopText;
}

- (NSArray)moreGlyphs
{
  return self->_moreGlyphs;
}

- (BOOL)reviewNewLine
{
  return self->_reviewNewLine;
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (_SFPBImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (NSString)ratingText
{
  return self->_ratingText;
}

- (float)rating
{
  return self->_rating;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (_SFPBImage)titleImage
{
  return self->_titleImage;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
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

- (_SFPBRichTitleCardSection)initWithDictionary:(id)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v149.receiver = self;
  v149.super_class = (Class)_SFPBRichTitleCardSection;
  v5 = [(_SFPBRichTitleCardSection *)&v149 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    v132 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v145 objects:v153 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v146;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v146 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v145 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBRichTitleCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v145 objects:v153 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBRichTitleCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    long long v101 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBRichTitleCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    long long v100 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    v131 = v18;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v130 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v129 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v128 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBRichTitleCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v127 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    v126 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBRichTitleCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    v125 = v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBRichTitleCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    v124 = v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBRichTitleCardSection *)v5 setSubtitle:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"contentAdvisory"];
    objc_opt_class();
    v123 = v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 copy];
      [(_SFPBRichTitleCardSection *)v5 setContentAdvisory:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"titleImage"];
    objc_opt_class();
    v122 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBImage alloc] initWithDictionary:v32];
      [(_SFPBRichTitleCardSection *)v5 setTitleImage:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"isCentered"];
    objc_opt_class();
    v121 = v34;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setIsCentered:](v5, "setIsCentered:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"descriptionText"];
    objc_opt_class();
    v120 = v35;
    if (objc_opt_isKindOfClass())
    {
      v36 = (void *)[v35 copy];
      [(_SFPBRichTitleCardSection *)v5 setDescriptionText:v36];
    }
    v37 = [v4 objectForKeyedSubscript:@"rating"];
    objc_opt_class();
    v119 = v37;
    if (objc_opt_isKindOfClass())
    {
      [v37 floatValue];
      -[_SFPBRichTitleCardSection setRating:](v5, "setRating:");
    }
    v38 = [v4 objectForKeyedSubscript:@"ratingText"];
    objc_opt_class();
    uint64_t v118 = v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = (void *)[v38 copy];
      [(_SFPBRichTitleCardSection *)v5 setRatingText:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"reviewGlyph"];
    objc_opt_class();
    v117 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      v41 = [[_SFPBImage alloc] initWithDictionary:v40];
      [(_SFPBRichTitleCardSection *)v5 setReviewGlyph:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"reviewText"];
    objc_opt_class();
    v116 = v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = (void *)[v42 copy];
      [(_SFPBRichTitleCardSection *)v5 setReviewText:v43];
    }
    v44 = [v4 objectForKeyedSubscript:@"reviewNewLine"];
    objc_opt_class();
    v115 = v44;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", [v44 BOOLValue]);
    }
    v45 = [v4 objectForKeyedSubscript:@"moreGlyphs"];
    objc_opt_class();
    v114 = v45;
    if (objc_opt_isKindOfClass())
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v141 objects:v152 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v142;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v142 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v141 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v52 = [[_SFPBImage alloc] initWithDictionary:v51];
              [(_SFPBRichTitleCardSection *)v5 addMoreGlyphs:v52];
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v141 objects:v152 count:16];
        }
        while (v48);
      }
    }
    v53 = [v4 objectForKeyedSubscript:@"auxiliaryTopText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v54 = (void *)[v53 copy];
      [(_SFPBRichTitleCardSection *)v5 setAuxiliaryTopText:v54];
    }
    v55 = [v4 objectForKeyedSubscript:@"auxiliaryMiddleText"];
    objc_opt_class();
    long long v113 = v55;
    if (objc_opt_isKindOfClass())
    {
      v56 = (void *)[v55 copy];
      [(_SFPBRichTitleCardSection *)v5 setAuxiliaryMiddleText:v56];
    }
    v57 = [v4 objectForKeyedSubscript:@"auxiliaryBottomText"];
    objc_opt_class();
    long long v112 = v57;
    if (objc_opt_isKindOfClass())
    {
      v58 = (void *)[v57 copy];
      [(_SFPBRichTitleCardSection *)v5 setAuxiliaryBottomText:v58];
    }
    v59 = [v4 objectForKeyedSubscript:@"auxiliaryBottomTextColor"];
    objc_opt_class();
    long long v111 = v59;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", [v59 intValue]);
    }
    v60 = [v4 objectForKeyedSubscript:@"auxiliaryAlignment"];
    objc_opt_class();
    long long v110 = v60;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setAuxiliaryAlignment:](v5, "setAuxiliaryAlignment:", [v60 intValue]);
    }
    v61 = [v4 objectForKeyedSubscript:@"hideVerticalDivider"];
    objc_opt_class();
    long long v109 = v61;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setHideVerticalDivider:](v5, "setHideVerticalDivider:", [v61 BOOLValue]);
    }
    v62 = [v4 objectForKeyedSubscript:@"titleAlign"];
    objc_opt_class();
    long long v108 = v62;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setTitleAlign:](v5, "setTitleAlign:", [v62 intValue]);
    }
    v63 = [v4 objectForKeyedSubscript:@"titleWeight"];
    objc_opt_class();
    long long v107 = v63;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setTitleWeight:](v5, "setTitleWeight:", [v63 intValue]);
    }
    v64 = [v4 objectForKeyedSubscript:@"titleNoWrap"];
    objc_opt_class();
    long long v106 = v64;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", [v64 BOOLValue]);
    }
    v65 = [v4 objectForKeyedSubscript:@"thumbnailCropCircle"];
    objc_opt_class();
    long long v105 = v65;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setThumbnailCropCircle:](v5, "setThumbnailCropCircle:", [v65 BOOLValue]);
    }
    uint64_t v66 = [v4 objectForKeyedSubscript:@"imageOverlay"];
    objc_opt_class();
    long long v104 = (void *)v66;
    if (objc_opt_isKindOfClass())
    {
      v67 = [[_SFPBImage alloc] initWithDictionary:v66];
      [(_SFPBRichTitleCardSection *)v5 setImageOverlay:v67];
    }
    v68 = [v4 objectForKeyedSubscript:@"playAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v69 = [[_SFPBActionItem alloc] initWithDictionary:v68];
      [(_SFPBRichTitleCardSection *)v5 setPlayAction:v69];
    }
    v70 = [v4 objectForKeyedSubscript:@"playActionAlign"];
    objc_opt_class();
    long long v103 = v70;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setPlayActionAlign:](v5, "setPlayActionAlign:", [v70 intValue]);
    }
    v71 = [v4 objectForKeyedSubscript:@"offers"];
    objc_opt_class();
    long long v102 = v71;
    long long v98 = v68;
    long long v99 = v53;
    if (objc_opt_isKindOfClass())
    {
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v72 = v71;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v137 objects:v151 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v138;
        do
        {
          for (uint64_t k = 0; k != v74; ++k)
          {
            if (*(void *)v138 != v75) {
              objc_enumerationMutation(v72);
            }
            uint64_t v77 = *(void *)(*((void *)&v137 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v78 = [[_SFPBMediaOffer alloc] initWithDictionary:v77];
              [(_SFPBRichTitleCardSection *)v5 addOffers:v78];
            }
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v137 objects:v151 count:16];
        }
        while (v74);
      }

      v68 = v98;
      v53 = v99;
    }
    v79 = [v4 objectForKeyedSubscript:@"footnote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v80 = (void *)[v79 copy];
      [(_SFPBRichTitleCardSection *)v5 setFootnote:v80];
    }
    v81 = [v4 objectForKeyedSubscript:@"richSubtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v82 = v81;
      v83 = [[_SFPBRichText alloc] initWithDictionary:v81];
      [(_SFPBRichTitleCardSection *)v5 setRichSubtitle:v83];

      v81 = v82;
    }
    v84 = [v4 objectForKeyedSubscript:@"subtitleIsEmphasized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRichTitleCardSection setSubtitleIsEmphasized:](v5, "setSubtitleIsEmphasized:", [v84 BOOLValue]);
    }
    v85 = [v4 objectForKeyedSubscript:@"buttonItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v95 = v84;
      v96 = v81;
      id v97 = v79;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v86 = v85;
      uint64_t v87 = [v86 countByEnumeratingWithState:&v133 objects:v150 count:16];
      if (v87)
      {
        uint64_t v88 = v87;
        uint64_t v89 = *(void *)v134;
        do
        {
          for (uint64_t m = 0; m != v88; ++m)
          {
            if (*(void *)v134 != v89) {
              objc_enumerationMutation(v86);
            }
            uint64_t v91 = *(void *)(*((void *)&v133 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v92 = [[_SFPBButtonItem alloc] initWithDictionary:v91];
              [(_SFPBRichTitleCardSection *)v5 addButtonItems:v92];
            }
          }
          uint64_t v88 = [v86 countByEnumeratingWithState:&v133 objects:v150 count:16];
        }
        while (v88);
      }

      v68 = v98;
      v53 = v99;
      v81 = v96;
      v79 = v97;
      v84 = v95;
    }
    v93 = v5;
  }
  return v5;
}

- (_SFPBRichTitleCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRichTitleCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRichTitleCardSection *)self dictionaryRepresentation];
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
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = 0x1E4F28000uLL;
  if (self->_auxiliaryAlignment)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment"));
    [v3 setObject:v5 forKeyedSubscript:@"auxiliaryAlignment"];
  }
  if (self->_auxiliaryBottomText)
  {
    v6 = [(_SFPBRichTitleCardSection *)self auxiliaryBottomText];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"auxiliaryBottomText"];
  }
  if (self->_auxiliaryBottomTextColor)
  {
    uint64_t v8 = [(_SFPBRichTitleCardSection *)self auxiliaryBottomTextColor];
    if (v8 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = off_1E5A2EF80[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"auxiliaryBottomTextColor"];
  }
  if (self->_auxiliaryMiddleText)
  {
    uint64_t v10 = [(_SFPBRichTitleCardSection *)self auxiliaryMiddleText];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"auxiliaryMiddleText"];
  }
  if (self->_auxiliaryTopText)
  {
    uint64_t v12 = [(_SFPBRichTitleCardSection *)self auxiliaryTopText];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"auxiliaryTopText"];
  }
  if (self->_backgroundColor)
  {
    v14 = [(_SFPBRichTitleCardSection *)self backgroundColor];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if ([(NSArray *)self->_buttonItems count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v18 = self->_buttonItems;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v116 objects:v123 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v117 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v116 + 1) + 8 * i) dictionaryRepresentation];
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v116 objects:v123 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"buttonItems"];
    unint64_t v4 = 0x1E4F28000uLL;
  }
  if (self->_canBeHidden)
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRichTitleCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v25 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_contentAdvisory)
  {
    v26 = [(_SFPBRichTitleCardSection *)self contentAdvisory];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"contentAdvisory"];
  }
  if (self->_descriptionText)
  {
    v28 = [(_SFPBRichTitleCardSection *)self descriptionText];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"descriptionText"];
  }
  if (self->_footnote)
  {
    v30 = [(_SFPBRichTitleCardSection *)self footnote];
    v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"footnote"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRichTitleCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v32 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v33 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRichTitleCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v33 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_hideVerticalDivider)
  {
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider"));
    [v3 setObject:v34 forKeyedSubscript:@"hideVerticalDivider"];
  }
  if (self->_imageOverlay)
  {
    v35 = [(_SFPBRichTitleCardSection *)self imageOverlay];
    v36 = [v35 dictionaryRepresentation];
    if (v36)
    {
      [v3 setObject:v36 forKeyedSubscript:@"imageOverlay"];
    }
    else
    {
      v37 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v37 forKeyedSubscript:@"imageOverlay"];
    }
  }
  if (self->_isCentered)
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRichTitleCardSection isCentered](self, "isCentered"));
    [v3 setObject:v38 forKeyedSubscript:@"isCentered"];
  }
  if ([(NSArray *)self->_moreGlyphs count])
  {
    v39 = [MEMORY[0x1E4F1CA48] array];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    uint64_t v40 = self->_moreGlyphs;
    uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v112 objects:v122 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v113;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v113 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v112 + 1) + 8 * j) dictionaryRepresentation];
          if (v45)
          {
            [v39 addObject:v45];
          }
          else
          {
            id v46 = [MEMORY[0x1E4F1CA98] null];
            [v39 addObject:v46];
          }
        }
        uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v112 objects:v122 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKeyedSubscript:@"moreGlyphs"];
    unint64_t v4 = 0x1E4F28000;
  }
  if ([(NSArray *)self->_offers count])
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    uint64_t v48 = self->_offers;
    uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v108 objects:v121 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v109;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v109 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [*(id *)(*((void *)&v108 + 1) + 8 * k) dictionaryRepresentation];
          if (v53)
          {
            [v47 addObject:v53];
          }
          else
          {
            v54 = [MEMORY[0x1E4F1CA98] null];
            [v47 addObject:v54];
          }
        }
        uint64_t v50 = [(NSArray *)v48 countByEnumeratingWithState:&v108 objects:v121 count:16];
      }
      while (v50);
    }

    [v3 setObject:v47 forKeyedSubscript:@"offers"];
    unint64_t v4 = 0x1E4F28000;
  }
  if (self->_playAction)
  {
    v55 = [(_SFPBRichTitleCardSection *)self playAction];
    v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"playAction"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"playAction"];
    }
  }
  if (self->_playActionAlign)
  {
    uint64_t v58 = [(_SFPBRichTitleCardSection *)self playActionAlign];
    if (v58 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v58);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E5A2F090[v58];
    }
    [v3 setObject:v59 forKeyedSubscript:@"playActionAlign"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v60 = [MEMORY[0x1E4F1CA48] array];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v61 = self->_punchoutOptions;
    uint64_t v62 = [(NSArray *)v61 countByEnumeratingWithState:&v104 objects:v120 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v105;
      do
      {
        for (uint64_t m = 0; m != v63; ++m)
        {
          if (*(void *)v105 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = [*(id *)(*((void *)&v104 + 1) + 8 * m) dictionaryRepresentation];
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
        uint64_t v63 = [(NSArray *)v61 countByEnumeratingWithState:&v104 objects:v120 count:16];
      }
      while (v63);
    }

    [v3 setObject:v60 forKeyedSubscript:@"punchoutOptions"];
    unint64_t v4 = 0x1E4F28000uLL;
  }
  if (self->_punchoutPickerDismissText)
  {
    v68 = [(_SFPBRichTitleCardSection *)self punchoutPickerDismissText];
    v69 = (void *)[v68 copy];
    [v3 setObject:v69 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v70 = [(_SFPBRichTitleCardSection *)self punchoutPickerTitle];
    v71 = (void *)[v70 copy];
    [v3 setObject:v71 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_rating != 0.0)
  {
    id v72 = *(void **)(v4 + 3792);
    [(_SFPBRichTitleCardSection *)self rating];
    uint64_t v73 = objc_msgSend(v72, "numberWithFloat:");
    [v3 setObject:v73 forKeyedSubscript:@"rating"];
  }
  if (self->_ratingText)
  {
    uint64_t v74 = [(_SFPBRichTitleCardSection *)self ratingText];
    uint64_t v75 = (void *)[v74 copy];
    [v3 setObject:v75 forKeyedSubscript:@"ratingText"];
  }
  if (self->_reviewGlyph)
  {
    uint64_t v76 = [(_SFPBRichTitleCardSection *)self reviewGlyph];
    uint64_t v77 = [v76 dictionaryRepresentation];
    if (v77)
    {
      [v3 setObject:v77 forKeyedSubscript:@"reviewGlyph"];
    }
    else
    {
      v78 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v78 forKeyedSubscript:@"reviewGlyph"];
    }
  }
  if (self->_reviewNewLine)
  {
    v79 = objc_msgSend(*(id *)(v4 + 3792), "numberWithBool:", -[_SFPBRichTitleCardSection reviewNewLine](self, "reviewNewLine"));
    [v3 setObject:v79 forKeyedSubscript:@"reviewNewLine"];
  }
  if (self->_reviewText)
  {
    v80 = [(_SFPBRichTitleCardSection *)self reviewText];
    v81 = (void *)[v80 copy];
    [v3 setObject:v81 forKeyedSubscript:@"reviewText"];
  }
  if (self->_richSubtitle)
  {
    v82 = [(_SFPBRichTitleCardSection *)self richSubtitle];
    v83 = [v82 dictionaryRepresentation];
    if (v83)
    {
      [v3 setObject:v83 forKeyedSubscript:@"richSubtitle"];
    }
    else
    {
      v84 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v84 forKeyedSubscript:@"richSubtitle"];
    }
  }
  if (self->_separatorStyle)
  {
    uint64_t v85 = [(_SFPBRichTitleCardSection *)self separatorStyle];
    if (v85 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v85);
      id v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v86 = off_1E5A2F090[v85];
    }
    [v3 setObject:v86 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    uint64_t v87 = [(_SFPBRichTitleCardSection *)self subtitle];
    uint64_t v88 = (void *)[v87 copy];
    [v3 setObject:v88 forKeyedSubscript:@"subtitle"];
  }
  if (self->_subtitleIsEmphasized)
  {
    uint64_t v89 = objc_msgSend(*(id *)(v4 + 3792), "numberWithBool:", -[_SFPBRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized"));
    [v3 setObject:v89 forKeyedSubscript:@"subtitleIsEmphasized"];
  }
  if (self->_thumbnailCropCircle)
  {
    uint64_t v90 = objc_msgSend(*(id *)(v4 + 3792), "numberWithBool:", -[_SFPBRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle"));
    [v3 setObject:v90 forKeyedSubscript:@"thumbnailCropCircle"];
  }
  if (self->_title)
  {
    uint64_t v91 = [(_SFPBRichTitleCardSection *)self title];
    v92 = (void *)[v91 copy];
    [v3 setObject:v92 forKeyedSubscript:@"title"];
  }
  if (self->_titleAlign)
  {
    uint64_t v93 = [(_SFPBRichTitleCardSection *)self titleAlign];
    if (v93 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v93);
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v94 = off_1E5A2F058[v93];
    }
    [v3 setObject:v94 forKeyedSubscript:@"titleAlign"];
  }
  if (self->_titleImage)
  {
    v95 = [(_SFPBRichTitleCardSection *)self titleImage];
    v96 = [v95 dictionaryRepresentation];
    if (v96)
    {
      [v3 setObject:v96 forKeyedSubscript:@"titleImage"];
    }
    else
    {
      id v97 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v97 forKeyedSubscript:@"titleImage"];
    }
  }
  if (self->_titleNoWrap)
  {
    long long v98 = objc_msgSend(*(id *)(v4 + 3792), "numberWithBool:", -[_SFPBRichTitleCardSection titleNoWrap](self, "titleNoWrap"));
    [v3 setObject:v98 forKeyedSubscript:@"titleNoWrap"];
  }
  if (self->_titleWeight)
  {
    long long v99 = objc_msgSend(*(id *)(v4 + 3792), "numberWithInt:", -[_SFPBRichTitleCardSection titleWeight](self, "titleWeight"));
    [v3 setObject:v99 forKeyedSubscript:@"titleWeight"];
  }
  if (self->_type)
  {
    long long v100 = [(_SFPBRichTitleCardSection *)self type];
    long long v101 = (void *)[v100 copy];
    [v3 setObject:v101 forKeyedSubscript:@"type"];
  }
  id v102 = v3;

  return v102;
}

- (unint64_t)hash
{
  uint64_t v64 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v63 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v62 = [(NSString *)self->_punchoutPickerDismissText hash];
  BOOL canBeHidden = self->_canBeHidden;
  BOOL hasTopPadding = self->_hasTopPadding;
  BOOL hasBottomPadding = self->_hasBottomPadding;
  NSUInteger v61 = [(NSString *)self->_type hash];
  uint64_t separatorStyle = self->_separatorStyle;
  unint64_t v60 = [(_SFPBColor *)self->_backgroundColor hash];
  NSUInteger v58 = [(NSString *)self->_title hash];
  NSUInteger v59 = [(NSString *)self->_subtitle hash];
  NSUInteger v57 = [(NSString *)self->_contentAdvisory hash];
  unint64_t v56 = [(_SFPBImage *)self->_titleImage hash];
  BOOL isCentered = self->_isCentered;
  NSUInteger v55 = [(NSString *)self->_descriptionText hash];
  float rating = self->_rating;
  BOOL v9 = rating < 0.0;
  if (rating == 0.0)
  {
    unint64_t v54 = 0;
  }
  else
  {
    double v10 = rating;
    double v11 = -v10;
    if (!v9) {
      double v11 = v10;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    double v14 = fmod(v12, 1.84467441e19);
    unint64_t v15 = 2654435761u * (unint64_t)v14;
    unint64_t v16 = v15 + (unint64_t)v13;
    if (v13 <= 0.0) {
      unint64_t v16 = 2654435761u * (unint64_t)v14;
    }
    unint64_t v17 = v15 - (unint64_t)fabs(v13);
    if (v13 >= 0.0) {
      unint64_t v17 = v16;
    }
    unint64_t v54 = v17;
  }
  if (isCentered) {
    uint64_t v18 = 2654435761;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v53 = v18;
  if (hasBottomPadding) {
    uint64_t v19 = 2654435761;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v50 = v19;
  uint64_t v51 = 2654435761 * separatorStyle;
  if (hasTopPadding) {
    uint64_t v20 = 2654435761;
  }
  else {
    uint64_t v20 = 0;
  }
  if (canBeHidden) {
    uint64_t v21 = 2654435761;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v47 = v21;
  uint64_t v48 = v20;
  NSUInteger v52 = [(NSString *)self->_ratingText hash];
  unint64_t v49 = [(_SFPBImage *)self->_reviewGlyph hash];
  NSUInteger v22 = [(NSString *)self->_reviewText hash];
  if (self->_reviewNewLine) {
    uint64_t v23 = 2654435761;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v45 = v23;
  NSUInteger v46 = v22;
  uint64_t v44 = [(NSArray *)self->_moreGlyphs hash];
  NSUInteger v43 = [(NSString *)self->_auxiliaryTopText hash];
  NSUInteger v42 = [(NSString *)self->_auxiliaryMiddleText hash];
  NSUInteger v24 = [(NSString *)self->_auxiliaryBottomText hash];
  uint64_t v40 = 2654435761 * self->_auxiliaryBottomTextColor;
  NSUInteger v41 = v24;
  if (self->_hideVerticalDivider) {
    uint64_t v25 = 2654435761;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v38 = v25;
  uint64_t v39 = 2654435761 * self->_auxiliaryAlignment;
  uint64_t v37 = 2654435761 * self->_titleAlign;
  uint64_t v26 = 2654435761 * self->_titleWeight;
  if (self->_titleNoWrap) {
    uint64_t v27 = 2654435761;
  }
  else {
    uint64_t v27 = 0;
  }
  if (self->_thumbnailCropCircle) {
    uint64_t v28 = 2654435761;
  }
  else {
    uint64_t v28 = 0;
  }
  unint64_t v29 = [(_SFPBImage *)self->_imageOverlay hash];
  unint64_t v30 = [(_SFPBActionItem *)self->_playAction hash];
  uint64_t v31 = 2654435761 * self->_playActionAlign;
  uint64_t v32 = [(NSArray *)self->_offers hash];
  NSUInteger v33 = [(NSString *)self->_footnote hash];
  unint64_t v34 = [(_SFPBRichText *)self->_richSubtitle hash];
  if (self->_subtitleIsEmphasized) {
    uint64_t v35 = 2654435761;
  }
  else {
    uint64_t v35 = 0;
  }
  return v63 ^ v64 ^ v62 ^ v47 ^ v48 ^ v50 ^ v61 ^ v51 ^ v60 ^ v58 ^ v59 ^ v57 ^ v56 ^ v53 ^ v55 ^ v54 ^ v52 ^ v49 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ [(NSArray *)self->_buttonItems hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self punchoutOptions];
  v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v7 = [(_SFPBRichTitleCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    BOOL v9 = [(_SFPBRichTitleCardSection *)self punchoutOptions];
    double v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self punchoutPickerTitle];
  v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v12 = [(_SFPBRichTitleCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    double v13 = (void *)v12;
    double v14 = [(_SFPBRichTitleCardSection *)self punchoutPickerTitle];
    unint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self punchoutPickerDismissText];
  v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v17 = [(_SFPBRichTitleCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRichTitleCardSection *)self punchoutPickerDismissText];
    uint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_133;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_133;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self type];
  v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v25 = [(_SFPBRichTitleCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBRichTitleCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self backgroundColor];
  v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v31 = [(_SFPBRichTitleCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    NSUInteger v33 = [(_SFPBRichTitleCardSection *)self backgroundColor];
    unint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v36 = [(_SFPBRichTitleCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBRichTitleCardSection *)self title];
    uint64_t v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self subtitle];
  v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v41 = [(_SFPBRichTitleCardSection *)self subtitle];
  if (v41)
  {
    NSUInteger v42 = (void *)v41;
    NSUInteger v43 = [(_SFPBRichTitleCardSection *)self subtitle];
    uint64_t v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self contentAdvisory];
  v6 = [v4 contentAdvisory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v46 = [(_SFPBRichTitleCardSection *)self contentAdvisory];
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    uint64_t v48 = [(_SFPBRichTitleCardSection *)self contentAdvisory];
    unint64_t v49 = [v4 contentAdvisory];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self titleImage];
  v6 = [v4 titleImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v51 = [(_SFPBRichTitleCardSection *)self titleImage];
  if (v51)
  {
    NSUInteger v52 = (void *)v51;
    uint64_t v53 = [(_SFPBRichTitleCardSection *)self titleImage];
    unint64_t v54 = [v4 titleImage];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int isCentered = self->_isCentered;
  if (isCentered != [v4 isCentered]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self descriptionText];
  v6 = [v4 descriptionText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v57 = [(_SFPBRichTitleCardSection *)self descriptionText];
  if (v57)
  {
    NSUInteger v58 = (void *)v57;
    NSUInteger v59 = [(_SFPBRichTitleCardSection *)self descriptionText];
    unint64_t v60 = [v4 descriptionText];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  float rating = self->_rating;
  [v4 rating];
  if (rating != v63) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self ratingText];
  v6 = [v4 ratingText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v64 = [(_SFPBRichTitleCardSection *)self ratingText];
  if (v64)
  {
    v65 = (void *)v64;
    uint64_t v66 = [(_SFPBRichTitleCardSection *)self ratingText];
    v67 = [v4 ratingText];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self reviewGlyph];
  v6 = [v4 reviewGlyph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v69 = [(_SFPBRichTitleCardSection *)self reviewGlyph];
  if (v69)
  {
    v70 = (void *)v69;
    v71 = [(_SFPBRichTitleCardSection *)self reviewGlyph];
    id v72 = [v4 reviewGlyph];
    int v73 = [v71 isEqual:v72];

    if (!v73) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self reviewText];
  v6 = [v4 reviewText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v74 = [(_SFPBRichTitleCardSection *)self reviewText];
  if (v74)
  {
    uint64_t v75 = (void *)v74;
    uint64_t v76 = [(_SFPBRichTitleCardSection *)self reviewText];
    uint64_t v77 = [v4 reviewText];
    int v78 = [v76 isEqual:v77];

    if (!v78) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int reviewNewLine = self->_reviewNewLine;
  if (reviewNewLine != [v4 reviewNewLine]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self moreGlyphs];
  v6 = [v4 moreGlyphs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v80 = [(_SFPBRichTitleCardSection *)self moreGlyphs];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(_SFPBRichTitleCardSection *)self moreGlyphs];
    v83 = [v4 moreGlyphs];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self auxiliaryTopText];
  v6 = [v4 auxiliaryTopText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v85 = [(_SFPBRichTitleCardSection *)self auxiliaryTopText];
  if (v85)
  {
    id v86 = (void *)v85;
    uint64_t v87 = [(_SFPBRichTitleCardSection *)self auxiliaryTopText];
    uint64_t v88 = [v4 auxiliaryTopText];
    int v89 = [v87 isEqual:v88];

    if (!v89) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self auxiliaryMiddleText];
  v6 = [v4 auxiliaryMiddleText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v90 = [(_SFPBRichTitleCardSection *)self auxiliaryMiddleText];
  if (v90)
  {
    uint64_t v91 = (void *)v90;
    v92 = [(_SFPBRichTitleCardSection *)self auxiliaryMiddleText];
    uint64_t v93 = [v4 auxiliaryMiddleText];
    int v94 = [v92 isEqual:v93];

    if (!v94) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self auxiliaryBottomText];
  v6 = [v4 auxiliaryBottomText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v95 = [(_SFPBRichTitleCardSection *)self auxiliaryBottomText];
  if (v95)
  {
    v96 = (void *)v95;
    id v97 = [(_SFPBRichTitleCardSection *)self auxiliaryBottomText];
    long long v98 = [v4 auxiliaryBottomText];
    int v99 = [v97 isEqual:v98];

    if (!v99) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int auxiliaryBottomTextColor = self->_auxiliaryBottomTextColor;
  if (auxiliaryBottomTextColor != [v4 auxiliaryBottomTextColor]) {
    goto LABEL_133;
  }
  int auxiliaryAlignment = self->_auxiliaryAlignment;
  if (auxiliaryAlignment != [v4 auxiliaryAlignment]) {
    goto LABEL_133;
  }
  int hideVerticalDivider = self->_hideVerticalDivider;
  if (hideVerticalDivider != [v4 hideVerticalDivider]) {
    goto LABEL_133;
  }
  int titleAlign = self->_titleAlign;
  if (titleAlign != [v4 titleAlign]) {
    goto LABEL_133;
  }
  int titleWeight = self->_titleWeight;
  if (titleWeight != [v4 titleWeight]) {
    goto LABEL_133;
  }
  int titleNoWrap = self->_titleNoWrap;
  if (titleNoWrap != [v4 titleNoWrap]) {
    goto LABEL_133;
  }
  int thumbnailCropCircle = self->_thumbnailCropCircle;
  if (thumbnailCropCircle != [v4 thumbnailCropCircle]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self imageOverlay];
  v6 = [v4 imageOverlay];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v107 = [(_SFPBRichTitleCardSection *)self imageOverlay];
  if (v107)
  {
    long long v108 = (void *)v107;
    long long v109 = [(_SFPBRichTitleCardSection *)self imageOverlay];
    long long v110 = [v4 imageOverlay];
    int v111 = [v109 isEqual:v110];

    if (!v111) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self playAction];
  v6 = [v4 playAction];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v112 = [(_SFPBRichTitleCardSection *)self playAction];
  if (v112)
  {
    long long v113 = (void *)v112;
    long long v114 = [(_SFPBRichTitleCardSection *)self playAction];
    long long v115 = [v4 playAction];
    int v116 = [v114 isEqual:v115];

    if (!v116) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int playActionAlign = self->_playActionAlign;
  if (playActionAlign != [v4 playActionAlign]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self offers];
  v6 = [v4 offers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v118 = [(_SFPBRichTitleCardSection *)self offers];
  if (v118)
  {
    long long v119 = (void *)v118;
    v120 = [(_SFPBRichTitleCardSection *)self offers];
    v121 = [v4 offers];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self footnote];
  v6 = [v4 footnote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v123 = [(_SFPBRichTitleCardSection *)self footnote];
  if (v123)
  {
    uint64_t v124 = (void *)v123;
    v125 = [(_SFPBRichTitleCardSection *)self footnote];
    v126 = [v4 footnote];
    int v127 = [v125 isEqual:v126];

    if (!v127) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRichTitleCardSection *)self richSubtitle];
  v6 = [v4 richSubtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_132;
  }
  uint64_t v128 = [(_SFPBRichTitleCardSection *)self richSubtitle];
  if (v128)
  {
    v129 = (void *)v128;
    v130 = [(_SFPBRichTitleCardSection *)self richSubtitle];
    v131 = [v4 richSubtitle];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_133;
    }
  }
  else
  {
  }
  int subtitleIsEmphasized = self->_subtitleIsEmphasized;
  if (subtitleIsEmphasized != [v4 subtitleIsEmphasized]) {
    goto LABEL_133;
  }
  v5 = [(_SFPBRichTitleCardSection *)self buttonItems];
  v6 = [v4 buttonItems];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_132:

    goto LABEL_133;
  }
  uint64_t v134 = [(_SFPBRichTitleCardSection *)self buttonItems];
  if (!v134)
  {

LABEL_136:
    BOOL v139 = 1;
    goto LABEL_134;
  }
  long long v135 = (void *)v134;
  long long v136 = [(_SFPBRichTitleCardSection *)self buttonItems];
  long long v137 = [v4 buttonItems];
  char v138 = [v136 isEqual:v137];

  if (v138) {
    goto LABEL_136;
  }
LABEL_133:
  BOOL v139 = 0;
LABEL_134:

  return v139;
}

- (void)writeTo:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_SFPBRichTitleCardSection *)self punchoutOptions];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v58;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v7);
  }

  double v10 = [(_SFPBRichTitleCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBRichTitleCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRichTitleCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRichTitleCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRichTitleCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBRichTitleCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRichTitleCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  double v13 = [(_SFPBRichTitleCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  double v14 = [(_SFPBRichTitleCardSection *)self title];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  unint64_t v15 = [(_SFPBRichTitleCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBRichTitleCardSection *)self contentAdvisory];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  uint64_t v17 = [(_SFPBRichTitleCardSection *)self titleImage];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRichTitleCardSection *)self isCentered]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v18 = [(_SFPBRichTitleCardSection *)self descriptionText];
  if (v18) {
    PBDataWriterWriteStringField();
  }

  [(_SFPBRichTitleCardSection *)self rating];
  if (v19 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  uint64_t v20 = [(_SFPBRichTitleCardSection *)self ratingText];
  if (v20) {
    PBDataWriterWriteStringField();
  }

  int v21 = [(_SFPBRichTitleCardSection *)self reviewGlyph];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v22 = [(_SFPBRichTitleCardSection *)self reviewText];
  if (v22) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRichTitleCardSection *)self reviewNewLine]) {
    PBDataWriterWriteBOOLField();
  }
  [(_SFPBRichTitleCardSection *)self moreGlyphs];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v54;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v54 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v25);
  }

  uint64_t v28 = [(_SFPBRichTitleCardSection *)self auxiliaryTopText];
  if (v28) {
    PBDataWriterWriteStringField();
  }

  int v29 = [(_SFPBRichTitleCardSection *)self auxiliaryMiddleText];
  if (v29) {
    PBDataWriterWriteStringField();
  }

  unint64_t v30 = [(_SFPBRichTitleCardSection *)self auxiliaryBottomText];
  if (v30) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRichTitleCardSection *)self auxiliaryBottomTextColor]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRichTitleCardSection *)self auxiliaryAlignment]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRichTitleCardSection *)self hideVerticalDivider]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRichTitleCardSection *)self titleAlign]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRichTitleCardSection *)self titleWeight]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRichTitleCardSection *)self titleNoWrap]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRichTitleCardSection *)self thumbnailCropCircle]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v31 = [(_SFPBRichTitleCardSection *)self imageOverlay];
  if (v31) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v32 = [(_SFPBRichTitleCardSection *)self playAction];
  if (v32) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRichTitleCardSection *)self playActionAlign]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBRichTitleCardSection *)self offers];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v35);
  }

  uint64_t v38 = [(_SFPBRichTitleCardSection *)self footnote];
  if (v38) {
    PBDataWriterWriteStringField();
  }

  uint64_t v39 = [(_SFPBRichTitleCardSection *)self richSubtitle];
  if (v39) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRichTitleCardSection *)self subtitleIsEmphasized]) {
    PBDataWriterWriteBOOLField();
  }
  [(_SFPBRichTitleCardSection *)self buttonItems];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v40 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v46;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v42);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRichTitleCardSectionReadFrom(self, (uint64_t)a3, v3);
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

- (void)setSubtitleIsEmphasized:(BOOL)a3
{
  self->_int subtitleIsEmphasized = a3;
}

- (void)setRichSubtitle:(id)a3
{
}

- (void)setFootnote:(id)a3
{
  self->_footnote = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)offersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_offers objectAtIndexedSubscript:a3];
}

- (unint64_t)offersCount
{
  return [(NSArray *)self->_offers count];
}

- (void)addOffers:(id)a3
{
  id v4 = a3;
  offers = self->_offers;
  id v8 = v4;
  if (!offers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_offers;
    self->_offers = v6;

    id v4 = v8;
    offers = self->_offers;
  }
  [(NSArray *)offers addObject:v4];
}

- (void)clearOffers
{
}

- (void)setOffers:(id)a3
{
  self->_offers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPlayActionAlign:(int)a3
{
  self->_int playActionAlign = a3;
}

- (void)setPlayAction:(id)a3
{
}

- (void)setImageOverlay:(id)a3
{
}

- (void)setThumbnailCropCircle:(BOOL)a3
{
  self->_int thumbnailCropCircle = a3;
}

- (void)setTitleNoWrap:(BOOL)a3
{
  self->_int titleNoWrap = a3;
}

- (void)setTitleWeight:(int)a3
{
  self->_int titleWeight = a3;
}

- (void)setTitleAlign:(int)a3
{
  self->_int titleAlign = a3;
}

- (void)setHideVerticalDivider:(BOOL)a3
{
  self->_int hideVerticalDivider = a3;
}

- (void)setAuxiliaryAlignment:(int)a3
{
  self->_int auxiliaryAlignment = a3;
}

- (void)setAuxiliaryBottomTextColor:(int)a3
{
  self->_int auxiliaryBottomTextColor = a3;
}

- (void)setAuxiliaryBottomText:(id)a3
{
  self->_auxiliaryBottomText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAuxiliaryMiddleText:(id)a3
{
  self->_auxiliaryMiddleText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAuxiliaryTopText:(id)a3
{
  self->_auxiliaryTopText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)moreGlyphsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_moreGlyphs objectAtIndexedSubscript:a3];
}

- (unint64_t)moreGlyphsCount
{
  return [(NSArray *)self->_moreGlyphs count];
}

- (void)addMoreGlyphs:(id)a3
{
  id v4 = a3;
  moreGlyphs = self->_moreGlyphs;
  id v8 = v4;
  if (!moreGlyphs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_moreGlyphs;
    self->_moreGlyphs = v6;

    id v4 = v8;
    moreGlyphs = self->_moreGlyphs;
  }
  [(NSArray *)moreGlyphs addObject:v4];
}

- (void)clearMoreGlyphs
{
}

- (void)setMoreGlyphs:(id)a3
{
  self->_moreGlyphs = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setReviewNewLine:(BOOL)a3
{
  self->_int reviewNewLine = a3;
}

- (void)setReviewText:(id)a3
{
  self->_reviewText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setReviewGlyph:(id)a3
{
}

- (void)setRatingText:(id)a3
{
  self->_ratingText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setRating:(float)a3
{
  self->_float rating = a3;
}

- (void)setDescriptionText:(id)a3
{
  self->_descriptionText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsCentered:(BOOL)a3
{
  self->_int isCentered = a3;
}

- (void)setTitleImage:(id)a3
{
}

- (void)setContentAdvisory:(id)a3
{
  self->_contentAdvisory = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSubtitle:(id)a3
{
  self->_subtitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
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