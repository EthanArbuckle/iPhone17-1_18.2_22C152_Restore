@interface SFRichTitleCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAuxiliaryBottomTextColor;
- (BOOL)hasHideVerticalDivider;
- (BOOL)hasPlayActionAlign;
- (BOOL)hasReviewNewLine;
- (BOOL)hasSubtitleIsEmphasized;
- (BOOL)hasThumbnailCropCircle;
- (BOOL)hasTitleAlign;
- (BOOL)hasTitleNoWrap;
- (BOOL)hideVerticalDivider;
- (BOOL)isEqual:(id)a3;
- (BOOL)reviewNewLine;
- (BOOL)subtitleIsEmphasized;
- (BOOL)thumbnailCropCircle;
- (BOOL)titleNoWrap;
- (NSArray)buttonItems;
- (NSArray)moreGlyphs;
- (NSArray)offers;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)auxiliaryAlignment;
- (NSNumber)rating;
- (NSNumber)titleWeight;
- (NSString)auxiliaryBottomText;
- (NSString)auxiliaryMiddleText;
- (NSString)auxiliaryTopText;
- (NSString)contentAdvisory;
- (NSString)descriptionText;
- (NSString)footnote;
- (NSString)ratingText;
- (NSString)reviewText;
- (SFActionItem)playAction;
- (SFImage)imageOverlay;
- (SFImage)reviewGlyph;
- (SFImage)titleImage;
- (SFRichText)richSubtitle;
- (SFRichTitleCardSection)initWithCoder:(id)a3;
- (SFRichTitleCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)auxiliaryBottomTextColor;
- (int)playActionAlign;
- (int)titleAlign;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuxiliaryAlignment:(id)a3;
- (void)setAuxiliaryBottomText:(id)a3;
- (void)setAuxiliaryBottomTextColor:(int)a3;
- (void)setAuxiliaryMiddleText:(id)a3;
- (void)setAuxiliaryTopText:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setContentAdvisory:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setHideVerticalDivider:(BOOL)a3;
- (void)setImageOverlay:(id)a3;
- (void)setMoreGlyphs:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPlayAction:(id)a3;
- (void)setPlayActionAlign:(int)a3;
- (void)setRating:(id)a3;
- (void)setRatingText:(id)a3;
- (void)setReviewGlyph:(id)a3;
- (void)setReviewNewLine:(BOOL)a3;
- (void)setReviewText:(id)a3;
- (void)setRichSubtitle:(id)a3;
- (void)setSubtitleIsEmphasized:(BOOL)a3;
- (void)setThumbnailCropCircle:(BOOL)a3;
- (void)setTitleAlign:(int)a3;
- (void)setTitleImage:(id)a3;
- (void)setTitleNoWrap:(BOOL)a3;
- (void)setTitleWeight:(id)a3;
@end

@implementation SFRichTitleCardSection

- (SFRichTitleCardSection)initWithProtobuf:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)SFRichTitleCardSection;
  v5 = [(SFCardSection *)&v113 init];

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

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v109 objects:v117 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v110 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v109 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v109 objects:v117 count:16];
      }
      while (v10);
    }

    [(SFCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(SFCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(SFCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 canBeHidden]) {
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasTopPadding]) {
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasBottomPadding]) {
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(SFTitleCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [SFColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(SFTitleCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(SFTitleCardSection *)v5 setSubtitle:v27];
    }
    v28 = [v4 contentAdvisory];

    if (v28)
    {
      v29 = [v4 contentAdvisory];
      [(SFRichTitleCardSection *)v5 setContentAdvisory:v29];
    }
    v30 = [v4 titleImage];

    if (v30)
    {
      v31 = [SFImage alloc];
      v32 = [v4 titleImage];
      v33 = [(SFImage *)v31 initWithProtobuf:v32];
      [(SFRichTitleCardSection *)v5 setTitleImage:v33];
    }
    if ([v4 isCentered]) {
      -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", [v4 isCentered]);
    }
    v34 = [v4 descriptionText];

    if (v34)
    {
      v35 = [v4 descriptionText];
      [(SFRichTitleCardSection *)v5 setDescriptionText:v35];
    }
    [v4 rating];
    if (v36 != 0.0)
    {
      v37 = NSNumber;
      [v4 rating];
      v38 = objc_msgSend(v37, "numberWithFloat:");
      [(SFRichTitleCardSection *)v5 setRating:v38];
    }
    v39 = [v4 ratingText];

    if (v39)
    {
      v40 = [v4 ratingText];
      [(SFRichTitleCardSection *)v5 setRatingText:v40];
    }
    v41 = [v4 reviewGlyph];

    if (v41)
    {
      v42 = [SFImage alloc];
      v43 = [v4 reviewGlyph];
      v44 = [(SFImage *)v42 initWithProtobuf:v43];
      [(SFRichTitleCardSection *)v5 setReviewGlyph:v44];
    }
    v45 = [v4 reviewText];

    if (v45)
    {
      v46 = [v4 reviewText];
      [(SFRichTitleCardSection *)v5 setReviewText:v46];
    }
    if ([v4 reviewNewLine]) {
      -[SFRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", [v4 reviewNewLine]);
    }
    v47 = [v4 moreGlyphs];
    v96 = v5;
    if (v47)
    {
      id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v48 = 0;
    }

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v49 = [v4 moreGlyphs];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v106;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v106 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = [[SFImage alloc] initWithProtobuf:*(void *)(*((void *)&v105 + 1) + 8 * j)];
          if (v54) {
            [v48 addObject:v54];
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v105 objects:v116 count:16];
      }
      while (v51);
    }

    [(SFRichTitleCardSection *)v96 setMoreGlyphs:v48];
    v55 = [v4 auxiliaryTopText];

    if (v55)
    {
      v56 = [v4 auxiliaryTopText];
      [(SFRichTitleCardSection *)v96 setAuxiliaryTopText:v56];
    }
    v57 = [v4 auxiliaryMiddleText];

    if (v57)
    {
      v58 = [v4 auxiliaryMiddleText];
      [(SFRichTitleCardSection *)v96 setAuxiliaryMiddleText:v58];
    }
    v59 = [v4 auxiliaryBottomText];

    if (v59)
    {
      v60 = [v4 auxiliaryBottomText];
      [(SFRichTitleCardSection *)v96 setAuxiliaryBottomText:v60];
    }
    if ([v4 auxiliaryBottomTextColor]) {
      -[SFRichTitleCardSection setAuxiliaryBottomTextColor:](v96, "setAuxiliaryBottomTextColor:", [v4 auxiliaryBottomTextColor]);
    }
    if ([v4 auxiliaryAlignment])
    {
      v61 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "auxiliaryAlignment"));
      [(SFRichTitleCardSection *)v96 setAuxiliaryAlignment:v61];
    }
    if ([v4 hideVerticalDivider]) {
      -[SFRichTitleCardSection setHideVerticalDivider:](v96, "setHideVerticalDivider:", [v4 hideVerticalDivider]);
    }
    if ([v4 titleAlign]) {
      -[SFRichTitleCardSection setTitleAlign:](v96, "setTitleAlign:", [v4 titleAlign]);
    }
    if ([v4 titleWeight])
    {
      v62 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "titleWeight"));
      [(SFRichTitleCardSection *)v96 setTitleWeight:v62];
    }
    if ([v4 titleNoWrap]) {
      -[SFRichTitleCardSection setTitleNoWrap:](v96, "setTitleNoWrap:", [v4 titleNoWrap]);
    }
    if ([v4 thumbnailCropCircle]) {
      -[SFRichTitleCardSection setThumbnailCropCircle:](v96, "setThumbnailCropCircle:", [v4 thumbnailCropCircle]);
    }
    v63 = [v4 imageOverlay];

    if (v63)
    {
      v64 = [SFImage alloc];
      v65 = [v4 imageOverlay];
      v66 = [(SFImage *)v64 initWithProtobuf:v65];
      [(SFRichTitleCardSection *)v96 setImageOverlay:v66];
    }
    v67 = [v4 playAction];

    if (v67)
    {
      v68 = [SFActionItem alloc];
      v69 = [v4 playAction];
      v70 = [(SFActionItem *)v68 initWithProtobuf:v69];
      [(SFRichTitleCardSection *)v96 setPlayAction:v70];
    }
    if ([v4 playActionAlign]) {
      -[SFRichTitleCardSection setPlayActionAlign:](v96, "setPlayActionAlign:", [v4 playActionAlign]);
    }
    v71 = [v4 offers];
    if (v71)
    {
      id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v72 = 0;
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v73 = [v4 offers];
    uint64_t v74 = [v73 countByEnumeratingWithState:&v101 objects:v115 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v102;
      do
      {
        for (uint64_t k = 0; k != v75; ++k)
        {
          if (*(void *)v102 != v76) {
            objc_enumerationMutation(v73);
          }
          v78 = [[SFMediaOffer alloc] initWithProtobuf:*(void *)(*((void *)&v101 + 1) + 8 * k)];
          if (v78) {
            [v72 addObject:v78];
          }
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v101 objects:v115 count:16];
      }
      while (v75);
    }

    [(SFRichTitleCardSection *)v96 setOffers:v72];
    v79 = [v4 footnote];

    if (v79)
    {
      v80 = [v4 footnote];
      [(SFRichTitleCardSection *)v96 setFootnote:v80];
    }
    v81 = [v4 richSubtitle];

    if (v81)
    {
      v82 = [SFRichText alloc];
      v83 = [v4 richSubtitle];
      v84 = [(SFRichText *)v82 initWithProtobuf:v83];
      [(SFRichTitleCardSection *)v96 setRichSubtitle:v84];
    }
    if ([v4 subtitleIsEmphasized]) {
      -[SFRichTitleCardSection setSubtitleIsEmphasized:](v96, "setSubtitleIsEmphasized:", [v4 subtitleIsEmphasized]);
    }
    v85 = [v4 buttonItems];
    if (v85)
    {
      id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v86 = 0;
    }

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v95 = v4;
    v87 = [v4 buttonItems];
    uint64_t v88 = [v87 countByEnumeratingWithState:&v97 objects:v114 count:16];
    if (v88)
    {
      uint64_t v89 = v88;
      uint64_t v90 = *(void *)v98;
      do
      {
        for (uint64_t m = 0; m != v89; ++m)
        {
          if (*(void *)v98 != v90) {
            objc_enumerationMutation(v87);
          }
          v92 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v97 + 1) + 8 * m)];
          if (v92) {
            [v86 addObject:v92];
          }
        }
        uint64_t v89 = [v87 countByEnumeratingWithState:&v97 objects:v114 count:16];
      }
      while (v89);
    }

    v5 = v96;
    [(SFRichTitleCardSection *)v96 setButtonItems:v86];
    v93 = v96;

    id v4 = v95;
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
  objc_storeStrong((id *)&self->_titleWeight, 0);
  objc_storeStrong((id *)&self->_auxiliaryAlignment, 0);
  objc_storeStrong((id *)&self->_auxiliaryBottomText, 0);
  objc_storeStrong((id *)&self->_auxiliaryMiddleText, 0);
  objc_storeStrong((id *)&self->_auxiliaryTopText, 0);
  objc_storeStrong((id *)&self->_moreGlyphs, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_ratingText, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
}

- (void)setButtonItems:(id)a3
{
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (BOOL)subtitleIsEmphasized
{
  return self->_subtitleIsEmphasized;
}

- (void)setRichSubtitle:(id)a3
{
}

- (SFRichText)richSubtitle
{
  return self->_richSubtitle;
}

- (void)setFootnote:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setOffers:(id)a3
{
}

- (NSArray)offers
{
  return self->_offers;
}

- (int)playActionAlign
{
  return self->_playActionAlign;
}

- (void)setPlayAction:(id)a3
{
}

- (SFActionItem)playAction
{
  return self->_playAction;
}

- (void)setImageOverlay:(id)a3
{
}

- (SFImage)imageOverlay
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

- (void)setTitleWeight:(id)a3
{
}

- (NSNumber)titleWeight
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

- (void)setAuxiliaryAlignment:(id)a3
{
}

- (NSNumber)auxiliaryAlignment
{
  return self->_auxiliaryAlignment;
}

- (int)auxiliaryBottomTextColor
{
  return self->_auxiliaryBottomTextColor;
}

- (void)setAuxiliaryBottomText:(id)a3
{
}

- (NSString)auxiliaryBottomText
{
  return self->_auxiliaryBottomText;
}

- (void)setAuxiliaryMiddleText:(id)a3
{
}

- (NSString)auxiliaryMiddleText
{
  return self->_auxiliaryMiddleText;
}

- (void)setAuxiliaryTopText:(id)a3
{
}

- (NSString)auxiliaryTopText
{
  return self->_auxiliaryTopText;
}

- (void)setMoreGlyphs:(id)a3
{
}

- (NSArray)moreGlyphs
{
  return self->_moreGlyphs;
}

- (BOOL)reviewNewLine
{
  return self->_reviewNewLine;
}

- (void)setReviewText:(id)a3
{
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (void)setReviewGlyph:(id)a3
{
}

- (SFImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (void)setRatingText:(id)a3
{
}

- (NSString)ratingText
{
  return self->_ratingText;
}

- (void)setRating:(id)a3
{
}

- (NSNumber)rating
{
  return self->_rating;
}

- (void)setDescriptionText:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setTitleImage:(id)a3
{
}

- (SFImage)titleImage
{
  return self->_titleImage;
}

- (void)setContentAdvisory:(id)a3
{
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (unint64_t)hash
{
  v70.receiver = self;
  v70.super_class = (Class)SFRichTitleCardSection;
  unint64_t v3 = [(SFTitleCardSection *)&v70 hash];
  v69 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v69 hash];
  v68 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v68 hash];
  v67 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v67 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v66 = [(SFTitleCardSection *)self type];
  uint64_t v10 = v9 ^ [v66 hash];
  uint64_t v11 = v10 ^ [(SFCardSection *)self separatorStyle];
  v65 = [(SFCardSection *)self backgroundColor];
  uint64_t v12 = v11 ^ [v65 hash];
  v64 = [(SFTitleCardSection *)self title];
  uint64_t v13 = v8 ^ v12 ^ [v64 hash];
  v63 = [(SFTitleCardSection *)self subtitle];
  uint64_t v14 = [v63 hash];
  v62 = [(SFRichTitleCardSection *)self contentAdvisory];
  uint64_t v15 = v14 ^ [v62 hash];
  v61 = [(SFRichTitleCardSection *)self titleImage];
  uint64_t v16 = v15 ^ [v61 hash];
  uint64_t v17 = v16 ^ [(SFTitleCardSection *)self isCentered];
  v60 = [(SFRichTitleCardSection *)self descriptionText];
  uint64_t v18 = v17 ^ [v60 hash];
  v59 = [(SFRichTitleCardSection *)self rating];
  uint64_t v19 = v18 ^ [v59 hash];
  v58 = [(SFRichTitleCardSection *)self ratingText];
  uint64_t v20 = v13 ^ v19 ^ [v58 hash];
  v57 = [(SFRichTitleCardSection *)self reviewGlyph];
  uint64_t v21 = [v57 hash];
  v56 = [(SFRichTitleCardSection *)self reviewText];
  uint64_t v22 = v21 ^ [v56 hash];
  uint64_t v23 = v22 ^ [(SFRichTitleCardSection *)self reviewNewLine];
  v55 = [(SFRichTitleCardSection *)self moreGlyphs];
  uint64_t v24 = v23 ^ [v55 hash];
  v54 = [(SFRichTitleCardSection *)self auxiliaryTopText];
  uint64_t v25 = v24 ^ [v54 hash];
  v53 = [(SFRichTitleCardSection *)self auxiliaryMiddleText];
  uint64_t v26 = v25 ^ [v53 hash];
  uint64_t v52 = [(SFRichTitleCardSection *)self auxiliaryBottomText];
  uint64_t v27 = v26 ^ [v52 hash];
  uint64_t v28 = v20 ^ v27 ^ [(SFRichTitleCardSection *)self auxiliaryBottomTextColor];
  uint64_t v51 = [(SFRichTitleCardSection *)self auxiliaryAlignment];
  uint64_t v29 = [v51 hash];
  uint64_t v30 = v29 ^ [(SFRichTitleCardSection *)self hideVerticalDivider];
  uint64_t v31 = v30 ^ [(SFRichTitleCardSection *)self titleAlign];
  v32 = [(SFRichTitleCardSection *)self titleWeight];
  uint64_t v33 = v31 ^ [v32 hash];
  uint64_t v34 = v33 ^ [(SFRichTitleCardSection *)self titleNoWrap];
  uint64_t v35 = v34 ^ [(SFRichTitleCardSection *)self thumbnailCropCircle];
  float v36 = [(SFRichTitleCardSection *)self imageOverlay];
  uint64_t v37 = v35 ^ [v36 hash];
  v38 = [(SFRichTitleCardSection *)self playAction];
  uint64_t v39 = v28 ^ v37 ^ [v38 hash];
  uint64_t v40 = [(SFRichTitleCardSection *)self playActionAlign];
  v41 = [(SFRichTitleCardSection *)self offers];
  uint64_t v42 = v40 ^ [v41 hash];
  v43 = [(SFRichTitleCardSection *)self footnote];
  uint64_t v44 = v42 ^ [v43 hash];
  v45 = [(SFRichTitleCardSection *)self richSubtitle];
  uint64_t v46 = v44 ^ [v45 hash];
  uint64_t v47 = v46 ^ [(SFRichTitleCardSection *)self subtitleIsEmphasized];
  id v48 = [(SFRichTitleCardSection *)self buttonItems];
  unint64_t v49 = v39 ^ v47 ^ [v48 hash];

  return v49;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFRichTitleCardSection *)a3;
  if (self == v6)
  {
    char v17 = 1;
    goto LABEL_171;
  }
  if (![(SFRichTitleCardSection *)v6 isMemberOfClass:objc_opt_class()]
    || (v270.receiver = self,
        v270.super_class = (Class)SFRichTitleCardSection,
        ![(SFTitleCardSection *)&v270 isEqual:v6]))
  {
    char v17 = 0;
    goto LABEL_171;
  }
  uint64_t v7 = v6;
  unint64_t v8 = [(SFCardSection *)self punchoutOptions];
  uint64_t v9 = v8 == 0;
  uint64_t v10 = [(SFCardSection *)v7 punchoutOptions];
  id v261 = v10;
  id v262 = v8;
  int v259 = v10 != 0;
  int v260 = v9;
  if (v9 == v259)
  {
    int v258 = 0;
    int v247 = 0;
    int v245 = 0;
    long long v269 = 0uLL;
    int v13 = 0;
    memset(v242, 0, sizeof(v242));
    uint64_t v241 = 0;
    BOOL v268 = 0;
    int v237 = 0;
    int v238 = 0;
    BOOL v267 = 0;
    int v232 = 0;
    int v234 = 0;
    BOOL v266 = 0;
    int v228 = 0;
    int v227 = 0;
    BOOL v265 = 0;
    int v224 = 0;
    int v226 = 0;
    BOOL v264 = 0;
    uint64_t v223 = 0;
    BOOL v263 = 0;
    int v219 = 0;
    int v221 = 0;
    BOOL v257 = 0;
    uint64_t v218 = 0;
    BOOL v256 = 0;
    int v211 = 0;
    int v214 = 0;
    BOOL v255 = 0;
    int v212 = 0;
    int v217 = 0;
    BOOL v254 = 0;
    int v209 = 0;
    int v216 = 0;
    BOOL v253 = 0;
    int v208 = 0;
    int v213 = 0;
    BOOL v252 = 0;
    int v207 = 0;
    int v210 = 0;
    BOOL v251 = 0;
    uint64_t v215 = 0;
    BOOL v250 = 0;
    int v220 = 0;
    int v222 = 0;
    BOOL v249 = 0;
    int v225 = 0;
    int v230 = 0;
    BOOL v248 = 0;
    int v229 = 0;
    int v231 = 0;
    BOOL v246 = 0;
    int v233 = 0;
    int v235 = 0;
    BOOL v244 = 0;
    int v236 = 0;
    int v239 = 0;
    BOOL v243 = 0;
    uint64_t v240 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    char v17 = 0;
  }
  else
  {
    uint64_t v11 = [(SFCardSection *)self punchoutOptions];
    uint64_t v4 = v11 != 0;
    v206 = (void *)v11;
    if (!v11
      || ([(SFCardSection *)self punchoutOptions],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v7 punchoutOptions],
          v203 = v12,
          v202 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "isEqual:")))
    {
      v205 = [(SFCardSection *)self punchoutPickerTitle];
      v204 = [(SFCardSection *)v7 punchoutPickerTitle];
      int v258 = v4;
      if ((v205 == 0) == (v204 != 0))
      {
        int v245 = 0;
        long long v269 = 0uLL;
        int v13 = 0;
        memset(v242, 0, sizeof(v242));
        uint64_t v241 = 0;
        BOOL v268 = 0;
        int v237 = 0;
        int v238 = 0;
        BOOL v267 = 0;
        int v232 = 0;
        int v234 = 0;
        BOOL v266 = 0;
        int v228 = 0;
        int v227 = 0;
        BOOL v265 = 0;
        int v224 = 0;
        int v226 = 0;
        BOOL v264 = 0;
        uint64_t v223 = 0;
        BOOL v263 = 0;
        int v219 = 0;
        int v221 = 0;
        BOOL v257 = 0;
        uint64_t v218 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v214 = 0;
        BOOL v255 = 0;
        int v212 = 0;
        int v217 = 0;
        BOOL v254 = 0;
        int v209 = 0;
        int v216 = 0;
        BOOL v253 = 0;
        int v208 = 0;
        int v213 = 0;
        BOOL v252 = 0;
        int v207 = 0;
        int v210 = 0;
        BOOL v251 = 0;
        uint64_t v215 = 0;
        BOOL v250 = 0;
        int v220 = 0;
        int v222 = 0;
        BOOL v249 = 0;
        int v225 = 0;
        int v230 = 0;
        BOOL v248 = 0;
        int v229 = 0;
        int v231 = 0;
        BOOL v246 = 0;
        int v233 = 0;
        int v235 = 0;
        BOOL v244 = 0;
        int v236 = 0;
        int v239 = 0;
        BOOL v243 = 0;
        uint64_t v240 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        int v247 = 1;
      }
      else
      {
        uint64_t v18 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v269) = v18 != 0;
        v201 = (void *)v18;
        if (!v18
          || ([(SFCardSection *)self punchoutPickerTitle],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v7 punchoutPickerTitle],
              v198 = v3,
              v197 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:")))
        {
          unint64_t v3 = [(SFCardSection *)self punchoutPickerDismissText];
          v199 = [(SFCardSection *)v7 punchoutPickerDismissText];
          v200 = v3;
          if ((v3 == 0) != (v199 != 0))
          {
            uint64_t v22 = [(SFCardSection *)self punchoutPickerDismissText];
            DWORD2(v269) = v22 != 0;
            v196 = (void *)v22;
            if (v22)
            {
              uint64_t v23 = [(SFCardSection *)self punchoutPickerDismissText];
              uint64_t v24 = v7;
              uint64_t v25 = (void *)v23;
              v82 = v24;
              [(SFCardSection *)v24 punchoutPickerDismissText];
              v194 = v195 = v25;
              if (!objc_msgSend(v25, "isEqual:"))
              {
                v242[0] = 0;
                v242[1] = 0;
                *(void *)&long long v269 = 0;
                uint64_t v241 = 0;
                BOOL v268 = 0;
                int v237 = 0;
                int v238 = 0;
                BOOL v267 = 0;
                int v232 = 0;
                int v234 = 0;
                BOOL v266 = 0;
                int v228 = 0;
                int v227 = 0;
                BOOL v265 = 0;
                int v224 = 0;
                int v226 = 0;
                BOOL v264 = 0;
                uint64_t v223 = 0;
                BOOL v263 = 0;
                int v219 = 0;
                int v221 = 0;
                BOOL v257 = 0;
                uint64_t v218 = 0;
                BOOL v256 = 0;
                int v211 = 0;
                int v214 = 0;
                BOOL v255 = 0;
                int v212 = 0;
                int v217 = 0;
                BOOL v254 = 0;
                int v209 = 0;
                int v216 = 0;
                BOOL v253 = 0;
                int v208 = 0;
                int v213 = 0;
                BOOL v252 = 0;
                int v207 = 0;
                int v210 = 0;
                BOOL v251 = 0;
                uint64_t v215 = 0;
                BOOL v250 = 0;
                int v220 = 0;
                int v222 = 0;
                BOOL v249 = 0;
                int v225 = 0;
                int v230 = 0;
                BOOL v248 = 0;
                int v229 = 0;
                int v231 = 0;
                BOOL v246 = 0;
                int v233 = 0;
                int v235 = 0;
                BOOL v244 = 0;
                int v236 = 0;
                int v239 = 0;
                BOOL v243 = 0;
                uint64_t v240 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                int v247 = 1;
                int v245 = 1;
                v242[2] = 1;
                int v13 = 1;
                DWORD2(v269) = 1;
                uint64_t v7 = v82;
                goto LABEL_16;
              }
              uint64_t v7 = v82;
            }
            BOOL v26 = [(SFCardSection *)self canBeHidden];
            if (v26 == [(SFCardSection *)v7 canBeHidden]
              && (BOOL v27 = [(SFCardSection *)self hasTopPadding],
                  v27 == [(SFCardSection *)v7 hasTopPadding])
              && (BOOL v28 = [(SFCardSection *)self hasBottomPadding],
                  v28 == [(SFCardSection *)v7 hasBottomPadding]))
            {
              v193 = [(SFTitleCardSection *)self type];
              v192 = [(SFTitleCardSection *)v7 type];
              if ((v193 == 0) == (v192 != 0))
              {
                *(void *)((char *)v242 + 4) = 0;
                *(void *)&long long v269 = 0;
                LODWORD(v242[0]) = 0;
                uint64_t v241 = 0;
                BOOL v268 = 0;
                int v237 = 0;
                int v238 = 0;
                BOOL v267 = 0;
                int v232 = 0;
                int v234 = 0;
                BOOL v266 = 0;
                int v228 = 0;
                int v227 = 0;
                BOOL v265 = 0;
                int v224 = 0;
                int v226 = 0;
                BOOL v264 = 0;
                uint64_t v223 = 0;
                BOOL v263 = 0;
                int v219 = 0;
                int v221 = 0;
                BOOL v257 = 0;
                uint64_t v218 = 0;
                BOOL v256 = 0;
                int v211 = 0;
                int v214 = 0;
                BOOL v255 = 0;
                int v212 = 0;
                int v217 = 0;
                BOOL v254 = 0;
                int v209 = 0;
                int v216 = 0;
                BOOL v253 = 0;
                int v208 = 0;
                int v213 = 0;
                BOOL v252 = 0;
                int v207 = 0;
                int v210 = 0;
                BOOL v251 = 0;
                uint64_t v215 = 0;
                BOOL v250 = 0;
                int v220 = 0;
                int v222 = 0;
                BOOL v249 = 0;
                int v225 = 0;
                int v230 = 0;
                BOOL v248 = 0;
                int v229 = 0;
                int v231 = 0;
                BOOL v246 = 0;
                int v233 = 0;
                int v235 = 0;
                BOOL v244 = 0;
                int v236 = 0;
                int v239 = 0;
                BOOL v243 = 0;
                uint64_t v240 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                int v247 = 1;
                int v245 = 1;
                v242[2] = 1;
                int v13 = 1;
                HIDWORD(v242[1]) = 1;
              }
              else
              {
                v191 = [(SFTitleCardSection *)self type];
                DWORD1(v269) = v191 != 0;
                if (!v191
                  || ([(SFTitleCardSection *)self type],
                      uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                      [(SFTitleCardSection *)v7 type],
                      v190 = v29,
                      v189 = objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v29, "isEqual:")))
                {
                  int v30 = [(SFCardSection *)self separatorStyle];
                  if (v30 == [(SFCardSection *)v7 separatorStyle])
                  {
                    v188 = [(SFCardSection *)self backgroundColor];
                    v187 = [(SFCardSection *)v7 backgroundColor];
                    if ((v188 == 0) == (v187 != 0))
                    {
                      LODWORD(v269) = 0;
                      uint64_t v241 = 0;
                      BOOL v268 = 0;
                      int v237 = 0;
                      int v238 = 0;
                      BOOL v267 = 0;
                      int v232 = 0;
                      int v234 = 0;
                      BOOL v266 = 0;
                      int v228 = 0;
                      int v227 = 0;
                      BOOL v265 = 0;
                      int v224 = 0;
                      int v226 = 0;
                      BOOL v264 = 0;
                      uint64_t v223 = 0;
                      BOOL v263 = 0;
                      int v219 = 0;
                      int v221 = 0;
                      BOOL v257 = 0;
                      uint64_t v218 = 0;
                      BOOL v256 = 0;
                      int v211 = 0;
                      int v214 = 0;
                      BOOL v255 = 0;
                      int v212 = 0;
                      int v217 = 0;
                      BOOL v254 = 0;
                      int v209 = 0;
                      int v216 = 0;
                      BOOL v253 = 0;
                      int v208 = 0;
                      int v213 = 0;
                      BOOL v252 = 0;
                      int v207 = 0;
                      int v210 = 0;
                      BOOL v251 = 0;
                      uint64_t v215 = 0;
                      BOOL v250 = 0;
                      int v220 = 0;
                      int v222 = 0;
                      BOOL v249 = 0;
                      int v225 = 0;
                      int v230 = 0;
                      BOOL v248 = 0;
                      int v229 = 0;
                      int v231 = 0;
                      BOOL v246 = 0;
                      int v233 = 0;
                      int v235 = 0;
                      BOOL v244 = 0;
                      int v236 = 0;
                      int v239 = 0;
                      BOOL v243 = 0;
                      uint64_t v240 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      char v17 = 0;
                      int v247 = 1;
                      int v245 = 1;
                      v242[2] = 1;
                      int v13 = 1;
                      v242[1] = 0x100000001;
                      v242[0] = 1;
                    }
                    else
                    {
                      uint64_t v31 = [(SFCardSection *)self backgroundColor];
                      LODWORD(v269) = v31 != 0;
                      v186 = (void *)v31;
                      if (!v31
                        || ([(SFCardSection *)self backgroundColor],
                            v32 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v7 backgroundColor],
                            v183 = v32,
                            v182 = objc_claimAutoreleasedReturnValue(),
                            objc_msgSend(v32, "isEqual:")))
                      {
                        v185 = [(SFTitleCardSection *)self title];
                        v184 = [(SFTitleCardSection *)v7 title];
                        if ((v185 == 0) == (v184 != 0))
                        {
                          BOOL v268 = 0;
                          int v237 = 0;
                          int v238 = 0;
                          BOOL v267 = 0;
                          int v232 = 0;
                          int v234 = 0;
                          BOOL v266 = 0;
                          int v228 = 0;
                          int v227 = 0;
                          BOOL v265 = 0;
                          int v224 = 0;
                          int v226 = 0;
                          BOOL v264 = 0;
                          uint64_t v223 = 0;
                          BOOL v263 = 0;
                          int v219 = 0;
                          int v221 = 0;
                          BOOL v257 = 0;
                          uint64_t v218 = 0;
                          BOOL v256 = 0;
                          int v211 = 0;
                          int v214 = 0;
                          BOOL v255 = 0;
                          int v212 = 0;
                          int v217 = 0;
                          BOOL v254 = 0;
                          int v209 = 0;
                          int v216 = 0;
                          BOOL v253 = 0;
                          int v208 = 0;
                          int v213 = 0;
                          BOOL v252 = 0;
                          int v207 = 0;
                          int v210 = 0;
                          BOOL v251 = 0;
                          uint64_t v215 = 0;
                          BOOL v250 = 0;
                          int v220 = 0;
                          int v222 = 0;
                          BOOL v249 = 0;
                          int v225 = 0;
                          int v230 = 0;
                          BOOL v248 = 0;
                          int v229 = 0;
                          int v231 = 0;
                          BOOL v246 = 0;
                          int v233 = 0;
                          int v235 = 0;
                          BOOL v244 = 0;
                          int v236 = 0;
                          int v239 = 0;
                          BOOL v243 = 0;
                          uint64_t v240 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          char v17 = 0;
                          int v247 = 1;
                          int v245 = 1;
                          HIDWORD(v242[2]) = 0;
                          int v13 = 1;
                          LODWORD(v242[1]) = 1;
                          *(void *)((char *)&v242[1] + 4) = 0x100000001;
                          v242[0] = 0x100000001;
                          uint64_t v241 = 1;
                        }
                        else
                        {
                          uint64_t v33 = [(SFTitleCardSection *)self title];
                          BOOL v268 = v33 != 0;
                          v181 = (void *)v33;
                          if (!v33
                            || ([(SFTitleCardSection *)self title],
                                uint64_t v34 = objc_claimAutoreleasedReturnValue(),
                                [(SFTitleCardSection *)v7 title],
                                v178 = v34,
                                v177 = objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v34, "isEqual:")))
                          {
                            v180 = [(SFTitleCardSection *)self subtitle];
                            v179 = [(SFTitleCardSection *)v7 subtitle];
                            if ((v180 == 0) == (v179 != 0))
                            {
                              int v238 = 0;
                              BOOL v267 = 0;
                              int v232 = 0;
                              int v234 = 0;
                              BOOL v266 = 0;
                              int v228 = 0;
                              int v227 = 0;
                              BOOL v265 = 0;
                              int v224 = 0;
                              int v226 = 0;
                              BOOL v264 = 0;
                              uint64_t v223 = 0;
                              BOOL v263 = 0;
                              int v219 = 0;
                              int v221 = 0;
                              BOOL v257 = 0;
                              uint64_t v218 = 0;
                              BOOL v256 = 0;
                              int v211 = 0;
                              int v214 = 0;
                              BOOL v255 = 0;
                              int v212 = 0;
                              int v217 = 0;
                              BOOL v254 = 0;
                              int v209 = 0;
                              int v216 = 0;
                              BOOL v253 = 0;
                              int v208 = 0;
                              int v213 = 0;
                              BOOL v252 = 0;
                              int v207 = 0;
                              int v210 = 0;
                              BOOL v251 = 0;
                              uint64_t v215 = 0;
                              BOOL v250 = 0;
                              int v220 = 0;
                              int v222 = 0;
                              BOOL v249 = 0;
                              int v225 = 0;
                              int v230 = 0;
                              BOOL v248 = 0;
                              int v229 = 0;
                              int v231 = 0;
                              BOOL v246 = 0;
                              int v233 = 0;
                              int v235 = 0;
                              BOOL v244 = 0;
                              int v236 = 0;
                              int v239 = 0;
                              BOOL v243 = 0;
                              uint64_t v240 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              int v16 = 0;
                              char v17 = 0;
                              int v247 = 1;
                              int v245 = 1;
                              v242[2] = 1;
                              int v13 = 1;
                              v242[1] = 0x100000001;
                              v242[0] = 0x100000001;
                              uint64_t v241 = 0x100000001;
                              int v237 = 1;
                            }
                            else
                            {
                              uint64_t v35 = [(SFTitleCardSection *)self subtitle];
                              BOOL v267 = v35 != 0;
                              v176 = (void *)v35;
                              if (!v35
                                || ([(SFTitleCardSection *)self subtitle],
                                    float v36 = objc_claimAutoreleasedReturnValue(),
                                    [(SFTitleCardSection *)v7 subtitle],
                                    v173 = v36,
                                    v172 = objc_claimAutoreleasedReturnValue(),
                                    objc_msgSend(v36, "isEqual:")))
                              {
                                v175 = [(SFRichTitleCardSection *)self contentAdvisory];
                                v174 = [(SFRichTitleCardSection *)v7 contentAdvisory];
                                if ((v175 == 0) == (v174 != 0))
                                {
                                  int v234 = 0;
                                  BOOL v266 = 0;
                                  int v228 = 0;
                                  int v227 = 0;
                                  BOOL v265 = 0;
                                  int v224 = 0;
                                  int v226 = 0;
                                  BOOL v264 = 0;
                                  uint64_t v223 = 0;
                                  BOOL v263 = 0;
                                  int v219 = 0;
                                  int v221 = 0;
                                  BOOL v257 = 0;
                                  uint64_t v218 = 0;
                                  BOOL v256 = 0;
                                  int v211 = 0;
                                  int v214 = 0;
                                  BOOL v255 = 0;
                                  int v212 = 0;
                                  int v217 = 0;
                                  BOOL v254 = 0;
                                  int v209 = 0;
                                  int v216 = 0;
                                  BOOL v253 = 0;
                                  int v208 = 0;
                                  int v213 = 0;
                                  BOOL v252 = 0;
                                  int v207 = 0;
                                  int v210 = 0;
                                  BOOL v251 = 0;
                                  uint64_t v215 = 0;
                                  BOOL v250 = 0;
                                  int v220 = 0;
                                  int v222 = 0;
                                  BOOL v249 = 0;
                                  int v225 = 0;
                                  int v230 = 0;
                                  BOOL v248 = 0;
                                  int v229 = 0;
                                  int v231 = 0;
                                  BOOL v246 = 0;
                                  int v233 = 0;
                                  int v235 = 0;
                                  BOOL v244 = 0;
                                  int v236 = 0;
                                  int v239 = 0;
                                  BOOL v243 = 0;
                                  uint64_t v240 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  int v16 = 0;
                                  char v17 = 0;
                                  int v247 = 1;
                                  int v245 = 1;
                                  v242[2] = 1;
                                  int v13 = 1;
                                  v242[1] = 0x100000001;
                                  v242[0] = 0x100000001;
                                  uint64_t v241 = 0x100000001;
                                  int v237 = 1;
                                  int v238 = 1;
                                  int v232 = 1;
                                }
                                else
                                {
                                  uint64_t v37 = [(SFRichTitleCardSection *)self contentAdvisory];
                                  BOOL v266 = v37 != 0;
                                  v171 = (void *)v37;
                                  if (!v37
                                    || ([(SFRichTitleCardSection *)self contentAdvisory],
                                        v38 = objc_claimAutoreleasedReturnValue(),
                                        [(SFRichTitleCardSection *)v7 contentAdvisory],
                                        v168 = v38,
                                        v167 = objc_claimAutoreleasedReturnValue(),
                                        objc_msgSend(v38, "isEqual:")))
                                  {
                                    v170 = [(SFRichTitleCardSection *)self titleImage];
                                    v169 = [(SFRichTitleCardSection *)v7 titleImage];
                                    if ((v170 == 0) == (v169 != 0))
                                    {
                                      int v227 = 0;
                                      BOOL v265 = 0;
                                      int v224 = 0;
                                      int v226 = 0;
                                      BOOL v264 = 0;
                                      uint64_t v223 = 0;
                                      BOOL v263 = 0;
                                      int v219 = 0;
                                      int v221 = 0;
                                      BOOL v257 = 0;
                                      uint64_t v218 = 0;
                                      BOOL v256 = 0;
                                      int v211 = 0;
                                      int v214 = 0;
                                      BOOL v255 = 0;
                                      int v212 = 0;
                                      int v217 = 0;
                                      BOOL v254 = 0;
                                      int v209 = 0;
                                      int v216 = 0;
                                      BOOL v253 = 0;
                                      int v208 = 0;
                                      int v213 = 0;
                                      BOOL v252 = 0;
                                      int v207 = 0;
                                      int v210 = 0;
                                      BOOL v251 = 0;
                                      uint64_t v215 = 0;
                                      BOOL v250 = 0;
                                      int v220 = 0;
                                      int v222 = 0;
                                      BOOL v249 = 0;
                                      int v225 = 0;
                                      int v230 = 0;
                                      BOOL v248 = 0;
                                      int v229 = 0;
                                      int v231 = 0;
                                      BOOL v246 = 0;
                                      int v233 = 0;
                                      int v235 = 0;
                                      BOOL v244 = 0;
                                      int v236 = 0;
                                      int v239 = 0;
                                      BOOL v243 = 0;
                                      uint64_t v240 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      int v16 = 0;
                                      char v17 = 0;
                                      int v247 = 1;
                                      int v245 = 1;
                                      v242[2] = 1;
                                      int v13 = 1;
                                      v242[1] = 0x100000001;
                                      v242[0] = 0x100000001;
                                      uint64_t v241 = 0x100000001;
                                      int v237 = 1;
                                      int v238 = 1;
                                      int v232 = 1;
                                      int v234 = 1;
                                      int v228 = 1;
                                    }
                                    else
                                    {
                                      uint64_t v39 = [(SFRichTitleCardSection *)self titleImage];
                                      BOOL v265 = v39 != 0;
                                      v166 = (void *)v39;
                                      if (!v39
                                        || ([(SFRichTitleCardSection *)self titleImage],
                                            uint64_t v40 = objc_claimAutoreleasedReturnValue(),
                                            [(SFRichTitleCardSection *)v7 titleImage],
                                            v165 = v40,
                                            v164 = objc_claimAutoreleasedReturnValue(),
                                            objc_msgSend(v40, "isEqual:")))
                                      {
                                        BOOL v41 = [(SFTitleCardSection *)self isCentered];
                                        if (v41 == [(SFTitleCardSection *)v7 isCentered])
                                        {
                                          v163 = [(SFRichTitleCardSection *)self descriptionText];
                                          v162 = [(SFRichTitleCardSection *)v7 descriptionText];
                                          if ((v163 == 0) == (v162 != 0))
                                          {
                                            int v226 = 0;
                                            BOOL v264 = 0;
                                            uint64_t v223 = 0;
                                            BOOL v263 = 0;
                                            int v219 = 0;
                                            int v221 = 0;
                                            BOOL v257 = 0;
                                            uint64_t v218 = 0;
                                            BOOL v256 = 0;
                                            int v211 = 0;
                                            int v214 = 0;
                                            BOOL v255 = 0;
                                            int v212 = 0;
                                            int v217 = 0;
                                            BOOL v254 = 0;
                                            int v209 = 0;
                                            int v216 = 0;
                                            BOOL v253 = 0;
                                            int v208 = 0;
                                            int v213 = 0;
                                            BOOL v252 = 0;
                                            int v207 = 0;
                                            int v210 = 0;
                                            BOOL v251 = 0;
                                            uint64_t v215 = 0;
                                            BOOL v250 = 0;
                                            int v220 = 0;
                                            int v222 = 0;
                                            BOOL v249 = 0;
                                            int v225 = 0;
                                            int v230 = 0;
                                            BOOL v248 = 0;
                                            int v229 = 0;
                                            int v231 = 0;
                                            BOOL v246 = 0;
                                            int v233 = 0;
                                            int v235 = 0;
                                            BOOL v244 = 0;
                                            int v236 = 0;
                                            int v239 = 0;
                                            BOOL v243 = 0;
                                            uint64_t v240 = 0;
                                            int v14 = 0;
                                            int v15 = 0;
                                            int v16 = 0;
                                            char v17 = 0;
                                            int v247 = 1;
                                            int v245 = 1;
                                            v242[2] = 1;
                                            int v13 = 1;
                                            v242[1] = 0x100000001;
                                            v242[0] = 0x100000001;
                                            uint64_t v241 = 0x100000001;
                                            int v237 = 1;
                                            int v238 = 1;
                                            int v232 = 1;
                                            int v234 = 1;
                                            int v228 = 1;
                                            int v227 = 1;
                                            int v224 = 1;
                                          }
                                          else
                                          {
                                            uint64_t v42 = [(SFRichTitleCardSection *)self descriptionText];
                                            BOOL v264 = v42 != 0;
                                            v161 = (void *)v42;
                                            if (!v42
                                              || ([(SFRichTitleCardSection *)self descriptionText],
                                                  v43 = objc_claimAutoreleasedReturnValue(),
                                                  [(SFRichTitleCardSection *)v7 descriptionText],
                                                  v158 = v43,
                                                  v157 = objc_claimAutoreleasedReturnValue(),
                                                  objc_msgSend(v43, "isEqual:")))
                                            {
                                              v160 = [(SFRichTitleCardSection *)self rating];
                                              v159 = [(SFRichTitleCardSection *)v7 rating];
                                              if ((v160 == 0) == (v159 != 0))
                                              {
                                                BOOL v263 = 0;
                                                int v219 = 0;
                                                int v221 = 0;
                                                BOOL v257 = 0;
                                                uint64_t v218 = 0;
                                                BOOL v256 = 0;
                                                int v211 = 0;
                                                int v214 = 0;
                                                BOOL v255 = 0;
                                                int v212 = 0;
                                                int v217 = 0;
                                                BOOL v254 = 0;
                                                int v209 = 0;
                                                int v216 = 0;
                                                BOOL v253 = 0;
                                                int v208 = 0;
                                                int v213 = 0;
                                                BOOL v252 = 0;
                                                int v207 = 0;
                                                int v210 = 0;
                                                BOOL v251 = 0;
                                                uint64_t v215 = 0;
                                                BOOL v250 = 0;
                                                int v220 = 0;
                                                int v222 = 0;
                                                BOOL v249 = 0;
                                                int v225 = 0;
                                                int v230 = 0;
                                                BOOL v248 = 0;
                                                int v229 = 0;
                                                int v231 = 0;
                                                BOOL v246 = 0;
                                                int v233 = 0;
                                                int v235 = 0;
                                                BOOL v244 = 0;
                                                int v236 = 0;
                                                int v239 = 0;
                                                BOOL v243 = 0;
                                                uint64_t v240 = 0;
                                                int v14 = 0;
                                                int v15 = 0;
                                                int v16 = 0;
                                                char v17 = 0;
                                                int v247 = 1;
                                                int v245 = 1;
                                                HIDWORD(v242[2]) = 0;
                                                int v13 = 1;
                                                LODWORD(v242[1]) = 1;
                                                *(void *)((char *)&v242[1] + 4) = 0x100000001;
                                                v242[0] = 0x100000001;
                                                uint64_t v241 = 0x100000001;
                                                int v237 = 1;
                                                int v238 = 1;
                                                int v232 = 1;
                                                int v234 = 1;
                                                int v228 = 1;
                                                int v227 = 1;
                                                int v224 = 1;
                                                int v226 = 1;
                                                uint64_t v223 = 1;
                                              }
                                              else
                                              {
                                                uint64_t v44 = [(SFRichTitleCardSection *)self rating];
                                                BOOL v263 = v44 != 0;
                                                v156 = (void *)v44;
                                                if (!v44
                                                  || ([(SFRichTitleCardSection *)self rating],
                                                      v45 = objc_claimAutoreleasedReturnValue(),
                                                      [(SFRichTitleCardSection *)v7 rating],
                                                      v155 = v45,
                                                      v154 = objc_claimAutoreleasedReturnValue(),
                                                      objc_msgSend(v45, "isEqual:")))
                                                {
                                                  v153 = [(SFRichTitleCardSection *)self ratingText];
                                                  v152 = [(SFRichTitleCardSection *)v7 ratingText];
                                                  if ((v153 == 0) == (v152 != 0))
                                                  {
                                                    int v221 = 0;
                                                    BOOL v257 = 0;
                                                    uint64_t v218 = 0;
                                                    BOOL v256 = 0;
                                                    int v211 = 0;
                                                    int v214 = 0;
                                                    BOOL v255 = 0;
                                                    int v212 = 0;
                                                    int v217 = 0;
                                                    BOOL v254 = 0;
                                                    int v209 = 0;
                                                    int v216 = 0;
                                                    BOOL v253 = 0;
                                                    int v208 = 0;
                                                    int v213 = 0;
                                                    BOOL v252 = 0;
                                                    int v207 = 0;
                                                    int v210 = 0;
                                                    BOOL v251 = 0;
                                                    uint64_t v215 = 0;
                                                    BOOL v250 = 0;
                                                    int v220 = 0;
                                                    int v222 = 0;
                                                    BOOL v249 = 0;
                                                    int v225 = 0;
                                                    int v230 = 0;
                                                    BOOL v248 = 0;
                                                    int v229 = 0;
                                                    int v231 = 0;
                                                    BOOL v246 = 0;
                                                    int v233 = 0;
                                                    int v235 = 0;
                                                    BOOL v244 = 0;
                                                    int v236 = 0;
                                                    int v239 = 0;
                                                    BOOL v243 = 0;
                                                    uint64_t v240 = 0;
                                                    int v14 = 0;
                                                    int v15 = 0;
                                                    int v16 = 0;
                                                    char v17 = 0;
                                                    int v247 = 1;
                                                    int v245 = 1;
                                                    v242[2] = 1;
                                                    int v13 = 1;
                                                    v242[1] = 0x100000001;
                                                    v242[0] = 0x100000001;
                                                    uint64_t v241 = 0x100000001;
                                                    int v237 = 1;
                                                    int v238 = 1;
                                                    int v232 = 1;
                                                    int v234 = 1;
                                                    int v228 = 1;
                                                    int v227 = 1;
                                                    int v224 = 1;
                                                    int v226 = 1;
                                                    uint64_t v223 = 0x100000001;
                                                    int v219 = 1;
                                                  }
                                                  else
                                                  {
                                                    uint64_t v46 = [(SFRichTitleCardSection *)self ratingText];
                                                    BOOL v257 = v46 != 0;
                                                    v151 = (void *)v46;
                                                    if (!v46
                                                      || ([(SFRichTitleCardSection *)self ratingText],
                                                          uint64_t v47 = objc_claimAutoreleasedReturnValue(),
                                                          [(SFRichTitleCardSection *)v7 ratingText],
                                                          v150 = v47,
                                                          v149 = objc_claimAutoreleasedReturnValue(),
                                                          objc_msgSend(v47, "isEqual:")))
                                                    {
                                                      v148 = [(SFRichTitleCardSection *)self reviewGlyph];
                                                      v147 = [(SFRichTitleCardSection *)v7 reviewGlyph];
                                                      if ((v148 == 0) == (v147 != 0))
                                                      {
                                                        BOOL v256 = 0;
                                                        int v211 = 0;
                                                        int v214 = 0;
                                                        BOOL v255 = 0;
                                                        int v212 = 0;
                                                        int v217 = 0;
                                                        BOOL v254 = 0;
                                                        int v209 = 0;
                                                        int v216 = 0;
                                                        BOOL v253 = 0;
                                                        int v208 = 0;
                                                        int v213 = 0;
                                                        BOOL v252 = 0;
                                                        int v207 = 0;
                                                        int v210 = 0;
                                                        BOOL v251 = 0;
                                                        uint64_t v215 = 0;
                                                        BOOL v250 = 0;
                                                        int v220 = 0;
                                                        int v222 = 0;
                                                        BOOL v249 = 0;
                                                        int v225 = 0;
                                                        int v230 = 0;
                                                        BOOL v248 = 0;
                                                        int v229 = 0;
                                                        int v231 = 0;
                                                        BOOL v246 = 0;
                                                        int v233 = 0;
                                                        int v235 = 0;
                                                        BOOL v244 = 0;
                                                        int v236 = 0;
                                                        int v239 = 0;
                                                        BOOL v243 = 0;
                                                        uint64_t v240 = 0;
                                                        int v14 = 0;
                                                        int v15 = 0;
                                                        int v16 = 0;
                                                        char v17 = 0;
                                                        int v247 = 1;
                                                        int v245 = 1;
                                                        HIDWORD(v242[2]) = 0;
                                                        int v13 = 1;
                                                        LODWORD(v242[1]) = 1;
                                                        *(void *)((char *)&v242[1] + 4) = 0x100000001;
                                                        v242[0] = 0x100000001;
                                                        uint64_t v241 = 0x100000001;
                                                        int v237 = 1;
                                                        int v238 = 1;
                                                        int v232 = 1;
                                                        int v234 = 1;
                                                        int v228 = 1;
                                                        int v227 = 1;
                                                        int v224 = 1;
                                                        int v226 = 1;
                                                        uint64_t v223 = 0x100000001;
                                                        int v219 = 1;
                                                        int v221 = 1;
                                                        uint64_t v218 = 1;
                                                      }
                                                      else
                                                      {
                                                        uint64_t v48 = [(SFRichTitleCardSection *)self reviewGlyph];
                                                        BOOL v256 = v48 != 0;
                                                        v144 = (void *)v48;
                                                        if (!v48
                                                          || ([(SFRichTitleCardSection *)self reviewGlyph],
                                                              unint64_t v49 = objc_claimAutoreleasedReturnValue(),
                                                              [(SFRichTitleCardSection *)v7 reviewGlyph],
                                                              v146 = v49,
                                                              v145 = objc_claimAutoreleasedReturnValue(),
                                                              objc_msgSend(v49, "isEqual:")))
                                                        {
                                                          v143 = [(SFRichTitleCardSection *)self reviewText];
                                                          v142 = [(SFRichTitleCardSection *)v7 reviewText];
                                                          if ((v143 == 0) == (v142 != 0))
                                                          {
                                                            int v214 = 0;
                                                            BOOL v255 = 0;
                                                            int v212 = 0;
                                                            int v217 = 0;
                                                            BOOL v254 = 0;
                                                            int v209 = 0;
                                                            int v216 = 0;
                                                            BOOL v253 = 0;
                                                            int v208 = 0;
                                                            int v213 = 0;
                                                            BOOL v252 = 0;
                                                            int v207 = 0;
                                                            int v210 = 0;
                                                            BOOL v251 = 0;
                                                            uint64_t v215 = 0;
                                                            BOOL v250 = 0;
                                                            int v220 = 0;
                                                            int v222 = 0;
                                                            BOOL v249 = 0;
                                                            int v225 = 0;
                                                            int v230 = 0;
                                                            BOOL v248 = 0;
                                                            int v229 = 0;
                                                            int v231 = 0;
                                                            BOOL v246 = 0;
                                                            int v233 = 0;
                                                            int v235 = 0;
                                                            BOOL v244 = 0;
                                                            int v236 = 0;
                                                            int v239 = 0;
                                                            BOOL v243 = 0;
                                                            uint64_t v240 = 0;
                                                            int v14 = 0;
                                                            int v15 = 0;
                                                            int v16 = 0;
                                                            char v17 = 0;
                                                            int v247 = 1;
                                                            int v245 = 1;
                                                            v242[2] = 1;
                                                            int v13 = 1;
                                                            v242[1] = 0x100000001;
                                                            v242[0] = 0x100000001;
                                                            uint64_t v241 = 0x100000001;
                                                            int v237 = 1;
                                                            int v238 = 1;
                                                            int v232 = 1;
                                                            int v234 = 1;
                                                            int v228 = 1;
                                                            int v227 = 1;
                                                            int v224 = 1;
                                                            int v226 = 1;
                                                            uint64_t v223 = 0x100000001;
                                                            int v219 = 1;
                                                            int v221 = 1;
                                                            uint64_t v218 = 0x100000001;
                                                            int v211 = 1;
                                                          }
                                                          else
                                                          {
                                                            uint64_t v50 = [(SFRichTitleCardSection *)self reviewText];
                                                            BOOL v255 = v50 != 0;
                                                            v136 = (void *)v50;
                                                            if (!v50
                                                              || (-[SFRichTitleCardSection reviewText](self, "reviewText"), uint64_t v51 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection reviewText](v7, "reviewText"), v140 = objc_claimAutoreleasedReturnValue(), v141 = v51, objc_msgSend(v51, "isEqual:")))
                                                            {
                                                              BOOL v52 = [(SFRichTitleCardSection *)self reviewNewLine];
                                                              if (v52 == [(SFRichTitleCardSection *)v7 reviewNewLine])
                                                              {
                                                                v134 = [(SFRichTitleCardSection *)self moreGlyphs];
                                                                v133 = [(SFRichTitleCardSection *)v7 moreGlyphs];
                                                                if ((v134 == 0) == (v133 != 0))
                                                                {
                                                                  int v217 = 0;
                                                                  BOOL v254 = 0;
                                                                  int v209 = 0;
                                                                  int v216 = 0;
                                                                  BOOL v253 = 0;
                                                                  int v208 = 0;
                                                                  int v213 = 0;
                                                                  BOOL v252 = 0;
                                                                  int v207 = 0;
                                                                  int v210 = 0;
                                                                  BOOL v251 = 0;
                                                                  uint64_t v215 = 0;
                                                                  BOOL v250 = 0;
                                                                  int v220 = 0;
                                                                  int v222 = 0;
                                                                  BOOL v249 = 0;
                                                                  int v225 = 0;
                                                                  int v230 = 0;
                                                                  BOOL v248 = 0;
                                                                  int v229 = 0;
                                                                  int v231 = 0;
                                                                  BOOL v246 = 0;
                                                                  int v233 = 0;
                                                                  int v235 = 0;
                                                                  BOOL v244 = 0;
                                                                  int v236 = 0;
                                                                  int v239 = 0;
                                                                  BOOL v243 = 0;
                                                                  uint64_t v240 = 0;
                                                                  int v14 = 0;
                                                                  int v15 = 0;
                                                                  int v16 = 0;
                                                                  char v17 = 0;
                                                                  int v247 = 1;
                                                                  int v245 = 1;
                                                                  v242[2] = 1;
                                                                  int v13 = 1;
                                                                  v242[1] = 0x100000001;
                                                                  v242[0] = 0x100000001;
                                                                  uint64_t v241 = 0x100000001;
                                                                  int v237 = 1;
                                                                  int v238 = 1;
                                                                  int v232 = 1;
                                                                  int v234 = 1;
                                                                  int v228 = 1;
                                                                  int v227 = 1;
                                                                  int v224 = 1;
                                                                  int v226 = 1;
                                                                  uint64_t v223 = 0x100000001;
                                                                  int v219 = 1;
                                                                  int v221 = 1;
                                                                  uint64_t v218 = 0x100000001;
                                                                  int v211 = 1;
                                                                  int v214 = 1;
                                                                  int v212 = 1;
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v53 = [(SFRichTitleCardSection *)self moreGlyphs];
                                                                  BOOL v254 = v53 != 0;
                                                                  v130 = (void *)v53;
                                                                  if (!v53
                                                                    || (-[SFRichTitleCardSection moreGlyphs](self, "moreGlyphs"), v54 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection moreGlyphs](v7, "moreGlyphs"), v138 = objc_claimAutoreleasedReturnValue(), v139 = v54, objc_msgSend(v54, "isEqual:")))
                                                                  {
                                                                    v129 = [(SFRichTitleCardSection *)self auxiliaryTopText];
                                                                    v128 = [(SFRichTitleCardSection *)v7 auxiliaryTopText];
                                                                    if ((v129 == 0) == (v128 != 0))
                                                                    {
                                                                      int v216 = 0;
                                                                      BOOL v253 = 0;
                                                                      int v208 = 0;
                                                                      int v213 = 0;
                                                                      BOOL v252 = 0;
                                                                      int v207 = 0;
                                                                      int v210 = 0;
                                                                      BOOL v251 = 0;
                                                                      uint64_t v215 = 0;
                                                                      BOOL v250 = 0;
                                                                      int v220 = 0;
                                                                      int v222 = 0;
                                                                      BOOL v249 = 0;
                                                                      int v225 = 0;
                                                                      int v230 = 0;
                                                                      BOOL v248 = 0;
                                                                      int v229 = 0;
                                                                      int v231 = 0;
                                                                      BOOL v246 = 0;
                                                                      int v233 = 0;
                                                                      int v235 = 0;
                                                                      BOOL v244 = 0;
                                                                      int v236 = 0;
                                                                      int v239 = 0;
                                                                      BOOL v243 = 0;
                                                                      uint64_t v240 = 0;
                                                                      int v14 = 0;
                                                                      int v15 = 0;
                                                                      int v16 = 0;
                                                                      char v17 = 0;
                                                                      int v247 = 1;
                                                                      int v245 = 1;
                                                                      v242[2] = 1;
                                                                      int v13 = 1;
                                                                      v242[1] = 0x100000001;
                                                                      v242[0] = 0x100000001;
                                                                      uint64_t v241 = 0x100000001;
                                                                      int v237 = 1;
                                                                      int v238 = 1;
                                                                      int v232 = 1;
                                                                      int v234 = 1;
                                                                      int v228 = 1;
                                                                      int v227 = 1;
                                                                      int v224 = 1;
                                                                      int v226 = 1;
                                                                      uint64_t v223 = 0x100000001;
                                                                      int v219 = 1;
                                                                      int v221 = 1;
                                                                      uint64_t v218 = 0x100000001;
                                                                      int v211 = 1;
                                                                      int v214 = 1;
                                                                      int v212 = 1;
                                                                      int v217 = 1;
                                                                      int v209 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v55 = [(SFRichTitleCardSection *)self auxiliaryTopText];
                                                                      BOOL v253 = v55 != 0;
                                                                      v125 = (void *)v55;
                                                                      if (!v55
                                                                        || (-[SFRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText"), v56 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryTopText](v7, "auxiliaryTopText"), v137 = v56, v135 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v56, "isEqual:")))
                                                                      {
                                                                        v124 = [(SFRichTitleCardSection *)self auxiliaryMiddleText];
                                                                        v123 = [(SFRichTitleCardSection *)v7 auxiliaryMiddleText];
                                                                        if ((v124 == 0) == (v123 != 0))
                                                                        {
                                                                          int v213 = 0;
                                                                          BOOL v252 = 0;
                                                                          int v207 = 0;
                                                                          int v210 = 0;
                                                                          BOOL v251 = 0;
                                                                          uint64_t v215 = 0;
                                                                          BOOL v250 = 0;
                                                                          int v220 = 0;
                                                                          int v222 = 0;
                                                                          BOOL v249 = 0;
                                                                          int v225 = 0;
                                                                          int v230 = 0;
                                                                          BOOL v248 = 0;
                                                                          int v229 = 0;
                                                                          int v231 = 0;
                                                                          BOOL v246 = 0;
                                                                          int v233 = 0;
                                                                          int v235 = 0;
                                                                          BOOL v244 = 0;
                                                                          int v236 = 0;
                                                                          int v239 = 0;
                                                                          BOOL v243 = 0;
                                                                          uint64_t v240 = 0;
                                                                          int v14 = 0;
                                                                          int v15 = 0;
                                                                          int v16 = 0;
                                                                          char v17 = 0;
                                                                          int v247 = 1;
                                                                          int v245 = 1;
                                                                          v242[2] = 1;
                                                                          int v13 = 1;
                                                                          v242[1] = 0x100000001;
                                                                          v242[0] = 0x100000001;
                                                                          uint64_t v241 = 0x100000001;
                                                                          int v237 = 1;
                                                                          int v238 = 1;
                                                                          int v232 = 1;
                                                                          int v234 = 1;
                                                                          int v228 = 1;
                                                                          int v227 = 1;
                                                                          int v224 = 1;
                                                                          int v226 = 1;
                                                                          uint64_t v223 = 0x100000001;
                                                                          int v219 = 1;
                                                                          int v221 = 1;
                                                                          uint64_t v218 = 0x100000001;
                                                                          int v211 = 1;
                                                                          int v214 = 1;
                                                                          int v212 = 1;
                                                                          int v217 = 1;
                                                                          int v209 = 1;
                                                                          int v216 = 1;
                                                                          int v208 = 1;
                                                                        }
                                                                        else
                                                                        {
                                                                          uint64_t v57 = [(SFRichTitleCardSection *)self auxiliaryMiddleText];
                                                                          BOOL v252 = v57 != 0;
                                                                          v122 = (void *)v57;
                                                                          if (!v57
                                                                            || (-[SFRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText"), v58 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryMiddleText](v7, "auxiliaryMiddleText"), v131 = objc_claimAutoreleasedReturnValue(), v132 = v58, objc_msgSend(v58, "isEqual:")))
                                                                          {
                                                                            v119 = [(SFRichTitleCardSection *)self auxiliaryBottomText];
                                                                            uint64_t v118 = [(SFRichTitleCardSection *)v7 auxiliaryBottomText];
                                                                            if ((v119 == 0) == (v118 != 0))
                                                                            {
                                                                              int v210 = 0;
                                                                              BOOL v251 = 0;
                                                                              uint64_t v215 = 0;
                                                                              BOOL v250 = 0;
                                                                              int v220 = 0;
                                                                              int v222 = 0;
                                                                              BOOL v249 = 0;
                                                                              int v225 = 0;
                                                                              int v230 = 0;
                                                                              BOOL v248 = 0;
                                                                              int v229 = 0;
                                                                              int v231 = 0;
                                                                              BOOL v246 = 0;
                                                                              int v233 = 0;
                                                                              int v235 = 0;
                                                                              BOOL v244 = 0;
                                                                              int v236 = 0;
                                                                              int v239 = 0;
                                                                              BOOL v243 = 0;
                                                                              uint64_t v240 = 0;
                                                                              int v14 = 0;
                                                                              int v15 = 0;
                                                                              int v16 = 0;
                                                                              char v17 = 0;
                                                                              int v247 = 1;
                                                                              int v245 = 1;
                                                                              v242[2] = 1;
                                                                              int v13 = 1;
                                                                              v242[1] = 0x100000001;
                                                                              v242[0] = 0x100000001;
                                                                              uint64_t v241 = 0x100000001;
                                                                              int v237 = 1;
                                                                              int v238 = 1;
                                                                              int v232 = 1;
                                                                              int v234 = 1;
                                                                              int v228 = 1;
                                                                              int v227 = 1;
                                                                              int v224 = 1;
                                                                              int v226 = 1;
                                                                              uint64_t v223 = 0x100000001;
                                                                              int v219 = 1;
                                                                              int v221 = 1;
                                                                              uint64_t v218 = 0x100000001;
                                                                              int v211 = 1;
                                                                              int v214 = 1;
                                                                              int v212 = 1;
                                                                              int v217 = 1;
                                                                              int v209 = 1;
                                                                              int v216 = 1;
                                                                              int v208 = 1;
                                                                              int v213 = 1;
                                                                              int v207 = 1;
                                                                            }
                                                                            else
                                                                            {
                                                                              uint64_t v59 = [(SFRichTitleCardSection *)self auxiliaryBottomText];
                                                                              BOOL v251 = v59 != 0;
                                                                              v117 = (void *)v59;
                                                                              if (!v59
                                                                                || (-[SFRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText"), v60 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryBottomText](v7, "auxiliaryBottomText"), v126 = objc_claimAutoreleasedReturnValue(), v127 = v60, objc_msgSend(v60, "isEqual:")))
                                                                              {
                                                                                int v61 = [(SFRichTitleCardSection *)self auxiliaryBottomTextColor];
                                                                                if (v61 == [(SFRichTitleCardSection *)v7 auxiliaryBottomTextColor])
                                                                                {
                                                                                  v114 = [(SFRichTitleCardSection *)self auxiliaryAlignment];
                                                                                  objc_super v113 = [(SFRichTitleCardSection *)v7 auxiliaryAlignment];
                                                                                  if ((v114 == 0) == (v113 != 0))
                                                                                  {
                                                                                    BOOL v250 = 0;
                                                                                    int v220 = 0;
                                                                                    int v222 = 0;
                                                                                    BOOL v249 = 0;
                                                                                    int v225 = 0;
                                                                                    int v230 = 0;
                                                                                    BOOL v248 = 0;
                                                                                    int v229 = 0;
                                                                                    int v231 = 0;
                                                                                    BOOL v246 = 0;
                                                                                    int v233 = 0;
                                                                                    int v235 = 0;
                                                                                    BOOL v244 = 0;
                                                                                    int v236 = 0;
                                                                                    int v239 = 0;
                                                                                    BOOL v243 = 0;
                                                                                    uint64_t v240 = 0;
                                                                                    int v14 = 0;
                                                                                    int v15 = 0;
                                                                                    int v16 = 0;
                                                                                    char v17 = 0;
                                                                                    int v247 = 1;
                                                                                    int v245 = 1;
                                                                                    HIDWORD(v242[2]) = 0;
                                                                                    int v13 = 1;
                                                                                    LODWORD(v242[1]) = 1;
                                                                                    *(void *)((char *)&v242[1] + 4) = 0x100000001;
                                                                                    v242[0] = 0x100000001;
                                                                                    uint64_t v241 = 0x100000001;
                                                                                    int v237 = 1;
                                                                                    int v238 = 1;
                                                                                    int v232 = 1;
                                                                                    int v234 = 1;
                                                                                    int v228 = 1;
                                                                                    int v227 = 1;
                                                                                    int v224 = 1;
                                                                                    int v226 = 1;
                                                                                    uint64_t v223 = 0x100000001;
                                                                                    int v219 = 1;
                                                                                    int v221 = 1;
                                                                                    uint64_t v218 = 0x100000001;
                                                                                    int v211 = 1;
                                                                                    int v214 = 1;
                                                                                    int v212 = 1;
                                                                                    int v217 = 1;
                                                                                    int v209 = 1;
                                                                                    int v216 = 1;
                                                                                    int v208 = 1;
                                                                                    int v213 = 1;
                                                                                    int v207 = 1;
                                                                                    int v210 = 1;
                                                                                    uint64_t v215 = 1;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    uint64_t v62 = [(SFRichTitleCardSection *)self auxiliaryAlignment];
                                                                                    BOOL v250 = v62 != 0;
                                                                                    long long v112 = (void *)v62;
                                                                                    if (!v62
                                                                                      || (-[SFRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment"), v63 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryAlignment](v7, "auxiliaryAlignment"), v120 = objc_claimAutoreleasedReturnValue(), v121 = v63, objc_msgSend(v63, "isEqual:")))
                                                                                    {
                                                                                      BOOL v64 = [(SFRichTitleCardSection *)self hideVerticalDivider];
                                                                                      if (v64 == [(SFRichTitleCardSection *)v7 hideVerticalDivider]&& (int v65 = [(SFRichTitleCardSection *)self titleAlign], v65 == [(SFRichTitleCardSection *)v7 titleAlign]))
                                                                                      {
                                                                                        long long v111 = [(SFRichTitleCardSection *)self titleWeight];
                                                                                        long long v109 = [(SFRichTitleCardSection *)v7 titleWeight];
                                                                                        if ((v111 == 0) == (v109 != 0))
                                                                                        {
                                                                                          int v222 = 0;
                                                                                          BOOL v249 = 0;
                                                                                          int v225 = 0;
                                                                                          int v230 = 0;
                                                                                          BOOL v248 = 0;
                                                                                          int v229 = 0;
                                                                                          int v231 = 0;
                                                                                          BOOL v246 = 0;
                                                                                          int v233 = 0;
                                                                                          int v235 = 0;
                                                                                          BOOL v244 = 0;
                                                                                          int v236 = 0;
                                                                                          int v239 = 0;
                                                                                          BOOL v243 = 0;
                                                                                          uint64_t v240 = 0;
                                                                                          int v14 = 0;
                                                                                          int v15 = 0;
                                                                                          int v16 = 0;
                                                                                          char v17 = 0;
                                                                                          int v247 = 1;
                                                                                          int v245 = 1;
                                                                                          v242[2] = 1;
                                                                                          int v13 = 1;
                                                                                          v242[1] = 0x100000001;
                                                                                          v242[0] = 0x100000001;
                                                                                          uint64_t v241 = 0x100000001;
                                                                                          int v237 = 1;
                                                                                          int v238 = 1;
                                                                                          int v232 = 1;
                                                                                          int v234 = 1;
                                                                                          int v228 = 1;
                                                                                          int v227 = 1;
                                                                                          int v224 = 1;
                                                                                          int v226 = 1;
                                                                                          uint64_t v223 = 0x100000001;
                                                                                          int v219 = 1;
                                                                                          int v221 = 1;
                                                                                          uint64_t v218 = 0x100000001;
                                                                                          int v211 = 1;
                                                                                          int v214 = 1;
                                                                                          int v212 = 1;
                                                                                          int v217 = 1;
                                                                                          int v209 = 1;
                                                                                          int v216 = 1;
                                                                                          int v208 = 1;
                                                                                          int v213 = 1;
                                                                                          int v207 = 1;
                                                                                          int v210 = 1;
                                                                                          uint64_t v215 = 0x100000001;
                                                                                          int v220 = 1;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          uint64_t v66 = [(SFRichTitleCardSection *)self titleWeight];
                                                                                          BOOL v249 = v66 != 0;
                                                                                          long long v107 = (void *)v66;
                                                                                          if (!v66
                                                                                            || (-[SFRichTitleCardSection titleWeight](self, "titleWeight"), v67 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection titleWeight](v7, "titleWeight"), v115 = objc_claimAutoreleasedReturnValue(), v116 = v67, objc_msgSend(v67, "isEqual:")))
                                                                                          {
                                                                                            BOOL v68 = [(SFRichTitleCardSection *)self titleNoWrap];
                                                                                            if (v68 == [(SFRichTitleCardSection *)v7 titleNoWrap]
                                                                                              && (BOOL v69 = [(SFRichTitleCardSection *)self thumbnailCropCircle],
                                                                                                  v69 == [(SFRichTitleCardSection *)v7 thumbnailCropCircle]))
                                                                                            {
                                                                                              long long v104 = [(SFRichTitleCardSection *)self imageOverlay];
                                                                                              long long v103 = [(SFRichTitleCardSection *)v7 imageOverlay];
                                                                                              if ((v104 == 0) == (v103 != 0))
                                                                                              {
                                                                                                int v230 = 0;
                                                                                                BOOL v248 = 0;
                                                                                                int v229 = 0;
                                                                                                int v231 = 0;
                                                                                                BOOL v246 = 0;
                                                                                                int v233 = 0;
                                                                                                int v235 = 0;
                                                                                                BOOL v244 = 0;
                                                                                                int v236 = 0;
                                                                                                int v239 = 0;
                                                                                                BOOL v243 = 0;
                                                                                                uint64_t v240 = 0;
                                                                                                int v14 = 0;
                                                                                                int v15 = 0;
                                                                                                int v16 = 0;
                                                                                                char v17 = 0;
                                                                                                int v247 = 1;
                                                                                                int v245 = 1;
                                                                                                v242[2] = 1;
                                                                                                int v13 = 1;
                                                                                                v242[1] = 0x100000001;
                                                                                                v242[0] = 0x100000001;
                                                                                                uint64_t v241 = 0x100000001;
                                                                                                int v237 = 1;
                                                                                                int v238 = 1;
                                                                                                int v232 = 1;
                                                                                                int v234 = 1;
                                                                                                int v228 = 1;
                                                                                                int v227 = 1;
                                                                                                int v224 = 1;
                                                                                                int v226 = 1;
                                                                                                uint64_t v223 = 0x100000001;
                                                                                                int v219 = 1;
                                                                                                int v221 = 1;
                                                                                                uint64_t v218 = 0x100000001;
                                                                                                int v211 = 1;
                                                                                                int v214 = 1;
                                                                                                int v212 = 1;
                                                                                                int v217 = 1;
                                                                                                int v209 = 1;
                                                                                                int v216 = 1;
                                                                                                int v208 = 1;
                                                                                                int v213 = 1;
                                                                                                int v207 = 1;
                                                                                                int v210 = 1;
                                                                                                uint64_t v215 = 0x100000001;
                                                                                                int v220 = 1;
                                                                                                int v222 = 1;
                                                                                                int v225 = 1;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                uint64_t v70 = [(SFRichTitleCardSection *)self imageOverlay];
                                                                                                BOOL v248 = v70 != 0;
                                                                                                long long v102 = (void *)v70;
                                                                                                if (!v70 || (-[SFRichTitleCardSection imageOverlay](self, "imageOverlay"), v71 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection imageOverlay](v7, "imageOverlay"), v110 = v71, long long v108 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v71, "isEqual:")))
                                                                                                {
                                                                                                  long long v101 = [(SFRichTitleCardSection *)self playAction];
                                                                                                  long long v100 = [(SFRichTitleCardSection *)v7 playAction];
                                                                                                  if ((v101 == 0) == (v100 != 0))
                                                                                                  {
                                                                                                    int v231 = 0;
                                                                                                    BOOL v246 = 0;
                                                                                                    int v233 = 0;
                                                                                                    int v235 = 0;
                                                                                                    BOOL v244 = 0;
                                                                                                    int v236 = 0;
                                                                                                    int v239 = 0;
                                                                                                    BOOL v243 = 0;
                                                                                                    uint64_t v240 = 0;
                                                                                                    int v14 = 0;
                                                                                                    int v15 = 0;
                                                                                                    int v16 = 0;
                                                                                                    char v17 = 0;
                                                                                                    int v247 = 1;
                                                                                                    int v245 = 1;
                                                                                                    v242[2] = 1;
                                                                                                    int v13 = 1;
                                                                                                    v242[1] = 0x100000001;
                                                                                                    v242[0] = 0x100000001;
                                                                                                    uint64_t v241 = 0x100000001;
                                                                                                    int v237 = 1;
                                                                                                    int v238 = 1;
                                                                                                    int v232 = 1;
                                                                                                    int v234 = 1;
                                                                                                    int v228 = 1;
                                                                                                    int v227 = 1;
                                                                                                    int v224 = 1;
                                                                                                    int v226 = 1;
                                                                                                    uint64_t v223 = 0x100000001;
                                                                                                    int v219 = 1;
                                                                                                    int v221 = 1;
                                                                                                    uint64_t v218 = 0x100000001;
                                                                                                    int v211 = 1;
                                                                                                    int v214 = 1;
                                                                                                    int v212 = 1;
                                                                                                    int v217 = 1;
                                                                                                    int v209 = 1;
                                                                                                    int v216 = 1;
                                                                                                    int v208 = 1;
                                                                                                    int v213 = 1;
                                                                                                    int v207 = 1;
                                                                                                    int v210 = 1;
                                                                                                    uint64_t v215 = 0x100000001;
                                                                                                    int v220 = 1;
                                                                                                    int v222 = 1;
                                                                                                    int v225 = 1;
                                                                                                    int v230 = 1;
                                                                                                    int v229 = 1;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    uint64_t v72 = [(SFRichTitleCardSection *)self playAction];
                                                                                                    BOOL v246 = v72 != 0;
                                                                                                    long long v97 = (void *)v72;
                                                                                                    if (!v72 || (-[SFRichTitleCardSection playAction](self, "playAction"), v73 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection playAction](v7, "playAction"), long long v105 = objc_claimAutoreleasedReturnValue(), v106 = v73, objc_msgSend(v73, "isEqual:")))
                                                                                                    {
                                                                                                      int v74 = [(SFRichTitleCardSection *)self playActionAlign];
                                                                                                      if (v74 == [(SFRichTitleCardSection *)v7 playActionAlign])
                                                                                                      {
                                                                                                        v96 = [(SFRichTitleCardSection *)self offers];
                                                                                                        id v95 = [(SFRichTitleCardSection *)v7 offers];
                                                                                                        if ((v96 == 0) == (v95 != 0))
                                                                                                        {
                                                                                                          int v235 = 0;
                                                                                                          BOOL v244 = 0;
                                                                                                          int v236 = 0;
                                                                                                          int v239 = 0;
                                                                                                          BOOL v243 = 0;
                                                                                                          uint64_t v240 = 0;
                                                                                                          int v14 = 0;
                                                                                                          int v15 = 0;
                                                                                                          int v16 = 0;
                                                                                                          char v17 = 0;
                                                                                                          int v247 = 1;
                                                                                                          int v245 = 1;
                                                                                                          v242[2] = 1;
                                                                                                          int v13 = 1;
                                                                                                          v242[1] = 0x100000001;
                                                                                                          v242[0] = 0x100000001;
                                                                                                          uint64_t v241 = 0x100000001;
                                                                                                          int v237 = 1;
                                                                                                          int v238 = 1;
                                                                                                          int v232 = 1;
                                                                                                          int v234 = 1;
                                                                                                          int v228 = 1;
                                                                                                          int v227 = 1;
                                                                                                          int v224 = 1;
                                                                                                          int v226 = 1;
                                                                                                          uint64_t v223 = 0x100000001;
                                                                                                          int v219 = 1;
                                                                                                          int v221 = 1;
                                                                                                          uint64_t v218 = 0x100000001;
                                                                                                          int v211 = 1;
                                                                                                          int v214 = 1;
                                                                                                          int v212 = 1;
                                                                                                          int v217 = 1;
                                                                                                          int v209 = 1;
                                                                                                          int v216 = 1;
                                                                                                          int v208 = 1;
                                                                                                          int v213 = 1;
                                                                                                          int v207 = 1;
                                                                                                          int v210 = 1;
                                                                                                          uint64_t v215 = 0x100000001;
                                                                                                          int v220 = 1;
                                                                                                          int v222 = 1;
                                                                                                          int v225 = 1;
                                                                                                          int v230 = 1;
                                                                                                          int v229 = 1;
                                                                                                          int v231 = 1;
                                                                                                          int v233 = 1;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          uint64_t v75 = [(SFRichTitleCardSection *)self offers];
                                                                                                          BOOL v244 = v75 != 0;
                                                                                                          v92 = (void *)v75;
                                                                                                          if (!v75 || (-[SFRichTitleCardSection offers](self, "offers"), uint64_t v76 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection offers](v7, "offers"), v98 = objc_claimAutoreleasedReturnValue(), v99 = v76, objc_msgSend(v76, "isEqual:")))
                                                                                                          {
                                                                                                            v91 = [(SFRichTitleCardSection *)self footnote];
                                                                                                            uint64_t v90 = [(SFRichTitleCardSection *)v7 footnote];
                                                                                                            if ((v91 == 0) == (v90 != 0))
                                                                                                            {
                                                                                                              int v239 = 0;
                                                                                                              BOOL v243 = 0;
                                                                                                              uint64_t v240 = 0;
                                                                                                              int v14 = 0;
                                                                                                              int v15 = 0;
                                                                                                              int v16 = 0;
                                                                                                              char v17 = 0;
                                                                                                              int v247 = 1;
                                                                                                              int v245 = 1;
                                                                                                              v242[2] = 1;
                                                                                                              int v13 = 1;
                                                                                                              v242[1] = 0x100000001;
                                                                                                              v242[0] = 0x100000001;
                                                                                                              uint64_t v241 = 0x100000001;
                                                                                                              int v237 = 1;
                                                                                                              int v238 = 1;
                                                                                                              int v232 = 1;
                                                                                                              int v234 = 1;
                                                                                                              int v228 = 1;
                                                                                                              int v227 = 1;
                                                                                                              int v224 = 1;
                                                                                                              int v226 = 1;
                                                                                                              uint64_t v223 = 0x100000001;
                                                                                                              int v219 = 1;
                                                                                                              int v221 = 1;
                                                                                                              uint64_t v218 = 0x100000001;
                                                                                                              int v211 = 1;
                                                                                                              int v214 = 1;
                                                                                                              int v212 = 1;
                                                                                                              int v217 = 1;
                                                                                                              int v209 = 1;
                                                                                                              int v216 = 1;
                                                                                                              int v208 = 1;
                                                                                                              int v213 = 1;
                                                                                                              int v207 = 1;
                                                                                                              int v210 = 1;
                                                                                                              uint64_t v215 = 0x100000001;
                                                                                                              int v220 = 1;
                                                                                                              int v222 = 1;
                                                                                                              int v225 = 1;
                                                                                                              int v230 = 1;
                                                                                                              int v229 = 1;
                                                                                                              int v231 = 1;
                                                                                                              int v233 = 1;
                                                                                                              int v235 = 1;
                                                                                                              int v236 = 1;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              uint64_t v77 = [(SFRichTitleCardSection *)self footnote];
                                                                                                              BOOL v243 = v77 != 0;
                                                                                                              uint64_t v88 = (void *)v77;
                                                                                                              if (!v77 || (-[SFRichTitleCardSection footnote](self, "footnote"), v78 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection footnote](v7, "footnote"), v93 = objc_claimAutoreleasedReturnValue(), v94 = v78, objc_msgSend(v78, "isEqual:")))
                                                                                                              {
                                                                                                                id v86 = [(SFRichTitleCardSection *)self richSubtitle];
                                                                                                                v85 = [(SFRichTitleCardSection *)v7 richSubtitle];
                                                                                                                if ((v86 == 0) == (v85 != 0))
                                                                                                                {
                                                                                                                  int v14 = 0;
                                                                                                                  int v15 = 0;
                                                                                                                  int v16 = 0;
                                                                                                                  char v17 = 0;
                                                                                                                  int v247 = 1;
                                                                                                                  int v245 = 1;
                                                                                                                  HIDWORD(v242[2]) = 0;
                                                                                                                  int v13 = 1;
                                                                                                                  LODWORD(v242[1]) = 1;
                                                                                                                  *(void *)((char *)&v242[1] + 4) = 0x100000001;
                                                                                                                  v242[0] = 0x100000001;
                                                                                                                  uint64_t v241 = 0x100000001;
                                                                                                                  int v237 = 1;
                                                                                                                  int v238 = 1;
                                                                                                                  int v232 = 1;
                                                                                                                  int v234 = 1;
                                                                                                                  int v228 = 1;
                                                                                                                  int v227 = 1;
                                                                                                                  int v224 = 1;
                                                                                                                  int v226 = 1;
                                                                                                                  uint64_t v223 = 0x100000001;
                                                                                                                  int v219 = 1;
                                                                                                                  int v221 = 1;
                                                                                                                  uint64_t v218 = 0x100000001;
                                                                                                                  int v211 = 1;
                                                                                                                  int v214 = 1;
                                                                                                                  int v212 = 1;
                                                                                                                  int v217 = 1;
                                                                                                                  int v209 = 1;
                                                                                                                  int v216 = 1;
                                                                                                                  int v208 = 1;
                                                                                                                  int v213 = 1;
                                                                                                                  int v207 = 1;
                                                                                                                  int v210 = 1;
                                                                                                                  uint64_t v215 = 0x100000001;
                                                                                                                  int v220 = 1;
                                                                                                                  int v222 = 1;
                                                                                                                  int v225 = 1;
                                                                                                                  int v230 = 1;
                                                                                                                  int v229 = 1;
                                                                                                                  int v231 = 1;
                                                                                                                  int v233 = 1;
                                                                                                                  int v235 = 1;
                                                                                                                  int v236 = 1;
                                                                                                                  int v239 = 1;
                                                                                                                  uint64_t v240 = 1;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  uint64_t v79 = [(SFRichTitleCardSection *)self richSubtitle];
                                                                                                                  HIDWORD(v242[2]) = v79 != 0;
                                                                                                                  v84 = (void *)v79;
                                                                                                                  if (!v79 || (-[SFRichTitleCardSection richSubtitle](self, "richSubtitle"), v80 = objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection richSubtitle](v7, "richSubtitle"), uint64_t v89 = v80, v87 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v80, "isEqual:")))
                                                                                                                  {
                                                                                                                    BOOL v81 = [(SFRichTitleCardSection *)self subtitleIsEmphasized];
                                                                                                                    if (v81 == [(SFRichTitleCardSection *)v7 subtitleIsEmphasized])
                                                                                                                    {
                                                                                                                      uint64_t v9 = [(SFRichTitleCardSection *)self buttonItems];
                                                                                                                      uint64_t v10 = [(SFRichTitleCardSection *)v7 buttonItems];
                                                                                                                      if ((v9 == 0) == (v10 != 0))
                                                                                                                      {
                                                                                                                        int v15 = 0;
                                                                                                                        int v16 = 0;
                                                                                                                        char v17 = 0;
                                                                                                                        int v247 = 1;
                                                                                                                        int v245 = 1;
                                                                                                                        LODWORD(v242[2]) = 1;
                                                                                                                        int v13 = 1;
                                                                                                                        v242[1] = 0x100000001;
                                                                                                                        v242[0] = 0x100000001;
                                                                                                                        uint64_t v241 = 0x100000001;
                                                                                                                        int v237 = 1;
                                                                                                                        int v238 = 1;
                                                                                                                        int v232 = 1;
                                                                                                                        int v234 = 1;
                                                                                                                        int v228 = 1;
                                                                                                                        int v227 = 1;
                                                                                                                        int v224 = 1;
                                                                                                                        int v226 = 1;
                                                                                                                        uint64_t v223 = 0x100000001;
                                                                                                                        int v219 = 1;
                                                                                                                        int v221 = 1;
                                                                                                                        uint64_t v218 = 0x100000001;
                                                                                                                        int v211 = 1;
                                                                                                                        int v214 = 1;
                                                                                                                        int v212 = 1;
                                                                                                                        int v217 = 1;
                                                                                                                        int v209 = 1;
                                                                                                                        int v216 = 1;
                                                                                                                        int v208 = 1;
                                                                                                                        int v213 = 1;
                                                                                                                        int v207 = 1;
                                                                                                                        int v210 = 1;
                                                                                                                        uint64_t v215 = 0x100000001;
                                                                                                                        int v220 = 1;
                                                                                                                        int v222 = 1;
                                                                                                                        int v225 = 1;
                                                                                                                        int v230 = 1;
                                                                                                                        int v229 = 1;
                                                                                                                        int v231 = 1;
                                                                                                                        int v233 = 1;
                                                                                                                        int v235 = 1;
                                                                                                                        int v236 = 1;
                                                                                                                        int v239 = 1;
                                                                                                                        uint64_t v240 = 0x100000001;
                                                                                                                        int v14 = 1;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v83 = [(SFRichTitleCardSection *)self buttonItems];
                                                                                                                        if (v83)
                                                                                                                        {
                                                                                                                          unint64_t v3 = [(SFRichTitleCardSection *)self buttonItems];
                                                                                                                          uint64_t v4 = [(SFRichTitleCardSection *)v7 buttonItems];
                                                                                                                          char v17 = [v3 isEqual:v4];
                                                                                                                          int v16 = 1;
                                                                                                                          int v247 = 1;
                                                                                                                          int v245 = 1;
                                                                                                                          LODWORD(v242[2]) = 1;
                                                                                                                          int v13 = 1;
                                                                                                                          v242[1] = 0x100000001;
                                                                                                                          v242[0] = 0x100000001;
                                                                                                                          uint64_t v241 = 0x100000001;
                                                                                                                          int v237 = 1;
                                                                                                                          int v238 = 1;
                                                                                                                          int v232 = 1;
                                                                                                                          int v234 = 1;
                                                                                                                          int v228 = 1;
                                                                                                                          int v227 = 1;
                                                                                                                          int v224 = 1;
                                                                                                                          int v226 = 1;
                                                                                                                          uint64_t v223 = 0x100000001;
                                                                                                                          int v219 = 1;
                                                                                                                          int v221 = 1;
                                                                                                                          uint64_t v218 = 0x100000001;
                                                                                                                          int v211 = 1;
                                                                                                                          int v214 = 1;
                                                                                                                          int v212 = 1;
                                                                                                                          int v217 = 1;
                                                                                                                          int v209 = 1;
                                                                                                                          int v216 = 1;
                                                                                                                          int v208 = 1;
                                                                                                                          int v213 = 1;
                                                                                                                          int v207 = 1;
                                                                                                                          int v210 = 1;
                                                                                                                          uint64_t v215 = 0x100000001;
                                                                                                                          int v220 = 1;
                                                                                                                          int v222 = 1;
                                                                                                                          int v225 = 1;
                                                                                                                          int v230 = 1;
                                                                                                                          int v229 = 1;
                                                                                                                          int v231 = 1;
                                                                                                                          int v233 = 1;
                                                                                                                          int v235 = 1;
                                                                                                                          int v236 = 1;
                                                                                                                          int v239 = 1;
                                                                                                                          uint64_t v240 = 0x100000001;
                                                                                                                          int v14 = 1;
                                                                                                                          int v15 = 1;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v83 = 0;
                                                                                                                          int v16 = 0;
                                                                                                                          int v247 = 1;
                                                                                                                          int v245 = 1;
                                                                                                                          LODWORD(v242[2]) = 1;
                                                                                                                          int v13 = 1;
                                                                                                                          v242[1] = 0x100000001;
                                                                                                                          v242[0] = 0x100000001;
                                                                                                                          uint64_t v241 = 0x100000001;
                                                                                                                          int v237 = 1;
                                                                                                                          int v238 = 1;
                                                                                                                          int v232 = 1;
                                                                                                                          int v234 = 1;
                                                                                                                          int v228 = 1;
                                                                                                                          int v227 = 1;
                                                                                                                          int v224 = 1;
                                                                                                                          int v226 = 1;
                                                                                                                          uint64_t v223 = 0x100000001;
                                                                                                                          int v219 = 1;
                                                                                                                          int v221 = 1;
                                                                                                                          uint64_t v218 = 0x100000001;
                                                                                                                          int v211 = 1;
                                                                                                                          int v214 = 1;
                                                                                                                          int v212 = 1;
                                                                                                                          int v217 = 1;
                                                                                                                          int v209 = 1;
                                                                                                                          int v216 = 1;
                                                                                                                          int v208 = 1;
                                                                                                                          int v213 = 1;
                                                                                                                          int v207 = 1;
                                                                                                                          int v210 = 1;
                                                                                                                          uint64_t v215 = 0x100000001;
                                                                                                                          int v220 = 1;
                                                                                                                          int v222 = 1;
                                                                                                                          int v225 = 1;
                                                                                                                          int v230 = 1;
                                                                                                                          int v229 = 1;
                                                                                                                          int v231 = 1;
                                                                                                                          int v233 = 1;
                                                                                                                          int v235 = 1;
                                                                                                                          int v236 = 1;
                                                                                                                          int v239 = 1;
                                                                                                                          uint64_t v240 = 0x100000001;
                                                                                                                          int v14 = 1;
                                                                                                                          int v15 = 1;
                                                                                                                          char v17 = 1;
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      int v14 = 0;
                                                                                                                      int v15 = 0;
                                                                                                                      int v16 = 0;
                                                                                                                      char v17 = 0;
                                                                                                                      int v247 = 1;
                                                                                                                      int v245 = 1;
                                                                                                                      LODWORD(v242[2]) = 1;
                                                                                                                      int v13 = 1;
                                                                                                                      v242[1] = 0x100000001;
                                                                                                                      v242[0] = 0x100000001;
                                                                                                                      uint64_t v241 = 0x100000001;
                                                                                                                      int v237 = 1;
                                                                                                                      int v238 = 1;
                                                                                                                      int v232 = 1;
                                                                                                                      int v234 = 1;
                                                                                                                      int v228 = 1;
                                                                                                                      int v227 = 1;
                                                                                                                      int v224 = 1;
                                                                                                                      int v226 = 1;
                                                                                                                      uint64_t v223 = 0x100000001;
                                                                                                                      int v219 = 1;
                                                                                                                      int v221 = 1;
                                                                                                                      uint64_t v218 = 0x100000001;
                                                                                                                      int v211 = 1;
                                                                                                                      int v214 = 1;
                                                                                                                      int v212 = 1;
                                                                                                                      int v217 = 1;
                                                                                                                      int v209 = 1;
                                                                                                                      int v216 = 1;
                                                                                                                      int v208 = 1;
                                                                                                                      int v213 = 1;
                                                                                                                      int v207 = 1;
                                                                                                                      int v210 = 1;
                                                                                                                      uint64_t v215 = 0x100000001;
                                                                                                                      int v220 = 1;
                                                                                                                      int v222 = 1;
                                                                                                                      int v225 = 1;
                                                                                                                      int v230 = 1;
                                                                                                                      int v229 = 1;
                                                                                                                      int v231 = 1;
                                                                                                                      int v233 = 1;
                                                                                                                      int v235 = 1;
                                                                                                                      int v236 = 1;
                                                                                                                      int v239 = 1;
                                                                                                                      uint64_t v240 = 0x100000001;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    int v14 = 0;
                                                                                                                    int v15 = 0;
                                                                                                                    int v16 = 0;
                                                                                                                    char v17 = 0;
                                                                                                                    int v247 = 1;
                                                                                                                    int v245 = 1;
                                                                                                                    v242[2] = 0x100000001;
                                                                                                                    int v13 = 1;
                                                                                                                    v242[1] = 0x100000001;
                                                                                                                    v242[0] = 0x100000001;
                                                                                                                    uint64_t v241 = 0x100000001;
                                                                                                                    int v237 = 1;
                                                                                                                    int v238 = 1;
                                                                                                                    int v232 = 1;
                                                                                                                    int v234 = 1;
                                                                                                                    int v228 = 1;
                                                                                                                    int v227 = 1;
                                                                                                                    int v224 = 1;
                                                                                                                    int v226 = 1;
                                                                                                                    uint64_t v223 = 0x100000001;
                                                                                                                    int v219 = 1;
                                                                                                                    int v221 = 1;
                                                                                                                    uint64_t v218 = 0x100000001;
                                                                                                                    int v211 = 1;
                                                                                                                    int v214 = 1;
                                                                                                                    int v212 = 1;
                                                                                                                    int v217 = 1;
                                                                                                                    int v209 = 1;
                                                                                                                    int v216 = 1;
                                                                                                                    int v208 = 1;
                                                                                                                    int v213 = 1;
                                                                                                                    int v207 = 1;
                                                                                                                    int v210 = 1;
                                                                                                                    uint64_t v215 = 0x100000001;
                                                                                                                    int v220 = 1;
                                                                                                                    int v222 = 1;
                                                                                                                    int v225 = 1;
                                                                                                                    int v230 = 1;
                                                                                                                    int v229 = 1;
                                                                                                                    int v231 = 1;
                                                                                                                    int v233 = 1;
                                                                                                                    int v235 = 1;
                                                                                                                    int v236 = 1;
                                                                                                                    int v239 = 1;
                                                                                                                    uint64_t v240 = 0x100000001;
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                uint64_t v240 = 0;
                                                                                                                int v14 = 0;
                                                                                                                int v15 = 0;
                                                                                                                int v16 = 0;
                                                                                                                char v17 = 0;
                                                                                                                int v247 = 1;
                                                                                                                int v245 = 1;
                                                                                                                v242[2] = 1;
                                                                                                                int v13 = 1;
                                                                                                                v242[1] = 0x100000001;
                                                                                                                v242[0] = 0x100000001;
                                                                                                                uint64_t v241 = 0x100000001;
                                                                                                                int v237 = 1;
                                                                                                                int v238 = 1;
                                                                                                                int v232 = 1;
                                                                                                                int v234 = 1;
                                                                                                                int v228 = 1;
                                                                                                                int v227 = 1;
                                                                                                                int v224 = 1;
                                                                                                                int v226 = 1;
                                                                                                                uint64_t v223 = 0x100000001;
                                                                                                                int v219 = 1;
                                                                                                                int v221 = 1;
                                                                                                                uint64_t v218 = 0x100000001;
                                                                                                                int v211 = 1;
                                                                                                                int v214 = 1;
                                                                                                                int v212 = 1;
                                                                                                                int v217 = 1;
                                                                                                                int v209 = 1;
                                                                                                                int v216 = 1;
                                                                                                                int v208 = 1;
                                                                                                                int v213 = 1;
                                                                                                                int v207 = 1;
                                                                                                                int v210 = 1;
                                                                                                                uint64_t v215 = 0x100000001;
                                                                                                                int v220 = 1;
                                                                                                                int v222 = 1;
                                                                                                                int v225 = 1;
                                                                                                                int v230 = 1;
                                                                                                                int v229 = 1;
                                                                                                                int v231 = 1;
                                                                                                                int v233 = 1;
                                                                                                                int v235 = 1;
                                                                                                                int v236 = 1;
                                                                                                                int v239 = 1;
                                                                                                                BOOL v243 = 1;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            int v236 = 0;
                                                                                                            int v239 = 0;
                                                                                                            BOOL v243 = 0;
                                                                                                            uint64_t v240 = 0;
                                                                                                            int v14 = 0;
                                                                                                            int v15 = 0;
                                                                                                            int v16 = 0;
                                                                                                            char v17 = 0;
                                                                                                            int v247 = 1;
                                                                                                            int v245 = 1;
                                                                                                            v242[2] = 1;
                                                                                                            int v13 = 1;
                                                                                                            v242[1] = 0x100000001;
                                                                                                            v242[0] = 0x100000001;
                                                                                                            uint64_t v241 = 0x100000001;
                                                                                                            int v237 = 1;
                                                                                                            int v238 = 1;
                                                                                                            int v232 = 1;
                                                                                                            int v234 = 1;
                                                                                                            int v228 = 1;
                                                                                                            int v227 = 1;
                                                                                                            int v224 = 1;
                                                                                                            int v226 = 1;
                                                                                                            uint64_t v223 = 0x100000001;
                                                                                                            int v219 = 1;
                                                                                                            int v221 = 1;
                                                                                                            uint64_t v218 = 0x100000001;
                                                                                                            int v211 = 1;
                                                                                                            int v214 = 1;
                                                                                                            int v212 = 1;
                                                                                                            int v217 = 1;
                                                                                                            int v209 = 1;
                                                                                                            int v216 = 1;
                                                                                                            int v208 = 1;
                                                                                                            int v213 = 1;
                                                                                                            int v207 = 1;
                                                                                                            int v210 = 1;
                                                                                                            uint64_t v215 = 0x100000001;
                                                                                                            int v220 = 1;
                                                                                                            int v222 = 1;
                                                                                                            int v225 = 1;
                                                                                                            int v230 = 1;
                                                                                                            int v229 = 1;
                                                                                                            int v231 = 1;
                                                                                                            int v233 = 1;
                                                                                                            int v235 = 1;
                                                                                                            BOOL v244 = 1;
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        int v233 = 0;
                                                                                                        int v235 = 0;
                                                                                                        BOOL v244 = 0;
                                                                                                        int v236 = 0;
                                                                                                        int v239 = 0;
                                                                                                        BOOL v243 = 0;
                                                                                                        uint64_t v240 = 0;
                                                                                                        int v14 = 0;
                                                                                                        int v15 = 0;
                                                                                                        int v16 = 0;
                                                                                                        char v17 = 0;
                                                                                                        int v247 = 1;
                                                                                                        int v245 = 1;
                                                                                                        v242[2] = 1;
                                                                                                        int v13 = 1;
                                                                                                        v242[1] = 0x100000001;
                                                                                                        v242[0] = 0x100000001;
                                                                                                        uint64_t v241 = 0x100000001;
                                                                                                        int v237 = 1;
                                                                                                        int v238 = 1;
                                                                                                        int v232 = 1;
                                                                                                        int v234 = 1;
                                                                                                        int v228 = 1;
                                                                                                        int v227 = 1;
                                                                                                        int v224 = 1;
                                                                                                        int v226 = 1;
                                                                                                        uint64_t v223 = 0x100000001;
                                                                                                        int v219 = 1;
                                                                                                        int v221 = 1;
                                                                                                        uint64_t v218 = 0x100000001;
                                                                                                        int v211 = 1;
                                                                                                        int v214 = 1;
                                                                                                        int v212 = 1;
                                                                                                        int v217 = 1;
                                                                                                        int v209 = 1;
                                                                                                        int v216 = 1;
                                                                                                        int v208 = 1;
                                                                                                        int v213 = 1;
                                                                                                        int v207 = 1;
                                                                                                        int v210 = 1;
                                                                                                        uint64_t v215 = 0x100000001;
                                                                                                        int v220 = 1;
                                                                                                        int v222 = 1;
                                                                                                        int v225 = 1;
                                                                                                        int v230 = 1;
                                                                                                        int v229 = 1;
                                                                                                        int v231 = 1;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      int v233 = 0;
                                                                                                      int v235 = 0;
                                                                                                      BOOL v244 = 0;
                                                                                                      int v236 = 0;
                                                                                                      int v239 = 0;
                                                                                                      BOOL v243 = 0;
                                                                                                      uint64_t v240 = 0;
                                                                                                      int v14 = 0;
                                                                                                      int v15 = 0;
                                                                                                      int v16 = 0;
                                                                                                      char v17 = 0;
                                                                                                      int v247 = 1;
                                                                                                      int v245 = 1;
                                                                                                      v242[2] = 1;
                                                                                                      int v13 = 1;
                                                                                                      v242[1] = 0x100000001;
                                                                                                      v242[0] = 0x100000001;
                                                                                                      uint64_t v241 = 0x100000001;
                                                                                                      int v237 = 1;
                                                                                                      int v238 = 1;
                                                                                                      int v232 = 1;
                                                                                                      int v234 = 1;
                                                                                                      int v228 = 1;
                                                                                                      int v227 = 1;
                                                                                                      int v224 = 1;
                                                                                                      int v226 = 1;
                                                                                                      uint64_t v223 = 0x100000001;
                                                                                                      int v219 = 1;
                                                                                                      int v221 = 1;
                                                                                                      uint64_t v218 = 0x100000001;
                                                                                                      int v211 = 1;
                                                                                                      int v214 = 1;
                                                                                                      int v212 = 1;
                                                                                                      int v217 = 1;
                                                                                                      int v209 = 1;
                                                                                                      int v216 = 1;
                                                                                                      int v208 = 1;
                                                                                                      int v213 = 1;
                                                                                                      int v207 = 1;
                                                                                                      int v210 = 1;
                                                                                                      uint64_t v215 = 0x100000001;
                                                                                                      int v220 = 1;
                                                                                                      int v222 = 1;
                                                                                                      int v225 = 1;
                                                                                                      int v230 = 1;
                                                                                                      int v229 = 1;
                                                                                                      int v231 = 1;
                                                                                                      BOOL v246 = 1;
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  int v229 = 0;
                                                                                                  int v231 = 0;
                                                                                                  BOOL v246 = 0;
                                                                                                  int v233 = 0;
                                                                                                  int v235 = 0;
                                                                                                  BOOL v244 = 0;
                                                                                                  int v236 = 0;
                                                                                                  int v239 = 0;
                                                                                                  BOOL v243 = 0;
                                                                                                  uint64_t v240 = 0;
                                                                                                  int v14 = 0;
                                                                                                  int v15 = 0;
                                                                                                  int v16 = 0;
                                                                                                  char v17 = 0;
                                                                                                  int v247 = 1;
                                                                                                  int v245 = 1;
                                                                                                  v242[2] = 1;
                                                                                                  int v13 = 1;
                                                                                                  v242[1] = 0x100000001;
                                                                                                  v242[0] = 0x100000001;
                                                                                                  uint64_t v241 = 0x100000001;
                                                                                                  int v237 = 1;
                                                                                                  int v238 = 1;
                                                                                                  int v232 = 1;
                                                                                                  int v234 = 1;
                                                                                                  int v228 = 1;
                                                                                                  int v227 = 1;
                                                                                                  int v224 = 1;
                                                                                                  int v226 = 1;
                                                                                                  uint64_t v223 = 0x100000001;
                                                                                                  int v219 = 1;
                                                                                                  int v221 = 1;
                                                                                                  uint64_t v218 = 0x100000001;
                                                                                                  int v211 = 1;
                                                                                                  int v214 = 1;
                                                                                                  int v212 = 1;
                                                                                                  int v217 = 1;
                                                                                                  int v209 = 1;
                                                                                                  int v216 = 1;
                                                                                                  int v208 = 1;
                                                                                                  int v213 = 1;
                                                                                                  int v207 = 1;
                                                                                                  int v210 = 1;
                                                                                                  uint64_t v215 = 0x100000001;
                                                                                                  int v220 = 1;
                                                                                                  int v222 = 1;
                                                                                                  int v225 = 1;
                                                                                                  int v230 = 1;
                                                                                                  BOOL v248 = 1;
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              int v225 = 0;
                                                                                              int v230 = 0;
                                                                                              BOOL v248 = 0;
                                                                                              int v229 = 0;
                                                                                              int v231 = 0;
                                                                                              BOOL v246 = 0;
                                                                                              int v233 = 0;
                                                                                              int v235 = 0;
                                                                                              BOOL v244 = 0;
                                                                                              int v236 = 0;
                                                                                              int v239 = 0;
                                                                                              BOOL v243 = 0;
                                                                                              uint64_t v240 = 0;
                                                                                              int v14 = 0;
                                                                                              int v15 = 0;
                                                                                              int v16 = 0;
                                                                                              char v17 = 0;
                                                                                              int v247 = 1;
                                                                                              int v245 = 1;
                                                                                              v242[2] = 1;
                                                                                              int v13 = 1;
                                                                                              v242[1] = 0x100000001;
                                                                                              v242[0] = 0x100000001;
                                                                                              uint64_t v241 = 0x100000001;
                                                                                              int v237 = 1;
                                                                                              int v238 = 1;
                                                                                              int v232 = 1;
                                                                                              int v234 = 1;
                                                                                              int v228 = 1;
                                                                                              int v227 = 1;
                                                                                              int v224 = 1;
                                                                                              int v226 = 1;
                                                                                              uint64_t v223 = 0x100000001;
                                                                                              int v219 = 1;
                                                                                              int v221 = 1;
                                                                                              uint64_t v218 = 0x100000001;
                                                                                              int v211 = 1;
                                                                                              int v214 = 1;
                                                                                              int v212 = 1;
                                                                                              int v217 = 1;
                                                                                              int v209 = 1;
                                                                                              int v216 = 1;
                                                                                              int v208 = 1;
                                                                                              int v213 = 1;
                                                                                              int v207 = 1;
                                                                                              int v210 = 1;
                                                                                              uint64_t v215 = 0x100000001;
                                                                                              int v220 = 1;
                                                                                              int v222 = 1;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            int v225 = 0;
                                                                                            int v230 = 0;
                                                                                            BOOL v248 = 0;
                                                                                            int v229 = 0;
                                                                                            int v231 = 0;
                                                                                            BOOL v246 = 0;
                                                                                            int v233 = 0;
                                                                                            int v235 = 0;
                                                                                            BOOL v244 = 0;
                                                                                            int v236 = 0;
                                                                                            int v239 = 0;
                                                                                            BOOL v243 = 0;
                                                                                            uint64_t v240 = 0;
                                                                                            int v14 = 0;
                                                                                            int v15 = 0;
                                                                                            int v16 = 0;
                                                                                            char v17 = 0;
                                                                                            int v247 = 1;
                                                                                            int v245 = 1;
                                                                                            v242[2] = 1;
                                                                                            int v13 = 1;
                                                                                            v242[1] = 0x100000001;
                                                                                            v242[0] = 0x100000001;
                                                                                            uint64_t v241 = 0x100000001;
                                                                                            int v237 = 1;
                                                                                            int v238 = 1;
                                                                                            int v232 = 1;
                                                                                            int v234 = 1;
                                                                                            int v228 = 1;
                                                                                            int v227 = 1;
                                                                                            int v224 = 1;
                                                                                            int v226 = 1;
                                                                                            uint64_t v223 = 0x100000001;
                                                                                            int v219 = 1;
                                                                                            int v221 = 1;
                                                                                            uint64_t v218 = 0x100000001;
                                                                                            int v211 = 1;
                                                                                            int v214 = 1;
                                                                                            int v212 = 1;
                                                                                            int v217 = 1;
                                                                                            int v209 = 1;
                                                                                            int v216 = 1;
                                                                                            int v208 = 1;
                                                                                            int v213 = 1;
                                                                                            int v207 = 1;
                                                                                            int v210 = 1;
                                                                                            uint64_t v215 = 0x100000001;
                                                                                            int v220 = 1;
                                                                                            int v222 = 1;
                                                                                            BOOL v249 = 1;
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        int v220 = 0;
                                                                                        int v222 = 0;
                                                                                        BOOL v249 = 0;
                                                                                        int v225 = 0;
                                                                                        int v230 = 0;
                                                                                        BOOL v248 = 0;
                                                                                        int v229 = 0;
                                                                                        int v231 = 0;
                                                                                        BOOL v246 = 0;
                                                                                        int v233 = 0;
                                                                                        int v235 = 0;
                                                                                        BOOL v244 = 0;
                                                                                        int v236 = 0;
                                                                                        int v239 = 0;
                                                                                        BOOL v243 = 0;
                                                                                        uint64_t v240 = 0;
                                                                                        int v14 = 0;
                                                                                        int v15 = 0;
                                                                                        int v16 = 0;
                                                                                        char v17 = 0;
                                                                                        int v247 = 1;
                                                                                        int v245 = 1;
                                                                                        v242[2] = 1;
                                                                                        int v13 = 1;
                                                                                        v242[1] = 0x100000001;
                                                                                        v242[0] = 0x100000001;
                                                                                        uint64_t v241 = 0x100000001;
                                                                                        int v237 = 1;
                                                                                        int v238 = 1;
                                                                                        int v232 = 1;
                                                                                        int v234 = 1;
                                                                                        int v228 = 1;
                                                                                        int v227 = 1;
                                                                                        int v224 = 1;
                                                                                        int v226 = 1;
                                                                                        uint64_t v223 = 0x100000001;
                                                                                        int v219 = 1;
                                                                                        int v221 = 1;
                                                                                        uint64_t v218 = 0x100000001;
                                                                                        int v211 = 1;
                                                                                        int v214 = 1;
                                                                                        int v212 = 1;
                                                                                        int v217 = 1;
                                                                                        int v209 = 1;
                                                                                        int v216 = 1;
                                                                                        int v208 = 1;
                                                                                        int v213 = 1;
                                                                                        int v207 = 1;
                                                                                        int v210 = 1;
                                                                                        uint64_t v215 = 0x100000001;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      int v220 = 0;
                                                                                      int v222 = 0;
                                                                                      BOOL v249 = 0;
                                                                                      int v225 = 0;
                                                                                      int v230 = 0;
                                                                                      BOOL v248 = 0;
                                                                                      int v229 = 0;
                                                                                      int v231 = 0;
                                                                                      BOOL v246 = 0;
                                                                                      int v233 = 0;
                                                                                      int v235 = 0;
                                                                                      BOOL v244 = 0;
                                                                                      int v236 = 0;
                                                                                      int v239 = 0;
                                                                                      BOOL v243 = 0;
                                                                                      uint64_t v240 = 0;
                                                                                      int v14 = 0;
                                                                                      int v15 = 0;
                                                                                      int v16 = 0;
                                                                                      char v17 = 0;
                                                                                      int v247 = 1;
                                                                                      int v245 = 1;
                                                                                      v242[2] = 1;
                                                                                      int v13 = 1;
                                                                                      v242[1] = 0x100000001;
                                                                                      v242[0] = 0x100000001;
                                                                                      uint64_t v241 = 0x100000001;
                                                                                      int v237 = 1;
                                                                                      int v238 = 1;
                                                                                      int v232 = 1;
                                                                                      int v234 = 1;
                                                                                      int v228 = 1;
                                                                                      int v227 = 1;
                                                                                      int v224 = 1;
                                                                                      int v226 = 1;
                                                                                      uint64_t v223 = 0x100000001;
                                                                                      int v219 = 1;
                                                                                      int v221 = 1;
                                                                                      uint64_t v218 = 0x100000001;
                                                                                      int v211 = 1;
                                                                                      int v214 = 1;
                                                                                      int v212 = 1;
                                                                                      int v217 = 1;
                                                                                      int v209 = 1;
                                                                                      int v216 = 1;
                                                                                      int v208 = 1;
                                                                                      int v213 = 1;
                                                                                      int v207 = 1;
                                                                                      int v210 = 1;
                                                                                      uint64_t v215 = 0x100000001;
                                                                                      BOOL v250 = 1;
                                                                                    }
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  uint64_t v215 = 0;
                                                                                  BOOL v250 = 0;
                                                                                  int v220 = 0;
                                                                                  int v222 = 0;
                                                                                  BOOL v249 = 0;
                                                                                  int v225 = 0;
                                                                                  int v230 = 0;
                                                                                  BOOL v248 = 0;
                                                                                  int v229 = 0;
                                                                                  int v231 = 0;
                                                                                  BOOL v246 = 0;
                                                                                  int v233 = 0;
                                                                                  int v235 = 0;
                                                                                  BOOL v244 = 0;
                                                                                  int v236 = 0;
                                                                                  int v239 = 0;
                                                                                  BOOL v243 = 0;
                                                                                  uint64_t v240 = 0;
                                                                                  int v14 = 0;
                                                                                  int v15 = 0;
                                                                                  int v16 = 0;
                                                                                  char v17 = 0;
                                                                                  int v247 = 1;
                                                                                  int v245 = 1;
                                                                                  v242[2] = 1;
                                                                                  int v13 = 1;
                                                                                  v242[1] = 0x100000001;
                                                                                  v242[0] = 0x100000001;
                                                                                  uint64_t v241 = 0x100000001;
                                                                                  int v237 = 1;
                                                                                  int v238 = 1;
                                                                                  int v232 = 1;
                                                                                  int v234 = 1;
                                                                                  int v228 = 1;
                                                                                  int v227 = 1;
                                                                                  int v224 = 1;
                                                                                  int v226 = 1;
                                                                                  uint64_t v223 = 0x100000001;
                                                                                  int v219 = 1;
                                                                                  int v221 = 1;
                                                                                  uint64_t v218 = 0x100000001;
                                                                                  int v211 = 1;
                                                                                  int v214 = 1;
                                                                                  int v212 = 1;
                                                                                  int v217 = 1;
                                                                                  int v209 = 1;
                                                                                  int v216 = 1;
                                                                                  int v208 = 1;
                                                                                  int v213 = 1;
                                                                                  int v207 = 1;
                                                                                  int v210 = 1;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                uint64_t v215 = 0;
                                                                                BOOL v250 = 0;
                                                                                int v220 = 0;
                                                                                int v222 = 0;
                                                                                BOOL v249 = 0;
                                                                                int v225 = 0;
                                                                                int v230 = 0;
                                                                                BOOL v248 = 0;
                                                                                int v229 = 0;
                                                                                int v231 = 0;
                                                                                BOOL v246 = 0;
                                                                                int v233 = 0;
                                                                                int v235 = 0;
                                                                                BOOL v244 = 0;
                                                                                int v236 = 0;
                                                                                int v239 = 0;
                                                                                BOOL v243 = 0;
                                                                                uint64_t v240 = 0;
                                                                                int v14 = 0;
                                                                                int v15 = 0;
                                                                                int v16 = 0;
                                                                                char v17 = 0;
                                                                                int v247 = 1;
                                                                                int v245 = 1;
                                                                                v242[2] = 1;
                                                                                int v13 = 1;
                                                                                v242[1] = 0x100000001;
                                                                                v242[0] = 0x100000001;
                                                                                uint64_t v241 = 0x100000001;
                                                                                int v237 = 1;
                                                                                int v238 = 1;
                                                                                int v232 = 1;
                                                                                int v234 = 1;
                                                                                int v228 = 1;
                                                                                int v227 = 1;
                                                                                int v224 = 1;
                                                                                int v226 = 1;
                                                                                uint64_t v223 = 0x100000001;
                                                                                int v219 = 1;
                                                                                int v221 = 1;
                                                                                uint64_t v218 = 0x100000001;
                                                                                int v211 = 1;
                                                                                int v214 = 1;
                                                                                int v212 = 1;
                                                                                int v217 = 1;
                                                                                int v209 = 1;
                                                                                int v216 = 1;
                                                                                int v208 = 1;
                                                                                int v213 = 1;
                                                                                int v207 = 1;
                                                                                int v210 = 1;
                                                                                BOOL v251 = 1;
                                                                              }
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            int v207 = 0;
                                                                            int v210 = 0;
                                                                            BOOL v251 = 0;
                                                                            uint64_t v215 = 0;
                                                                            BOOL v250 = 0;
                                                                            int v220 = 0;
                                                                            int v222 = 0;
                                                                            BOOL v249 = 0;
                                                                            int v225 = 0;
                                                                            int v230 = 0;
                                                                            BOOL v248 = 0;
                                                                            int v229 = 0;
                                                                            int v231 = 0;
                                                                            BOOL v246 = 0;
                                                                            int v233 = 0;
                                                                            int v235 = 0;
                                                                            BOOL v244 = 0;
                                                                            int v236 = 0;
                                                                            int v239 = 0;
                                                                            BOOL v243 = 0;
                                                                            uint64_t v240 = 0;
                                                                            int v14 = 0;
                                                                            int v15 = 0;
                                                                            int v16 = 0;
                                                                            char v17 = 0;
                                                                            int v247 = 1;
                                                                            int v245 = 1;
                                                                            v242[2] = 1;
                                                                            int v13 = 1;
                                                                            v242[1] = 0x100000001;
                                                                            v242[0] = 0x100000001;
                                                                            uint64_t v241 = 0x100000001;
                                                                            int v237 = 1;
                                                                            int v238 = 1;
                                                                            int v232 = 1;
                                                                            int v234 = 1;
                                                                            int v228 = 1;
                                                                            int v227 = 1;
                                                                            int v224 = 1;
                                                                            int v226 = 1;
                                                                            uint64_t v223 = 0x100000001;
                                                                            int v219 = 1;
                                                                            int v221 = 1;
                                                                            uint64_t v218 = 0x100000001;
                                                                            int v211 = 1;
                                                                            int v214 = 1;
                                                                            int v212 = 1;
                                                                            int v217 = 1;
                                                                            int v209 = 1;
                                                                            int v216 = 1;
                                                                            int v208 = 1;
                                                                            int v213 = 1;
                                                                            BOOL v252 = 1;
                                                                          }
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v208 = 0;
                                                                        int v213 = 0;
                                                                        BOOL v252 = 0;
                                                                        int v207 = 0;
                                                                        int v210 = 0;
                                                                        BOOL v251 = 0;
                                                                        uint64_t v215 = 0;
                                                                        BOOL v250 = 0;
                                                                        int v220 = 0;
                                                                        int v222 = 0;
                                                                        BOOL v249 = 0;
                                                                        int v225 = 0;
                                                                        int v230 = 0;
                                                                        BOOL v248 = 0;
                                                                        int v229 = 0;
                                                                        int v231 = 0;
                                                                        BOOL v246 = 0;
                                                                        int v233 = 0;
                                                                        int v235 = 0;
                                                                        BOOL v244 = 0;
                                                                        int v236 = 0;
                                                                        int v239 = 0;
                                                                        BOOL v243 = 0;
                                                                        uint64_t v240 = 0;
                                                                        int v14 = 0;
                                                                        int v15 = 0;
                                                                        int v16 = 0;
                                                                        char v17 = 0;
                                                                        int v247 = 1;
                                                                        int v245 = 1;
                                                                        v242[2] = 1;
                                                                        int v13 = 1;
                                                                        v242[1] = 0x100000001;
                                                                        v242[0] = 0x100000001;
                                                                        uint64_t v241 = 0x100000001;
                                                                        int v237 = 1;
                                                                        int v238 = 1;
                                                                        int v232 = 1;
                                                                        int v234 = 1;
                                                                        int v228 = 1;
                                                                        int v227 = 1;
                                                                        int v224 = 1;
                                                                        int v226 = 1;
                                                                        uint64_t v223 = 0x100000001;
                                                                        int v219 = 1;
                                                                        int v221 = 1;
                                                                        uint64_t v218 = 0x100000001;
                                                                        int v211 = 1;
                                                                        int v214 = 1;
                                                                        int v212 = 1;
                                                                        int v217 = 1;
                                                                        int v209 = 1;
                                                                        int v216 = 1;
                                                                        BOOL v253 = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v209 = 0;
                                                                    int v216 = 0;
                                                                    BOOL v253 = 0;
                                                                    int v208 = 0;
                                                                    int v213 = 0;
                                                                    BOOL v252 = 0;
                                                                    int v207 = 0;
                                                                    int v210 = 0;
                                                                    BOOL v251 = 0;
                                                                    uint64_t v215 = 0;
                                                                    BOOL v250 = 0;
                                                                    int v220 = 0;
                                                                    int v222 = 0;
                                                                    BOOL v249 = 0;
                                                                    int v225 = 0;
                                                                    int v230 = 0;
                                                                    BOOL v248 = 0;
                                                                    int v229 = 0;
                                                                    int v231 = 0;
                                                                    BOOL v246 = 0;
                                                                    int v233 = 0;
                                                                    int v235 = 0;
                                                                    BOOL v244 = 0;
                                                                    int v236 = 0;
                                                                    int v239 = 0;
                                                                    BOOL v243 = 0;
                                                                    uint64_t v240 = 0;
                                                                    int v14 = 0;
                                                                    int v15 = 0;
                                                                    int v16 = 0;
                                                                    char v17 = 0;
                                                                    int v247 = 1;
                                                                    int v245 = 1;
                                                                    v242[2] = 1;
                                                                    int v13 = 1;
                                                                    v242[1] = 0x100000001;
                                                                    v242[0] = 0x100000001;
                                                                    uint64_t v241 = 0x100000001;
                                                                    int v237 = 1;
                                                                    int v238 = 1;
                                                                    int v232 = 1;
                                                                    int v234 = 1;
                                                                    int v228 = 1;
                                                                    int v227 = 1;
                                                                    int v224 = 1;
                                                                    int v226 = 1;
                                                                    uint64_t v223 = 0x100000001;
                                                                    int v219 = 1;
                                                                    int v221 = 1;
                                                                    uint64_t v218 = 0x100000001;
                                                                    int v211 = 1;
                                                                    int v214 = 1;
                                                                    int v212 = 1;
                                                                    int v217 = 1;
                                                                    BOOL v254 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v212 = 0;
                                                                int v217 = 0;
                                                                BOOL v254 = 0;
                                                                int v209 = 0;
                                                                int v216 = 0;
                                                                BOOL v253 = 0;
                                                                int v208 = 0;
                                                                int v213 = 0;
                                                                BOOL v252 = 0;
                                                                int v207 = 0;
                                                                int v210 = 0;
                                                                BOOL v251 = 0;
                                                                uint64_t v215 = 0;
                                                                BOOL v250 = 0;
                                                                int v220 = 0;
                                                                int v222 = 0;
                                                                BOOL v249 = 0;
                                                                int v225 = 0;
                                                                int v230 = 0;
                                                                BOOL v248 = 0;
                                                                int v229 = 0;
                                                                int v231 = 0;
                                                                BOOL v246 = 0;
                                                                int v233 = 0;
                                                                int v235 = 0;
                                                                BOOL v244 = 0;
                                                                int v236 = 0;
                                                                int v239 = 0;
                                                                BOOL v243 = 0;
                                                                uint64_t v240 = 0;
                                                                int v14 = 0;
                                                                int v15 = 0;
                                                                int v16 = 0;
                                                                char v17 = 0;
                                                                int v247 = 1;
                                                                int v245 = 1;
                                                                v242[2] = 1;
                                                                int v13 = 1;
                                                                v242[1] = 0x100000001;
                                                                v242[0] = 0x100000001;
                                                                uint64_t v241 = 0x100000001;
                                                                int v237 = 1;
                                                                int v238 = 1;
                                                                int v232 = 1;
                                                                int v234 = 1;
                                                                int v228 = 1;
                                                                int v227 = 1;
                                                                int v224 = 1;
                                                                int v226 = 1;
                                                                uint64_t v223 = 0x100000001;
                                                                int v219 = 1;
                                                                int v221 = 1;
                                                                uint64_t v218 = 0x100000001;
                                                                int v211 = 1;
                                                                int v214 = 1;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              int v212 = 0;
                                                              int v217 = 0;
                                                              BOOL v254 = 0;
                                                              int v209 = 0;
                                                              int v216 = 0;
                                                              BOOL v253 = 0;
                                                              int v208 = 0;
                                                              int v213 = 0;
                                                              BOOL v252 = 0;
                                                              int v207 = 0;
                                                              int v210 = 0;
                                                              BOOL v251 = 0;
                                                              uint64_t v215 = 0;
                                                              BOOL v250 = 0;
                                                              int v220 = 0;
                                                              int v222 = 0;
                                                              BOOL v249 = 0;
                                                              int v225 = 0;
                                                              int v230 = 0;
                                                              BOOL v248 = 0;
                                                              int v229 = 0;
                                                              int v231 = 0;
                                                              BOOL v246 = 0;
                                                              int v233 = 0;
                                                              int v235 = 0;
                                                              BOOL v244 = 0;
                                                              int v236 = 0;
                                                              int v239 = 0;
                                                              BOOL v243 = 0;
                                                              uint64_t v240 = 0;
                                                              int v14 = 0;
                                                              int v15 = 0;
                                                              int v16 = 0;
                                                              char v17 = 0;
                                                              int v247 = 1;
                                                              int v245 = 1;
                                                              v242[2] = 1;
                                                              int v13 = 1;
                                                              v242[1] = 0x100000001;
                                                              v242[0] = 0x100000001;
                                                              uint64_t v241 = 0x100000001;
                                                              int v237 = 1;
                                                              int v238 = 1;
                                                              int v232 = 1;
                                                              int v234 = 1;
                                                              int v228 = 1;
                                                              int v227 = 1;
                                                              int v224 = 1;
                                                              int v226 = 1;
                                                              uint64_t v223 = 0x100000001;
                                                              int v219 = 1;
                                                              int v221 = 1;
                                                              uint64_t v218 = 0x100000001;
                                                              int v211 = 1;
                                                              int v214 = 1;
                                                              BOOL v255 = 1;
                                                            }
                                                          }
                                                        }
                                                        else
                                                        {
                                                          int v211 = 0;
                                                          int v214 = 0;
                                                          BOOL v255 = 0;
                                                          int v212 = 0;
                                                          int v217 = 0;
                                                          BOOL v254 = 0;
                                                          int v209 = 0;
                                                          int v216 = 0;
                                                          BOOL v253 = 0;
                                                          int v208 = 0;
                                                          int v213 = 0;
                                                          BOOL v252 = 0;
                                                          int v207 = 0;
                                                          int v210 = 0;
                                                          BOOL v251 = 0;
                                                          uint64_t v215 = 0;
                                                          BOOL v250 = 0;
                                                          int v220 = 0;
                                                          int v222 = 0;
                                                          BOOL v249 = 0;
                                                          int v225 = 0;
                                                          int v230 = 0;
                                                          BOOL v248 = 0;
                                                          int v229 = 0;
                                                          int v231 = 0;
                                                          BOOL v246 = 0;
                                                          int v233 = 0;
                                                          int v235 = 0;
                                                          BOOL v244 = 0;
                                                          int v236 = 0;
                                                          int v239 = 0;
                                                          BOOL v243 = 0;
                                                          uint64_t v240 = 0;
                                                          int v14 = 0;
                                                          int v15 = 0;
                                                          int v16 = 0;
                                                          char v17 = 0;
                                                          int v247 = 1;
                                                          int v245 = 1;
                                                          v242[2] = 1;
                                                          int v13 = 1;
                                                          v242[1] = 0x100000001;
                                                          v242[0] = 0x100000001;
                                                          uint64_t v241 = 0x100000001;
                                                          int v237 = 1;
                                                          int v238 = 1;
                                                          int v232 = 1;
                                                          int v234 = 1;
                                                          int v228 = 1;
                                                          int v227 = 1;
                                                          int v224 = 1;
                                                          int v226 = 1;
                                                          uint64_t v223 = 0x100000001;
                                                          int v219 = 1;
                                                          int v221 = 1;
                                                          uint64_t v218 = 0x100000001;
                                                          BOOL v256 = 1;
                                                        }
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v218 = 0;
                                                      BOOL v256 = 0;
                                                      int v211 = 0;
                                                      int v214 = 0;
                                                      BOOL v255 = 0;
                                                      int v212 = 0;
                                                      int v217 = 0;
                                                      BOOL v254 = 0;
                                                      int v209 = 0;
                                                      int v216 = 0;
                                                      BOOL v253 = 0;
                                                      int v208 = 0;
                                                      int v213 = 0;
                                                      BOOL v252 = 0;
                                                      int v207 = 0;
                                                      int v210 = 0;
                                                      BOOL v251 = 0;
                                                      uint64_t v215 = 0;
                                                      BOOL v250 = 0;
                                                      int v220 = 0;
                                                      int v222 = 0;
                                                      BOOL v249 = 0;
                                                      int v225 = 0;
                                                      int v230 = 0;
                                                      BOOL v248 = 0;
                                                      int v229 = 0;
                                                      int v231 = 0;
                                                      BOOL v246 = 0;
                                                      int v233 = 0;
                                                      int v235 = 0;
                                                      BOOL v244 = 0;
                                                      int v236 = 0;
                                                      int v239 = 0;
                                                      BOOL v243 = 0;
                                                      uint64_t v240 = 0;
                                                      int v14 = 0;
                                                      int v15 = 0;
                                                      int v16 = 0;
                                                      char v17 = 0;
                                                      int v247 = 1;
                                                      int v245 = 1;
                                                      v242[2] = 1;
                                                      int v13 = 1;
                                                      v242[1] = 0x100000001;
                                                      v242[0] = 0x100000001;
                                                      uint64_t v241 = 0x100000001;
                                                      int v237 = 1;
                                                      int v238 = 1;
                                                      int v232 = 1;
                                                      int v234 = 1;
                                                      int v228 = 1;
                                                      int v227 = 1;
                                                      int v224 = 1;
                                                      int v226 = 1;
                                                      uint64_t v223 = 0x100000001;
                                                      int v219 = 1;
                                                      int v221 = 1;
                                                      BOOL v257 = 1;
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  int v219 = 0;
                                                  int v221 = 0;
                                                  BOOL v257 = 0;
                                                  uint64_t v218 = 0;
                                                  BOOL v256 = 0;
                                                  int v211 = 0;
                                                  int v214 = 0;
                                                  BOOL v255 = 0;
                                                  int v212 = 0;
                                                  int v217 = 0;
                                                  BOOL v254 = 0;
                                                  int v209 = 0;
                                                  int v216 = 0;
                                                  BOOL v253 = 0;
                                                  int v208 = 0;
                                                  int v213 = 0;
                                                  BOOL v252 = 0;
                                                  int v207 = 0;
                                                  int v210 = 0;
                                                  BOOL v251 = 0;
                                                  uint64_t v215 = 0;
                                                  BOOL v250 = 0;
                                                  int v220 = 0;
                                                  int v222 = 0;
                                                  BOOL v249 = 0;
                                                  int v225 = 0;
                                                  int v230 = 0;
                                                  BOOL v248 = 0;
                                                  int v229 = 0;
                                                  int v231 = 0;
                                                  BOOL v246 = 0;
                                                  int v233 = 0;
                                                  int v235 = 0;
                                                  BOOL v244 = 0;
                                                  int v236 = 0;
                                                  int v239 = 0;
                                                  BOOL v243 = 0;
                                                  uint64_t v240 = 0;
                                                  int v14 = 0;
                                                  int v15 = 0;
                                                  int v16 = 0;
                                                  char v17 = 0;
                                                  int v247 = 1;
                                                  int v245 = 1;
                                                  v242[2] = 1;
                                                  int v13 = 1;
                                                  v242[1] = 0x100000001;
                                                  v242[0] = 0x100000001;
                                                  uint64_t v241 = 0x100000001;
                                                  int v237 = 1;
                                                  int v238 = 1;
                                                  int v232 = 1;
                                                  int v234 = 1;
                                                  int v228 = 1;
                                                  int v227 = 1;
                                                  int v224 = 1;
                                                  int v226 = 1;
                                                  uint64_t v223 = 0x100000001;
                                                  BOOL v263 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v223 = 0;
                                              BOOL v263 = 0;
                                              int v219 = 0;
                                              int v221 = 0;
                                              BOOL v257 = 0;
                                              uint64_t v218 = 0;
                                              BOOL v256 = 0;
                                              int v211 = 0;
                                              int v214 = 0;
                                              BOOL v255 = 0;
                                              int v212 = 0;
                                              int v217 = 0;
                                              BOOL v254 = 0;
                                              int v209 = 0;
                                              int v216 = 0;
                                              BOOL v253 = 0;
                                              int v208 = 0;
                                              int v213 = 0;
                                              BOOL v252 = 0;
                                              int v207 = 0;
                                              int v210 = 0;
                                              BOOL v251 = 0;
                                              uint64_t v215 = 0;
                                              BOOL v250 = 0;
                                              int v220 = 0;
                                              int v222 = 0;
                                              BOOL v249 = 0;
                                              int v225 = 0;
                                              int v230 = 0;
                                              BOOL v248 = 0;
                                              int v229 = 0;
                                              int v231 = 0;
                                              BOOL v246 = 0;
                                              int v233 = 0;
                                              int v235 = 0;
                                              BOOL v244 = 0;
                                              int v236 = 0;
                                              int v239 = 0;
                                              BOOL v243 = 0;
                                              uint64_t v240 = 0;
                                              int v14 = 0;
                                              int v15 = 0;
                                              int v16 = 0;
                                              char v17 = 0;
                                              int v247 = 1;
                                              int v245 = 1;
                                              v242[2] = 1;
                                              int v13 = 1;
                                              v242[1] = 0x100000001;
                                              v242[0] = 0x100000001;
                                              uint64_t v241 = 0x100000001;
                                              int v237 = 1;
                                              int v238 = 1;
                                              int v232 = 1;
                                              int v234 = 1;
                                              int v228 = 1;
                                              int v227 = 1;
                                              int v224 = 1;
                                              int v226 = 1;
                                              BOOL v264 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          int v224 = 0;
                                          int v226 = 0;
                                          BOOL v264 = 0;
                                          uint64_t v223 = 0;
                                          BOOL v263 = 0;
                                          int v219 = 0;
                                          int v221 = 0;
                                          BOOL v257 = 0;
                                          uint64_t v218 = 0;
                                          BOOL v256 = 0;
                                          int v211 = 0;
                                          int v214 = 0;
                                          BOOL v255 = 0;
                                          int v212 = 0;
                                          int v217 = 0;
                                          BOOL v254 = 0;
                                          int v209 = 0;
                                          int v216 = 0;
                                          BOOL v253 = 0;
                                          int v208 = 0;
                                          int v213 = 0;
                                          BOOL v252 = 0;
                                          int v207 = 0;
                                          int v210 = 0;
                                          BOOL v251 = 0;
                                          uint64_t v215 = 0;
                                          BOOL v250 = 0;
                                          int v220 = 0;
                                          int v222 = 0;
                                          BOOL v249 = 0;
                                          int v225 = 0;
                                          int v230 = 0;
                                          BOOL v248 = 0;
                                          int v229 = 0;
                                          int v231 = 0;
                                          BOOL v246 = 0;
                                          int v233 = 0;
                                          int v235 = 0;
                                          BOOL v244 = 0;
                                          int v236 = 0;
                                          int v239 = 0;
                                          BOOL v243 = 0;
                                          uint64_t v240 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          int v16 = 0;
                                          char v17 = 0;
                                          int v247 = 1;
                                          int v245 = 1;
                                          v242[2] = 1;
                                          int v13 = 1;
                                          v242[1] = 0x100000001;
                                          v242[0] = 0x100000001;
                                          uint64_t v241 = 0x100000001;
                                          int v237 = 1;
                                          int v238 = 1;
                                          int v232 = 1;
                                          int v234 = 1;
                                          int v228 = 1;
                                          int v227 = 1;
                                        }
                                      }
                                      else
                                      {
                                        int v224 = 0;
                                        int v226 = 0;
                                        BOOL v264 = 0;
                                        uint64_t v223 = 0;
                                        BOOL v263 = 0;
                                        int v219 = 0;
                                        int v221 = 0;
                                        BOOL v257 = 0;
                                        uint64_t v218 = 0;
                                        BOOL v256 = 0;
                                        int v211 = 0;
                                        int v214 = 0;
                                        BOOL v255 = 0;
                                        int v212 = 0;
                                        int v217 = 0;
                                        BOOL v254 = 0;
                                        int v209 = 0;
                                        int v216 = 0;
                                        BOOL v253 = 0;
                                        int v208 = 0;
                                        int v213 = 0;
                                        BOOL v252 = 0;
                                        int v207 = 0;
                                        int v210 = 0;
                                        BOOL v251 = 0;
                                        uint64_t v215 = 0;
                                        BOOL v250 = 0;
                                        int v220 = 0;
                                        int v222 = 0;
                                        BOOL v249 = 0;
                                        int v225 = 0;
                                        int v230 = 0;
                                        BOOL v248 = 0;
                                        int v229 = 0;
                                        int v231 = 0;
                                        BOOL v246 = 0;
                                        int v233 = 0;
                                        int v235 = 0;
                                        BOOL v244 = 0;
                                        int v236 = 0;
                                        int v239 = 0;
                                        BOOL v243 = 0;
                                        uint64_t v240 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        int v16 = 0;
                                        char v17 = 0;
                                        int v247 = 1;
                                        int v245 = 1;
                                        v242[2] = 1;
                                        int v13 = 1;
                                        v242[1] = 0x100000001;
                                        v242[0] = 0x100000001;
                                        uint64_t v241 = 0x100000001;
                                        int v237 = 1;
                                        int v238 = 1;
                                        int v232 = 1;
                                        int v234 = 1;
                                        int v228 = 1;
                                        int v227 = 1;
                                        BOOL v265 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    int v228 = 0;
                                    int v227 = 0;
                                    BOOL v265 = 0;
                                    int v224 = 0;
                                    int v226 = 0;
                                    BOOL v264 = 0;
                                    uint64_t v223 = 0;
                                    BOOL v263 = 0;
                                    int v219 = 0;
                                    int v221 = 0;
                                    BOOL v257 = 0;
                                    uint64_t v218 = 0;
                                    BOOL v256 = 0;
                                    int v211 = 0;
                                    int v214 = 0;
                                    BOOL v255 = 0;
                                    int v212 = 0;
                                    int v217 = 0;
                                    BOOL v254 = 0;
                                    int v209 = 0;
                                    int v216 = 0;
                                    BOOL v253 = 0;
                                    int v208 = 0;
                                    int v213 = 0;
                                    BOOL v252 = 0;
                                    int v207 = 0;
                                    int v210 = 0;
                                    BOOL v251 = 0;
                                    uint64_t v215 = 0;
                                    BOOL v250 = 0;
                                    int v220 = 0;
                                    int v222 = 0;
                                    BOOL v249 = 0;
                                    int v225 = 0;
                                    int v230 = 0;
                                    BOOL v248 = 0;
                                    int v229 = 0;
                                    int v231 = 0;
                                    BOOL v246 = 0;
                                    int v233 = 0;
                                    int v235 = 0;
                                    BOOL v244 = 0;
                                    int v236 = 0;
                                    int v239 = 0;
                                    BOOL v243 = 0;
                                    uint64_t v240 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    int v16 = 0;
                                    char v17 = 0;
                                    int v247 = 1;
                                    int v245 = 1;
                                    v242[2] = 1;
                                    int v13 = 1;
                                    v242[1] = 0x100000001;
                                    v242[0] = 0x100000001;
                                    uint64_t v241 = 0x100000001;
                                    int v237 = 1;
                                    int v238 = 1;
                                    int v232 = 1;
                                    int v234 = 1;
                                    BOOL v266 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v232 = 0;
                                int v234 = 0;
                                BOOL v266 = 0;
                                int v228 = 0;
                                int v227 = 0;
                                BOOL v265 = 0;
                                int v224 = 0;
                                int v226 = 0;
                                BOOL v264 = 0;
                                uint64_t v223 = 0;
                                BOOL v263 = 0;
                                int v219 = 0;
                                int v221 = 0;
                                BOOL v257 = 0;
                                uint64_t v218 = 0;
                                BOOL v256 = 0;
                                int v211 = 0;
                                int v214 = 0;
                                BOOL v255 = 0;
                                int v212 = 0;
                                int v217 = 0;
                                BOOL v254 = 0;
                                int v209 = 0;
                                int v216 = 0;
                                BOOL v253 = 0;
                                int v208 = 0;
                                int v213 = 0;
                                BOOL v252 = 0;
                                int v207 = 0;
                                int v210 = 0;
                                BOOL v251 = 0;
                                uint64_t v215 = 0;
                                BOOL v250 = 0;
                                int v220 = 0;
                                int v222 = 0;
                                BOOL v249 = 0;
                                int v225 = 0;
                                int v230 = 0;
                                BOOL v248 = 0;
                                int v229 = 0;
                                int v231 = 0;
                                BOOL v246 = 0;
                                int v233 = 0;
                                int v235 = 0;
                                BOOL v244 = 0;
                                int v236 = 0;
                                int v239 = 0;
                                BOOL v243 = 0;
                                uint64_t v240 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                int v16 = 0;
                                char v17 = 0;
                                int v247 = 1;
                                int v245 = 1;
                                v242[2] = 1;
                                int v13 = 1;
                                v242[1] = 0x100000001;
                                v242[0] = 0x100000001;
                                uint64_t v241 = 0x100000001;
                                int v237 = 1;
                                int v238 = 1;
                                BOOL v267 = 1;
                              }
                            }
                          }
                          else
                          {
                            int v237 = 0;
                            int v238 = 0;
                            BOOL v267 = 0;
                            int v232 = 0;
                            int v234 = 0;
                            BOOL v266 = 0;
                            int v228 = 0;
                            int v227 = 0;
                            BOOL v265 = 0;
                            int v224 = 0;
                            int v226 = 0;
                            BOOL v264 = 0;
                            uint64_t v223 = 0;
                            BOOL v263 = 0;
                            int v219 = 0;
                            int v221 = 0;
                            BOOL v257 = 0;
                            uint64_t v218 = 0;
                            BOOL v256 = 0;
                            int v211 = 0;
                            int v214 = 0;
                            BOOL v255 = 0;
                            int v212 = 0;
                            int v217 = 0;
                            BOOL v254 = 0;
                            int v209 = 0;
                            int v216 = 0;
                            BOOL v253 = 0;
                            int v208 = 0;
                            int v213 = 0;
                            BOOL v252 = 0;
                            int v207 = 0;
                            int v210 = 0;
                            BOOL v251 = 0;
                            uint64_t v215 = 0;
                            BOOL v250 = 0;
                            int v220 = 0;
                            int v222 = 0;
                            BOOL v249 = 0;
                            int v225 = 0;
                            int v230 = 0;
                            BOOL v248 = 0;
                            int v229 = 0;
                            int v231 = 0;
                            BOOL v246 = 0;
                            int v233 = 0;
                            int v235 = 0;
                            BOOL v244 = 0;
                            int v236 = 0;
                            int v239 = 0;
                            BOOL v243 = 0;
                            uint64_t v240 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            char v17 = 0;
                            int v247 = 1;
                            int v245 = 1;
                            v242[2] = 1;
                            int v13 = 1;
                            v242[1] = 0x100000001;
                            v242[0] = 0x100000001;
                            uint64_t v241 = 0x100000001;
                            BOOL v268 = 1;
                          }
                        }
                      }
                      else
                      {
                        uint64_t v241 = 0;
                        BOOL v268 = 0;
                        int v237 = 0;
                        int v238 = 0;
                        BOOL v267 = 0;
                        int v232 = 0;
                        int v234 = 0;
                        BOOL v266 = 0;
                        int v228 = 0;
                        int v227 = 0;
                        BOOL v265 = 0;
                        int v224 = 0;
                        int v226 = 0;
                        BOOL v264 = 0;
                        uint64_t v223 = 0;
                        BOOL v263 = 0;
                        int v219 = 0;
                        int v221 = 0;
                        BOOL v257 = 0;
                        uint64_t v218 = 0;
                        BOOL v256 = 0;
                        int v211 = 0;
                        int v214 = 0;
                        BOOL v255 = 0;
                        int v212 = 0;
                        int v217 = 0;
                        BOOL v254 = 0;
                        int v209 = 0;
                        int v216 = 0;
                        BOOL v253 = 0;
                        int v208 = 0;
                        int v213 = 0;
                        BOOL v252 = 0;
                        int v207 = 0;
                        int v210 = 0;
                        BOOL v251 = 0;
                        uint64_t v215 = 0;
                        BOOL v250 = 0;
                        int v220 = 0;
                        int v222 = 0;
                        BOOL v249 = 0;
                        int v225 = 0;
                        int v230 = 0;
                        BOOL v248 = 0;
                        int v229 = 0;
                        int v231 = 0;
                        BOOL v246 = 0;
                        int v233 = 0;
                        int v235 = 0;
                        BOOL v244 = 0;
                        int v236 = 0;
                        int v239 = 0;
                        BOOL v243 = 0;
                        uint64_t v240 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        char v17 = 0;
                        int v247 = 1;
                        int v245 = 1;
                        v242[2] = 1;
                        int v13 = 1;
                        v242[1] = 0x100000001;
                        v242[0] = 0x100000001;
                        LODWORD(v269) = 1;
                      }
                    }
                  }
                  else
                  {
                    v242[0] = 0;
                    LODWORD(v269) = 0;
                    uint64_t v241 = 0;
                    BOOL v268 = 0;
                    int v237 = 0;
                    int v238 = 0;
                    BOOL v267 = 0;
                    int v232 = 0;
                    int v234 = 0;
                    BOOL v266 = 0;
                    int v228 = 0;
                    int v227 = 0;
                    BOOL v265 = 0;
                    int v224 = 0;
                    int v226 = 0;
                    BOOL v264 = 0;
                    uint64_t v223 = 0;
                    BOOL v263 = 0;
                    int v219 = 0;
                    int v221 = 0;
                    BOOL v257 = 0;
                    uint64_t v218 = 0;
                    BOOL v256 = 0;
                    int v211 = 0;
                    int v214 = 0;
                    BOOL v255 = 0;
                    int v212 = 0;
                    int v217 = 0;
                    BOOL v254 = 0;
                    int v209 = 0;
                    int v216 = 0;
                    BOOL v253 = 0;
                    int v208 = 0;
                    int v213 = 0;
                    BOOL v252 = 0;
                    int v207 = 0;
                    int v210 = 0;
                    BOOL v251 = 0;
                    uint64_t v215 = 0;
                    BOOL v250 = 0;
                    int v220 = 0;
                    int v222 = 0;
                    BOOL v249 = 0;
                    int v225 = 0;
                    int v230 = 0;
                    BOOL v248 = 0;
                    int v229 = 0;
                    int v231 = 0;
                    BOOL v246 = 0;
                    int v233 = 0;
                    int v235 = 0;
                    BOOL v244 = 0;
                    int v236 = 0;
                    int v239 = 0;
                    BOOL v243 = 0;
                    uint64_t v240 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    char v17 = 0;
                    int v247 = 1;
                    int v245 = 1;
                    v242[2] = 1;
                    int v13 = 1;
                    v242[1] = 0x100000001;
                  }
                }
                else
                {
                  v242[0] = 0;
                  *(void *)&long long v269 = 0x100000000;
                  uint64_t v241 = 0;
                  BOOL v268 = 0;
                  int v237 = 0;
                  int v238 = 0;
                  BOOL v267 = 0;
                  int v232 = 0;
                  int v234 = 0;
                  BOOL v266 = 0;
                  int v228 = 0;
                  int v227 = 0;
                  BOOL v265 = 0;
                  int v224 = 0;
                  int v226 = 0;
                  BOOL v264 = 0;
                  uint64_t v223 = 0;
                  BOOL v263 = 0;
                  int v219 = 0;
                  int v221 = 0;
                  BOOL v257 = 0;
                  uint64_t v218 = 0;
                  BOOL v256 = 0;
                  int v211 = 0;
                  int v214 = 0;
                  BOOL v255 = 0;
                  int v212 = 0;
                  int v217 = 0;
                  BOOL v254 = 0;
                  int v209 = 0;
                  int v216 = 0;
                  BOOL v253 = 0;
                  int v208 = 0;
                  int v213 = 0;
                  BOOL v252 = 0;
                  int v207 = 0;
                  int v210 = 0;
                  BOOL v251 = 0;
                  uint64_t v215 = 0;
                  BOOL v250 = 0;
                  int v220 = 0;
                  int v222 = 0;
                  BOOL v249 = 0;
                  int v225 = 0;
                  int v230 = 0;
                  BOOL v248 = 0;
                  int v229 = 0;
                  int v231 = 0;
                  BOOL v246 = 0;
                  int v233 = 0;
                  int v235 = 0;
                  BOOL v244 = 0;
                  int v236 = 0;
                  int v239 = 0;
                  BOOL v243 = 0;
                  uint64_t v240 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  char v17 = 0;
                  int v247 = 1;
                  int v245 = 1;
                  HIDWORD(v242[2]) = 0;
                  int v13 = 1;
                  LODWORD(v242[1]) = 1;
                  *(void *)((char *)&v242[1] + 4) = 0x100000001;
                }
              }
            }
            else
            {
              v242[0] = 0;
              v242[1] = 0;
              *(void *)&long long v269 = 0;
              uint64_t v241 = 0;
              BOOL v268 = 0;
              int v237 = 0;
              int v238 = 0;
              BOOL v267 = 0;
              int v232 = 0;
              int v234 = 0;
              BOOL v266 = 0;
              int v228 = 0;
              int v227 = 0;
              BOOL v265 = 0;
              int v224 = 0;
              int v226 = 0;
              BOOL v264 = 0;
              uint64_t v223 = 0;
              BOOL v263 = 0;
              int v219 = 0;
              int v221 = 0;
              BOOL v257 = 0;
              uint64_t v218 = 0;
              BOOL v256 = 0;
              int v211 = 0;
              int v214 = 0;
              BOOL v255 = 0;
              int v212 = 0;
              int v217 = 0;
              BOOL v254 = 0;
              int v209 = 0;
              int v216 = 0;
              BOOL v253 = 0;
              int v208 = 0;
              int v213 = 0;
              BOOL v252 = 0;
              int v207 = 0;
              int v210 = 0;
              BOOL v251 = 0;
              uint64_t v215 = 0;
              BOOL v250 = 0;
              int v220 = 0;
              int v222 = 0;
              BOOL v249 = 0;
              int v225 = 0;
              int v230 = 0;
              BOOL v248 = 0;
              int v229 = 0;
              int v231 = 0;
              BOOL v246 = 0;
              int v233 = 0;
              int v235 = 0;
              BOOL v244 = 0;
              int v236 = 0;
              int v239 = 0;
              BOOL v243 = 0;
              uint64_t v240 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              char v17 = 0;
              int v247 = 1;
              int v245 = 1;
              v242[2] = 1;
              int v13 = 1;
            }
            goto LABEL_16;
          }
          int v13 = 0;
          *(void *)((char *)&v269 + 4) = 0;
          v242[0] = 0;
          v242[1] = 0;
          LODWORD(v269) = 0;
          uint64_t v241 = 0;
          BOOL v268 = 0;
          int v237 = 0;
          int v238 = 0;
          BOOL v267 = 0;
          int v232 = 0;
          int v234 = 0;
          BOOL v266 = 0;
          int v228 = 0;
          int v227 = 0;
          BOOL v265 = 0;
          int v224 = 0;
          int v226 = 0;
          BOOL v264 = 0;
          uint64_t v223 = 0;
          BOOL v263 = 0;
          int v219 = 0;
          int v221 = 0;
          BOOL v257 = 0;
          uint64_t v218 = 0;
          BOOL v256 = 0;
          int v211 = 0;
          int v214 = 0;
          BOOL v255 = 0;
          int v212 = 0;
          int v217 = 0;
          BOOL v254 = 0;
          int v209 = 0;
          int v216 = 0;
          BOOL v253 = 0;
          int v208 = 0;
          int v213 = 0;
          BOOL v252 = 0;
          int v207 = 0;
          int v210 = 0;
          BOOL v251 = 0;
          uint64_t v215 = 0;
          BOOL v250 = 0;
          int v220 = 0;
          int v222 = 0;
          BOOL v249 = 0;
          int v225 = 0;
          int v230 = 0;
          BOOL v248 = 0;
          int v229 = 0;
          int v231 = 0;
          BOOL v246 = 0;
          int v233 = 0;
          int v235 = 0;
          BOOL v244 = 0;
          int v236 = 0;
          int v239 = 0;
          BOOL v243 = 0;
          uint64_t v240 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          int v247 = 1;
          int v245 = 1;
          v242[2] = 1;
        }
        else
        {
          int v13 = 0;
          *(void *)((char *)&v269 + 4) = 0;
          memset(v242, 0, sizeof(v242));
          LODWORD(v269) = 0;
          uint64_t v241 = 0;
          BOOL v268 = 0;
          int v237 = 0;
          int v238 = 0;
          BOOL v267 = 0;
          int v232 = 0;
          int v234 = 0;
          BOOL v266 = 0;
          int v228 = 0;
          int v227 = 0;
          BOOL v265 = 0;
          int v224 = 0;
          int v226 = 0;
          BOOL v264 = 0;
          uint64_t v223 = 0;
          BOOL v263 = 0;
          int v219 = 0;
          int v221 = 0;
          BOOL v257 = 0;
          uint64_t v218 = 0;
          BOOL v256 = 0;
          int v211 = 0;
          int v214 = 0;
          BOOL v255 = 0;
          int v212 = 0;
          int v217 = 0;
          BOOL v254 = 0;
          int v209 = 0;
          int v216 = 0;
          BOOL v253 = 0;
          int v208 = 0;
          int v213 = 0;
          BOOL v252 = 0;
          int v207 = 0;
          int v210 = 0;
          BOOL v251 = 0;
          uint64_t v215 = 0;
          BOOL v250 = 0;
          int v220 = 0;
          int v222 = 0;
          BOOL v249 = 0;
          int v225 = 0;
          int v230 = 0;
          BOOL v248 = 0;
          int v229 = 0;
          int v231 = 0;
          BOOL v246 = 0;
          int v233 = 0;
          int v235 = 0;
          BOOL v244 = 0;
          int v236 = 0;
          int v239 = 0;
          BOOL v243 = 0;
          uint64_t v240 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          int v247 = 1;
          int v245 = 1;
          HIDWORD(v269) = 1;
        }
      }
    }
    else
    {
      int v247 = 0;
      int v245 = 0;
      long long v269 = 0uLL;
      int v13 = 0;
      memset(v242, 0, sizeof(v242));
      uint64_t v241 = 0;
      BOOL v268 = 0;
      int v237 = 0;
      int v238 = 0;
      BOOL v267 = 0;
      int v232 = 0;
      int v234 = 0;
      BOOL v266 = 0;
      int v228 = 0;
      int v227 = 0;
      BOOL v265 = 0;
      int v224 = 0;
      int v226 = 0;
      BOOL v264 = 0;
      uint64_t v223 = 0;
      BOOL v263 = 0;
      int v219 = 0;
      int v221 = 0;
      BOOL v257 = 0;
      uint64_t v218 = 0;
      BOOL v256 = 0;
      int v211 = 0;
      int v214 = 0;
      BOOL v255 = 0;
      int v212 = 0;
      int v217 = 0;
      BOOL v254 = 0;
      int v209 = 0;
      int v216 = 0;
      BOOL v253 = 0;
      int v208 = 0;
      int v213 = 0;
      BOOL v252 = 0;
      int v207 = 0;
      int v210 = 0;
      BOOL v251 = 0;
      uint64_t v215 = 0;
      BOOL v250 = 0;
      int v220 = 0;
      int v222 = 0;
      BOOL v249 = 0;
      int v225 = 0;
      int v230 = 0;
      BOOL v248 = 0;
      int v229 = 0;
      int v231 = 0;
      BOOL v246 = 0;
      int v233 = 0;
      int v235 = 0;
      BOOL v244 = 0;
      int v236 = 0;
      int v239 = 0;
      BOOL v243 = 0;
      uint64_t v240 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      int v258 = 1;
    }
  }
LABEL_16:
  if (v16)
  {
    int v19 = v13;
    int v20 = v15;

    int v15 = v20;
    int v13 = v19;
  }
  if (v15) {

  }
  if (v14)
  {
  }
  if (HIDWORD(v242[2]))
  {
  }
  if (HIDWORD(v240)) {

  }
  if (v240)
  {
  }
  if (v243)
  {
  }
  if (v239) {

  }
  if (v236)
  {
  }
  if (v244)
  {
  }
  if (v235) {

  }
  if (v233)
  {
  }
  if (v246)
  {
  }
  if (v231) {

  }
  if (v229)
  {
  }
  if (v248)
  {
  }
  if (v230) {

  }
  if (v225)
  {
  }
  if (v249)
  {
  }
  if (v222) {

  }
  if (v220)
  {
  }
  if (v250)
  {
  }
  if (HIDWORD(v215)) {

  }
  if (v215)
  {
  }
  if (v251)
  {
  }
  if (v210) {

  }
  if (v207)
  {
  }
  if (v252)
  {
  }
  if (v213) {

  }
  if (v208)
  {
  }
  if (v253)
  {
  }
  if (v216) {

  }
  if (v209)
  {
  }
  if (v254)
  {
  }
  if (v217) {

  }
  if (v212)
  {
  }
  if (v255)
  {
  }
  if (v214) {

  }
  if (v211)
  {
  }
  if (v256)
  {
  }
  if (HIDWORD(v218)) {

  }
  if (v218)
  {
  }
  if (v257)
  {
  }
  if (v221) {

  }
  if (v219)
  {
  }
  if (v263)
  {
  }
  if (HIDWORD(v223)) {

  }
  if (v223)
  {
  }
  if (v264)
  {
  }
  if (v226) {

  }
  if (v224)
  {
  }
  if (v265)
  {
  }
  if (v227) {

  }
  if (v228)
  {
  }
  if (v266)
  {
  }
  if (v234) {

  }
  if (v232)
  {
  }
  if (v267)
  {
  }
  if (v238) {

  }
  if (v237)
  {
  }
  if (v268)
  {
  }
  if (HIDWORD(v241)) {

  }
  if (v241)
  {
  }
  if (v269)
  {
  }
  if (HIDWORD(v242[0])) {

  }
  if (LODWORD(v242[0]))
  {
  }
  if (DWORD1(v269))
  {
  }
  if (LODWORD(v242[1])) {

  }
  if (HIDWORD(v242[1]))
  {
  }
  if (DWORD2(v269))
  {
  }
  if (v13) {

  }
  if (LODWORD(v242[2]))
  {
  }
  if (HIDWORD(v269))
  {
  }
  if (v245) {

  }
  if (v247)
  {
  }
  if (v258)
  {
  }
  if (v260 != v259) {

  }
LABEL_171:
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v58.receiver = self;
  v58.super_class = (Class)SFRichTitleCardSection;
  id v4 = [(SFTitleCardSection *)&v58 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  uint64_t v11 = [(SFTitleCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFTitleCardSection *)self title];
  int v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  char v17 = [(SFTitleCardSection *)self subtitle];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  int v19 = [(SFRichTitleCardSection *)self contentAdvisory];
  int v20 = (void *)[v19 copy];
  [v4 setContentAdvisory:v20];

  uint64_t v21 = [(SFRichTitleCardSection *)self titleImage];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setTitleImage:v22];

  objc_msgSend(v4, "setIsCentered:", -[SFTitleCardSection isCentered](self, "isCentered"));
  uint64_t v23 = [(SFRichTitleCardSection *)self descriptionText];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setDescriptionText:v24];

  uint64_t v25 = [(SFRichTitleCardSection *)self rating];
  BOOL v26 = (void *)[v25 copy];
  [v4 setRating:v26];

  BOOL v27 = [(SFRichTitleCardSection *)self ratingText];
  BOOL v28 = (void *)[v27 copy];
  [v4 setRatingText:v28];

  uint64_t v29 = [(SFRichTitleCardSection *)self reviewGlyph];
  int v30 = (void *)[v29 copy];
  [v4 setReviewGlyph:v30];

  uint64_t v31 = [(SFRichTitleCardSection *)self reviewText];
  v32 = (void *)[v31 copy];
  [v4 setReviewText:v32];

  objc_msgSend(v4, "setReviewNewLine:", -[SFRichTitleCardSection reviewNewLine](self, "reviewNewLine"));
  uint64_t v33 = [(SFRichTitleCardSection *)self moreGlyphs];
  uint64_t v34 = (void *)[v33 copy];
  [v4 setMoreGlyphs:v34];

  uint64_t v35 = [(SFRichTitleCardSection *)self auxiliaryTopText];
  float v36 = (void *)[v35 copy];
  [v4 setAuxiliaryTopText:v36];

  uint64_t v37 = [(SFRichTitleCardSection *)self auxiliaryMiddleText];
  v38 = (void *)[v37 copy];
  [v4 setAuxiliaryMiddleText:v38];

  uint64_t v39 = [(SFRichTitleCardSection *)self auxiliaryBottomText];
  uint64_t v40 = (void *)[v39 copy];
  [v4 setAuxiliaryBottomText:v40];

  objc_msgSend(v4, "setAuxiliaryBottomTextColor:", -[SFRichTitleCardSection auxiliaryBottomTextColor](self, "auxiliaryBottomTextColor"));
  BOOL v41 = [(SFRichTitleCardSection *)self auxiliaryAlignment];
  uint64_t v42 = (void *)[v41 copy];
  [v4 setAuxiliaryAlignment:v42];

  objc_msgSend(v4, "setHideVerticalDivider:", -[SFRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider"));
  objc_msgSend(v4, "setTitleAlign:", -[SFRichTitleCardSection titleAlign](self, "titleAlign"));
  v43 = [(SFRichTitleCardSection *)self titleWeight];
  uint64_t v44 = (void *)[v43 copy];
  [v4 setTitleWeight:v44];

  objc_msgSend(v4, "setTitleNoWrap:", -[SFRichTitleCardSection titleNoWrap](self, "titleNoWrap"));
  objc_msgSend(v4, "setThumbnailCropCircle:", -[SFRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle"));
  v45 = [(SFRichTitleCardSection *)self imageOverlay];
  uint64_t v46 = (void *)[v45 copy];
  [v4 setImageOverlay:v46];

  uint64_t v47 = [(SFRichTitleCardSection *)self playAction];
  uint64_t v48 = (void *)[v47 copy];
  [v4 setPlayAction:v48];

  objc_msgSend(v4, "setPlayActionAlign:", -[SFRichTitleCardSection playActionAlign](self, "playActionAlign"));
  unint64_t v49 = [(SFRichTitleCardSection *)self offers];
  uint64_t v50 = (void *)[v49 copy];
  [v4 setOffers:v50];

  uint64_t v51 = [(SFRichTitleCardSection *)self footnote];
  BOOL v52 = (void *)[v51 copy];
  [v4 setFootnote:v52];

  uint64_t v53 = [(SFRichTitleCardSection *)self richSubtitle];
  v54 = (void *)[v53 copy];
  [v4 setRichSubtitle:v54];

  objc_msgSend(v4, "setSubtitleIsEmphasized:", -[SFRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized"));
  uint64_t v55 = [(SFRichTitleCardSection *)self buttonItems];
  v56 = (void *)[v55 copy];
  [v4 setButtonItems:v56];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRichTitleCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRichTitleCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRichTitleCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRichTitleCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRichTitleCardSection;
  [(SFTitleCardSection *)&v3 encodeWithCoder:a3];
}

- (SFRichTitleCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  unint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    uint64_t v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFTitleCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 title];
    [(SFTitleCardSection *)v5 setTitle:v14];

    int v15 = [(SFCardSection *)v8 subtitle];
    [(SFTitleCardSection *)v5 setSubtitle:v15];

    int v16 = [(SFCardSection *)v8 contentAdvisory];
    [(SFRichTitleCardSection *)v5 setContentAdvisory:v16];

    char v17 = [(SFCardSection *)v8 titleImage];
    [(SFRichTitleCardSection *)v5 setTitleImage:v17];

    [(SFTitleCardSection *)v5 setIsCentered:[(SFCardSection *)v8 isCentered]];
    uint64_t v18 = [(SFCardSection *)v8 descriptionText];
    [(SFRichTitleCardSection *)v5 setDescriptionText:v18];

    int v19 = [(SFCardSection *)v8 rating];
    [(SFRichTitleCardSection *)v5 setRating:v19];

    int v20 = [(SFCardSection *)v8 ratingText];
    [(SFRichTitleCardSection *)v5 setRatingText:v20];

    uint64_t v21 = [(SFCardSection *)v8 reviewGlyph];
    [(SFRichTitleCardSection *)v5 setReviewGlyph:v21];

    uint64_t v22 = [(SFCardSection *)v8 reviewText];
    [(SFRichTitleCardSection *)v5 setReviewText:v22];

    [(SFRichTitleCardSection *)v5 setReviewNewLine:[(SFCardSection *)v8 reviewNewLine]];
    uint64_t v23 = [(SFCardSection *)v8 moreGlyphs];
    [(SFRichTitleCardSection *)v5 setMoreGlyphs:v23];

    uint64_t v24 = [(SFCardSection *)v8 auxiliaryTopText];
    [(SFRichTitleCardSection *)v5 setAuxiliaryTopText:v24];

    uint64_t v25 = [(SFCardSection *)v8 auxiliaryMiddleText];
    [(SFRichTitleCardSection *)v5 setAuxiliaryMiddleText:v25];

    BOOL v26 = [(SFCardSection *)v8 auxiliaryBottomText];
    [(SFRichTitleCardSection *)v5 setAuxiliaryBottomText:v26];

    [(SFRichTitleCardSection *)v5 setAuxiliaryBottomTextColor:[(SFCardSection *)v8 auxiliaryBottomTextColor]];
    BOOL v27 = [(SFCardSection *)v8 auxiliaryAlignment];
    [(SFRichTitleCardSection *)v5 setAuxiliaryAlignment:v27];

    [(SFRichTitleCardSection *)v5 setHideVerticalDivider:[(SFCardSection *)v8 hideVerticalDivider]];
    [(SFRichTitleCardSection *)v5 setTitleAlign:[(SFCardSection *)v8 titleAlign]];
    BOOL v28 = [(SFCardSection *)v8 titleWeight];
    [(SFRichTitleCardSection *)v5 setTitleWeight:v28];

    [(SFRichTitleCardSection *)v5 setTitleNoWrap:[(SFCardSection *)v8 titleNoWrap]];
    [(SFRichTitleCardSection *)v5 setThumbnailCropCircle:[(SFCardSection *)v8 thumbnailCropCircle]];
    uint64_t v29 = [(SFCardSection *)v8 imageOverlay];
    [(SFRichTitleCardSection *)v5 setImageOverlay:v29];

    int v30 = [(SFCardSection *)v8 playAction];
    [(SFRichTitleCardSection *)v5 setPlayAction:v30];

    [(SFRichTitleCardSection *)v5 setPlayActionAlign:[(SFCardSection *)v8 playActionAlign]];
    uint64_t v31 = [(SFCardSection *)v8 offers];
    [(SFRichTitleCardSection *)v5 setOffers:v31];

    v32 = [(SFCardSection *)v8 footnote];
    [(SFRichTitleCardSection *)v5 setFootnote:v32];

    uint64_t v33 = [(SFCardSection *)v8 richSubtitle];
    [(SFRichTitleCardSection *)v5 setRichSubtitle:v33];

    [(SFRichTitleCardSection *)v5 setSubtitleIsEmphasized:[(SFCardSection *)v8 subtitleIsEmphasized]];
    uint64_t v34 = [(SFCardSection *)v8 buttonItems];
    [(SFRichTitleCardSection *)v5 setButtonItems:v34];

    uint64_t v35 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v35];

    float v36 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v36];

    uint64_t v37 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v37];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    v38 = [(SFCardSection *)v8 type];
    [(SFTitleCardSection *)v5 setType:v38];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v39 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v39];

    uint64_t v40 = [(SFCardSection *)v8 title];
    [(SFTitleCardSection *)v5 setTitle:v40];

    BOOL v41 = [(SFCardSection *)v8 subtitle];
    [(SFTitleCardSection *)v5 setSubtitle:v41];

    [(SFTitleCardSection *)v5 setIsCentered:[(SFCardSection *)v8 isCentered]];
    uint64_t v42 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v42];

    v43 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v43];

    uint64_t v44 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v44];

    v45 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v45];

    uint64_t v46 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v46];

    uint64_t v47 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v47];

    uint64_t v48 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v48];

    unint64_t v49 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v49];

    uint64_t v50 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v50];

    uint64_t v51 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v51];

    BOOL v52 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v52];

    uint64_t v53 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v53];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v54 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v54];

    uint64_t v55 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v55];

    v56 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v56];

    uint64_t v57 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v57];

    objc_super v58 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v58];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v59 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v59];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v60 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v60];

    int v61 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v61];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v62 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v62];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasSubtitleIsEmphasized
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSubtitleIsEmphasized:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_subtitleIsEmphasized = a3;
}

- (BOOL)hasPlayActionAlign
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPlayActionAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_playActionAlign = a3;
}

- (BOOL)hasThumbnailCropCircle
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setThumbnailCropCircle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_thumbnailCropCircle = a3;
}

- (BOOL)hasTitleNoWrap
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTitleNoWrap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_titleNoWrap = a3;
}

- (BOOL)hasTitleAlign
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTitleAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_titleAlign = a3;
}

- (BOOL)hasHideVerticalDivider
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHideVerticalDivider:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hideVerticalDivider = a3;
}

- (BOOL)hasAuxiliaryBottomTextColor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAuxiliaryBottomTextColor:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_auxiliaryBottomTextColor = a3;
}

- (BOOL)hasReviewNewLine
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReviewNewLine:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reviewNewLine = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end