@interface SUSSoftwareUpdateAnimatedIcon
- (SUSSoftwareUpdateAnimatedIcon)initWithFrame:(CGRect)a3;
- (UIImageView)innerGearView;
- (UIImageView)outerGearShadowView;
- (UIImageView)outerGearView;
- (void)createConstraints;
- (void)setAnimating:(BOOL)a3;
@end

@implementation SUSSoftwareUpdateAnimatedIcon

- (SUSSoftwareUpdateAnimatedIcon)initWithFrame:(CGRect)a3
{
  CGRect v14 = a3;
  SEL v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)SUSSoftwareUpdateAnimatedIcon;
  v13 = -[SUSSoftwareUpdateAnimatedIcon initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v3 = [(SUSSoftwareUpdateAnimatedIcon *)v13 innerGearView];
    innerGearView = v13->_innerGearView;
    v13->_innerGearView = v3;

    [(UIImageView *)v13->_innerGearView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SUSSoftwareUpdateAnimatedIcon *)v13 addSubview:v13->_innerGearView];
    v5 = [(SUSSoftwareUpdateAnimatedIcon *)v13 outerGearShadowView];
    outerGearShadowView = v13->_outerGearShadowView;
    v13->_outerGearShadowView = v5;

    [(UIImageView *)v13->_outerGearShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SUSSoftwareUpdateAnimatedIcon *)v13 addSubview:v13->_outerGearShadowView];
    v7 = [(SUSSoftwareUpdateAnimatedIcon *)v13 outerGearView];
    outerGearView = v13->_outerGearView;
    v13->_outerGearView = v7;

    [(UIImageView *)v13->_outerGearView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SUSSoftwareUpdateAnimatedIcon *)v13 addSubview:v13->_outerGearView];
    [(SUSSoftwareUpdateAnimatedIcon *)v13 createConstraints];
  }
  v10 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (void)createConstraints
{
  id v5 = (id)[(UIImageView *)self->_innerGearView centerXAnchor];
  id v4 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self centerXAnchor];
  id v3 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  [v3 setActive:1];

  id v8 = (id)[(UIImageView *)self->_innerGearView centerYAnchor];
  id v7 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self centerYAnchor];
  id v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
  [v6 setActive:1];

  id v11 = (id)[(UIImageView *)self->_outerGearView centerXAnchor];
  id v10 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self centerXAnchor];
  id v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  [v9 setActive:1];

  id v14 = (id)[(UIImageView *)self->_outerGearView centerYAnchor];
  id v13 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self centerYAnchor];
  id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  [v12 setActive:1];

  id v15 = (id)[MEMORY[0x263F82B60] mainScreen];
  [v15 scale];
  double v16 = 1.0 / v2;

  id v19 = (id)[(UIImageView *)self->_outerGearShadowView centerXAnchor];
  id v18 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self centerXAnchor];
  id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  [v17 setActive:1];

  id v22 = (id)[(UIImageView *)self->_outerGearShadowView centerYAnchor];
  id v21 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self centerYAnchor];
  id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", v16);
  [v20 setActive:1];
}

- (UIImageView)innerGearView
{
  v8[2] = self;
  v8[1] = (id)a2;
  id v4 = objc_alloc(MEMORY[0x263F82828]);
  id v3 = (void *)MEMORY[0x263F827E8];
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"PreferencesIconInnerGear");
  v8[0] = (id)objc_msgSend(v4, "initWithImage:");

  [v8[0] setOpaque:1];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return (UIImageView *)v7;
}

- (UIImageView)outerGearShadowView
{
  id v4 = objc_alloc(MEMORY[0x263F82828]);
  id v3 = (void *)MEMORY[0x263F827E8];
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"PreferencesIconOuterGearShadow");
  id v7 = objc_msgSend(v4, "initWithImage:");

  return (UIImageView *)v7;
}

- (UIImageView)outerGearView
{
  id v4 = objc_alloc(MEMORY[0x263F82828]);
  id v3 = (void *)MEMORY[0x263F827E8];
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"PreferencesIconOuterGear");
  id v7 = objc_msgSend(v4, "initWithImage:");

  return (UIImageView *)v7;
}

- (void)setAnimating:(BOOL)a3
{
  id v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  if (a3 != self->_animating)
  {
    v20->_animating = v18;
    if (v18)
    {
      id v17 = (id)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation"];
      id v8 = v17;
      LODWORD(v3) = 1086918619;
      id v9 = (id)[NSNumber numberWithFloat:v3];
      objc_msgSend(v8, "setByValue:");

      [v17 setFillMode:*MEMORY[0x263F15AB0]];
      [v17 setRemovedOnCompletion:0];
      [v17 setDuration:10.0];
      [v17 setRepeatDuration:INFINITY];
      id v10 = v17;
      id v11 = (id)[MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
      objc_msgSend(v10, "setTimingFunction:");

      id v12 = (id)[(UIImageView *)v20->_outerGearView layer];
      [v12 addAnimation:v17 forKey:@"outerRotation"];

      id v13 = (id)[(UIImageView *)v20->_outerGearShadowView layer];
      [v13 addAnimation:v17 forKey:@"shadowRotation"];

      id v14 = v17;
      LODWORD(v4) = -1060565029;
      id v15 = (id)[NSNumber numberWithFloat:v4];
      objc_msgSend(v14, "setByValue:");

      id v16 = (id)[(UIImageView *)v20->_innerGearView layer];
      [v16 addAnimation:v17 forKey:@"innerRotation"];

      objc_storeStrong(&v17, 0);
    }
    else
    {
      id v5 = (id)[(UIImageView *)v20->_innerGearView layer];
      [v5 removeAllAnimations];

      id v6 = (id)[(UIImageView *)v20->_outerGearShadowView layer];
      [v6 removeAllAnimations];

      id v7 = (id)[(UIImageView *)v20->_outerGearView layer];
      [v7 removeAllAnimations];
    }
  }
}

- (void).cxx_destruct
{
}

@end