@interface _UIFluidSliderElasticPanDriver
- (BOOL)enabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSString)name;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)view;
- (_UIFluidSliderDirectDrivingDelegate)delegate;
- (_UIFluidSliderDrivable)drivable;
- (_UIFluidSliderElasticPanDriver)init;
- (double)stretchAmount;
- (double)velocityMultiplier;
- (unint64_t)trackAxis;
- (void)cancel;
- (void)handleGesture:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrivable:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setStretchAmount:(double)a3;
- (void)setTrackAxis:(unint64_t)a3;
- (void)setVelocityMultiplier:(double)a3;
- (void)setView:(id)a3;
- (void)stop;
@end

@implementation _UIFluidSliderElasticPanDriver

- (_UIFluidSliderDrivable)drivable
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_drivable, a2);
  return (_UIFluidSliderDrivable *)v2;
}

- (void)setDrivable:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer));
}

- (void)setPanGestureRecognizer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer) = (Class)a3;
  id v3 = a3;
}

- (unint64_t)trackAxis
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_trackAxis);
}

- (void)setTrackAxis:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_trackAxis) = (Class)a3;
}

- (double)stretchAmount
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_stretchAmount);
}

- (void)setStretchAmount:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_stretchAmount) = a3;
}

- (double)velocityMultiplier
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_velocityMultiplier);
}

- (void)setVelocityMultiplier:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_velocityMultiplier) = a3;
}

- (_UIFluidSliderDirectDrivingDelegate)delegate
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_delegate, a2);
  return (_UIFluidSliderDirectDrivingDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_186A1E95C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_name);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_UIFluidSliderElasticPanDriver)init
{
  return (_UIFluidSliderElasticPanDriver *)sub_185969238();
}

- (void)stop
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_state) = (Class)3;
}

- (void)cancel
{
  v2 = self;
  sub_185969618();
}

- (UIView)view
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_view, a2);
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_18596ACF4();
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_enabled) = a3;
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer);
  if (v3) {
    objc_msgSend(v3, sel_setEnabled_);
  }
}

- (void)handleGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1859697C4(v4);
}

- (void).cxx_destruct
{
  sub_18596AE14((uint64_t)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_drivable);
  sub_18596AE14((uint64_t)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_18596A988(v4);

  return self & 1;
}

@end