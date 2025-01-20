@interface UIZoomTransitionOptions
- (BOOL)_popPreemptsPushInSwiftUIEnabled;
- (UIBlurEffect)dimmingVisualEffect;
- (UIColor)dimmingColor;
- (id)alignmentRectProvider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)interactiveDismissShouldBegin;
- (void)setAlignmentRectProvider:(id)a3;
- (void)setDimmingColor:(id)a3;
- (void)setDimmingVisualEffect:(id)a3;
- (void)setInteractiveDismissShouldBegin:(id)a3;
- (void)set_popPreemptsPushInSwiftUIEnabled:(BOOL)a3;
@end

@implementation UIZoomTransitionOptions

- (void)set_popPreemptsPushInSwiftUIEnabled:(BOOL)a3
{
  self->__popPreemptsPushInSwiftUIEnabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UIZoomTransitionOptions *)self interactiveDismissShouldBegin];
  [v4 setInteractiveDismissShouldBegin:v5];

  v6 = [(UIZoomTransitionOptions *)self alignmentRectProvider];
  [v4 setAlignmentRectProvider:v6];

  v7 = [(UIZoomTransitionOptions *)self dimmingColor];
  [v4 setDimmingColor:v7];

  v8 = [(UIZoomTransitionOptions *)self dimmingVisualEffect];
  [v4 setDimmingVisualEffect:v8];

  return v4;
}

- (id)interactiveDismissShouldBegin
{
  return self->_interactiveDismissShouldBegin;
}

- (void)setInteractiveDismissShouldBegin:(id)a3
{
}

- (id)alignmentRectProvider
{
  return self->_alignmentRectProvider;
}

- (void)setAlignmentRectProvider:(id)a3
{
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (void)setDimmingColor:(id)a3
{
}

- (UIBlurEffect)dimmingVisualEffect
{
  return self->_dimmingVisualEffect;
}

- (void)setDimmingVisualEffect:(id)a3
{
}

- (BOOL)_popPreemptsPushInSwiftUIEnabled
{
  return self->__popPreemptsPushInSwiftUIEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingVisualEffect, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong(&self->_alignmentRectProvider, 0);
  objc_storeStrong(&self->_interactiveDismissShouldBegin, 0);
}

@end