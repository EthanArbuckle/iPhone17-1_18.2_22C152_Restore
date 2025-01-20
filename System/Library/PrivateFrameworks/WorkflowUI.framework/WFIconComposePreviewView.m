@interface WFIconComposePreviewView
- (CGSize)intrinsicContentSize;
- (WFIconComposePreviewView)initWithFrame:(CGRect)a3;
- (WFWorkflowIconDrawer)iconDrawer;
- (void)drawRect:(CGRect)a3;
- (void)setIcon:(id)a3;
- (void)setIconDrawer:(id)a3;
@end

@implementation WFIconComposePreviewView

- (void).cxx_destruct
{
}

- (void)setIconDrawer:(id)a3
{
}

- (WFWorkflowIconDrawer)iconDrawer
{
  return self->_iconDrawer;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 150.0;
  double v3 = 150.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  v5 = [(WFIconComposePreviewView *)self iconDrawer];
  [v5 setIcon:v4];

  [(WFIconComposePreviewView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)WFIconComposePreviewView;
  -[WFIconComposePreviewView drawRect:](&v15, sel_drawRect_);
  v8 = [(WFIconComposePreviewView *)self traitCollection];
  BOOL v9 = [v8 userInterfaceStyle] == 2;
  v10 = [(WFIconComposePreviewView *)self iconDrawer];
  [v10 setDark:v9];

  BOOL v11 = [v8 accessibilityContrast] == 1;
  v12 = [(WFIconComposePreviewView *)self iconDrawer];
  [v12 setHighContrast:v11];

  v13 = [(WFIconComposePreviewView *)self iconDrawer];
  v14 = [MEMORY[0x263F85188] currentContextWithScale:0.0];
  objc_msgSend(v13, "drawInContext:inRect:", v14, x, y, width, height);
}

- (WFIconComposePreviewView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFIconComposePreviewView;
  double v3 = -[WFIconComposePreviewView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(WFIconComposePreviewView *)v3 setContentMode:3];
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(WFIconComposePreviewView *)v4 setBackgroundColor:v5];

    uint64_t v6 = objc_opt_new();
    iconDrawer = v4->_iconDrawer;
    v4->_iconDrawer = (WFWorkflowIconDrawer *)v6;

    v8 = v4;
  }

  return v4;
}

@end