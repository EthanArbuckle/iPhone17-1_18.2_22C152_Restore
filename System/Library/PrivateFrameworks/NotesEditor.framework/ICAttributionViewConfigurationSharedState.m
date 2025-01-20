@interface ICAttributionViewConfigurationSharedState
- (BOOL)isRTL;
- (BOOL)isTimestampUnread:(id)a3 forUserID:(id)a4;
- (ICAttributionViewConfigurationSharedState)initWithTextView:(id)a3 note:(id)a4;
- (ICBaseTextView)textView;
- (ICNote)note;
- (ICTTTextStorage)noteTextStorage;
- (NSDate)noteLastOpenedDate;
- (NSMutableDictionary)userIDToHighlightColor;
- (NSMutableDictionary)userIDToShortName;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (UIImage)collapsedDisclosureImage;
- (UIImage)expandedDisclosureImage;
- (double)panelWidth;
- (double)topTextViewInset;
- (id)disclosureImageWithSymbolName:(id)a3;
- (id)highlightColorForUserID:(id)a3;
- (id)primaryFontStorage;
- (id)secondaryFontStorage;
- (id)shortNameForUserID:(id)a3;
- (void)setCollapsedDisclosureImage:(id)a3;
- (void)setExpandedDisclosureImage:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setNoteLastOpenedDate:(id)a3;
- (void)setPanelWidth:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryFontStorage:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryFontStorage:(id)a3;
- (void)setTopTextViewInset:(double)a3;
- (void)setUserIDToHighlightColor:(id)a3;
- (void)setUserIDToShortName:(id)a3;
- (void)synchronouslyLoadDataForEditGroups:(id)a3;
- (void)updateFontStorages;
- (void)updateFonts;
- (void)updateHighlightColorsForUserIDs:(id)a3;
- (void)updateImages;
- (void)updateShortNamesForUserIDs:(id)a3;
@end

@implementation ICAttributionViewConfigurationSharedState

- (ICAttributionViewConfigurationSharedState)initWithTextView:(id)a3 note:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICAttributionViewConfigurationSharedState;
  v8 = [(ICAttributionViewConfigurationSharedState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_textView, v6);
    objc_storeStrong((id *)&v9->_note, a4);
  }

  return v9;
}

- (ICTTTextStorage)noteTextStorage
{
  v3 = [(ICAttributionViewConfigurationSharedState *)self textView];
  v4 = [v3 editorController];
  v5 = [v4 note];

  id v6 = [v5 objectID];
  id v7 = [(ICAttributionViewConfigurationSharedState *)self note];
  v8 = [v7 objectID];
  if ([v6 isEqual:v8])
  {
    v9 = [v5 textStorageWithoutCreating];
  }
  else
  {
    v9 = 0;
  }

  return (ICTTTextStorage *)v9;
}

- (void)synchronouslyLoadDataForEditGroups:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "userID", (void)v12);
        objc_msgSend(v5, "ic_addNonNilObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(ICAttributionViewConfigurationSharedState *)self updateHighlightColorsForUserIDs:v5];
  [(ICAttributionViewConfigurationSharedState *)self updateShortNamesForUserIDs:v5];
  [(ICAttributionViewConfigurationSharedState *)self updateFonts];
  [(ICAttributionViewConfigurationSharedState *)self updateImages];
}

- (void)updateFonts
{
  uint64_t v3 = *MEMORY[0x263F83588];
  uint64_t v4 = *MEMORY[0x263F83420];
  v5 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForStyle:symbolicTraits:maxContentSizeCategory:", *MEMORY[0x263F83588], 2, *MEMORY[0x263F83420]);
  id v6 = objc_msgSend(v5, "ic_fontWithSingleLineA");
  [(ICAttributionViewConfigurationSharedState *)self setPrimaryFont:v6];

  uint64_t v7 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForTextStyle:maxContentSizeCategory:", v3, v4);
  uint64_t v8 = objc_msgSend(v7, "ic_fontWithSingleLineA");
  [(ICAttributionViewConfigurationSharedState *)self setSecondaryFont:v8];

  [(ICAttributionViewConfigurationSharedState *)self updateFontStorages];
}

- (void)updateImages
{
  uint64_t v3 = [(ICAttributionViewConfigurationSharedState *)self disclosureImageWithSymbolName:@"chevron.down"];
  [(ICAttributionViewConfigurationSharedState *)self setExpandedDisclosureImage:v3];

  id v4 = [(ICAttributionViewConfigurationSharedState *)self disclosureImageWithSymbolName:@"chevron.forward"];
  [(ICAttributionViewConfigurationSharedState *)self setCollapsedDisclosureImage:v4];
}

- (id)disclosureImageWithSymbolName:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82818];
  id v5 = a3;
  id v6 = [(ICAttributionViewConfigurationSharedState *)self primaryFont];
  uint64_t v7 = [v4 configurationWithFont:v6 scale:1];

  uint64_t v8 = [MEMORY[0x263F827E8] systemImageNamed:v5 withConfiguration:v7];

  int v9 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  if (v9)
  {
    id v6 = [MEMORY[0x263F825C8] systemGrayColor];
    [v6 colorWithAlphaComponent:0.4];
  }
  else
  {
    [MEMORY[0x263F825C8] tertiaryLabelColor];
  uint64_t v10 = };
  objc_super v11 = [v8 imageWithTintColor:v10];

  if (v9)
  {

    uint64_t v10 = v6;
  }

  long long v12 = [v11 imageWithRenderingMode:1];

  return v12;
}

- (void)updateHighlightColorsForUserIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttributionViewConfigurationSharedState *)self textView];
  id v6 = [v5 editorController];
  uint64_t v7 = [v6 note];

  uint64_t v8 = [v7 managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__ICAttributionViewConfigurationSharedState_updateHighlightColorsForUserIDs___block_invoke;
  v11[3] = &unk_2640B89A8;
  v11[4] = self;
  id v12 = v4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v4;
  [v8 performBlockAndWait:v11];
}

void __77__ICAttributionViewConfigurationSharedState_updateHighlightColorsForUserIDs___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [a1[4] setUserIDToHighlightColor:v2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = objc_msgSend(a1[6], "collaborationColorManager", (void)v12);
        id v10 = [v9 highlightColorForUserID:v8 note:a1[6]];
        objc_super v11 = [a1[4] userIDToHighlightColor];
        [v11 setObject:v10 forKeyedSubscript:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)highlightColorForUserID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAttributionViewConfigurationSharedState *)self userIDToHighlightColor];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x263F5B2E0] defaultColor];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)updateShortNamesForUserIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAttributionViewConfigurationSharedState *)self note];
  uint64_t v6 = [v5 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__ICAttributionViewConfigurationSharedState_updateShortNamesForUserIDs___block_invoke;
  v8[3] = &unk_2640B82D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

void __72__ICAttributionViewConfigurationSharedState_updateShortNamesForUserIDs___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [*(id *)(a1 + 32) setUserIDToShortName:v2];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "note", (void)v13);
        id v10 = [v9 participantForUserID:v8];
        objc_super v11 = objc_msgSend(v10, "ic_activityStreamDisplayName");
        long long v12 = [*(id *)(a1 + 32) userIDToShortName];
        [v12 setObject:v11 forKeyedSubscript:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)shortNameForUserID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAttributionViewConfigurationSharedState *)self userIDToShortName];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
    id v7 = [v8 localizedStringForKey:@"Somebody" value:&stru_26C10E100 table:0];
  }

  return v7;
}

- (BOOL)isTimestampUnread:(id)a3 forUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICAttributionViewConfigurationSharedState *)self note];
  id v9 = [v8 account];
  id v10 = [v9 userRecordName];
  int v11 = [v7 isEqualToString:v10];

  int v12 = v11 ^ 1;
  long long v13 = [(ICAttributionViewConfigurationSharedState *)self noteLastOpenedDate];

  if (v13)
  {
    long long v14 = [(ICAttributionViewConfigurationSharedState *)self noteLastOpenedDate];
    v12 &= objc_msgSend(v6, "ic_isLaterThanDate:", v14);
  }
  long long v15 = [(ICAttributionViewConfigurationSharedState *)self note];
  long long v16 = [v15 lastAttributionsViewedDate];

  if (v16)
  {
    uint64_t v17 = [(ICAttributionViewConfigurationSharedState *)self note];
    uint64_t v18 = [v17 lastAttributionsViewedDate];
    v12 &= objc_msgSend(v6, "ic_isLaterThanDate:", v18);
  }
  return v12;
}

- (ICBaseTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICBaseTextView *)WeakRetained;
}

- (ICNote)note
{
  return self->_note;
}

- (NSDate)noteLastOpenedDate
{
  return self->_noteLastOpenedDate;
}

- (void)setNoteLastOpenedDate:(id)a3
{
}

- (double)panelWidth
{
  return self->_panelWidth;
}

- (void)setPanelWidth:(double)a3
{
  self->_panelWidth = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)topTextViewInset
{
  return self->_topTextViewInset;
}

- (void)setTopTextViewInset:(double)a3
{
  self->_topTextViewInset = a3;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
}

- (UIImage)expandedDisclosureImage
{
  return self->_expandedDisclosureImage;
}

- (void)setExpandedDisclosureImage:(id)a3
{
}

- (UIImage)collapsedDisclosureImage
{
  return self->_collapsedDisclosureImage;
}

- (void)setCollapsedDisclosureImage:(id)a3
{
}

- (id)primaryFontStorage
{
  return self->_primaryFontStorage;
}

- (void)setPrimaryFontStorage:(id)a3
{
}

- (id)secondaryFontStorage
{
  return self->_secondaryFontStorage;
}

- (void)setSecondaryFontStorage:(id)a3
{
}

- (NSMutableDictionary)userIDToHighlightColor
{
  return self->_userIDToHighlightColor;
}

- (void)setUserIDToHighlightColor:(id)a3
{
}

- (NSMutableDictionary)userIDToShortName
{
  return self->_userIDToShortName;
}

- (void)setUserIDToShortName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDToShortName, 0);
  objc_storeStrong((id *)&self->_userIDToHighlightColor, 0);
  objc_storeStrong(&self->_secondaryFontStorage, 0);
  objc_storeStrong(&self->_primaryFontStorage, 0);
  objc_storeStrong((id *)&self->_collapsedDisclosureImage, 0);
  objc_storeStrong((id *)&self->_expandedDisclosureImage, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_noteLastOpenedDate, 0);
  objc_storeStrong((id *)&self->_note, 0);

  objc_destroyWeak((id *)&self->_textView);
}

- (void)updateFontStorages
{
  v2 = self;
  sub_20C0911F0();
}

@end