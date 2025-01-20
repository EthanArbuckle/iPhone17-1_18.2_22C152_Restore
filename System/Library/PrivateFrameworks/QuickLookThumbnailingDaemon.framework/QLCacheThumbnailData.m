@interface QLCacheThumbnailData
- (BOOL)hasData;
- (BOOL)iconMode;
- (BOOL)setState:(unint64_t)a3;
- (BOOL)setState:(unint64_t)a3 changedState:(BOOL *)a4;
- (CGRect)contentRect;
- (NSData)bitmapData;
- (NSData)metadata;
- (NSDate)lastHitDate;
- (QLCacheBlobInfo)bitmapDataToValidate;
- (QLCacheBlobInfo)metadataToValidate;
- (QLCacheFileIdentifier)fileIdentifier;
- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 fileIdentifier:(id)a4 version:(id)a5 size:(float)a6 iconMode:(BOOL)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 badgeType:(unint64_t)a10 externalGeneratorDataHash:(unint64_t)a11 hitCount:(unint64_t)a12 lastHitDate:(id)a13;
- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 fileIdentifier:(id)a4 version:(id)a5 size:(float)a6 iconMode:(BOOL)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 hitCount:(unint64_t)a10 lastHitDate:(id)a11 bitmapFormat:(id)a12 bitmapData:(id)a13 metadata:(id)a14 flavor:(int)a15 contentRect:(CGRect)a16 badgeType:(unint64_t)a17 externalGeneratorDataHash:(unint64_t)a18;
- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 thumbnailRequest:(id)a4 size:(float)a5 badgeType:(unint64_t)a6;
- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 thumbnailRequest:(id)a4 size:(float)a5 bitmapFormat:(id)a6 bitmapData:(id)a7 metadata:(id)a8 flavor:(int)a9 contentRect:(CGRect)a10 badgeType:(unint64_t)a11;
- (QLCacheThumbnailData)initWithUnsavedDataForThumbnailRequest:(id)a3 size:(float)a4 bitmapFormat:(id)a5 bitmapData:(id)a6 reservationInfo:(id)a7 metadata:(id)a8 reservationInfo:(id)a9 flavor:(int)a10 contentRect:(CGRect)a11 badgeType:(unint64_t)a12;
- (QLTBitmapFormat)bitmapFormat;
- (QLThumbnailVersion)version;
- (float)size;
- (int)flavor;
- (int)interpolationQuality;
- (int64_t)iconVariant;
- (unint64_t)badgeType;
- (unint64_t)cacheId;
- (unint64_t)externalGeneratorDataHash;
- (unint64_t)hitCount;
- (unint64_t)state;
- (unint64_t)totalBufferSize;
- (void)dealloc;
- (void)setBitmapDataToValidate:(id)a3;
- (void)setMetadataToValidate:(id)a3;
@end

@implementation QLCacheThumbnailData

- (NSData)bitmapData
{
  return self->_bitmapData;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 thumbnailRequest:(id)a4 size:(float)a5 bitmapFormat:(id)a6 bitmapData:(id)a7 metadata:(id)a8 flavor:(int)a9 contentRect:(CGRect)a10 badgeType:(unint64_t)a11
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  id v33 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  v36 = [v21 fileIdentifier];
  v22 = [v36 fileIdentifier];
  v23 = [v21 fileIdentifier];
  v24 = [v23 version];
  uint64_t v25 = [v21 iconMode];
  uint64_t v26 = [v21 iconVariant];
  uint64_t v27 = [v21 interpolationQuality];
  uint64_t v28 = [v21 externalThumbnailGeneratorDataHash];

  LODWORD(v32) = a9;
  *(float *)&double v29 = a5;
  v30 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:](self, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", a3, v22, v24, v25, v26, v27, v29, x, y, width, height, 0, 0, v20, v19, v33,
          v32,
          a11,
          v28);

  return v30;
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 fileIdentifier:(id)a4 version:(id)a5 size:(float)a6 iconMode:(BOOL)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 hitCount:(unint64_t)a10 lastHitDate:(id)a11 bitmapFormat:(id)a12 bitmapData:(id)a13 metadata:(id)a14 flavor:(int)a15 contentRect:(CGRect)a16 badgeType:(unint64_t)a17 externalGeneratorDataHash:(unint64_t)a18
{
  CGFloat height = a16.size.height;
  CGFloat width = a16.size.width;
  CGFloat y = a16.origin.y;
  CGFloat x = a16.origin.x;
  id v27 = a4;
  id obj = a5;
  id v28 = a5;
  id v29 = a11;
  id v30 = a12;
  id v31 = a13;
  id v41 = a14;
  v42.receiver = self;
  v42.super_class = (Class)QLCacheThumbnailData;
  uint64_t v32 = [(QLCacheThumbnailData *)&v42 init];
  id v33 = v32;
  if (v32)
  {
    v32->_cacheId = a3;
    objc_storeStrong((id *)&v32->_fileIdentifier, a4);
    objc_storeStrong((id *)&v33->_version, obj);
    v33->_size = a6;
    v33->_iconMode = a7;
    v33->_interpolationQualitCGFloat y = a9;
    v33->_iconVariant = a8;
    v33->_badgeType = a17;
    v33->_hitCount = a10;
    objc_storeStrong((id *)&v33->_lastHitDate, a11);
    objc_storeStrong((id *)&v33->_bitmapFormat, a12);
    objc_storeStrong((id *)&v33->_bitmapData, a13);
    objc_storeStrong((id *)&v33->_metadata, a14);
    v33->_flavor = a15;
    v33->_contentRect.origin.CGFloat x = x;
    v33->_contentRect.origin.CGFloat y = y;
    v33->_contentRect.size.CGFloat width = width;
    v33->_contentRect.size.CGFloat height = height;
    v33->_externalGeneratorDataHash = a18;
    dispatch_queue_t v34 = dispatch_queue_create("quicklookd.thumbnail", 0);
    queue = v33->_queue;
    v33->_queue = (OS_dispatch_queue *)v34;

    v33->_state = a3 != 0;
  }

  return v33;
}

- (BOOL)hasData
{
  return self->_bitmapData != 0;
}

- (int)flavor
{
  return self->_flavor;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (QLTBitmapFormat)bitmapFormat
{
  return self->_bitmapFormat;
}

- (float)size
{
  return self->_size;
}

- (QLCacheFileIdentifier)fileIdentifier
{
  return self->_fileIdentifier;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)QLCacheThumbnailData;
  [(QLCacheThumbnailData *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHitDate, 0);
  objc_storeStrong((id *)&self->_metadataToValidate, 0);
  objc_storeStrong((id *)&self->_bitmapDataToValidate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bitmapData, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 fileIdentifier:(id)a4 version:(id)a5 size:(float)a6 iconMode:(BOOL)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 badgeType:(unint64_t)a10 externalGeneratorDataHash:(unint64_t)a11 hitCount:(unint64_t)a12 lastHitDate:(id)a13
{
  BOOL v13 = a7;
  id v19 = a13;
  id v20 = a5;
  id v21 = a4;
  v22 = objc_opt_new();
  LODWORD(v26) = 0;
  *(float *)&double v23 = a6;
  v24 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:](self, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", a3, v21, v20, v13, a8, a9, v23, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), a12, v19, v22, 0, 0,
          v26,
          a10,
          a11);

  return v24;
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 thumbnailRequest:(id)a4 size:(float)a5 badgeType:(unint64_t)a6
{
  id v10 = a4;
  v11 = objc_opt_new();
  *(float *)&double v12 = a5;
  BOOL v13 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:](self, "initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:", a3, v10, v11, 0, 0, 0, v12, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), a6);

  return v13;
}

- (QLCacheThumbnailData)initWithUnsavedDataForThumbnailRequest:(id)a3 size:(float)a4 bitmapFormat:(id)a5 bitmapData:(id)a6 reservationInfo:(id)a7 metadata:(id)a8 reservationInfo:(id)a9 flavor:(int)a10 contentRect:(CGRect)a11 badgeType:(unint64_t)a12
{
  double height = a11.size.height;
  double width = a11.size.width;
  double y = a11.origin.y;
  double x = a11.origin.x;
  id v29 = a7;
  id v24 = a9;
  *(float *)&double v25 = a4;
  uint64_t v26 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:](self, "initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:", 0, a3, a5, a6, a8, a10, v25, x, y, width, height, a12);
  id v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_bitmapDataToValidate, a7);
    objc_storeStrong((id *)&v27->_metadataToValidate, a9);
  }

  return v27;
}

- (BOOL)setState:(unint64_t)a3
{
  return [(QLCacheThumbnailData *)self setState:a3 changedState:0];
}

- (BOOL)setState:(unint64_t)a3 changedState:(BOOL *)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__QLCacheThumbnailData_setState_changedState___block_invoke;
  v7[3] = &unk_1E6D0C9D0;
  v7[6] = a4;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __46__QLCacheThumbnailData_setState_changedState___block_invoke(uint64_t a1)
{
  objc_super v2 = *(unsigned char **)(a1 + 48);
  if (v2) {
    *objc_super v2 = 1;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t result = [*(id *)(a1 + 32) state];
  if (v3 == result)
  {
    char v5 = *(unsigned char **)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (v5) {
      *char v5 = 0;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6 == 1 || v6 == 2)
    {
      uint64_t result = [*(id *)(a1 + 32) state];
      if (!result)
      {
        *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 56);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)totalBufferSize
{
  return self->_totalBufferSize;
}

- (QLThumbnailVersion)version
{
  return self->_version;
}

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (QLCacheBlobInfo)bitmapDataToValidate
{
  return self->_bitmapDataToValidate;
}

- (void)setBitmapDataToValidate:(id)a3
{
}

- (QLCacheBlobInfo)metadataToValidate
{
  return self->_metadataToValidate;
}

- (void)setMetadataToValidate:(id)a3
{
}

- (unint64_t)hitCount
{
  return self->_hitCount;
}

- (NSDate)lastHitDate
{
  return self->_lastHitDate;
}

@end