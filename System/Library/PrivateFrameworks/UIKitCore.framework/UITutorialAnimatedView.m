@interface UITutorialAnimatedView
- (CAPackage)package;
- (UITutorialAnimatedView)initWithKeyboardAppearance:(int64_t)a3;
- (int64_t)appearance;
- (void)_setPackage:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setPackage:(id)a3;
@end

@implementation UITutorialAnimatedView

- (UITutorialAnimatedView)initWithKeyboardAppearance:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UITutorialAnimatedView;
  v4 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    [(UIView *)v4 setUserInteractionEnabled:0];
    v6 = +[UIColor clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    v5->_appearance = a3;
  }
  return v5;
}

- (void)setPackage:(id)a3
{
  v5 = (CAPackage *)a3;
  if (self->_package != v5)
  {
    objc_storeStrong((id *)&self->_package, a3);
    [(UITutorialAnimatedView *)self _setPackage:v5];
  }
}

- (void)_setPackage:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CALayer *)self->_packageLayer removeFromSuperlayer];
  v5 = [v4 rootLayer];
  v34 = v4;
  -[CALayer setGeometryFlipped:](v5, "setGeometryFlipped:", [v4 isGeometryFlipped]);
  [(CALayer *)v5 setContentsGravity:*MEMORY[0x1E4F3A3D8]];
  [(CALayer *)v5 setMasksToBounds:1];
  v6 = [(UIView *)self layer];
  [v6 addSublayer:v5];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v33 = v5;
  v7 = [(CALayer *)v5 sublayers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    double v11 = *(double *)off_1E52D6C00;
    uint64_t v39 = *(void *)off_1E52D2040;
    uint64_t v37 = *MEMORY[0x1E4F3A3C0];
    v38 = v7;
    v35 = self;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [v13 string];
          v15 = v14;
          if (v14)
          {
            v16 = _UILocalizedStringInSystemLanguage(v14, v14);
            v17 = [v16 localizedUppercaseString];

            v18 = [off_1E52D39B8 systemFontOfSize:34.0 weight:v11];
            uint64_t v44 = v39;
            v45 = v18;
            v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            [v17 sizeWithAttributes:v19];
            double v21 = v20;
            [v13 setFont:v18];
            if ([(UITutorialAnimatedView *)self appearance] != 1)
            {
              id v22 = +[UIColor systemDarkGrayColor];
              objc_msgSend(v13, "setForegroundColor:", objc_msgSend(v22, "CGColor"));

              v7 = v38;
            }
            if (v21 > 150.0
              && [v15 isEqualToString:@"Undo"]
              && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
            {
              [v13 setString:&stru_1ED0E84C0];
              if ([(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft) {
                v23 = @"kb-undoHUD-redo";
              }
              else {
                v23 = @"kb-undoHUD-undo";
              }
              v24 = +[UIImage _systemImageNamed:v23 fallback:v23];
              v25 = [v24 imageWithRenderingMode:2];

              id v36 = v25;
              uint64_t v26 = [v36 CGImage];
              v27 = [MEMORY[0x1E4F39BE8] layer];
              [v27 setContents:v26];
              [v27 setContentsGravity:v37];
              [v13 bounds];
              double v29 = v28;
              [v13 bounds];
              objc_msgSend(v27, "setFrame:", 0.0, 0.0, v29);
              id v30 = +[UIColor labelColor];
              objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

              self = v35;
              [v13 setMask:v27];
              [v13 setContentsGravity:v37];

              v7 = v38;
            }
            else
            {
              [v13 setString:v17];
            }
          }
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v31 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      uint64_t v9 = v31;
    }
    while (v31);
  }

  packageLayer = self->_packageLayer;
  self->_packageLayer = v33;
}

- (void)drawRect:(CGRect)a3
{
  double width = a3.size.width;
  -[CALayer setPosition:](self->_packageLayer, "setPosition:", a3.origin.x + a3.size.width * 0.5, a3.origin.y + a3.size.height * 0.5);
  [(CALayer *)self->_packageLayer size];
  double v6 = v5;
  packageLayer = self->_packageLayer;
  if (packageLayer) {
    [(CALayer *)packageLayer contentsTransform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransformScale(&v9, &v8, width / v6, width / v6);
  [(CALayer *)packageLayer setAffineTransform:&v9];
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (CAPackage)package
{
  return self->_package;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
}

@end