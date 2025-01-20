@interface LineProgressGradientView.GradientView
+ (Class)layerClass;
- (_TtCC11MusicCoreUI24LineProgressGradientViewP33_CAA5E92EB35A39E050897B33043EE84412GradientView)initWithCoder:(id)a3;
- (_TtCC11MusicCoreUI24LineProgressGradientViewP33_CAA5E92EB35A39E050897B33043EE84412GradientView)initWithFrame:(CGRect)a3;
@end

@implementation LineProgressGradientView.GradientView

+ (Class)layerClass
{
  sub_10041A168();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();

  return (Class)[ObjCClassFromMetadata classForCoder];
}

- (_TtCC11MusicCoreUI24LineProgressGradientViewP33_CAA5E92EB35A39E050897B33043EE84412GradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LineProgressGradientView.GradientView();
  return -[LineProgressGradientView.GradientView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC11MusicCoreUI24LineProgressGradientViewP33_CAA5E92EB35A39E050897B33043EE84412GradientView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LineProgressGradientView.GradientView();
  return [(LineProgressGradientView.GradientView *)&v5 initWithCoder:a3];
}

@end