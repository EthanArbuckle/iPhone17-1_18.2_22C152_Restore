@interface SUUIReviewsHistogramView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)histogramValues;
- (NSArray)segmentedControlTitles;
- (NSString)title;
- (NSString)versionString;
- (SUUIColorScheme)colorScheme;
- (SUUIReviewsHistogramView)initWithClientContext:(id)a3;
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

@implementation SUUIReviewsHistogramView

- (SUUIReviewsHistogramView)initWithClientContext:(id)a3
{
  id v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)SUUIReviewsHistogramView;
  v6 = [(SUUIReviewsHistogramView *)&v73 init];
  v7 = v6;
  if (v6)
  {
    p_clientContext = (id *)&v6->_clientContext;
    objc_storeStrong((id *)&v6->_clientContext, a3);
    if (SUUIUserInterfaceIdiom(*p_clientContext) == 1)
    {
      v9 = objc_alloc_init(SUUIStarRatingControl);
      starRatingControl = v7->_starRatingControl;
      v7->_starRatingControl = v9;

      v11 = v7->_starRatingControl;
      v12 = (void *)MEMORY[0x263F827E8];
      v13 = SUUIBundle();
      v14 = [v12 imageNamed:@"LightRateControl" inBundle:v13];
      [(SUUIStarRatingControl *)v11 setEmptyStarsImage:v14];

      v15 = v7->_starRatingControl;
      v16 = (void *)MEMORY[0x263F827E8];
      v17 = SUUIBundle();
      v18 = [v16 imageNamed:@"RateControlFilled" inBundle:v17];
      [(SUUIStarRatingControl *)v15 setFilledStarsImage:v18];

      [(SUUIStarRatingControl *)v7->_starRatingControl sizeToFit];
      [(SUUIReviewsHistogramView *)v7 addSubview:v7->_starRatingControl];
      v19 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      p_starRatingControlLabel = (id *)&v7->_starRatingControlLabel;
      starRatingControlLabel = v7->_starRatingControlLabel;
      v7->_starRatingControlLabel = v19;

      v22 = v7->_starRatingControlLabel;
      v23 = [(SUUIReviewsHistogramView *)v7 backgroundColor];
      [(UILabel *)v22 setBackgroundColor:v23];

      v24 = v7->_starRatingControlLabel;
      v25 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
      [(UILabel *)v24 setFont:v25];

      v26 = v7->_starRatingControlLabel;
      v27 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
      if (v27)
      {
        [(UILabel *)v26 setTextColor:v27];
      }
      else
      {
        v31 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
        [(UILabel *)v26 setTextColor:v31];
      }
      id v32 = *p_starRatingControlLabel;
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"REVIEWS_TAP_TO_RATE" inTable:@"ProductPage"];
      }
      else {
      v43 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_TAP_TO_RATE" inBundles:0 inTable:@"ProductPage"];
      }
      [v32 setText:v43];

      [*p_starRatingControlLabel sizeToFit];
    }
    else
    {
      uint64_t v28 = [MEMORY[0x263F824E8] buttonWithType:1];
      appSupportButton = v7->_appSupportButton;
      v7->_appSupportButton = (UIButton *)v28;

      v30 = v7->_appSupportButton;
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_APP_SUPPORT" inTable:@"ProductPage"];
      }
      else {
      v33 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_APP_SUPPORT" inBundles:0 inTable:@"ProductPage"];
      }
      [(UIButton *)v30 setTitle:v33 forState:0];

      v34 = [(UIButton *)v7->_appSupportButton titleLabel];
      v35 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
      [v34 setFont:v35];

      v36 = [(UIButton *)v7->_appSupportButton titleLabel];
      [v36 setAdjustsFontSizeToFitWidth:1];

      v37 = [(UIButton *)v7->_appSupportButton titleLabel];
      [v37 setMinimumScaleFactor:0.833333333];

      [(UIButton *)v7->_appSupportButton sizeToFit];
      v38 = v7->_appSupportButton;
      v39 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
      [(UIButton *)v38 setTintColor:v39];

      [(SUUIReviewsHistogramView *)v7 addSubview:v7->_appSupportButton];
      uint64_t v40 = [MEMORY[0x263F824E8] buttonWithType:1];
      p_starRatingControlLabel = (id *)&v7->_writeAReviewButton;
      writeAReviewButton = v7->_writeAReviewButton;
      v7->_writeAReviewButton = (UIButton *)v40;

      v42 = v7->_writeAReviewButton;
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPHONE" inTable:@"ProductPage"];
      }
      else {
      v44 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPHONE" inBundles:0 inTable:@"ProductPage"];
      }
      [(UIButton *)v42 setTitle:v44 forState:0];

      v45 = [*p_starRatingControlLabel titleLabel];
      v46 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
      [v45 setFont:v46];

      v47 = [*p_starRatingControlLabel titleLabel];
      [v47 setAdjustsFontSizeToFitWidth:1];

      v48 = [*p_starRatingControlLabel titleLabel];
      [v48 setMinimumScaleFactor:0.833333333];

      [*p_starRatingControlLabel sizeToFit];
      id v49 = *p_starRatingControlLabel;
      v50 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
      [v49 setTintColor:v50];
    }
    [(SUUIReviewsHistogramView *)v7 addSubview:*p_starRatingControlLabel];
    id v51 = objc_alloc(MEMORY[0x263F82828]);
    v52 = [(SUUIReviewsHistogramView *)v7 _histogramImageForValues:&unk_2705D0A48];
    uint64_t v53 = [v51 initWithImage:v52];
    histogramImageView = v7->_histogramImageView;
    v7->_histogramImageView = (UIImageView *)v53;

    [(UIImageView *)v7->_histogramImageView sizeToFit];
    [(SUUIReviewsHistogramView *)v7 addSubview:v7->_histogramImageView];
    id v55 = objc_alloc(MEMORY[0x263F82828]);
    v56 = +[SUUIRatingStarsCache cacheWithProperties:1];
    v57 = [v56 ratingStarsImageForRating:0.0];
    uint64_t v58 = [v55 initWithImage:v57];
    userRatingStarsView = v7->_userRatingStarsView;
    v7->_userRatingStarsView = (UIImageView *)v58;

    [(SUUIReviewsHistogramView *)v7 addSubview:v7->_userRatingStarsView];
    v60 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    countLabel = v7->_countLabel;
    v7->_countLabel = v60;

    v62 = v7->_countLabel;
    v63 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v63)
    {
      [(UILabel *)v62 setTextColor:v63];
    }
    else
    {
      v64 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
      [(UILabel *)v62 setTextColor:v64];
    }
    [(UILabel *)v7->_countLabel setNumberOfLines:0];
    v65 = v7->_countLabel;
    v66 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v65 setFont:v66];

    [(SUUIReviewsHistogramView *)v7 addSubview:v7->_countLabel];
    [(SUUIReviewsHistogramView *)v7 setNumberOfUserRatings:0];
    v67 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomSeparatorView = v7->_bottomSeparatorView;
    v7->_bottomSeparatorView = v67;

    v69 = v7->_bottomSeparatorView;
    v70 = [(SUUIColorScheme *)v7->_colorScheme primaryTextColor];
    if (v70)
    {
      [(UIView *)v69 setBackgroundColor:v70];
    }
    else
    {
      v71 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v69 setBackgroundColor:v71];
    }
    [(SUUIReviewsHistogramView *)v7 addSubview:v7->_bottomSeparatorView];
  }

  return v7;
}

- (int64_t)personalStarRating
{
  return [(SUUIStarRatingControl *)self->_starRatingControl userRating];
}

- (UIControl)segmentedControl
{
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    id v4 = objc_alloc(MEMORY[0x263F82BB0]);
    id v5 = (UISegmentedControl *)[v4 initWithItems:MEMORY[0x263EFFA68]];
    v6 = self->_segmentedControl;
    self->_segmentedControl = v5;

    v7 = self->_segmentedControl;
    v8 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UISegmentedControl *)v7 setTintColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
      [(UISegmentedControl *)v7 setTintColor:v9];
    }
    segmentedControl = self->_segmentedControl;
  }
  return (UIControl *)segmentedControl;
}

- (NSArray)segmentedControlTitles
{
  v3 = [MEMORY[0x263EFF980] array];
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
  v2 = [(SUUIReviewsHistogramView *)self segmentedControl];
  int64_t v3 = [v2 selectedSegmentIndex];

  return v3;
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v25 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    countLabel = self->_countLabel;
    v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)countLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
      [(UILabel *)countLabel setTextColor:v9];
    }
    starRatingControlLabel = self->_starRatingControlLabel;
    v11 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v11)
    {
      [(UILabel *)starRatingControlLabel setTextColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)starRatingControlLabel setTextColor:v12];
    }
    titleLabel = self->_titleLabel;
    v14 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v14)
    {
      [(UILabel *)titleLabel setTextColor:v14];
    }
    else
    {
      v15 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)titleLabel setTextColor:v15];
    }
    histogramImageView = self->_histogramImageView;
    v17 = [(SUUIReviewsHistogramView *)self _histogramImageForValues:self->_histogramValues];
    [(UIImageView *)histogramImageView setImage:v17];

    segmentedControl = self->_segmentedControl;
    v19 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v19)
    {
      [(UISegmentedControl *)segmentedControl setTintColor:v19];
    }
    else
    {
      v20 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
      [(UISegmentedControl *)segmentedControl setTintColor:v20];
    }
    appSupportButton = self->_appSupportButton;
    v22 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    [(UIButton *)appSupportButton setTintColor:v22];

    writeAReviewButton = self->_writeAReviewButton;
    v24 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
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
    v7 = [(SUUIReviewsHistogramView *)self _histogramImageForValues:*p_histogramValues];
    [(UIImageView *)histogramImageView setImage:v7];
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  self->_numberOfUserRatings = a3;
  countLabel = self->_countLabel;
  id v5 = [(SUUIReviewsHistogramView *)self _countLabelString];
  [(UILabel *)countLabel setText:v5];

  [(SUUIReviewsHistogramView *)self setNeedsLayout];
}

- (void)setPersonalStarRating:(int64_t)a3
{
}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIReviewsHistogramView *)self segmentedControl];
  [v5 removeAllSegments];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SUUIReviewsHistogramView_setSegmentedControlTitles___block_invoke;
  v8[3] = &unk_265407BD0;
  id v9 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v8];
  uint64_t v7 = [v4 count];

  if (v7)
  {
    [v6 sizeToFit];
    [(SUUIReviewsHistogramView *)self addSubview:v6];
  }
  else
  {
    [v6 removeFromSuperview];
  }
}

uint64_t __54__SUUIReviewsHistogramView_setSegmentedControlTitles___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertSegmentWithTitle:a2 atIndex:a3 animated:0];
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4 = [(SUUIReviewsHistogramView *)self segmentedControl];
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
        id v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        uint64_t v7 = self->_titleLabel;
        self->_titleLabel = v6;

        id v8 = self->_titleLabel;
        id v9 = [(SUUIReviewsHistogramView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_titleLabel;
        v13 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v13)
        {
          [(UILabel *)v12 setTextColor:v13];
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v12 setTextColor:v15];
        }
        [(SUUIReviewsHistogramView *)self addSubview:self->_titleLabel];
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
    [(SUUIReviewsHistogramView *)self setNeedsLayout];
  }
}

- (void)setUserRating:(double)a3
{
  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    userRatingStarsView = self->_userRatingStarsView;
    id v6 = +[SUUIRatingStarsCache cacheWithProperties:1];
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
    uint64_t v7 = [(SUUIReviewsHistogramView *)self _countLabelString];
    [(UILabel *)countLabel setText:v7];

    [(SUUIReviewsHistogramView *)self setNeedsLayout];
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
  [(SUUIReviewsHistogramView *)self bounds];
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
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      double v15 = 295.0;
    }
    else
    {
      id v16 = [MEMORY[0x263F82670] currentDevice];
      if ([v16 userInterfaceIdiom] == 1)
      {
        double v15 = 290.0;
      }
      else
      {
        v17 = [MEMORY[0x263F82B60] mainScreen];
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
    [(SUUIStarRatingControl *)self->_starRatingControl frame];
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
    -[SUUIStarRatingControl setFrame:](self->_starRatingControl, "setFrame:", MaxX + 8.0, v50, v60, v40);
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
    v56 = [MEMORY[0x263F82B60] mainScreen];
    [v56 scale];
    double v58 = 1.0 / v57;

    v59 = self->_bottomSeparatorView;
    -[UIView setFrame:](v59, "setFrame:", 15.0, v6 - v58, v4 + -15.0, v58);
  }
}

- (void)setBackgroundColor:(id)a3
{
  countLabel = self->_countLabel;
  id v5 = a3;
  [(UILabel *)countLabel setBackgroundColor:v5];
  [(SUUIStarRatingControl *)self->_starRatingControl setBackgroundColor:v5];
  [(UILabel *)self->_starRatingControlLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIReviewsHistogramView;
  [(SUUIReviewsHistogramView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
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
  uint64_t v6 = SUUIUserInterfaceIdiom(self->_clientContext);
  uint64_t v7 = &off_2568A0000;
  if (v6 == 1)
  {
    int v8 = 0;
    double v9 = 295.0;
  }
  else
  {
    double v3 = [MEMORY[0x263F82670] currentDevice];
    if ([v3 userInterfaceIdiom] == 1)
    {
      int v8 = 0;
      double v9 = 290.0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F82B60] mainScreen];
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
  double v13 = [MEMORY[0x263F82B60] mainScreen];
  [v13 scale];
  CGFloat v15 = v14;
  v67.double width = v9;
  v67.CGFloat height = v12;
  UIGraphicsBeginImageContextWithOptions(v67, 0, v15);

  c = UIGraphicsGetCurrentContext();
  id v16 = (void *)MEMORY[0x263F827E8];
  v17 = SUUIBundle();
  double v18 = [v16 imageNamed:@"SmallStarFull" inBundle:v17];

  v19 = [(SUUIColorScheme *)v63->_colorScheme primaryTextColor];
  if (v19)
  {
    v20 = [(SUUIColorScheme *)v63->_colorScheme primaryTextColor];
    double v21 = SUUIColorWithAlpha(v20, 0.1);
    double v22 = SUUITintedImage(v18, 0, v21);
  }
  else
  {
    v20 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.05];
    double v22 = SUUITintedImage(v18, 0, v20);
  }

  double v23 = [(SUUIColorScheme *)v63->_colorScheme primaryTextColor];
  if (v23)
  {
    double v24 = SUUITintedImage(v18, 0, v23);
  }
  else
  {
    double v25 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
    double v24 = SUUITintedImage(v18, 0, v25);
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
  v41 = v63;
  if (SUUIUserInterfaceIdiom(v63->_clientContext) == 1)
  {
    double v42 = 295.0;
    uint64_t v43 = 424;
  }
  else
  {
    double v44 = [MEMORY[0x263F82670] currentDevice];
    if ([v44 userInterfaceIdiom] == 1)
    {
      double v42 = 290.0;
    }
    else
    {
      double v45 = [MEMORY[0x263F82B60] mainScreen];
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

      CGRect v65 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v48, (float)((float)v47 * 14.0) + 6.0, v49, 2.0, 2.0);
      double v54 = [*(id *)((char *)&v41->super.super.super.isa + v43) primaryTextColor];
      if (v54)
      {
        [*(id *)((char *)&v41->super.super.super.isa + v43) primaryTextColor];
        v56 = uint64_t v55 = v43;
        double v57 = SUUIColorWithAlpha(v56, 0.1);
        [v57 set];

        v41 = v63;
      }
      else
      {
        [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.05];
        v56 = uint64_t v55 = v43;
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
      v59 = v58;
      if (v58)
      {
        uint64_t v43 = v55;
        [v58 set];
      }
      else
      {
        double v60 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
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
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setNumberStyle:1];
  double v4 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
  id v5 = [v3 stringFromNumber:v4];

  int64_t numberOfUserRatings = self->_numberOfUserRatings;
  if (!numberOfUserRatings)
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_COUNT_NONE" inTable:@"ProductPage"];
    }
    else {
    double v12 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_COUNT_NONE" inBundles:0 inTable:@"ProductPage"];
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
        uint64_t v11 = [(SUUIClientContext *)v7 localizedStringForKey:v8 inTable:@"ProductPage"];
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
    uint64_t v11 = +[SUUIClientContext localizedStringForKey:v14 inBundles:0 inTable:@"ProductPage"];
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
    uint64_t v13 = +[SUUIClientContext localizedStringForKey:v16 inBundles:0 inTable:@"ProductPage"];
    goto LABEL_26;
  }
  if (!v7)
  {
    id v16 = @"REVIEWS_COUNT_ALL_VERSIONS_ONE";
    goto LABEL_25;
  }
  double v10 = @"REVIEWS_COUNT_ALL_VERSIONS_ONE";
LABEL_18:
  uint64_t v13 = [(SUUIClientContext *)v7 localizedStringForKey:v10 inTable:@"ProductPage"];
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

- (SUUIColorScheme)colorScheme
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

@end