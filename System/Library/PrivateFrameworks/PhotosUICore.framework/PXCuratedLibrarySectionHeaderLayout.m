@interface PXCuratedLibrarySectionHeaderLayout
- (BOOL)controlStackButtonSelected;
- (BOOL)ellipsisButtonHighlighted;
- (BOOL)filterButtonHighlighted;
- (BOOL)showsBackgroundGradient;
- (BOOL)showsDebugDescription;
- (BOOL)usesCompactToggleAspectFitButton;
- (BOOL)wantsOverBackgroundAppearance;
- (CGRect)titleSubtitleFrame;
- (CGSize)_sizeOfButton:(unint64_t)a3;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSArray)externalLeadingButtonConfigurations;
- (NSArray)externalTopButtonConfigurations;
- (NSArray)externalTrailingButtonConfigurations;
- (NSSet)toggleAspectFitButtonPossibleTitles;
- (NSString)filterButtonCaption;
- (NSString)filterButtonTitle;
- (NSString)longestPossibleSelectionTitle;
- (NSString)selectButtonTitle;
- (NSString)selectionTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)toggleAspectFitButtonTitle;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXCuratedLibraryActionPerformer)cancelButtonActionPerformer;
- (PXCuratedLibraryActionPerformer)selectButtonActionPerformer;
- (PXCuratedLibraryActionPerformer)showSidebarButtonActionPerformer;
- (PXCuratedLibraryActionPerformer)toggleAspectFitButtonActionPerformer;
- (PXCuratedLibraryActionPerformer)zoomInButtonActionPerformer;
- (PXCuratedLibraryActionPerformer)zoomOutButtonActionPerformer;
- (PXCuratedLibraryEllipsisButtonActionPerformer)ellipsisButtonActionPerformer;
- (PXCuratedLibrarySectionHeaderLayout)init;
- (PXCuratedLibrarySectionHeaderLayoutSpec)effectiveSpec;
- (PXCuratedLibrarySectionHeaderLayoutSpec)spec;
- (PXCuratedLibraryShowFiltersActionPerformer)showFiltersActionPerformer;
- (PXGLayoutGuide)leadingButtonsLayoutGuide;
- (PXLibraryFilterState)libraryFilterState;
- (PXNumberAnimator)alternateAppearanceMixAnimator;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXTitleSubtitleLabelSpec)effectiveOverBackgroundTitleSubtitleLabelSpec;
- (PXTitleSubtitleLabelSpec)effectiveTitleSubtitleLabelSpec;
- (UIEdgeInsets)safeAreaInsetsWithCurrentBehavior;
- (double)buttonsAlpha;
- (double)buttonsMaxY;
- (double)gradientAlpha;
- (double)lateralMargin;
- (double)maxPossibleHeight;
- (double)titleAlpha;
- (double)titleSubtitleLastBaseline;
- (double)titleSubtitleTopSpacing;
- (float)buttonsZIndex;
- (id)_configurationForButton:(unint64_t)a3;
- (id)_configurationForButton:(unint64_t)a3 overBackgroundVariant:(BOOL)a4;
- (id)_effectiveTitleSubtitleLabelSpec:(id)a3;
- (id)_selectionTitleLabelConfigurationWithTitle:(id)a3 spec:(id)a4;
- (id)_titleSubtitleSpecForItemIdentifier:(id)a3;
- (id)axSpriteIndexes;
- (id)configurationForButton:(unint64_t)a3 spec:(id)a4;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (id)titleSubtitleSpecForSpriteAtIndex:(unsigned int)a3;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)safeAreaBehavior;
- (int64_t)toggleAspectFitCompactButtonSymbol;
- (unint64_t)toggleAspectFitButton;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_discardAllCachedButtonSizes;
- (void)_handleAsyncDateDescription:(id)a3 title:(id)a4 subtitle:(id)a5 placement:(int64_t)a6 generation:(int64_t)a7;
- (void)_invalidateEllipsisButton;
- (void)_invalidateFilterButton;
- (void)_updateButtonActionPerformers;
- (void)_updateEffectiveSpec;
- (void)_updateLastBaseline;
- (void)_updateSpriteTags;
- (void)_updateSprites;
- (void)_updateSpritesAlpha;
- (void)_updateTitleAndSubtitle;
- (void)alphaDidChange;
- (void)didRenderTitleAndSubtitleSpriteAtIndex:(unsigned int)a3 layoutVersion:(int64_t)a4 withLastBaseline:(double)a5;
- (void)displayScaleDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceOptionsDidChange;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)setAssetCollectionReference:(id)a3;
- (void)setButtonsAlpha:(double)a3;
- (void)setButtonsMaxY:(double)a3;
- (void)setButtonsZIndex:(float)a3;
- (void)setCancelButtonActionPerformer:(id)a3;
- (void)setControlStackButtonSelected:(BOOL)a3;
- (void)setEffectiveSpec:(id)a3;
- (void)setEllipsisButtonActionPerformer:(id)a3;
- (void)setEllipsisButtonHighlighted:(BOOL)a3;
- (void)setExternalLeadingButtonConfigurations:(id)a3;
- (void)setExternalTopButtonConfigurations:(id)a3;
- (void)setExternalTrailingButtonConfigurations:(id)a3;
- (void)setFilterButtonCaption:(id)a3;
- (void)setFilterButtonHighlighted:(BOOL)a3;
- (void)setFilterButtonTitle:(id)a3;
- (void)setGradientAlpha:(double)a3;
- (void)setLateralMargin:(double)a3;
- (void)setLeadingButtonsLayoutGuide:(id)a3;
- (void)setLongestPossibleSelectionTitle:(id)a3;
- (void)setMaxPossibleHeight:(double)a3;
- (void)setSafeAreaBehavior:(int64_t)a3;
- (void)setSelectButtonActionPerformer:(id)a3;
- (void)setSelectButtonTitle:(id)a3;
- (void)setSelectionTitle:(id)a3;
- (void)setShowFiltersActionPerformer:(id)a3;
- (void)setShowSidebarButtonActionPerformer:(id)a3;
- (void)setShowsBackgroundGradient:(BOOL)a3;
- (void)setShowsDebugDescription:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAlpha:(double)a3;
- (void)setTitleSubtitleLastBaseline:(double)a3;
- (void)setTitleSubtitleTopSpacing:(double)a3;
- (void)setToggleAspectFitButtonActionPerformer:(id)a3;
- (void)setToggleAspectFitButtonPossibleTitles:(id)a3;
- (void)setToggleAspectFitButtonTitle:(id)a3;
- (void)setToggleAspectFitCompactButtonSymbol:(int64_t)a3;
- (void)setUsesCompactToggleAspectFitButton:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)setWantsOverBackgroundAppearance:(BOOL)a3;
- (void)setZoomInButtonActionPerformer:(id)a3;
- (void)setZoomOutButtonActionPerformer:(id)a3;
- (void)update;
- (void)visibleRectDidChange;
@end

@implementation PXCuratedLibrarySectionHeaderLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_alternateAppearanceMixAnimator, 0);
  objc_storeStrong((id *)&self->_effectiveOverBackgroundTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_effectiveTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_effectiveSpec, 0);
  objc_storeStrong((id *)&self->_leadingButtonsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_externalTopButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_externalLeadingButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_externalTrailingButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_toggleAspectFitButtonPossibleTitles, 0);
  objc_storeStrong((id *)&self->_toggleAspectFitButtonTitle, 0);
  objc_storeStrong((id *)&self->_longestPossibleSelectionTitle, 0);
  objc_storeStrong((id *)&self->_selectionTitle, 0);
  objc_storeStrong((id *)&self->_filterButtonTitle, 0);
  objc_storeStrong((id *)&self->_filterButtonCaption, 0);
  objc_storeStrong((id *)&self->_selectButtonTitle, 0);
  objc_storeStrong((id *)&self->_showSidebarButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_toggleAspectFitButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_zoomOutButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_zoomInButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_cancelButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_selectButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_showFiltersActionPerformer, 0);
  objc_storeStrong((id *)&self->_ellipsisButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_asyncDateQueue, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_itemIdentifierBySpriteIndex, 0);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXNumberAnimator)alternateAppearanceMixAnimator
{
  return self->_alternateAppearanceMixAnimator;
}

- (void)setGradientAlpha:(double)a3
{
  self->_gradientAlpha = a3;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (double)titleSubtitleLastBaseline
{
  return self->_titleSubtitleLastBaseline;
}

- (double)titleSubtitleTopSpacing
{
  return self->_titleSubtitleTopSpacing;
}

- (double)buttonsMaxY
{
  return self->_buttonsMaxY;
}

- (BOOL)usesCompactToggleAspectFitButton
{
  return self->_usesCompactToggleAspectFitButton;
}

- (BOOL)controlStackButtonSelected
{
  return self->_controlStackButtonSelected;
}

- (PXTitleSubtitleLabelSpec)effectiveOverBackgroundTitleSubtitleLabelSpec
{
  return self->_effectiveOverBackgroundTitleSubtitleLabelSpec;
}

- (PXTitleSubtitleLabelSpec)effectiveTitleSubtitleLabelSpec
{
  return self->_effectiveTitleSubtitleLabelSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)effectiveSpec
{
  return self->_effectiveSpec;
}

- (void)setLeadingButtonsLayoutGuide:(id)a3
{
}

- (PXGLayoutGuide)leadingButtonsLayoutGuide
{
  return self->_leadingButtonsLayoutGuide;
}

- (NSArray)externalTopButtonConfigurations
{
  return self->_externalTopButtonConfigurations;
}

- (NSArray)externalLeadingButtonConfigurations
{
  return self->_externalLeadingButtonConfigurations;
}

- (NSArray)externalTrailingButtonConfigurations
{
  return self->_externalTrailingButtonConfigurations;
}

- (void)setSafeAreaBehavior:(int64_t)a3
{
  self->_safeAreaBehavior = a3;
}

- (int64_t)safeAreaBehavior
{
  return self->_safeAreaBehavior;
}

- (CGRect)titleSubtitleFrame
{
  double x = self->_titleSubtitleFrame.origin.x;
  double y = self->_titleSubtitleFrame.origin.y;
  double width = self->_titleSubtitleFrame.size.width;
  double height = self->_titleSubtitleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)toggleAspectFitCompactButtonSymbol
{
  return self->_toggleAspectFitCompactButtonSymbol;
}

- (NSSet)toggleAspectFitButtonPossibleTitles
{
  return self->_toggleAspectFitButtonPossibleTitles;
}

- (NSString)toggleAspectFitButtonTitle
{
  return self->_toggleAspectFitButtonTitle;
}

- (NSString)longestPossibleSelectionTitle
{
  return self->_longestPossibleSelectionTitle;
}

- (NSString)selectionTitle
{
  return self->_selectionTitle;
}

- (BOOL)filterButtonHighlighted
{
  return self->_filterButtonHighlighted;
}

- (BOOL)ellipsisButtonHighlighted
{
  return self->_ellipsisButtonHighlighted;
}

- (NSString)filterButtonTitle
{
  return self->_filterButtonTitle;
}

- (NSString)filterButtonCaption
{
  return self->_filterButtonCaption;
}

- (NSString)selectButtonTitle
{
  return self->_selectButtonTitle;
}

- (PXCuratedLibraryActionPerformer)showSidebarButtonActionPerformer
{
  return self->_showSidebarButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)toggleAspectFitButtonActionPerformer
{
  return self->_toggleAspectFitButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)zoomOutButtonActionPerformer
{
  return self->_zoomOutButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)zoomInButtonActionPerformer
{
  return self->_zoomInButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)cancelButtonActionPerformer
{
  return self->_cancelButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)selectButtonActionPerformer
{
  return self->_selectButtonActionPerformer;
}

- (PXCuratedLibraryShowFiltersActionPerformer)showFiltersActionPerformer
{
  return self->_showFiltersActionPerformer;
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)ellipsisButtonActionPerformer
{
  return self->_ellipsisButtonActionPerformer;
}

- (void)setButtonsZIndex:(float)a3
{
  self->_buttonsZIndedouble x = a3;
}

- (float)buttonsZIndex
{
  return self->_buttonsZIndex;
}

- (BOOL)showsDebugDescription
{
  return self->_showsDebugDescription;
}

- (BOOL)showsBackgroundGradient
{
  return self->_showsBackgroundGradient;
}

- (BOOL)wantsOverBackgroundAppearance
{
  return self->_wantsOverBackgroundAppearance;
}

- (double)buttonsAlpha
{
  return self->_buttonsAlpha;
}

- (double)titleAlpha
{
  return self->_titleAlpha;
}

- (double)maxPossibleHeight
{
  return self->_maxPossibleHeight;
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext == a5)
  {
    if ((v6 & 3) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    id v18 = v9;
    [(PXCuratedLibrarySectionHeaderLayout *)self _invalidateEllipsisButton];
LABEL_13:
    id v9 = v18;
    goto LABEL_14;
  }
  if ((void *)PXLibraryFilterStateObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if ((void *)AlternateAppearanceMixAnimatorObservationContext != a5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySectionHeaderLayout.m" lineNumber:1963 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    id v18 = v9;
    v10 = [(PXCuratedLibrarySectionHeaderLayout *)self alternateAppearanceMixAnimator];
    char v11 = [v10 isBeingMutated];

    id v9 = v18;
    if ((v11 & 1) == 0)
    {
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_19:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
          goto LABEL_14;
        }
LABEL_18:
        if ((self->_updateFlags.updated & 2) != 0)
        {
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          v17 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout observable:didChange:context:]"];
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"PXCuratedLibrarySectionHeaderLayout.m", 1960, @"invalidating %lu after it already has been updated", 2);

          abort();
        }
        goto LABEL_19;
      }
      if (self->_updateFlags.isPerformingUpdate) {
        goto LABEL_18;
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 2;
      if (!willPerformUpdate)
      {
        [(PXGLayout *)self setNeedsUpdate];
        goto LABEL_13;
      }
    }
  }
LABEL_14:
}

- (id)axSpriteIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_axSpriteIndexes copy];
  return v2;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(PXCuratedLibrarySectionHeaderLayout *)self assetCollectionReference];
  char v6 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3 objectReference:0];
  v7 = [(NSArray *)self->_itemIdentifierBySpriteIndex objectAtIndexedSubscript:v3];
  v8 = v7;
  if (v7 == @"PXCuratedLibrarySectionHeaderItemEllipsisButton"
    || v7 == @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground")
  {
    uint64_t v10 = 7;
    goto LABEL_39;
  }
  if (v7 == @"PXCuratedLibrarySectionHeaderItemFilterButton"
    || v7 == @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground")
  {
    uint64_t v10 = 8;
    goto LABEL_39;
  }
  if (v7 == @"PXCuratedLibrarySectionHeaderItemControlStackButton"
    || v7 == @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground")
  {
    uint64_t v10 = 9;
    goto LABEL_39;
  }
  if (v7 == @"PXCuratedLibrarySectionHeaderItemSelectButton"
    || v7 == @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground")
  {
    uint64_t v10 = 10;
    goto LABEL_39;
  }
  uint64_t v10 = 11;
  if (v7 == @"PXCuratedLibrarySectionHeaderItemCancelButton"
    || v7 == @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"
    || (uint64_t v10 = 12, v7 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton")
    || v7 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"
    || (uint64_t v10 = 13, v7 == @"PXCuratedLibrarySectionHeaderItemZoomInButton")
    || v7 == @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"
    || (uint64_t v10 = 14, v7 == @"PXCuratedLibrarySectionHeaderItemZoomOutButton")
    || v7 == @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"
    || (uint64_t v10 = 15, v7 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButton")
    || v7 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground")
  {
LABEL_39:
    if (!v5)
    {
      v14 = [[PXCuratedLibraryHitTestResult alloc] initWithControl:v10 spriteReference:v6 layout:self];
      goto LABEL_42;
    }
LABEL_40:
    v14 = [[PXCuratedLibraryHitTestResult alloc] initWithControl:v10 spriteReference:v6 layout:self assetCollectionReference:v5];
LABEL_42:
    v15 = v14;
    goto LABEL_43;
  }
  if (v7 == @"PXCuratedLibrarySectionHeaderItemTitleHitArea")
  {
    uint64_t v10 = 6;
    goto LABEL_39;
  }
  if (v5)
  {
    uint64_t v10 = 5;
    goto LABEL_40;
  }
  v15 = 0;
LABEL_43:

  return v15;
}

- (id)_configurationForButton:(unint64_t)a3 overBackgroundVariant:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = -[PXCuratedLibrarySectionHeaderLayout _configurationForButton:](self, "_configurationForButton:");
  [(PXGLayout *)self visibleRect];
  if (v8 >= 0.0) {
    [v7 setForcePointerInteractionEnabled:1];
  }
  if (a3)
  {
    if (a3 == 1 || !v4) {
      goto LABEL_10;
    }
LABEL_9:
    id v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v7 setTintColor:v9];

    goto LABEL_10;
  }
  if (![(PXCuratedLibrarySectionHeaderLayout *)self ellipsisButtonHighlighted] && v4) {
    goto LABEL_9;
  }
LABEL_10:
  return v7;
}

- (id)_configurationForButton:(unint64_t)a3
{
  v5 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
  char v6 = [(PXCuratedLibrarySectionHeaderLayout *)self configurationForButton:a3 spec:v5];

  return v6;
}

- (id)configurationForButton:(unint64_t)a3 spec:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      if ([(PXCuratedLibrarySectionHeaderLayout *)self ellipsisButtonHighlighted]) {
        uint64_t v7 = 13;
      }
      else {
        uint64_t v7 = 0;
      }
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:1 spec:v6];
      uint64_t v9 = [(PXCuratedLibrarySectionHeaderLayout *)self ellipsisButtonActionPerformer];
      goto LABEL_11;
    case 1uLL:
      if ([(PXCuratedLibrarySectionHeaderLayout *)self filterButtonHighlighted]) {
        uint64_t v7 = 12;
      }
      else {
        uint64_t v7 = 10;
      }
      uint64_t v10 = [(PXCuratedLibrarySectionHeaderLayout *)self filterButtonTitle];
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:4 title:v10 spec:v6];

      char v11 = [(PXCuratedLibrarySectionHeaderLayout *)self filterButtonCaption];
      [v8 setCaption:v11];

      uint64_t v9 = [(PXCuratedLibrarySectionHeaderLayout *)self showFiltersActionPerformer];
LABEL_11:
      v12 = (void *)v9;
      [v8 setActionPerformer:v9];

      break;
    case 2uLL:
      v13 = [(PXCuratedLibrarySectionHeaderLayout *)self selectButtonTitle];
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v13 spec:v6];

      uint64_t v14 = [(PXCuratedLibrarySectionHeaderLayout *)self selectButtonActionPerformer];
      goto LABEL_21;
    case 3uLL:
      v15 = PXLocalizedStringFromTable(@"PXCuratedLibraryCancelSelectionButtonTitle", @"PhotosUICore");
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v15 spec:v6];

      uint64_t v14 = [(PXCuratedLibrarySectionHeaderLayout *)self cancelButtonActionPerformer];
      goto LABEL_21;
    case 4uLL:
      v16 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButtonTitle];
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v16 spec:v6];

      v17 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButtonActionPerformer];
      [v8 setActionPerformer:v17];

      id v18 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButtonPossibleTitles];
      [v8 setPossibleTitles:v18];
      goto LABEL_22;
    case 5uLL:
      int64_t v19 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitCompactButtonSymbol];
      uint64_t v20 = 5;
      if (v19 != 1) {
        uint64_t v20 = 0;
      }
      if (v19) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 6;
      }
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:v21 spec:v6];
      uint64_t v14 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButtonActionPerformer];
LABEL_21:
      id v18 = (void *)v14;
      [v8 setActionPerformer:v14];
LABEL_22:

      uint64_t v7 = 0;
      break;
    case 6uLL:
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:@"plus" spec:v6];
      objc_claimAutoreleasedReturnValue();
      PXEdgeInsetsMake();
    case 7uLL:
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:@"minus" spec:v6];
      objc_claimAutoreleasedReturnValue();
      PXEdgeInsetsMake();
    case 8uLL:
      BOOL v24 = [(PXCuratedLibrarySectionHeaderLayout *)self controlStackButtonSelected];
      if (v24) {
        v25 = @"xmark";
      }
      else {
        v25 = @"plus.slash.minus";
      }
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:v25 spec:v6];
      objc_initWeak(&location, self);
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __67__PXCuratedLibrarySectionHeaderLayout_configurationForButton_spec___block_invoke;
      v30 = &unk_1E5DD32D0;
      objc_copyWeak(&v31, &location);
      [v8 setActionHandler:&v27];
      if (v24) {
        uint64_t v7 = 8;
      }
      else {
        uint64_t v7 = 0;
      }
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
      break;
    case 9uLL:
      double v8 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:@"sidebar.leading" spec:v6];
      v22 = [(PXCuratedLibrarySectionHeaderLayout *)self showSidebarButtonActionPerformer];
      [v8 setActionPerformer:v22];

      v23 = [MEMORY[0x1E4FB1618] whiteColor];
      [v8 setTintColor:v23];

      uint64_t v7 = 2;
      break;
    default:
      uint64_t v7 = 0;
      double v8 = 0;
      break;
  }
  objc_msgSend(v8, "setStyle:", v7, v27, v28, v29, v30);

  return v8;
}

void __67__PXCuratedLibrarySectionHeaderLayout_configurationForButton_spec___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained controlStackButtonSelected] ^ 1;
  id v3 = objc_loadWeakRetained(v1);
  [v3 setControlStackButtonSelected:v2];
}

- (void)_discardAllCachedButtonSizes
{
  uint64_t v2 = 0;
  CGSize v3 = *(CGSize *)off_1E5DAB030;
  do
    self->_cachedSizeByButtonIdentifier[v2++] = v3;
  while (v2 != 10);
  self->_cachedExternalTrailingButtonsSize = v3;
  self->_cachedExternalLeadingButtonsSize = v3;
}

- (CGSize)_sizeOfButton:(unint64_t)a3
{
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == @"PXCuratedLibrarySectionHeaderItemEllipsisButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 0;
LABEL_49:
    v16 = [(PXCuratedLibrarySectionHeaderLayout *)v9 _configurationForButton:v10 overBackgroundVariant:v8];
    goto LABEL_50;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemFilterButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 1;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemSelectButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 2;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemCancelButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 3;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground")
  {
    BOOL v15 = v5 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground";
    unint64_t v10 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButton];
    uint64_t v9 = self;
    BOOL v8 = v15;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemZoomInButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 6;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemZoomOutButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 7;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemControlStackButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 8;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground")
  {
    BOOL v8 = v5 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground";
    uint64_t v9 = self;
    unint64_t v10 = 9;
    goto LABEL_49;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitle"
    || v5 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground")
  {
    id v18 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
    if ([v18 requiresTitleRenderedAsView])
    {
      v16 = objc_alloc_init(PXGTitleSubtitleViewConfiguration);
      int64_t v19 = [(PXCuratedLibrarySectionHeaderLayout *)self title];
      [(PXGTitleSubtitleViewConfiguration *)v16 setTitle:v19];

      uint64_t v20 = [(PXCuratedLibrarySectionHeaderLayout *)self subtitle];
      [(PXGTitleSubtitleViewConfiguration *)v16 setSubtitle:v20];

      uint64_t v21 = [(PXCuratedLibrarySectionHeaderLayout *)self _titleSubtitleSpecForItemIdentifier:v6];
      [(PXGTitleSubtitleViewConfiguration *)v16 setSpec:v21];
    }
    else
    {
      v22 = [PXZoomableInlineHeaderViewConfiguration alloc];
      uint64_t v21 = [(PXCuratedLibrarySectionHeaderLayout *)self title];
      v23 = [(PXCuratedLibrarySectionHeaderLayout *)self subtitle];
      BOOL v24 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
      v16 = -[PXZoomableInlineHeaderViewConfiguration initWithTitle:subtitle:swapTitleAndSubtitle:style:](v22, "initWithTitle:subtitle:swapTitleAndSubtitle:style:", v21, v23, 0, [v24 inlineHeaderStyle]);
    }
LABEL_58:

    goto LABEL_59;
  }
  if (v5 != @"PXCuratedLibrarySectionHeaderItemGradient")
  {
    if (v5 != @"PXCuratedLibrarySectionHeaderItemSelectionTitle"
      && v5 != @"PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground")
    {
      v16 = 0;
      goto LABEL_50;
    }
    id v18 = [(PXCuratedLibrarySectionHeaderLayout *)self _titleSubtitleSpecForItemIdentifier:v5];
    uint64_t v21 = [(PXCuratedLibrarySectionHeaderLayout *)self selectionTitle];
    v16 = [(PXCuratedLibrarySectionHeaderLayout *)self _selectionTitleLabelConfigurationWithTitle:v21 spec:v18];
    goto LABEL_58;
  }
  v25 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
  v26 = [v25 headerGradientImageConfiguration];
  id v18 = [v26 imageName];

  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
  v16 = [[PXGNamedImageViewConfiguration alloc] initWithImageName:v18 contentMode:0 bundle:v27];
  [(PXGTitleSubtitleViewConfiguration *)v16 setContentMode:0];

LABEL_59:
LABEL_50:

  return v16;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitle"
    || v5 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground")
  {
    BOOL v8 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
    [v8 requiresTitleRenderedAsView];
  }
  uint64_t v9 = objc_opt_class();

  return (Class)v9;
}

- (void)didRenderTitleAndSubtitleSpriteAtIndex:(unsigned int)a3 layoutVersion:(int64_t)a4 withLastBaseline:(double)a5
{
  if ([(PXGLayout *)self version] == a4)
  {
    [(PXCuratedLibrarySectionHeaderLayout *)self setTitleSubtitleLastBaseline:a5];
  }
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  BOOL v4 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
  v5 = [v4 headerGradientImageConfiguration];

  return v5;
}

- (id)_titleSubtitleSpecForItemIdentifier:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitle"
    || v4 == @"PXCuratedLibrarySectionHeaderItemSelectionTitle")
  {
    uint64_t v7 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveTitleSubtitleLabelSpec];
  }
  else
  {
    if (v4 != @"PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground"
      && v4 != @"PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground")
    {
      PXAssertGetLog();
    }
    uint64_t v7 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveOverBackgroundTitleSubtitleLabelSpec];
  }
  BOOL v8 = (void *)v7;

  return v8;
}

- (id)titleSubtitleSpecForSpriteAtIndex:(unsigned int)a3
{
  if ([(PXCuratedLibrarySectionHeaderLayout *)self showsDebugDescription])
  {
    v5 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
    BOOL v8 = [(PXCuratedLibrarySectionHeaderLayout *)self assetCollectionReference];
    uint64_t v9 = [v8 assetCollection];

    [v9 promotionScore];
    double v11 = v10;
    v12 = +[PXCuratedLibrarySettings sharedInstance];
    [v12 nonInterestingPromotionScore];
    double v14 = v13;

    if (v11 >= v14) {
      [v5 debugInterestingTitleSubtitleLabelSpec];
    }
    else {
    BOOL v15 = [v5 debugNonInterestingTitleSubtitleLabelSpec];
    }
    id v6 = [(PXCuratedLibrarySectionHeaderLayout *)self _effectiveTitleSubtitleLabelSpec:v15];
  }
  else
  {
    v5 = [(NSArray *)self->_itemIdentifierBySpriteIndex objectAtIndexedSubscript:a3];
    id v6 = [(PXCuratedLibrarySectionHeaderLayout *)self _titleSubtitleSpecForItemIdentifier:v5];
  }

  return v6;
}

- (void)setWantsOverBackgroundAppearance:(BOOL)a3
{
  if (self->_wantsOverBackgroundAppearance != a3)
  {
    self->_wantsOverBackgroundAppearance = a3;
    if (a3) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }
    v5 = [(PXCuratedLibrarySectionHeaderLayout *)self alternateAppearanceMixAnimator];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PXCuratedLibrarySectionHeaderLayout_setWantsOverBackgroundAppearance___block_invoke;
    aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&aBlock[4] = v4;
    id v6 = _Block_copy(aBlock);
    [v5 presentationValue];
    double v8 = v7;
    if (self->_presentedTitleVisibility)
    {
      BOOL v9 = 0;
    }
    else
    {
      [(PXCuratedLibrarySectionHeaderLayout *)self titleAlpha];
      BOOL v9 = v10 > 0.0;
    }
    if (!self->_presentedVisibility
      || v9
      || v4 == v8
      || ([(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec],
          double v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v11 userInterfaceStyle],
          v11,
          v12 == 2))
    {
      [v5 performChangesWithoutAnimation:v6];
    }
    else
    {
      double v13 = +[PXCuratedLibrarySettings sharedInstance];
      [v13 floatingHeadersAppearanceCrossfadeDuration];
      double v15 = vabdd_f64(v4, v8) * v14;

      [v5 performChangesWithDuration:1 curve:v6 changes:v15];
    }
  }
}

uint64_t __72__PXCuratedLibrarySectionHeaderLayout_setWantsOverBackgroundAppearance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)setButtonsAlpha:(double)a3
{
  if (self->_buttonsAlpha != a3)
  {
    self->_buttonsAlpha = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setButtonsAlpha:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1602, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setTitleAlpha:(double)a3
{
  if (self->_titleAlpha != a3)
  {
    self->_titleAlpha = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1594, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setMaxPossibleHeight:(double)a3
{
  if (self->_maxPossibleHeight != a3)
  {
    self->_maxPossibleHeight = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setMaxPossibleHeight:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1586, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_handleAsyncDateDescription:(id)a3 title:(id)a4 subtitle:(id)a5 placement:(int64_t)a6 generation:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (self->_asyncDateGeneration == a7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__PXCuratedLibrarySectionHeaderLayout__handleAsyncDateDescription_title_subtitle_placement_generation___block_invoke;
    block[3] = &unk_1E5DAEF68;
    int64_t v20 = a7;
    int64_t v21 = a6;
    block[4] = self;
    SEL v22 = a2;
    id v17 = v13;
    id v18 = v15;
    id v19 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void *__103__PXCuratedLibrarySectionHeaderLayout__handleAsyncDateDescription_title_subtitle_placement_generation___block_invoke(void *a1)
{
  uint64_t v2 = a1[8];
  CGRect result = (void *)a1[4];
  if (v2 == result[144])
  {
    uint64_t v4 = a1[9];
    switch(v4)
    {
      case 1:
        [result setTitle:a1[5]];
        v5 = a1 + 6;
        break;
      case 2:
        [result setTitle:a1[7]];
        v5 = a1 + 5;
        break;
      case 0:
        double v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a1[10] object:a1[4] file:@"PXCuratedLibrarySectionHeaderLayout.m" lineNumber:1565 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
        return result;
    }
    uint64_t v6 = *v5;
    double v7 = (void *)a1[4];
    return (void *)[v7 setSubtitle:v6];
  }
  return result;
}

- (void)_updateTitleAndSubtitle
{
  CGSize v3 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
  uint64_t v4 = [(PXCuratedLibrarySectionHeaderLayout *)self assetCollectionReference];
  v5 = [v4 assetCollection];

  uint64_t v6 = [(PXCuratedLibrarySectionHeaderLayout *)self assetCollectionReference];

  if (!v6) {
    goto LABEL_40;
  }
  if ([v3 wantsTitle])
  {
    if ([v3 shouldOmitYear])
    {
      double v7 = @" ";
      uint64_t v8 = 1;
      uint64_t v9 = 2;
      goto LABEL_8;
    }
    double v7 = [v5 localizedDateDescription];
  }
  else
  {
    double v7 = 0;
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
LABEL_8:
  if ([v3 wantsSubtitle])
  {
    double v10 = [v5 localizedSmartDescription];
  }
  else
  {
    double v10 = 0;
  }
  uint64_t v11 = [v3 titleDateFormatter];
  uint64_t v12 = [v3 subtitleDateFormatter];
  if (!(v11 | v12)) {
    goto LABEL_19;
  }
  uint64_t v35 = v8;
  id v13 = [v5 startDate];
  id v14 = [v5 endDate];
  id v15 = v14;
  if (v13 && v14)
  {
    uint64_t v33 = v9;
    v34 = v5;
    [v14 timeIntervalSinceDate:v13];
    id v17 = [v13 dateByAddingTimeInterval:v16 * 0.5];
    if (v11)
    {
      uint64_t v18 = v11;
      uint64_t v19 = [(id)v11 stringFromDate:v17];

      double v7 = (__CFString *)v19;
      if (!v12)
      {
LABEL_17:
        uint64_t v11 = v18;

        uint64_t v9 = v33;
        v5 = v34;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v18 = 0;
      if (!v12) {
        goto LABEL_17;
      }
    }
    uint64_t v20 = [(id)v12 stringFromDate:v17];

    double v10 = (__CFString *)v20;
    goto LABEL_17;
  }
LABEL_18:

  uint64_t v8 = v35;
LABEL_19:
  if ([v3 swapTitleWithSubtitle])
  {
    uint64_t v21 = [(__CFString *)v10 length];
    if (v21) {
      SEL v22 = v7;
    }
    else {
      SEL v22 = v10;
    }
    if (v21) {
      double v7 = v10;
    }
    else {
      uint64_t v9 = v8;
    }
    double v10 = v22;
  }
  else
  {
    uint64_t v9 = v8;
  }
  if ([(PXCuratedLibrarySectionHeaderLayout *)self showsDebugDescription])
  {
    uint64_t v37 = v8;
    v30 = [v5 localizedDebugDescription];
    if (v30 && v10) {
      [NSString stringWithFormat:@"%@ (%@)", v10, v30];
    }
    else {
    uint64_t v31 = [NSString stringWithFormat:@"(%@)", v30, v32];
    }

    double v10 = (__CFString *)v31;
    uint64_t v8 = v37;
    if (v9 == 2) {
      goto LABEL_38;
    }
  }
  if (!v9)
  {
LABEL_38:
    [(PXCuratedLibrarySectionHeaderLayout *)self setTitle:v7];
    [(PXCuratedLibrarySectionHeaderLayout *)self setSubtitle:v10];
  }
  else
  {
    v36 = (void *)v9;
    uint64_t v23 = v12;
    BOOL v24 = v7;
    v25 = (void *)v8;
    v26 = (void *)(self->_asyncDateGeneration + 1);
    self->_asyncDateGeneration = (int64_t)v26;
    objc_initWeak(&location, self);
    uint64_t v27 = v11;
    asyncDateQueue = self->_asyncDateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PXCuratedLibrarySectionHeaderLayout__updateTitleAndSubtitle__block_invoke;
    block[3] = &unk_1E5DAEF40;
    id v39 = v5;
    v42[1] = v25;
    double v7 = v24;
    uint64_t v12 = v23;
    objc_copyWeak(v42, &location);
    v40 = v7;
    double v10 = v10;
    v41 = v10;
    v42[2] = v36;
    v42[3] = v26;
    v29 = asyncDateQueue;
    uint64_t v11 = v27;
    dispatch_async(v29, block);

    objc_destroyWeak(v42);
    objc_destroyWeak(&location);
  }

LABEL_40:
}

void __62__PXCuratedLibrarySectionHeaderLayout__updateTitleAndSubtitle__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) localizedDateDescriptionWithOptions:*(void *)(a1 + 64)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAsyncDateDescription:v3 title:*(void *)(a1 + 40) subtitle:*(void *)(a1 + 48) placement:*(void *)(a1 + 72) generation:*(void *)(a1 + 80)];
}

- (id)_effectiveTitleSubtitleLabelSpec:(id)a3
{
}

- (void)_updateEffectiveSpec
{
  id v16 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
  if ([(PXGLayout *)self referenceOptions])
  {
    uint64_t v4 = [v16 smallVariantSpec];
    if (v4) {
      v5 = v4;
    }
    else {
      v5 = v16;
    }
    id v3 = v5;
  }
  else
  {
    id v3 = v16;
  }
  [(PXCuratedLibrarySectionHeaderLayout *)self setEffectiveSpec:v3];
  if (([(PXGLayout *)self referenceOptions] & 8) != 0)
  {
    uint64_t v6 = [v16 firstCardVariantSpec];
    [(PXCuratedLibrarySectionHeaderLayout *)self setEffectiveSpec:v6];
  }
  double v7 = [v3 titleSubtitleLabelSpec];
  uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self _effectiveTitleSubtitleLabelSpec:v7];

  if (v8 != self->_effectiveTitleSubtitleLabelSpec)
  {
    objc_storeStrong((id *)&self->_effectiveTitleSubtitleLabelSpec, v8);
    if ([v3 userInterfaceStyle] == 2)
    {
      uint64_t v9 = v8;
      effectiveOverBackgroundTitleSubtitleLabelSpec = self->_effectiveOverBackgroundTitleSubtitleLabelSpec;
      self->_effectiveOverBackgroundTitleSubtitleLabelSpec = v9;
    }
    else
    {
      uint64_t v11 = (PXTitleSubtitleLabelSpec *)[(PXTitleSubtitleLabelSpec *)v8 copy];
      uint64_t v12 = self->_effectiveOverBackgroundTitleSubtitleLabelSpec;
      self->_effectiveOverBackgroundTitleSubtitleLabelSpec = v11;

      id v13 = [v3 titleSubtitleColorOverBackground];
      id v14 = [(PXTitleSubtitleLabelSpec *)self->_effectiveOverBackgroundTitleSubtitleLabelSpec titleLabelSpec];
      [v14 setTextColor:v13];

      effectiveOverBackgroundTitleSubtitleLabelSpec = [v3 titleSubtitleColorOverBackground];
      id v15 = [(PXTitleSubtitleLabelSpec *)self->_effectiveOverBackgroundTitleSubtitleLabelSpec subtitleLabelSpec];
      [v15 setTextColor:effectiveOverBackgroundTitleSubtitleLabelSpec];
    }
  }
}

- (void)setSubtitle:(id)a3
{
  id v14 = (NSString *)a3;
  v5 = self->_subtitle;
  if (v5 == v14)
  {

LABEL_10:
    uint64_t v8 = v14;
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  BOOL v7 = [(NSString *)v5 isEqualToString:v14];

  uint64_t v8 = v14;
  if (v7) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_subtitle, a3);
  ++self->_textVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setSubtitle:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXCuratedLibrarySectionHeaderLayout.m", 1442, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  uint64_t v8 = v14;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setTitle:(id)a3
{
  id v14 = (NSString *)a3;
  v5 = self->_title;
  if (v5 == v14)
  {

LABEL_10:
    uint64_t v8 = v14;
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  BOOL v7 = [(NSString *)v5 isEqualToString:v14];

  uint64_t v8 = v14;
  if (v7) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_title, a3);
  ++self->_textVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setTitle:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXCuratedLibrarySectionHeaderLayout.m", 1433, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  uint64_t v8 = v14;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setExternalTopButtonConfigurations:(id)a3
{
  id v15 = (NSArray *)a3;
  uint64_t v4 = self->_externalTopButtonConfigurations;
  if (v4 == v15)
  {

LABEL_10:
    BOOL v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  char v6 = [(NSArray *)v15 isEqual:v4];

  BOOL v7 = v15;
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSArray *)[(NSArray *)v15 copy];
  externalTopButtonConfigurations = self->_externalTopButtonConfigurations;
  self->_externalTopButtonConfigurations = v8;

  self->_cachedExternalTopButtonsSize = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setExternalTopButtonConfigurations:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibrarySectionHeaderLayout.m", 1422, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v15;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setExternalLeadingButtonConfigurations:(id)a3
{
  id v15 = (NSArray *)a3;
  uint64_t v4 = self->_externalLeadingButtonConfigurations;
  if (v4 == v15)
  {

LABEL_10:
    BOOL v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  char v6 = [(NSArray *)v15 isEqual:v4];

  BOOL v7 = v15;
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSArray *)[(NSArray *)v15 copy];
  externalLeadingButtonConfigurations = self->_externalLeadingButtonConfigurations;
  self->_externalLeadingButtonConfigurations = v8;

  self->_cachedExternalLeadingButtonsSize = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setExternalLeadingButtonConfigurations:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibrarySectionHeaderLayout.m", 1413, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v15;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setExternalTrailingButtonConfigurations:(id)a3
{
  id v15 = (NSArray *)a3;
  uint64_t v4 = self->_externalTrailingButtonConfigurations;
  if (v4 == v15)
  {

LABEL_10:
    BOOL v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  char v6 = [(NSArray *)v15 isEqual:v4];

  BOOL v7 = v15;
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSArray *)[(NSArray *)v15 copy];
  externalTrailingButtonConfigurations = self->_externalTrailingButtonConfigurations;
  self->_externalTrailingButtonConfigurations = v8;

  self->_cachedExternalTrailingButtonsSize = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setExternalTrailingButtonConfigurations:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibrarySectionHeaderLayout.m", 1404, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v15;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setToggleAspectFitCompactButtonSymbol:(int64_t)a3
{
  if (self->_toggleAspectFitCompactButtonSymbol != a3)
  {
    self->_toggleAspectFitCompactButtonSymbol = a3;
    ++self->_toggleAspectFitButtonVersion;
    self->_cachedSizeByButtonIdentifier[5] = *(CGSize *)off_1E5DAB030;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        BOOL v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitCompactButtonSymbol:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1395, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setToggleAspectFitButtonPossibleTitles:(id)a3
{
  id v13 = (NSSet *)a3;
  v5 = self->_toggleAspectFitButtonPossibleTitles;
  if (v5 == v13)
  {

LABEL_10:
    BOOL v7 = v13;
    goto LABEL_11;
  }
  char v6 = [(NSSet *)v13 isEqual:v5];

  BOOL v7 = v13;
  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_toggleAspectFitButtonPossibleTitles, a3);
  ++self->_toggleAspectFitButtonVersion;
  self->_cachedSizeByButtonIdentifier[4] = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonPossibleTitles:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibrarySectionHeaderLayout.m", 1385, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v13;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setToggleAspectFitButtonTitle:(id)a3
{
  id v13 = (NSString *)a3;
  v5 = self->_toggleAspectFitButtonTitle;
  if (v5 == v13)
  {

LABEL_10:
    BOOL v7 = v13;
    goto LABEL_11;
  }
  char v6 = [(NSString *)v13 isEqual:v5];

  BOOL v7 = v13;
  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_toggleAspectFitButtonTitle, a3);
  ++self->_toggleAspectFitButtonVersion;
  self->_cachedSizeByButtonIdentifier[4] = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonTitle:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibrarySectionHeaderLayout.m", 1375, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v13;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setLongestPossibleSelectionTitle:(id)a3
{
  id v15 = (NSString *)a3;
  uint64_t v4 = self->_longestPossibleSelectionTitle;
  if (v4 == v15)
  {

LABEL_10:
    BOOL v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  BOOL v6 = [(NSString *)v15 isEqualToString:v4];

  BOOL v7 = v15;
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSString *)[(NSString *)v15 copy];
  longestPossibleSelectionTitle = self->_longestPossibleSelectionTitle;
  self->_longestPossibleSelectionTitle = v8;

  self->_cachedLongestPossibleSelectionTitleSize = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setLongestPossibleSelectionTitle:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibrarySectionHeaderLayout.m", 1365, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v15;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setSelectionTitle:(id)a3
{
  id v15 = (NSString *)a3;
  uint64_t v4 = self->_selectionTitle;
  if (v4 == v15)
  {

LABEL_10:
    BOOL v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  BOOL v6 = [(NSString *)v15 isEqualToString:v4];

  BOOL v7 = v15;
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSString *)[(NSString *)v15 copy];
  selectionTitle = self->_selectionTitle;
  self->_selectionTitle = v8;

  ++self->_selectionTitleVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setSelectionTitle:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibrarySectionHeaderLayout.m", 1356, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v15;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_invalidateFilterButton
{
  ++self->_filterButtonVersion;
  self->_cachedSizeByButtonIdentifier[1] = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout _invalidateFilterButton]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibrarySectionHeaderLayout.m", 1347, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setFilterButtonHighlighted:(BOOL)a3
{
  if (self->_filterButtonHighlighted != a3)
  {
    self->_filterButtonHighlighted = a3;
    [(PXCuratedLibrarySectionHeaderLayout *)self _invalidateFilterButton];
  }
}

- (void)setFilterButtonTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  uint64_t v4 = self->_filterButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      filterButtonTitle = self->_filterButtonTitle;
      self->_filterButtonTitle = v6;

      [(PXCuratedLibrarySectionHeaderLayout *)self _invalidateFilterButton];
    }
  }
}

- (void)setFilterButtonCaption:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  uint64_t v4 = self->_filterButtonCaption;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      filterButtonCaption = self->_filterButtonCaption;
      self->_filterButtonCaption = v6;

      [(PXCuratedLibrarySectionHeaderLayout *)self _invalidateFilterButton];
    }
  }
}

- (void)setSelectButtonTitle:(id)a3
{
  id v15 = (NSString *)a3;
  uint64_t v4 = self->_selectButtonTitle;
  if (v4 == v15)
  {

LABEL_10:
    BOOL v7 = v15;
    goto LABEL_11;
  }
  BOOL v5 = v4;
  BOOL v6 = [(NSString *)v15 isEqualToString:v4];

  BOOL v7 = v15;
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSString *)[(NSString *)v15 copy];
  selectButtonTitle = self->_selectButtonTitle;
  self->_selectButtonTitle = v8;

  ++self->_selectButtonVersion;
  self->_cachedSizeByButtonIdentifier[2] = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_10;
    }
LABEL_8:
    if (self->_updateFlags.updated)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setSelectButtonTitle:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibrarySectionHeaderLayout.m", 1317, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  BOOL v7 = v15;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setControlStackButtonSelected:(BOOL)a3
{
  if (self->_controlStackButtonSelected != a3)
  {
    self->_controlStackButtonSelected = a3;
    ++self->_controlStackButtonVersion;
    ++self->_zoomInButtonVersion;
    ++self->_zoomOutButtonVersion;
    ++self->_toggleAspectFitButtonVersion;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
        BOOL v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setControlStackButtonSelected:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1306, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_invalidateEllipsisButton
{
  ++self->_ellipsisButtonVersion;
  self->_cachedSizeByButtonIdentifier[0] = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout _invalidateEllipsisButton]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibrarySectionHeaderLayout.m", 1295, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setEllipsisButtonHighlighted:(BOOL)a3
{
  if (self->_ellipsisButtonHighlighted != a3)
  {
    self->_ellipsisButtonHighlighted = a3;
    [(PXCuratedLibrarySectionHeaderLayout *)self _invalidateEllipsisButton];
  }
}

- (void)setShowSidebarButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryActionPerformer *)a3;
  BOOL v5 = self->_showSidebarButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_showSidebarButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_showSidebarButtonActionPerformer, a3);
          ++self->_showSidebarButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setShowSidebarButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1277, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setShowSidebarButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setToggleAspectFitButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryActionPerformer *)a3;
  BOOL v5 = self->_toggleAspectFitButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_toggleAspectFitButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_toggleAspectFitButtonActionPerformer, a3);
          ++self->_toggleAspectFitButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1268, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setZoomOutButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryActionPerformer *)a3;
  BOOL v5 = self->_zoomOutButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_zoomOutButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_zoomOutButtonActionPerformer, a3);
          ++self->_zoomOutButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setZoomOutButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1259, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setZoomOutButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setZoomInButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryActionPerformer *)a3;
  BOOL v5 = self->_zoomInButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_zoomInButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_zoomInButtonActionPerformer, a3);
          ++self->_zoomInButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setZoomInButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1250, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setZoomInButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setCancelButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryActionPerformer *)a3;
  BOOL v5 = self->_cancelButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_cancelButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_cancelButtonActionPerformer, a3);
          ++self->_cancelButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setCancelButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1240, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setCancelButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setSelectButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryActionPerformer *)a3;
  BOOL v5 = self->_selectButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_selectButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_selectButtonActionPerformer, a3);
          ++self->_selectButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setSelectButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1230, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setSelectButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setShowFiltersActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryShowFiltersActionPerformer *)a3;
  BOOL v5 = self->_showFiltersActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryShowFiltersActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_showFiltersActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_showFiltersActionPerformer, a3);
          ++self->_filterButtonVersion;
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setShowFiltersActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1220, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setShowFiltersActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)setEllipsisButtonActionPerformer:(id)a3
{
  id v17 = (PXCuratedLibraryEllipsisButtonActionPerformer *)a3;
  BOOL v5 = self->_ellipsisButtonActionPerformer;
  if (v5 != v17)
  {
    BOOL v6 = v17;
    char v7 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)v6 isEqual:v5];

    uint64_t v8 = v17;
    if (v7) {
      goto LABEL_21;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_ellipsisButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          uint64_t v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->unint64_t needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_ellipsisButtonActionPerformer, a3);
          ++self->_ellipsisButtonVersion;
          [(PXCuratedLibraryEllipsisButtonActionPerformer *)v6 setLayout:self];
          goto LABEL_20;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonActionPerformer:]"];
        uint64_t v16 = 8;
LABEL_30:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXCuratedLibrarySectionHeaderLayout.m", 1208, @"invalidating %lu after it already has been updated", v16);

        abort();
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 8;
LABEL_26:
      p_updateFlags->unint64_t needsUpdate = v13;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_17;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v13 = 1;
      goto LABEL_26;
    }
    if (self->_updateFlags.updated)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonActionPerformer:]"];
      uint64_t v16 = 1;
      goto LABEL_30;
    }
LABEL_17:
    uint64_t v11 = needsUpdate | 1;
    goto LABEL_18;
  }

LABEL_20:
  uint64_t v8 = v17;
LABEL_21:
}

- (void)_updateLastBaseline
{
  [(PXCuratedLibrarySectionHeaderLayout *)self buttonsMaxY];
  double v4 = v3;
  [(PXCuratedLibrarySectionHeaderLayout *)self titleSubtitleTopSpacing];
  double v6 = v5;
  [(PXCuratedLibrarySectionHeaderLayout *)self titleSubtitleLastBaseline];
  double v8 = v6 + v7;
  if (v4 >= v8) {
    double v8 = v4;
  }
  [(PXGLayout *)self setLastBaseline:v8];
}

- (void)setTitleSubtitleTopSpacing:(double)a3
{
  if (self->_titleSubtitleTopSpacing != a3)
  {
    self->_titleSubtitleTopSpacing = a3;
    [(PXCuratedLibrarySectionHeaderLayout *)self _updateLastBaseline];
  }
}

- (void)setTitleSubtitleLastBaseline:(double)a3
{
  if (self->_titleSubtitleLastBaseline != a3)
  {
    self->_titleSubtitleLastBaseline = a3;
    [(PXCuratedLibrarySectionHeaderLayout *)self _updateLastBaseline];
  }
}

- (void)setButtonsMaxY:(double)a3
{
  if (self->_buttonsMaxY != a3)
  {
    self->_buttonsMaxY = a3;
    [(PXCuratedLibrarySectionHeaderLayout *)self _updateLastBaseline];
  }
}

- (void)setShowsDebugDescription:(BOOL)a3
{
  if (self->_showsDebugDescription != a3)
  {
    self->_showsDebugDescription = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setShowsDebugDescription:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1162, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setShowsBackgroundGradient:(BOOL)a3
{
  if (self->_showsBackgroundGradient != a3)
  {
    self->_showsBackgroundGradient = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setShowsBackgroundGradient:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1154, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setLateralMargin:(double)a3
{
  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setLateralMargin:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1146, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setEffectiveSpec:(id)a3
{
  double v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_effectiveSpec != v5)
  {
    uint64_t v11 = v5;
    objc_storeStrong((id *)&self->_effectiveSpec, a3);
    ++self->_textVersion;
    ++self->_ellipsisButtonVersion;
    ++self->_selectButtonVersion;
    ++self->_cancelButtonVersion;
    ++self->_toggleAspectFitButtonVersion;
    ++self->_zoomInButtonVersion;
    ++self->_zoomOutButtonVersion;
    ++self->_controlStackButtonVersion;
    ++self->_showSidebarButtonVersion;
    ++self->_filterButtonVersion;
    [(PXCuratedLibrarySectionHeaderLayout *)self _discardAllCachedButtonSizes];
    [(PXCuratedLibrarySectionHeaderLayout *)self setControlStackButtonSelected:0];
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 5;
LABEL_8:
        double v5 = v11;
        goto LABEL_9;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 5) != 0)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        double v10 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setEffectiveSpec:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXCuratedLibrarySectionHeaderLayout.m", 1138, @"invalidating %lu after it already has been updated", 5);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 5;
    double v5 = v11;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)setSpec:(id)a3
{
  double v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    uint64_t v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
LABEL_8:
        double v5 = v11;
        goto LABEL_9;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x20) != 0)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        double v10 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setSpec:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXCuratedLibrarySectionHeaderLayout.m", 1115, @"invalidating %lu after it already has been updated", 32);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 32;
    double v5 = v11;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)setAssetCollectionReference:(id)a3
{
  uint64_t v18 = (PXAssetCollectionReference *)a3;
  p_assetCollectionReference = &self->_assetCollectionReference;
  double v6 = self->_assetCollectionReference;
  double v7 = v18;
  if (v6 == v18) {
    goto LABEL_12;
  }
  char v8 = [(PXAssetCollectionReference *)v18 isEqual:v6];

  if (v8) {
    goto LABEL_13;
  }
  double v7 = *p_assetCollectionReference;
  objc_storeStrong((id *)&self->_assetCollectionReference, a3);
  id v9 = [(PXAssetCollectionReference *)v7 assetCollection];
  id v10 = [(PXAssetCollectionReference *)*p_assetCollectionReference assetCollection];
  if (v9 == v10)
  {
  }
  else
  {
    uint64_t v11 = v10;
    char v12 = [v9 isEqual:v10];

    if ((v12 & 1) == 0)
    {
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_11:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
          goto LABEL_12;
        }
      }
      else if (!self->_updateFlags.isPerformingUpdate)
      {
        BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
        p_updateFlags->unint64_t needsUpdate = 4;
        if (!willPerformUpdate) {
          [(PXGLayout *)self setNeedsUpdate];
        }
        goto LABEL_12;
      }
      if ((self->_updateFlags.updated & 4) != 0)
      {
        uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
        id v17 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout setAssetCollectionReference:]"];
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"PXCuratedLibrarySectionHeaderLayout.m", 1106, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_11;
    }
  }
LABEL_12:

LABEL_13:
}

- (void)alphaDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v8 alphaDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout alphaDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1094, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1089, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceOptionsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v8 referenceOptionsDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout referenceOptionsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1084, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionHeaderLayout.m", 1079, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)safeAreaInsetsDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v9 safeAreaInsetsDidChange];
  double v3 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
  if (([v3 shouldTextFadeOutWhenReachingTop] & 1) != 0
    || [v3 shouldButtonsFadeOutWhenReachingTop])
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        double v7 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v8 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout safeAreaInsetsDidChange]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXCuratedLibrarySectionHeaderLayout.m", 1073, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_7;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_9:
}

- (void)visibleRectDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v10 visibleRectDidChange];
  double v3 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
  if ([(PXCuratedLibrarySectionHeaderLayout *)self safeAreaBehavior])
  {
    p_updateFlags = &self->_updateFlags;
    if (self->_updateFlags.needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate |= 1uLL;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v9 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout visibleRectDidChange]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXCuratedLibrarySectionHeaderLayout.m", 1062, @"invalidating %lu after it already has been updated", 1);
        goto LABEL_23;
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
  if (([v3 shouldTextFadeOutWhenReachingTop] & 1) != 0
    || [v3 shouldButtonsFadeOutWhenReachingTop])
  {
    double v5 = &self->_updateFlags;
    if (self->_updateFlags.needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_14:
      if ((self->_updateFlags.updated & 2) == 0)
      {
LABEL_15:
        v5->needsUpdate |= 2uLL;
        goto LABEL_16;
      }
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v9 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout visibleRectDidChange]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXCuratedLibrarySectionHeaderLayout.m", 1065, @"invalidating %lu after it already has been updated", 2);
LABEL_23:

      abort();
    }
    BOOL v6 = self->_updateFlags.willPerformUpdate;
    v5->unint64_t needsUpdate = 2;
    if (!v6) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_16:
}

- (void)setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a3.origin.y <= 0.0)
  {
    [(PXGLayout *)self visibleRect];
    BOOL v8 = v9 > 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (y <= 0.0)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(PXGLayout *)self visibleRect];
    BOOL v11 = v10 <= 0.0;
  }
  int v12 = v8 || v11;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout setVisibleRect:](&v13, sel_setVisibleRect_, x, y, width, height);
  if (v12 == 1) {
    ++self->_ellipsisButtonVersion;
  }
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [v8 actionType];
    if ([v9 isEqualToString:@"PXCuratedLibraryActionEllipsisButton"])
    {
      if (self->_wantsOverBackgroundAppearance) {
        double v10 = @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground";
      }
      else {
        double v10 = @"PXCuratedLibrarySectionHeaderItemEllipsisButton";
      }
      unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:v10];
      int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self ellipsisButtonActionPerformer];
    }
    else
    {
      if ([v9 isEqualToString:@"PXCuratedLibraryActionShowFilters"])
      {
        objc_super v13 = +[PXPhotosGridSettings sharedInstance];
        if ([v13 enableFilterDropDownButton])
        {
          id v14 = @"PXCuratedLibrarySectionHeaderItemFilterButton";
        }
        else if ([v13 enableNewActionMenu])
        {
          id v14 = @"PXCuratedLibrarySectionHeaderItemEllipsisButton";
        }
        else
        {
          id v14 = 0;
        }
        unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:v14];
        *a5 = [(PXCuratedLibrarySectionHeaderLayout *)self showFiltersActionPerformer];

        goto LABEL_18;
      }
      if ([v9 isEqualToString:@"PXCuratedLibraryActionEnterSelectMode"])
      {
        unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:@"PXCuratedLibrarySectionHeaderItemSelectButton"];
        int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self selectButtonActionPerformer];
      }
      else if ([v9 isEqualToString:@"PXCuratedLibraryActionCancelSelectMode"])
      {
        unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:@"PXCuratedLibrarySectionHeaderItemCancelButton"];
        int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self cancelButtonActionPerformer];
      }
      else if ([v9 isEqualToString:@"PXCuratedLibraryActionAllPhotosToggleAspectFit"])
      {
        unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:@"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"];
        int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButtonActionPerformer];
      }
      else if ([v9 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomIn"])
      {
        unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:@"PXCuratedLibrarySectionHeaderItemZoomInButton"];
        int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self zoomInButtonActionPerformer];
      }
      else
      {
        if (![v9 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomOut"])
        {
          if ([v9 isEqualToString:@"PXCuratedLibraryActionShowSidebar"])
          {
            unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:@"PXCuratedLibrarySectionHeaderItemShowSidebarButton"];
            *a5 = [(PXCuratedLibrarySectionHeaderLayout *)self showSidebarButtonActionPerformer];
          }
          else
          {
            unsigned int v11 = -1;
          }
          goto LABEL_18;
        }
        unsigned int v11 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexOfObject:@"PXCuratedLibrarySectionHeaderItemZoomOutButton"];
        int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self zoomOutButtonActionPerformer];
      }
    }
    *a5 = v12;
LABEL_18:

    goto LABEL_19;
  }
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  unsigned int v11 = [(PXGLayout *)&v16 spriteIndexForObjectReference:v8 options:a4 updatedObjectReference:a5];
LABEL_19:

  return v11;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(NSArray *)self->_itemIdentifierBySpriteIndex count] <= a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
    double v9 = [(PXGLayout *)&v14 objectReferenceForSpriteIndex:v3];
    goto LABEL_42;
  }
  double v5 = [(NSArray *)self->_itemIdentifierBySpriteIndex objectAtIndexedSubscript:v3];
  BOOL v6 = v5;
  if (v5 == @"PXCuratedLibrarySectionHeaderItemEllipsisButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self ellipsisButtonActionPerformer];
LABEL_40:
    double v9 = (void *)v8;
    goto LABEL_41;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemFilterButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self showFiltersActionPerformer];
    goto LABEL_40;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemSelectButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self selectButtonActionPerformer];
    goto LABEL_40;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemCancelButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self cancelButtonActionPerformer];
    goto LABEL_40;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self toggleAspectFitButtonActionPerformer];
    goto LABEL_40;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemZoomInButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self zoomInButtonActionPerformer];
    goto LABEL_40;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemZoomOutButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self zoomOutButtonActionPerformer];
    goto LABEL_40;
  }
  if (v5 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButton"
    || v5 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground")
  {
    uint64_t v8 = [(PXCuratedLibrarySectionHeaderLayout *)self showSidebarButtonActionPerformer];
    goto LABEL_40;
  }
  double v9 = 0;
LABEL_41:

LABEL_42:
  return v9;
}

- (id)_selectionTitleLabelConfigurationWithTitle:(id)a3 spec:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = objc_alloc_init(PXCuratedLibraryLabelConfiguration);
  [(PXCuratedLibraryLabelConfiguration *)v7 setText:v6];

  [(PXCuratedLibraryLabelConfiguration *)v7 setTextAlignment:2];
  uint64_t v8 = [v5 titleLabelSpec];

  double v9 = [v8 textColor];
  [(PXCuratedLibraryLabelConfiguration *)v7 setTextColor:v9];

  return v7;
}

- (unint64_t)toggleAspectFitButton
{
  if (self->_usesCompactToggleAspectFitButton) {
    return 5;
  }
  else {
    return 4;
  }
}

- (void)setUsesCompactToggleAspectFitButton:(BOOL)a3
{
  if (self->_usesCompactToggleAspectFitButton != a3)
  {
    self->_usesCompactToggleAspectFitButton = a3;
    ++self->_toggleAspectFitButtonVersion;
  }
}

- (UIEdgeInsets)safeAreaInsetsWithCurrentBehavior
{
  [(PXGLayout *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(PXCuratedLibrarySectionHeaderLayout *)self safeAreaBehavior];
  switch(v11)
  {
    case 2:
      int v12 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
      [v12 minimumSpacingBetweenTopSafeAreaAndContentTop];
      double v14 = v13;
      uint64_t v15 = [v12 userInterfaceIdiom];
      uint64_t v16 = [v12 layoutOrientation];
      char v17 = [v12 ellipsisButtonSpecialTreatment];
      if (v15 == 1 && v16 == 2 && (v17 & 1) == 0)
      {
        [v12 contentPadding];
        double v4 = v18;
      }
      else
      {
        [(PXGLayout *)self visibleRect];
        if (v14 + v4 + v20 >= v4 + v14) {
          double v4 = v4 + v14;
        }
        else {
          double v4 = v14 + v4 + v20;
        }
      }

      break;
    case 1:
      uint64_t v19 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
      [v19 minimumSpacingBetweenTopSafeAreaAndContentTop];

      [(PXGLayout *)self visibleRect];
      PXClamp();
    case 0:
      double v4 = *(double *)off_1E5DAAF10;
      double v6 = *((double *)off_1E5DAAF10 + 1);
      double v8 = *((double *)off_1E5DAAF10 + 2);
      double v10 = *((double *)off_1E5DAAF10 + 3);
      break;
  }
  double v21 = v4;
  double v22 = v6;
  double v23 = v8;
  double v24 = v10;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)_updateSpritesAlpha
{
  [(PXGLayout *)self alpha];
  double v4 = v3;
  [(PXCuratedLibrarySectionHeaderLayout *)self titleAlpha];
  double v6 = v5;
  [(PXCuratedLibrarySectionHeaderLayout *)self buttonsAlpha];
  double v8 = v7;
  double v9 = [(PXCuratedLibrarySectionHeaderLayout *)self spec];
  if (([v9 shouldTextFadeOutWhenReachingTop] & 1) != 0
    || [v9 shouldButtonsFadeOutWhenReachingTop])
  {
    [(PXGLayout *)self visibleRect];
    CGRectGetMinY(v33);
    [(PXGLayout *)self safeAreaInsets];
    [v9 fadeOutDistanceFromSafeAreaTop];
    [v9 fadeOutDistance];
    PXClamp();
  }
  double v10 = v8;
  float v11 = dbl_1AB359AC0[v8 < 1.0];
  if (v6 >= v4) {
    double v12 = v4;
  }
  else {
    double v12 = v6;
  }
  double v13 = [(PXCuratedLibrarySectionHeaderLayout *)self alternateAppearanceMixAnimator];
  [v13 presentationValue];
  uint64_t v15 = v14;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
  aBlock[4] = v15;
  uint64_t v16 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_2;
  v31[3] = &__block_descriptor_40_e8_d16__0d8l;
  v31[4] = v15;
  char v17 = _Block_copy(v31);
  uint64_t v18 = [(PXGLayout *)self numberOfSprites];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_3;
  v25[3] = &unk_1E5DAEEF0;
  uint64_t v19 = v18 << 32;
  v25[4] = self;
  id v26 = v16;
  id v27 = v17;
  double v28 = v12;
  double v29 = v10;
  float v30 = v11;
  id v20 = v17;
  id v21 = v16;
  [(PXGLayout *)self modifySpritesInRange:v19 state:v25];
  unsigned int v22 = [(PXGLayout *)self localNumberOfSprites];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_4;
  v23[3] = &unk_1E5DAEF18;
  v23[4] = self;
  unsigned int v24 = v22;
  *(double *)&v23[5] = v4;
  *(double *)&v23[6] = v12;
  [(PXGLayout *)self installLayoutCompletionBlock:v23];
}

double __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke(uint64_t a1, double a2)
{
  return (1.0 - *(double *)(a1 + 32)) * a2;
}

double __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_2(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) * a2;
}

void __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v6 = a2;
    uint64_t v28 = a1 + 40;
    uint64_t v8 = a1 + 48;
    while (1)
    {
      double v9 = [*(id *)(*(void *)(a1 + 32) + 896) objectAtIndexedSubscript:v6];
      float v11 = v9;
      if (v9 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitle"
        || v9 == @"PXCuratedLibrarySectionHeaderItemSelectionTitle")
      {
        break;
      }
      if (v9 == @"PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground"
        || v9 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground")
      {
        uint64_t v13 = *(void *)(a1 + 48);
        goto LABEL_15;
      }
      BOOL v23 = v9 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemZoomOutButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemZoomInButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemSelectButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemCancelButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemControlStackButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemEllipsisButton"
         || v9 == @"PXCuratedLibrarySectionHeaderItemFilterButton";
      uint64_t v24 = v28;
      if (v23) {
        goto LABEL_55;
      }
      uint64_t v24 = v8;
      if (v9 == @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground") {
        goto LABEL_55;
      }
      uint64_t v24 = v8;
      if (v9 == @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground"
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground")
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground")
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground")
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground")
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground")
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground")
        || (uint64_t v24 = v8, v9 == @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"))
      {
LABEL_55:
        float v25 = (*(double (**)(double))(*(void *)v24 + 16))(*(double *)(a1 + 64));
        *(float *)(a4 + 160 * v6) = v25;
        *(double *)(a3 + 32 * v6 + 16) = *(float *)(a1 + 72);
        goto LABEL_17;
      }
      if (v9 == @"PXCuratedLibrarySectionHeaderItemGradient")
      {
        uint64_t v26 = *(void *)(a1 + 40);
        [*(id *)(a1 + 32) gradientAlpha];
        uint64_t v13 = v26;
        goto LABEL_16;
      }
LABEL_17:

      ++v6;
      if (!--v4) {
        return;
      }
    }
    uint64_t v13 = *(void *)(a1 + 40);
LABEL_15:
    v10.n128_u64[0] = *(void *)(a1 + 56);
LABEL_16:
    float v15 = (*(double (**)(__n128))(v13 + 16))(v10);
    *(float *)(a4 + 160 * v6) = v15;
    goto LABEL_17;
  }
}

uint64_t __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_4(uint64_t result)
{
  BOOL v1 = *(double *)(result + 40) > 0.0 && *(_DWORD *)(result + 56) != 0;
  *(unsigned char *)(*(void *)(result + 32) + 904) = v1;
  *(unsigned char *)(*(void *)(result + 32) + 905) = *(double *)(result + 48) > 0.0;
  return result;
}

- (void)_updateSpriteTags
{
  if (_updateSpriteTags_onceToken != -1) {
    dispatch_once(&_updateSpriteTags_onceToken, &__block_literal_global_319);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  double v3 = [(PXCuratedLibrarySectionHeaderLayout *)self assetCollectionReference];
  unint64_t v4 = v3;
  if (v3)
  {
    [v3 indexPath];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }

  NSUInteger v5 = [(NSArray *)self->_itemIdentifierBySpriteIndex count];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  long long v7 = v9;
  long long v8 = v10;
  v6[2] = __56__PXCuratedLibrarySectionHeaderLayout__updateSpriteTags__block_invoke_342;
  v6[3] = &unk_1E5DC8C48;
  v6[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v5 << 32 state:v6];
}

uint64_t __56__PXCuratedLibrarySectionHeaderLayout__updateSpriteTags__block_invoke_342(uint64_t result, unint64_t a2)
{
  if (HIDWORD(a2))
  {
    [*(id *)(*(void *)(result + 32) + 896) objectAtIndexedSubscript:a2];
    uint64_t v2 = [(id)_updateSpriteTags_itemIDToSpriteKindMap objectForKeyedSubscript:objc_claimAutoreleasedReturnValue()];
    [v2 integerValue];

    PXGSectionedSpriteTagMake();
  }
  return result;
}

void __56__PXCuratedLibrarySectionHeaderLayout__updateSpriteTags__block_invoke()
{
  v3[21] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXCuratedLibrarySectionHeaderItemGradient";
  v2[1] = @"PXCuratedLibrarySectionHeaderItemTitleSubtitle";
  v3[0] = &unk_1F02D57D0;
  v3[1] = &unk_1F02D57E8;
  v2[2] = @"PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground";
  v2[3] = @"PXCuratedLibrarySectionHeaderItemEllipsisButton";
  v3[2] = &unk_1F02D57E8;
  v3[3] = &unk_1F02D5800;
  v2[4] = @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground";
  v2[5] = @"PXCuratedLibrarySectionHeaderItemFilterButton";
  v3[4] = &unk_1F02D5800;
  v3[5] = &unk_1F02D5818;
  v2[6] = @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground";
  v2[7] = @"PXCuratedLibrarySectionHeaderItemSelectButton";
  v3[6] = &unk_1F02D5818;
  v3[7] = &unk_1F02D5830;
  v2[8] = @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground";
  v2[9] = @"PXCuratedLibrarySectionHeaderItemCancelButton";
  v3[8] = &unk_1F02D5830;
  v3[9] = &unk_1F02D5848;
  v2[10] = @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground";
  v2[11] = @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton";
  v3[10] = &unk_1F02D5848;
  v3[11] = &unk_1F02D5860;
  v2[12] = @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground";
  v2[13] = @"PXCuratedLibrarySectionHeaderItemZoomInButton";
  v3[12] = &unk_1F02D5860;
  v3[13] = &unk_1F02D5878;
  v2[14] = @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground";
  v2[15] = @"PXCuratedLibrarySectionHeaderItemZoomOutButton";
  v3[14] = &unk_1F02D5878;
  v3[15] = &unk_1F02D5890;
  v2[16] = @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground";
  v2[17] = @"PXCuratedLibrarySectionHeaderItemControlStackButton";
  v3[16] = &unk_1F02D5890;
  v3[17] = &unk_1F02D58A8;
  v2[18] = @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground";
  v2[19] = @"PXCuratedLibrarySectionHeaderItemShowSidebarButton";
  v3[18] = &unk_1F02D58A8;
  v3[19] = &unk_1F02D58C0;
  v2[20] = @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground";
  v3[20] = &unk_1F02D58C0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:21];
  BOOL v1 = (void *)_updateSpriteTags_itemIDToSpriteKindMap;
  _updateSpriteTags_itemIDToSpriteKindMap = v0;
}

- (void)_updateButtonActionPerformers
{
  if (_updateButtonActionPerformers_onceToken != -1) {
    dispatch_once(&_updateButtonActionPerformers_onceToken, &__block_literal_global_311);
  }
  double v3 = [(NSArray *)self->_itemIdentifierBySpriteIndex indexesOfObjectsPassingTest:&__block_literal_global_315];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_3;
  v4[3] = &unk_1E5DBA978;
  v4[4] = self;
  [(PXGLayout *)self modifySpritesAtIndexes:v3 state:v4];
}

void __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    int v7 = a2;
    uint64_t v9 = 0;
    float v15 = v19;
    do
    {
      long long v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 896), "objectAtIndexedSubscript:", (v7 + v9), v15);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      v19[0] = __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_4;
      v19[1] = &unk_1E5DAEE80;
      id v20 = v10;
      uint64_t v21 = a5;
      uint64_t v22 = v9;
      id v11 = v10;
      double v12 = _Block_copy(aBlock);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_5;
      v16[3] = &unk_1E5DAEEA8;
      id v17 = v12;
      id v13 = v12;
      uint64_t v14 = (void (**)(void *, __CFString *, __CFString *, void))_Block_copy(v16);
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemEllipsisButton", @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 874));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemFilterButton", @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 876));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemControlStackButton", @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 890));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemSelectButton", @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 880));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemCancelButton", @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 882));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton", @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 884));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemZoomInButton", @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 886));
      v14[2](v14, @"PXCuratedLibrarySectionHeaderItemZoomOutButton", @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 888));

      ++v9;
    }
    while (v5 != v9);
  }
}

void *__68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_4(void *result, uint64_t a2, __int16 a3)
{
  if (result[4] == a2) {
    *(_WORD *)(result[5] + 40 * result[6] + 32) = a3;
  }
  return result;
}

void __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  id v9 = a3;
  v8(v7, a2, a4);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [(id)_updateButtonActionPerformers_buttonIDs containsObject:a2];
}

void __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke()
{
  v2[18] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXCuratedLibrarySectionHeaderItemEllipsisButton";
  v2[1] = @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground";
  v2[2] = @"PXCuratedLibrarySectionHeaderItemFilterButton";
  v2[3] = @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground";
  v2[4] = @"PXCuratedLibrarySectionHeaderItemControlStackButton";
  v2[5] = @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground";
  v2[6] = @"PXCuratedLibrarySectionHeaderItemZoomInButton";
  v2[7] = @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground";
  v2[8] = @"PXCuratedLibrarySectionHeaderItemZoomOutButton";
  v2[9] = @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground";
  v2[10] = @"PXCuratedLibrarySectionHeaderItemSelectButton";
  v2[11] = @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground";
  v2[12] = @"PXCuratedLibrarySectionHeaderItemCancelButton";
  v2[13] = @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground";
  v2[14] = @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton";
  v2[15] = @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground";
  v2[16] = @"PXCuratedLibrarySectionHeaderItemShowSidebarButton";
  v2[17] = @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:18];
  BOOL v1 = (void *)_updateButtonActionPerformers_buttonIDs;
  _updateButtonActionPerformers_buttonIDs = v0;
}

- (void)_updateSprites
{
  +[PXCuratedLibrarySettings sharedInstance];
  objc_claimAutoreleasedReturnValue();
  +[PXPhotosGridSettings sharedInstance];
  objc_claimAutoreleasedReturnValue();
  double v3 = [(PXCuratedLibrarySectionHeaderLayout *)self effectiveSpec];
  [v3 styleGuide];
  objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [(PXCuratedLibrarySectionHeaderLayout *)self assetCollectionReference];
  unint64_t v5 = v4;
  if (v4) {
    [v4 indexPath];
  }

  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self displayScale];
  [(PXCuratedLibrarySectionHeaderLayout *)self safeAreaInsetsWithCurrentBehavior];
  [(PXCuratedLibrarySectionHeaderLayout *)self maxPossibleHeight];
  [v3 contentSizeCategory];
  [v3 sizeClass];
  [v3 padding];
  [v3 contentPadding];
  PXEdgeInsetsAdd();
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke()
{
}

double __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return *MEMORY[0x1E4F1DB28];
  }
  [*(id *)(a1 + 32) _sizeOfButton:a2];
  double v6 = v5;
  double v8 = v7;
  double v9 = *(double *)(a1 + 96);
  [*(id *)(a1 + 40) buttonSpacing];
  double v11 = v10;
  switch(a2)
  {
    case 1:
      double v12 = CGRectGetMaxX(*(CGRect *)(a1 + 88)) - v6;
      double v13 = v9 + *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      [*(id *)(a1 + 40) buttonHorizontalPadding];
      int v14 = 0;
      double v9 = v13 + v15;
      goto LABEL_14;
    case 2:
    case 3:
    case 4:
    case 5:
      double v11 = v10;
      if (*(unsigned char *)(a1 + 120)) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 6:
      double v11 = v10;
      if (*(unsigned char *)(a1 + 120)) {
        goto LABEL_10;
      }
      double v10 = 1.0;
      goto LABEL_11;
    case 7:
      double v11 = 1.0;
      if (*(unsigned char *)(a1 + 120)) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 9:
LABEL_10:
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      double v12 = *(double *)(v16 + 24);
      *(double *)(v16 + 24) = v6 + v12;
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
      int v14 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_14;
    default:
LABEL_11:
      int v14 = 0;
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 24)
                                                                  - v6;
      if (!a2) {
        double v9 = v9 + 0.0;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
      double v12 = *(double *)(v17 + 24);
      *(double *)(v17 + 24) = v12 - v10;
LABEL_14:
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = fmax(v8 + v9 - *(double *)(a1 + 96), *(double *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      if (v14)
      {
        v19.origin.double x = v12;
        v19.origin.double y = v9;
        v19.size.double width = v6;
        v19.size.double height = v8;
        *(CGRect *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 80)+ 8)+ 32), v19);
      }
      break;
  }
  return v12;
}

uint64_t __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRect:inLayout:", *(void *)(a1 + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) gradientHeight];
  [*(id *)(a1 + 32) maximumTitleSubtitleHeight];
  if ([*(id *)(a1 + 40) safeAreaBehavior] == 1
    || [*(id *)(a1 + 40) safeAreaBehavior] == 2)
  {
    [*(id *)(a1 + 40) safeAreaInsets];
    double v4 = v3;
    [*(id *)(a1 + 32) minimumSpacingBetweenTopSafeAreaAndContentTop];
    double v2 = v4 + v5;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if ([*(id *)(a1 + 32) shouldAccommodateLeadingButtonsLayout]) {
      double v2 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "padding", v2);
  PXEdgeInsetsInsetRect();
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_5(id *a1)
{
  [a1[4] buttonSpacing];
  [a1[4] buttonHorizontalPadding];
  if ([a1[4] shouldAvoidOverlapWithSecondaryToolbar])
  {
    if ([a1[5] secondaryToolbarPlacement] == 3)
    {
      [a1[6] referenceSize];
      [a1[5] secondaryToolbarSize];
      [a1[5] secondaryToolbarPadding];
    }
  }
  [a1[4] minimumSpacingBetweenTopSafeAreaAndTitleTop];
  double v3 = v2;
  [a1[4] titlePadding];
  [a1[6] setTitleSubtitleTopSpacing:v3 + v4];
  [a1[4] minimumSpacingBetweenTopSafeAreaAndTitleTop];
  [a1[4] minimumSpacingBetweenTopSafeAreaAndContentTop];
  [a1[4] titlePadding];
  PXEdgeInsetsInsetRect();
}

uint64_t __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_6(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  id v9 = a3;
  v8(v7, a2, a4);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v8 = a2;
    double v10 = (long long *)(a1 + 120);
    long long v84 = *(_OWORD *)off_1E5DAAF30;
    v89 = (long long *)(a1 + 216);
    v91 = (long long *)(a1 + 120);
    do
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 896), "objectAtIndexedSubscript:", v8, v84);
      double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v11 == @"PXCuratedLibrarySectionHeaderItemGradient")
      {
        uint64_t v17 = (float32x2_t *)(a3 + 32 * v8);
        CGFloat v18 = *(double *)(a1 + 48);
        CGFloat v19 = *(double *)(a1 + 56);
        CGFloat v20 = *(double *)(a1 + 64);
        CGFloat v21 = *(double *)(a1 + 72);
        v107.origin.double x = v18;
        v107.origin.double y = v19;
        v107.size.double width = v20;
        v107.size.double height = v21;
        CGFloat MidX = CGRectGetMidX(v107);
        v108.origin.double x = v18;
        v108.origin.double y = v19;
        v108.size.double width = v20;
        v108.size.double height = v21;
        CGFloat MidY = CGRectGetMidY(v108);
        v109.origin.double x = v18;
        v109.origin.double y = v19;
        v109.size.double width = v20;
        v109.size.double height = v21;
        CGFloat Width = CGRectGetWidth(v109);
        v110.origin.double x = v18;
        v110.origin.double y = v19;
        v110.size.double width = v20;
        v110.size.double height = v21;
        CGFloat Height = CGRectGetHeight(v110);
        v25.f64[0] = Width;
        v25.f64[1] = Height;
        *(CGFloat *)uint64_t v17 = MidX;
        *(CGFloat *)&v17[1] = MidY;
        v17[3] = vcvt_f32_f64(v25);
        v17[2] = (float32x2_t)0xBFECCCCCCCCCCCCDLL;
        uint64_t v26 = a4 + 160 * v8;
        long long v27 = *((_OWORD *)off_1E5DAAF90 + 7);
        *(_OWORD *)(v26 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
        *(_OWORD *)(v26 + 112) = v27;
        long long v28 = *((_OWORD *)off_1E5DAAF90 + 9);
        *(_OWORD *)(v26 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
        *(_OWORD *)(v26 + 144) = v28;
        long long v29 = *((_OWORD *)off_1E5DAAF90 + 3);
        *(_OWORD *)(v26 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
        *(_OWORD *)(v26 + 48) = v29;
        long long v30 = *((_OWORD *)off_1E5DAAF90 + 5);
        *(_OWORD *)(v26 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
        *(_OWORD *)(v26 + 80) = v30;
        long long v31 = *((_OWORD *)off_1E5DAAF90 + 1);
        *(_OWORD *)uint64_t v26 = *(_OWORD *)off_1E5DAAF90;
        *(_OWORD *)(v26 + 16) = v31;
        [*(id *)(a1 + 40) cornerRadius];
        *(_DWORD *)(v26 + 36) = v32;
        *(_DWORD *)(v26 + 40) = v33;
        *(_DWORD *)(v26 + 44) = v34;
        *(_DWORD *)(v26 + 48) = v35;
        if (CGRectIsNull(*(CGRect *)(a1 + 80)))
        {
          double v36 = *(double *)(a1 + 112);
          uint64_t v56 = a4 + 160 * v8;
          *(_OWORD *)(v56 + 20) = v84;
          [*(id *)(a1 + 32) setGradientAlpha:v36];
          *(_WORD *)(v56 + 68) = *(_WORD *)(*(void *)(a1 + 32) + 920);
          uint64_t v57 = a5 + 40 * v8;
          long long v58 = *((_OWORD *)off_1E5DAAF88 + 1);
          *(_OWORD *)uint64_t v57 = *(_OWORD *)off_1E5DAAF88;
          *(_OWORD *)(v57 + 16) = v58;
          *(void *)(v57 + 32) = *((void *)off_1E5DAAF88 + 4);
          int v59 = [*(id *)(a1 + 40) requiresTitleRenderedAsView];
          *(unsigned char *)uint64_t v57 = v59;
          if (v59) {
            char v60 = 10;
          }
          else {
            char v60 = 1;
          }
          *(unsigned char *)(v57 + 1) = v60;
          long long v61 = v91[1];
          long long v105 = *v91;
          long long v106 = v61;
          PXGSectionedSpriteTagMake();
        }
        PXSizeIsEmpty();
      }
      if (v11 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitle"
        || v11 == @"PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground")
      {
        if ([*(id *)(a1 + 40) requiresTitleRenderedAsView])
        {
          CGFloat v13 = *(double *)(a1 + 152);
          CGFloat v14 = *(double *)(a1 + 160);
          CGFloat v15 = *(double *)(a1 + 168);
          CGFloat v16 = *(double *)(a1 + 176);
        }
        else
        {
          char v62 = [*(id *)(a1 + 40) wantsInlineHeader];
          CGFloat v13 = *(double *)(a1 + 152);
          CGFloat v14 = *(double *)(a1 + 160);
          CGFloat v15 = *(double *)(a1 + 168);
          CGFloat v16 = *(double *)(a1 + 176);
          if ((v62 & 1) == 0) {
            PXEdgeInsetsInsetRect();
          }
        }
        v63 = (float32x2_t *)(a3 + 32 * v8);
        v115.origin.double x = v13;
        v115.origin.double y = v14;
        v115.size.double width = v15;
        v115.size.double height = v16;
        CGFloat v64 = CGRectGetMidX(v115);
        v116.origin.double x = v13;
        v116.origin.double y = v14;
        v116.size.double width = v15;
        v116.size.double height = v16;
        CGFloat v65 = CGRectGetMidY(v116);
        v117.origin.double x = v13;
        v117.origin.double y = v14;
        v117.size.double width = v15;
        v117.size.double height = v16;
        CGFloat v88 = CGRectGetWidth(v117);
        v118.origin.double x = v13;
        v118.origin.double y = v14;
        v118.size.double width = v15;
        v118.size.double height = v16;
        CGFloat v66 = CGRectGetHeight(v118);
        v67.f64[0] = v88;
        v67.f64[1] = v66;
        *(CGFloat *)v63 = v64;
        *(CGFloat *)&v63[1] = v65;
        v63[3] = vcvt_f32_f64(v67);
        v63[2] = (float32x2_t)0xBFF0000000000000;
        uint64_t v68 = a4 + 160 * v8;
        long long v69 = *((_OWORD *)off_1E5DAAF90 + 7);
        *(_OWORD *)(v68 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
        *(_OWORD *)(v68 + 112) = v69;
        long long v70 = *((_OWORD *)off_1E5DAAF90 + 9);
        *(_OWORD *)(v68 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
        *(_OWORD *)(v68 + 144) = v70;
        long long v71 = *((_OWORD *)off_1E5DAAF90 + 3);
        *(_OWORD *)(v68 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
        *(_OWORD *)(v68 + 48) = v71;
        long long v72 = *((_OWORD *)off_1E5DAAF90 + 5);
        *(_OWORD *)(v68 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
        *(_OWORD *)(v68 + 80) = v72;
        long long v73 = *((_OWORD *)off_1E5DAAF90 + 1);
        *(_OWORD *)uint64_t v68 = *(_OWORD *)off_1E5DAAF90;
        *(_OWORD *)(v68 + 16) = v73;
        *(unsigned char *)(v68 + 70) = 10;
        uint64_t v74 = a5 + 40 * v8;
        *(void *)(v74 + 32) = *((void *)off_1E5DAAF88 + 4);
        long long v75 = *((_OWORD *)off_1E5DAAF88 + 1);
        *(_OWORD *)uint64_t v74 = *(_OWORD *)off_1E5DAAF88;
        *(_OWORD *)(v74 + 16) = v75;
        *(unsigned char *)(v74 + 1) = 10;
        *(unsigned char *)uint64_t v74 = 1;
        *(_WORD *)(v74 + 32) = *(_WORD *)(*(void *)(a1 + 32) + 872);
        *(float32x2_t *)(v74 + 8) = vmul_n_f32(v63[3], *(float *)(a1 + 504));
        long long v76 = v91[1];
        long long v105 = *v91;
        long long v106 = v76;
        PXGSectionedSpriteTagMake();
      }
      if (v11 == @"PXCuratedLibrarySectionHeaderItemTitleHitArea") {
        PXSizeMin();
      }
      if (v11 == @"PXCuratedLibrarySectionHeaderItemSelectionTitle"
        || v11 == @"PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground")
      {
        v38 = (float32x2_t *)(a3 + 32 * v8);
        CGFloat v39 = *(double *)(a1 + 184);
        CGFloat v40 = *(double *)(a1 + 192);
        CGFloat v41 = *(double *)(a1 + 200);
        CGFloat v42 = *(double *)(a1 + 208);
        v111.origin.double x = v39;
        v111.origin.double y = v40;
        v111.size.double width = v41;
        v111.size.double height = v42;
        CGFloat v43 = CGRectGetMidX(v111);
        v112.origin.double x = v39;
        v112.origin.double y = v40;
        v112.size.double width = v41;
        v112.size.double height = v42;
        CGFloat v44 = CGRectGetMidY(v112);
        v113.origin.double x = v39;
        v113.origin.double y = v40;
        v113.size.double width = v41;
        v113.size.double height = v42;
        CGFloat v87 = CGRectGetWidth(v113);
        v114.origin.double x = v39;
        v114.origin.double y = v40;
        v114.size.double width = v41;
        v114.size.double height = v42;
        CGFloat v45 = CGRectGetHeight(v114);
        v46.f64[0] = v87;
        v46.f64[1] = v45;
        *(CGFloat *)v38 = v43;
        *(CGFloat *)&v38[1] = v44;
        v38[3] = vcvt_f32_f64(v46);
        v38[2] = (float32x2_t)0xBFF0000000000000;
        uint64_t v47 = a4 + 160 * v8;
        long long v48 = *((_OWORD *)off_1E5DAAF90 + 7);
        *(_OWORD *)(v47 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
        *(_OWORD *)(v47 + 112) = v48;
        long long v49 = *((_OWORD *)off_1E5DAAF90 + 9);
        *(_OWORD *)(v47 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
        *(_OWORD *)(v47 + 144) = v49;
        long long v50 = *((_OWORD *)off_1E5DAAF90 + 3);
        *(_OWORD *)(v47 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
        *(_OWORD *)(v47 + 48) = v50;
        long long v51 = *((_OWORD *)off_1E5DAAF90 + 5);
        *(_OWORD *)(v47 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
        *(_OWORD *)(v47 + 80) = v51;
        long long v52 = *((_OWORD *)off_1E5DAAF90 + 1);
        *(_OWORD *)uint64_t v47 = *(_OWORD *)off_1E5DAAF90;
        *(_OWORD *)(v47 + 16) = v52;
        *(unsigned char *)(v47 + 70) = 11;
        uint64_t v53 = a5 + 40 * v8;
        *(void *)(v53 + 32) = *((void *)off_1E5DAAF88 + 4);
        long long v54 = *((_OWORD *)off_1E5DAAF88 + 1);
        *(_OWORD *)uint64_t v53 = *(_OWORD *)off_1E5DAAF88;
        *(_OWORD *)(v53 + 16) = v54;
        *(_WORD *)uint64_t v53 = 2561;
        *(_WORD *)(v53 + 32) = *(_WORD *)(*(void *)(a1 + 32) + 878);
        *(float32x2_t *)(v53 + 8) = vmul_n_f32(v38[3], *(float *)(a1 + 504));
        long long v55 = v91[1];
        long long v105 = *v91;
        long long v106 = v55;
        PXGSectionedSpriteTagMake();
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      void aBlock[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_9;
      aBlock[3] = &unk_1E5DAEDE8;
      unsigned int v104 = v8;
      uint64_t v77 = *(void *)(a1 + 32);
      v95 = v11;
      uint64_t v96 = v77;
      uint64_t v97 = a3;
      uint64_t v98 = a4;
      long long v78 = v89[1];
      long long v99 = *v89;
      long long v100 = v78;
      uint64_t v101 = a5;
      long long v79 = v10[1];
      long long v102 = *v10;
      long long v103 = v79;
      v80 = v11;
      v81 = _Block_copy(aBlock);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_10;
      v92[3] = &unk_1E5DAEE10;
      id v93 = v81;
      id v82 = v81;
      v83 = (void (**)(void *, __CFString *, __CFString *, void, uint64_t, double, double, double, double))_Block_copy(v92);
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemEllipsisButton", @"PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 874), 5, *(double *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemFilterButton", @"PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 876), 6, *(double *)(a1 + 248), *(double *)(a1 + 256), *(double *)(a1 + 264), *(double *)(a1 + 272));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemControlStackButton", @"PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 890), 7, *(double *)(a1 + 280), *(double *)(a1 + 288), *(double *)(a1 + 296), *(double *)(a1 + 304));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemSelectButton", @"PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 880), 9, *(double *)(a1 + 312), *(double *)(a1 + 320), *(double *)(a1 + 328), *(double *)(a1 + 336));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemCancelButton", @"PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 882), 11, *(double *)(a1 + 344), *(double *)(a1 + 352), *(double *)(a1 + 360), *(double *)(a1 + 368));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButton", @"PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 884), 12, *(double *)(a1 + 376), *(double *)(a1 + 384), *(double *)(a1 + 392), *(double *)(a1 + 400));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemZoomInButton", @"PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 886), 13, *(double *)(a1 + 408), *(double *)(a1 + 416), *(double *)(a1 + 424), *(double *)(a1 + 432));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemZoomOutButton", @"PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 888), 14, *(double *)(a1 + 440), *(double *)(a1 + 448), *(double *)(a1 + 456), *(double *)(a1 + 464));
      v83[2](v83, @"PXCuratedLibrarySectionHeaderItemShowSidebarButton", @"PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground", *(unsigned __int16 *)(*(void *)(a1 + 32) + 892), 16, *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 488), *(double *)(a1 + 496));

      double v10 = v91;
      ++v8;
      --v5;
    }
    while (v5);
  }
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_11(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double MaxY = CGRectGetMaxY(*(CGRect *)&a2);
  if (v6 >= MaxY) {
    double MaxY = v6;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MaxY;
}

uint64_t __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_9(uint64_t result, uint64_t a2, __int16 a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v12 = result;
    CGFloat v13 = (float32x2_t *)(*(void *)(result + 48) + 32 * *(unsigned int *)(result + 136));
    CGFloat MidX = CGRectGetMidX(*(CGRect *)&a4);
    v30.origin.double x = a4;
    v30.origin.double y = a5;
    v30.size.double width = a6;
    v30.size.double height = a7;
    CGFloat MidY = CGRectGetMidY(v30);
    v31.origin.double x = a4;
    v31.origin.double y = a5;
    v31.size.double width = a6;
    v31.size.double height = a7;
    CGFloat Width = CGRectGetWidth(v31);
    v32.origin.double x = a4;
    v32.origin.double y = a5;
    v32.size.double width = a6;
    v32.size.double height = a7;
    CGFloat Height = CGRectGetHeight(v32);
    v17.f64[0] = Width;
    v17.f64[1] = Height;
    *(CGFloat *)CGFloat v13 = MidX;
    *(CGFloat *)&v13[1] = MidY;
    v13[2] = 0;
    v13[3] = vcvt_f32_f64(v17);
    [*(id *)(v12 + 40) buttonsZIndex];
    uint64_t v19 = *(unsigned int *)(v12 + 136);
    *(double *)(*(void *)(v12 + 48) + 32 * v19 + 16) = v18;
    CGFloat v20 = (_OWORD *)(*(void *)(v12 + 56) + 160 * v19);
    long long v21 = *((_OWORD *)off_1E5DAAF90 + 1);
    *CGFloat v20 = *(_OWORD *)off_1E5DAAF90;
    v20[1] = v21;
    long long v22 = *((_OWORD *)off_1E5DAAF90 + 5);
    v20[4] = *((_OWORD *)off_1E5DAAF90 + 4);
    v20[5] = v22;
    long long v23 = *((_OWORD *)off_1E5DAAF90 + 3);
    v20[2] = *((_OWORD *)off_1E5DAAF90 + 2);
    v20[3] = v23;
    long long v24 = *((_OWORD *)off_1E5DAAF90 + 9);
    v20[8] = *((_OWORD *)off_1E5DAAF90 + 8);
    v20[9] = v24;
    long long v25 = *((_OWORD *)off_1E5DAAF90 + 7);
    v20[6] = *((_OWORD *)off_1E5DAAF90 + 6);
    v20[7] = v25;
    uint64_t v26 = *(void *)(v12 + 96) + 40 * *(unsigned int *)(v12 + 136);
    long long v27 = *((_OWORD *)off_1E5DAAF88 + 1);
    *(_OWORD *)uint64_t v26 = *(_OWORD *)off_1E5DAAF88;
    *(_OWORD *)(v26 + 16) = v27;
    *(void *)(v26 + 32) = *((void *)off_1E5DAAF88 + 4);
    long long v28 = (_WORD *)(*(void *)(v12 + 96) + 40 * *(unsigned int *)(v12 + 136));
    *long long v28 = 2561;
    v28[16] = a3;
    PXGSectionedSpriteTagMake();
  }
  return result;
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_10(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v17 = *(void *)(a1 + 32);
  float v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double, double, double))(v17 + 16);
  id v19 = a3;
  v18(v17, a2, a4, a5, 1, a6, a7, a8, a9);
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(a6, a7, a8, a9);
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXCuratedLibrarySectionHeaderLayout.m", 224, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->uint64_t updated = 32;
    if ((needsUpdate & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFDFLL;
      [(PXCuratedLibrarySectionHeaderLayout *)self _updateEffectiveSpec];
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v24 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
        [v23 handleFailureInFunction:v24, @"PXCuratedLibrarySectionHeaderLayout.m", 228, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v5 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXCuratedLibrarySectionHeaderLayout *)self _updateTitleAndSubtitle];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v13 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v14 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXCuratedLibrarySectionHeaderLayout.m", 231, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    uint64_t v7 = p_updateFlags->updated | 1;
    p_updateFlags->uint64_t updated = v7;
    if (v6)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFELL;
      [(PXCuratedLibrarySectionHeaderLayout *)self _updateSprites];
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v26 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
        [v25 handleFailureInFunction:v26, @"PXCuratedLibrarySectionHeaderLayout.m", 234, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
      unint64_t v6 = p_updateFlags->needsUpdate;
      uint64_t updated = p_updateFlags->updated | 8;
      p_updateFlags->uint64_t updated = updated;
      if ((v6 & 8) != 0)
      {
        v6 &= ~8uLL;
        p_updateFlags->unint64_t needsUpdate = v6;
      }
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v28 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
        [v27 handleFailureInFunction:v28, @"PXCuratedLibrarySectionHeaderLayout.m", 235, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];

        unint64_t v6 = p_updateFlags->needsUpdate;
        uint64_t updated = p_updateFlags->updated;
      }
      uint64_t v7 = updated | 0x10;
      p_updateFlags->uint64_t updated = v7;
      if ((v6 & 0x10) != 0)
      {
        v6 &= ~0x10uLL;
        p_updateFlags->unint64_t needsUpdate = v6;
      }
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v16 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXCuratedLibrarySectionHeaderLayout.m", 237, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v6 = p_updateFlags->needsUpdate;
      uint64_t v7 = p_updateFlags->updated;
    }
    p_updateFlags->uint64_t updated = v7 | 2;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXCuratedLibrarySectionHeaderLayout *)self _updateSpritesAlpha];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      float v18 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
      [v17 handleFailureInFunction:v18, @"PXCuratedLibrarySectionHeaderLayout.m", 240, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v9 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFF7;
      [(PXCuratedLibrarySectionHeaderLayout *)self _updateButtonActionPerformers];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v20 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
      [v19 handleFailureInFunction:v20, @"PXCuratedLibrarySectionHeaderLayout.m", 243, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v10 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXCuratedLibrarySectionHeaderLayout *)self _updateSpriteTags];
      unint64_t v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v22 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionHeaderLayout update]"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PXCuratedLibrarySectionHeaderLayout.m", 247, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  [(PXGLayout *)&v29 update];
}

- (PXCuratedLibrarySectionHeaderLayout)init
{
  v22.receiver = self;
  v22.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  double v2 = [(PXGLayout *)&v22 init];
  double v3 = v2;
  if (v2)
  {
    [(PXGLayout *)v2 setContentSource:v2];
    v3->_maxPossibleCGFloat Height = 1.79769313e308;
    v3->_titleAlpha = 1.0;
    v3->_buttonsAlpha = 1.0;
    v3->_showsBackgroundGradient = 1;
    v3->_buttonsZIndedouble x = -1.2;
    itemIdentifierBySpriteIndedouble x = v3->_itemIdentifierBySpriteIndex;
    v3->_itemIdentifierBySpriteIndedouble x = (NSArray *)MEMORY[0x1E4F1CBF0];

    unint64_t v5 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    axSpriteIndexes = v3->_axSpriteIndexes;
    v3->_axSpriteIndexes = v5;

    LODWORD(v7) = 1.0;
    v3->_gradientResizableCapInsetsIndedouble x = -[PXGLayout addResizableCapInsets:](v3, "addResizableCapInsets:", 0.0, 0.0, v7, 0.0);
    selectButtonTitle = v3->_selectButtonTitle;
    v3->_selectButtonTitle = (NSString *)&stru_1F00B0030;

    filterButtonTitle = v3->_filterButtonTitle;
    v3->_filterButtonTitle = (NSString *)&stru_1F00B0030;

    filterButtonCaption = v3->_filterButtonCaption;
    v3->_filterButtonCaption = (NSString *)&stru_1F00B0030;

    toggleAspectFitButtonTitle = v3->_toggleAspectFitButtonTitle;
    v3->_toggleAspectFitButtonTitle = (NSString *)&stru_1F00B0030;

    uint64_t v12 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0 epsilon:0.01];
    alternateAppearanceMixAnimator = v3->_alternateAppearanceMixAnimator;
    v3->_alternateAppearanceMixAnimator = (PXNumberAnimator *)v12;

    [(PXNumberAnimator *)v3->_alternateAppearanceMixAnimator registerChangeObserver:v3 context:AlternateAppearanceMixAnimatorObservationContext];
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_4162);
    }
    objc_storeStrong((id *)&v3->_asyncDateQueue, (id)init_asyncDateQueue);
    CGFloat v14 = objc_alloc_init(PXGLayoutGuide);
    leadingButtonsLayoutGuide = v3->_leadingButtonsLayoutGuide;
    v3->_leadingButtonsLayoutGuide = v14;

    [(PXCuratedLibrarySectionHeaderLayout *)v3 _discardAllCachedButtonSizes];
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      CGFloat v16 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      uint64_t v17 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v16];
      sharedLibraryStatusProvider = v3->_sharedLibraryStatusProvider;
      v3->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v17;

      [(PXSharedLibraryStatusProvider *)v3->_sharedLibraryStatusProvider registerChangeObserver:v3 context:PXSharedLibraryStatusProviderObservationContext];
    }
    id v19 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v3->_sharedLibraryStatusProvider];
    libraryFilterState = v3->_libraryFilterState;
    v3->_libraryFilterState = v19;

    [(PXLibraryFilterState *)v3->_libraryFilterState registerChangeObserver:v3 context:PXLibraryFilterStateObservationContext];
  }
  return v3;
}

void __43__PXCuratedLibrarySectionHeaderLayout_init__block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.curatedlibrary-header-async-dates", v1);
  double v3 = (void *)init_asyncDateQueue;
  init_asyncDateQueue = (uint64_t)v2;

  sub_1AB23B20C();
}

@end