@interface _UITileLayer
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setNeedsDisplay;
@end

@implementation _UITileLayer

- (void)setNeedsDisplay
{
  atomic_store(0, (unsigned __int8 *)&self->pendingDeferredOffscreenSetNeedsDisplay);
  v2.receiver = self;
  v2.super_class = (Class)_UITileLayer;
  [(_UITileLayer *)&v2 setNeedsDisplay];
}

- (void)drawInContext:(CGContext *)a3
{
  id v7 = [(_UITileLayer *)self superlayer];
  [(_UITileLayer *)self frame];
  objc_msgSend(v7, "_drawInContext:offset:clip:", a3, -[UIBezierPath CGPath](self->maskPath, "CGPath"), v5, v6);
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end