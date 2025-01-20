@interface UIPrintSupplyLevelView
- (BOOL)supplyLevelShowWarning;
- (PKSupply)supplyInfo;
- (UIPrintSupplyLevelView)initWithFrame:(CGRect)a3 supplyInfo:(id)a4;
- (UIView)lowSupplyImageView;
- (void)drawRect:(CGRect)a3;
- (void)setLowSupplyImageView:(id)a3;
- (void)setSupplyInfo:(id)a3;
@end

@implementation UIPrintSupplyLevelView

- (UIPrintSupplyLevelView)initWithFrame:(CGRect)a3 supplyInfo:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)UIPrintSupplyLevelView;
  v10 = -[UIPrintSupplyLevelView initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIPrintSupplyLevelView *)v10 setSupplyInfo:v9];
    [(UIPrintSupplyLevelView *)v11 setOpaque:0];
    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
    v14 = (void *)[v12 initWithImage:v13];
    [(UIPrintSupplyLevelView *)v11 setLowSupplyImageView:v14];

    v15 = [MEMORY[0x1E4FB1618] systemYellowColor];
    v16 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    [v16 setTintColor:v15];

    v17 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    [v17 frame];
    double v19 = (height - v18) * 0.5;
    v20 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    [v20 frame];
    double v22 = v21;
    v23 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    [v23 frame];
    double v25 = v24;
    v26 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    objc_msgSend(v26, "setFrame:", 0.0, v19, v22, v25);

    uint64_t v27 = [(UIPrintSupplyLevelView *)v11 supplyLevelShowWarning] ^ 1;
    v28 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    [v28 setHidden:v27];

    v29 = [(UIPrintSupplyLevelView *)v11 lowSupplyImageView];
    [(UIPrintSupplyLevelView *)v11 addSubview:v29];
  }
  return v11;
}

- (BOOL)supplyLevelShowWarning
{
  v3 = [(UIPrintSupplyLevelView *)self supplyInfo];
  uint64_t v4 = [v3 supplyType];

  v5 = [(UIPrintSupplyLevelView *)self supplyInfo];
  int v6 = [v5 level];
  v7 = [(UIPrintSupplyLevelView *)self supplyInfo];
  v8 = v7;
  if (v4 == 3) {
    BOOL v9 = v6 <= (int)[v7 lowLevel];
  }
  else {
    BOOL v9 = v6 >= (int)[v7 highLevel];
  }

  return v9;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGBlendMode BlendMode = CGContextGetBlendMode();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  [(UIPrintSupplyLevelView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(UIPrintSupplyLevelView *)self lowSupplyImageView];
  [v14 frame];
  double v16 = v15 + 8.0;

  double v17 = v7 + v16;
  double v18 = v11 - v16;
  double v19 = (void *)MEMORY[0x1E4FB14C0];
  v43.origin.double x = v17;
  v43.origin.double y = v9;
  v43.size.double width = v18;
  v43.size.double height = v13;
  CGRect v44 = CGRectInset(v43, 0.25, 0.25);
  v20 = objc_msgSend(v19, "bezierPathWithRoundedRect:cornerRadius:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height, 3.0);
  [v20 addClip];
  double v21 = [MEMORY[0x1E4FB1618] whiteColor];
  [v21 set];

  [v20 fill];
  double v22 = [(UIPrintSupplyLevelView *)self supplyInfo];
  int v23 = [v22 level];

  if (v23 >= 1)
  {
    double v24 = [(UIPrintSupplyLevelView *)self supplyInfo];
    double v25 = [v24 colors];

    v26 = [(UIPrintSupplyLevelView *)self supplyInfo];
    double v27 = v18 * ((double)(int)[v26 level] / 100.0);

    if ([v25 count] == 1)
    {
      v28 = [v25 objectAtIndex:0];
      [v28 set];

      v45.origin.double x = v17;
      v45.origin.double y = v9;
      v45.size.double width = v27;
      v45.size.double height = v13;
      UIRectFill(v45);
    }
    else
    {
      unint64_t v29 = [v25 count];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v30 = v25;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        double v33 = v13 / (double)v29;
        uint64_t v34 = *(void *)v38;
        do
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v38 != v34) {
              objc_enumerationMutation(v30);
            }
            objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v35), "set", (void)v37);
            v46.origin.double x = v17;
            v46.origin.double y = v9;
            v46.size.double width = v27;
            v46.size.double height = v33;
            UIRectFill(v46);
            double v9 = v33 + v9;
            ++v35;
          }
          while (v32 != v35);
          uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v32);
      }
    }
  }
  v36 = objc_msgSend(MEMORY[0x1E4FB1618], "secondaryLabelColor", (void)v37);
  [v36 set];

  [v20 setLineWidth:0.5];
  [v20 stroke];
  CGContextSetBlendMode(CurrentContext, BlendMode);
}

- (PKSupply)supplyInfo
{
  return self->_supplyInfo;
}

- (void)setSupplyInfo:(id)a3
{
}

- (UIView)lowSupplyImageView
{
  return self->_lowSupplyImageView;
}

- (void)setLowSupplyImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowSupplyImageView, 0);
  objc_storeStrong((id *)&self->_supplyInfo, 0);
}

@end