@interface SSKDisplayProfileConfiguration
- (BOOL)derivesDisplays;
- (BOOL)isMainLike;
- (BOOL)shouldTransformConnectingDisplays;
- (BOOL)supportsCloning;
- (NSString)derivedIdentifier;
- (SSKDisplayProfileConfiguration)init;
- (unint64_t)priority;
- (void)transformPhysicalDisplayWith:(id)a3;
@end

@implementation SSKDisplayProfileConfiguration

- (BOOL)supportsCloning
{
  return self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 25];
}

- (NSString)derivedIdentifier
{
  if (*(void *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_25C47AA78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isMainLike
{
  if (*(void *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16]) {
    return self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24] & 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)priority
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration);
}

- (SSKDisplayProfileConfiguration)init
{
  result = (SSKDisplayProfileConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)transformPhysicalDisplayWith:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  DisplayProfileConfiguration_Box.transformPhysicalDisplay(with:)(a3);
  swift_unknownObjectRelease();
}

- (BOOL)derivesDisplays
{
  return *(void *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16] != 0;
}

- (BOOL)shouldTransformConnectingDisplays
{
  return (*(void *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16] != 0) | self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 25] & 1;
}

@end