@interface UISegmentedControlSpringLoadedEffect
- (UISegmentedControlSpringLoadedEffect)init;
- (UISpringLoadedInteractionEffect)blinkEffect;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setBlinkEffect:(id)a3;
@end

@implementation UISegmentedControlSpringLoadedEffect

- (UISegmentedControlSpringLoadedEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)UISegmentedControlSpringLoadedEffect;
  v2 = [(UISegmentedControlSpringLoadedEffect *)&v5 init];
  if (v2)
  {
    v3 = +[UISpringLoadedInteraction _blinkEffect];
    [(UISegmentedControlSpringLoadedEffect *)v2 setBlinkEffect:v3];
  }
  return v2;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v15 = [v7 view];
  v8 = [v6 targetItem];
  uint64_t v9 = [v8 integerValue];

  v10 = [v15 _segmentAtIndex:v9];
  [v6 setTargetView:v10];

  uint64_t v11 = [v6 state];
  v12 = [(UISegmentedControlSpringLoadedEffect *)self blinkEffect];
  [v12 interaction:v7 didChangeWithContext:v6];

  uint64_t v13 = -1;
  if (v11)
  {
    v14 = v15;
    if (v11 != 3)
    {
      if (v11 != 1) {
        goto LABEL_6;
      }
      uint64_t v13 = v9;
    }
  }
  [v15 _highlightSegment:v13];
  v14 = v15;
LABEL_6:
}

- (UISpringLoadedInteractionEffect)blinkEffect
{
  return self->_blinkEffect;
}

- (void)setBlinkEffect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end