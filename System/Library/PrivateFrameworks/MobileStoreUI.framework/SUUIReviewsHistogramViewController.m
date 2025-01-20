@interface SUUIReviewsHistogramViewController
- (NSArray)segmentedControlTitles;
- (NSString)versionString;
- (SUUIClientContext)clientContext;
- (SUUIReviewList)reviewList;
- (UIControl)appSupportButton;
- (UIControl)segmentedControl;
- (UIControl)starRatingControl;
- (UIControl)writeAReviewButton;
- (id)_histogramView;
- (int64_t)personalStarRating;
- (int64_t)selectedSegmentIndex;
- (void)_reloadHistogram;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setPersonalStarRating:(int64_t)a3;
- (void)setReviewList:(id)a3;
- (void)setSegmentedControlTitles:(id)a3;
- (void)setSelectedSegmentIndex:(int64_t)a3;
- (void)setVersionString:(id)a3;
@end

@implementation SUUIReviewsHistogramViewController

- (UIControl)appSupportButton
{
  v2 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 appSupportButton];

  return (UIControl *)v3;
}

- (int64_t)personalStarRating
{
  return [(SUUIReviewsHistogramView *)self->_histogramView personalStarRating];
}

- (UIControl)segmentedControl
{
  v2 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 segmentedControl];

  return (UIControl *)v3;
}

- (NSArray)segmentedControlTitles
{
  return [(SUUIReviewsHistogramView *)self->_histogramView segmentedControlTitles];
}

- (int64_t)selectedSegmentIndex
{
  histogramView = self->_histogramView;
  if (histogramView) {
    return [(SUUIReviewsHistogramView *)histogramView selectedSegmentIndex];
  }
  else {
    return -1;
  }
}

- (void)setPersonalStarRating:(int64_t)a3
{
  id v4 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  [v4 setPersonalStarRating:a3];
}

- (void)setReviewList:(id)a3
{
  v5 = (SUUIReviewList *)a3;
  p_reviewList = &self->_reviewList;
  if (self->_reviewList != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_reviewList, a3);
    p_reviewList = (SUUIReviewList **)[(SUUIReviewsHistogramViewController *)self _reloadHistogram];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_reviewList, v5);
}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  [v5 setSegmentedControlTitles:v4];
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  [v4 setSelectedSegmentIndex:a3];
}

- (void)setVersionString:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  [v5 setVersionString:v4];
}

- (UIControl)starRatingControl
{
  v2 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 starRatingControl];

  return (UIControl *)v3;
}

- (NSString)versionString
{
  return [(SUUIReviewsHistogramView *)self->_histogramView versionString];
}

- (UIControl)writeAReviewButton
{
  v2 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 writeAReviewButton];

  return (UIControl *)v3;
}

- (void)loadView
{
  id v3 = [(SUUIReviewsHistogramViewController *)self _histogramView];
  [(SUUIReviewsHistogramViewController *)self setView:v3];
}

- (id)_histogramView
{
  histogramView = self->_histogramView;
  if (!histogramView)
  {
    id v4 = [[SUUIReviewsHistogramView alloc] initWithClientContext:self->_clientContext];
    id v5 = self->_histogramView;
    self->_histogramView = v4;

    v6 = self->_histogramView;
    clientContext = self->_clientContext;
    if (SUUIUserInterfaceIdiom(clientContext) == 1) {
      v8 = @"REVIEWS_HISTOGRAM_TITLE_IPAD";
    }
    else {
      v8 = @"REVIEWS_HISTOGRAM_TITLE_IPHONE";
    }
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:v8 inTable:@"ProductPage"];
    }
    else {
    v9 = +[SUUIClientContext localizedStringForKey:v8 inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIReviewsHistogramView *)v6 setTitle:v9];

    [(SUUIReviewsHistogramViewController *)self _reloadHistogram];
    histogramView = self->_histogramView;
  }
  return histogramView;
}

- (void)_reloadHistogram
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(SUUIReviewList *)self->_reviewList ratingCount];
  float v8 = (float)v7;
  [(SUUIReviewsHistogramView *)self->_histogramView setNumberOfUserRatings:(uint64_t)(float)v7];
  histogramView = self->_histogramView;
  if (v7)
  {
    v9 = NSNumber;
    *(float *)&double v10 = (float)[(SUUIReviewList *)self->_reviewList oneStarRatingCount] / v8;
    v2 = [v9 numberWithFloat:v10];
    v24 = v2;
    v11 = NSNumber;
    *(float *)&double v12 = (float)[(SUUIReviewList *)self->_reviewList twoStarRatingCount] / v8;
    id v3 = [v11 numberWithFloat:v12];
    v25 = v3;
    v13 = NSNumber;
    *(float *)&double v14 = (float)[(SUUIReviewList *)self->_reviewList threeStarRatingCount] / v8;
    id v4 = [v13 numberWithFloat:v14];
    v26 = v4;
    v15 = NSNumber;
    *(float *)&double v16 = (float)[(SUUIReviewList *)self->_reviewList fourStarRatingCount] / v8;
    id v5 = [v15 numberWithFloat:v16];
    v27 = v5;
    v17 = NSNumber;
    *(float *)&double v18 = (float)[(SUUIReviewList *)self->_reviewList fiveStarRatingCount] / v8;
    v19 = [v17 numberWithFloat:v18];
  }
  else
  {
    v19 = &unk_2705D0C10;
    v24 = &unk_2705D0C10;
    v25 = &unk_2705D0C10;
    v26 = &unk_2705D0C10;
    v27 = &unk_2705D0C10;
  }
  v28 = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:5];
  [(SUUIReviewsHistogramView *)histogramView setHistogramValues:v20];

  if (v7)
  {
  }
  v21 = self->_histogramView;
  [(SUUIReviewList *)self->_reviewList userRating];
  [(SUUIReviewsHistogramView *)v21 setUserRating:(float)(v22 / 5.0)];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIReviewList)reviewList
{
  return self->_reviewList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewList, 0);
  objc_storeStrong((id *)&self->_histogramView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end