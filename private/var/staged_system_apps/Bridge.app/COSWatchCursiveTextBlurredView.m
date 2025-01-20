@interface COSWatchCursiveTextBlurredView
+ (Class)layerClass;
- (_TtC6Bridge30COSWatchCursiveTextBlurredView)initWithCoder:(id)a3;
- (_TtC6Bridge30COSWatchCursiveTextBlurredView)initWithFrame:(CGRect)a3;
@end

@implementation COSWatchCursiveTextBlurredView

+ (Class)layerClass
{
  sub_100141844(0, &qword_10029ACD8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC6Bridge30COSWatchCursiveTextBlurredView)initWithCoder:(id)a3
{
  return (_TtC6Bridge30COSWatchCursiveTextBlurredView *)sub_10014CB78(a3);
}

- (_TtC6Bridge30COSWatchCursiveTextBlurredView)initWithFrame:(CGRect)a3
{
  return (_TtC6Bridge30COSWatchCursiveTextBlurredView *)sub_10014CC94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Bridge30COSWatchCursiveTextBlurredView_blurFilter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Bridge30COSWatchCursiveTextBlurredView_saturationFilter));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6Bridge30COSWatchCursiveTextBlurredView_curvesFilter);
}

@end