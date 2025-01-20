@interface PKPayLaterCalendarMonthViewController
- (BOOL)_hasHeaderForSection:(int64_t)a3;
- (BOOL)canSelectDate:(id)a3;
- (BOOL)isDateSelected:(id)a3;
- (BOOL)shouldShowDate:(id)a3;
- (BOOL)visible;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKHorizontalScrollingChildViewControllerDelegate)scrollingDelegate;
- (PKPayLaterCalendarMonthViewController)initWithInstallmentsMonthPresenter:(id)a3 installmentPresenter:(id)a4 paymentIntentController:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)contentInset;
- (UIGestureRecognizer)gestureRecognizerRequiredToFail;
- (double)alphaForIndexPath:(id)a3 visible:(BOOL)a4 transition:(double)a5;
- (double)alphaTransition;
- (double)lineSpacingForSection:(int64_t)a3;
- (id)_installmentItemForInstallment:(id)a3;
- (id)calendar;
- (id)calendarMonthStartDate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)data;
- (id)decorationViewForDayView:(id)a3 date:(id)a4;
- (id)footer;
- (id)indexPathForCalendar;
- (id)stringForDay:(id)a3;
- (id)stringForWeekday:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)contentInsetAdjustmentBehavior;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)numberOfDaysInWeek;
- (unint64_t)numberOfWeeks;
- (unsigned)horizontalAlignmentForSection:(int64_t)a3;
- (void)_applyMaskToCell:(id)a3 section:(int64_t)a4 firstInSection:(BOOL)a5 lastInSection:(BOOL)a6;
- (void)_configureHeaderView:(id)a3 inSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAlphaTransition:(double)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentInsetAdjustmentBehavior:(int64_t)a3;
- (void)setData:(id)a3 swap:(BOOL)a4;
- (void)setGestureRecognizerRequiredToFail:(id)a3;
- (void)setInstallmentsMonth:(id)a3 swap:(BOOL)a4;
- (void)setScrollingDelegate:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterCalendarMonthViewController

- (PKPayLaterCalendarMonthViewController)initWithInstallmentsMonthPresenter:(id)a3 installmentPresenter:(id)a4 paymentIntentController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_alloc_init(PKHorizontalScrollingChildLayout);
  v34.receiver = self;
  v34.super_class = (Class)PKPayLaterCalendarMonthViewController;
  v13 = [(PKPayLaterCalendarMonthViewController *)&v34 initWithCollectionViewLayout:v12];
  if (v13)
  {
    [(PKHorizontalScrollingChildLayout *)v12 setDataSource:v13];
    objc_storeStrong((id *)&v13->_installmentsMonthPresenter, a3);
    objc_storeStrong((id *)&v13->_installmentPresenter, a4);
    objc_storeStrong((id *)&v13->_paymentIntentController, a5);
    objc_storeStrong((id *)&v13->_layout, v12);
    uint64_t v14 = PKIsLowEndDevice();
    v13->_isLowEndDevice = v14;
    [(PKHorizontalScrollingChildLayout *)v13->_layout setIsLowEndDevice:v14];
    uint64_t v15 = *MEMORY[0x1E4F1C318];
    uint64_t v16 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v13->_calendar;
    v13->_calendar = (NSCalendar *)v16;

    v18 = [PKDashboardTitleHeaderView alloc];
    uint64_t v19 = -[PKDashboardTitleHeaderView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleHeaderView = v13->_sampleHeaderView;
    v13->_sampleHeaderView = (PKDashboardTitleHeaderView *)v19;

    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    weekdayFormatter = v13->_weekdayFormatter;
    v13->_weekdayFormatter = v21;

    v23 = v13->_weekdayFormatter;
    v24 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v15];
    [(NSDateFormatter *)v23 setCalendar:v24];

    [(NSDateFormatter *)v13->_weekdayFormatter setLocalizedDateFormatFromTemplate:@"EEEEE"];
    [(NSDateFormatter *)v13->_weekdayFormatter setCalendar:v13->_calendar];
    v25 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dayFormatter = v13->_dayFormatter;
    v13->_dayFormatter = v25;

    v27 = v13->_dayFormatter;
    v28 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v15];
    [(NSDateFormatter *)v27 setCalendar:v28];

    [(NSDateFormatter *)v13->_dayFormatter setLocalizedDateFormatFromTemplate:@"d"];
    [(NSDateFormatter *)v13->_dayFormatter setCalendar:v13->_calendar];
    v29 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    monthYearFormatter = v13->_monthYearFormatter;
    v13->_monthYearFormatter = v29;

    v31 = v13->_monthYearFormatter;
    v32 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v15];
    [(NSDateFormatter *)v31 setCalendar:v32];

    [(NSDateFormatter *)v13->_monthYearFormatter setLocalizedDateFormatFromTemplate:@"MMMM yyyy"];
    [(NSDateFormatter *)v13->_monthYearFormatter setCalendar:v13->_calendar];
  }

  return v13;
}

- (id)footer
{
  return 0;
}

- (void)setData:(id)a3 swap:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PKPayLaterCalendarMonthViewController *)self setInstallmentsMonth:v6 swap:v4];
  }
}

- (id)data
{
  return self->_installmentsMonth;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[PKHorizontalScrollingChildLayout setVisible:](self->_layout, "setVisible:");
  }
}

- (void)setAlphaTransition:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_alphaTransition != a3)
  {
    self->_double alphaTransition = a3;
    -[PKHorizontalScrollingChildLayout setAlphaTransition:](self->_layout, "setAlphaTransition:");
    float v4 = 0.0;
    double v5 = 0.0;
    if (!self->_isLowEndDevice && self->_visible)
    {
      double alphaTransition = self->_alphaTransition;
      double v5 = 20.0;
      if (alphaTransition < 0.2) {
        float v4 = (alphaTransition / -0.2 + 1.0) * 0.15;
      }
    }
    id v6 = [(PKPayLaterCalendarMonthViewController *)self collectionView];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = objc_msgSend(v6, "indexPathsForVisibleItems", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = [v12 section];
          uint64_t v14 = [v6 cellForItemAtIndexPath:v12];
          uint64_t v15 = v14;
          if (v13)
          {

            goto LABEL_13;
          }
          uint64_t v16 = [v14 layer];
          *(float *)&double v17 = v4;
          [v16 setShadowOpacity:v17];
          [v16 setShadowRadius:v5];
          [v16 setMasksToBounds:0];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  self->_contentInsetAdjustmentBehavior = a3;
}

- (double)alphaForIndexPath:(id)a3 visible:(BOOL)a4 transition:(double)a5
{
  double result = 0.0;
  if (a4)
  {
    uint64_t v7 = objc_msgSend(a3, "section", 0.0);
    double result = 1.0;
    if (v7 > 0) {
      return a5;
    }
  }
  return result;
}

- (double)lineSpacingForSection:(int64_t)a3
{
  return 0.0;
}

- (unsigned)horizontalAlignmentForSection:(int64_t)a3
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  float v4 = [(PKPayLaterCalendarMonthViewController *)self scrollingDelegate];
  double v5 = v4;
  if (v4) {
    [v4 horizontalScrollingChildViewController:self scrollViewDidScroll:v6];
  }
}

- (void)setInstallmentsMonth:(id)a3 swap:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    installmentsMonth = self->_installmentsMonth;
    uint64_t v9 = [(PKPayLaterCalendarMonthViewController *)self collectionView];
    if (installmentsMonth)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke;
      v23[3] = &unk_1E59CA8E8;
      v23[4] = self;
      id v10 = v7;
      id v24 = v10;
      id v25 = v9;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      long long v20 = __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke_2;
      long long v21 = &unk_1E59CB6D8;
      id v11 = v25;
      id v22 = v11;
      [v11 performBatchUpdates:v23 completion:&v18];
      v12 = [(PKPayLaterCalendarMonthViewController *)self indexPathForCalendar];
      uint64_t v13 = [[PKDashboardPayLaterInstallmentsMonthItem alloc] initWithDataSource:self appearance:self installmentsMonth:v10];
      installmentsMonthPresenter = self->_installmentsMonthPresenter;
      uint64_t v15 = [v11 cellForItemAtIndexPath:v12];
      if (v4) {
        [(PKPayLaterInstallmentsMonthPresenter *)installmentsMonthPresenter swapInstallmentsMonthInCell:v15 forItem:v13 inCollectionView:v11 atIndexPath:v12];
      }
      else {
        [(PKPayLaterInstallmentsMonthPresenter *)installmentsMonthPresenter updateCell:v15 forItem:v13 inCollectionView:v11 atIndexPath:v12];
      }

      double v17 = [v11 supplementaryViewForElementKind:*MEMORY[0x1E4FB2770] atIndexPath:v12];
      [(PKPayLaterCalendarMonthViewController *)self _configureHeaderView:v17 inSection:0];
    }
    else
    {
      objc_storeStrong((id *)&self->_installmentsMonth, a3);
      [v9 reloadData];
      uint64_t v16 = [v9 collectionViewLayout];
      [v16 invalidateLayout];
    }
  }
}

void __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1056), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, 2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 reloadSections:v3];
}

void __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

- (id)indexPathForCalendar
{
  if (_MergedGlobals_1_7 != -1) {
    dispatch_once(&_MergedGlobals_1_7, &__block_literal_global_93);
  }
  v2 = (void *)qword_1E94C42A8;

  return v2;
}

void __61__PKPayLaterCalendarMonthViewController_indexPathForCalendar__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v1 = (void *)qword_1E94C42A8;
  qword_1E94C42A8 = v0;
}

- (void)viewDidLoad
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterCalendarMonthViewController;
  [(PKPayLaterCalendarMonthViewController *)&v20 viewDidLoad];
  id v3 = [(PKPayLaterCalendarMonthViewController *)self collectionView];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v5 = [(PKPayLaterInstallmentsMonthPresenter *)self->_installmentsMonthPresenter collectionViewCellClasses];
  [v4 addEntriesFromDictionary:v5];

  id v6 = [(PKPayLaterInstallmentPresenter *)self->_installmentPresenter collectionViewCellClasses];
  [v4 addEntriesFromDictionary:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v11), (void)v16), *(void *)(*((void *)&v16 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cell"];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = *MEMORY[0x1E4FB2770];
  [v3 registerClass:v12 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"kMonthTitleIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:v13 withReuseIdentifier:@"kInstallmentsTitleIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:v13 withReuseIdentifier:@"kCompletedInstallmentsTitleIdentifier"];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setAlwaysBounceVertical:1];
  [v3 setBounces:1];
  uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v14];

  [v3 setClipsToBounds:0];
  objc_msgSend(v3, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  [v3 setContentInsetAdjustmentBehavior:self->_contentInsetAdjustmentBehavior];
  uint64_t v15 = [(PKPayLaterCalendarMonthViewController *)self view];
  [v15 setClipsToBounds:0];

  [v3 setClipsToBounds:0];
}

- (unint64_t)numberOfWeeks
{
  calendar = self->_calendar;
  id v3 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth startDate];
  [(NSCalendar *)calendar rangeOfUnit:4096 inUnit:8 forDate:v3];
  unint64_t v5 = v4;

  return v5;
}

- (unint64_t)numberOfDaysInWeek
{
  return 7;
}

- (id)calendarMonthStartDate
{
  v2 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth startDate];
  id v3 = PKStartOfWeek();

  return v3;
}

- (id)calendar
{
  return self->_calendar;
}

- (BOOL)shouldShowDate:(id)a3
{
  installmentsMonth = self->_installmentsMonth;
  id v5 = a3;
  id v6 = [(PKPayLaterInstallmentsMonth *)installmentsMonth startDate];
  id v7 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth endDate];
  char IsBetweenDates = PKDateIsBetweenDates();

  return IsBetweenDates;
}

- (BOOL)canSelectDate:(id)a3
{
  return 0;
}

- (BOOL)isDateSelected:(id)a3
{
  id v4 = a3;
  if ([(PKPayLaterCalendarMonthViewController *)self shouldShowDate:v4]) {
    char v5 = [v4 isToday];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)stringForWeekday:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDateFormatter stringFromDate:](self->_weekdayFormatter, "stringFromDate:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)stringForDay:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDateFormatter stringFromDate:](self->_dayFormatter, "stringFromDate:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)decorationViewForDayView:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth installmentsDueInDate:v5];
  if ([v6 count]
    && [(PKPayLaterCalendarMonthViewController *)self shouldShowDate:v5])
  {
    if (objc_msgSend(v6, "pk_containsObjectPassingTest:", &__block_literal_global_47)) {
      [MEMORY[0x1E4FB1618] redColor];
    }
    else {
    uint64_t v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    uint64_t v9 = [MEMORY[0x1E4F849A0] totalDueForInstallments:v6 fallbackAmount:0];
    uint64_t v10 = v9;
    if (v9
      && ([v9 amount],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = objc_msgSend(v11, "pk_isPositiveNumber"),
          v11,
          (v12 & 1) != 0))
    {
      uint64_t v13 = [v10 currency];
      uint64_t v14 = PKMutableNumberFormatterForCurrencyCode();
      [v14 setMaximumFractionDigits:0];
      __int16 v15 = [v14 maximumFractionDigits];
      long long v16 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:v15 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
      long long v17 = [v10 amount];
      long long v18 = [v17 decimalNumberByRoundingAccordingToBehavior:v16];

      id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      [v7 setTextColor:v8];
      long long v19 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27E8]);
      [v7 setFont:v19];

      objc_super v20 = [v14 stringFromNumber:v18];
      [v7 setText:v20];
    }
    else
    {
      long long v21 = (void *)MEMORY[0x1E4FB1830];
      uint64_t v22 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB2798]);
      uint64_t v13 = [v21 configurationWithFont:v22 scale:2];

      id v23 = objc_alloc(MEMORY[0x1E4FB1838]);
      uint64_t v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v13];
      long long v16 = PKPayLaterGreenColor();
      long long v18 = [v14 imageWithTintColor:v16];
      objc_super v20 = [v18 imageWithRenderingMode:1];
      id v7 = (id)[v23 initWithImage:v20];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

BOOL __71__PKPayLaterCalendarMonthViewController_decorationViewForDayView_date___block_invoke(uint64_t a1, void *a2)
{
  return [a2 status] == 4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_installmentsMonth) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v8 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth paidInstallments];
LABEL_6:
    uint64_t v9 = v8;
    int64_t v7 = [v8 count];

    goto LABEL_7;
  }
  if (a4 == 1)
  {
    uint64_t v8 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth activeInstallments];
    goto LABEL_6;
  }
  int64_t v7 = a4 == 0;
LABEL_7:

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [v7 section];
  int64_t v10 = [(PKPayLaterCalendarMonthViewController *)self collectionView:v6 numberOfItemsInSection:v9];
  switch(v9)
  {
    case 2:
      long long v16 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth paidInstallments];
      goto LABEL_10;
    case 1:
      long long v16 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth activeInstallments];
LABEL_10:
      long long v17 = v16;
      __int16 v15 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

      if (v15)
      {
        uint64_t v11 = [(PKPayLaterCalendarMonthViewController *)self _installmentItemForInstallment:v15];
        uint64_t v13 = [(PKPayLaterInstallmentPresenter *)self->_installmentPresenter cellForItem:v11 inCollectionView:v6 atIndexPath:v7];
        goto LABEL_12;
      }
      goto LABEL_14;
    case 0:
      uint64_t v11 = [[PKDashboardPayLaterInstallmentsMonthItem alloc] initWithDataSource:self appearance:self installmentsMonth:self->_installmentsMonth];
      char v12 = [(PKPayLaterInstallmentsMonthPresenter *)self->_installmentsMonthPresenter cellForItem:v11 inCollectionView:v6 atIndexPath:v7];
      uint64_t v13 = v12;
      if (self->_isLowEndDevice)
      {
        uint64_t v14 = [v12 layer];
      }
      else
      {
        BOOL visible = self->_visible;
        objc_super v20 = [v12 layer];
        uint64_t v14 = v20;
        if (visible)
        {
          double alphaTransition = self->_alphaTransition;
          if (alphaTransition < 0.2)
          {
            double v22 = (alphaTransition / -0.2 + 1.0) * 0.15;
            *(float *)&double v22 = v22;
            [v20 setShadowOpacity:v22];
            [v14 setShadowRadius:20.0];
            [v14 setMasksToBounds:0];
            goto LABEL_7;
          }
        }
      }
      [v14 setShadowOpacity:0.0];
      [v14 setShadowRadius:0.0];
LABEL_7:

      __int16 v15 = 0;
LABEL_12:

      goto LABEL_15;
  }
  __int16 v15 = 0;
LABEL_14:
  uint64_t v13 = 0;
LABEL_15:
  [(PKPayLaterCalendarMonthViewController *)self _applyMaskToCell:v13 section:v9 firstInSection:v8 == 0 lastInSection:v10 == v8 + 1];

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 section];
  if (v7 == 2)
  {
    uint64_t v8 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth paidInstallments];
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_7;
    }
    uint64_t v8 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth activeInstallments];
  }
  uint64_t v9 = v8;
  int64_t v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  if (v10)
  {
    uint64_t v11 = [(PKPayLaterCalendarMonthViewController *)self _installmentItemForInstallment:v10];
    installmentPresenter = self->_installmentPresenter;
    uint64_t v13 = [(PKPayLaterCalendarMonthViewController *)self parentViewController];
    uint64_t v14 = [v13 navigationController];
    [(PKPayLaterInstallmentPresenter *)installmentPresenter didSelectItem:v11 inCollectionView:v15 atIndexPath:v6 navigationController:v14 canPresent:0];
  }
LABEL_7:
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 section];
  uint64_t v12 = [v10 section];
  switch(v12)
  {
    case 0:
      uint64_t v14 = @"kMonthTitleIdentifier";
LABEL_7:
      id v15 = v8;
      id v13 = v9;
      goto LABEL_8;
    case 2:
      uint64_t v14 = @"kCompletedInstallmentsTitleIdentifier";
      goto LABEL_7;
    case 1:
      id v13 = (id)*MEMORY[0x1E4FB2770];
      uint64_t v14 = @"kInstallmentsTitleIdentifier";
      id v15 = v8;
LABEL_8:
      long long v16 = [v15 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v10];
      goto LABEL_10;
  }
  long long v16 = 0;
LABEL_10:
  [(PKPayLaterCalendarMonthViewController *)self _configureHeaderView:v16 inSection:v11];

  return v16;
}

- (id)_installmentItemForInstallment:(id)a3
{
  installmentsMonth = self->_installmentsMonth;
  id v5 = a3;
  id v6 = [v5 installmentIdentifier];
  uint64_t v7 = [(PKPayLaterInstallmentsMonth *)installmentsMonth financingPlanForInstallmentIdentifier:v6];

  id v8 = [[PKDashboardFinancingPlanInstallmentItem alloc] initWithFinancingPlan:v7 relevantInstallment:v5 paymentIntentController:self->_paymentIntentController];

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v11 = [v8 section];
  switch(v11)
  {
    case 2:
      id v15 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth paidInstallments];
      break;
    case 1:
      id v15 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth activeInstallments];
      break;
    case 0:
      uint64_t v12 = [[PKDashboardPayLaterInstallmentsMonthItem alloc] initWithDataSource:self appearance:self installmentsMonth:self->_installmentsMonth];
      [(PKPayLaterInstallmentsMonthPresenter *)self->_installmentsMonthPresenter sizeForItem:v12 inCollectionView:v7 atIndexPath:v8];
      double v9 = v13;
      double v10 = v14;
LABEL_9:

      goto LABEL_10;
    default:
      goto LABEL_10;
  }
  long long v16 = v15;
  objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  uint64_t v12 = (PKDashboardPayLaterInstallmentsMonthItem *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    long long v17 = [(PKPayLaterCalendarMonthViewController *)self _installmentItemForInstallment:v12];
    [(PKPayLaterInstallmentPresenter *)self->_installmentPresenter sizeForItem:v17 inCollectionView:v7 atIndexPath:v8];
    double v9 = v18;
    double v10 = v19;

    goto LABEL_9;
  }
LABEL_10:

  double v20 = v9;
  double v21 = v10;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v7 = *MEMORY[0x1E4FB2848];
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (objc_msgSend(a3, "numberOfItemsInSection:", a5, a4) && (unint64_t)a5 <= 2)
  {
    double v8 = dbl_1A0444110[a5];
    double v9 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  double v10 = v7;
  double v11 = v6;
  double v12 = v8;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(PKPayLaterCalendarMonthViewController *)self _hasHeaderForSection:a5])
  {
    [(PKPayLaterCalendarMonthViewController *)self _configureHeaderView:self->_sampleHeaderView inSection:a5];
    sampleHeaderView = self->_sampleHeaderView;
    [v7 bounds];
    -[PKDashboardTitleHeaderView sizeThatFits:](sampleHeaderView, "sizeThatFits:", v9, 3.40282347e38);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)_hasHeaderForSection:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 != 2) {
    return 0;
  }
  uint64_t v3 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth paidInstallments];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_configureHeaderView:(id)a3 inSection:(int64_t)a4
{
  id v11 = a3;
  [v11 setUseCompactTopInset:1];
  if (a4 == 2)
  {
    double v9 = PKLocalizedCocoonString(&cfstr_InstallmentPai_0.isa);
    double v10 = [v9 uppercaseString];
    [v11 setTitle:v10];

    [v11 setHorizontalInset:24.0];
    [v11 setTitleStyle:2];
    double v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v11 setTitleColor:v8];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    monthYearFormatter = self->_monthYearFormatter;
    id v7 = [(PKPayLaterInstallmentsMonth *)self->_installmentsMonth startDate];
    double v8 = [(NSDateFormatter *)monthYearFormatter stringFromDate:v7];

    [v11 setTitleStyle:1];
    [v11 setTitle:v8];
    [v11 setActionTitle:0];
    [v11 setHorizontalInset:24.0];
  }

LABEL_6:
}

- (void)_applyMaskToCell:(id)a3 section:(int64_t)a4 firstInSection:(BOOL)a5 lastInSection:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = 3;
    if (!v7 || !v6) {
      uint64_t v10 = 1;
    }
    uint64_t v11 = 2;
    if (!v6) {
      uint64_t v11 = 0;
    }
    if (v7) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v11;
    }
    id v13 = v9;
    [v9 setMaskType:v12];
    [v13 setShowsBottomSeparator:!v6];
    id v9 = v13;
  }
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInsett.top;
  double left = self->_contentInsett.left;
  double bottom = self->_contentInsett.bottom;
  double right = self->_contentInsett.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)alphaTransition
{
  return self->_alphaTransition;
}

- (BOOL)visible
{
  return self->_visible;
}

- (PKHorizontalScrollingChildViewControllerDelegate)scrollingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->scrollingDelegate);

  return (PKHorizontalScrollingChildViewControllerDelegate *)WeakRetained;
}

- (void)setScrollingDelegate:(id)a3
{
}

- (UIGestureRecognizer)gestureRecognizerRequiredToFail
{
  return self->gestureRecognizerRequiredToFail;
}

- (void)setGestureRecognizerRequiredToFail:(id)a3
{
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gestureRecognizerRequiredToFail, 0);
  objc_destroyWeak((id *)&self->scrollingDelegate);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_monthYearFormatter, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);
  objc_storeStrong((id *)&self->_installmentsMonth, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_installmentPresenter, 0);

  objc_storeStrong((id *)&self->_installmentsMonthPresenter, 0);
}

@end