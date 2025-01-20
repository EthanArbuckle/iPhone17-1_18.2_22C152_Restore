@interface SKUIReviewsHistogramView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)histogramValues;
- (NSArray)segmentedControlTitles;
- (NSString)title;
- (NSString)versionString;
- (SKUIColorScheme)colorScheme;
- (SKUIReviewsHistogramView)initWithClientContext:(id)a3;
- (UIControl)appSupportButton;
- (UIControl)segmentedControl;
- (UIControl)starRatingControl;
- (UIControl)writeAReviewButton;
- (double)userRating;
- (id)_countLabelString;
- (id)_histogramImageForValues:(id)a3;
- (int64_t)numberOfUserRatings;
- (int64_t)personalStarRating;
- (int64_t)selectedSegmentIndex;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setHistogramValues:(id)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setPersonalStarRating:(int64_t)a3;
- (void)setSegmentedControlTitles:(id)a3;
- (void)setSelectedSegmentIndex:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(double)a3;
- (void)setVersionString:(id)a3;
@end

@implementation SKUIReviewsHistogramView

- (SKUIReviewsHistogramView)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewsHistogramView initWithClientContext:]();
  }
  v74.receiver = self;
  v74.super_class = (Class)SKUIReviewsHistogramView;
  v6 = [(SKUIReviewsHistogramView *)&v74 init];
  v7 = v6;
  if (v6)
  {
    p_clientContext = (id *)&v6->_clientContext;
    objc_storeStrong((id *)&v6->_clientContext, a3);
    if (SKUIUserInterfaceIdiom(*p_clientContext) == 1)
    {
      v9 = objc_alloc_init(SKUIStarRatingControl);
      starRatingControl = v7->_starRatingControl;
      v7->_starRatingControl = v9;

      v11 = v7->_starRatingControl;
      v12 = (void *)MEMORY[0x1E4FB1818];
      v13 = SKUIBundle();
      v14 = [v12 imageNamed:@"LightRateControl" inBundle:v13];
      [(SKUIStarRatingControl *)v11 setEmptyStarsImage:v14];

      v15 = v7->_starRatingControl;
      v16 = (void *)MEMORY[0x1E4FB1818];
      v17 = SKUIBundle();
      v18 = [v16 imageNamed:@"RateControlFilled" inBundle:v17];
      [(SKUIStarRatingControl *)v15 setFilledStarsImage:v18];

      [(SKUIStarRatingControl *)v7->_starRatingControl sizeToFit];
      [(SKUIReviewsHistogramView *)v7 addSubview:v7->_starRatingControl];
      v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      p_starRatingControlLabel = (id *)&v7->_starRatingControlLabel;
      starRatingControlLabel = v7->_starRatingControlLabel;
      v7->_starRatingControlLabel = v19;

      v22 = v7->_starRatingControlLabel;
      v23 = [(SKUIReviewsHistogramView *)v7 backgroundColor];
      [(UILabel *)v22 setBackgroundColor:v23];

      v24 = v7->_starRatingControlLabel;
      v25 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
      [(UILabel *)v24 setFont:v25];

      v26 = v7->_starRatingControlLabel;
      v27 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
      if (v27)
      {
        [(UILabel *)v26 setTextColor:v27];
      }
      else
      {
        v31 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
        [(UILabel *)v26 setTextColor:v31];
      }
      unint64_t v32 = 0x1E4FB0000;

      id v33 = *p_starRatingControlLabel;
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"REVIEWS_TAP_TO_RATE" inTable:@"ProductPage"];
      }
      else {
      v44 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_TAP_TO_RATE" inBundles:0 inTable:@"ProductPage"];
      }
      [v33 setText:v44];

      [*p_starRatingControlLabel sizeToFit];
    }
    else
    {
      uint64_t v28 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      appSupportButton = v7->_appSupportButton;
      v7->_appSupportButton = (UIButton *)v28;

      v30 = v7->_appSupportButton;
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_APP_SUPPORT" inTable:@"ProductPage"];
      }
      else {
      v34 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_APP_SUPPORT" inBundles:0 inTable:@"ProductPage"];
      }
      unint64_t v32 = 0x1E4FB0000uLL;
      [(UIButton *)v30 setTitle:v34 forState:0];

      v35 = [(UIButton *)v7->_appSupportButton titleLabel];
      v36 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
      [v35 setFont:v36];

      v37 = [(UIButton *)v7->_appSupportButton titleLabel];
      [v37 setAdjustsFontSizeToFitWidth:1];

      v38 = [(UIButton *)v7->_appSupportButton titleLabel];
      [v38 setMinimumScaleFactor:0.833333333];

      [(UIButton *)v7->_appSupportButton sizeToFit];
      v39 = v7->_appSupportButton;
      v40 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
      [(UIButton *)v39 setTintColor:v40];

      [(SKUIReviewsHistogramView *)v7 addSubview:v7->_appSupportButton];
      uint64_t v41 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      p_starRatingControlLabel = (id *)&v7->_writeAReviewButton;
      writeAReviewButton = v7->_writeAReviewButton;
      v7->_writeAReviewButton = (UIButton *)v41;

      v43 = v7->_writeAReviewButton;
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPHONE" inTable:@"ProductPage"];
      }
      else {
      v45 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPHONE" inBundles:0 inTable:@"ProductPage"];
      }
      [(UIButton *)v43 setTitle:v45 forState:0];

      v46 = [*p_starRatingControlLabel titleLabel];
      v47 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
      [v46 setFont:v47];

      v48 = [*p_starRatingControlLabel titleLabel];
      [v48 setAdjustsFontSizeToFitWidth:1];

      v49 = [*p_starRatingControlLabel titleLabel];
      [v49 setMinimumScaleFactor:0.833333333];

      [*p_starRatingControlLabel sizeToFit];
      id v50 = *p_starRatingControlLabel;
      v51 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
      [v50 setTintColor:v51];
    }
    [(SKUIReviewsHistogramView *)v7 addSubview:*p_starRatingControlLabel];
    id v52 = objc_alloc(MEMORY[0x1E4FB1838]);
    v53 = [(SKUIReviewsHistogramView *)v7 _histogramImageForValues:&unk_1F1D620A8];
    uint64_t v54 = [v52 initWithImage:v53];
    histogramImageView = v7->_histogramImageView;
    v7->_histogramImageView = (UIImageView *)v54;

    [(UIImageView *)v7->_histogramImageView sizeToFit];
    [(SKUIReviewsHistogramView *)v7 addSubview:v7->_histogramImageView];
    id v56 = objc_alloc(MEMORY[0x1E4FB1838]);
    v57 = +[SKUIRatingStarsCache cacheWithProperties:1];
    v58 = [v57 ratingStarsImageForRating:0.0];
    uint64_t v59 = [v56 initWithImage:v58];
    userRatingStarsView = v7->_userRatingStarsView;
    v7->_userRatingStarsView = (UIImageView *)v59;

    [(SKUIReviewsHistogramView *)v7 addSubview:v7->_userRatingStarsView];
    v61 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    countLabel = v7->_countLabel;
    v7->_countLabel = v61;

    v63 = v7->_countLabel;
    v64 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v64)
    {
      [(UILabel *)v63 setTextColor:v64];
    }
    else
    {
      v65 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
      [(UILabel *)v63 setTextColor:v65];
    }
    [(UILabel *)v7->_countLabel setNumberOfLines:0];
    v66 = v7->_countLabel;
    v67 = [*(id *)(v32 + 2272) systemFontOfSize:14.0];
    [(UILabel *)v66 setFont:v67];

    [(SKUIReviewsHistogramView *)v7 addSubview:v7->_countLabel];
    [(SKUIReviewsHistogramView *)v7 setNumberOfUserRatings:0];
    v68 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomSeparatorView = v7->_bottomSeparatorView;
    v7->_bottomSeparatorView = v68;

    v70 = v7->_bottomSeparatorView;
    v71 = [(SKUIColorScheme *)v7->_colorScheme primaryTextColor];
    if (v71)
    {
      [(UIView *)v70 setBackgroundColor:v71];
    }
    else
    {
      v72 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v70 setBackgroundColor:v72];
    }
    [(SKUIReviewsHistogramView *)v7 addSubview:v7->_bottomSeparatorView];
  }

  return v7;
}

- (int64_t)personalStarRating
{
  return [(SKUIStarRatingControl *)self->_starRatingControl userRating];
}

- (UIControl)segmentedControl
{
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1C10]);
    id v5 = (UISegmentedControl *)[v4 initWithItems:MEMORY[0x1E4F1CBF0]];
    v6 = self->_segmentedControl;
    self->_segmentedControl = v5;

    v7 = self->_segmentedControl;
    v8 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UISegmentedControl *)v7 setTintColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
      [(UISegmentedControl *)v7 setTintColor:v9];
    }
    segmentedControl = self->_segmentedControl;
  }

  return (UIControl *)segmentedControl;
}

- (NSArray)segmentedControlTitles
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(UISegmentedControl *)self->_segmentedControl numberOfSegments])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(UISegmentedControl *)self->_segmentedControl titleForSegmentAtIndex:v4];
      if (v5) {
        [v3 addObject:v5];
      }

      ++v4;
    }
    while (v4 < [(UISegmentedControl *)self->_segmentedControl numberOfSegments]);
  }

  return (NSArray *)v3;
}

- (int64_t)selectedSegmentIndex
{
  v2 = [(SKUIReviewsHistogramView *)self segmentedControl];
  int64_t v3 = [v2 selectedSegmentIndex];

  return v3;
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v25 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    countLabel = self->_countLabel;
    v8 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)countLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
      [(UILabel *)countLabel setTextColor:v9];
    }
    starRatingControlLabel = self->_starRatingControlLabel;
    v11 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v11)
    {
      [(UILabel *)starRatingControlLabel setTextColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)starRatingControlLabel setTextColor:v12];
    }
    titleLabel = self->_titleLabel;
    v14 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v14)
    {
      [(UILabel *)titleLabel setTextColor:v14];
    }
    else
    {
      v15 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)titleLabel setTextColor:v15];
    }
    histogramImageView = self->_histogramImageView;
    v17 = [(SKUIReviewsHistogramView *)self _histogramImageForValues:self->_histogramValues];
    [(UIImageView *)histogramImageView setImage:v17];

    segmentedControl = self->_segmentedControl;
    v19 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v19)
    {
      [(UISegmentedControl *)segmentedControl setTintColor:v19];
    }
    else
    {
      v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
      [(UISegmentedControl *)segmentedControl setTintColor:v20];
    }
    appSupportButton = self->_appSupportButton;
    v22 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    [(UIButton *)appSupportButton setTintColor:v22];

    writeAReviewButton = self->_writeAReviewButton;
    v24 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    [(UIButton *)writeAReviewButton setTintColor:v24];

    id v5 = v25;
  }
}

- (void)setHistogramValues:(id)a3
{
  p_histogramValues = &self->_histogramValues;
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](*p_histogramValues, "isEqualToArray:") && [v8 count] == 5)
  {
    objc_storeStrong((id *)&self->_histogramValues, a3);
    histogramImageView = self->_histogramImageView;
    v7 = [(SKUIReviewsHistogramView *)self _histogramImageForValues:*p_histogramValues];
    [(UIImageView *)histogramImageView setImage:v7];
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  self->_numberOfUserRatings = a3;
  countLabel = self->_countLabel;
  id v5 = [(SKUIReviewsHistogramView *)self _countLabelString];
  [(UILabel *)countLabel setText:v5];

  [(SKUIReviewsHistogramView *)self setNeedsLayout];
}

- (void)setPersonalStarRating:(int64_t)a3
{
}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIReviewsHistogramView *)self segmentedControl];
  [v5 removeAllSegments];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SKUIReviewsHistogramView_setSegmentedControlTitles___block_invoke;
  v8[3] = &unk_1E6427AA0;
  id v9 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v8];
  uint64_t v7 = [v4 count];

  if (v7)
  {
    [v6 sizeToFit];
    [(SKUIReviewsHistogramView *)self addSubview:v6];
  }
  else
  {
    [v6 removeFromSuperview];
  }
}

uint64_t __54__SKUIReviewsHistogramView_setSegmentedControlTitles___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertSegmentWithTitle:a2 atIndex:a3 animated:0];
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4 = [(SKUIReviewsHistogramView *)self segmentedControl];
  [v4 setSelectedSegmentIndex:a3];
}

- (void)setTitle:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v16)
    {
      if (!titleLabel)
      {
        id v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        uint64_t v7 = self->_titleLabel;
        self->_titleLabel = v6;

        id v8 = self->_titleLabel;
        id v9 = [(SKUIReviewsHistogramView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_titleLabel;
        v13 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v13)
        {
          [(UILabel *)v12 setTextColor:v13];
        }
        else
        {
          v15 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v12 setTextColor:v15];
        }
        [(SKUIReviewsHistogramView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIReviewsHistogramView *)self setNeedsLayout];
  }
}

- (void)setUserRating:(double)a3
{
  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    userRatingStarsView = self->_userRatingStarsView;
    id v6 = +[SKUIRatingStarsCache cacheWithProperties:1];
    id v5 = [v6 ratingStarsImageForRating:self->_userRating];
    [(UIImageView *)userRatingStarsView setImage:v5];
  }
}

- (void)setVersionString:(id)a3
{
  if (self->_versionString != a3)
  {
    id v4 = (NSString *)[a3 copy];
    versionString = self->_versionString;
    self->_versionString = v4;

    countLabel = self->_countLabel;
    uint64_t v7 = [(SKUIReviewsHistogramView *)self _countLabelString];
    [(UILabel *)countLabel setText:v7];

    [(SKUIReviewsHistogramView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (double)userRating
{
  return self->_userRating;
}

- (void)layoutSubviews
{
  [(SKUIReviewsHistogramView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 11.0);
    v64.origin.x = 15.0;
    v64.origin.y = 11.0;
    v64.size.double width = v9;
    v64.size.CGFloat height = v11;
    float v12 = CGRectGetMaxY(v64) + -4.0 + 19.0;
  }
  else
  {
    float v12 = 15.0;
  }
  if ([(UISegmentedControl *)self->_segmentedControl isDescendantOfView:self])
  {
    [(UISegmentedControl *)self->_segmentedControl frame];
    double v14 = v13;
    if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      double v15 = 295.0;
    }
    else
    {
      id v16 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v16 userInterfaceIdiom] == 1)
      {
        double v15 = 290.0;
      }
      else
      {
        v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v17 bounds];
        double v15 = v18 + -30.0;
      }
    }
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", 15.0, v12, v15, v14);
    v65.origin.x = 15.0;
    v65.origin.y = v12;
    v65.size.double width = v15;
    v65.size.CGFloat height = v14;
    float v12 = CGRectGetMaxY(v65) + 19.0;
  }
  if (self->_userRatingStarsView)
  {
    countLabel = self->_countLabel;
    if (countLabel)
    {
      [(UILabel *)countLabel frame];
      v20 = self->_countLabel;
      [(UIImageView *)self->_userRatingStarsView frame];
      -[UILabel sizeThatFits:](v20, "sizeThatFits:", v4 + -45.0 - v21 + -9.0, 1.79769313e308);
      double v23 = v22;
      double v25 = v24;
      [(UIImageView *)self->_userRatingStarsView frame];
      CGFloat v27 = v26 + 15.0 + 9.0;
      -[UILabel setFrame:](self->_countLabel, "setFrame:", v27, (float)(v12 + -4.0), v23, v25);
      v66.origin.x = v27;
      v66.origin.y = (float)(v12 + -4.0);
      v66.size.double width = v23;
      v66.size.CGFloat height = v25;
      CGFloat v28 = CGRectGetMaxY(v66) + -3.0;
      [(UIImageView *)self->_userRatingStarsView frame];
      -[UIImageView setFrame:](self->_userRatingStarsView, "setFrame:", 15.0, (float)(v12 + 1.0));
      float v12 = v28 + 10.0;
    }
  }
  histogramImageView = self->_histogramImageView;
  if (histogramImageView)
  {
    [(UIImageView *)histogramImageView frame];
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    -[UIImageView setFrame:](self->_histogramImageView, "setFrame:", 15.0, (float)(v12 + -2.0));
    v67.origin.x = 15.0;
    v67.origin.y = (float)(v12 + -2.0);
    v67.size.double width = v31;
    v67.size.CGFloat height = v33;
    float v12 = CGRectGetMaxY(v67) + 19.0 + -3.0;
  }
  if (self->_starRatingControl)
  {
    [(UILabel *)self->_countLabel frame];
    float v61 = v12;
    CGFloat v34 = CGRectGetMinY(v68) + -19.0;
    [(UIImageView *)self->_histogramImageView frame];
    double MaxY = CGRectGetMaxY(v69);
    float v36 = v4 * 0.5;
    double v37 = floorf(v36);
    [(SKUIStarRatingControl *)self->_starRatingControl frame];
    double v60 = v38;
    double v40 = v39;
    [(UILabel *)self->_starRatingControlLabel frame];
    double width = v70.size.width;
    double v62 = v4;
    CGFloat height = v70.size.height;
    CGFloat v43 = v37 + 40.0;
    double v44 = v6;
    double v45 = MaxY - v34;
    float v46 = (MaxY - v34 - v70.size.height) * 0.5;
    CGFloat v47 = v34 + floorf(v46);
    v70.origin.x = v43;
    v70.origin.y = v47;
    CGFloat MaxX = CGRectGetMaxX(v70);
    double v49 = v45 - v40;
    double v6 = v44;
    *(float *)&double v49 = v49 * 0.5;
    CGFloat v50 = v34 + floorf(*(float *)&v49);
    float v12 = v61;
    -[SKUIStarRatingControl setFrame:](self->_starRatingControl, "setFrame:", MaxX + 8.0, v50, v60, v40);
    double v51 = height;
    double v4 = v62;
    -[UILabel setFrame:](self->_starRatingControlLabel, "setFrame:", v43, v47, width, v51);
  }
  if (self->_appSupportButton)
  {
    writeAReviewButton = self->_writeAReviewButton;
    if (writeAReviewButton)
    {
      float v53 = (v4 + -30.0 + -10.0) * 0.5;
      double v54 = floorf(v53);
      [(UIButton *)writeAReviewButton frame];
      -[UIButton setFrame:](self->_writeAReviewButton, "setFrame:", 15.0, (float)(v12 + -11.0), v54);
      [(UIButton *)self->_appSupportButton frame];
      -[UIButton setFrame:](self->_appSupportButton, "setFrame:", v4 + -15.0 - v54, (float)(v12 + -11.0), v54);
    }
  }
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView)
  {
    [(UIView *)bottomSeparatorView frame];
    id v56 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v56 scale];
    double v58 = 1.0 / v57;

    uint64_t v59 = self->_bottomSeparatorView;
    -[UIView setFrame:](v59, "setFrame:", 15.0, v6 - v58, v4 + -15.0, v58);
  }
}

- (void)setBackgroundColor:(id)a3
{
  countLabel = self->_countLabel;
  id v5 = a3;
  [(UILabel *)countLabel setBackgroundColor:v5];
  [(SKUIStarRatingControl *)self->_starRatingControl setBackgroundColor:v5];
  [(UILabel *)self->_starRatingControlLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIReviewsHistogramView;
  [(SKUIReviewsHistogramView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1) {
    double v5 = 136.0;
  }
  else {
    double v5 = 168.0;
  }
  if ([(UISegmentedControl *)self->_segmentedControl isDescendantOfView:self])
  {
    [(UISegmentedControl *)self->_segmentedControl frame];
    double v5 = v5 + v6 + 19.0;
  }
  countLabel = self->_countLabel;
  if (countLabel)
  {
    [(UIImageView *)self->_userRatingStarsView frame];
    -[UILabel sizeThatFits:](countLabel, "sizeThatFits:", width + -45.0 - v8 + -9.0, 1.79769313e308);
    double v5 = v5 + v9 + -7.0;
  }
  double v10 = width;
  double v11 = v5;
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (id)_histogramImageForValues:(id)a3
{
  id v5 = a3;
  v63 = self;
  uint64_t v6 = SKUIUserInterfaceIdiom(self->_clientContext);
  uint64_t v7 = &off_1C1CCB000;
  if (v6 == 1)
  {
    int v8 = 0;
    double v9 = 295.0;
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v3 userInterfaceIdiom] == 1)
    {
      int v8 = 0;
      double v9 = 290.0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v7 bounds];
      double v9 = v10 + -30.0;
      int v8 = 1;
    }
  }
  float v11 = (float)(unint64_t)[v5 count] * 14.0;
  if (v8) {

  }
  double v12 = v11;
  if (v6 != 1) {

  }
  double v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  CGFloat v15 = v14;
  v67.double width = v9;
  v67.CGFloat height = v12;
  UIGraphicsBeginImageContextWithOptions(v67, 0, v15);

  c = UIGraphicsGetCurrentContext();
  id v16 = (void *)MEMORY[0x1E4FB1818];
  v17 = SKUIBundle();
  double v18 = [v16 imageNamed:@"SmallStarFull" inBundle:v17];

  v19 = [(SKUIColorScheme *)v63->_colorScheme primaryTextColor];
  if (v19)
  {
    v20 = [(SKUIColorScheme *)v63->_colorScheme primaryTextColor];
    double v21 = SKUIColorWithAlpha(v20, 0.1);
    double v22 = SKUITintedImage(v18, 0, v21);
  }
  else
  {
    v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
    double v22 = SKUITintedImage(v18, 0, v20);
  }

  double v23 = [(SKUIColorScheme *)v63->_colorScheme primaryTextColor];
  if (v23)
  {
    double v24 = SKUITintedImage(v18, 0, v23);
  }
  else
  {
    double v25 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
    double v24 = SKUITintedImage(v18, 0, v25);
  }
  [v18 size];
  double v27 = v26;
  if ([v5 count])
  {
    unint64_t v28 = 0;
    float v29 = (14.0 - v27) * 0.5;
    double v30 = roundf(v29);
    do
    {
      if ([v5 count])
      {
        uint64_t v31 = 0;
        do
        {
          unint64_t v32 = v31 + 1;
          if (v31 >= v28) {
            CGFloat v33 = v24;
          }
          else {
            CGFloat v33 = v22;
          }
          double v34 = (double)v31;
          id v35 = v33;
          [v18 size];
          objc_msgSend(v35, "drawAtPoint:", v36 * v34, v30 + (float)((float)(uint64_t)v28 * 14.0));

          unint64_t v37 = [v5 count];
          uint64_t v31 = v32;
        }
        while (v32 < v37);
      }
      ++v28;
    }
    while (v28 < [v5 count]);
  }
  [v18 size];
  double v39 = v38;
  unint64_t v40 = [v5 count];
  uint64_t v41 = v63;
  if (SKUIUserInterfaceIdiom(v63->_clientContext) == 1)
  {
    double v42 = 295.0;
    uint64_t v43 = 424;
  }
  else
  {
    double v44 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v44 userInterfaceIdiom] == 1)
    {
      double v42 = 290.0;
    }
    else
    {
      double v45 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v45 bounds];
      double v42 = v46 + -30.0;
    }
    uint64_t v43 = 424;
  }
  if ([v5 count])
  {
    uint64_t v47 = 0;
    double v48 = v39 * (double)v40 + 9.0;
    double v49 = v42 - v48;
    uint64_t v50 = -1;
    do
    {
      double v51 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") + v50);
      [v51 floatValue];
      float v53 = v52;

      CGRect v65 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v48, (float)((float)v47 * 14.0) + 6.0, v49, 2.0, 2.0);
      double v54 = [*(id *)((char *)&v41->super.super.super.isa + v43) primaryTextColor];
      if (v54)
      {
        [*(id *)((char *)&v41->super.super.super.isa + v43) primaryTextColor];
        id v56 = v55 = v43;
        double v57 = SKUIColorWithAlpha(v56, 0.1);
        [v57 set];

        uint64_t v41 = v63;
      }
      else
      {
        [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
        id v56 = v55 = v43;
        [v56 set];
      }

      [v65 fill];
      CGContextSaveGState(c);
      v68.size.CGFloat height = 2.0;
      v68.origin.x = v48;
      v68.origin.y = (float)((float)v47 * 14.0) + 6.0;
      v68.size.double width = v49 * v53;
      CGContextClipToRect(c, v68);
      double v58 = [*(id *)((char *)&v41->super.super.super.isa + v55) primaryTextColor];
      uint64_t v59 = v58;
      if (v58)
      {
        uint64_t v43 = v55;
        [v58 set];
      }
      else
      {
        double v60 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
        [v60 set];

        uint64_t v43 = 424;
      }

      [v65 fill];
      CGContextRestoreGState(c);

      ++v47;
      --v50;
    }
    while (v47 < (unint64_t)[v5 count]);
  }
  float v61 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v61;
}

- (id)_countLabelString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v3 setNumberStyle:1];
  double v4 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
  id v5 = [v3 stringFromNumber:v4];

  int64_t numberOfUserRatings = self->_numberOfUserRatings;
  if (!numberOfUserRatings)
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_COUNT_NONE" inTable:@"ProductPage"];
    }
    else {
    double v12 = +[SKUIClientContext localizedStringForKey:@"REVIEWS_COUNT_NONE" inBundles:0 inTable:@"ProductPage"];
    }
    goto LABEL_27;
  }
  uint64_t v7 = self->_clientContext;
  if (self->_versionString)
  {
    if (numberOfUserRatings == 1)
    {
      if (v7)
      {
        int v8 = @"REVIEWS_COUNT_CURRENT_VERSION_ONE";
LABEL_13:
        uint64_t v11 = [(SKUIClientContext *)v7 localizedStringForKey:v8 inTable:@"ProductPage"];
LABEL_22:
        CGFloat v15 = (void *)v11;
        double v12 = [NSString stringWithValidatedFormat:v11, @"%@%@", 0, v5, self->_versionString validFormatSpecifiers error];

        goto LABEL_27;
      }
      double v14 = @"REVIEWS_COUNT_CURRENT_VERSION_ONE";
    }
    else
    {
      if (v7)
      {
        int v8 = @"REVIEWS_COUNT_CURRENT_VERSION_PLURAL";
        goto LABEL_13;
      }
      double v14 = @"REVIEWS_COUNT_CURRENT_VERSION_PLURAL";
    }
    uint64_t v11 = +[SKUIClientContext localizedStringForKey:v14 inBundles:0 inTable:@"ProductPage"];
    goto LABEL_22;
  }
  if (numberOfUserRatings != 1)
  {
    if (v7)
    {
      double v10 = @"REVIEWS_COUNT_ALL_VERSIONS_PLURAL";
      goto LABEL_18;
    }
    id v16 = @"REVIEWS_COUNT_ALL_VERSIONS_PLURAL";
LABEL_25:
    uint64_t v13 = +[SKUIClientContext localizedStringForKey:v16 inBundles:0 inTable:@"ProductPage"];
    goto LABEL_26;
  }
  if (!v7)
  {
    id v16 = @"REVIEWS_COUNT_ALL_VERSIONS_ONE";
    goto LABEL_25;
  }
  double v10 = @"REVIEWS_COUNT_ALL_VERSIONS_ONE";
LABEL_18:
  uint64_t v13 = [(SKUIClientContext *)v7 localizedStringForKey:v10 inTable:@"ProductPage"];
LABEL_26:
  v17 = (void *)v13;
  double v12 = [NSString stringWithValidatedFormat:v13, @"%@", 0, v5 validFormatSpecifiers error];

LABEL_27:

  return v12;
}

- (UIControl)appSupportButton
{
  return &self->_appSupportButton->super;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (UIControl)starRatingControl
{
  return &self->_starRatingControl->super;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (UIControl)writeAReviewButton
{
  return &self->_writeAReviewButton->super;
}

- (NSArray)histogramValues
{
  return self->_histogramValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramValues, 0);
  objc_storeStrong((id *)&self->_histogramImageView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_writeAReviewButton, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_userRatingStarsView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_starRatingControlLabel, 0);
  objc_storeStrong((id *)&self->_starRatingControl, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_appSupportButton, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewsHistogramView initWithClientContext:]";
}

@end