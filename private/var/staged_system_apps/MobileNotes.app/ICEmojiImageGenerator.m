@interface ICEmojiImageGenerator
- (ICEmojiImageGenerator)init;
- (id)generateEmojiImageAsset:(id)a3 description:(id)a4;
@end

@implementation ICEmojiImageGenerator

- (id)generateEmojiImageAsset:(id)a3 description:(id)a4
{
  unint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  id v9 = _s11MobileNotes19EmojiImageGeneratorC08generatecD5Asset_11descriptionSo07NSEmojidG0CSgSS_SStF_0(v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v9;
}

- (ICEmojiImageGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICEmojiImageGenerator *)&v3 init];
}

@end