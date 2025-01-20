@interface VCCommandCollectionObjC
+ (id)allCollectionIdentifiers;
+ (id)allCollections;
+ (id)collectionWithIdentifier:(id)a3;
- (NSArray)commandIdentifiers;
- (NSArray)commandIdentifiersForCurrentDevice;
- (VCCommandCollectionObjC)init;
@end

@implementation VCCommandCollectionObjC

+ (id)allCollections
{
  if (qword_268A5AB58 != -1) {
    a1 = (id)swift_once();
  }
  type metadata accessor for VCCommandCollectionObjC((uint64_t)a1);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23AC2A5F0();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)allCollectionIdentifiers
{
  _sSo23VCCommandCollectionObjCC32SpeechRecognitionCommandServicesE03allB11IdentifiersSaySSGyFZ_0();
  v2 = (void *)sub_23AC2A5F0();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)collectionWithIdentifier:(id)a3
{
  uint64_t v3 = sub_23AC2A550();
  uint64_t v5 = v4;
  if (qword_268A5AB58 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v7 = sub_23ABB42EC(v6, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7 >> 62)
  {
    id result = (id)sub_23AC2A720();
    if (result) {
      goto LABEL_5;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  id result = *(id *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v9 = (id)MEMORY[0x23ECC1BC0](0, v7);
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v9 = *(id *)(v7 + 32);
  }
  v10 = v9;
LABEL_11:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (NSArray)commandIdentifiers
{
  return (NSArray *)sub_23ABB110C(self, (uint64_t)a2, VCCommandCollectionObjC.commandIdentifiers.getter);
}

- (NSArray)commandIdentifiersForCurrentDevice
{
  return (NSArray *)sub_23ABB110C(self, (uint64_t)a2, VCCommandCollectionObjC.commandIdentifiersForCurrentDevice.getter);
}

- (VCCommandCollectionObjC)init
{
  v2 = (_OWORD *)((char *)self + OBJC_IVAR___VCCommandCollectionObjC_representedCollection);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  *(_OWORD *)((char *)v2 + 25) = 0u;
  v4.receiver = self;
  v4.super_class = (Class)VCCommandCollectionObjC;
  return [(VCCommandCollectionObjC *)&v4 init];
}

- (void).cxx_destruct
{
}

@end