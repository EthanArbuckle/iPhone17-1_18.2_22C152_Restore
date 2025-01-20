@interface AudioItemCandidate
- (NSString)description;
- (_TtC21SiriInformationSearch18AudioItemCandidate)init;
@end

@implementation AudioItemCandidate

- (NSString)description
{
  return (NSString *)@objc AudioItemCandidate.Features.description.getter(self, (uint64_t)a2, AudioItemCandidate.description.getter);
}

- (_TtC21SiriInformationSearch18AudioItemCandidate)init
{
  result = (_TtC21SiriInformationSearch18AudioItemCandidate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch18AudioItemCandidate_itemType;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItemType();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch18AudioItemCandidate_backingItem;

  outlined destroy of AudioItemCandidate.BackingItem((uint64_t)v5);
}

@end