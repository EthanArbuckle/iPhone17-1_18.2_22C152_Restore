@interface GradientView
+ (Class)layerClass;
- (_TtC7Journal12GradientView)initWithCoder:(id)a3;
- (_TtC7Journal12GradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GradientView

+ (Class)layerClass
{
  sub_10001B284(0, (unint64_t *)&unk_100812C20);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005D4FE4();
}

- (_TtC7Journal12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal12GradientView *)sub_1005D5480(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal12GradientView)initWithCoder:(id)a3
{
  return (_TtC7Journal12GradientView *)sub_1005D57C0(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal12GradientView__colors;
  uint64_t v4 = sub_100010218(&qword_100812D18);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7Journal12GradientView__startPoint;
  uint64_t v6 = sub_100010218(&qword_100812D10);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7Journal12GradientView__endPoint;

  v8(v7, v6);
}

@end