@interface SearchUIFlightCardSectionView
+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3;
+ (int)defaultSeparatorStyleForRowModel:(id)a3;
- (FUFlightViewController)flightViewController;
- (SearchUIFlightCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (id)setupContentView;
- (unint64_t)lastSelectedLegIndex;
- (void)flightController:(id)a3 didSelectLeg:(int64_t)a4 ofFlight:(int64_t)a5;
- (void)setFlightViewController:(id)a3;
- (void)setLastSelectedLegIndex:(unint64_t)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
@end

@implementation SearchUIFlightCardSectionView

- (SearchUIFlightCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 cardSection];
  v19.receiver = self;
  v19.super_class = (Class)SearchUIFlightCardSectionView;
  v9 = [(SearchUICardSectionView *)&v19 initWithRowModel:v7 feedbackDelegate:v6];

  if (v9)
  {
    v10 = [(SearchUICardSectionView *)v9 contentView];
    [v10 setDelegate:v9];

    -[SearchUIFlightCardSectionView setLastSelectedLegIndex:](v9, "setLastSelectedLegIndex:", [v8 selectedLegIndex]);
    id v11 = objc_alloc((Class)objc_opt_class());
    v12 = [v8 flight];
    v13 = objc_msgSend(v11, "initWithSFFlight:leg:style:delegate:", v12, objc_msgSend(v8, "selectedLegIndex"), 3, v9);
    [(SearchUIFlightCardSectionView *)v9 setFlightViewController:v13];

    v14 = [(SearchUIFlightCardSectionView *)v9 flightViewController];
    [v14 setNoBackground];

    v15 = [(SearchUICardSectionView *)v9 contentView];
    v16 = [(SearchUIFlightCardSectionView *)v9 flightViewController];
    v17 = [v16 view];
    [v15 addArrangedSubview:v17];
  }
  return v9;
}

- (id)setupContentView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIFlightCardSectionView;
  [(SearchUICardSectionView *)&v4 updateChevronVisible:0 leaveSpaceForChevron:0];
}

- (void)flightController:(id)a3 didSelectLeg:(int64_t)a4 ofFlight:(int64_t)a5
{
  id v17 = [(SearchUICardSectionView *)self feedbackDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(SearchUICardSectionView *)self section];
    v8 = [v7 flight];
    v9 = [v8 legs];
    v10 = [v9 objectAtIndexedSubscript:a4];
    id v11 = [v10 title];
    [v17 updateViewControllerTitle:v11];
  }
  if ([(SearchUIFlightCardSectionView *)self lastSelectedLegIndex] != a4
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F99F30]);
    v13 = [(SearchUICardSectionView *)self section];
    if ([(SearchUIFlightCardSectionView *)self lastSelectedLegIndex] < a4) {
      uint64_t v14 = 15;
    }
    else {
      uint64_t v14 = 16;
    }
    v15 = (void *)[v12 initWithCardSection:v13 destination:0 triggerEvent:v14 actionCardType:1];

    v16 = [(SearchUICardSectionView *)self rowModel];
    objc_msgSend(v15, "setQueryId:", objc_msgSend(v16, "queryId"));

    [v17 didEngageCardSection:v15];
  }
  [(SearchUIFlightCardSectionView *)self setLastSelectedLegIndex:a4];
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  v3 = [a3 cardSection];
  objc_super v4 = [v3 flight];
  v5 = [v4 legs];
  BOOL v6 = (unint64_t)[v5 count] > 1;

  return v6;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

- (FUFlightViewController)flightViewController
{
  return self->_flightViewController;
}

- (void)setFlightViewController:(id)a3
{
}

- (unint64_t)lastSelectedLegIndex
{
  return self->_lastSelectedLegIndex;
}

- (void)setLastSelectedLegIndex:(unint64_t)a3
{
  self->_lastSelectedLegIndex = a3;
}

- (void).cxx_destruct
{
}

@end