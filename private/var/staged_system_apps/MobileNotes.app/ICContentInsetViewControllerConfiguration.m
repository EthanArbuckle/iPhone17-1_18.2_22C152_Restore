@interface ICContentInsetViewControllerConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)usesSafeAreaLayoutGuide;
- (ICContentInsetViewControllerConfiguration)init;
- (ICContentInsetViewControllerConfiguration)initWithInsets:(NSDirectionalEdgeInsets)a3 usesSafeAreaLayoutGuide:(BOOL)a4 cornerRadius:(double)a5;
- (NSDirectionalEdgeInsets)insets;
- (double)cornerRadius;
@end

@implementation ICContentInsetViewControllerConfiguration

- (NSDirectionalEdgeInsets)insets
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets);
  double v3 = *(double *)&self->insets[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets];
  double v4 = *(double *)&self->insets[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets + 8];
  double v5 = *(double *)&self->insets[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets + 16];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (BOOL)usesSafeAreaLayoutGuide
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_usesSafeAreaLayoutGuide);
}

- (double)cornerRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_cornerRadius);
}

- (ICContentInsetViewControllerConfiguration)initWithInsets:(NSDirectionalEdgeInsets)a3 usesSafeAreaLayoutGuide:(BOOL)a4 cornerRadius:(double)a5
{
  *(NSDirectionalEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_usesSafeAreaLayoutGuide) = a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___ICContentInsetViewControllerConfiguration_cornerRadius) = a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContentInsetViewController.Configuration();
  return [(ICContentInsetViewControllerConfiguration *)&v6 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    double v5 = self;
  }
  sub_1002510BC((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_100015BE0((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for ContentInsetViewController.Configuration();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = _s11MobileNotes26ContentInsetViewControllerC13ConfigurationC2eeoiySbAE_AEtFZ_0((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_100015BE0((uint64_t)v11);
  return v6;
}

- (ICContentInsetViewControllerConfiguration)init
{
  NSDirectionalEdgeInsets result = (ICContentInsetViewControllerConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end