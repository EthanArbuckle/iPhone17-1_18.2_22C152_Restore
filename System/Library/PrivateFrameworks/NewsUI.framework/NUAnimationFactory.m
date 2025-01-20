@interface NUAnimationFactory
- (CAMediaTimingFunction)mediaTimingFunction;
- (NUAnimationFactory)initWithMediaTimingFunction:(id)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
@end

@implementation NUAnimationFactory

- (NUAnimationFactory)initWithMediaTimingFunction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUAnimationFactory;
  v6 = [(NUAnimationFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaTimingFunction, a3);
  }

  return v7;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)[MEMORY[0x263F15760] animationWithKeyPath:a4];
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (void).cxx_destruct
{
}

@end