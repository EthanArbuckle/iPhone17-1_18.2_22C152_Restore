@interface SectionHeaderOutlineCellAccessoryModel
- (BOOL)isEqual:(id)a3;
- (SectionHeaderOutlineCellAccessoryDelegate)delegate;
- (SectionHeaderOutlineCellAccessoryModel)initWithAccessoryType:(int64_t)a3 visibility:(int64_t)a4 delegate:(id)a5;
- (id)createAccessoryConfigurationWithActionHandler:(id)a3;
- (int64_t)accessoryType;
- (int64_t)visibility;
- (unint64_t)hash;
@end

@implementation SectionHeaderOutlineCellAccessoryModel

- (SectionHeaderOutlineCellAccessoryModel)initWithAccessoryType:(int64_t)a3 visibility:(int64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SectionHeaderOutlineCellAccessoryModel;
  v9 = [(SectionHeaderOutlineCellAccessoryModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_visibility = a4;
    v9->_accessoryType = a3;
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
  v4 = (SectionHeaderOutlineCellAccessoryModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(SectionHeaderOutlineCellAccessoryModel *)v6 accessoryType];
    if (v7 == (id)[(SectionHeaderOutlineCellAccessoryModel *)self accessoryType]
      && (id v8 = [(SectionHeaderOutlineCellAccessoryModel *)v6 visibility],
          v8 == (id)[(SectionHeaderOutlineCellAccessoryModel *)self visibility]))
    {
      v9 = [(SectionHeaderOutlineCellAccessoryModel *)v6 delegate];
      v10 = [(SectionHeaderOutlineCellAccessoryModel *)self delegate];
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

- (id)createAccessoryConfigurationWithActionHandler:(id)a3
{
  id v4 = a3;
  int64_t accessoryType = self->_accessoryType;
  if (accessoryType == 1)
  {
    id v6 = [objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure) initWithCellSelectionTogglesExpansionState:0];
    id v7 = sub_100A9246C();
    [v6 setImage:v7];

    goto LABEL_5;
  }
  if (accessoryType == 2)
  {
    id v6 = objc_alloc_init((Class)_UICellAccessoryConfigurationInsert);
    [v6 setActionHandler:v4];
LABEL_5:
    id v8 = +[UIColor tertiaryLabelColor];
    [v6 setTintColor:v8];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (SectionHeaderOutlineCellAccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SectionHeaderOutlineCellAccessoryDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end