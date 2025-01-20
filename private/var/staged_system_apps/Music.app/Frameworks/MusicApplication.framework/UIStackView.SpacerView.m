@interface UIStackView.SpacerView
+ (Class)layerClass;
- (_TtCE14MusicUtilitiesCSo11UIStackView10SpacerView)initWithCoder:(id)a3;
- (_TtCE14MusicUtilitiesCSo11UIStackView10SpacerView)initWithFrame:(CGRect)a3;
@end

@implementation UIStackView.SpacerView

+ (Class)layerClass
{
  sub_173E4(0, &qword_DF1D88);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCE14MusicUtilitiesCSo11UIStackView10SpacerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UIStackView.SpacerView();
  return -[UIStackView.SpacerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCE14MusicUtilitiesCSo11UIStackView10SpacerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIStackView.SpacerView();
  return [(UIStackView.SpacerView *)&v5 initWithCoder:a3];
}

@end