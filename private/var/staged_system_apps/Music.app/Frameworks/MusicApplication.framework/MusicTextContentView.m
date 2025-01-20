@interface MusicTextContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MusicTextContentView)initWithCoder:(id)a3;
- (MusicTextContentView)initWithFrame:(CGRect)a3;
- (id)copy;
@end

@implementation MusicTextContentView

- (MusicTextContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_861EE0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicTextContentView_label) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)copy
{
  v2 = self;
  sub_8614EC(v5);

  __swift_project_boxed_opaque_existential_1(v5, (uint64_t)v5[3]);
  double v3 = (void *)sub_AB8630();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (MusicTextContentView)initWithFrame:(CGRect)a3
{
  CGSize result = (MusicTextContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR___MusicTextContentView_specs, 0x219uLL);
  sub_8546D8((uint64_t)v3);
  sub_173C4(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicTextContentView_content), *(void *)&self->isSelected[OBJC_IVAR___MusicTextContentView_content], self->specs[OBJC_IVAR___MusicTextContentView_content + 7]);
}

@end