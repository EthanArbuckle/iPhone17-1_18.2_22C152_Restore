@interface THScrollViewWithPassthrough
- (double)heightOfTopZoneForDockingSwipe;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHeightOfTopZoneForDockingSwipe:(double)a3;
@end

@implementation THScrollViewWithPassthrough

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  v10.receiver = self;
  v10.super_class = (Class)THScrollViewWithPassthrough;
  v6 = [(THScrollViewWithPassthrough *)&v10 hitTest:a4 withEvent:a3.x];
  if (v6 == self
    && ([(THScrollViewWithPassthrough *)self heightOfTopZoneForDockingSwipe], y > v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (double)heightOfTopZoneForDockingSwipe
{
  return self->mHeightOfTopZoneForDockingSwipe;
}

- (void)setHeightOfTopZoneForDockingSwipe:(double)a3
{
  self->mHeightOfTopZoneForDockingSwipe = a3;
}

@end