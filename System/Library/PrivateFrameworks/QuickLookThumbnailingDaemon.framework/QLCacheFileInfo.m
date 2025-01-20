@interface QLCacheFileInfo
- (QLCacheFileInfo)initWithCacheId:(unint64_t)a3 versionedFileIdentifier:(id)a4;
- (QLCacheFileInfo)initWithCacheId:(unint64_t)a3 versionedFileIdentifier:(id)a4 thumbnailCount:(unint64_t)a5 minSize:(float)a6 maxSize:(float)a7 totalDataLength:(unint64_t)a8;
- (QLCacheVersionedFileIdentifier)fileIdentifier;
- (float)maxSize;
- (float)minSize;
- (unint64_t)cacheId;
- (unint64_t)thumbnailCount;
- (unint64_t)totalDataLength;
@end

@implementation QLCacheFileInfo

- (QLCacheFileInfo)initWithCacheId:(unint64_t)a3 versionedFileIdentifier:(id)a4 thumbnailCount:(unint64_t)a5 minSize:(float)a6 maxSize:(float)a7 totalDataLength:(unint64_t)a8
{
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)QLCacheFileInfo;
  v16 = [(QLCacheFileInfo *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_cacheId = a3;
    objc_storeStrong((id *)&v16->_fileIdentifier, a4);
    v17->_minSize = a6;
    v17->_maxSize = a7;
    v17->_thumbnailCount = a5;
    v17->_totalDataLength = a8;
  }

  return v17;
}

- (QLCacheFileInfo)initWithCacheId:(unint64_t)a3 versionedFileIdentifier:(id)a4
{
  return [(QLCacheFileInfo *)self initWithCacheId:a3 versionedFileIdentifier:a4 thumbnailCount:0 minSize:0 maxSize:0.0 totalDataLength:0.0];
}

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (QLCacheVersionedFileIdentifier)fileIdentifier
{
  return self->_fileIdentifier;
}

- (unint64_t)thumbnailCount
{
  return self->_thumbnailCount;
}

- (float)minSize
{
  return self->_minSize;
}

- (float)maxSize
{
  return self->_maxSize;
}

- (unint64_t)totalDataLength
{
  return self->_totalDataLength;
}

- (void).cxx_destruct
{
}

@end