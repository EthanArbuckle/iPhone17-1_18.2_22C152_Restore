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
  sub_10032A31C();
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
  sub_1003298F8(v5);

  sub_10000C300(v5, (uint64_t)v5[3]);
  double v3 = (void *)sub_1004626D0();
  sub_100007118((uint64_t)v5);
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
  sub_10031CAE4((uint64_t)v3);
  sub_100329FBC(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicTextContentView_content), *(void *)&self->isSelected[OBJC_IVAR___MusicTextContentView_content], self->specs[OBJC_IVAR___MusicTextContentView_content + 7]);
}

@end