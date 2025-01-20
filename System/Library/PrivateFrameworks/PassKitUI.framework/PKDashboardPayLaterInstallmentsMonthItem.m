@interface PKDashboardPayLaterInstallmentsMonthItem
+ (id)identifier;
- (PKCalendarMonthAppearance)appearance;
- (PKCalendarMonthDataSource)dataSource;
- (PKDashboardPayLaterInstallmentsMonthItem)initWithDataSource:(id)a3 appearance:(id)a4 installmentsMonth:(id)a5;
- (PKPayLaterInstallmentsMonth)installmentsMonth;
@end

@implementation PKDashboardPayLaterInstallmentsMonthItem

- (PKDashboardPayLaterInstallmentsMonthItem)initWithDataSource:(id)a3 appearance:(id)a4 installmentsMonth:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardPayLaterInstallmentsMonthItem;
  v11 = [(PKDashboardPayLaterInstallmentsMonthItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_appearance, v9);
    objc_storeStrong((id *)&v12->_installmentsMonth, a5);
  }

  return v12;
}

+ (id)identifier
{
  return @"payLaterInstallmentsMonthItem";
}

- (PKPayLaterInstallmentsMonth)installmentsMonth
{
  return self->_installmentsMonth;
}

- (PKCalendarMonthDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PKCalendarMonthDataSource *)WeakRetained;
}

- (PKCalendarMonthAppearance)appearance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearance);

  return (PKCalendarMonthAppearance *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appearance);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_installmentsMonth, 0);
}

@end