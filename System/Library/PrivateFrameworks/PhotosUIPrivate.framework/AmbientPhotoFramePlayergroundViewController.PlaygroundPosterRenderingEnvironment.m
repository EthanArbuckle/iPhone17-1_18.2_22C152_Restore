@interface AmbientPhotoFramePlayergroundViewController.PlaygroundPosterRenderingEnvironment
- (BOOL)px_isCallServices;
- (BOOL)px_isPlayground;
- (BOOL)px_isPreview;
- (BOOL)px_isSnapshot;
- (CGRect)px_floatingObscurableBounds;
- (CGRect)px_titleBoundsForLayout:(unint64_t)a3;
- (NSURL)px_assetDirectory;
- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960036PlaygroundPosterRenderingEnvironment)init;
- (int64_t)px_backlightLuminance;
- (int64_t)px_boundingShape;
- (int64_t)px_contentsType;
- (int64_t)px_deviceOrientation;
- (int64_t)px_significantEventsCounter;
@end

@implementation AmbientPhotoFramePlayergroundViewController.PlaygroundPosterRenderingEnvironment

- (int64_t)px_backlightLuminance
{
  return sub_1AEB8DC5C();
}

- (BOOL)px_isSnapshot
{
  return sub_1AEAE70BC() & 1;
}

- (BOOL)px_isPreview
{
  return sub_1AEAE70BC() & 1;
}

- (int64_t)px_significantEventsCounter
{
  return OUTLINED_FUNCTION_1_14();
}

- (BOOL)px_isPlayground
{
  return OUTLINED_FUNCTION_46_1() & 1;
}

- (BOOL)px_isCallServices
{
  return sub_1AEAE70BC() & 1;
}

- (int64_t)px_boundingShape
{
  return sub_1AEB8DC5C();
}

- (NSURL)px_assetDirectory
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9A96930);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AEB8DE40((uint64_t)v4);
  uint64_t v5 = sub_1AEF93780();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1AEF93720();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSURL *)v6;
}

- (int64_t)px_contentsType
{
  return sub_1AEA585AC();
}

- (CGRect)px_floatingObscurableBounds
{
  double v2 = sub_1AEB8DF1C();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)px_deviceOrientation
{
  return OUTLINED_FUNCTION_46_1();
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3 = sub_1AEB8DF1C();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960036PlaygroundPosterRenderingEnvironment)init
{
}

- (void).cxx_destruct
{
  double v2 = (char *)self
     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960036PlaygroundPosterRenderingEnvironment_assetDirectory;
  uint64_t v3 = sub_1AEF93780();
  double v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end