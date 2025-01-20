@interface SKUIReviewsHistogramViewController
- (NSArray)segmentedControlTitles;
- (NSString)versionString;
- (SKUIClientContext)clientContext;
- (SKUIReviewList)reviewList;
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

@implementation SKUIReviewsHistogramViewController

- (UIControl)appSupportButton
{
  v2 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 appSupportButton];

  return (UIControl *)v3;
}

- (int64_t)personalStarRating
{
  return [(SKUIReviewsHistogramView *)self->_histogramView personalStarRating];
}

- (UIControl)segmentedControl
{
  v2 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 segmentedControl];

  return (UIControl *)v3;
}

- (NSArray)segmentedControlTitles
{
  return [(SKUIReviewsHistogramView *)self->_histogramView segmentedControlTitles];
}

- (int64_t)selectedSegmentIndex
{
  histogramView = self->_histogramView;
  if (histogramView) {
    return [(SKUIReviewsHistogramView *)histogramView selectedSegmentIndex];
  }
  else {
    return -1;
  }
}

- (void)setPersonalStarRating:(int64_t)a3
{
  id v4 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  [v4 setPersonalStarRating:a3];
}

- (void)setReviewList:(id)a3
{
  v5 = (SKUIReviewList *)a3;
  p_reviewList = &self->_reviewList;
  if (self->_reviewList != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_reviewList, a3);
    p_reviewList = (SKUIReviewList **)[(SKUIReviewsHistogramViewController *)self _reloadHistogram];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_reviewList, v5);
}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  [v5 setSegmentedControlTitles:v4];
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  [v4 setSelectedSegmentIndex:a3];
}

- (void)setVersionString:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  [v5 setVersionString:v4];
}

- (UIControl)starRatingControl
{
  v2 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 starRatingControl];

  return (UIControl *)v3;
}

- (NSString)versionString
{
  return [(SKUIReviewsHistogramView *)self->_histogramView versionString];
}

- (UIControl)writeAReviewButton
{
  v2 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  v3 = [v2 writeAReviewButton];

  return (UIControl *)v3;
}

- (void)loadView
{
  id v3 = [(SKUIReviewsHistogramViewController *)self _histogramView];
  [(SKUIReviewsHistogramViewController *)self setView:v3];
}

- (id)_histogramView
{
  histogramView = self->_histogramView;
  if (!histogramView)
  {
    id v4 = [[SKUIReviewsHistogramView alloc] initWithClientContext:self->_clientContext];
    id v5 = self->_histogramView;
    self->_histogramView = v4;

    v6 = self->_histogramView;
    clientContext = self->_clientContext;
    if (SKUIUserInterfaceIdiom(clientContext) == 1) {
      v8 = @"REVIEWS_HISTOGRAM_TITLE_IPAD";
    }
    else {
      v8 = @"REVIEWS_HISTOGRAM_TITLE_IPHONE";
    }
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:v8 inTable:@"ProductPage"];
    }
    else {
    v9 = +[SKUIClientContext localizedStringForKey:v8 inBundles:0 inTable:@"ProductPage"];
    }
    [(SKUIReviewsHistogramView *)v6 setTitle:v9];

    [(SKUIReviewsHistogramViewController *)self _reloadHistogram];
    histogramView = self->_histogramView;
  }

  return histogramView;
}

- (void)_reloadHistogram
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(SKUIReviewList *)self->_reviewList ratingCount];
  float v8 = (float)v7;
  [(SKUIReviewsHistogramView *)self->_histogramView setNumberOfUserRatings:(uint64_t)(float)v7];
  histogramView = self->_histogramView;
  if (v7)
  {
    v9 = NSNumber;
    *(float *)&double v10 = (float)[(SKUIReviewList *)self->_reviewList oneStarRatingCount] / v8;
    v2 = [v9 numberWithFloat:v10];
    v24 = v2;
    v11 = NSNumber;
    *(float *)&double v12 = (float)[(SKUIReviewList *)self->_reviewList twoStarRatingCount] / v8;
    id v3 = [v11 numberWithFloat:v12];
    v25 = v3;
    v13 = NSNumber;
    *(float *)&double v14 = (float)[(SKUIReviewList *)self->_reviewList threeStarRatingCount] / v8;
    id v4 = [v13 numberWithFloat:v14];
    v26 = v4;
    v15 = NSNumber;
    *(float *)&double v16 = (float)[(SKUIReviewList *)self->_reviewList fourStarRatingCount] / v8;
    id v5 = [v15 numberWithFloat:v16];
    v27 = v5;
    v17 = NSNumber;
    *(float *)&double v18 = (float)[(SKUIReviewList *)self->_reviewList fiveStarRatingCount] / v8;
    v19 = [v17 numberWithFloat:v18];
  }
  else
  {
    v19 = &unk_1F1D61DF0;
    v24 = &unk_1F1D61DF0;
    v25 = &unk_1F1D61DF0;
    v26 = &unk_1F1D61DF0;
    v27 = &unk_1F1D61DF0;
  }
  v28 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:5];
  [(SKUIReviewsHistogramView *)histogramView setHistogramValues:v20];

  if (v7)
  {
  }
  v21 = self->_histogramView;
  [(SKUIReviewList *)self->_reviewList userRating];
  [(SKUIReviewsHistogramView *)v21 setUserRating:(float)(v22 / 5.0)];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIReviewList)reviewList
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