@interface _STKSticker
- (NSArray)representations;
- (NSData)metadata;
- (NSString)accessibilityName;
- (NSString)description;
- (NSString)externalURI;
- (NSString)name;
- (NSString)sanitizedPrompt;
- (NSString)searchText;
- (NSUUID)identifier;
- (_STKSticker)init;
- (_STKStickerAttributionInfo)attributionInfo;
- (int64_t)effectType;
@end

@implementation _STKSticker

- (NSUUID)identifier
{
  v2 = (void *)sub_25E4254A0();
  return (NSUUID *)v2;
}

- (NSArray)representations
{
  type metadata accessor for _STKStickerRepresentation(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25E425AB0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_name);
}

- (int64_t)effectType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____STKSticker_effectType);
}

- (NSString)externalURI
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_externalURI);
}

- (NSString)accessibilityName
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_accessibilityName);
}

- (NSData)metadata
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____STKSticker_metadata);
  unint64_t v3 = *(void *)&self->_anon_0[OBJC_IVAR____STKSticker_metadata];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_25E3CEAB0(*v2, v3);
    v4 = (void *)sub_25E4253B0();
    sub_25E3CEB1C(v5, v3);
  }
  return (NSData *)v4;
}

- (_STKStickerAttributionInfo)attributionInfo
{
  return (_STKStickerAttributionInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____STKSticker_attributionInfo));
}

- (NSString)searchText
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_searchText);
}

- (NSString)sanitizedPrompt
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_sanitizedPrompt);
}

- (NSString)description
{
  return (NSString *)sub_25E3D3A80(self, (uint64_t)a2, (void (*)(void))sub_25E3D2860);
}

- (_STKSticker)init
{
  result = (_STKSticker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unint64_t v3 = (char *)self + OBJC_IVAR____STKSticker_identifier;
  uint64_t v4 = sub_25E4254F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E3CEB1C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKSticker_metadata), *(void *)&self->_anon_0[OBJC_IVAR____STKSticker_metadata]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end