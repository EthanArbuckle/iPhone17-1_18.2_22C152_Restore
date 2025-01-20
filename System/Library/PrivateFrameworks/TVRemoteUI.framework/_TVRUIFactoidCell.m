@interface _TVRUIFactoidCell
+ (double)preferredHeight;
- (BOOL)isExpanded;
- (UILabel)factoidLabel;
- (_TVRUIFactoidCell)initWithFrame:(CGRect)a3;
- (_TVRUIFactoidItem)item;
- (void)_configureHierarchy;
- (void)_updateFromItem:(id)a3;
- (void)prepareForReuse;
- (void)setIsExpanded:(BOOL)a3;
- (void)setItem:(id)a3;
@end

@implementation _TVRUIFactoidCell

- (_TVRUIFactoidCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUIFactoidCell;
  v3 = -[_TVRUIFactoidCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUIFactoidCell *)v3 _configureHierarchy];
  }
  return v4;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
  id v5 = a3;
  [(_TVRUIFactoidCell *)self _updateFromItem:v5];
}

+ (double)preferredHeight
{
  return 44.0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRUIFactoidCell;
  [(_TVRUIFactoidCell *)&v3 prepareForReuse];
  [(_TVRUIFactoidCell *)self _updateFromItem:0];
}

- (void)_configureHierarchy
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)v3 setFont:v4];

  [(UILabel *)v3 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v3 setNumberOfLines:0];
  v27 = self;
  id v5 = [(_TVRUIFactoidCell *)self contentView];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v33 = v3;
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
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
        [v5 addSubview:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }

  v21 = (void *)MEMORY[0x263F08938];
  v26 = [(UILabel *)v3 leadingAnchor];
  v25 = [v5 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:20.0];
  v32[0] = v24;
  v23 = [(UILabel *)v3 trailingAnchor];
  v22 = [v5 trailingAnchor];
  v12 = [v23 constraintEqualToAnchor:v22 constant:-20.0];
  v32[1] = v12;
  v13 = [(UILabel *)v3 topAnchor];
  v14 = [v5 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:5.0];
  v32[2] = v15;
  v16 = [(UILabel *)v3 bottomAnchor];
  v17 = [v5 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-5.0];
  v32[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  [v21 activateConstraints:v19];

  factoidLabel = v27->_factoidLabel;
  v27->_factoidLabel = v3;
}

- (void)_updateFromItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 factoidText];
  uint64_t v6 = [(_TVRUIFactoidCell *)self factoidLabel];
  [(id)v6 setText:v5];

  LOBYTE(v6) = [v4 factoidOptions];
  char v7 = [v4 factoidOptions];
  char v8 = [v4 factoidOptions];

  BOOL v9 = [(_TVRUIFactoidCell *)self isExpanded];
  if (v6) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 4;
  }
  v11 = [(_TVRUIFactoidCell *)self factoidLabel];
  [v11 setTextAlignment:v10];

  v12 = (void *)MEMORY[0x263F83570];
  if ((v7 & 2) == 0) {
    v12 = (void *)MEMORY[0x263F83588];
  }
  v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*v12];
  v14 = [(_TVRUIFactoidCell *)self factoidLabel];
  [v14 setFont:v13];

  if ((v8 & 4) != 0)
  {
    if (v9) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = 10;
    }
    v15 = [(_TVRUIFactoidCell *)self factoidLabel];
    id v18 = v15;
    uint64_t v16 = v17;
  }
  else
  {
    v15 = [(_TVRUIFactoidCell *)self factoidLabel];
    id v18 = v15;
    uint64_t v16 = 0;
  }
  [v15 setNumberOfLines:v16];
}

- (_TVRUIFactoidItem)item
{
  return self->_item;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (UILabel)factoidLabel
{
  return self->_factoidLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoidLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end