@interface SUIBBridgedMatch
- (SUIBBridgedMatch)init;
- (_NSRange)range;
- (id)captured;
@end

@implementation SUIBBridgedMatch

- (_NSRange)range
{
  v2 = self;
  uint64_t v3 = sub_25DD96A50();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)captured
{
  v2 = self;
  sub_25DD96BE4();

  uint64_t v3 = (void *)sub_25DDACA60();
  swift_bridgeObjectRelease();
  return v3;
}

- (SUIBBridgedMatch)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___SUIBBridgedMatch_match;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C76E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  NSUInteger v5 = (char *)self + OBJC_IVAR___SUIBBridgedMatch_captureReference;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7738);
  NSUInteger v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end