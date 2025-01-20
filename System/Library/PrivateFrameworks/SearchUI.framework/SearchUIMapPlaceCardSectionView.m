@interface SearchUIMapPlaceCardSectionView
- (BOOL)alreadyDispatchedOnMainQueue;
- (BOOL)isReportAProblemAvailable;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (SearchUIMapsViewController)mapViewController;
- (id)setupContentView;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)didMoveToWindow;
- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4;
- (void)placeViewControllerDidUpdateHeight:(id)a3;
- (void)setAlreadyDispatchedOnMainQueue:(BOOL)a3;
- (void)setMapViewController:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTintColorProvider;
@end

@implementation SearchUIMapPlaceCardSectionView

- (id)setupContentView
{
  [(SearchUIMapPlaceCardSectionView *)self updateTintColorProvider];
  [(SearchUIMapPlaceCardSectionView *)self setDelegate:self];
  v3 = [(SearchUICardSectionView *)self rowModel];
  v4 = [v3 cardSection];

  v5 = [SearchUIMapsViewController alloc];
  v6 = [v4 mapsData];
  uint64_t v7 = [v4 shouldSearchDirectionsAlongCurrentRoute];
  v8 = [(SearchUICardSectionView *)self feedbackDelegate];
  v9 = [(SearchUICardSectionView *)self rowModel];
  v10 = -[SearchUIMapsViewController initWithMapsData:searchAlongTheRoute:feedbackListener:queryId:](v5, "initWithMapsData:searchAlongTheRoute:feedbackListener:queryId:", v6, v7, v8, [v9 queryId]);

  [(MUPlaceViewController *)v10 setPlaceViewControllerDelegate:self];
  [(MUPlaceViewController *)v10 setScrollEnabled:0];
  [(SearchUIMapPlaceCardSectionView *)self setMapViewController:v10];
  v11 = [(SearchUIMapsViewController *)v10 view];
  [v11 setBackgroundColor:0];

  v12 = [(SearchUIMapsViewController *)v10 view];

  return v12;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIMapPlaceCardSectionView;
  [(SearchUIMapPlaceCardSectionView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SearchUIMapPlaceCardSectionView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIMapPlaceCardSectionView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(SearchUIMapPlaceCardSectionView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIMapPlaceCardSectionView;
  [(SearchUIMapPlaceCardSectionView *)&v3 didMoveToWindow];
  [(SearchUIMapPlaceCardSectionView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIMapPlaceCardSectionView;
  [(SearchUIMapPlaceCardSectionView *)&v4 tlk_updateForAppearance:a3];
  [(SearchUIMapPlaceCardSectionView *)self updateTintColorProvider];
}

- (void)updateTintColorProvider
{
  v2 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
  objc_super v3 = (void *)MEMORY[0x1E4F743A0];
  if ([v2 isVibrant])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__SearchUIMapPlaceCardSectionView_updateTintColorProvider__block_invoke;
    v4[3] = &unk_1E6E74020;
    id v5 = v2;
    [v3 setTintColorProvider:v4];
  }
  else
  {
    [v3 setTintColorProvider:0];
  }
}

id __58__SearchUIMapPlaceCardSectionView_updateTintColorProvider__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDark]) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v1 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v1;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIMapPlaceCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v5, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double width = a4.width;
  id v7 = a5;
  id v8 = [(SearchUICardSectionView *)self contentView];

  if (v8 == v7)
  {
    v13 = [(SearchUIMapPlaceCardSectionView *)self mapViewController];
    LODWORD(v14) = 1148846080;
    LODWORD(v15) = 1112014848;
    objc_msgSend(v13, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, 0.0, v14, v15);
    double v9 = v16;
    double v10 = v17;

    if (v10 == 0.0)
    {
      if (+[SearchUIUtilities isIpad])
      {
        double v10 = 0.1;
      }
      else
      {
        v18 = [(SearchUIMapPlaceCardSectionView *)self tlks_screen];
        [v18 bounds];
        double v10 = v19;
      }
    }
  }
  else
  {
    double v9 = *MEMORY[0x1E4F4BED8];
    double v10 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
  }
  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)placeViewControllerDidUpdateHeight:(id)a3
{
  if (![(SearchUIMapPlaceCardSectionView *)self alreadyDispatchedOnMainQueue])
  {
    [(SearchUIMapPlaceCardSectionView *)self setAlreadyDispatchedOnMainQueue:1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__SearchUIMapPlaceCardSectionView_placeViewControllerDidUpdateHeight___block_invoke;
    block[3] = &unk_1E6E72730;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__SearchUIMapPlaceCardSectionView_placeViewControllerDidUpdateHeight___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 invalidateIntrinsicContentSize];

  [*(id *)(a1 + 32) didInvalidateSizeAnimate:0];
  objc_super v3 = *(void **)(a1 + 32);
  return [v3 setAlreadyDispatchedOnMainQueue:0];
}

- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
}

- (BOOL)isReportAProblemAvailable
{
  return 1;
}

- (SearchUIMapsViewController)mapViewController
{
  return (SearchUIMapsViewController *)objc_getProperty(self, a2, 792, 1);
}

- (void)setMapViewController:(id)a3
{
}

- (BOOL)alreadyDispatchedOnMainQueue
{
  return self->_alreadyDispatchedOnMainQueue;
}

- (void)setAlreadyDispatchedOnMainQueue:(BOOL)a3
{
  self->_alreadyDispatchedOnMainQueue = a3;
}

- (void).cxx_destruct
{
}

@end