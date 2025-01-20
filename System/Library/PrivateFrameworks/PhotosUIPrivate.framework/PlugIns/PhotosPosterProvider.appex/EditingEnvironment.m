@interface EditingEnvironment
- (BOOL)px_isCallServices;
- (CGRect)px_floatingObscurableBounds;
- (CGRect)px_titleBoundsForLayout:(unint64_t)a3;
- (NSURL)pu_sourceAssetDirectory;
- (NSURL)pu_targetAssetDirectory;
- (PFPosterConfiguration)pu_sourcePosterConfiguration;
- (PFPosterDescriptor)pu_posterDescriptor;
- (PUMutablePosterConfiguration)pu_targetConfiguration;
- (PUPosterOverrideConfiguration)pu_overrideConfiguration;
- (UIColor)pu_caseColor;
- (_TtC20PhotosPosterProvider18EditingEnvironment)init;
- (int64_t)pu_deviceOrientation;
- (int64_t)pu_posterType;
- (int64_t)pu_userInterfaceStyle;
- (int64_t)px_boundingShape;
- (int64_t)px_significantEventsCounter;
- (unint64_t)pu_legacyConfigurationType;
@end

@implementation EditingEnvironment

- (int64_t)pu_posterType
{
  v2 = self;
  id v3 = sub_100009FE8();

  return (int64_t)v3;
}

- (NSURL)pu_sourceAssetDirectory
{
  return (NSURL *)sub_10000A054((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_10000A030);
}

- (NSURL)pu_targetAssetDirectory
{
  return (NSURL *)sub_10000A054((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_10000A150);
}

- (PFPosterConfiguration)pu_sourcePosterConfiguration
{
  v2 = sub_10000A218();
  return (PFPosterConfiguration *)v2;
}

- (PFPosterDescriptor)pu_posterDescriptor
{
  v2 = sub_10000A27C();
  return (PFPosterDescriptor *)v2;
}

- (UIColor)pu_caseColor
{
  v2 = self;
  id v3 = sub_10000A2F0();

  return (UIColor *)v3;
}

- (int64_t)pu_userInterfaceStyle
{
  v2 = self;
  id v3 = sub_10000A364();

  return (int64_t)v3;
}

- (int64_t)pu_deviceOrientation
{
  v2 = self;
  id v3 = sub_10000A3F4();

  return (int64_t)v3;
}

- (unint64_t)pu_legacyConfigurationType
{
  v2 = self;
  unint64_t v3 = sub_10000A440();

  return v3;
}

- (PUPosterOverrideConfiguration)pu_overrideConfiguration
{
  v2 = self;
  unint64_t v3 = sub_10000A658();

  return (PUPosterOverrideConfiguration *)v3;
}

- (PUMutablePosterConfiguration)pu_targetConfiguration
{
  v2 = self;
  id v3 = sub_10000A71C();

  return (PUMutablePosterConfiguration *)v3;
}

- (int64_t)px_significantEventsCounter
{
  v2 = self;
  id v3 = sub_10000A790();

  return (int64_t)v3;
}

- (BOOL)px_isCallServices
{
  v2 = self;
  char v3 = sub_10000A7DC();

  return v3 & 1;
}

- (int64_t)px_boundingShape
{
  v2 = self;
  int64_t v3 = sub_10000A834();

  return v3;
}

- (CGRect)px_floatingObscurableBounds
{
  sub_10000A858(self, (uint64_t)a2, (void (*)(void))sub_10000A8A4);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  sub_10000A8E4(self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_10000A8BC);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtC20PhotosPosterProvider18EditingEnvironment)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration));
  double v3 = (char *)self + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourceAssetDirectory;
  uint64_t v4 = sub_100028B50();
  sub_10000C2C8();
  v7 = *(void (**)(char *, uint64_t))(v5 + 8);
  v7(v3, v4);
  double v6 = (char *)self + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_targetAssetDirectory;
  v7(v6, v4);
}

@end