@interface ExtensionLabelViewController
- (ExtensionLabelViewController)initWithTitle:(id)a3 advertisementText:(id)a4;
- (NSString)advertisementText;
- (NSString)titleText;
- (UILabel)label;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)text;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureLabelView;
- (void)configureTableView;
- (void)setAdvertisementText:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ExtensionLabelViewController

- (ExtensionLabelViewController)initWithTitle:(id)a3 advertisementText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ExtensionLabelViewController;
  v8 = [(ExtensionLabelViewController *)&v13 initWithStyle:1];
  v9 = v8;
  if (v8)
  {
    [(ExtensionLabelViewController *)v8 setTitle:v6];
    v10 = (NSString *)[v7 copy];
    advertisementText = v9->_advertisementText;
    v9->_advertisementText = v10;
  }
  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ExtensionLabelViewController;
  [(ExtensionLabelViewController *)&v3 viewDidLoad];
  [(ExtensionLabelViewController *)self configureTableView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ExtensionLabelViewController;
  [(ExtensionLabelViewController *)&v3 viewDidAppear:a3];
}

- (void)configureTableView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v4 = [(ExtensionLabelViewController *)self tableView];
  [v4 setTableFooterView:v3];

  v5 = [(ExtensionLabelViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 registerClass:v6 forCellReuseIdentifier:v8];

  v9 = [(ExtensionLabelViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  v10 = [(ExtensionLabelViewController *)self tableView];
  [v10 setScrollEnabled:0];

  id v11 = [(ExtensionLabelViewController *)self tableView];
  [v11 setAllowsSelection:0];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 120.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = [v5 dequeueReusableCellWithIdentifier:v7];

  v9 = [v8 advertisementLabel];
  [(ExtensionLabelViewController *)self setLabel:v9];

  v10 = [(ExtensionLabelViewController *)self advertisementText];
  id v11 = [(ExtensionLabelViewController *)self label];
  [v11 setText:v10];

  [(ExtensionLabelViewController *)self configureLabelView];

  return v8;
}

- (void)configureLabelView
{
  id v3 = +[UIColor clearColor];
  v4 = [(ExtensionLabelViewController *)self label];
  [v4 setBackgroundColor:v3];

  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v5 = [(ExtensionLabelViewController *)self label];
  [v5 setFont:v6];
}

- (id)text
{
  v2 = [(ExtensionLabelViewController *)self label];
  id v3 = [v2 text];

  return v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)advertisementText
{
  return self->_advertisementText;
}

- (void)setAdvertisementText:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_advertisementText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end