@interface TCVegaCGCanvas
- (TCVegaCGCanvas)init;
- (TCVegaCGContext)context;
- (double)height;
- (double)width;
- (void)setContext:(id)a3;
- (void)setHeight:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation TCVegaCGCanvas

- (TCVegaCGCanvas)init
{
  v5.receiver = self;
  v5.super_class = (Class)TCVegaCGCanvas;
  v2 = [(TCVegaHTMLElement *)&v5 initWithTagName:@"canvas"];
  if (v2)
  {
    v3 = objc_alloc_init(TCVegaCGContext);
    [(TCVegaCGCanvas *)v2 setContext:v3];
  }
  return v2;
}

- (double)height
{
  v2 = [(TCVegaCGCanvas *)self context];
  [v2 height];
  double v4 = v3;

  return v4;
}

- (void)setHeight:(double)a3
{
  id v4 = [(TCVegaCGCanvas *)self context];
  [v4 setHeight:a3];
}

- (double)width
{
  v2 = [(TCVegaCGCanvas *)self context];
  [v2 width];
  double v4 = v3;

  return v4;
}

- (void)setWidth:(double)a3
{
  id v4 = [(TCVegaCGCanvas *)self context];
  [v4 setWidth:a3];
}

- (TCVegaCGContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end