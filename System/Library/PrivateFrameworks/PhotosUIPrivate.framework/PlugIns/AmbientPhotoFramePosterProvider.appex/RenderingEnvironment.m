@interface RenderingEnvironment
- (BOOL)px_isCallServices;
- (BOOL)px_isPlayground;
- (BOOL)px_isPreview;
- (BOOL)px_isSnapshot;
- (CGRect)px_floatingObscurableBounds;
- (CGRect)px_titleBoundsForLayout:(unint64_t)a3;
- (NSURL)px_assetDirectory;
- (_TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment)init;
- (int64_t)px_backlightLuminance;
- (int64_t)px_boundingShape;
- (int64_t)px_contentsType;
- (int64_t)px_deviceOrientation;
- (int64_t)px_significantEventsCounter;
@end

@implementation RenderingEnvironment

- (BOOL)px_isSnapshot
{
  v2 = self;
  unsigned __int8 v3 = sub_100005F54();

  return v3 & 1;
}

- (BOOL)px_isPreview
{
  v2 = self;
  unsigned __int8 v3 = sub_100005FB4();

  return v3 & 1;
}

- (BOOL)px_isPlayground
{
  return 0;
}

- (BOOL)px_isCallServices
{
  v2 = self;
  char v3 = sub_100006024();

  return v3 & 1;
}

- (int64_t)px_boundingShape
{
  v2 = self;
  int64_t v3 = sub_10000610C();

  return v3;
}

- (NSURL)px_assetDirectory
{
  sub_10000C5F0(&qword_10001FDF8);
  __chkstk_darwin();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = self;
  sub_10000621C((uint64_t)v4);

  uint64_t v6 = sub_1000113B0();
  v8 = 0;
  if (sub_10000CA4C((uint64_t)v4, 1, v6) != 1)
  {
    sub_100011390(v7);
    v8 = v9;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  return (NSURL *)v8;
}

- (int64_t)px_backlightLuminance
{
  return -1;
}

- (int64_t)px_significantEventsCounter
{
  v2 = self;
  id v3 = sub_1000063C0();

  return (int64_t)v3;
}

- (int64_t)px_contentsType
{
  v2 = self;
  int64_t v3 = sub_10000640C();

  return v3;
}

- (CGRect)px_floatingObscurableBounds
{
  v2 = self;
  sub_1000065B4();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (int64_t)px_deviceOrientation
{
  return 0;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment)init
{
}

- (void).cxx_destruct
{
  sub_10000CE80((uint64_t)self + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_debugAssetDirectory, &qword_10001FDF8);
  swift_unknownObjectRelease();
}

@end