@interface TwoLineOutlineCellButtonAccessoryModel
- (BOOL)isEqual:(id)a3;
- (TwoLineOutlineCellButtonAccessoryModel)initWithAccessoryType:(int64_t)a3 visibility:(int64_t)a4 delegate:(id)a5;
- (TwoLinesOutlineCellAccessoryDelegate)delegate;
- (id)createAccessoryConfigurationWithAction:(id)a3;
- (int64_t)accessoryType;
- (int64_t)visibility;
- (unint64_t)hash;
@end

@implementation TwoLineOutlineCellButtonAccessoryModel

- (TwoLineOutlineCellButtonAccessoryModel)initWithAccessoryType:(int64_t)a3 visibility:(int64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TwoLineOutlineCellButtonAccessoryModel;
  v9 = [(TwoLineOutlineCellButtonAccessoryModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_accessoryType = a3;
    v9->_visibility = a4;
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  return self->_visibility ^ self->_accessoryType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLineOutlineCellButtonAccessoryModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(TwoLineOutlineCellButtonAccessoryModel *)v6 accessoryType];
    if (v7 == (id)[(TwoLineOutlineCellButtonAccessoryModel *)self accessoryType]
      && (id v8 = [(TwoLineOutlineCellButtonAccessoryModel *)v6 visibility],
          v8 == (id)[(TwoLineOutlineCellButtonAccessoryModel *)self visibility]))
    {
      v9 = [(TwoLineOutlineCellButtonAccessoryModel *)v6 delegate];
      v10 = [(TwoLineOutlineCellButtonAccessoryModel *)self delegate];
      if (v9 == v10) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)createAccessoryConfigurationWithAction:(id)a3
{
  id v4 = a3;
  int64_t accessoryType = self->_accessoryType;
  if (accessoryType == 2)
  {
    id v10 = [objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure) initWithCellSelectionTogglesExpansionState:0];
    v6 = sub_100A92454();
    unsigned __int8 v11 = +[UIImage systemImageNamed:@"chevron.forward.circle.fill" withConfiguration:v6];
    [v10 setImage:v11];

    goto LABEL_5;
  }
  if (accessoryType == 1)
  {
    v6 = +[MapsThemeButton buttonWithType:0];
    id v7 = +[UIImage systemImageNamed:@"info.circle.fill"];
    [v6 setImage:v7 forState:0];

    id v8 = sub_100A92454();
    [v6 setPreferredSymbolConfiguration:v8 forImageInState:0];

    [v6 addAction:v4 forControlEvents:0x2000];
    v9 = sub_100A924E4();
    [v6 setTintColor:v9];

    [v6 setAccessibilityIdentifier:@"DetailButton"];
    id v10 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:v6];
LABEL_5:

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (TwoLinesOutlineCellAccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TwoLinesOutlineCellAccessoryDelegate *)WeakRetained;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void).cxx_destruct
{
}

@end