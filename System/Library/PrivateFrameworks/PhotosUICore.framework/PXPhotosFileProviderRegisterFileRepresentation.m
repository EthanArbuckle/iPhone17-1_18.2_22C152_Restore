@interface PXPhotosFileProviderRegisterFileRepresentation
- (BOOL)hasLimitedVisibility;
- (BOOL)isThumbnail;
- (NSString)identifierCode;
- (NSString)uuid;
- (NSURL)fileProviderURL;
- (PXPhotosFileProviderRegisterFileRepresentation)init;
- (UTType)contentType;
@end

@implementation PXPhotosFileProviderRegisterFileRepresentation

- (NSURL)fileProviderURL
{
  v2 = (void *)sub_1AB23049C();
  return (NSURL *)v2;
}

- (UTType)contentType
{
  v2 = (void *)sub_1AB23550C();
  return (UTType *)v2;
}

- (BOOL)hasLimitedVisibility
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_hasLimitedVisibility);
}

- (NSString)uuid
{
}

- (NSString)identifierCode
{
}

- (BOOL)isThumbnail
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_isThumbnail);
}

- (PXPhotosFileProviderRegisterFileRepresentation)init
{
  result = (PXPhotosFileProviderRegisterFileRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_fileProviderURL;
  uint64_t v4 = sub_1AB2305AC();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_contentType;
  uint64_t v6 = sub_1AB23560C();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end