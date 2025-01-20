@interface ICCalculateAccessibilityController
- (ICCalculateAccessibilityController)init;
- (ICCalculateAccessibilityController)initWithNote:(id)a3;
- (ICNote)note;
- (id)getValueForPencilKitAttachmentAtRange:(_NSRange)a3;
- (void)setNote:(id)a3;
@end

@implementation ICCalculateAccessibilityController

- (ICNote)note
{
  v2 = (char *)self + OBJC_IVAR___ICCalculateAccessibilityController_note;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1B3E9F7C0](v2);
  return (ICNote *)v3;
}

- (void)setNote:(id)a3
{
}

- (ICCalculateAccessibilityController)initWithNote:(id)a3
{
  return (ICCalculateAccessibilityController *)sub_1B0AD624C(a3);
}

- (id)getValueForPencilKitAttachmentAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = self;
  sub_1B0AD67F0(location, length);
  uint64_t v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1B0B823CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (ICCalculateAccessibilityController)init
{
  result = (ICCalculateAccessibilityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end