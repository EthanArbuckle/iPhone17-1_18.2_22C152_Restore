@interface UIInputViewAnimationStyleDirectional
+ (id)animationStyleAnimated:(BOOL)a3 duration:(double)a4 outDirection:(int)a5;
- (BOOL)canDismissWithScrollView;
- (BOOL)isEqual:(id)a3;
- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4;
- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4 windowScene:(id)a5;
- (int)outDirection;
- (void)setOutDirection:(int)a3;
@end

@implementation UIInputViewAnimationStyleDirectional

- (void)setOutDirection:(int)a3
{
  self->_outDirection = a3;
}

+ (id)animationStyleAnimated:(BOOL)a3 duration:(double)a4 outDirection:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___UIInputViewAnimationStyleDirectional;
  v6 = objc_msgSendSuper2(&v8, sel_animationStyleAnimated_duration_, a3, a4);
  [v6 setOutDirection:v5];
  return v6;
}

- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4 windowScene:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIInputViewAnimationStyleDirectional;
  v9 = [(UIInputViewAnimationStyle *)&v13 startPlacementForInputViewSet:a3 currentPlacement:v8 windowScene:a5];
  if ([v9 isMemberOfClass:objc_opt_class()])
  {
    [(UIInputViewAnimationStyleDirectional *)self outDirection];
    id v10 = [(id)objc_opt_class() placement];
  }
  else
  {
    id v10 = v9;
  }
  v11 = v10;

  return v11;
}

- (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewAnimationStyleDirectional;
  uint64_t v5 = [(UIInputViewAnimationStyle *)&v9 endPlacementForInputViewSet:a3 windowScene:a4];
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    [(UIInputViewAnimationStyleDirectional *)self outDirection];
    id v6 = [(id)objc_opt_class() placement];
  }
  else
  {
    id v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 showsInputViews]
    && [v7 showsInputViews]
    && ([(UIInputViewAnimationStyleDirectional *)self outDirection] == 4
     || [(UIInputViewAnimationStyleDirectional *)self outDirection] == 5))
  {
    id v8 = [[UIInputViewAnimationControllerSlide alloc] initWithSlide:[(UIInputViewAnimationStyleDirectional *)self outDirection]];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIInputViewAnimationStyleDirectional;
    id v8 = [(UIInputViewAnimationStyle *)&v11 controllerForStartPlacement:v6 endPlacement:v7];
  }
  objc_super v9 = v8;

  return v9;
}

- (BOOL)canDismissWithScrollView
{
  return [(UIInputViewAnimationStyleDirectional *)self outDirection] == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewAnimationStyleDirectional;
  if ([(UIInputViewAnimationStyle *)&v8 isEqual:v4])
  {
    int v5 = [(UIInputViewAnimationStyleDirectional *)self outDirection];
    BOOL v6 = v5 == [v4 outDirection];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewAnimationStyleDirectional;
  id v4 = [(UIInputViewAnimationStyle *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOutDirection:", -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection"));
  return v4;
}

- (int)outDirection
{
  return self->_outDirection;
}

@end