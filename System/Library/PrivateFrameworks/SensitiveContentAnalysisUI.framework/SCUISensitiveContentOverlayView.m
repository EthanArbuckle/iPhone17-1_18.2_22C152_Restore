@interface SCUISensitiveContentOverlayView
- (SCUISensitiveContentOverlayView)initWithCoder:(id)a3;
- (SCUISensitiveContentOverlayView)initWithFrame:(CGRect)a3;
- (SCUISensitiveContentOverlayView)initWithOptions:(unint64_t)a3;
- (SCUISensitiveContentOverlayViewDelegate)delegate;
- (void)configureWithAnalysis:(id)a3;
- (void)configureWithAnalysis:(id)a3 scanningCGImage:(CGImage *)a4;
- (void)configureWithAnalysis:(id)a3 scanningFileURL:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SCUISensitiveContentOverlayView

- (SCUISensitiveContentOverlayViewDelegate)delegate
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.super.super.isa
                                         + OBJC_IVAR___SCUISensitiveContentOverlayView_state)
                           + 240);
  v3 = self;
  v4 = (void *)v2();

  return (SCUISensitiveContentOverlayViewDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  v5 = *(void (**)(id))(**(void **)((char *)&self->super.super.super.isa
                                               + OBJC_IVAR___SCUISensitiveContentOverlayView_state)
                                 + 248);
  swift_unknownObjectRetain();
  v6 = self;
  v5(a3);
}

- (SCUISensitiveContentOverlayView)initWithOptions:(unint64_t)a3
{
  return (SCUISensitiveContentOverlayView *)sub_25C0C3D58(a3);
}

- (SCUISensitiveContentOverlayView)initWithCoder:(id)a3
{
  result = (SCUISensitiveContentOverlayView *)sub_25C0EC078();
  __break(1u);
  return result;
}

- (void)configureWithAnalysis:(id)a3 scanningCGImage:(CGImage *)a4
{
  id v7 = a3;
  v8 = a4;
  v9 = self;
  sub_25C0C4274((uint64_t)a3, a4);
}

- (void)configureWithAnalysis:(id)a3 scanningFileURL:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589EC0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_25C0EA1F8();
    uint64_t v10 = sub_25C0EA238();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_25C0EA238();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_25C0C4598((uint64_t)a3, (uint64_t)v9);

  sub_25C02FBF0((uint64_t)v9, &qword_26A589EC0);
}

- (void)configureWithAnalysis:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_25C0C4ACC((uint64_t)a3);
}

- (SCUISensitiveContentOverlayView)initWithFrame:(CGRect)a3
{
  result = (SCUISensitiveContentOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end