@interface THWPageIndicator
- (CALayer)layer;
- (THWPageIndicator)initWithLayer:(id)a3;
- (void)dealloc;
- (void)setLayer:(id)a3;
@end

@implementation THWPageIndicator

- (THWPageIndicator)initWithLayer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWPageIndicator;
  v4 = [(THWPageIndicator *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THWPageIndicator *)v4 setLayer:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(THWPageIndicator *)self setLayer:0];
  v3.receiver = self;
  v3.super_class = (Class)THWPageIndicator;
  [(THWPageIndicator *)&v3 dealloc];
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

@end