@interface TransitSchedulesLineOptionsProviderViewModel
- (BOOL)isEnabled;
- (NSString)axIdentifierForAction;
- (NSString)symbolName;
- (NSString)titleString;
- (TransitSchedulesLineOptionsProviderViewModel)initWithTitle:(id)a3 symbolName:(id)a4 action:(id)a5 axIdentifierForAction:(id)a6;
- (id)accessibilityIdentifierForAction;
- (id)actionBlock;
- (int64_t)actionStyle;
- (void)loadSubtitleWithCompletion:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setAxIdentifierForAction:(id)a3;
@end

@implementation TransitSchedulesLineOptionsProviderViewModel

- (TransitSchedulesLineOptionsProviderViewModel)initWithTitle:(id)a3 symbolName:(id)a4 action:(id)a5 axIdentifierForAction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TransitSchedulesLineOptionsProviderViewModel;
  v14 = [(TransitSchedulesLineOptionsProviderViewModel *)&v24 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    titleString = v14->_titleString;
    v14->_titleString = v15;

    v17 = (NSString *)[v11 copy];
    symbolName = v14->_symbolName;
    v14->_symbolName = v17;

    id v19 = [v12 copy];
    id actionBlock = v14->_actionBlock;
    v14->_id actionBlock = v19;

    v21 = (NSString *)[v13 copy];
    axIdentifierForAction = v14->_axIdentifierForAction;
    v14->_axIdentifierForAction = v21;
  }
  return v14;
}

- (void)loadSubtitleWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return 0;
}

- (id)accessibilityIdentifierForAction
{
  return self->_axIdentifierForAction;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (NSString)axIdentifierForAction
{
  return self->_axIdentifierForAction;
}

- (void)setAxIdentifierForAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifierForAction, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

@end