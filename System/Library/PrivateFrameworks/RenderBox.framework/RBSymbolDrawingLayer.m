@interface RBSymbolDrawingLayer
- (void)drawInContext:(CGContext *)a3;
@end

@implementation RBSymbolDrawingLayer

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4 = [(RBSymbolDrawingLayer *)self delegate];
  if (v4)
  {
    [(RBSymbolLayer *)v4 drawingContents];
    id v5 = v6;
    [v6 renderInContext:a3 options:0];
  }
}

@end