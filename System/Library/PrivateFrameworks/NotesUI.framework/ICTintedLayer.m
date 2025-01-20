@interface ICTintedLayer
- (UIColor)tintColor;
- (id)originalContents;
- (void)setContents:(id)a3;
- (void)setOriginalContents:(id)a3;
- (void)setTintColor:(id)a3;
- (void)updateContents;
@end

@implementation ICTintedLayer

- (void)setContents:(id)a3
{
  id v5 = a3;
  if (self->_originalContents != v5) {
    objc_storeStrong(&self->_originalContents, a3);
  }
  [(ICTintedLayer *)self updateContents];
}

- (void)setTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_tintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    [(ICTintedLayer *)self updateContents];
  }
}

- (void)updateContents
{
  v3 = [(ICTintedLayer *)self tintColor];

  originalContents = (CGImage *)self->_originalContents;
  if (v3)
  {
    double Width = (double)CGImageGetWidth((CGImageRef)self->_originalContents);
    [(ICTintedLayer *)self contentsScale];
    double v7 = Width / v6;
    double Height = (double)CGImageGetHeight(originalContents);
    [(ICTintedLayer *)self contentsScale];
    double v10 = Height / v9;
    v11 = [MEMORY[0x1E4FB17E0] defaultFormat];
    [(ICTintedLayer *)self contentsScale];
    objc_msgSend(v11, "setScale:");
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v11, v7, v10);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __31__ICTintedLayer_updateContents__block_invoke;
    v16[3] = &unk_1E5FDD258;
    *(double *)&v16[5] = v7;
    *(double *)&v16[6] = v10;
    v16[7] = originalContents;
    v16[4] = self;
    v13 = [v12 imageWithActions:v16];
    v15.receiver = self;
    v15.super_class = (Class)ICTintedLayer;
    -[ICTintedLayer setContents:](&v15, sel_setContents_, objc_msgSend(v13, "ic_CGImage"));
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICTintedLayer;
    [(ICTintedLayer *)&v14 setContents:originalContents];
  }
}

void __31__ICTintedLayer_updateContents__block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGFloat v4 = *(double *)(a1 + 40);
  CGFloat v5 = *(double *)(a1 + 48);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v4;
  v12.size.height = v5;
  CGContextDrawImage(v3, v12, *(CGImageRef *)(a1 + 56));
  double v6 = [*(id *)(a1 + 32) tintColor];
  [v6 set];

  CGContextSetCompositeOperation();
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  CGFloat v9 = v4;
  CGFloat v10 = v5;
  CGContextFillRect(v3, *(CGRect *)&v7);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)originalContents
{
  return self->_originalContents;
}

- (void)setOriginalContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_originalContents, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end