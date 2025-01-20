@interface SearchUIDetailedRowModel
+ (BOOL)urlIsDraggable:(id)a3;
+ (id)richTextWithFormattedText:(id)a3;
- (BOOL)buttonItemsAreTrailing;
- (BOOL)hasLeadingImage;
- (BOOL)isContact;
- (BOOL)isDraggable;
- (BOOL)isLocalApplicationResult;
- (BOOL)isTappable;
- (BOOL)preventThumbnailImageScaling;
- (BOOL)secondaryTitleIsDetached;
- (BOOL)truncateTitleMiddle;
- (BOOL)useCompactVersionOfUI;
- (Class)cardSectionViewClass;
- (MKSearchFoundationResult)mapsResult;
- (NSArray)buttonItems;
- (NSArray)details;
- (NSString)footnoteButtonText;
- (NSString)nearbyBusinessesString;
- (NSString)pinText;
- (SFActionItem)action;
- (SFButton)leadingButton;
- (SFFormattedText)secondaryTitle;
- (SFImage)fallbackImage;
- (SFImage)leadingImage;
- (SFImage)secondaryTitleImage;
- (SFImage)trailingThumbnail;
- (SFRichText)footnote;
- (SFRichText)title;
- (SFRichText)topText;
- (SFRichText)trailingBottomText;
- (SFRichText)trailingMiddleText;
- (SFRichText)trailingTopText;
- (SearchUIDetailedRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (SearchUIDetailedRowModel)initWithResult:(id)a3 suggestion:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6;
- (id)backgroundColor;
- (id)contactIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionText;
- (id)dragAppBundleID;
- (id)dragSubtitle;
- (id)dragText;
- (id)dragTitle;
- (id)dragURL;
- (id)populatedMapsCardSectionIfApplicable;
- (id)punchouts;
- (id)requestAppClipObjects;
- (id)richTextFromText:(id)a3;
- (int)separatorStyle;
- (void)fillOutPropertiesForCardSection:(id)a3;
- (void)setAction:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setButtonItemsAreTrailing:(BOOL)a3;
- (void)setDetails:(id)a3;
- (void)setFallbackImage:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteButtonText:(id)a3;
- (void)setIsLocalApplicationResult:(BOOL)a3;
- (void)setLeadingButton:(id)a3;
- (void)setLeadingImage:(id)a3;
- (void)setMapsResult:(id)a3;
- (void)setNearbyBusinessesString:(id)a3;
- (void)setPinText:(id)a3;
- (void)setPreventThumbnailImageScaling:(BOOL)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleImage:(id)a3;
- (void)setSecondaryTitleIsDetached:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTopText:(id)a3;
- (void)setTrailingBottomText:(id)a3;
- (void)setTrailingMiddleText:(id)a3;
- (void)setTrailingThumbnail:(id)a3;
- (void)setTrailingTopText:(id)a3;
- (void)setTruncateTitleMiddle:(BOOL)a3;
@end

@implementation SearchUIDetailedRowModel

- (NSArray)details
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SearchUIRowModel *)self identifyingResult];
  v4 = [v3 resultBundleId];
  if (([v4 isEqualToString:*MEMORY[0x1E4FA5DF0]] & 1) == 0)
  {

    goto LABEL_11;
  }
  v5 = [(NSArray *)self->_details firstObject];

  if (!v5)
  {
LABEL_11:
    v6 = self->_details;
    goto LABEL_15;
  }
  v6 = (NSArray *)[(NSArray *)self->_details mutableCopy];
  v7 = [(NSArray *)self->_details firstObject];
  v8 = (void *)[v7 copy];

  v9 = +[SearchUICalendarStore colorForDefaultCalendarForNewEvents];

  if (!v9)
  {
    v26 = (void *)MEMORY[0x1E4F9A0E0];
    v19 = [v8 text];
    v20 = [v26 textWithString:v19];
    v28 = v20;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [v8 setFormattedTextPieces:v22];
    goto LABEL_13;
  }
  v10 = [v8 formattedTextPieces];
  if (![v10 count])
  {
    v11 = [v8 text];
    uint64_t v12 = [v11 length];

    if (!v12) {
      goto LABEL_8;
    }
    v13 = NSString;
    v14 = [v8 text];
    v10 = [v13 stringWithFormat:@" %@", v14];

    [v8 setText:0];
    v15 = [MEMORY[0x1E4F9A0E0] textWithString:v10];
    v30[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v8 setFormattedTextPieces:v16];
  }
LABEL_8:
  v17 = [v8 formattedTextPieces];
  uint64_t v18 = [v17 count];

  if (v18 == 1)
  {
    v19 = objc_opt_new();
    [v19 setSymbolName:@"circle.fill"];
    v20 = +[SearchUIImage imageWithSFImage:v19];
    v21 = +[SearchUICalendarStore colorForDefaultCalendarForNewEvents];
    [v20 setCustomForegroundColor:v21];

    [v20 setSymbolScale:1];
    v22 = objc_opt_new();
    [v22 setGlyph:v20];
    v29 = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v24 = [v8 formattedTextPieces];
    v25 = [v23 arrayByAddingObjectsFromArray:v24];
    [v8 setFormattedTextPieces:v25];

LABEL_13:
  }
  [(NSArray *)v6 replaceObjectAtIndex:0 withObject:v8];

LABEL_15:
  return v6;
}

- (SearchUIDetailedRowModel)initWithResult:(id)a3 suggestion:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SearchUIDetailedRowModel;
  v11 = [(SearchUICardSectionRowModel *)&v21 initWithResult:a3 cardSection:v10 isInline:1 queryId:a5 itemIdentifier:a6];
  if (v11)
  {
    uint64_t v12 = [v10 suggestionText];
    [(SearchUIDetailedRowModel *)v11 setTitle:v12];

    v13 = [v10 detailText];
    if (v13)
    {
      v14 = [v10 detailText];
      v22[0] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [(SearchUIDetailedRowModel *)v11 setDetails:v15];
    }
    else
    {
      [(SearchUIDetailedRowModel *)v11 setDetails:0];
    }

    v16 = [(SearchUIDetailedRowModel *)v11 populatedMapsCardSectionIfApplicable];
    v17 = [v16 thumbnail];
    if (v17)
    {
      [(SearchUIDetailedRowModel *)v11 setLeadingImage:v17];
    }
    else
    {
      uint64_t v18 = [v10 thumbnail];
      [(SearchUIDetailedRowModel *)v11 setLeadingImage:v18];
    }
    [(SearchUIDetailedRowModel *)v11 setTruncateTitleMiddle:v10 != 0];
    if ([v10 suggestionType] == 4)
    {
      v19 = objc_opt_new();
      [v19 setSymbolName:@"arrow.up.forward"];
      [v19 setIsTemplate:1];
      [(SearchUIDetailedRowModel *)v11 setTrailingThumbnail:v19];
    }
  }

  return v11;
}

- (SearchUIDetailedRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  v80.receiver = self;
  v80.super_class = (Class)SearchUIDetailedRowModel;
  v13 = [(SearchUICardSectionRowModel *)&v80 initWithResult:v11 cardSection:v12 isInline:1 queryId:a6 itemIdentifier:a7];
  v14 = v13;
  if (!v13) {
    goto LABEL_32;
  }
  v15 = [(SearchUIRowModel *)v13 applicationBundleIdentifier];
  v16 = [(SearchUIDetailedRowModel *)v14 populatedMapsCardSectionIfApplicable];
  v17 = [(SearchUIRowModel *)v14 cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [(SearchUIRowModel *)v14 cardSection];
    v19 = [v18 mapsData];
    uint64_t v20 = [v19 length];

    if (v20) {
      objc_super v21 = v12;
    }
    else {
      objc_super v21 = 0;
    }
  }
  else
  {

    objc_super v21 = v12;
  }
  if (v16) {
    objc_super v21 = v16;
  }
  id v22 = v21;

  v23 = +[SearchUIImageView thumbnailForRowModel:v14];
  v24 = +[SearchUIUtilities cardSectionsForRenderingResult:v11];
  if (v15)
  {
    v25 = [v11 contactIdentifier];
    if (![v25 length])
    {
      v75 = v16;
      v26 = [v24 firstObject];
      objc_opt_class();
      v77 = v24;
      if (objc_opt_isKindOfClass())
      {
        v27 = [v24 firstObject];
        v28 = [v27 leadingCardSections];
        [v28 firstObject];
        v30 = v29 = v15;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        v15 = v29;
        v24 = v77;

        v16 = v75;
        if (isKindOfClass)
        {
          if (v23) {
            goto LABEL_14;
          }
LABEL_42:
          v23 = [(SearchUIDetailedRowModel *)v14 fallbackImage];
          goto LABEL_14;
        }
      }
      else
      {
      }
      if ([(SearchUIDetailedRowModel *)v14 useCompactVersionOfUI])
      {
        +[SearchUISuggestionImageUtilities maximumSize];
        unint64_t v69 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:");
      }
      else
      {
        unint64_t v69 = 4;
      }
      v25 = [(SearchUIRowModel *)v14 identifyingResult];
      v70 = [v25 applicationBundleIdentifier];
      v71 = v15;
      if (v70)
      {
        v72 = [(SearchUIRowModel *)v14 identifyingResult];
        v73 = +[SearchUIAppIconImage appIconForResult:v72 variant:v69];
        [(SearchUIDetailedRowModel *)v14 setFallbackImage:v73];
      }
      else
      {
        v72 = +[SearchUIAppIconImage appIconForBundleIdentifier:v15 variant:v69];
        [(SearchUIDetailedRowModel *)v14 setFallbackImage:v72];
      }
      v24 = v77;

      v15 = v71;
      v16 = v75;
    }

    if (v23) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_14:
  id v79 = v22;
  if (v22)
  {
    if (v23 && !v16) {
      [v22 setThumbnail:v23];
    }
    [(SearchUIDetailedRowModel *)v14 fillOutPropertiesForCardSection:v22];
  }
  else
  {
    [(SearchUIDetailedRowModel *)v14 setLeadingImage:v23];
    v31 = [v11 action];
    [(SearchUIDetailedRowModel *)v14 setAction:v31];

    -[SearchUIDetailedRowModel setPreventThumbnailImageScaling:](v14, "setPreventThumbnailImageScaling:", [v11 preventThumbnailImageScaling]);
    v32 = [v11 title];
    [(SearchUIDetailedRowModel *)v14 richTextFromText:v32];
    v34 = v33 = v24;
    [(SearchUIDetailedRowModel *)v14 setTitle:v34];

    v35 = [v11 title];
    uint64_t v36 = [v35 maxLines];
    v37 = [(SearchUIDetailedRowModel *)v14 title];
    [v37 setMaxLines:v36];

    v38 = (void *)MEMORY[0x1E4F9A0E0];
    v39 = [v11 secondaryTitle];
    v40 = [v38 textWithString:v39];
    [(SearchUIDetailedRowModel *)v14 setSecondaryTitle:v40];

    -[SearchUIDetailedRowModel setSecondaryTitleIsDetached:](v14, "setSecondaryTitleIsDetached:", [v11 isSecondaryTitleDetached]);
    v41 = [v11 secondaryTitleImage];
    [(SearchUIDetailedRowModel *)v14 setSecondaryTitleImage:v41];

    v42 = [v11 descriptions];
    [(SearchUIDetailedRowModel *)v14 setDetails:v42];

    v43 = (void *)MEMORY[0x1E4F9A378];
    v44 = [v11 footnote];
    v45 = [v43 textWithString:v44];
    [(SearchUIDetailedRowModel *)v14 setFootnote:v45];

    v46 = (void *)MEMORY[0x1E4F9A378];
    v47 = [v11 auxiliaryTopText];
    v48 = [v46 textWithString:v47];
    [(SearchUIDetailedRowModel *)v14 setTrailingTopText:v48];

    v49 = (void *)MEMORY[0x1E4F9A378];
    v50 = [v11 auxiliaryMiddleText];
    v51 = [v49 textWithString:v50];
    [(SearchUIDetailedRowModel *)v14 setTrailingMiddleText:v51];

    v52 = (void *)MEMORY[0x1E4F9A378];
    v53 = [v11 auxiliaryBottomText];
    v54 = [v52 textWithString:v53];
    [(SearchUIDetailedRowModel *)v14 setTrailingBottomText:v54];

    v24 = v33;
  }
  v55 = [v11 nearbyBusinessesString];
  [(SearchUIDetailedRowModel *)v14 setNearbyBusinessesString:v55];

  -[SearchUIDetailedRowModel setIsLocalApplicationResult:](v14, "setIsLocalApplicationResult:", [v11 isLocalApplicationResult]);
  uint64_t v56 = [(SearchUIDetailedRowModel *)v14 leadingImage];
  if (!v56) {
    goto LABEL_28;
  }
  v57 = (void *)v56;
  v58 = v16;
  uint64_t v59 = [(SearchUIDetailedRowModel *)v14 nearbyBusinessesString];
  if (v59)
  {
    v60 = (SearchUIAppClipImage *)v59;
    v76 = v23;
    v78 = v24;
    v61 = v15;
    v62 = [(SearchUIRowModel *)v14 identifyingResult];
    v63 = [v62 identifier];
    if ([v63 hasPrefix:*MEMORY[0x1E4FB30E0]])
    {
      v64 = [(SearchUIDetailedRowModel *)v14 leadingImage];
      objc_opt_class();
      char v65 = objc_opt_isKindOfClass();

      v15 = v61;
      v16 = v58;
      v23 = v76;
      v24 = v78;
      if (v65) {
        goto LABEL_28;
      }
      v66 = [SearchUIAppClipImage alloc];
      v57 = [(SearchUIDetailedRowModel *)v14 leadingImage];
      v60 = [(SearchUIAppClipImage *)v66 initWithSFImage:v57];
      [(SearchUIDetailedRowModel *)v14 setLeadingImage:v60];
    }
    else
    {

      v15 = v61;
      v23 = v76;
      v24 = v78;
    }
  }
  v16 = v58;
LABEL_28:
  if ([(SearchUIDetailedRowModel *)v14 useCompactVersionOfUI])
  {
    v67 = [(SearchUIDetailedRowModel *)v14 title];
    [v67 setMaxLines:1];

    [(SearchUIDetailedRowModel *)v14 setTrailingTopText:0];
    [(SearchUIDetailedRowModel *)v14 setSecondaryTitle:0];
    [(SearchUIDetailedRowModel *)v14 setSecondaryTitleImage:0];
    [(SearchUIDetailedRowModel *)v14 setFootnoteButtonText:0];
    if ([MEMORY[0x1E4FAE198] isMacOS])
    {
      [(SearchUIDetailedRowModel *)v14 setTrailingMiddleText:0];
      [(SearchUIDetailedRowModel *)v14 setTrailingBottomText:0];
      [(SearchUIDetailedRowModel *)v14 setFootnote:0];
    }
  }

  id v12 = v79;
LABEL_32:

  return v14;
}

- (BOOL)useCompactVersionOfUI
{
  v3 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 shouldUseCompactDisplay];
  }
  else {
    int v4 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = [(SearchUIRowModel *)self identifyingResult];
  if ([v6 usesCompactDisplay])
  {
    v7 = [(SearchUIRowModel *)self identifyingResult];
    v8 = [v7 compactCard];
    v9 = [v8 cardSections];
    BOOL v10 = [v9 count] == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  if (v4 | isKindOfClass & 1) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (id)populatedMapsCardSectionIfApplicable
{
  v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = +[SearchUIUtilities cardSectionsForRenderingResult:v3];
  v5 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(SearchUIRowModel *)self cardSection];
    v8 = [v7 mapsData];
    v9 = [v7 pinText];
    [(SearchUIDetailedRowModel *)self setPinText:v9];

    if (v8)
    {
LABEL_3:
      id v10 = objc_alloc(MEMORY[0x1E4F31010]);
      if ([(SearchUIDetailedRowModel *)self useCompactVersionOfUI]) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = 4;
      }
      id v12 = [MEMORY[0x1E4F28B50] mainBundle];
      v13 = [v12 bundleIdentifier];
      v14 = (void *)[v10 initWithMapsData:v8 iconSize:v11 bundleID:v13];
      [(SearchUIDetailedRowModel *)self setMapsResult:v14];

      v15 = [(SearchUIDetailedRowModel *)self mapsResult];
      v16 = [v15 inlineCard];
      v17 = [v16 cardSections];
      uint64_t v18 = [v17 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v18 = [v3 mapsData];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = 0;
      id v20 = 0;
LABEL_13:

      goto LABEL_17;
    }

    if (v4)
    {
      v8 = 0;
    }
    else
    {
      v8 = [v3 mapsData];
      if (v8) {
        goto LABEL_3;
      }
    }
  }
  id v20 = 0;
LABEL_17:
  objc_super v21 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    v23 = [(SearchUIRowModel *)self cardSection];
    [v23 setInternalDetailedRowCardSection:v20];
  }
  v24 = [v4 firstObject];
  v25 = [v24 backgroundColor];
  [v20 setBackgroundColor:v25];

  id v26 = v20;
  return v26;
}

- (id)richTextFromText:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F9A378];
    v6 = [v3 text];
    id v4 = [v5 textWithString:v6];

    objc_msgSend(v4, "setMaxLines:", objc_msgSend(v3, "maxLines"));
  }

  return v4;
}

- (id)backgroundColor
{
  if ([(SearchUIDetailedRowModel *)self useCompactVersionOfUI])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SearchUIDetailedRowModel;
    id v3 = [(SearchUICardSectionRowModel *)&v5 backgroundColor];
  }
  return v3;
}

- (void)fillOutPropertiesForCardSection:(id)a3
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 thumbnail];
  [(SearchUIDetailedRowModel *)self setLeadingImage:v5];

  v6 = [v4 button];
  [(SearchUIDetailedRowModel *)self setLeadingButton:v6];

  -[SearchUIDetailedRowModel setPreventThumbnailImageScaling:](self, "setPreventThumbnailImageScaling:", [v4 preventThumbnailImageScaling]);
  v7 = [v4 topText];
  [(SearchUIDetailedRowModel *)self setTopText:v7];

  v8 = [v4 title];
  [(SearchUIDetailedRowModel *)self setTitle:v8];

  v9 = [v4 secondaryTitle];
  [(SearchUIDetailedRowModel *)self setSecondaryTitle:v9];

  -[SearchUIDetailedRowModel setSecondaryTitleIsDetached:](self, "setSecondaryTitleIsDetached:", [v4 isSecondaryTitleDetached]);
  id v10 = [v4 secondaryTitleImage];
  [(SearchUIDetailedRowModel *)self setSecondaryTitleImage:v10];

  uint64_t v11 = [v4 descriptions];
  [(SearchUIDetailedRowModel *)self setDetails:v11];

  id v12 = [v4 footnote];
  [(SearchUIDetailedRowModel *)self setFootnote:v12];

  v13 = [v4 action];
  [(SearchUIDetailedRowModel *)self setAction:v13];
  v14 = [v4 richTrailingTopText];
  if (v14)
  {
    [(SearchUIDetailedRowModel *)self setTrailingTopText:v14];
  }
  else
  {
    v15 = objc_opt_class();
    v16 = [v4 trailingTopText];
    v17 = [v15 richTextWithFormattedText:v16];
    [(SearchUIDetailedRowModel *)self setTrailingTopText:v17];
  }
  uint64_t v18 = [v4 richTrailingMiddleText];
  if (v18)
  {
    [(SearchUIDetailedRowModel *)self setTrailingMiddleText:v18];
  }
  else
  {
    v19 = objc_opt_class();
    id v20 = [v4 trailingMiddleText];
    objc_super v21 = [v19 richTextWithFormattedText:v20];
    [(SearchUIDetailedRowModel *)self setTrailingMiddleText:v21];
  }
  char v22 = [v4 richTrailingBottomText];
  if (v22)
  {
    [(SearchUIDetailedRowModel *)self setTrailingBottomText:v22];
  }
  else
  {
    v23 = objc_opt_class();
    v24 = [v4 trailingBottomText];
    v25 = [v23 richTextWithFormattedText:v24];
    [(SearchUIDetailedRowModel *)self setTrailingBottomText:v25];
  }
  -[SearchUIDetailedRowModel setButtonItemsAreTrailing:](self, "setButtonItemsAreTrailing:", [v4 buttonItemsAreTrailing]);
  id v26 = [v4 trailingThumbnail];
  [(SearchUIDetailedRowModel *)self setTrailingThumbnail:v26];

  v27 = [v4 buttonItems];
  v28 = v27;
  if (!v27) {
    v27 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v29 = (void *)[v27 mutableCopy];

  if (![v29 count])
  {
    v30 = [v13 contactIdentifier];
    if (v30 || ([v13 phoneNumber], (v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v51 = [v13 email];

      if (!v51) {
        goto LABEL_27;
      }
    }
    v31 = objc_opt_new();
    v32 = [v13 contactIdentifier];
    [v31 setContactIdentifier:v32];

    v33 = [v13 phoneNumber];
    if (v33)
    {
      v34 = [v13 phoneNumber];
      v82[0] = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
      [v31 setPhoneNumbers:v35];
    }
    else
    {
      [v31 setPhoneNumbers:0];
    }

    uint64_t v36 = [v13 email];
    if (v36)
    {
      v37 = [v13 email];
      v81 = v37;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
      [v31 setEmailAddresses:v38];
    }
    else
    {
      [v31 setEmailAddresses:0];
    }

    v39 = objc_opt_new();
    v40 = [v13 phoneNumber];
    uint64_t v41 = [v40 length];

    if (v41) {
      [v39 addObject:&unk_1F404B058];
    }
    v42 = [v13 email];
    uint64_t v43 = [v42 length];

    if (v43) {
      [v39 addObject:&unk_1F404B070];
    }
    v44 = objc_opt_new();
    [v44 setPerson:v31];
    [v44 setActionTypesToShow:v39];
    [v29 addObject:v44];

LABEL_27:
    v45 = [v13 mapsData];
    if (v45 || ([v13 location], (v45 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v52 = [v13 customDirectionsPunchout];

      if (!v52)
      {
LABEL_41:
        uint64_t v56 = [v13 messageURL];

        if (v56)
        {
          v57 = objc_opt_new();
          v58 = (void *)MEMORY[0x1E4F9A2F8];
          uint64_t v59 = [v13 messageURL];
          v60 = [v58 punchoutWithURL:v59];
          [v57 setPunchout:v60];

          v61 = objc_opt_new();
          [v61 setCommand:v57];
          v62 = [[SearchUISymbolImage alloc] initWithSymbolName:@"message"];
          [v61 setImage:v62];

          [v29 addObject:v61];
        }
        if (![(SearchUIDetailedRowModel *)self useCompactVersionOfUI])
        {
          uint64_t v63 = [v13 applicationBundleIdentifier];
          if (v63)
          {
            v64 = (void *)v63;
            char v65 = [v13 isOverlay];

            if ((v65 & 1) == 0)
            {
              v66 = [v13 storeIdentifiers];
              v67 = [v66 firstObject];
              v68 = v67;
              if (v67)
              {
                id v69 = v67;
              }
              else
              {
                v70 = [(SearchUIRowModel *)self identifyingResult];
                id v69 = [v70 storeIdentifier];
              }
              v71 = objc_opt_new();
              [v71 setIdentifier:v69];
              [v29 addObject:v71];
            }
          }
        }
        if (![v29 count])
        {
          v72 = [v13 label];
          uint64_t v73 = [v72 length];

          if (v73)
          {
            v74 = objc_opt_new();
            v75 = [v13 label];
            [v74 setTitle:v75];

            [v29 addObject:v74];
          }
        }
        v76 = [v13 localMediaIdentifier];

        if (v76)
        {
          v77 = objc_opt_new();
          v78 = [v13 localMediaIdentifier];
          [v77 setMediaIdentifier:v78];

          id v79 = objc_opt_new();
          [v79 setMediaMetadata:v77];
          [v29 addObject:v79];
        }
        [(SearchUIDetailedRowModel *)self setButtonItemsAreTrailing:1];
        goto LABEL_56;
      }
    }
    v46 = [v13 customDirectionsPunchout];

    if (v46)
    {
      v47 = objc_opt_new();
      v48 = [v13 customDirectionsPunchout];
      [v47 setPunchout:v48];
    }
    else
    {
      v47 = objc_opt_new();
      v49 = [v13 mapsData];
      [v47 setMapsData:v49];

      v50 = [v13 label];
      if (v50)
      {
        [v47 setName:v50];
      }
      else
      {
        v53 = [(SearchUIDetailedRowModel *)self title];
        v54 = [v53 text];
        [v47 setName:v54];
      }
      objc_msgSend(v47, "setDirectionsMode:", objc_msgSend(v13, "directionsMode"));
      objc_msgSend(v47, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v13, "shouldSearchDirectionsAlongCurrentRoute"));
      v48 = [v13 location];
      [v47 setLocation:v48];
    }

    v55 = objc_opt_new();
    [v55 setCommand:v47];
    [v29 addObject:v55];

    goto LABEL_41;
  }
LABEL_56:
  objc_super v80 = (void *)[v29 copy];
  [(SearchUIDetailedRowModel *)self setButtonItems:v80];
}

+ (id)richTextWithFormattedText:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_opt_new();
    v7[0] = v3;
    objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

    [v4 setFormattedTextPieces:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)contactIdentifiers
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SearchUIRowModel *)self identifyingResult];
  id v4 = [v3 contactIdentifier];

  if (v4)
  {
    objc_super v5 = [(SearchUIRowModel *)self identifyingResult];
    v6 = [v5 contactIdentifier];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
LABEL_7:
    id v12 = v7;

    goto LABEL_8;
  }
  v8 = [(SearchUIDetailedRowModel *)self leadingImage];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v5 = [(SearchUIDetailedRowModel *)self leadingImage];
    uint64_t v10 = [v5 contactIdentifiers];
    v6 = (void *)v10;
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v10) {
      uint64_t v11 = (void *)v10;
    }
    id v7 = v11;
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_8:
  return v12;
}

- (BOOL)isContact
{
  v2 = [(SearchUIRowModel *)self identifyingResult];
  id v3 = [v2 sectionBundleIdentifier];
  id v4 = +[SearchUIUtilities bundleIdentifierForApp:5];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)dragAppBundleID
{
  if ([(SearchUIDetailedRowModel *)self isLocalApplicationResult])
  {
    id v3 = [(SearchUIRowModel *)self applicationBundleIdentifier];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)dragTitle
{
  v2 = [(SearchUIDetailedRowModel *)self title];
  id v3 = +[SearchUIUtilities stringForSFRichText:v2];

  return v3;
}

- (id)dragSubtitle
{
  if ([(SearchUIDetailedRowModel *)self isContact]
    || [(SearchUICardSectionRowModel *)self isQuerySuggestion])
  {
    id v3 = 0;
  }
  else
  {
    char v5 = [(SearchUIDetailedRowModel *)self dragURL];
    id v3 = [v5 host];

    if (!v3)
    {
      id v3 = [(SearchUIDetailedRowModel *)self descriptionText];
    }
  }
  return v3;
}

- (id)descriptionText
{
  v2 = [(SearchUIDetailedRowModel *)self details];
  id v3 = +[SearchUIUtilities stringForSFRichTextArray:v2];

  return v3;
}

- (id)dragText
{
  id v3 = objc_opt_new();
  id v4 = [(SearchUIDetailedRowModel *)self dragTitle];
  if ([v4 length]) {
    [v3 appendString:v4];
  }
  if ([v3 length]) {
    [v3 appendString:@"\n"];
  }
  char v5 = [(SearchUIDetailedRowModel *)self descriptionText];
  if ([v5 length])
  {
    v6 = [(SearchUIDetailedRowModel *)self descriptionText];
    [v3 appendString:v6];
  }
  return v3;
}

+ (BOOL)urlIsDraggable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 isEqualToString:@"http"])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 scheme];
    if ([v6 isEqualToString:@"https"])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = [v3 scheme];
      char v5 = [v7 isEqualToString:@"file"];
    }
  }

  return v5;
}

- (id)dragURL
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(SearchUIDetailedRowModel *)self dragAppBundleID];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    char v5 = [(SearchUIDetailedRowModel *)self punchouts];
    v6 = [v5 firstObject];
    id v7 = [v6 urls];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        if (+[SearchUIDetailedRowModel urlIsDraggable:v12]) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v4 = v12;

      if (v4) {
        goto LABEL_17;
      }
    }
    else
    {
LABEL_11:
    }
    v13 = [(SearchUIRowModel *)self identifyingResult];
    v14 = [v13 url];
    if (+[SearchUIDetailedRowModel urlIsDraggable:v14])
    {
      v15 = [(SearchUIRowModel *)self identifyingResult];
      id v4 = [v15 url];
    }
    else
    {
      id v4 = 0;
    }
  }
LABEL_17:
  v16 = [(SearchUIDetailedRowModel *)self dragTitle];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    uint64_t v18 = [(SearchUIDetailedRowModel *)self dragTitle];
    [v4 _setTitle:v18];
  }
  return v4;
}

- (BOOL)isTappable
{
  id v3 = [(SearchUIRowModel *)self cardSection];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUIDetailedRowModel;
    BOOL v4 = [(SearchUICardSectionRowModel *)&v6 isTappable];
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)isDraggable
{
  uint64_t v3 = [(SearchUIRowModel *)self cardSection];
  if (v3
    && (BOOL v4 = (void *)v3,
        v10.receiver = self,
        v10.super_class = (Class)SearchUIDetailedRowModel,
        unsigned int v5 = [(SearchUICardSectionRowModel *)&v10 isDraggable],
        v4,
        !v5))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_super v6 = [(SearchUIRowModel *)self identifyingResult];
    if (+[SearchUIUtilities resultIsSiriAction:v6])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v8 = [(SearchUIRowModel *)self identifyingResult];
      int v7 = [v8 isLocalApplicationResult] ^ 1;
    }
  }
  return v7;
}

- (id)punchouts
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SearchUIRowModel *)self identifyingResult];
  BOOL v4 = [v3 sectionBundleIdentifier];
  unsigned int v5 = +[SearchUIUtilities bundleIdentifierForApp:6];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v8 = [(SearchUIRowModel *)self cardSection];

    if (v8)
    {
      v14.receiver = self;
      v14.super_class = (Class)SearchUIDetailedRowModel;
      int v7 = [(SearchUICardSectionRowModel *)&v14 punchouts];
    }
    else
    {
      uint64_t v9 = [(SearchUIRowModel *)self identifyingResult];
      objc_super v10 = [v9 punchout];
      if (v10)
      {
        uint64_t v11 = [(SearchUIRowModel *)self identifyingResult];
        id v12 = [v11 punchout];
        v15[0] = v12;
        int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      }
      else
      {
        int v7 = 0;
      }
    }
  }
  return v7;
}

- (int)separatorStyle
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIDetailedRowModel;
  unsigned int v3 = [(SearchUICardSectionRowModel *)&v7 separatorStyle];
  if ([MEMORY[0x1E4FAE198] isMacOS]
    && [(SearchUIDetailedRowModel *)self useCompactVersionOfUI])
  {
    return 1;
  }
  if ([(SearchUIDetailedRowModel *)self useCompactVersionOfUI]
    && !v3
    && ![MEMORY[0x1E4FAE100] isSuperLargeAccessibilitySize])
  {
    return 3;
  }
  unsigned int v5 = [(SearchUIRowModel *)self cardSection];
  if (v5) {
    int v4 = v3;
  }
  else {
    int v4 = 3;
  }

  return v4;
}

- (BOOL)hasLeadingImage
{
  return +[SearchUILeadingViewController leadingViewClassForRowModel:self] != 0;
}

- (Class)cardSectionViewClass
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIDetailedRowModel;
  unsigned int v3 = [(SearchUICardSectionRowModel *)&v7 cardSectionViewClass];
  if (v3)
  {
    int v4 = v3;
  }
  else
  {
    unsigned int v5 = objc_opt_new();
    int v4 = +[SearchUICardSectionCreator viewClassForCardSection:v5 horizontal:[(SearchUICardSectionRowModel *)self isHorizontalInLayout]];
  }
  return v4;
}

- (id)requestAppClipObjects
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(SearchUIDetailedRowModel *)self buttonItems];

  if (v3)
  {
    unsigned int v3 = objc_opt_new();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v4 = [(SearchUIDetailedRowModel *)self buttonItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_searchUI_requestAppClipCommand");
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SearchUIDetailedRowModel;
  id v4 = [(SearchUICardSectionRowModel *)&v24 copyWithZone:a3];
  uint64_t v5 = [(SearchUIDetailedRowModel *)self leadingImage];
  [v4 setLeadingImage:v5];

  uint64_t v6 = [(SearchUIDetailedRowModel *)self fallbackImage];
  [v4 setFallbackImage:v6];

  uint64_t v7 = [(SearchUIDetailedRowModel *)self leadingButton];
  [v4 setLeadingButton:v7];

  objc_msgSend(v4, "setPreventThumbnailImageScaling:", -[SearchUIDetailedRowModel preventThumbnailImageScaling](self, "preventThumbnailImageScaling"));
  uint64_t v8 = [(SearchUIDetailedRowModel *)self buttonItems];
  [v4 setButtonItems:v8];

  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[SearchUIDetailedRowModel buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
  objc_msgSend(v4, "setIsLocalApplicationResult:", -[SearchUIDetailedRowModel isLocalApplicationResult](self, "isLocalApplicationResult"));
  uint64_t v9 = [(SearchUIDetailedRowModel *)self nearbyBusinessesString];
  [v4 setNearbyBusinessesString:v9];

  objc_super v10 = [(SearchUIDetailedRowModel *)self topText];
  [v4 setTopText:v10];

  long long v11 = [(SearchUIDetailedRowModel *)self title];
  [v4 setTitle:v11];

  objc_msgSend(v4, "setTruncateTitleMiddle:", -[SearchUIDetailedRowModel truncateTitleMiddle](self, "truncateTitleMiddle"));
  long long v12 = [(SearchUIDetailedRowModel *)self secondaryTitle];
  [v4 setSecondaryTitle:v12];

  objc_msgSend(v4, "setSecondaryTitleIsDetached:", -[SearchUIDetailedRowModel secondaryTitleIsDetached](self, "secondaryTitleIsDetached"));
  long long v13 = [(SearchUIDetailedRowModel *)self secondaryTitleImage];
  [v4 setSecondaryTitleImage:v13];

  long long v14 = [(SearchUIDetailedRowModel *)self details];
  [v4 setDetails:v14];

  v15 = [(SearchUIDetailedRowModel *)self footnote];
  [v4 setFootnote:v15];

  uint64_t v16 = [(SearchUIDetailedRowModel *)self footnoteButtonText];
  [v4 setFootnoteButtonText:v16];

  uint64_t v17 = [(SearchUIDetailedRowModel *)self action];
  [v4 setAction:v17];

  uint64_t v18 = [(SearchUIDetailedRowModel *)self trailingTopText];
  [v4 setTrailingTopText:v18];

  v19 = [(SearchUIDetailedRowModel *)self trailingMiddleText];
  [v4 setTrailingMiddleText:v19];

  long long v20 = [(SearchUIDetailedRowModel *)self trailingBottomText];
  [v4 setTrailingBottomText:v20];

  long long v21 = [(SearchUIDetailedRowModel *)self trailingThumbnail];
  [v4 setTrailingThumbnail:v21];

  long long v22 = [(SearchUIDetailedRowModel *)self mapsResult];
  [v4 setMapsResult:v22];

  return v4;
}

- (SFImage)leadingImage
{
  return self->_leadingImage;
}

- (void)setLeadingImage:(id)a3
{
}

- (SFImage)fallbackImage
{
  return (SFImage *)objc_getProperty(self, a2, 256, 1);
}

- (void)setFallbackImage:(id)a3
{
}

- (SFButton)leadingButton
{
  return (SFButton *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLeadingButton:(id)a3
{
}

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  self->_preventThumbnailImageScaling = a3;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (NSString)nearbyBusinessesString
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setNearbyBusinessesString:(id)a3
{
}

- (SFRichText)topText
{
  return (SFRichText *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTopText:(id)a3
{
}

- (SFRichText)title
{
  return (SFRichText *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTitle:(id)a3
{
}

- (BOOL)truncateTitleMiddle
{
  return self->_truncateTitleMiddle;
}

- (void)setTruncateTitleMiddle:(BOOL)a3
{
  self->_truncateTitleMiddle = a3;
}

- (SFFormattedText)secondaryTitle
{
  return (SFFormattedText *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSecondaryTitle:(id)a3
{
}

- (BOOL)secondaryTitleIsDetached
{
  return self->_secondaryTitleIsDetached;
}

- (void)setSecondaryTitleIsDetached:(BOOL)a3
{
  self->_secondaryTitleIsDetached = a3;
}

- (SFImage)secondaryTitleImage
{
  return (SFImage *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSecondaryTitleImage:(id)a3
{
}

- (void)setDetails:(id)a3
{
}

- (SFRichText)footnote
{
  return (SFRichText *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFootnote:(id)a3
{
}

- (NSString)footnoteButtonText
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setFootnoteButtonText:(id)a3
{
}

- (SFActionItem)action
{
  return (SFActionItem *)objc_getProperty(self, a2, 336, 1);
}

- (void)setAction:(id)a3
{
}

- (SFRichText)trailingTopText
{
  return (SFRichText *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTrailingTopText:(id)a3
{
}

- (SFRichText)trailingMiddleText
{
  return (SFRichText *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTrailingMiddleText:(id)a3
{
}

- (SFRichText)trailingBottomText
{
  return (SFRichText *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTrailingBottomText:(id)a3
{
}

- (NSArray)buttonItems
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (void)setButtonItems:(id)a3
{
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  self->_buttonItemsAreTrailing = a3;
}

- (SFImage)trailingThumbnail
{
  return (SFImage *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTrailingThumbnail:(id)a3
{
}

- (NSString)pinText
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setPinText:(id)a3
{
}

- (MKSearchFoundationResult)mapsResult
{
  return (MKSearchFoundationResult *)objc_getProperty(self, a2, 392, 1);
}

- (void)setMapsResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResult, 0);
  objc_storeStrong((id *)&self->_pinText, 0);
  objc_storeStrong((id *)&self->_trailingThumbnail, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_trailingTopText, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_footnoteButtonText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_nearbyBusinessesString, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
}

@end