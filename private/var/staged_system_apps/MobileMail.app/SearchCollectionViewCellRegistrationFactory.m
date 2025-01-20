@interface SearchCollectionViewCellRegistrationFactory
- (_TtC10MobileMail43SearchCollectionViewCellRegistrationFactory)init;
- (void)getRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 handler:(id)a5;
@end

@implementation SearchCollectionViewCellRegistrationFactory

- (void)getRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 handler:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v12 = _Block_copy(a5);
  v8 = self;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v9;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v10;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  sub_1003DC3F8(v14, v18, v13, v16, (uint64_t)sub_1003CC0B4, v15);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC10MobileMail43SearchCollectionViewCellRegistrationFactory)init
{
  return (_TtC10MobileMail43SearchCollectionViewCellRegistrationFactory *)sub_1003DC6CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_contactStore));
  sub_10001B0B0();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_suggestionHighlightedTextColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail43SearchCollectionViewCellRegistrationFactory_suggestionTextColor));
  swift_release();
}

@end