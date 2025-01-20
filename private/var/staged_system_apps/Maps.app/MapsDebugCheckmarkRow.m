@interface MapsDebugCheckmarkRow
- (BOOL)isChecked;
- (BOOL)isDisabled;
- (MapsDebugCheckmarkRow)init;
- (MapsDebugCheckmarkRowsGroup)rowsGroup;
- (id)_createAccessoryView;
- (id)get;
- (id)reuseIdentifier;
- (id)selectionAction;
- (id)value;
- (void)_configureCellForCheckedValue:(id)a3;
- (void)_configureCollectionViewCellForCheckedValue:(id)a3;
- (void)_configureTapGestureOnLabel:(id)a3;
- (void)_didSelectAccessory:(id)a3;
- (void)_didTapLabel:(id)a3;
- (void)_fireControlSelectionAction;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)invalidate;
- (void)setCurrentCollectionViewCell:(id)a3;
- (void)setGet:(id)a3;
- (void)setRowsGroup:(id)a3;
- (void)setSelectionAction:(id)a3;
- (void)setValue:(id)a3;
- (void)update;
- (void)updateChecked;
- (void)updateConfiguration;
@end

@implementation MapsDebugCheckmarkRow

- (MapsDebugCheckmarkRow)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsDebugCheckmarkRow;
  v2 = [(MapsDebugTableRow *)&v7 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1003A2B30;
    v4[3] = &unk_1012E6708;
    objc_copyWeak(&v5, &location);
    [(MapsDebugCheckmarkRow *)v2 setSelectionAction:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)invalidate
{
  v3 = [(MapsDebugCheckmarkRow *)self rowsGroup];
  [v3 checkmarkRowWillInvalidate:self];

  [(MapsDebugCheckmarkRow *)self setRowsGroup:0];
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRow;
  [(MapsDebugTableRow *)&v4 invalidate];
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (self->_value != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_value, a3);
    [(MapsDebugCheckmarkRow *)self update];
    id v5 = v6;
  }
}

- (void)setCurrentCollectionViewCell:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRow;
  [(MapsDebugTableRow *)&v4 setCurrentCollectionViewCell:a3];
  [(MapsDebugCheckmarkRow *)self update];
}

- (void)update
{
  [(MapsDebugCheckmarkRow *)self updateChecked];

  [(MapsDebugCheckmarkRow *)self updateConfiguration];
}

- (void)updateChecked
{
  v3 = [(MapsDebugCheckmarkRow *)self get];

  if (v3)
  {
    objc_super v4 = [(MapsDebugCheckmarkRow *)self get];
    v4[2]();
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v5 = [(MapsDebugCheckmarkRow *)self value];
    if (v5 == v12)
    {
      p_checked = &self->_checked;
      self->_checked = 1;
    }
    else
    {
      id v6 = [(MapsDebugCheckmarkRow *)self value];
      p_checked = &self->_checked;
      self->_checked = [v6 isEqual:v12];
    }
    if (!*p_checked)
    {
      v8 = [(MapsDebugCheckmarkRow *)self rowsGroup];
      unsigned int v9 = [v8 allowsMultipleSelection];

      if (v9)
      {
        id v10 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [(MapsDebugCheckmarkRow *)self value];
          BOOL *p_checked = [v10 containsObject:v11];
        }
        else
        {
          BOOL *p_checked = 0;
        }
      }
    }
  }
  else
  {
    self->_checked = 0;
  }
}

- (void)updateConfiguration
{
  v3 = [(MapsDebugTableRow *)self currentCell];

  if (v3)
  {
    objc_super v4 = [(MapsDebugTableRow *)self currentCell];
    [(MapsDebugCheckmarkRow *)self _configureCellForCheckedValue:v4];
  }
  id v5 = [(MapsDebugTableRow *)self currentCollectionViewCell];

  if (v5)
  {
    id v6 = [(MapsDebugTableRow *)self currentCollectionViewCell];
    [(MapsDebugCheckmarkRow *)self _configureCollectionViewCellForCheckedValue:v6];
  }
}

- (id)selectionAction
{
  if ([(MapsDebugCheckmarkRow *)self isDisabled])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsDebugCheckmarkRow;
    v3 = [(MapsDebugTableRow *)&v5 selectionAction];
  }

  return v3;
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (MapsDebugCheckmarkRowsGroup)rowsGroup
{
  return self->_rowsGroup;
}

- (void)setRowsGroup:(id)a3
{
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowsGroup, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_controlSelectionAction, 0);

  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

- (BOOL)isDisabled
{
  if (self->_checked)
  {
    v3 = [(MapsDebugCheckmarkRow *)self rowsGroup];
    if ([v3 allowsMultipleSelection])
    {
      objc_super v4 = [(MapsDebugCheckmarkRow *)self rowsGroup];
      unsigned int v5 = [v4 canDeselectRows] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setSelectionAction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5)
  {
    id v7 = [v4 copy];

    id controlSelectionAction = self->_controlSelectionAction;
    self->_id controlSelectionAction = v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MapsDebugCheckmarkRow;
    [(MapsDebugTableRow *)&v9 setSelectionAction:v4];
  }
}

- (void)_configureCellForCheckedValue:(id)a3
{
  id v16 = a3;
  id v4 = [v16 traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)5)
  {
    id v6 = [(MapsDebugCheckmarkRow *)self _createAccessoryView];
    [v16 setAccessoryView:v6];

    id v7 = [v16 textLabel];
    [(MapsDebugCheckmarkRow *)self _configureTapGestureOnLabel:v7];
  }
  else
  {
    if (self->_checked) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 0;
    }
    [v16 setAccessoryType:v8];
  }
  objc_super v9 = [(MapsDebugCheckmarkRow *)self get];

  if (v9) {
    +[UIColor labelColor];
  }
  else {
  id v10 = +[UIColor secondaryLabelColor];
  }
  v11 = [v16 textLabel];
  [v11 setTextColor:v10];

  if ([(MapsDebugCheckmarkRow *)self isDisabled])
  {
    id v12 = +[UIColor systemGrayColor];
    [v16 setTintColor:v12];

    v13 = [v16 contentView];
    v14 = v13;
    double v15 = 0.5;
  }
  else
  {
    [v16 setTintColor:0];
    v13 = [v16 contentView];
    v14 = v13;
    double v15 = 1.0;
  }
  [v13 setAlpha:v15];
}

- (void)_configureCollectionViewCellForCheckedValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5)
  {
    [v4 _setBackgroundViewConfiguration:0];
    id v7 = [(MapsDebugCheckmarkRow *)self _createAccessoryView];
    id v8 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:v7];
    id v23 = v8;
    objc_super v9 = +[NSArray arrayWithObjects:&v23 count:1];
    [v4 setLeadingAccessoryConfigurations:v9];

    id v10 = [v4 textLabel];
    [(MapsDebugCheckmarkRow *)self _configureTapGestureOnLabel:v10];
  }
  else
  {
    if (self->_checked)
    {
      id v11 = objc_alloc_init((Class)_UICellAccessoryConfigurationCheckmark);
      if ([(MapsDebugCheckmarkRow *)self isDisabled]) {
        +[UIColor systemGrayColor];
      }
      else {
      id v12 = +[UIColor tintColor];
      }
      [v11 setTintColor:v12];

      id v22 = v11;
      v13 = +[NSArray arrayWithObjects:&v22 count:1];
      [v4 setTrailingAccessoryConfigurations:v13];
    }
    else
    {
      [v4 setTrailingAccessoryConfigurations:&__NSArray0__struct];
    }
    id v7 = 0;
  }
  if ([(MapsDebugCheckmarkRow *)self isDisabled])
  {
    v14 = +[UIColor systemGrayColor];
    double v15 = [v4 textLabel];
    [v15 setTintColor:v14];

    id v16 = [v4 contentView];
    [v16 setAlpha:0.5];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setEnabled:0];
    }
  }
  else
  {
    v17 = [v4 textLabel];
    [v17 setTintColor:0];

    v18 = [v4 contentView];
    [v18 setAlpha:1.0];
  }
  v19 = [(MapsDebugCheckmarkRow *)self get];

  if (v19) {
    +[UIColor labelColor];
  }
  else {
  v20 = +[UIColor secondaryLabelColor];
  }
  v21 = [v4 textLabel];
  [v21 setTextColor:v20];
}

- (void)_configureTapGestureOnLabel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (tapGestureRecognizer)
    {
      id v6 = [(UITapGestureRecognizer *)tapGestureRecognizer view];
      [v6 removeGestureRecognizer:self->_tapGestureRecognizer];
    }
    id v7 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTapLabel:"];
    id v8 = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v7;

    [v9 setUserInteractionEnabled:1];
    [v9 addGestureRecognizer:self->_tapGestureRecognizer];
    id v4 = v9;
  }
}

- (id)_createAccessoryView
{
  v3 = [(MapsDebugCheckmarkRow *)self rowsGroup];
  unsigned int v4 = [v3 allowsMultipleSelection];

  if (v4)
  {
    id v5 = -[NonFocusableSwitch initWithFrame:]([NonFocusableSwitch alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(NonFocusableSwitch *)v5 addTarget:self action:"_didSelectAccessory:" forControlEvents:4096];
    [(NonFocusableSwitch *)v5 setOn:self->_checked];
  }
  else
  {
    id v6 = [(MapsDebugCheckmarkRow *)self rowsGroup];
    id v7 = [v6 groupIdentifier];
    id v5 = +[MapsRadioButton buttonWithGroupIdentifier:v7];

    [(NonFocusableSwitch *)v5 addTarget:self action:"_didSelectAccessory:" forControlEvents:4096];
    [(NonFocusableSwitch *)v5 setSelected:self->_checked];
  }
  [(NonFocusableSwitch *)v5 sizeToFit];

  return v5;
}

- (void)_didSelectAccessory:(id)a3
{
}

- (void)_didTapLabel:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MapsDebugCheckmarkRow *)self _fireControlSelectionAction];
  }
}

- (void)_fireControlSelectionAction
{
  id controlSelectionAction = self->_controlSelectionAction;
  if (controlSelectionAction)
  {
    if (!self->_checked)
    {
LABEL_5:
      id v6 = (void (*)(void))*((void *)controlSelectionAction + 2);
      v6();
      return;
    }
    unsigned int v4 = [(MapsDebugCheckmarkRow *)self rowsGroup];
    unsigned int v5 = [v4 canDeselectRows];

    if (v5)
    {
      id controlSelectionAction = self->_controlSelectionAction;
      goto LABEL_5;
    }
  }
  id v7 = [(MapsDebugCheckmarkRow *)self selectionAction];

  if (v7)
  {
    id v8 = [(MapsDebugCheckmarkRow *)self selectionAction];
    v8[2]();
  }
}

- (void)configureCell:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsDebugCheckmarkRow;
  id v4 = a3;
  [(MapsDebugTableRow *)&v5 configureCell:v4];
  -[MapsDebugCheckmarkRow _configureCellForCheckedValue:](self, "_configureCellForCheckedValue:", v4, v5.receiver, v5.super_class);
}

- (void)configureCollectionViewCell:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsDebugCheckmarkRow;
  id v4 = a3;
  [(MapsDebugTableRow *)&v5 configureCollectionViewCell:v4];
  -[MapsDebugCheckmarkRow _configureCollectionViewCellForCheckedValue:](self, "_configureCollectionViewCellForCheckedValue:", v4, v5.receiver, v5.super_class);
}

@end