@interface PXVideoFormatMetadata
- (BOOL)isProResLog;
- (_TtC12PhotosUICore21PXVideoFormatMetadata)init;
- (unint64_t)videoHDRType;
@end

@implementation PXVideoFormatMetadata

- (unint64_t)videoHDRType
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC12PhotosUICore21PXVideoFormatMetadata_videoHDRType);
}

- (BOOL)isProResLog
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore21PXVideoFormatMetadata_isProResLog);
}

- (_TtC12PhotosUICore21PXVideoFormatMetadata)init
{
  result = (_TtC12PhotosUICore21PXVideoFormatMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end