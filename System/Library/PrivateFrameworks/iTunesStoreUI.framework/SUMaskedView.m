@interface SUMaskedView
- (CGPath)copyMaskPath;
- (SUMaskProvider)maskProvider;
- (void)_reloadMask;
- (void)dealloc;
- (void)setFrame:(CGRect)a3;
- (void)setMaskProvider:(id)a3;
@end

@implementation SUMaskedView

- (void)dealloc
{
  self->_maskProvider = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUMaskedView;
  [(SUMaskedView *)&v3 dealloc];
}

- (CGPath)copyMaskPath
{
  [(SUMaskedView *)self frame];
  if (v4 <= 0.00000011920929 || v3 <= 0.00000011920929) {
    return 0;
  }
  result = -[SUMaskProvider copyPathForMaskWithSize:](self->_maskProvider, "copyPathForMaskWithSize:", v3, v4);
  if (!result)
  {
    Mutable = CGPathCreateMutable();
    [(SUMaskedView *)self bounds];
    CGPathAddRect(Mutable, 0, v9);
    v8 = (CGPath *)MEMORY[0x22A67FD00](Mutable);
    CGPathRelease(Mutable);
    return v8;
  }
  return result;
}

- (void)setMaskProvider:(id)a3
{
  maskProvider = self->_maskProvider;
  if (maskProvider != a3)
  {

    self->_maskProvider = (SUMaskProvider *)a3;
    [(SUMaskedView *)self _reloadMask];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUMaskedView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SUMaskedView;
  -[SUMaskedView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(SUMaskedView *)self _reloadMask];
  }
}

- (void)_reloadMask
{
  [(SUMaskedView *)self frame];
  maskProvider = self->_maskProvider;
  if (maskProvider) {
    BOOL v6 = v4 <= 0.00000011920929;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && v3 > 0.00000011920929)
  {
    id v12 = -[SUMaskProvider copyMaskImageWithSize:](maskProvider, "copyMaskImageWithSize:", v3, v4);
    double v8 = (void *)[(SUMaskedView *)self layer];
    uint64_t v9 = [v8 mask];
    id v10 = (id)v9;
    if (!v9 && v12)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F157E8]);
      [v8 setMask:v10];
    }
    objc_msgSend(v10, "setContents:", objc_msgSend(v12, "CGImage"));
    double v11 = v12;
    if (!v12) {
      double v11 = (void *)[MEMORY[0x263F1C920] mainScreen];
    }
    [v11 scale];
    objc_msgSend(v10, "setContentsScale:");
    [v8 bounds];
    objc_msgSend(v10, "setFrame:");
  }
}

- (SUMaskProvider)maskProvider
{
  return self->_maskProvider;
}

@end