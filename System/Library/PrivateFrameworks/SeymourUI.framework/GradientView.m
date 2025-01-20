@interface GradientView
+ (Class)layerClass;
- (_TtC9SeymourUI12GradientView)initWithCoder:(id)a3;
- (_TtC9SeymourUI12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  sub_239C24FF0(0, &qword_268A0F120);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9SeymourUI12GradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI12GradientView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GradientView();
  return [(GradientView *)&v5 initWithCoder:a3];
}

@end