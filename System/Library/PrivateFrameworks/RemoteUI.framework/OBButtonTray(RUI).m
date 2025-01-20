@interface OBButtonTray(RUI)
- (void)addHeaderView:()RUI;
@end

@implementation OBButtonTray(RUI)

- (void)addHeaderView:()RUI
{
  v25[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 privacyContainer];
  [v5 addSubview:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = (void *)MEMORY[0x263F08938];
  v23 = [v4 leadingAnchor];
  v24 = [a1 readableContentGuide];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22 constant:16.0];
  v25[0] = v21;
  v19 = [v4 trailingAnchor];
  v20 = [a1 readableContentGuide];
  v18 = [v20 trailingAnchor];
  v6 = [v19 constraintEqualToAnchor:v18 constant:-16.0];
  v25[1] = v6;
  v7 = [v4 topAnchor];
  v8 = [a1 privacyContainer];
  v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v25[2] = v10;
  v11 = [v4 bottomAnchor];

  v12 = [a1 privacyContainer];
  v13 = [v12 bottomAnchor];
  [a1 _privacyLinkControllerBottomPadding];
  v15 = [v11 constraintEqualToAnchor:v13 constant:-v14];
  v25[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  [v17 activateConstraints:v16];
}

@end