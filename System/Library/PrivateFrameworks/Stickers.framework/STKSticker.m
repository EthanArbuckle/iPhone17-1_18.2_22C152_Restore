@interface STKSticker
+ (BOOL)supportsSecureCoding;
- (BOOL)canDistribute;
- (BOOL)distributionIsRestricted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGeneratedSticker;
- (NSArray)distributionRestrictions_ObjC;
- (NSArray)representations;
- (NSData)metadata;
- (NSString)accessibilityName;
- (NSString)description;
- (NSString)externalURI;
- (NSString)name;
- (NSString)sanitizedPrompt;
- (NSString)searchText;
- (NSUUID)_companionRecentUUID;
- (NSUUID)identifier;
- (STKSticker)init;
- (STKSticker)initWithCoder:(id)a3;
- (STKStickerAttributionInfo)attributionInfo;
- (double)creationDate;
- (double)lastUsedDate;
- (double)libraryIndex;
- (int64_t)byteCount;
- (int64_t)effect;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityName:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setByteCount:(int64_t)a3;
- (void)setCreationDate:(double)a3;
- (void)setEffect:(int64_t)a3;
- (void)setExternalURI:(id)a3;
- (void)setLastUsedDate:(double)a3;
- (void)setLibraryIndex:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setRepresentations:(id)a3;
- (void)setSanitizedPrompt:(id)a3;
- (void)setSearchText:(id)a3;
- (void)set_companionRecentUUID:(id)a3;
@end

@implementation STKSticker

- (NSUUID)identifier
{
  v2 = (void *)sub_25E4254A0();
  return (NSUUID *)v2;
}

- (NSArray)representations
{
  swift_beginAccess();
  type metadata accessor for Sticker.Representation();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25E425AB0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setRepresentations:(id)a3
{
  type metadata accessor for Sticker.Representation();
  uint64_t v4 = sub_25E425AC0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_representations);
  swift_beginAccess();
  uint64_t *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_25E402BDC();
}

- (NSString)accessibilityName
{
  return (NSString *)sub_25E400914((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_accessibilityName);
}

- (void)setAccessibilityName:(id)a3
{
}

- (int64_t)byteCount
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_byteCount);
  swift_beginAccess();
  return *v2;
}

- (void)setByteCount:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_byteCount);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSString)name
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25E4258C0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_25E4258F0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_name);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)searchText
{
  return (NSString *)sub_25E400914((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_searchText);
}

- (void)setSearchText:(id)a3
{
}

- (NSString)sanitizedPrompt
{
  return (NSString *)sub_25E400914((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_sanitizedPrompt);
}

- (void)setSanitizedPrompt:(id)a3
{
}

- (BOOL)isGeneratedSticker
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKSticker_searchText);
  swift_beginAccess();
  unint64_t v3 = v2[1];
  if (!v3) {
    return 0;
  }
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v4 = *v2 & 0xFFFFFFFFFFFFLL;
  }
  return v4 != 0;
}

- (int64_t)effect
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_effect);
  swift_beginAccess();
  return *v2;
}

- (void)setEffect:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_effect);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSData)metadata
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_metadata);
  swift_beginAccess();
  unint64_t v3 = 0;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_25E3CEAB0(v5, v4);
    unint64_t v3 = (void *)sub_25E4253B0();
    sub_25E3CEB1C(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setMetadata:(id)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    unint64_t v3 = (void *)sub_25E4253D0();
    unint64_t v8 = v7;
  }
  else
  {
    v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_metadata);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  uint64_t *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_25E3CEB1C(v11, v12);
}

- (NSString)externalURI
{
  return (NSString *)sub_25E400914((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_externalURI);
}

- (void)setExternalURI:(id)a3
{
}

- (STKStickerAttributionInfo)attributionInfo
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___STKSticker_attributionInfo);
  swift_beginAccess();
  return (STKStickerAttributionInfo *)*v2;
}

- (void)setAttributionInfo:(id)a3
{
  unint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___STKSticker_attributionInfo);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *unint64_t v4 = a3;
  id v6 = a3;
}

- (double)creationDate
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKSticker_creationDate);
  swift_beginAccess();
  return *v2;
}

- (void)setCreationDate:(double)a3
{
  unint64_t v4 = (double *)((char *)self + OBJC_IVAR___STKSticker_creationDate);
  swift_beginAccess();
  *unint64_t v4 = a3;
}

- (double)lastUsedDate
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKSticker_lastUsedDate);
  swift_beginAccess();
  return *v2;
}

- (void)setLastUsedDate:(double)a3
{
  unint64_t v4 = (double *)((char *)self + OBJC_IVAR___STKSticker_lastUsedDate);
  swift_beginAccess();
  *unint64_t v4 = a3;
}

- (double)libraryIndex
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKSticker_libraryIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setLibraryIndex:(double)a3
{
  unint64_t v4 = (double *)((char *)self + OBJC_IVAR___STKSticker_libraryIndex);
  swift_beginAccess();
  *unint64_t v4 = a3;
}

- (NSUUID)_companionRecentUUID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B389370);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR___STKSticker__companionRecentUUID;
  swift_beginAccess();
  sub_25E3FBED4((uint64_t)v6, (uint64_t)v5, &qword_26B389370);
  uint64_t v7 = sub_25E4254F0();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_25E4254A0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (void)set_companionRecentUUID:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B389370);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_25E4254C0();
    uint64_t v8 = sub_25E4254F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25E4254F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___STKSticker__companionRecentUUID;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_25E3EC670((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSString)description
{
  v2 = self;
  sub_25E401994();

  uint64_t v3 = (void *)sub_25E4258C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_25E425DD0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = sub_25E402354((uint64_t)v8);

  sub_25E3CE8D4((uint64_t)v8, &qword_26B389560);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_25E4254D0();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STKSticker)initWithCoder:(id)a3
{
  return (STKSticker *)Sticker.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_25E403D88(v4);
}

- (STKSticker)init
{
  result = (STKSticker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR___STKSticker_identifier;
  uint64_t v4 = sub_25E4254F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E3CEB1C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKSticker_metadata), *(void *)&self->type[OBJC_IVAR___STKSticker_metadata]);
  swift_bridgeObjectRelease();

  sub_25E3CE8D4((uint64_t)self + OBJC_IVAR___STKSticker__companionRecentUUID, &qword_26B389370);
}

- (BOOL)distributionIsRestricted
{
  v2 = self;
  if (os_variant_has_internal_content())
  {
    unsigned __int8 v3 = [(STKSticker *)v2 canDistribute];

    return v3 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (BOOL)canDistribute
{
  v2 = self;
  if (os_variant_has_internal_content())
  {
    uint64_t v3 = *((void *)Sticker.distributionRestrictions.getter() + 2);

    swift_bridgeObjectRelease();
    return v3 == 0;
  }
  else
  {

    return 1;
  }
}

- (NSArray)distributionRestrictions_ObjC
{
  v2 = self;
  uint64_t v3 = Sticker.distributionRestrictions.getter();
  sub_25E422F70((uint64_t)v3);

  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_25E425AB0();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

@end