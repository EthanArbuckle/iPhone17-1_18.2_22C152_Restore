@interface ActionCellAccessory
- (ActionCellAccessory)initWithAction:(id)a3;
- (ActionCellAccessory)initWithAction:(id)a3 visibilityProvider:(id)a4;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)applyContentConfiguration:(id)a3 forState:(id)a4;
- (void)setPreferredSymbolConfiguration:(id)a3;
@end

@implementation ActionCellAccessory

- (ActionCellAccessory)initWithAction:(id)a3
{
  return [(ActionCellAccessory *)self initWithAction:a3 visibilityProvider:&__block_literal_global_63];
}

uint64_t __38__ActionCellAccessory_initWithAction___block_invoke()
{
  return 1;
}

- (ActionCellAccessory)initWithAction:(id)a3 visibilityProvider:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1 primaryAction:a3];
  v8 = [(ActionCellAccessory *)self initWithCustomView:v7 placement:1];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1E4E42950](v6);
    id visibilityProvider = v8->_visibilityProvider;
    v8->_id visibilityProvider = (id)v9;

    [(UICellAccessory *)v8 setReservedLayoutWidth:30.0];
    v11 = v8;
  }

  return v8;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  id v6 = (UIImageSymbolConfiguration *)a3;
  if (self->_preferredSymbolConfiguration != v6)
  {
    objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
    v5 = [(ActionCellAccessory *)self customView];
    [v5 setPreferredSymbolConfiguration:v6 forImageInState:0];
  }
}

- (void)applyContentConfiguration:(id)a3 forState:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v14;
    v8 = [(ActionCellAccessory *)self customView];
    uint64_t v9 = (*((unsigned int (**)(void))self->_visibilityProvider + 2))() ^ 1;
    [v8 setHidden:v9];
    [(UICellAccessory *)self setHidden:v9];
    v10 = [v7 textProperties];
    v11 = [v10 color];
    [v8 setTitleColor:v11 forState:0];

    if (objc_msgSend(v7, "safari_usesWhiteText"))
    {
      v12 = [v7 textProperties];
      v13 = [v12 color];
      [v8 setTintColor:v13];
    }
    else
    {
      v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v8 setTintColor:v12];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ActionCellAccessory;
  v4 = [(UICellAccessory *)&v8 copyWithZone:a3];
  uint64_t v5 = MEMORY[0x1E4E42950](self->_visibilityProvider);
  id v6 = (void *)v4[10];
  v4[10] = v5;

  [v4 setPreferredSymbolConfiguration:self->_preferredSymbolConfiguration];
  return v4;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong(&self->_visibilityProvider, 0);
}

@end