@interface STSResultDetailFooter
- (CGSize)providerIconSize;
- (STSResultDetailFooter)initWithFrame:(CGRect)a3;
- (UIButton)providerButton;
- (UIButton)sendButton;
- (UIImage)providerIcon;
- (void)setProviderIcon:(id)a3;
- (void)setProviderIconSize:(CGSize)a3;
- (void)updateConstraints;
@end

@implementation STSResultDetailFooter

- (STSResultDetailFooter)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)STSResultDetailFooter;
  v3 = -[STSResultDetailFooter initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v4;

    id v6 = objc_alloc(MEMORY[0x263F82828]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    providerIconView = v3->_providerIconView;
    v3->_providerIconView = (UIImageView *)v7;

    [(UIImageView *)v3->_providerIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_providerIconView setContentMode:4];
    [(UIImageView *)v3->_providerIconView setUserInteractionEnabled:0];
    uint64_t v9 = [MEMORY[0x263F824E8] buttonWithType:1];
    providerButton = v3->_providerButton;
    v3->_providerButton = (UIButton *)v9;

    [(UIButton *)v3->_providerButton setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIButton setContentEdgeInsets:](v3->_providerButton, "setContentEdgeInsets:", 10.0, 0.0, 10.0, 0.0);
    v11 = [(UIButton *)v3->_providerButton titleLabel];
    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [v11 setFont:v12];

    v13 = v3->_providerButton;
    v14 = [MEMORY[0x263F825C8] whiteColor];
    [(UIButton *)v13 setTitleColor:v14 forState:0];

    uint64_t v15 = [MEMORY[0x263F824E8] buttonWithType:0];
    sendButton = v3->_sendButton;
    v3->_sendButton = (UIButton *)v15;

    [(UIButton *)v3->_sendButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x263F827E8];
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v17 imageNamed:@"send-button" inBundle:v18];

    [(UIButton *)v3->_sendButton setImage:v19 forState:0];
    [(STSResultDetailFooter *)v3 addSubview:v3->_providerButton];
    [(STSResultDetailFooter *)v3 addSubview:v3->_providerIconView];
    [(STSResultDetailFooter *)v3 addSubview:v3->_sendButton];
    [(STSResultDetailFooter *)v3 setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)updateConstraints
{
  v19[6] = *MEMORY[0x263EF8340];
  [(STSResultDetailFooter *)self removeConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  v17.receiver = self;
  v17.super_class = (Class)STSResultDetailFooter;
  [(STSResultDetailFooter *)&v17 updateConstraints];
  if (self->_providerIconSize.width <= 0.0) {
    double v3 = 0.0;
  }
  else {
    double v3 = 8.0;
  }
  v16 = [(UIButton *)self->_sendButton imageForState:0];
  uint64_t v4 = _NSDictionaryOfVariableBindings(&cfstr_Providericonvi.isa, self->_providerIconView, self->_providerButton, self->_sendButton, 0);
  v19[0] = &unk_26E2BAA80;
  v18[0] = @"ProviderIconInsetsLeft";
  v18[1] = @"ProviderIconInsetsRight";
  v5 = [NSNumber numberWithDouble:v3];
  v19[1] = v5;
  v18[2] = @"ProviderIconWidth";
  id v6 = [NSNumber numberWithDouble:self->_providerIconSize.width];
  v19[2] = v6;
  v19[3] = &unk_26E2BAA90;
  v18[3] = @"ProviderButtonInsetsRight";
  v18[4] = @"SendButtonInsetsRight";
  uint64_t v7 = NSNumber;
  [v16 size];
  uint64_t v9 = [v7 numberWithDouble:(44.0 - v8) * -0.5 + 10.0];
  v18[5] = @"SendButtonWidth";
  v19[4] = v9;
  v19[5] = &unk_26E2BAAA0;
  v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];

  v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-ProviderIconInsetsLeft-[_providerIconView(ProviderIconWidth)]-ProviderIconInsetsRight-[_providerButton]-(>=ProviderButtonInsetsRight)-[_sendButton(SendButtonWidth)]-SendButtonInsetsRight-|" options:0 metrics:v10 views:v4];
  v12 = [MEMORY[0x263F08938] constraintWithItem:self->_providerIconView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  v13 = [MEMORY[0x263F08938] constraintWithItem:self->_providerButton attribute:10 relatedBy:0 toItem:self->_providerIconView attribute:10 multiplier:1.0 constant:-1.5];
  v14 = [MEMORY[0x263F08938] constraintWithItem:self->_sendButton attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  uint64_t v15 = [MEMORY[0x263F08938] constraintWithItem:self->_sendButton attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v11];
  [(NSMutableArray *)self->_constraints addObject:v12];
  [(NSMutableArray *)self->_constraints addObject:v13];
  [(NSMutableArray *)self->_constraints addObject:v14];
  [(NSMutableArray *)self->_constraints addObject:v15];
  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
}

- (void)setProviderIconSize:(CGSize)a3
{
  if (self->_providerIconSize.width != a3.width || self->_providerIconSize.height != a3.height)
  {
    self->_providerIconSize = a3;
    [(STSResultDetailFooter *)self setNeedsUpdateConstraints];
  }
}

- (UIImage)providerIcon
{
  return [(UIImageView *)self->_providerIconView image];
}

- (void)setProviderIcon:(id)a3
{
}

- (CGSize)providerIconSize
{
  double width = self->_providerIconSize.width;
  double height = self->_providerIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIButton)providerButton
{
  return self->_providerButton;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_providerButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_providerIconView, 0);
}

@end