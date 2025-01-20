@interface TPSLinkedDocument
+ (BOOL)supportsSecureCoding;
+ (id)linkedDocumentFromDictionary:(id)a3;
- (NSString)bundleId;
- (NSString)documentId;
- (NSString)platform;
- (NSString)product;
- (NSString)productVersion;
- (TPSLinkedDocument)init;
- (TPSLinkedDocument)initWithCoder:(id)a3;
- (TPSLinkedDocument)initWithDictionary:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDocumentId:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setProduct:(id)a3;
- (void)setProductVersion:(id)a3;
@end

@implementation TPSLinkedDocument

- (NSString)bundleId
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

- (void)setBundleId:(id)a3
{
}

- (NSString)documentId
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

- (void)setDocumentId:(id)a3
{
}

- (NSString)platform
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_platform);
}

- (void)setPlatform:(id)a3
{
}

- (NSString)product
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_product);
}

- (void)setProduct:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

- (void)setProductVersion:(id)a3
{
}

+ (id)linkedDocumentFromDictionary:(id)a3
{
  uint64_t v3 = sub_19C9767F0();
  uint64_t v4 = _s8TipsCore14LinkedDocumentC06linkedD14FromDictionary10dictionarySDys11AnyHashableVypGSgAH_tFZ_0(v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = (void *)sub_19C9767E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSLinkedDocument)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_19C9767F0();
  return (TPSLinkedDocument *)sub_19C937328(v3);
}

- (TPSLinkedDocument)initWithCoder:(id)a3
{
  return (TPSLinkedDocument *)sub_19C9379CC(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19C937D2C(v4);
}

- (id)copyWithZone:(void *)a3
{
  id v4 = self;
  sub_19C9380CC((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_0(v7, (uint64_t)v7[3]);
  v5 = (void *)sub_19C976FA0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (TPSLinkedDocument)init
{
  result = (TPSLinkedDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end