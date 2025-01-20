@interface PUPhotoBrowserTitleViewController
- (BOOL)_isPerformingChanges;
- (BOOL)_isUpdating;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateDayAndTimeDescriptions;
- (BOOL)_needsUpdateGestureRecognizers;
- (BOOL)_needsUpdateLabels;
- (BOOL)isTappable;
- (BOOL)isUsingCompactTitleView;
- (NSDate)creationDate;
- (NSString)_dayDescription;
- (NSString)_timeDescription;
- (NSString)geoDescription;
- (NSString)subtitle;
- (NSString)title;
- (PLDateRangeFormatter)_dayFormatter;
- (PLDateRangeFormatter)_timeFormatter;
- (PUPhotoBrowserTitleViewController)init;
- (PUPhotoBrowserTitleViewControllerDelegate)delegate;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (UIView)view;
- (void)_assertInsideChangeBlock;
- (void)_assertInsideUpdate;
- (void)_dateFormatterChanged:(id)a3;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_invalidateDayAndTimeDescriptions;
- (void)_invalidateGestureRecognizers;
- (void)_invalidateLabels;
- (void)_setDayDescription:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setNeedsUpdateDayAndTimeDescriptions:(BOOL)a3;
- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3;
- (void)_setNeedsUpdateLabels:(BOOL)a3;
- (void)_setPerformingChanges:(BOOL)a3;
- (void)_setTapGestureRecognizer:(id)a3;
- (void)_setTimeDescription:(id)a3;
- (void)_setUpdating:(BOOL)a3;
- (void)_updateDayAndTimeDescriptionsIfNeeded;
- (void)_updateGestureRecognizersIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLabelsIfNeeded;
- (void)performChanges:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeoDescription:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setTappable:(BOOL)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setUsingCompactTitleView:(BOOL)a3;
@end

@implementation PUPhotoBrowserTitleViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__timeDescription, 0);
  objc_storeStrong((id *)&self->__dayDescription, 0);
  objc_storeStrong((id *)&self->__timeFormatter, 0);
  objc_storeStrong((id *)&self->__dayFormatter, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_geoDescription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)_setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (NSString)_timeDescription
{
  return self->__timeDescription;
}

- (NSString)_dayDescription
{
  return self->__dayDescription;
}

- (PLDateRangeFormatter)_timeFormatter
{
  return self->__timeFormatter;
}

- (PLDateRangeFormatter)_dayFormatter
{
  return self->__dayFormatter;
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setNeedsUpdateLabels:(BOOL)a3
{
  self->__needsUpdateLabels = a3;
}

- (BOOL)_needsUpdateLabels
{
  return self->__needsUpdateLabels;
}

- (void)_setNeedsUpdateDayAndTimeDescriptions:(BOOL)a3
{
  self->__needsUpdateDayAndTimeDescriptions = a3;
}

- (BOOL)_needsUpdateDayAndTimeDescriptions
{
  return self->__needsUpdateDayAndTimeDescriptions;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)geoDescription
{
  return self->_geoDescription;
}

- (BOOL)isUsingCompactTitleView
{
  return self->_usingCompactTitleView;
}

- (BOOL)isTappable
{
  return self->_tappable;
}

- (PUPhotoBrowserTitleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoBrowserTitleViewControllerDelegate *)WeakRetained;
}

- (UIView)view
{
  return self->_view;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  if ([a3 state] == 3 && self->_delegateFlags.respondsToTapped)
  {
    id v4 = [(PUPhotoBrowserTitleViewController *)self delegate];
    [v4 photoBrowserTitleViewControllerTapped:self];
  }
}

- (void)_updateGestureRecognizersIfNeeded
{
  if ([(PUPhotoBrowserTitleViewController *)self _needsUpdateGestureRecognizers])
  {
    [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdateGestureRecognizers:0];
    id v4 = [(PUPhotoBrowserTitleViewController *)self _tapGestureRecognizer];
    if ([(PUPhotoBrowserTitleViewController *)self isTappable])
    {
      id v3 = v4;
      if (!v4)
      {
        id v5 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapGestureRecognizer_];
        [(UIView *)self->_view addGestureRecognizer:v5];
        id v3 = v5;
      }
    }
    else
    {
      id v3 = v4;
      if (v4)
      {
        [(UIView *)self->_view removeGestureRecognizer:v4];

        id v3 = 0;
      }
    }
    id v6 = v3;
    [(PUPhotoBrowserTitleViewController *)self _setTapGestureRecognizer:v3];
  }
}

- (void)_invalidateGestureRecognizers
{
  [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdateGestureRecognizers:1];
  [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdate];
}

- (void)_updateLabelsIfNeeded
{
  if ([(PUPhotoBrowserTitleViewController *)self _needsUpdateLabels])
  {
    [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdateLabels:0];
    id v3 = +[PUInterfaceManager currentTheme];
    id v4 = [v3 photoBrowserPhotoPrimaryTitleFont];
    id v5 = [v3 photoBrowserPhotoSubtitleFont];
    id v6 = [(PUPhotoBrowserTitleViewController *)self geoDescription];
    v7 = [(PUPhotoBrowserTitleViewController *)self _dayDescription];
    v8 = [(PUPhotoBrowserTitleViewController *)self _timeDescription];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5F28940;
    id v9 = v7;
    id v34 = v9;
    id v10 = v8;
    id v35 = v10;
    v11 = (void (**)(void))_Block_copy(aBlock);
    BOOL usingCompactTitleView = self->_usingCompactTitleView;
    uint64_t v13 = [v6 length];
    v24 = v6;
    v25 = v9;
    if (usingCompactTitleView)
    {
      if (v13)
      {
        id v14 = v6;
        v15 = 0;
      }
      else
      {
        v11[2](v11);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v3 photoBrowserTimeTitleFont];

        v15 = 0;
        id v4 = (void *)v17;
      }
    }
    else
    {
      if (v13)
      {
        id v14 = v6;
        v11[2](v11);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = v9;
        id v16 = v10;
      }
      v15 = v16;
    }
    v18 = self->_view;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke_2;
    v26[3] = &unk_1E5F28DC0;
    v27 = v18;
    id v28 = v14;
    id v29 = v15;
    id v30 = v4;
    id v31 = v5;
    v32 = self;
    id v19 = v5;
    id v20 = v4;
    id v21 = v15;
    id v22 = v14;
    v23 = v18;
    [(UIView *)v23 performChanges:v26];
  }
}

id __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) length];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    if ([v3 length])
    {
      id v4 = PULocalizedString(@"PUPHOTOBROWSER_TITLE_LONG_DATE_FORMAT");
      id v5 = PUStringWithValidatedFormat();

      goto LABEL_7;
    }
    id v6 = *(id *)(a1 + 32);
  }
  else
  {
    id v6 = v3;
  }
  id v5 = v6;
LABEL_7:
  return v5;
}

uint64_t __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSubtitle:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setTitleFont:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setSubtitleFont:*(void *)(a1 + 64)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 72) + 10);
  return [v2 setVerticalSizeClass:v3];
}

- (void)_invalidateLabels
{
  [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdateLabels:1];
  [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdate];
}

- (void)_updateDayAndTimeDescriptionsIfNeeded
{
  if ([(PUPhotoBrowserTitleViewController *)self _needsUpdateDayAndTimeDescriptions])
  {
    [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdateDayAndTimeDescriptions:0];
    id v7 = [(PUPhotoBrowserTitleViewController *)self creationDate];
    if (v7)
    {
      uint64_t v3 = [(PUPhotoBrowserTitleViewController *)self _dayFormatter];
      id v4 = [v3 stringFromDate:v7];

      id v5 = [(PUPhotoBrowserTitleViewController *)self _timeFormatter];
      id v6 = [v5 stringFromDate:v7];
    }
    else
    {
      id v6 = &stru_1F06BE7B8;
      id v4 = &stru_1F06BE7B8;
    }
    [(PUPhotoBrowserTitleViewController *)self _setDayDescription:v4];
    [(PUPhotoBrowserTitleViewController *)self _setTimeDescription:v6];
  }
}

- (void)_invalidateDayAndTimeDescriptions
{
  [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdateDayAndTimeDescriptions:1];
  [(PUPhotoBrowserTitleViewController *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (![(PUPhotoBrowserTitleViewController *)self _isUpdating]
    && ![(PUPhotoBrowserTitleViewController *)self _isPerformingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPhotoBrowserTitleViewController.m" lineNumber:202 description:@"not within a change block or update"];
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUPhotoBrowserTitleViewController *)self _needsUpdateDayAndTimeDescriptions]|| [(PUPhotoBrowserTitleViewController *)self _needsUpdateLabels])
  {
    return 1;
  }
  return [(PUPhotoBrowserTitleViewController *)self _needsUpdateGestureRecognizers];
}

- (void)_updateIfNeeded
{
  if ([(PUPhotoBrowserTitleViewController *)self _needsUpdate])
  {
    BOOL v4 = [(PUPhotoBrowserTitleViewController *)self _isUpdating];
    [(PUPhotoBrowserTitleViewController *)self _setUpdating:1];
    [(PUPhotoBrowserTitleViewController *)self _updateDayAndTimeDescriptionsIfNeeded];
    [(PUPhotoBrowserTitleViewController *)self _updateLabelsIfNeeded];
    [(PUPhotoBrowserTitleViewController *)self _updateGestureRecognizersIfNeeded];
    [(PUPhotoBrowserTitleViewController *)self _setUpdating:v4];
    if ([(PUPhotoBrowserTitleViewController *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PUPhotoBrowserTitleViewController.m" lineNumber:190 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)performChanges:(id)a3
{
  id v7 = (void (**)(void))a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUPhotoBrowserTitleViewController.m", 165, @"Invalid parameter not satisfying: %@", @"nil != changeBlock" object file lineNumber description];
  }
  BOOL v5 = [(PUPhotoBrowserTitleViewController *)self _isPerformingChanges];
  [(PUPhotoBrowserTitleViewController *)self _setPerformingChanges:1];
  v7[2]();
  [(PUPhotoBrowserTitleViewController *)self _setPerformingChanges:v5];
  if (!v5) {
    [(PUPhotoBrowserTitleViewController *)self _updateIfNeeded];
  }
}

- (void)_assertInsideUpdate
{
  if (![(PUPhotoBrowserTitleViewController *)self _isUpdating])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPhotoBrowserTitleViewController.m" lineNumber:161 description:@"not withing update"];
  }
}

- (void)_assertInsideChangeBlock
{
  if (![(PUPhotoBrowserTitleViewController *)self _isPerformingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPhotoBrowserTitleViewController.m" lineNumber:156 description:@"not within a change block"];
  }
}

- (void)_dateFormatterChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PUPhotoBrowserTitleViewController__dateFormatterChanged___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUPhotoBrowserTitleViewController *)self performChanges:v3];
}

uint64_t __59__PUPhotoBrowserTitleViewController__dateFormatterChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDayAndTimeDescriptions];
}

- (void)_setTimeDescription:(id)a3
{
  id v7 = (NSString *)a3;
  [(PUPhotoBrowserTitleViewController *)self _assertInsideUpdate];
  BOOL v5 = v7;
  if (self->__timeDescription != v7)
  {
    BOOL v6 = -[NSString isEqualToString:](v7, "isEqualToString:");
    BOOL v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->__timeDescription, a3);
      [(PUPhotoBrowserTitleViewController *)self _invalidateLabels];
      BOOL v5 = v7;
    }
  }
}

- (void)_setDayDescription:(id)a3
{
  id v7 = (NSString *)a3;
  [(PUPhotoBrowserTitleViewController *)self _assertInsideUpdate];
  BOOL v5 = v7;
  if (self->__dayDescription != v7)
  {
    BOOL v6 = -[NSString isEqualToString:](v7, "isEqualToString:");
    BOOL v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->__dayDescription, a3);
      [(PUPhotoBrowserTitleViewController *)self _invalidateLabels];
      BOOL v5 = v7;
    }
  }
}

- (void)setSubtitleTextColor:(id)a3
{
}

- (UIColor)subtitleTextColor
{
  return (UIColor *)[(UIView *)self->_view subtitleTextColor];
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIColor)titleTextColor
{
  return (UIColor *)[(UIView *)self->_view titleTextColor];
}

- (void)setCreationDate:(id)a3
{
  id v7 = (NSDate *)a3;
  [(PUPhotoBrowserTitleViewController *)self _assertInsideChangeBlock];
  BOOL v5 = v7;
  if (self->_creationDate != v7)
  {
    char v6 = -[NSDate isEqual:](v7, "isEqual:");
    BOOL v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_creationDate, a3);
      [(PUPhotoBrowserTitleViewController *)self _invalidateDayAndTimeDescriptions];
      BOOL v5 = v7;
    }
  }
}

- (void)setGeoDescription:(id)a3
{
  id v7 = (NSString *)a3;
  [(PUPhotoBrowserTitleViewController *)self _assertInsideChangeBlock];
  BOOL v5 = v7;
  if (self->_geoDescription != v7)
  {
    BOOL v6 = -[NSString isEqualToString:](v7, "isEqualToString:");
    BOOL v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_geoDescription, a3);
      [(PUPhotoBrowserTitleViewController *)self _invalidateLabels];
      BOOL v5 = v7;
    }
  }
}

- (void)setUsingCompactTitleView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUPhotoBrowserTitleViewController *)self _assertInsideChangeBlock];
  if (self->_usingCompactTitleView != v3)
  {
    self->_BOOL usingCompactTitleView = v3;
    [(PUPhotoBrowserTitleViewController *)self _invalidateLabels];
  }
}

- (NSString)subtitle
{
  return (NSString *)[(UIView *)self->_view subtitle];
}

- (NSString)title
{
  return (NSString *)[(UIView *)self->_view title];
}

- (void)setTappable:(BOOL)a3
{
  if (self->_tappable != a3)
  {
    self->_tappable = a3;
    [(PUPhotoBrowserTitleViewController *)self _invalidateGestureRecognizers];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTapped = objc_opt_respondsToSelector() & 1;
  }
}

- (PUPhotoBrowserTitleViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoBrowserTitleViewController;
  uint64_t v2 = [(PUPhotoBrowserTitleViewController *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F903B8]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    view = v2->_view;
    v2->_view = (UIView *)v4;

    uint64_t v6 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:2];
    dayFormatter = v2->__dayFormatter;
    v2->__dayFormatter = (PLDateRangeFormatter *)v6;

    [(PLDateRangeFormatter *)v2->__dayFormatter setUseLocalDates:1];
    uint64_t v8 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:7];
    timeFormatter = v2->__timeFormatter;
    v2->__timeFormatter = (PLDateRangeFormatter *)v8;

    [(PLDateRangeFormatter *)v2->__timeFormatter setUseLocalDates:1];
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__dateFormatterChanged_ name:*MEMORY[0x1E4F8AD80] object:0];
  }
  return v2;
}

@end