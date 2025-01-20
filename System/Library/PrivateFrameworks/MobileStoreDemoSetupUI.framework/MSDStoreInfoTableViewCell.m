@interface MSDStoreInfoTableViewCell
- (MSDStoreInfoTableViewCell)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 imageColor:(id)a6 reuseIdentifier:(id)a7;
- (id)initSpinnerCellWithReuseIdentifier:(id)a3;
@end

@implementation MSDStoreInfoTableViewCell

- (id)initSpinnerCellWithReuseIdentifier:(id)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)MSDStoreInfoTableViewCell;
  v3 = [(MSDStoreInfoTableViewCell *)&v20 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(MSDStoreInfoTableViewCell *)v3 setSelectionStyle:0];
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MSDStoreInfoTableViewCell *)v4 addSubview:v5];
    v19 = [v5 centerXAnchor];
    v18 = [(MSDStoreInfoTableViewCell *)v4 centerXAnchor];
    v17 = [v19 constraintEqualToAnchor:v18];
    v21[0] = v17;
    v16 = [v5 centerYAnchor];
    v15 = [(MSDStoreInfoTableViewCell *)v4 centerYAnchor];
    v6 = [v16 constraintEqualToAnchor:v15];
    v21[1] = v6;
    v7 = [v5 heightAnchor];
    v8 = [(MSDStoreInfoTableViewCell *)v4 heightAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 multiplier:0.5];
    v21[2] = v9;
    v10 = [v5 widthAnchor];
    v11 = [v5 heightAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v21[3] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];

    [MEMORY[0x263F08938] activateConstraints:v13];
    [v5 startAnimating];
  }
  return v4;
}

- (MSDStoreInfoTableViewCell)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 imageColor:(id)a6 reuseIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MSDStoreInfoTableViewCell;
  v16 = [(MSDStoreInfoTableViewCell *)&v32 initWithStyle:3 reuseIdentifier:a7];
  v17 = v16;
  if (v16)
  {
    v18 = [(MSDStoreInfoTableViewCell *)v16 defaultContentConfiguration];
    [v18 setText:v12];
    [v18 setSecondaryText:v13];
    [v18 setImage:v14];
    v19 = [v18 imageProperties];
    [v19 setTintColor:v15];

    objc_super v20 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
    v21 = [v18 textProperties];
    [v21 setFont:v20];

    v22 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    v23 = [v18 secondaryTextProperties];
    [v23 setFont:v22];

    v24 = [MEMORY[0x263F1C550] systemGrayColor];
    v25 = [v18 secondaryTextProperties];
    [v25 setColor:v24];

    v26 = [v18 image];
    v27 = [MEMORY[0x263F1C6C8] configurationWithPointSize:25.0];
    v28 = [v26 imageByApplyingSymbolConfiguration:v27];
    [v18 setImage:v28];

    v29 = [v18 imageProperties];
    objc_msgSend(v29, "setReservedLayoutSize:", 50.0, 50.0);

    [v18 setTextToSecondaryTextVerticalPadding:3.0];
    [(MSDStoreInfoTableViewCell *)v17 setContentConfiguration:v18];
    v30 = [(MSDStoreInfoTableViewCell *)v17 contentView];
    objc_msgSend(v30, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  }
  return v17;
}

@end