@interface PXDayAssetsSectionBodyLayoutSpec
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)bodyCornerRadius;
- (BOOL)allowsVideoPlaybackAtAnySize;
- (BOOL)useHorizontalContentGuideInsets;
- (PXDayAssetsSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (double)horizontalMargin;
- (double)interitemSpacing;
- (int64_t)numberOfColumns;
@end

@implementation PXDayAssetsSectionBodyLayoutSpec

- (PXDayAssetsSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXDayAssetsSectionBodyLayoutSpec;
  v4 = [(PXFeatureSpec *)&v9 initWithExtendedTraitCollection:a3 options:a4];
  if (v4)
  {
    v5 = +[PXCuratedLibrarySettings sharedInstance];
    [v5 interitemSpacingForDays];
    v4->_interitemSpacing = v6;
    v7 = +[PXLemonadeSettings sharedInstance];
    v4->_numberOfColumns = [v7 aggregatedHighlightColumns];

    v4->_allowsVideoPlaybackAtAnySize = 0;
  }
  return v4;
}

- (BOOL)useHorizontalContentGuideInsets
{
  return self->_useHorizontalContentGuideInsets;
}

- (BOOL)allowsVideoPlaybackAtAnySize
{
  return self->_allowsVideoPlaybackAtAnySize;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)bodyCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

@end