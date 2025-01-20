@interface SUSSoftwareUpdateComingSoonTipCell
- (SUSSoftwareUpdateComingSoonTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIView)tipView;
- (double)preferredHeightWithTable:(id)a3;
- (id)createDynamicColor:(id)a3 withDarkStyleVariant:(id)a4;
- (id)createTipView;
- (void)layoutSubviews;
- (void)setTipView:(id)a3;
- (void)updateConstraints;
@end

@implementation SUSSoftwareUpdateComingSoonTipCell

- (SUSSoftwareUpdateComingSoonTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v22 = self;
  SEL v21 = a2;
  int64_t v20 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  v5 = v22;
  v22 = 0;
  v17.receiver = v5;
  v17.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  v22 = [(PSTableCell *)&v17 initWithStyle:v20 reuseIdentifier:location specifier:v18];
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    [(SUSSoftwareUpdateComingSoonTipCell *)v22 setHoverStyle:0];
    v6 = (UIView *)[(SUSSoftwareUpdateComingSoonTipCell *)v22 createTipView];
    tipView = v22->_tipView;
    v22->_tipView = v6;

    v11 = v22->_tipView;
    v10 = v22;
    id v14 = (id)[MEMORY[0x263F825C8] systemWhiteColor];
    id v13 = (id)[MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    id v12 = -[SUSSoftwareUpdateComingSoonTipCell createDynamicColor:withDarkStyleVariant:](v10, "createDynamicColor:withDarkStyleVariant:", v14);
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:");

    id v15 = (id)[(SUSSoftwareUpdateComingSoonTipCell *)v22 contentView];
    [v15 addSubview:v22->_tipView];

    [(SUSSoftwareUpdateComingSoonTipCell *)v22 updateConstraints];
  }
  v9 = v22;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v9;
}

- (id)createDynamicColor:(id)a3 withDarkStyleVariant:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = (id)[MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:0];
  id v8 = (id)objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithUserInterfaceStyle:");
  v12[0] = v9;
  v13[0] = location[0];
  v12[1] = v8;
  v13[1] = v10;
  id v7 = (id)[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v6 = (id)[MEMORY[0x263F825C8] _dynamicColorWithColorsByTraitCollection:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)updateConstraints
{
  v39 = self;
  SEL v38 = a2;
  long long v36 = 0u;
  long long v37 = 0u;
  [(UIView *)self->_tipView frame];
  *(void *)&long long v37 = v2;
  *((void *)&v37 + 1) = v3;
  id v13 = (id)[(SUSSoftwareUpdateComingSoonTipCell *)v39 contentView];
  [v13 frame];
  double v32 = v4;
  uint64_t v33 = v5;
  uint64_t v34 = v6;
  uint64_t v35 = v7;
  *(float *)&double v4 = v4;
  *(double *)&long long v36 = floorf(*(float *)&v4);

  id v14 = (id)[(SUSSoftwareUpdateComingSoonTipCell *)v39 contentView];
  [v14 frame];
  uint64_t v28 = v8;
  double v29 = v9;
  uint64_t v30 = v10;
  uint64_t v31 = v11;
  *(float *)&uint64_t v8 = v9;
  *((double *)&v36 + 1) = floorf(*(float *)&v8);

  -[UIView setFrame:](v39->_tipView, "setFrame:", v36, v37);
  [(UIView *)v39->_tipView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1148846080;
  [(UIView *)v39->_tipView setContentHuggingPriority:1 forAxis:v12];
  id v18 = [(UIView *)v39->_tipView bottomAnchor];
  id v17 = (id)[(SUSSoftwareUpdateComingSoonTipCell *)v39 contentView];
  id v16 = (id)[v17 bottomAnchor];
  id v15 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v18, "constraintEqualToAnchor:");
  [v15 setActive:1];

  v22 = [(UIView *)v39->_tipView leadingAnchor];
  id v21 = (id)[(SUSSoftwareUpdateComingSoonTipCell *)v39 contentView];
  id v20 = (id)[v21 leadingAnchor];
  id v19 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v22, "constraintEqualToAnchor:");
  [v19 setActive:1];

  v26 = [(UIView *)v39->_tipView trailingAnchor];
  id v25 = (id)[(SUSSoftwareUpdateComingSoonTipCell *)v39 contentView];
  id v24 = (id)[v25 trailingAnchor];
  id v23 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v26, "constraintEqualToAnchor:");
  [v23 setActive:1];

  v27.receiver = v39;
  v27.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  [(SUSSoftwareUpdateComingSoonTipCell *)&v27 updateConstraints];
}

- (double)preferredHeightWithTable:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSSoftwareUpdateComingSoonTipCell *)v11 bounds];
  CGSizeMake_1();
  double v8 = v3;
  double v9 = v4;
  [(UIView *)v11->_tipView layoutIfNeeded];
  -[UIView sizeThatFits:](v11->_tipView, "sizeThatFits:", v8, v9);
  double v7 = v5;
  objc_storeStrong(location, 0);
  return v7;
}

- (void)layoutSubviews
{
  double v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  [(SUSSoftwareUpdateComingSoonTipCell *)&v3 updateConstraints];
  v2.receiver = v5;
  v2.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  [(PSTableCell *)&v2 layoutSubviews];
}

- (UIView)tipView
{
  return self->_tipView;
}

- (void)setTipView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)createTipView
{
  void (*v4)(void *__return_ptr);
  id v5;
  id v6;
  void *v7;
  void v9[5];
  uint64_t vars8;

  objc_super v2 = self;
  objc_super v3 = (id *)SUSettingsSwiftTipsManager.shared.unsafeMutableAddressor();
  SEL v4 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *(void *)*v3) + 0x90);
  double v5 = *v3;
  v4(v9);

  uint64_t v6 = objc_allocWithZone((Class)sub_23BB092B0());
  double v7 = (void *)sub_23BB092C0();

  return v7;
}

@end