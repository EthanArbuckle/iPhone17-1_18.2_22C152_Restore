@interface _UIActivityContentFooterView
- (UIButton)editButton;
- (_UIActivityContentFooterView)initWithFrame:(CGRect)a3;
- (id)_createEditButton;
- (void)prepareForReuse;
- (void)setEditButton:(id)a3;
@end

@implementation _UIActivityContentFooterView

- (_UIActivityContentFooterView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)_UIActivityContentFooterView;
  v3 = -[_UIActivityContentFooterView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_UIActivityContentFooterView *)v3 _createEditButton];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIActivityContentFooterView *)v4 setEditButton:v5];
    v6 = v4;
    [(_UIActivityContentFooterView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(_UIActivityContentFooterView *)v6 editButton];
    [(_UIActivityContentFooterView *)v6 addSubview:v7];

    v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    v11 = [(_UIActivityContentFooterView *)v6 editButton];
    v12 = v11;
    if (v10 == 6)
    {
      v13 = [v11 centerXAnchor];
      v14 = [(_UIActivityContentFooterView *)v6 layoutMarginsGuide];
      v15 = [v14 centerXAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];
      [v8 addObject:v16];

      v17 = [(_UIActivityContentFooterView *)v6 editButton];
      v18 = [v17 centerYAnchor];
      v19 = [(_UIActivityContentFooterView *)v6 layoutMarginsGuide];
      v20 = [v19 centerYAnchor];
      v21 = [v18 constraintGreaterThanOrEqualToAnchor:v20];
      [v8 addObject:v21];
    }
    else
    {
      v22 = [v11 leadingAnchor];
      v23 = [(_UIActivityContentFooterView *)v6 layoutMarginsGuide];
      v24 = [v23 leadingAnchor];
      v25 = [v22 constraintEqualToAnchor:v24];
      [v8 addObject:v25];

      v26 = [(_UIActivityContentFooterView *)v6 editButton];
      v27 = [v26 trailingAnchor];
      v28 = [(_UIActivityContentFooterView *)v6 layoutMarginsGuide];
      v29 = [v28 trailingAnchor];
      v30 = [v27 constraintGreaterThanOrEqualToAnchor:v29 constant:0.0];
      [v8 addObject:v30];

      v31 = [(_UIActivityContentFooterView *)v6 editButton];
      v32 = [v31 topAnchor];
      v33 = [(_UIActivityContentFooterView *)v6 topAnchor];
      v34 = [v32 constraintEqualToAnchor:v33 constant:10.0];
      [v8 addObject:v34];

      v17 = [(_UIActivityContentFooterView *)v6 bottomAnchor];
      v18 = [(_UIActivityContentFooterView *)v6 editButton];
      v19 = [v18 bottomAnchor];
      v20 = [v17 constraintEqualToAnchor:v19 constant:16.0];
      [v8 addObject:v20];
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v8];
  }
  return v4;
}

- (id)_createEditButton
{
  v2 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6)
  {
    v5 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
    [v5 setCornerStyle:4];
    [v5 setTitleTextAttributesTransformer:&__block_literal_global_44];
    [v2 setConfiguration:v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4FB1798];
    v7 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
    v8 = [v6 fontWithDescriptor:v7 size:0.0];
    v9 = [v2 titleLabel];
    [v9 setFont:v8];

    [v2 setContentHorizontalAlignment:4];
    [v2 setContentVerticalAlignment:1];
  }
  return v2;
}

- (void)prepareForReuse
{
  id v2 = [(_UIActivityContentFooterView *)self editButton];
  [v2 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end