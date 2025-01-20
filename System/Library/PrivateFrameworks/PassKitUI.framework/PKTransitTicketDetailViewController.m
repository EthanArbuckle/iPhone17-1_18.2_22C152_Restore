@interface PKTransitTicketDetailViewController
- (PKTransitTicketDetailDataSource)dataSource;
- (PKTransitTicketDetailViewController)initWithTransitTicketDetailDataSource:(id)a3;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_applyDefaultStaticStylingToCell:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKTransitTicketDetailViewController

- (PKTransitTicketDetailViewController)initWithTransitTicketDetailDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTransitTicketDetailViewController;
  v5 = [(PKTransitTicketDetailViewController *)&v8 initWithStyle:1];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PKTransitTicketDetailViewController;
  [(PKTransitTicketDetailViewController *)&v2 viewDidLoad];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(PKTransitTicketDetailViewController *)self dataSource];
  v6 = [v5 titleForLeg:a4];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PKTransitTicketDetailViewController *)self dataSource];
  int64_t v4 = [v3 numberOfLegs];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(PKTransitTicketDetailViewController *)self dataSource];
  int64_t v6 = [v5 transitTicketDetailNumberOfRowsForLeg:a4];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PKTransitTicketDetailCell"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKTransitTicketDetailCell"];
  }
  [(PKTransitTicketDetailViewController *)self _applyDefaultStaticStylingToCell:v7];
  objc_super v8 = [v7 textLabel];
  v9 = [(PKTransitTicketDetailViewController *)self dataSource];
  v10 = objc_msgSend(v9, "transitTicketDetailTitleForRow:leg:", objc_msgSend(v6, "row"), objc_msgSend(v6, "section"));
  [v8 setText:v10];

  v11 = [v7 textLabel];
  v12 = v11;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v11, "setTextColor:");
  }
  else
  {
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [v12 setTextColor:v13];
  }
  v14 = [v7 detailTextLabel];
  v15 = [(PKTransitTicketDetailViewController *)self dataSource];
  v16 = objc_msgSend(v15, "transitTicketDetailValueForRow:leg:", objc_msgSend(v6, "row"), objc_msgSend(v6, "section"));
  [v14 setText:v16];

  v17 = [v7 detailTextLabel];
  v18 = v17;
  if (self->_secondaryTextColor)
  {
    objc_msgSend(v17, "setTextColor:");
  }
  else
  {
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v18 setTextColor:v19];
  }
  [v7 setSelectionStyle:0];

  return v7;
}

- (void)_applyDefaultStaticStylingToCell:(id)a3
{
  id v5 = a3;
  v3 = [v5 textLabel];
  [v3 setText:0];

  int64_t v4 = [v5 detailTextLabel];
  [v4 setText:0];

  [v5 setSelectionStyle:0];
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (PKTransitTicketDetailDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PKTransitTicketDetailDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);

  objc_storeStrong((id *)&self->_primaryTextColor, 0);
}

@end