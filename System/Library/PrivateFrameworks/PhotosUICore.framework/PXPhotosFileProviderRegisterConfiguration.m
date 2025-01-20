@interface PXPhotosFileProviderRegisterConfiguration
+ (NSString)typeIdentifierAutoLoopAsGIFPrivate;
+ (NSString)typeIdentifierLivePhotoBundlePrivate;
+ (NSString)typeIdentifierLiveWallpaperPrivate;
+ (NSString)typeIdentifierMailMovieExportPrivate;
+ (NSString)typeIdentifierThumbnailLowPrivate;
+ (NSString)typeIdentifierThumbnailStandardPrivate;
- (BOOL)isLiveWallpaperSelection;
- (BOOL)shouldIncludeCaption;
- (BOOL)shouldIncludeLocation;
- (NSNumber)downscalingTargetDimension;
- (PXPhotosFileProviderRegisterConfiguration)init;
- (PXPhotosFileProviderRegisterConfiguration)initWithUsage:(int64_t)a3;
- (int64_t)clientEncodingPolicy;
- (int64_t)usage;
- (int64_t)userEncodingPolicy;
- (void)setClientEncodingPolicy:(int64_t)a3;
- (void)setDownscalingTargetDimension:(id)a3;
- (void)setIsLiveWallpaperSelection:(BOOL)a3;
- (void)setShouldIncludeCaption:(BOOL)a3;
- (void)setShouldIncludeLocation:(BOOL)a3;
- (void)setUserEncodingPolicy:(int64_t)a3;
@end

@implementation PXPhotosFileProviderRegisterConfiguration

+ (NSString)typeIdentifierLivePhotoBundlePrivate
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

+ (NSString)typeIdentifierAutoLoopAsGIFPrivate
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

+ (NSString)typeIdentifierLiveWallpaperPrivate
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

+ (NSString)typeIdentifierThumbnailLowPrivate
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

+ (NSString)typeIdentifierThumbnailStandardPrivate
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

+ (NSString)typeIdentifierMailMovieExportPrivate
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (int64_t)usage
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_usage);
}

- (int64_t)userEncodingPolicy
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_userEncodingPolicy);
  swift_beginAccess();
  return *v2;
}

- (void)setUserEncodingPolicy:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_userEncodingPolicy);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)clientEncodingPolicy
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_clientEncodingPolicy);
  swift_beginAccess();
  return *v2;
}

- (void)setClientEncodingPolicy:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_clientEncodingPolicy);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)shouldIncludeLocation
{
  v2 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeLocation;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIncludeLocation:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeLocation;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldIncludeCaption
{
  v2 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeCaption;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIncludeCaption:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeCaption;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSNumber)downscalingTargetDimension
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_downscalingTargetDimension);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setDownscalingTargetDimension:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_downscalingTargetDimension);
  swift_beginAccess();
  v5 = *v4;
  BOOL *v4 = a3;
  id v6 = a3;
}

- (BOOL)isLiveWallpaperSelection
{
  v2 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_isLiveWallpaperSelection;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLiveWallpaperSelection:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_isLiveWallpaperSelection;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (PXPhotosFileProviderRegisterConfiguration)initWithUsage:(int64_t)a3
{
  return (PXPhotosFileProviderRegisterConfiguration *)PhotosFileProviderRegister.Configuration.init(usage:)(a3);
}

- (PXPhotosFileProviderRegisterConfiguration)init
{
  result = (PXPhotosFileProviderRegisterConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_downscalingTargetDimension));
  sub_1AA94DA10((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_livePhotoContentType, (uint64_t (*)(void))sub_1AA9417CC);
  sub_1AA94DA10((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_autoLoopAsGIFContentType, (uint64_t (*)(void))sub_1AA9417CC);
  sub_1AA94DA10((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_liveWallpaperContentType, (uint64_t (*)(void))sub_1AA9417CC);
  sub_1AA94DA10((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_thumbnailLowContentType, (uint64_t (*)(void))sub_1AA9417CC);
  sub_1AA94DA10((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_thumbnailStandardContentType, (uint64_t (*)(void))sub_1AA9417CC);
  sub_1AA94DA10((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_mailMovieExportContentType, (uint64_t (*)(void))sub_1AA9417CC);
}

@end