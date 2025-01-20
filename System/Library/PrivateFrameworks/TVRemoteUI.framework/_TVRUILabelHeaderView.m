@interface _TVRUILabelHeaderView
+ (NSString)elementKind;
+ (NSString)reuseIdentifier;
- (NSString)title;
- (UILabel)titleLabel;
- (_TVRUILabelHeaderView)initWithFrame:(CGRect)a3;
- (void)_configureHierarchy;
- (void)prepareForReuse;
- (void)setTitle:(id)a3;
@end

@implementation _TVRUILabelHeaderView

- (_TVRUILabelHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUILabelHeaderView;
  v3 = -[_TVRUILabelHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUILabelHeaderView *)v3 _configureHierarchy];
  }
  return v4;
}

+ (NSString)elementKind
{
  return (NSString *)@"com.apple.tvos.remote.mediainfo.header";
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"mediainfo-header-reuse-identifier";
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRUILabelHeaderView;
  [(_TVRUILabelHeaderView *)&v3 prepareForReuse];
  [(_TVRUILabelHeaderView *)self setTitle:0];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id v6 = [(_TVRUILabelHeaderView *)self titleLabel];
  [v6 setText:v5];
}

- (void)_configureHierarchy
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [(_TVRUILabelHeaderView *)self contentView];
  objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)v3 setFont:v4];

  id v5 = [MEMORY[0x263F825C8] lightTextColor];
  [(UILabel *)v3 setTextColor:v5];

  [(UILabel *)v3 setAdjustsFontForContentSizeCategory:1];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v33 = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v2 addSubview:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }

  v21 = (void *)MEMORY[0x263F08938];
  v26 = [(UILabel *)v3 leadingAnchor];
  v25 = [v2 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:0.0];
  v32[0] = v24;
  v23 = [(UILabel *)v3 trailingAnchor];
  v22 = [v2 trailingAnchor];
  v12 = [v23 constraintEqualToAnchor:v22 constant:-0.0];
  v32[1] = v12;
  v13 = [(UILabel *)v3 topAnchor];
  v14 = [v2 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:2.0];
  v32[2] = v15;
  v16 = [(UILabel *)v3 bottomAnchor];
  v17 = [v2 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-2.0];
  v32[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  [v21 activateConstraints:v19];

  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end