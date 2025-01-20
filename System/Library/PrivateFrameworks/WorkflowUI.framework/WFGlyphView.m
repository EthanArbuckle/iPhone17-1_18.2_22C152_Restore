@interface WFGlyphView
- (BOOL)outline;
- (UIColor)glyphColor;
- (UIEdgeInsets)glyphInsets;
- (WFGlyphView)initWithFrame:(CGRect)a3;
- (WFWorkflowIconDrawer)iconDrawer;
- (unsigned)glyphCharacter;
- (void)drawRect:(CGRect)a3;
- (void)setGlyphCharacter:(unsigned __int16)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphInsets:(UIEdgeInsets)a3;
- (void)setOutline:(BOOL)a3;
@end

@implementation WFGlyphView

- (void).cxx_destruct
{
}

- (WFWorkflowIconDrawer)iconDrawer
{
  return self->_iconDrawer;
}

- (void)setGlyphInsets:(UIEdgeInsets)a3
{
  self->_glyphInsets = a3;
}

- (UIEdgeInsets)glyphInsets
{
  double top = self->_glyphInsets.top;
  double left = self->_glyphInsets.left;
  double bottom = self->_glyphInsets.bottom;
  double right = self->_glyphInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGlyphColor:(id)a3
{
  id v8 = a3;
  v4 = [(WFGlyphView *)self glyphColor];
  char v5 = [v4 isEqual:v8];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F851A8]) initWithPlatformColor:v8];
    v7 = [(WFGlyphView *)self iconDrawer];
    [v7 setGlyphColor:v6];

    [(WFGlyphView *)self setNeedsDisplay];
  }
}

- (UIColor)glyphColor
{
  v2 = [(WFGlyphView *)self iconDrawer];
  v3 = [v2 glyphColor];
  v4 = [v3 UIColor];

  return (UIColor *)v4;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ([(WFGlyphView *)self glyphCharacter] != a3)
  {
    char v5 = [(WFGlyphView *)self iconDrawer];
    [v5 setGlyphCharacter:v3];

    [(WFGlyphView *)self setNeedsDisplay];
  }
}

- (unsigned)glyphCharacter
{
  v2 = [(WFGlyphView *)self iconDrawer];
  unsigned __int16 v3 = [v2 glyphCharacter];

  return v3;
}

- (void)setOutline:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFGlyphView *)self iconDrawer];
  [v4 setOutline:v3];
}

- (BOOL)outline
{
  v2 = [(WFGlyphView *)self iconDrawer];
  char v3 = [v2 outline];

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)WFGlyphView;
  -[WFGlyphView drawRect:](&v19, sel_drawRect_);
  id v8 = [(WFGlyphView *)self traitCollection];
  BOOL v9 = [v8 userInterfaceStyle] == 2;
  v10 = [(WFGlyphView *)self iconDrawer];
  [v10 setDark:v9];

  BOOL v11 = [v8 accessibilityContrast] == 1;
  v12 = [(WFGlyphView *)self iconDrawer];
  [v12 setHighContrast:v11];

  v13 = [(WFGlyphView *)self iconDrawer];
  v14 = [MEMORY[0x263F85188] currentContextWithScale:0.0];
  [(WFGlyphView *)self glyphInsets];
  objc_msgSend(v13, "drawInContext:inRect:", v14, x + v18, y + v15, width - (v18 + v16), height - (v15 + v17));
}

- (WFGlyphView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFGlyphView;
  char v3 = -[WFGlyphView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F825C8] clearColor];
    [(WFGlyphView *)v3 setBackgroundColor:v4];

    -[WFGlyphView setGlyphInsets:](v3, "setGlyphInsets:", 5.0, 5.0, 5.0, 5.0);
    [(WFGlyphView *)v3 setContentMode:3];
    uint64_t v5 = objc_opt_new();
    iconDrawer = v3->_iconDrawer;
    v3->_iconDrawer = (WFWorkflowIconDrawer *)v5;

    [(WFWorkflowIconDrawer *)v3->_iconDrawer setDrawBackground:0];
    v7 = v3;
  }

  return v3;
}

@end