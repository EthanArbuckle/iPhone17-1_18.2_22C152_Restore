@interface SUCanvasMaskProvider
- (CGPath)copyPathForMaskWithSize:(CGSize)a3;
- (SUCanvasMaskProvider)initWithFunction:(id)a3;
- (id)copyMaskImageWithSize:(CGSize)a3;
- (void)dealloc;
@end

@implementation SUCanvasMaskProvider

- (SUCanvasMaskProvider)initWithFunction:(id)a3
{
  v4 = [(SUCanvasMaskProvider *)self init];
  if (v4) {
    v4->_function = (SUScriptCanvasFunction *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_function = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUCanvasMaskProvider;
  [(SUCanvasMaskProvider *)&v3 dealloc];
}

- (id)copyMaskImageWithSize:(CGSize)a3
{
  id v3 = -[SUScriptCanvasFunction copyResultForSize:](self->_function, "copyResultForSize:", a3.width, a3.height);
  id v4 = (id)[v3 canvasImage];

  return v4;
}

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  id v3 = -[SUScriptCanvasFunction copyResultForSize:](self->_function, "copyResultForSize:", a3.width, a3.height);
  id v4 = (const CGPath *)[v3 canvasPath];
  v5 = v4;
  if (v4) {
    CGPathRetain(v4);
  }

  return v5;
}

@end