@interface RAPHomeFooterToolBarView
- (RAPHomeFooterToolBarView)initWithFrame:(CGRect)a3;
- (RAPHomeFooterToolBarViewDelegate)delegate;
- (void)_refreshToolbarItems;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)tapCreateButton;
@end

@implementation RAPHomeFooterToolBarView

- (RAPHomeFooterToolBarView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPHomeFooterToolBarView;
  v3 = -[RAPHomeFooterToolBarView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RAPHomeFooterToolBarView *)v3 _setupSubviews];
    [(RAPHomeFooterToolBarView *)v4 _setupConstraints];
    [(RAPHomeFooterToolBarView *)v4 _refreshToolbarItems];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RAPHomeFooterToolBarView;
  [(RAPHomeFooterToolBarView *)&v3 layoutSubviews];
  [(RAPHomeFooterToolBarView *)self _refreshToolbarItems];
}

- (void)_setupSubviews
{
  objc_super v3 = (UIToolbar *)[objc_alloc((Class)UIToolbar) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  toolBar = self->_toolBar;
  self->_toolBar = v3;

  v5 = self->_toolBar;
  objc_super v6 = objc_opt_new();
  [(UIToolbar *)v5 setBackgroundImage:v6 forToolbarPosition:0 barMetrics:0];

  v7 = self->_toolBar;
  v8 = +[UIColor clearColor];
  [(UIToolbar *)v7 setBackgroundColor:v8];

  [(UIToolbar *)self->_toolBar setTranslucent:1];
  [(UIToolbar *)self->_toolBar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIToolbar *)self->_toolBar setAccessibilityIdentifier:@"RAPHomeFooterToolBar"];
  v9 = self->_toolBar;

  [(RAPHomeFooterToolBarView *)self addSubview:v9];
}

- (void)_setupConstraints
{
  v15 = [(UIToolbar *)self->_toolBar topAnchor];
  v14 = [(RAPHomeFooterToolBarView *)self topAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v13;
  objc_super v3 = [(UIToolbar *)self->_toolBar bottomAnchor];
  v4 = [(RAPHomeFooterToolBarView *)self bottomAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v16[1] = v5;
  objc_super v6 = [(UIToolbar *)self->_toolBar leadingAnchor];
  v7 = [(RAPHomeFooterToolBarView *)self leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v16[2] = v8;
  v9 = [(UIToolbar *)self->_toolBar trailingAnchor];
  v10 = [(RAPHomeFooterToolBarView *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v16[3] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_refreshToolbarItems
{
  if (!self->_createButton)
  {
    objc_super v3 = +[UIButtonConfiguration plainButtonConfiguration];
    [v3 setImagePadding:4.0];
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"[Reports] Report a New Issue" value:@"localized string not found" table:0];
    [v3 setTitle:v5];

    objc_super v6 = +[UIImage systemImageNamed:@"square.and.pencil"];
    [v3 setImage:v6];

    v7 = +[UIButton buttonWithConfiguration:v3 primaryAction:0];
    [(UIButton *)v7 setPreferredMenuElementOrder:2];
    [(UIButton *)v7 setShowsMenuAsPrimaryAction:1];
    createButton = self->_createButton;
    self->_createButton = v7;
  }
  v9 = [(RAPHomeFooterToolBarView *)self delegate];
  v10 = [v9 menuForRAPHomeFooterToolBarView:self];
  [(UIButton *)self->_createButton setMenu:v10];

  [(UIButton *)self->_createButton addTarget:self action:"tapCreateButton" forControlEvents:0x4000];
  id v11 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_createButton];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v14[0] = v12;
  v14[1] = v11;
  v14[2] = v12;
  v13 = +[NSArray arrayWithObjects:v14 count:3];
  [(UIToolbar *)self->_toolBar setItems:v13];
}

- (void)tapCreateButton
{
  id v3 = [(RAPHomeFooterToolBarView *)self delegate];
  [v3 tappedMenuForRAPHomeFooterToolBarView:self];
}

- (RAPHomeFooterToolBarViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_createButton, 0);

  objc_storeStrong((id *)&self->_toolBar, 0);
}

@end