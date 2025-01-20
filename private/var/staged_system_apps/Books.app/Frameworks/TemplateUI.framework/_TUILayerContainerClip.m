@interface _TUILayerContainerClip
- (CALayer)layer;
- (_TUILayerContainerClip)initWithLayer:(id)a3;
- (unint64_t)count;
- (void)addAnimation:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation _TUILayerContainerClip

- (_TUILayerContainerClip)initWithLayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUILayerContainerClip;
  v6 = [(_TUILayerContainerClip *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layer, a3);
  }

  return v7;
}

- (void)addAnimation:(id)a3
{
  [a3 setDelegate:self];
  unint64_t count = self->_count;
  if (!count)
  {
    [(CALayer *)self->_layer setMasksToBounds:1];
    unint64_t count = self->_count;
  }
  self->_unint64_t count = count + 1;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  unint64_t count = self->_count;
  if (count)
  {
    unint64_t v7 = count - 1;
    self->_unint64_t count = v7;
    if (!v7)
    {
      id v8 = v5;
      [(CALayer *)self->_layer setMasksToBounds:0];
      id v5 = v8;
    }
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
}

@end