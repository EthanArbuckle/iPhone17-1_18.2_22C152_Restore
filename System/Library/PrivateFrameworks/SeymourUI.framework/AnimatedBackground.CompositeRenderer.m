@interface AnimatedBackground.CompositeRenderer
- (_TtCV9SeymourUI18AnimatedBackground17CompositeRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation AnimatedBackground.CompositeRenderer

- (_TtCV9SeymourUI18AnimatedBackground17CompositeRenderer)init
{
  result = (_TtCV9SeymourUI18AnimatedBackground17CompositeRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_observer);
  swift_release();
  v3 = *(void **)&self->spectrumAnalysis[OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_context];
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_crossfadeTimingFunction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_modeTimingFunction));
  swift_release();
  swift_release();
  swift_release();
  sub_23A29E654(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_currentContent), self->observer[OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_currentContent]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_imageStorage));
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_placeholderColor);
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v11 = self;
  id v8 = objc_msgSend(v7, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);
  double v10 = v9;

  sub_23A29DB58(width, height, v10);
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A29DD0C(v4);
}

@end