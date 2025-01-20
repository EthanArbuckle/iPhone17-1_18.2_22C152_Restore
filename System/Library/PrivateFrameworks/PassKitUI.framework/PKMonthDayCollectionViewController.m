@interface PKMonthDayCollectionViewController
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSTimeZone)timeZone;
- (PKMonthDayCollectionViewController)initWithDayDelegate:(id)a3 timeZone:(id)a4;
- (PKMonthDayCollectionViewControllerDelegate)dayDelegate;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_indexPathForDayNumber:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)selectedDate;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)dayNumber;
- (int64_t)maximumDayNumber;
- (int64_t)minimumDayNumber;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDayDelegate:(id)a3;
- (void)setDayNumber:(int64_t)a3;
- (void)setMaximumDayNumber:(int64_t)a3;
- (void)setMinimumDayNumber:(int64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKMonthDayCollectionViewController

- (PKMonthDayCollectionViewController)initWithDayDelegate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v18.receiver = self;
  v18.super_class = (Class)PKMonthDayCollectionViewController;
  v9 = [(PKMonthDayCollectionViewController *)&v18 initWithCollectionViewLayout:v8];

  if (v9)
  {
    objc_storeWeak((id *)&v9->_dayDelegate, v6);
    v9->_minimumDayNumber = 0;
    v9->_maximumDayNumber = 31;
    objc_storeStrong((id *)&v9->_timeZone, a4);
    id v10 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v11 = [v10 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v9->_calendar;
    v9->_calendar = (NSCalendar *)v11;

    [(NSCalendar *)v9->_calendar setTimeZone:v9->_timeZone];
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    dayFormatter = v9->_dayFormatter;
    v9->_dayFormatter = v13;

    v15 = v9->_dayFormatter;
    v16 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)v15 setLocale:v16];
  }
  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKMonthDayCollectionViewController;
  [(PKMonthDayCollectionViewController *)&v5 viewDidLoad];
  v3 = [(PKMonthDayCollectionViewController *)self collectionView];
  [v3 setAllowsMultipleSelection:1];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"reuseIdentifier"];
  [v3 setAlwaysBounceVertical:0];
  [v3 setBounces:0];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (id)selectedDate
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  [(NSCalendar *)self->_calendar rangeOfUnit:16 inUnit:8 forDate:v3];
  if (self->_dayNumber >= v4) {
    int64_t dayNumber = v4;
  }
  else {
    int64_t dayNumber = self->_dayNumber;
  }
  id v6 = [(NSCalendar *)self->_calendar dateBySettingUnit:16 value:dayNumber ofDate:v3 options:1024];
  if (![(NSCalendar *)self->_calendar isDate:v3 equalToDate:v6 toUnitGranularity:8])
  {
    id v7 = [(NSCalendar *)self->_calendar dateByAddingUnit:8 value:1 toDate:v3 options:0];
    [(NSCalendar *)self->_calendar rangeOfUnit:16 inUnit:8 forDate:v7];
    if (self->_dayNumber >= v8) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = self->_dayNumber;
    }
    uint64_t v10 = [(NSCalendar *)self->_calendar dateBySettingUnit:16 value:v9 ofDate:v3 options:1024];

    id v6 = (void *)v10;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  PKFloatRoundToPixel();
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)setDayNumber:(int64_t)a3
{
  if (a3)
  {
    int64_t minimumDayNumber = self->_minimumDayNumber;
    if (minimumDayNumber <= a3) {
      int64_t minimumDayNumber = a3;
    }
  }
  else
  {
    int64_t minimumDayNumber = 0;
  }
  self->_int64_t dayNumber = minimumDayNumber;
  double v5 = [(PKMonthDayCollectionViewController *)self collectionView];
  double v6 = [v5 indexPathsForSelectedItems];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PKMonthDayCollectionViewController_setDayNumber___block_invoke;
  v12[3] = &unk_1E59DB570;
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  unint64_t v8 = [(PKMonthDayCollectionViewController *)self collectionView];
  int64_t v9 = [(PKMonthDayCollectionViewController *)self _indexPathForDayNumber:self->_dayNumber];
  [v8 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayDelegate);
  uint64_t v11 = [(PKMonthDayCollectionViewController *)self selectedDate];
  [WeakRetained monthDaySelectionViewController:self didSelectDate:v11 day:self->_dayNumber];
}

uint64_t __51__PKMonthDayCollectionViewController_setDayNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:a2 animated:0];
}

- (void)setMinimumDayNumber:(int64_t)a3
{
  self->_int64_t minimumDayNumber = a3;
  int64_t dayNumber = self->_dayNumber;
  if (dayNumber >= 1 && dayNumber < a3) {
    -[PKMonthDayCollectionViewController setDayNumber:](self, "setDayNumber:");
  }
  id v6 = [(PKMonthDayCollectionViewController *)self collectionView];
  [v6 reloadData];
}

- (id)_indexPathForDayNumber:(int64_t)a3
{
  BOOL v6 = a3 < 1;
  int64_t v7 = a3 - 1;
  if (v6)
  {
    unint64_t v8 = 0;
  }
  else
  {
    if (self->_maximumDayNumber >= a3)
    {
      unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v7, 0, v3);
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 35;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:v6];
  int64_t v8 = [v6 row];

  if (v8 < self->_maximumDayNumber) {
    int64_t v9 = v8 + 1;
  }
  else {
    int64_t v9 = 0;
  }
  if (v9 < 1)
  {
    v12 = 0;
  }
  else
  {
    dayFormatter = self->_dayFormatter;
    uint64_t v11 = [NSNumber numberWithInteger:v9];
    v12 = [(NSNumberFormatter *)dayFormatter stringFromNumber:v11];
  }
  [v7 setDayNumber:v9 withTitle:v12];
  [v7 setEnabled:v9 >= self->_minimumDayNumber];
  [v7 setSelected:v9 == self->_dayNumber];

  return v7;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 bounds];
  double v6 = v5 / 7.0;
  double v7 = v5 / 7.0;
  result.height = v7;
  result.CGFloat width = v6;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  int64_t v5 = objc_msgSend(a4, "row", a3);
  return v5 + 1 >= self->_minimumDayNumber && v5 < self->_maximumDayNumber;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "row", a3) + 1 != self->_dayNumber;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_int64_t dayNumber = [v7 row] + 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayDelegate);
  int64_t v9 = [(PKMonthDayCollectionViewController *)self selectedDate];
  [WeakRetained monthDaySelectionViewController:self didSelectDate:v9 day:self->_dayNumber];

  uint64_t v10 = [v6 indexPathsForSelectedItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PKMonthDayCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v13[3] = &unk_1E59DB598;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v10 enumerateObjectsUsingBlock:v13];
}

void __78__PKMonthDayCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 40) deselectItemAtIndexPath:v3 animated:0];
  }
}

- (int64_t)dayNumber
{
  return self->_dayNumber;
}

- (int64_t)minimumDayNumber
{
  return self->_minimumDayNumber;
}

- (int64_t)maximumDayNumber
{
  return self->_maximumDayNumber;
}

- (void)setMaximumDayNumber:(int64_t)a3
{
  self->_maximumDayNumber = a3;
}

- (PKMonthDayCollectionViewControllerDelegate)dayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayDelegate);

  return (PKMonthDayCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDayDelegate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_dayDelegate);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_dayFormatter, 0);
}

@end