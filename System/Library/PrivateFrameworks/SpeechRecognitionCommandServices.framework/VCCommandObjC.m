@interface VCCommandObjC
+ (id)allCommandIdentifiers;
+ (id)allCommandIdentifiersForCurrentDevice;
+ (id)commandWithIdentifier:(id)a3;
- (NSDictionary)commandProperties;
- (NSString)commandIdentifier;
- (VCCommandObjC)init;
@end

@implementation VCCommandObjC

+ (id)allCommandIdentifiers
{
  return sub_23ABAEE14((uint64_t)a1, (uint64_t)a2, &qword_268A5AB38, (unint64_t)&qword_268A5AB40);
}

+ (id)allCommandIdentifiersForCurrentDevice
{
  return sub_23ABAEE14((uint64_t)a1, (uint64_t)a2, &qword_268A5AB48, (unint64_t)&qword_268A5AB50);
}

+ (id)commandWithIdentifier:(id)a3
{
  uint64_t v3 = sub_23AC2A550();
  v5 = (void *)_sSo13VCCommandObjCC32SpeechRecognitionCommandServicesE7command14withIdentifierABSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)commandIdentifier
{
  sub_23ABB4C5C((uint64_t)self + OBJC_IVAR___VCCommandObjC_representedCommand, (uint64_t)v4);
  sub_23ABB4C5C((uint64_t)v4, (uint64_t)&v5);
  result = (NSString *)sub_23ABB4CC4((uint64_t)&v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_23AC2A540();
    swift_bridgeObjectRelease();
    return (NSString *)v3;
  }
  return result;
}

- (NSDictionary)commandProperties
{
  v2 = self;
  VCCommandObjC.commandProperties.getter();

  uint64_t v3 = (void *)sub_23AC2A4E0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (VCCommandObjC)init
{
  uint64_t v3 = (char *)self + OBJC_IVAR___VCCommandObjC_representedCommand;
  sub_23ABB4C3C((uint64_t)v6);
  sub_23ABB4C5C((uint64_t)v6, (uint64_t)v3);
  v5.receiver = self;
  v5.super_class = (Class)VCCommandObjC;
  return [(VCCommandObjC *)&v5 init];
}

- (void).cxx_destruct
{
  sub_23ABB4C5C((uint64_t)self + OBJC_IVAR___VCCommandObjC_representedCommand, (uint64_t)v2);
  sub_23ABB4CDC(v2);
}

@end