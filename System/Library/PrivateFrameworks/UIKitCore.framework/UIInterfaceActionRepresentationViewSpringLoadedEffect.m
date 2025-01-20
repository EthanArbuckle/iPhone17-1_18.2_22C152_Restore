@interface UIInterfaceActionRepresentationViewSpringLoadedEffect
- (UIInterfaceActionRepresentationViewSpringLoadedEffect)init;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
@end

@implementation UIInterfaceActionRepresentationViewSpringLoadedEffect

- (UIInterfaceActionRepresentationViewSpringLoadedEffect)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionRepresentationViewSpringLoadedEffect;
  v2 = [(UIInterfaceActionRepresentationViewSpringLoadedEffect *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[UISpringLoadedInteraction _blinkEffect];
    blinkEffect = v2->_blinkEffect;
    v2->_blinkEffect = (UISpringLoadedInteractionEffect *)v3;
  }
  return v2;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 view];
  uint64_t v8 = [v6 state];
  [(UISpringLoadedInteractionEffect *)self->_blinkEffect interaction:v7 didChangeWithContext:v6];

  if (v8)
  {
    if (v8 != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v10 setHighlighted:v9];
LABEL_6:
}

- (void).cxx_destruct
{
}

@end