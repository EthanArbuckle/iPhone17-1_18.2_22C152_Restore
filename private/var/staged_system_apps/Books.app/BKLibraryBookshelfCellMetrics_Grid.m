@interface BKLibraryBookshelfCellMetrics_Grid
+ (id)sectionName;
- (BKLibraryBookshelfCellMetrics_Grid)init;
- (CGSize)cellSize;
- (CGSize)smallCellSize;
- (TUIFontAttributes)expectedDateFontAttributes;
- (TUIFontAttributes)infoBadgeFontAttributes;
- (TUIFontAttributes)seriesSequenceLabelFontAttributes;
- (TUIFontAttributes)smallTitleFontAttributes;
- (TUIFontAttributes)timeRemainingFontAttributes;
- (UIColor)nextBadgeColor;
- (UIColor)preOrderableBadgeColor;
- (UIColor)preOrderedBadgeColor;
- (UIColor)priceColor;
- (UIColor)proofBadgeColor;
- (UIColor)sampleBadgeColor;
- (UIColor)unreadBadgeColor;
- (double)audioBadgeSpacing;
- (double)audiobookControlDiameter;
- (double)audiobookControlMargin;
- (double)badgeEndCapWidth;
- (double)cellAspect;
- (double)cloudSpacing;
- (double)dimmedAlpha;
- (double)dimmedScale;
- (double)dotsSpacing;
- (double)dragAlpha;
- (double)infoBarDateSpacing;
- (double)infoBarExpectedDateHeight;
- (double)infoBarHeight;
- (double)infoBarSpacing;
- (double)nowPlayingInterLevelSpacing;
- (double)nowPlayingLevelCornerRadius;
- (double)nowPlayingLevelWidth;
- (double)nowPlayingMaximumLevelHeight;
- (double)nowPlayingMinimumLevelHeight;
- (double)seriesSequenceLabelBottomMargin;
- (double)seriesSequenceLabelHeight;
- (double)seriesSequenceLabelTopMargin;
- (double)smallTitleTopMargin;
- (int64_t)nowPlayingNumberOfLevels;
- (int64_t)numOfLinesSmallTitle;
- (int64_t)sectionItemRowLimit;
- (void)configureWithSection:(id)a3;
- (void)setAudioBadgeSpacing:(double)a3;
- (void)setAudiobookControlDiameter:(double)a3;
- (void)setAudiobookControlMargin:(double)a3;
- (void)setBadgeEndCapWidth:(double)a3;
- (void)setCellAspect:(double)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setCloudSpacing:(double)a3;
- (void)setDimmedAlpha:(double)a3;
- (void)setDimmedScale:(double)a3;
- (void)setDotsSpacing:(double)a3;
- (void)setDragAlpha:(double)a3;
- (void)setExpectedDateFontAttributes:(id)a3;
- (void)setInfoBadgeFontAttributes:(id)a3;
- (void)setInfoBarDateSpacing:(double)a3;
- (void)setInfoBarExpectedDateHeight:(double)a3;
- (void)setInfoBarHeight:(double)a3;
- (void)setInfoBarSpacing:(double)a3;
- (void)setNextBadgeColor:(id)a3;
- (void)setNowPlayingInterLevelSpacing:(double)a3;
- (void)setNowPlayingLevelCornerRadius:(double)a3;
- (void)setNowPlayingLevelWidth:(double)a3;
- (void)setNowPlayingMaximumLevelHeight:(double)a3;
- (void)setNowPlayingMinimumLevelHeight:(double)a3;
- (void)setNowPlayingNumberOfLevels:(int64_t)a3;
- (void)setNumOfLinesSmallTitle:(int64_t)a3;
- (void)setPreOrderableBadgeColor:(id)a3;
- (void)setPreOrderedBadgeColor:(id)a3;
- (void)setPriceColor:(id)a3;
- (void)setProofBadgeColor:(id)a3;
- (void)setSampleBadgeColor:(id)a3;
- (void)setSectionItemRowLimit:(int64_t)a3;
- (void)setSeriesSequenceLabelBottomMargin:(double)a3;
- (void)setSeriesSequenceLabelFontAttributes:(id)a3;
- (void)setSeriesSequenceLabelHeight:(double)a3;
- (void)setSeriesSequenceLabelTopMargin:(double)a3;
- (void)setSmallCellSize:(CGSize)a3;
- (void)setSmallTitleFontAttributes:(id)a3;
- (void)setSmallTitleTopMargin:(double)a3;
- (void)setTimeRemainingFontAttributes:(id)a3;
- (void)setUnreadBadgeColor:(id)a3;
@end

@implementation BKLibraryBookshelfCellMetrics_Grid

- (BKLibraryBookshelfCellMetrics_Grid)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_Grid;
  v2 = [(BKLibraryBookshelfCellMetrics_Grid *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKLibraryBookshelfCellMetrics *)v2 setCellType:0];
  }
  return v3;
}

+ (id)sectionName
{
  return @"bookCellGrid";
}

- (void)configureWithSection:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)BKLibraryBookshelfCellMetrics_Grid;
  id v4 = a3;
  [(BKLibraryBookshelfCellMetrics *)&v30 configureWithSection:v4];
  [v4 sizeForKey:@"cell-size" v30.receiver, v30.super_class];
  -[BKLibraryBookshelfCellMetrics_Grid setCellSize:](self, "setCellSize:");
  [v4 sizeForKey:@"small-cell-size"];
  -[BKLibraryBookshelfCellMetrics_Grid setSmallCellSize:](self, "setSmallCellSize:");
  [v4 floatForKey:@"cell-aspect"];
  -[BKLibraryBookshelfCellMetrics_Grid setCellAspect:](self, "setCellAspect:");
  [v4 floatForKey:@"cell-dim-alpha"];
  -[BKLibraryBookshelfCellMetrics_Grid setDimmedAlpha:](self, "setDimmedAlpha:");
  [v4 floatForKey:@"cell-dim-scale"];
  -[BKLibraryBookshelfCellMetrics_Grid setDimmedScale:](self, "setDimmedScale:");
  [v4 floatForKey:@"info-spacing"];
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarSpacing:](self, "setInfoBarSpacing:");
  [v4 floatForKey:@"info-height"];
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarHeight:](self, "setInfoBarHeight:");
  [v4 floatForKey:@"section-row-limit"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setSectionItemRowLimit:(uint64_t)v5];
  v6 = [v4 colorForKey:@"new-badge-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setUnreadBadgeColor:v6];

  v7 = [v4 colorForKey:@"next-badge-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setNextBadgeColor:v7];

  v8 = [v4 colorForKey:@"proof-badge-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setProofBadgeColor:v8];

  v9 = [v4 colorForKey:@"preorderable-badge-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setPreOrderableBadgeColor:v9];

  v10 = [v4 colorForKey:@"preordered-badge-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setPreOrderedBadgeColor:v10];

  v11 = [v4 colorForKey:@"sample-badge-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setSampleBadgeColor:v11];

  v12 = [v4 colorForKey:@"price-color"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setPriceColor:v12];

  [v4 floatForKey:@"info-dots-spacing"];
  -[BKLibraryBookshelfCellMetrics_Grid setDotsSpacing:](self, "setDotsSpacing:");
  [v4 floatForKey:@"info-cloud-spacing"];
  -[BKLibraryBookshelfCellMetrics_Grid setCloudSpacing:](self, "setCloudSpacing:");
  [v4 floatForKey:@"info-audio-badge-spacing"];
  -[BKLibraryBookshelfCellMetrics_Grid setAudioBadgeSpacing:](self, "setAudioBadgeSpacing:");
  [v4 floatForKey:@"info-badge-endcap"];
  -[BKLibraryBookshelfCellMetrics_Grid setBadgeEndCapWidth:](self, "setBadgeEndCapWidth:");
  [v4 floatForKey:@"info-date-height"];
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarExpectedDateHeight:](self, "setInfoBarExpectedDateHeight:");
  [v4 floatForKey:@"info-date-spacing"];
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarDateSpacing:](self, "setInfoBarDateSpacing:");
  [v4 floatForKey:@"drag-alpha"];
  -[BKLibraryBookshelfCellMetrics_Grid setDragAlpha:](self, "setDragAlpha:");
  [v4 floatForKey:@"audiobook-control-margin"];
  -[BKLibraryBookshelfCellMetrics_Grid setAudiobookControlMargin:](self, "setAudiobookControlMargin:");
  [v4 floatForKey:@"audiobook-control-diameter"];
  -[BKLibraryBookshelfCellMetrics_Grid setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  [v4 floatForKey:@"sequence-label-top-margin"];
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelTopMargin:](self, "setSeriesSequenceLabelTopMargin:");
  [v4 floatForKey:@"sequence-label-bottom-margin"];
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelBottomMargin:](self, "setSeriesSequenceLabelBottomMargin:");
  [v4 floatForKey:@"now-playing-inter-level-spacing"];
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingInterLevelSpacing:](self, "setNowPlayingInterLevelSpacing:");
  [v4 floatForKey:@"now-playinglevelcornerradius"];
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingLevelCornerRadius:](self, "setNowPlayingLevelCornerRadius:");
  [v4 floatForKey:@"now-playing-level-width"];
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingLevelWidth:](self, "setNowPlayingLevelWidth:");
  [v4 floatForKey:@"now-playing-maximum-level-height"];
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingMaximumLevelHeight:](self, "setNowPlayingMaximumLevelHeight:");
  [v4 floatForKey:@"now-playing-minimum-level-height"];
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingMinimumLevelHeight:](self, "setNowPlayingMinimumLevelHeight:");
  [v4 floatForKey:@"now-playing-number-of-levels"];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setNowPlayingNumberOfLevels:(uint64_t)v13];
  v14 = [v4 fontSpecForKey:@"timeRemainingLabel"];
  v15 = [v14 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setTimeRemainingFontAttributes:v15];

  v16 = [v4 fontSpecForKey:@"infoBadge"];
  v17 = [v16 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setInfoBadgeFontAttributes:v17];

  v18 = [v4 fontSpecForKey:@"infoDate"];
  v19 = [v18 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setExpectedDateFontAttributes:v19];

  v20 = [(BKLibraryBookshelfCellMetrics_Grid *)self expectedDateFontAttributes];
  v21 = [v20 font];

  [v21 bk_heightFromCapLineToDescender];
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarExpectedDateHeight:](self, "setInfoBarExpectedDateHeight:");

  v22 = [v4 fontSpecForKey:@"smallTitleFont"];
  v23 = [v22 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setSmallTitleFontAttributes:v23];

  -[BKLibraryBookshelfCellMetrics_Grid setNumOfLinesSmallTitle:](self, "setNumOfLinesSmallTitle:", [v4 integerForKey:@"number-of-lines-small-title"]);
  v24 = [v4 fontSpecForKey:@"sequenceDisplayLabel"];
  v25 = [v24 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Grid *)self setSeriesSequenceLabelFontAttributes:v25];

  v26 = [(BKLibraryBookshelfCellMetrics_Grid *)self seriesSequenceLabelFontAttributes];
  v27 = [v26 font];

  [v27 capHeight];
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelHeight:](self, "setSeriesSequenceLabelHeight:");

  [v4 floatForKey:@"small-title-top-margin"];
  double v29 = v28;

  [(BKLibraryBookshelfCellMetrics_Grid *)self setSmallTitleTopMargin:v29];
}

- (double)dimmedAlpha
{
  return self->_dimmedAlpha;
}

- (void)setDimmedAlpha:(double)a3
{
  self->_dimmedAlpha = a3;
}

- (double)dimmedScale
{
  return self->_dimmedScale;
}

- (void)setDimmedScale:(double)a3
{
  self->_dimmedScale = a3;
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)smallCellSize
{
  double width = self->_smallCellSize.width;
  double height = self->_smallCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSmallCellSize:(CGSize)a3
{
  self->_smallCellSize = a3;
}

- (double)cellAspect
{
  return self->_cellAspect;
}

- (void)setCellAspect:(double)a3
{
  self->_cellAspect = a3;
}

- (double)dragAlpha
{
  return self->_dragAlpha;
}

- (void)setDragAlpha:(double)a3
{
  self->_dragAlpha = a3;
}

- (int64_t)sectionItemRowLimit
{
  return self->_sectionItemRowLimit;
}

- (void)setSectionItemRowLimit:(int64_t)a3
{
  self->_sectionItemRowLimit = a3;
}

- (double)infoBarSpacing
{
  return self->_infoBarSpacing;
}

- (void)setInfoBarSpacing:(double)a3
{
  self->_infoBarSpacing = a3;
}

- (double)infoBarHeight
{
  return self->_infoBarHeight;
}

- (void)setInfoBarHeight:(double)a3
{
  self->_infoBarHeight = a3;
}

- (double)infoBarExpectedDateHeight
{
  return self->_infoBarExpectedDateHeight;
}

- (void)setInfoBarExpectedDateHeight:(double)a3
{
  self->_infoBarExpectedDateHeight = a3;
}

- (double)infoBarDateSpacing
{
  return self->_infoBarDateSpacing;
}

- (void)setInfoBarDateSpacing:(double)a3
{
  self->_infoBarDateSpacing = a3;
}

- (double)dotsSpacing
{
  return self->_dotsSpacing;
}

- (void)setDotsSpacing:(double)a3
{
  self->_dotsSpacing = a3;
}

- (double)cloudSpacing
{
  return self->_cloudSpacing;
}

- (void)setCloudSpacing:(double)a3
{
  self->_cloudSpacing = a3;
}

- (double)audioBadgeSpacing
{
  return self->_audioBadgeSpacing;
}

- (void)setAudioBadgeSpacing:(double)a3
{
  self->_audioBadgeSpacing = a3;
}

- (double)badgeEndCapWidth
{
  return self->_badgeEndCapWidth;
}

- (void)setBadgeEndCapWidth:(double)a3
{
  self->_badgeEndCapWidth = a3;
}

- (TUIFontAttributes)expectedDateFontAttributes
{
  return self->_expectedDateFontAttributes;
}

- (void)setExpectedDateFontAttributes:(id)a3
{
}

- (TUIFontAttributes)timeRemainingFontAttributes
{
  return self->_timeRemainingFontAttributes;
}

- (void)setTimeRemainingFontAttributes:(id)a3
{
}

- (TUIFontAttributes)infoBadgeFontAttributes
{
  return self->_infoBadgeFontAttributes;
}

- (void)setInfoBadgeFontAttributes:(id)a3
{
}

- (TUIFontAttributes)seriesSequenceLabelFontAttributes
{
  return self->_seriesSequenceLabelFontAttributes;
}

- (void)setSeriesSequenceLabelFontAttributes:(id)a3
{
}

- (UIColor)unreadBadgeColor
{
  return self->_unreadBadgeColor;
}

- (void)setUnreadBadgeColor:(id)a3
{
}

- (UIColor)nextBadgeColor
{
  return self->_nextBadgeColor;
}

- (void)setNextBadgeColor:(id)a3
{
}

- (UIColor)proofBadgeColor
{
  return self->_proofBadgeColor;
}

- (void)setProofBadgeColor:(id)a3
{
}

- (UIColor)preOrderableBadgeColor
{
  return self->_preOrderableBadgeColor;
}

- (void)setPreOrderableBadgeColor:(id)a3
{
}

- (UIColor)preOrderedBadgeColor
{
  return self->_preOrderedBadgeColor;
}

- (void)setPreOrderedBadgeColor:(id)a3
{
}

- (UIColor)sampleBadgeColor
{
  return self->_sampleBadgeColor;
}

- (void)setSampleBadgeColor:(id)a3
{
}

- (UIColor)priceColor
{
  return self->_priceColor;
}

- (void)setPriceColor:(id)a3
{
}

- (double)audiobookControlMargin
{
  return self->_audiobookControlMargin;
}

- (void)setAudiobookControlMargin:(double)a3
{
  self->_audiobookControlMargin = a3;
}

- (double)audiobookControlDiameter
{
  return self->_audiobookControlDiameter;
}

- (void)setAudiobookControlDiameter:(double)a3
{
  self->_audiobookControlDiameter = a3;
}

- (double)nowPlayingInterLevelSpacing
{
  return self->_nowPlayingInterLevelSpacing;
}

- (void)setNowPlayingInterLevelSpacing:(double)a3
{
  self->_nowPlayingInterLevelSpacing = a3;
}

- (double)nowPlayingLevelCornerRadius
{
  return self->_nowPlayingLevelCornerRadius;
}

- (void)setNowPlayingLevelCornerRadius:(double)a3
{
  self->_nowPlayingLevelCornerRadius = a3;
}

- (double)nowPlayingLevelWidth
{
  return self->_nowPlayingLevelWidth;
}

- (void)setNowPlayingLevelWidth:(double)a3
{
  self->_nowPlayingLevelWidth = a3;
}

- (double)nowPlayingMaximumLevelHeight
{
  return self->_nowPlayingMaximumLevelHeight;
}

- (void)setNowPlayingMaximumLevelHeight:(double)a3
{
  self->_nowPlayingMaximumLevelHeight = a3;
}

- (double)nowPlayingMinimumLevelHeight
{
  return self->_nowPlayingMinimumLevelHeight;
}

- (void)setNowPlayingMinimumLevelHeight:(double)a3
{
  self->_nowPlayingMinimumLevelHeight = a3;
}

- (int64_t)nowPlayingNumberOfLevels
{
  return self->_nowPlayingNumberOfLevels;
}

- (void)setNowPlayingNumberOfLevels:(int64_t)a3
{
  self->_nowPlayingNumberOfLevels = a3;
}

- (double)seriesSequenceLabelTopMargin
{
  return self->_seriesSequenceLabelTopMargin;
}

- (void)setSeriesSequenceLabelTopMargin:(double)a3
{
  self->_seriesSequenceLabelTopMargin = a3;
}

- (double)seriesSequenceLabelBottomMargin
{
  return self->_seriesSequenceLabelBottomMargin;
}

- (void)setSeriesSequenceLabelBottomMargin:(double)a3
{
  self->_seriesSequenceLabelBottomMargin = a3;
}

- (double)seriesSequenceLabelHeight
{
  return self->_seriesSequenceLabelHeight;
}

- (void)setSeriesSequenceLabelHeight:(double)a3
{
  self->_seriesSequenceLabelHeight = a3;
}

- (TUIFontAttributes)smallTitleFontAttributes
{
  return self->_smallTitleFontAttributes;
}

- (void)setSmallTitleFontAttributes:(id)a3
{
}

- (int64_t)numOfLinesSmallTitle
{
  return self->_numOfLinesSmallTitle;
}

- (void)setNumOfLinesSmallTitle:(int64_t)a3
{
  self->_numOfLinesSmallTitle = a3;
}

- (double)smallTitleTopMargin
{
  return self->_smallTitleTopMargin;
}

- (void)setSmallTitleTopMargin:(double)a3
{
  self->_smallTitleTopMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_priceColor, 0);
  objc_storeStrong((id *)&self->_sampleBadgeColor, 0);
  objc_storeStrong((id *)&self->_preOrderedBadgeColor, 0);
  objc_storeStrong((id *)&self->_preOrderableBadgeColor, 0);
  objc_storeStrong((id *)&self->_proofBadgeColor, 0);
  objc_storeStrong((id *)&self->_nextBadgeColor, 0);
  objc_storeStrong((id *)&self->_unreadBadgeColor, 0);
  objc_storeStrong((id *)&self->_seriesSequenceLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_infoBadgeFontAttributes, 0);
  objc_storeStrong((id *)&self->_timeRemainingFontAttributes, 0);

  objc_storeStrong((id *)&self->_expectedDateFontAttributes, 0);
}

@end