@interface WFAlertPresentationSource
+ (id)sourceWithBarButtonItem:(id)a3;
+ (id)sourceWithView:(id)a3;
+ (id)sourceWithView:(id)a3 rect:(CGRect)a4;
- (BOOL)canOverlapSourceViewRect;
- (CGRect)sourceRect;
- (UIBarButtonItem)barButtonItem;
- (UIView)sourceView;
- (WFAlertPresentationSource)init;
- (WFAlertPresentationSource)initWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5;
- (unint64_t)permittedArrowDirections;
- (void)setCanOverlapSourceViewRect:(BOOL)a3;
- (void)setPermittedArrowDirections:(unint64_t)a3;
@end

@implementation WFAlertPresentationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

- (void)setCanOverlapSourceViewRect:(BOOL)a3
{
  self->_canOverlapSourceViewRect = a3;
}

- (BOOL)canOverlapSourceViewRect
{
  return self->_canOverlapSourceViewRect;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (WFAlertPresentationSource)initWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFAlertPresentationSource;
  v14 = [(WFAlertPresentationSource *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceView, a3);
    v15->_sourceRect.origin.CGFloat x = x;
    v15->_sourceRect.origin.CGFloat y = y;
    v15->_sourceRect.size.CGFloat width = width;
    v15->_sourceRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v15->_barButtonItem, a5);
    v15->_permittedArrowDirections = 15;
    v16 = v15;
  }

  return v15;
}

- (WFAlertPresentationSource)init
{
  return -[WFAlertPresentationSource initWithSourceView:sourceRect:barButtonItem:](self, "initWithSourceView:sourceRect:barButtonItem:", 0, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

+ (id)sourceWithBarButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "initWithSourceView:sourceRect:barButtonItem:", 0, v4, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));

  return v6;
}

+ (id)sourceWithView:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithSourceView:sourceRect:barButtonItem:", v9, 0, x, y, width, height);

  return v10;
}

+ (id)sourceWithView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  if (v4)
  {
    [v4 bounds];
  }
  else
  {
    double v6 = *MEMORY[0x263F001A0];
    double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  v10 = objc_msgSend(v5, "initWithSourceView:sourceRect:barButtonItem:", v4, 0, v6, v7, v8, v9);

  return v10;
}

@end