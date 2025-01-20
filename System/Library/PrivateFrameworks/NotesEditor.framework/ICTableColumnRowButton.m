@interface ICTableColumnRowButton
- (BOOL)isColumn;
- (BOOL)isLTR;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)touchRect;
- (ICTableColumnRowButton)initWithCoder:(id)a3;
- (ICTableColumnRowButton)initWithFrame:(CGRect)a3;
- (NSArray)columnOrRowIdentifiers;
- (id)accessibilityContainer;
- (id)initAsColumn:(BOOL)a3 isLeftToRight:(BOOL)a4;
- (void)dealloc;
- (void)setColumnOrRowIdentifiers:(id)a3;
- (void)updateConfiguration;
@end

@implementation ICTableColumnRowButton

- (ICTableColumnRowButton)initWithCoder:(id)a3
{
  return (ICTableColumnRowButton *)[(ICTableColumnRowButton *)self initAsColumn:0 isLeftToRight:1];
}

- (ICTableColumnRowButton)initWithFrame:(CGRect)a3
{
  return (ICTableColumnRowButton *)-[ICTableColumnRowButton initAsColumn:isLeftToRight:](self, "initAsColumn:isLeftToRight:", 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)initAsColumn:(BOOL)a3 isLeftToRight:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ICTableColumnRowButton;
  v6 = -[ICTableColumnRowButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_isColumn = a3;
    v6->_isLTR = a4;
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_accessibilityDarkerSystemColorsStatusDidChange_ name:*MEMORY[0x263F831A0] object:0];

    [(ICTableColumnRowButton *)v7 updateConfiguration];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICTableColumnRowButton;
  [(ICTableColumnRowButton *)&v4 dealloc];
}

- (void)updateConfiguration
{
  id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = (void *)MEMORY[0x263F82818];
  objc_super v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v5 = [v3 configurationWithFont:v4 scale:3];

  v6 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  if ([(ICTableColumnRowButton *)self isSelected])
  {
    [v6 setBaseBackgroundColor:0];
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      [MEMORY[0x263F825C8] ICDarkenedTintColor];
    }
    else {
    v7 = [MEMORY[0x263F825C8] ICTintColor];
    }
    [v6 setBaseBackgroundColor:v7];
  }
  if ([(ICTableColumnRowButton *)self isSelected]) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  v8 = [MEMORY[0x263F825C8] systemGrayColor];
  }
  [v6 setBaseForegroundColor:v8];

  v9 = [MEMORY[0x263F825C8] clearColor];
  objc_super v10 = [v6 background];
  [v10 setBackgroundColor:v9];

  v11 = [v6 background];
  [v11 setCornerRadius:0.0];

  if ([(ICTableColumnRowButton *)self isSelected])
  {
    BOOL v12 = [(ICTableColumnRowButton *)self isColumn];
    if (v12) {
      v13 = @"attachment_table_column_header";
    }
    else {
      v13 = @"attachment_table_row_header";
    }
    v15 = [MEMORY[0x263F827E8] imageNamed:v13 inBundle:v19 withConfiguration:0];
    int v14 = !v12;
  }
  else
  {
    BOOL v12 = 0;
    int v14 = 0;
    v15 = 0;
  }
  v16 = [v6 background];
  [v16 setImage:v15];

  if (v14) {
  if (v12)
  }

  [v6 setCornerStyle:-1];
  if ([(ICTableColumnRowButton *)self isColumn]) {
    [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis" withConfiguration:v5];
  }
  else {
  v17 = [MEMORY[0x263F827E8] imageNamed:@"ellipsis.vertical" inBundle:v19 withConfiguration:v5];
  }
  [v6 setImage:v17];

  v18 = [v6 updatedConfigurationForButton:self];
  [(ICTableColumnRowButton *)self setConfiguration:v18];

  [(ICTableColumnRowButton *)self setPointerInteractionEnabled:[(ICTableColumnRowButton *)self isSelected] ^ 1];
  [(ICTableColumnRowButton *)self setPointerStyleProvider:&__block_literal_global_8];
}

id __45__ICTableColumnRowButton_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F82CC8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 imageView];
  v6 = (void *)[v4 initWithView:v5];

  v7 = [MEMORY[0x263F82A60] effectWithPreview:v6];
  v8 = [v3 imageView];

  [v8 frame];
  CGRect v18 = CGRectInset(v17, -4.0, -4.0);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;

  v13 = objc_msgSend(MEMORY[0x263F82A88], "shapeWithRoundedRect:", x, y, width, height);
  int v14 = [MEMORY[0x263F82A90] styleWithEffect:v7 shape:v13];

  return v14;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(ICTableColumnRowButton *)self touchRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)touchRect
{
  [(ICTableColumnRowButton *)self bounds];
  CGFloat MidX = CGRectGetMidX(v16);
  [(ICTableColumnRowButton *)self bounds];
  v18.origin.CGFloat y = CGRectGetMidY(v17);
  v18.size.CGFloat width = 0.0;
  v18.size.CGFloat height = 0.0;
  v18.origin.CGFloat x = MidX;
  CGRect v19 = CGRectInset(v18, -16.0, -16.0);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if ([(ICTableColumnRowButton *)self isSelected])
  {
    [(ICTableColumnRowButton *)self bounds];
    v23.origin.CGFloat x = v8;
    v23.origin.CGFloat y = v9;
    v23.size.CGFloat width = v10;
    v23.size.CGFloat height = v11;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectUnion(v20, v23);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)accessibilityContainer
{
  v7.receiver = self;
  v7.super_class = (Class)ICTableColumnRowButton;
  id v2 = [(ICTableColumnRowButton *)&v7 accessibilityContainer];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    while (![v4 conformsToProtocol:&unk_26C1E88C8])
    {
      uint64_t v5 = [v4 accessibilityContainer];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    id v4 = v4;

    id v3 = v4;
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:

  return v3;
}

- (NSArray)columnOrRowIdentifiers
{
  return self->_columnOrRowIdentifiers;
}

- (void)setColumnOrRowIdentifiers:(id)a3
{
}

- (BOOL)isColumn
{
  return self->_isColumn;
}

- (BOOL)isLTR
{
  return self->_isLTR;
}

- (void).cxx_destruct
{
}

@end