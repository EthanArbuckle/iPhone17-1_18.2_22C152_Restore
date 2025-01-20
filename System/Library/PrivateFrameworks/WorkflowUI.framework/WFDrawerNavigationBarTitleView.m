@interface WFDrawerNavigationBarTitleView
- (WFDrawerNavigationBarTitleView)initWithDelegate:(id)a3 showsDetailsButton:(BOOL)a4;
- (WFInspectorPaneSegmentedControlHostingView)hostingView;
@end

@implementation WFDrawerNavigationBarTitleView

- (void).cxx_destruct
{
}

- (WFInspectorPaneSegmentedControlHostingView)hostingView
{
  return self->_hostingView;
}

- (WFDrawerNavigationBarTitleView)initWithDelegate:(id)a3 showsDetailsButton:(BOOL)a4
{
  BOOL v4 = a4;
  v34[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WFDrawerNavigationBarTitleView;
  v7 = -[_UINavigationBarTitleView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    [(_UINavigationBarTitleView *)v7 setUnderlayBarContent:1];
    [(_UINavigationBarTitleView *)v8 setHideStandardTitle:1];
    [(_UINavigationBarTitleView *)v8 setPreferredContentAlignment:2];
    v9 = [[WFInspectorPaneSegmentedControlHostingView alloc] initWithDelegate:v6 showsDetailsButton:v4];
    hostingView = v8->_hostingView;
    v8->_hostingView = v9;

    [(WFDrawerNavigationBarTitleView *)v8 addSubview:v8->_hostingView];
    [(_UINavigationBarTitleView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(WFDrawerNavigationBarTitleView *)v8 hostingView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = (void *)MEMORY[0x263F08938];
    v31 = [(WFDrawerNavigationBarTitleView *)v8 hostingView];
    v30 = [v31 centerXAnchor];
    v29 = [(WFDrawerNavigationBarTitleView *)v8 centerXAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v34[0] = v28;
    v27 = [(WFDrawerNavigationBarTitleView *)v8 hostingView];
    v26 = [v27 centerYAnchor];
    v25 = [(WFDrawerNavigationBarTitleView *)v8 centerYAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v34[1] = v23;
    [(WFDrawerNavigationBarTitleView *)v8 hostingView];
    v12 = id v32 = v6;
    v13 = [v12 widthAnchor];
    v14 = [(WFDrawerNavigationBarTitleView *)v8 widthAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v34[2] = v15;
    v16 = [(WFDrawerNavigationBarTitleView *)v8 hostingView];
    v17 = [v16 heightAnchor];
    v18 = [(WFDrawerNavigationBarTitleView *)v8 heightAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v34[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
    [v24 activateConstraints:v20];

    id v6 = v32;
    v21 = v8;
  }

  return v8;
}

@end