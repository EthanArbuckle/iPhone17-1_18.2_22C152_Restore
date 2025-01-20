@interface VFXREREnderer
- (MTLDevice)device;
- (VFXREREnderer)init;
- (void)setDevice:(id)a3;
@end

@implementation VFXREREnderer

- (MTLDevice)device
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLDevice *)v2;
}

- (void)setDevice:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREREnderer_device) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (VFXREREnderer)init
{
  result = (VFXREREnderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end