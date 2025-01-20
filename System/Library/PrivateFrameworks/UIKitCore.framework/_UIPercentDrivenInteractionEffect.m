@interface _UIPercentDrivenInteractionEffect
- (_UIPercentDrivenInteractionEffect)initWithProgressBlock:(id)a3;
- (id)progressBlock;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setProgressBlock:(id)a3;
@end

@implementation _UIPercentDrivenInteractionEffect

- (_UIPercentDrivenInteractionEffect)initWithProgressBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPercentDrivenInteractionEffect;
  v5 = [(_UIPercentDrivenInteractionEffect *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIPercentDrivenInteractionEffect *)v5 setProgressBlock:v4];
  }

  return v6;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v5 = a4;
  v6 = [(_UIPercentDrivenInteractionEffect *)self progressBlock];
  v6[2](v6, v5);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end