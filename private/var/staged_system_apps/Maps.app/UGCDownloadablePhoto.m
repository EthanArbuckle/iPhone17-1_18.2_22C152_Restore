@interface UGCDownloadablePhoto
- (BOOL)businessProvided;
- (BOOL)displayFullScreenPhotoGallery;
- (BOOL)highQuality;
- (BOOL)isBackgroundJoeColorCurated;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsObfuscationWhenRenderedInFullScreen;
- (BOOL)needsToBeDownloaded;
- (BOOL)useGallery;
- (GEOMapItemPhotosAttribution)attribution;
- (NSDate)dateCreated;
- (NSString)author;
- (NSString)backgroundJoeColor;
- (NSString)caption;
- (NSString)identifier;
- (NSString)licenseDescription;
- (NSURL)licenseURL;
- (NSURL)url;
- (UGCDownloadablePhoto)initWithGEORPEnrichmentImage:(id)a3;
- (UIImage)image;
- (double)sizeRatio;
- (id)bestPhotoForFrameSize:(CGSize)a3 displayScale:(double)a4 options:(id)a5;
- (id)bestPhotoForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4;
- (id)largestPhoto;
@end

@implementation UGCDownloadablePhoto

- (UGCDownloadablePhoto)initWithGEORPEnrichmentImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UGCDownloadablePhoto;
  v6 = [(UGCDownloadablePhoto *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enrichmentImage, a3);
  }

  return v7;
}

- (UIImage)image
{
  return 0;
}

- (NSURL)url
{
  id v3 = objc_alloc((Class)NSURL);
  v4 = [(GEORPEnrichmentImage *)self->_enrichmentImage url];
  id v5 = [v3 initWithString:v4];

  return (NSURL *)v5;
}

- (NSString)identifier
{
  return (NSString *)[(GEORPEnrichmentImage *)self->_enrichmentImage imageId];
}

- (BOOL)needsToBeDownloaded
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned __int8 v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    unsigned __int8 v6 = [(GEORPEnrichmentImage *)self->_enrichmentImage isEqual:v4[1]];
  }

  return v6;
}

- (NSString)author
{
  return 0;
}

- (NSString)caption
{
  return 0;
}

- (NSURL)licenseURL
{
  return 0;
}

- (BOOL)displayFullScreenPhotoGallery
{
  return 0;
}

- (BOOL)businessProvided
{
  return 0;
}

- (NSString)backgroundJoeColor
{
  return 0;
}

- (BOOL)highQuality
{
  return 0;
}

- (GEOMapItemPhotosAttribution)attribution
{
  return 0;
}

- (NSDate)dateCreated
{
  return 0;
}

- (NSString)licenseDescription
{
  return 0;
}

- (double)sizeRatio
{
  return 0.0;
}

- (BOOL)isBackgroundJoeColorCurated
{
  return 0;
}

- (BOOL)useGallery
{
  return 0;
}

- (id)bestPhotoForFrameSize:(CGSize)a3 displayScale:(double)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = [UGCUserUploadedPhotoInfo alloc];
  objc_super v9 = [(UGCDownloadablePhoto *)self url];
  v10 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v8, "initWithURL:size:", v9, width, height);

  return v10;
}

- (id)bestPhotoForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [UGCUserUploadedPhotoInfo alloc];
  v8 = [(UGCDownloadablePhoto *)self url];
  objc_super v9 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  return v9;
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [UGCUserUploadedPhotoInfo alloc];
  v8 = [(UGCDownloadablePhoto *)self url];
  objc_super v9 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  return v9;
}

- (id)largestPhoto
{
  id v3 = [UGCUserUploadedPhotoInfo alloc];
  v4 = [(UGCDownloadablePhoto *)self url];
  id v5 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v3, "initWithURL:size:", v4, CGSizeZero.width, CGSizeZero.height);

  return v5;
}

- (BOOL)needsObfuscationWhenRenderedInFullScreen
{
  return 0;
}

- (void).cxx_destruct
{
}

@end