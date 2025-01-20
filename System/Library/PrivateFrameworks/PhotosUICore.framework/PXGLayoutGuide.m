@interface PXGLayoutGuide
- (CGRect)rectInLayout:(id)a3;
- (CGRect)referenceRect;
- (PXGLayout)referenceLayout;
- (void)performChanges:(id)a3;
- (void)setRect:(CGRect)a3 inLayout:(id)a4;
- (void)setReferenceLayout:(id)a3;
- (void)setReferenceRect:(CGRect)a3;
@end

@implementation PXGLayoutGuide

- (void).cxx_destruct
{
}

- (void)setReferenceLayout:(id)a3
{
}

- (PXGLayout)referenceLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceLayout);
  return (PXGLayout *)WeakRetained;
}

- (void)setReferenceRect:(CGRect)a3
{
  self->_referenceRect = a3;
}

- (CGRect)referenceRect
{
  double x = self->_referenceRect.origin.x;
  double y = self->_referenceRect.origin.y;
  double width = self->_referenceRect.size.width;
  double height = self->_referenceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3 inLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [(PXGLayoutGuide *)self rectInLayout:v9];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  -[PXGLayoutGuide setReferenceRect:](self, "setReferenceRect:", x, y, width, height);
  [(PXGLayoutGuide *)self setReferenceLayout:v9];

  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  v20.origin.double x = v11;
  v20.origin.double y = v13;
  v20.size.double width = v15;
  v20.size.double height = v17;
  if (!CGRectEqualToRect(v19, v20))
  {
    [(PXGLayoutGuide *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXGLayoutGuide;
  [(PXGLayoutGuide *)&v3 performChanges:a3];
}

- (CGRect)rectInLayout:(id)a3
{
  id v4 = a3;
  [(PXGLayoutGuide *)self referenceRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = [(PXGLayoutGuide *)self referenceLayout];
  if (v13)
  {
    objc_msgSend(v4, "convertRect:fromLayout:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB20];
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

@end