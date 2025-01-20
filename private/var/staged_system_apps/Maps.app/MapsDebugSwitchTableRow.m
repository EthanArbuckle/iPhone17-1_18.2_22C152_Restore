@interface MapsDebugSwitchTableRow
- (BOOL)isEnabled;
- (MapsDebugSwitchTableRow)init;
- (id)_createToggleForIdiom:(int64_t)a3;
- (id)get;
- (id)set;
- (void)_configureTapGesture:(id)a3;
- (void)_didTapContent:(id)a3;
- (void)_switchDidChangeValue:(id)a3;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)invalidate;
- (void)setEnabled:(BOOL)a3;
- (void)setGet:(id)a3;
- (void)setSet:(id)a3;
@end

@implementation MapsDebugSwitchTableRow

- (MapsDebugSwitchTableRow)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsDebugSwitchTableRow;
  v2 = [(MapsDebugTableRow *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    objc_initWeak(&location, v2);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100850C34;
    v6[3] = &unk_1012E6708;
    objc_copyWeak(&v7, &location);
    [(MapsDebugTableRow *)v3 setSelectionAction:v6];
    v4 = v3;
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)invalidate
{
  [(MapsDebugSwitchTableRow *)self setGet:0];
  [(MapsDebugSwitchTableRow *)self setSet:0];
  [(MapsDebugSwitchTableRow *)self setEnabled:1];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugSwitchTableRow;
  [(MapsDebugTableRow *)&v3 invalidate];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UISwitch setEnabled:](self->_toggle, "setEnabled:");
}

- (id)_createToggleForIdiom:(int64_t)a3
{
  v4 = (Class *)off_1012D4348;
  if (a3 != 5) {
    v4 = (Class *)UISwitch_ptr;
  }
  id v5 = [objc_alloc(*v4) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v5 addTarget:self action:"_switchDidChangeValue:" forControlEvents:4096];
  v6 = [(MapsDebugSwitchTableRow *)self get];

  if (v6)
  {
    id v7 = [(MapsDebugSwitchTableRow *)self get];
    [v5 setOn:v7[2]()];
  }
  [v5 sizeToFit];
  [v5 setEnabled:self->_enabled];
  [v5 setAccessibilityIdentifier:@"MapsDebugToggle"];

  return v5;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MapsDebugSwitchTableRow;
  [(MapsDebugTableRow *)&v15 configureCell:v4];
  id v5 = [v4 traitCollection];
  -[MapsDebugSwitchTableRow _createToggleForIdiom:](self, "_createToggleForIdiom:", [v5 userInterfaceIdiom]);
  v6 = (UISwitch *)objc_claimAutoreleasedReturnValue();

  [v4 setAccessoryView:v6];
  toggle = self->_toggle;
  self->_toggle = v6;
  v8 = v6;

  objc_super v9 = [v4 contentConfiguration];
  if (self->_enabled) {
    +[UIColor labelColor];
  }
  else {
  v10 = +[UIColor secondaryLabelColor];
  }

  v11 = [v9 textProperties];
  [v11 setColor:v10];

  [v4 setContentConfiguration:v9];
  v12 = [v4 traitCollection];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)5)
  {
    v14 = [v4 contentView];
    [(MapsDebugSwitchTableRow *)self _configureTapGesture:v14];
  }
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MapsDebugSwitchTableRow;
  [(MapsDebugTableRow *)&v21 configureCollectionViewCell:v4];
  id v5 = v4;
  v6 = [v5 traitCollection];
  id v7 = -[MapsDebugSwitchTableRow _createToggleForIdiom:](self, "_createToggleForIdiom:", [v6 userInterfaceIdiom]);

  id v8 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:v7];
  objc_storeStrong((id *)&self->_toggle, v7);
  objc_super v9 = [v5 traitCollection];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 == (id)5)
  {
    id v23 = v8;
    v11 = +[NSArray arrayWithObjects:&v23 count:1];
    [v5 setLeadingAccessoryConfigurations:v11];

    v12 = [v5 contentView];
    [(MapsDebugSwitchTableRow *)self _configureTapGesture:v12];
  }
  else
  {
    id v22 = v8;
    v12 = +[NSArray arrayWithObjects:&v22 count:1];
    [v5 setTrailingAccessoryConfigurations:v12];
  }

  if (self->_enabled) {
    +[UIColor labelColor];
  }
  else {
  id v13 = +[UIColor secondaryLabelColor];
  }
  v14 = [v5 textLabel];
  [v14 setTextColor:v13];

  objc_super v15 = [v5 contentConfiguration];
  if (self->_enabled) {
    +[UIColor labelColor];
  }
  else {
  v16 = +[UIColor secondaryLabelColor];
  }
  v17 = [v15 textProperties];
  [v17 setColor:v16];

  if (!self->_enabled)
  {
    v18 = [v15 image];

    if (v18)
    {
      v19 = [v15 image];
      v20 = [v19 _mapkit_imageWithAlpha:0.5];
      [v15 setImage:v20];
    }
  }
  [v5 setContentConfiguration:v15];
}

- (void)_configureTapGesture:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (tapGestureRecognizer)
    {
      v6 = [(UITapGestureRecognizer *)tapGestureRecognizer view];
      [v6 removeGestureRecognizer:self->_tapGestureRecognizer];
    }
    id v7 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTapContent:"];
    id v8 = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v7;

    [v9 setUserInteractionEnabled:1];
    [v9 addGestureRecognizer:self->_tapGestureRecognizer];
    id v4 = v9;
  }
}

- (void)_switchDidChangeValue:(id)a3
{
  id v4 = [a3 isOn];
  id v5 = [(MapsDebugSwitchTableRow *)self set];

  if (v5)
  {
    v6 = [(MapsDebugSwitchTableRow *)self set];
    v6[2](v6, v4);
  }
}

- (void)_didTapContent:(id)a3
{
  toggle = self->_toggle;
  if (toggle)
  {
    [(UISwitch *)toggle setOn:[(UISwitch *)self->_toggle isOn] ^ 1 animated:1];
    id v5 = self->_toggle;
    [(MapsDebugSwitchTableRow *)self _switchDidChangeValue:v5];
  }
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_toggle, 0);

  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end