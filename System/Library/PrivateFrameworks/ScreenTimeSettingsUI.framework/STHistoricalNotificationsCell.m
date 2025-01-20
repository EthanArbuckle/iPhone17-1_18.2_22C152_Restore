@interface STHistoricalNotificationsCell
- (STHistoricalNotificationsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (STHistoricalUsageViewController)historicalUsageViewController;
- (id)value;
- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4;
- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValue:(id)a3;
@end

@implementation STHistoricalNotificationsCell

- (STHistoricalNotificationsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v22.receiver = self;
  v22.super_class = (Class)STHistoricalNotificationsCell;
  v5 = [(STTableCell *)&v22 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  uint64_t v6 = +[STHistoricalUsageViewController historicalUsageViewControllerOfType:5 graphHeight:62.0];
  historicalUsageViewController = v5->_historicalUsageViewController;
  v5->_historicalUsageViewController = (STHistoricalUsageViewController *)v6;

  v8 = [(STTableCell *)v5 childViewControllers];
  [v8 addObject:v5->_historicalUsageViewController];

  v9 = [(STHistoricalNotificationsCell *)v5 contentView];
  v10 = [(STHistoricalUsageViewController *)v5->_historicalUsageViewController view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:v10];
  v11 = _NSDictionaryOfVariableBindings(&cfstr_Historicalusag.isa, v10, 0);
  v12 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[historicalUsageView]-2.0-|" options:0 metrics:0 views:v11];
  v13 = (void *)[v12 mutableCopy];

  v14 = [(STTableCell *)v5 contentLayoutGuide];
  v15 = [v14 leadingAnchor];
  v16 = [v10 leadingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v13 addObject:v17];

  v18 = [v14 trailingAnchor];
  v19 = [v10 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v13 addObject:v20];

  [MEMORY[0x263F08938] activateConstraints:v13];
  [(STHistoricalUsageViewController *)v5->_historicalUsageViewController addObserver:v5 forKeyPath:@"currentViewMode" options:3 context:"KVOContextHistoricalNotificationsCell"];
  [(STHistoricalUsageViewController *)v5->_historicalUsageViewController addObserver:v5 forKeyPath:@"titleView.hasMultilineLayout" options:3 context:"KVOContextHistoricalNotificationsCell"];

  return v5;
}

- (void)dealloc
{
  [(STHistoricalUsageViewController *)self->_historicalUsageViewController removeObserver:self forKeyPath:@"currentViewMode" context:"KVOContextHistoricalNotificationsCell"];
  [(STHistoricalUsageViewController *)self->_historicalUsageViewController removeObserver:self forKeyPath:@"titleView.hasMultilineLayout" context:"KVOContextHistoricalNotificationsCell"];
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalNotificationsCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextHistoricalNotificationsCell")
  {
    [(STHistoricalNotificationsCell *)self historicalUsageViewController];

    if ([v10 isEqualToString:@"currentViewMode"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STHistoricalNotificationsCell _currentViewModeDidChangeFrom:to:](self, "_currentViewModeDidChangeFrom:to:", [v12 integerValue], objc_msgSend(v14, "integerValue"));
    }
    else
    {
      [(STHistoricalNotificationsCell *)self historicalUsageViewController];

      if (![v10 isEqualToString:@"titleView.hasMultilineLayout"]) {
        goto LABEL_16;
      }
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v16 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v16)
      {

        v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v17 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v17)
      {

        v14 = 0;
      }
      -[STHistoricalNotificationsCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", [v12 BOOLValue], objc_msgSend(v14, "BOOLValue"));
    }

    goto LABEL_16;
  }
  v18.receiver = self;
  v18.super_class = (Class)STHistoricalNotificationsCell;
  [(STHistoricalNotificationsCell *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_16:
}

- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  if (a3 != a4)
  {
    v7 = [(STHistoricalNotificationsCell *)self historicalUsageViewController];
    v8 = [v7 titleView];
    uint64_t v9 = [v8 hasMultilineLayout];

    [(STHistoricalNotificationsCell *)self _handleEffectiveChangeForViewMode:a4 hasMultilineLayout:v9];
  }
}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4)
  {
    BOOL v5 = a4;
    v7 = [(STHistoricalNotificationsCell *)self historicalUsageViewController];
    uint64_t v8 = [v7 currentViewMode];

    [(STHistoricalNotificationsCell *)self _handleEffectiveChangeForViewMode:v8 hasMultilineLayout:v5];
  }
}

- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x263EF8340];
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"SpecifierIdentifierHistoricalNotificationsCell-%lu-%d", a3, v4);
  id v10 = @"HistoricalNotificationsSpecifierIdentifier";
  v11[0] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v7 postNotificationName:@"HistoricalNotificationsSpecifierIdentifierDidChange" object:self userInfo:v9];

  [(STHistoricalNotificationsCell *)self setNeedsUpdateConstraints];
  [v7 postNotificationName:0x26D941B88 object:self];
}

- (id)value
{
  v4.receiver = self;
  v4.super_class = (Class)STHistoricalNotificationsCell;
  v2 = [(PSTableCell *)&v4 value];

  return v2;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && ([v5 conformsToProtocol:&unk_26D9A2F30] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"STHistoricalNotificationsCell.m", 122, @"Invalid parameter not satisfying: %@", @"(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)STHistoricalNotificationsCell;
  [(PSTableCell *)&v9 setValue:v6];
  v7 = [(STHistoricalNotificationsCell *)self historicalUsageViewController];
  [v7 setCoordinator:v6];
}

- (STHistoricalUsageViewController)historicalUsageViewController
{
  return (STHistoricalUsageViewController *)objc_getProperty(self, a2, 1224, 1);
}

- (void).cxx_destruct
{
}

@end