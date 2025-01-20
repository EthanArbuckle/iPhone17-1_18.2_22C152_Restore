@interface RenderingEnvironment
- (BOOL)px_isCallServices;
- (BOOL)px_isPlayground;
- (BOOL)px_isPreview;
- (BOOL)px_isSnapshot;
- (CGRect)px_floatingObscurableBounds;
- (CGRect)px_titleBoundsForLayout:(unint64_t)a3;
- (NSURL)px_assetDirectory;
- (_TtC20PhotosPosterProvider20RenderingEnvironment)init;
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
  unsigned __int8 v3 = sub_100003274();

  return v3 & 1;
}

- (BOOL)px_isPreview
{
  v2 = self;
  unsigned __int8 v3 = sub_1000032D4();

  return v3 & 1;
}

- (BOOL)px_isPlayground
{
  return 0;
}

- (BOOL)px_isCallServices
{
  v2 = self;
  char v3 = sub_100003344();

  return v3 & 1;
}

- (int64_t)px_boundingShape
{
  v2 = self;
  int64_t v3 = sub_10000339C();

  return v3;
}

- (NSURL)px_assetDirectory
{
  uint64_t v3 = sub_100009C74((uint64_t *)&unk_10003D410);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1000034A8((uint64_t)v5);

  uint64_t v7 = sub_100028B50();
  v9 = 0;
  if (sub_10000B9D8((uint64_t)v5, 1, v7) != 1)
  {
    sub_100028AF0(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (int64_t)px_backlightLuminance
{
  v2 = self;
  int64_t v3 = sub_100003580();

  return v3;
}

- (int64_t)px_significantEventsCounter
{
  v2 = self;
  id v3 = sub_10000363C();

  return (int64_t)v3;
}

- (int64_t)px_contentsType
{
  v2 = self;
  int64_t v3 = sub_100003688();

  return v3;
}

- (CGRect)px_floatingObscurableBounds
{
  sub_10000A858(self, (uint64_t)a2, (void (*)(void))sub_100003728);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)px_deviceOrientation
{
  double v2 = self;
  id v3 = sub_100003774();

  return (int64_t)v3;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  sub_10000A8E4(self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_10000378C);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtC20PhotosPosterProvider20RenderingEnvironment)init
{
}

- (void).cxx_destruct
{
}

@end