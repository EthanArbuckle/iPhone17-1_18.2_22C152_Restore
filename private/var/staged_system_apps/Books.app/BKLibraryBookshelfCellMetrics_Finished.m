@interface BKLibraryBookshelfCellMetrics_Finished
+ (id)sectionName;
- (BKLibraryBookshelfCellMetrics_Finished)init;
- (BOOL)finishedShortText;
- (BOOL)reviewBottomLayout;
- (CGSize)bookCoverSize;
- (TUIFontAttributes)authorFontAttributes;
- (TUIFontAttributes)dateFontAttributes;
- (TUIFontAttributes)finishedFontAttributes;
- (TUIFontAttributes)reviewContentFontAttributes;
- (TUIFontAttributes)reviewMoreFontAttributes;
- (TUIFontAttributes)reviewTitleFontAttributes;
- (TUIFontAttributes)stillReadingFontAttributes;
- (TUIFontAttributes)titleFontAttributes;
- (TUIFontAttributes)writeReviewFontAttributes;
- (UIColor)datelineCircleFilledColor;
- (UIColor)datelineCircleHollowColor;
- (UIColor)datelineColor;
- (UIColor)finishedFillColor;
- (UIColor)finishedFillHilightColor;
- (UIColor)finishedFrameColor;
- (UIColor)finishedTextColor;
- (UIColor)finishedTextHilightColor;
- (UIColor)moreTintColor;
- (UIColor)ratingEmptyColor;
- (UIColor)ratingFillColor;
- (UIColor)ratingFrameColor;
- (UIColor)reviewBGColor;
- (UIColor)stillReadingFillColor;
- (UIColor)stillReadingFillHilightColor;
- (UIColor)stillReadingFrameColor;
- (UIColor)stillReadingTextColor;
- (UIColor)stillReadingTextHilightColor;
- (UIColor)writeReviewFillColor;
- (UIColor)writeReviewFillHilightColor;
- (UIColor)writeReviewFrameColor;
- (UIColor)writeReviewTextColor;
- (UIColor)writeReviewTextHilightColor;
- (double)audiobookControlDiameter;
- (double)audiobookControlMargin;
- (double)authorMaxLines;
- (double)authorSpacing;
- (double)bookCoverLeftMargin;
- (double)cellHeight;
- (double)cellSpacing;
- (double)cellWidth;
- (double)checkMarkSpacing;
- (double)cloudSpacing;
- (double)dateSpace;
- (double)datelineCircleSize;
- (double)datelineMargin;
- (double)datelineWidth;
- (double)finishedFrameWidth;
- (double)finishedSpacing;
- (double)finishedTitleInset;
- (double)lockupBottomSpacing;
- (double)lockupMargin;
- (double)moreHeight;
- (double)moreSpacing;
- (double)ratingHeight;
- (double)ratingSpacing;
- (double)ratingWidth;
- (double)reviewBottomMargin;
- (double)reviewCompactLines;
- (double)reviewLeftMargin;
- (double)reviewRightMargin;
- (double)reviewSpacing;
- (double)reviewTopMargin;
- (double)shrinkAlpha;
- (double)smallLayoutSpaceNeeded;
- (double)stillReadingFrameWidth;
- (double)stillReadingSpacing;
- (double)stillReadingTitleInset;
- (double)titleMaxLines;
- (double)writeReviewFrameWidth;
- (double)writeReviewSpacing;
- (double)writeReviewTitleInset;
- (void)configureWithSection:(id)a3;
- (void)setAudiobookControlDiameter:(double)a3;
- (void)setAudiobookControlMargin:(double)a3;
- (void)setAuthorFontAttributes:(id)a3;
- (void)setAuthorMaxLines:(double)a3;
- (void)setAuthorSpacing:(double)a3;
- (void)setBookCoverLeftMargin:(double)a3;
- (void)setBookCoverSize:(CGSize)a3;
- (void)setCellHeight:(double)a3;
- (void)setCellSpacing:(double)a3;
- (void)setCellWidth:(double)a3;
- (void)setCheckMarkSpacing:(double)a3;
- (void)setCloudSpacing:(double)a3;
- (void)setDateFontAttributes:(id)a3;
- (void)setDateSpace:(double)a3;
- (void)setDatelineCircleFilledColor:(id)a3;
- (void)setDatelineCircleHollowColor:(id)a3;
- (void)setDatelineCircleSize:(double)a3;
- (void)setDatelineColor:(id)a3;
- (void)setDatelineMargin:(double)a3;
- (void)setDatelineWidth:(double)a3;
- (void)setFinishedFillColor:(id)a3;
- (void)setFinishedFillHilightColor:(id)a3;
- (void)setFinishedFontAttributes:(id)a3;
- (void)setFinishedFrameColor:(id)a3;
- (void)setFinishedFrameWidth:(double)a3;
- (void)setFinishedShortText:(BOOL)a3;
- (void)setFinishedSpacing:(double)a3;
- (void)setFinishedTextColor:(id)a3;
- (void)setFinishedTextHilightColor:(id)a3;
- (void)setFinishedTitleInset:(double)a3;
- (void)setLockupBottomSpacing:(double)a3;
- (void)setLockupMargin:(double)a3;
- (void)setMoreHeight:(double)a3;
- (void)setMoreSpacing:(double)a3;
- (void)setMoreTintColor:(id)a3;
- (void)setRatingEmptyColor:(id)a3;
- (void)setRatingFillColor:(id)a3;
- (void)setRatingFrameColor:(id)a3;
- (void)setRatingHeight:(double)a3;
- (void)setRatingSpacing:(double)a3;
- (void)setRatingWidth:(double)a3;
- (void)setReviewBGColor:(id)a3;
- (void)setReviewBottomLayout:(BOOL)a3;
- (void)setReviewBottomMargin:(double)a3;
- (void)setReviewCompactLines:(double)a3;
- (void)setReviewContentFontAttributes:(id)a3;
- (void)setReviewLeftMargin:(double)a3;
- (void)setReviewMoreFontAttributes:(id)a3;
- (void)setReviewRightMargin:(double)a3;
- (void)setReviewSpacing:(double)a3;
- (void)setReviewTitleFontAttributes:(id)a3;
- (void)setReviewTopMargin:(double)a3;
- (void)setShrinkAlpha:(double)a3;
- (void)setSmallLayoutSpaceNeeded:(double)a3;
- (void)setStillReadingFillColor:(id)a3;
- (void)setStillReadingFillHilightColor:(id)a3;
- (void)setStillReadingFontAttributes:(id)a3;
- (void)setStillReadingFrameColor:(id)a3;
- (void)setStillReadingFrameWidth:(double)a3;
- (void)setStillReadingSpacing:(double)a3;
- (void)setStillReadingTextColor:(id)a3;
- (void)setStillReadingTextHilightColor:(id)a3;
- (void)setStillReadingTitleInset:(double)a3;
- (void)setTitleFontAttributes:(id)a3;
- (void)setTitleMaxLines:(double)a3;
- (void)setWriteReviewFillColor:(id)a3;
- (void)setWriteReviewFillHilightColor:(id)a3;
- (void)setWriteReviewFontAttributes:(id)a3;
- (void)setWriteReviewFrameColor:(id)a3;
- (void)setWriteReviewFrameWidth:(double)a3;
- (void)setWriteReviewSpacing:(double)a3;
- (void)setWriteReviewTextColor:(id)a3;
- (void)setWriteReviewTextHilightColor:(id)a3;
- (void)setWriteReviewTitleInset:(double)a3;
@end

@implementation BKLibraryBookshelfCellMetrics_Finished

- (BKLibraryBookshelfCellMetrics_Finished)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_Finished;
  v2 = [(BKLibraryBookshelfCellMetrics_Finished *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKLibraryBookshelfCellMetrics *)v2 setCellType:2];
  }
  return v3;
}

+ (id)sectionName
{
  return @"bookCellListFinished";
}

- (void)configureWithSection:(id)a3
{
  v46.receiver = self;
  v46.super_class = (Class)BKLibraryBookshelfCellMetrics_Finished;
  id v4 = a3;
  [(BKLibraryBookshelfCellMetrics *)&v46 configureWithSection:v4];
  objc_super v5 = objc_msgSend(v4, "colorForKey:", @"dateline-color", v46.receiver, v46.super_class);
  [(BKLibraryBookshelfCellMetrics_Finished *)self setDatelineColor:v5];

  v6 = [v4 colorForKey:@"dateline-circle-hollow-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setDatelineCircleHollowColor:v6];

  v7 = [v4 colorForKey:@"dateline-circle-fill-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setDatelineCircleFilledColor:v7];

  v8 = [v4 colorForKey:@"finished-fill-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setFinishedFillColor:v8];

  v9 = [v4 colorForKey:@"finished-fill-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setFinishedFillHilightColor:v9];

  v10 = [v4 colorForKey:@"finished-frame-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setFinishedFrameColor:v10];

  v11 = [v4 colorForKey:@"finished-text-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setFinishedTextColor:v11];

  v12 = [v4 colorForKey:@"finished-text-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setFinishedTextHilightColor:v12];

  v13 = [v4 colorForKey:@"write-review-fill-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setWriteReviewFillColor:v13];

  v14 = [v4 colorForKey:@"write-review-fill-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setWriteReviewFillHilightColor:v14];

  v15 = [v4 colorForKey:@"write-review-frame-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setWriteReviewFrameColor:v15];

  v16 = [v4 colorForKey:@"write-review-text-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setWriteReviewTextColor:v16];

  v17 = [v4 colorForKey:@"write-review-text-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setWriteReviewTextHilightColor:v17];

  v18 = [v4 colorForKey:@"still-reading-fill-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setStillReadingFillColor:v18];

  v19 = [v4 colorForKey:@"still-reading-fill-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setStillReadingFillHilightColor:v19];

  v20 = [v4 colorForKey:@"still-reading-frame-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setStillReadingFrameColor:v20];

  v21 = [v4 colorForKey:@"still-reading-text-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setStillReadingTextColor:v21];

  v22 = [v4 colorForKey:@"still-reading-text-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setStillReadingTextHilightColor:v22];

  v23 = [v4 colorForKey:@"more-tint-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setMoreTintColor:v23];

  v24 = [v4 colorForKey:@"review-bg-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setReviewBGColor:v24];

  v25 = [v4 colorForKey:@"rating-frame-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setRatingFrameColor:v25];

  v26 = [v4 colorForKey:@"rating-fill-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setRatingFillColor:v26];

  v27 = [v4 colorForKey:@"rating-empty-color"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setRatingEmptyColor:v27];

  [v4 floatForKey:@"edit-mode-shrink-alpha"];
  -[BKLibraryBookshelfCellMetrics_Finished setShrinkAlpha:](self, "setShrinkAlpha:");
  [v4 sizeForKey:@"book-cover-size"];
  -[BKLibraryBookshelfCellMetrics_Finished setBookCoverSize:](self, "setBookCoverSize:");
  [v4 floatForKey:@"book-cover-left-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
  [v4 floatForKey:@"cell-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setCellSpacing:](self, "setCellSpacing:");
  [v4 floatForKey:@"cell-height"];
  -[BKLibraryBookshelfCellMetrics_Finished setCellHeight:](self, "setCellHeight:");
  [v4 floatForKey:@"checkmark-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setCheckMarkSpacing:](self, "setCheckMarkSpacing:");
  [v4 floatForKey:@"cloud-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setCloudSpacing:](self, "setCloudSpacing:");
  [v4 floatForKey:@"dateline-circle-size"];
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineCircleSize:](self, "setDatelineCircleSize:");
  [v4 floatForKey:@"dateline-width"];
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineWidth:](self, "setDatelineWidth:");
  [v4 floatForKey:@"dateline-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineMargin:](self, "setDatelineMargin:");
  [v4 floatForKey:@"date-space"];
  -[BKLibraryBookshelfCellMetrics_Finished setDateSpace:](self, "setDateSpace:");
  [v4 floatForKey:@"lockup-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setLockupMargin:](self, "setLockupMargin:");
  [v4 floatForKey:@"author-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setAuthorSpacing:](self, "setAuthorSpacing:");
  [v4 floatForKey:@"title-max-lines"];
  -[BKLibraryBookshelfCellMetrics_Finished setTitleMaxLines:](self, "setTitleMaxLines:");
  [v4 floatForKey:@"rating-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setRatingSpacing:](self, "setRatingSpacing:");
  [v4 floatForKey:@"rating-height"];
  -[BKLibraryBookshelfCellMetrics_Finished setRatingHeight:](self, "setRatingHeight:");
  [v4 floatForKey:@"rating-width"];
  -[BKLibraryBookshelfCellMetrics_Finished setRatingWidth:](self, "setRatingWidth:");
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedShortText:](self, "setFinishedShortText:", [v4 BOOLForKey:@"finished-short-text"]);
  [v4 floatForKey:@"finished-frame-width"];
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedFrameWidth:](self, "setFinishedFrameWidth:");
  [v4 floatForKey:@"finished-title-inset"];
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedTitleInset:](self, "setFinishedTitleInset:");
  [v4 floatForKey:@"finished-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedSpacing:](self, "setFinishedSpacing:");
  [v4 floatForKey:@"still-reading-frame-width"];
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingFrameWidth:](self, "setStillReadingFrameWidth:");
  [v4 floatForKey:@"still-reading-title-inset"];
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingTitleInset:](self, "setStillReadingTitleInset:");
  [v4 floatForKey:@"still-reading-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingSpacing:](self, "setStillReadingSpacing:");
  [v4 floatForKey:@"write-review-frame-width"];
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewFrameWidth:](self, "setWriteReviewFrameWidth:");
  [v4 floatForKey:@"write-review-title-inset"];
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewTitleInset:](self, "setWriteReviewTitleInset:");
  [v4 floatForKey:@"write-review--spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewSpacing:](self, "setWriteReviewSpacing:");
  [v4 floatForKey:@"more-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setMoreSpacing:](self, "setMoreSpacing:");
  [v4 floatForKey:@"audiobook-control-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setAudiobookControlMargin:](self, "setAudiobookControlMargin:");
  [v4 floatForKey:@"audiobook-control-diameter"];
  -[BKLibraryBookshelfCellMetrics_Finished setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  [v4 floatForKey:@"review-compact-lines"];
  -[BKLibraryBookshelfCellMetrics_Finished setReviewCompactLines:](self, "setReviewCompactLines:");
  [v4 floatForKey:@"review-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setReviewSpacing:](self, "setReviewSpacing:");
  [v4 floatForKey:@"review-left-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setReviewLeftMargin:](self, "setReviewLeftMargin:");
  [v4 floatForKey:@"review-right-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setReviewRightMargin:](self, "setReviewRightMargin:");
  [v4 floatForKey:@"review-top-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setReviewTopMargin:](self, "setReviewTopMargin:");
  [v4 floatForKey:@"review-bottom-margin"];
  -[BKLibraryBookshelfCellMetrics_Finished setReviewBottomMargin:](self, "setReviewBottomMargin:");
  -[BKLibraryBookshelfCellMetrics_Finished setReviewBottomLayout:](self, "setReviewBottomLayout:", [v4 BOOLForKey:@"review-bottom-layout"]);
  [v4 floatForKey:@"more-height"];
  -[BKLibraryBookshelfCellMetrics_Finished setMoreHeight:](self, "setMoreHeight:");
  [v4 floatForKey:@"lockup-bottom-spacing"];
  -[BKLibraryBookshelfCellMetrics_Finished setLockupBottomSpacing:](self, "setLockupBottomSpacing:");
  [v4 floatForKey:@"small-layout-space-needed"];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setSmallLayoutSpaceNeeded:"setSmallLayoutSpaceNeeded:"];
  [v4 floatForKey:@"author-max-lines"];
  -[BKLibraryBookshelfCellMetrics_Finished setAuthorMaxLines:](self, "setAuthorMaxLines:");
  v28 = [v4 fontSpecForKey:@"dateFont"];
  v29 = [v28 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setDateFontAttributes:v29];

  v30 = [v4 fontSpecForKey:@"titleFont"];
  v31 = [v30 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setTitleFontAttributes:v31];

  v32 = [v4 fontSpecForKey:@"authorFont"];
  v33 = [v32 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setAuthorFontAttributes:v33];

  v34 = [v4 fontSpecForKey:@"reviewTitleFont"];
  v35 = [v34 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setReviewTitleFontAttributes:v35];

  v36 = [v4 fontSpecForKey:@"reviewContentFont"];
  v37 = [v36 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setReviewContentFontAttributes:v37];

  v38 = [v4 fontSpecForKey:@"reviewMoreFont"];
  v39 = [v38 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setReviewMoreFontAttributes:v39];

  v40 = [v4 fontSpecForKey:@"finishedFont"];
  v41 = [v40 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setFinishedFontAttributes:v41];

  v42 = [v4 fontSpecForKey:@"stillReadingFont"];
  v43 = [v42 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setStillReadingFontAttributes:v43];

  v44 = [v4 fontSpecForKey:@"writeReviewFont"];

  v45 = [v44 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_Finished *)self setWriteReviewFontAttributes:v45];
}

- (double)shrinkAlpha
{
  return self->_shrinkAlpha;
}

- (void)setShrinkAlpha:(double)a3
{
  self->_shrinkAlpha = a3;
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_cellWidth = a3;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (CGSize)bookCoverSize
{
  double width = self->_bookCoverSize.width;
  double height = self->_bookCoverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (double)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(double)a3
{
  self->_cellSpacing = a3;
}

- (double)datelineCircleSize
{
  return self->_datelineCircleSize;
}

- (void)setDatelineCircleSize:(double)a3
{
  self->_datelineCircleSize = a3;
}

- (double)datelineWidth
{
  return self->_datelineWidth;
}

- (void)setDatelineWidth:(double)a3
{
  self->_datelineWidth = a3;
}

- (double)datelineMargin
{
  return self->_datelineMargin;
}

- (void)setDatelineMargin:(double)a3
{
  self->_datelineMargin = a3;
}

- (double)dateSpace
{
  return self->_dateSpace;
}

- (void)setDateSpace:(double)a3
{
  self->_dateSpace = a3;
}

- (double)titleMaxLines
{
  return self->_titleMaxLines;
}

- (void)setTitleMaxLines:(double)a3
{
  self->_titleMaxLines = a3;
}

- (double)lockupMargin
{
  return self->_lockupMargin;
}

- (void)setLockupMargin:(double)a3
{
  self->_lockupMargin = a3;
}

- (double)cloudSpacing
{
  return self->_cloudSpacing;
}

- (void)setCloudSpacing:(double)a3
{
  self->_cloudSpacing = a3;
}

- (double)checkMarkSpacing
{
  return self->_checkMarkSpacing;
}

- (void)setCheckMarkSpacing:(double)a3
{
  self->_checkMarkSpacing = a3;
}

- (double)authorSpacing
{
  return self->_authorSpacing;
}

- (void)setAuthorSpacing:(double)a3
{
  self->_authorSpacing = a3;
}

- (double)ratingHeight
{
  return self->_ratingHeight;
}

- (void)setRatingHeight:(double)a3
{
  self->_ratingHeight = a3;
}

- (double)ratingWidth
{
  return self->_ratingWidth;
}

- (void)setRatingWidth:(double)a3
{
  self->_ratingWidth = a3;
}

- (double)ratingSpacing
{
  return self->_ratingSpacing;
}

- (void)setRatingSpacing:(double)a3
{
  self->_ratingSpacing = a3;
}

- (BOOL)finishedShortText
{
  return self->_finishedShortText;
}

- (void)setFinishedShortText:(BOOL)a3
{
  self->_finishedShortText = a3;
}

- (double)finishedFrameWidth
{
  return self->_finishedFrameWidth;
}

- (void)setFinishedFrameWidth:(double)a3
{
  self->_finishedFrameWidth = a3;
}

- (double)finishedTitleInset
{
  return self->_finishedTitleInset;
}

- (void)setFinishedTitleInset:(double)a3
{
  self->_finishedTitleInset = a3;
}

- (double)finishedSpacing
{
  return self->_finishedSpacing;
}

- (void)setFinishedSpacing:(double)a3
{
  self->_finishedSpacing = a3;
}

- (double)writeReviewFrameWidth
{
  return self->_writeReviewFrameWidth;
}

- (void)setWriteReviewFrameWidth:(double)a3
{
  self->_writeReviewFrameWidth = a3;
}

- (double)writeReviewTitleInset
{
  return self->_writeReviewTitleInset;
}

- (void)setWriteReviewTitleInset:(double)a3
{
  self->_writeReviewTitleInset = a3;
}

- (double)writeReviewSpacing
{
  return self->_writeReviewSpacing;
}

- (void)setWriteReviewSpacing:(double)a3
{
  self->_writeReviewSpacing = a3;
}

- (double)stillReadingFrameWidth
{
  return self->_stillReadingFrameWidth;
}

- (void)setStillReadingFrameWidth:(double)a3
{
  self->_stillReadingFrameWidth = a3;
}

- (double)stillReadingTitleInset
{
  return self->_stillReadingTitleInset;
}

- (void)setStillReadingTitleInset:(double)a3
{
  self->_stillReadingTitleInset = a3;
}

- (double)stillReadingSpacing
{
  return self->_stillReadingSpacing;
}

- (void)setStillReadingSpacing:(double)a3
{
  self->_stillReadingSpacing = a3;
}

- (double)moreHeight
{
  return self->_moreHeight;
}

- (void)setMoreHeight:(double)a3
{
  self->_moreHeight = a3;
}

- (double)moreSpacing
{
  return self->_moreSpacing;
}

- (void)setMoreSpacing:(double)a3
{
  self->_moreSpacing = a3;
}

- (double)reviewSpacing
{
  return self->_reviewSpacing;
}

- (void)setReviewSpacing:(double)a3
{
  self->_reviewSpacing = a3;
}

- (double)reviewLeftMargin
{
  return self->_reviewLeftMargin;
}

- (void)setReviewLeftMargin:(double)a3
{
  self->_reviewLeftMargin = a3;
}

- (double)reviewRightMargin
{
  return self->_reviewRightMargin;
}

- (void)setReviewRightMargin:(double)a3
{
  self->_reviewRightMargin = a3;
}

- (double)reviewTopMargin
{
  return self->_reviewTopMargin;
}

- (void)setReviewTopMargin:(double)a3
{
  self->_reviewTopMargin = a3;
}

- (double)reviewBottomMargin
{
  return self->_reviewBottomMargin;
}

- (void)setReviewBottomMargin:(double)a3
{
  self->_reviewBottomMargin = a3;
}

- (double)reviewCompactLines
{
  return self->_reviewCompactLines;
}

- (void)setReviewCompactLines:(double)a3
{
  self->_reviewCompactLines = a3;
}

- (double)smallLayoutSpaceNeeded
{
  return self->_smallLayoutSpaceNeeded;
}

- (void)setSmallLayoutSpaceNeeded:(double)a3
{
  self->_smallLayoutSpaceNeeded = a3;
}

- (double)lockupBottomSpacing
{
  return self->_lockupBottomSpacing;
}

- (void)setLockupBottomSpacing:(double)a3
{
  self->_lockupBottomSpacing = a3;
}

- (double)authorMaxLines
{
  return self->_authorMaxLines;
}

- (void)setAuthorMaxLines:(double)a3
{
  self->_authorMaxLines = a3;
}

- (BOOL)reviewBottomLayout
{
  return self->_reviewBottomLayout;
}

- (void)setReviewBottomLayout:(BOOL)a3
{
  self->_reviewBottomLayout = a3;
}

- (UIColor)datelineColor
{
  return self->_datelineColor;
}

- (void)setDatelineColor:(id)a3
{
}

- (UIColor)datelineCircleHollowColor
{
  return self->_datelineCircleHollowColor;
}

- (void)setDatelineCircleHollowColor:(id)a3
{
}

- (UIColor)datelineCircleFilledColor
{
  return self->_datelineCircleFilledColor;
}

- (void)setDatelineCircleFilledColor:(id)a3
{
}

- (UIColor)finishedFillColor
{
  return self->_finishedFillColor;
}

- (void)setFinishedFillColor:(id)a3
{
}

- (UIColor)finishedFillHilightColor
{
  return self->_finishedFillHilightColor;
}

- (void)setFinishedFillHilightColor:(id)a3
{
}

- (UIColor)finishedFrameColor
{
  return self->_finishedFrameColor;
}

- (void)setFinishedFrameColor:(id)a3
{
}

- (UIColor)finishedTextColor
{
  return self->_finishedTextColor;
}

- (void)setFinishedTextColor:(id)a3
{
}

- (UIColor)finishedTextHilightColor
{
  return self->_finishedTextHilightColor;
}

- (void)setFinishedTextHilightColor:(id)a3
{
}

- (UIColor)writeReviewFillColor
{
  return self->_writeReviewFillColor;
}

- (void)setWriteReviewFillColor:(id)a3
{
}

- (UIColor)writeReviewFillHilightColor
{
  return self->_writeReviewFillHilightColor;
}

- (void)setWriteReviewFillHilightColor:(id)a3
{
}

- (UIColor)writeReviewFrameColor
{
  return self->_writeReviewFrameColor;
}

- (void)setWriteReviewFrameColor:(id)a3
{
}

- (UIColor)writeReviewTextColor
{
  return self->_writeReviewTextColor;
}

- (void)setWriteReviewTextColor:(id)a3
{
}

- (UIColor)writeReviewTextHilightColor
{
  return self->_writeReviewTextHilightColor;
}

- (void)setWriteReviewTextHilightColor:(id)a3
{
}

- (UIColor)stillReadingFillColor
{
  return self->_stillReadingFillColor;
}

- (void)setStillReadingFillColor:(id)a3
{
}

- (UIColor)stillReadingFillHilightColor
{
  return self->_stillReadingFillHilightColor;
}

- (void)setStillReadingFillHilightColor:(id)a3
{
}

- (UIColor)stillReadingFrameColor
{
  return self->_stillReadingFrameColor;
}

- (void)setStillReadingFrameColor:(id)a3
{
}

- (UIColor)stillReadingTextColor
{
  return self->_stillReadingTextColor;
}

- (void)setStillReadingTextColor:(id)a3
{
}

- (UIColor)stillReadingTextHilightColor
{
  return self->_stillReadingTextHilightColor;
}

- (void)setStillReadingTextHilightColor:(id)a3
{
}

- (UIColor)moreTintColor
{
  return self->_moreTintColor;
}

- (void)setMoreTintColor:(id)a3
{
}

- (UIColor)reviewBGColor
{
  return self->_reviewBGColor;
}

- (void)setReviewBGColor:(id)a3
{
}

- (UIColor)ratingFrameColor
{
  return self->_ratingFrameColor;
}

- (void)setRatingFrameColor:(id)a3
{
}

- (UIColor)ratingFillColor
{
  return self->_ratingFillColor;
}

- (void)setRatingFillColor:(id)a3
{
}

- (UIColor)ratingEmptyColor
{
  return self->_ratingEmptyColor;
}

- (void)setRatingEmptyColor:(id)a3
{
}

- (TUIFontAttributes)dateFontAttributes
{
  return self->_dateFontAttributes;
}

- (void)setDateFontAttributes:(id)a3
{
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
}

- (TUIFontAttributes)authorFontAttributes
{
  return self->_authorFontAttributes;
}

- (void)setAuthorFontAttributes:(id)a3
{
}

- (TUIFontAttributes)reviewTitleFontAttributes
{
  return self->_reviewTitleFontAttributes;
}

- (void)setReviewTitleFontAttributes:(id)a3
{
}

- (TUIFontAttributes)reviewContentFontAttributes
{
  return self->_reviewContentFontAttributes;
}

- (void)setReviewContentFontAttributes:(id)a3
{
}

- (TUIFontAttributes)reviewMoreFontAttributes
{
  return self->_reviewMoreFontAttributes;
}

- (void)setReviewMoreFontAttributes:(id)a3
{
}

- (TUIFontAttributes)finishedFontAttributes
{
  return self->_finishedFontAttributes;
}

- (void)setFinishedFontAttributes:(id)a3
{
}

- (TUIFontAttributes)stillReadingFontAttributes
{
  return self->_stillReadingFontAttributes;
}

- (void)setStillReadingFontAttributes:(id)a3
{
}

- (TUIFontAttributes)writeReviewFontAttributes
{
  return self->_writeReviewFontAttributes;
}

- (void)setWriteReviewFontAttributes:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeReviewFontAttributes, 0);
  objc_storeStrong((id *)&self->_stillReadingFontAttributes, 0);
  objc_storeStrong((id *)&self->_finishedFontAttributes, 0);
  objc_storeStrong((id *)&self->_reviewMoreFontAttributes, 0);
  objc_storeStrong((id *)&self->_reviewContentFontAttributes, 0);
  objc_storeStrong((id *)&self->_reviewTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_authorFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_dateFontAttributes, 0);
  objc_storeStrong((id *)&self->_ratingEmptyColor, 0);
  objc_storeStrong((id *)&self->_ratingFillColor, 0);
  objc_storeStrong((id *)&self->_ratingFrameColor, 0);
  objc_storeStrong((id *)&self->_reviewBGColor, 0);
  objc_storeStrong((id *)&self->_moreTintColor, 0);
  objc_storeStrong((id *)&self->_stillReadingTextHilightColor, 0);
  objc_storeStrong((id *)&self->_stillReadingTextColor, 0);
  objc_storeStrong((id *)&self->_stillReadingFrameColor, 0);
  objc_storeStrong((id *)&self->_stillReadingFillHilightColor, 0);
  objc_storeStrong((id *)&self->_stillReadingFillColor, 0);
  objc_storeStrong((id *)&self->_writeReviewTextHilightColor, 0);
  objc_storeStrong((id *)&self->_writeReviewTextColor, 0);
  objc_storeStrong((id *)&self->_writeReviewFrameColor, 0);
  objc_storeStrong((id *)&self->_writeReviewFillHilightColor, 0);
  objc_storeStrong((id *)&self->_writeReviewFillColor, 0);
  objc_storeStrong((id *)&self->_finishedTextHilightColor, 0);
  objc_storeStrong((id *)&self->_finishedTextColor, 0);
  objc_storeStrong((id *)&self->_finishedFrameColor, 0);
  objc_storeStrong((id *)&self->_finishedFillHilightColor, 0);
  objc_storeStrong((id *)&self->_finishedFillColor, 0);
  objc_storeStrong((id *)&self->_datelineCircleFilledColor, 0);
  objc_storeStrong((id *)&self->_datelineCircleHollowColor, 0);

  objc_storeStrong((id *)&self->_datelineColor, 0);
}

@end