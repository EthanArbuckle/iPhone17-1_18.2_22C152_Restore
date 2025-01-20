@interface PXImportImageCacheIdentifier
- (NSString)assetUuid;
- (int64_t)cacheIndex;
- (unint64_t)sizeType;
- (void)setAssetUuid:(id)a3;
- (void)setCacheIndex:(int64_t)a3;
- (void)setSizeType:(unint64_t)a3;
@end

@implementation PXImportImageCacheIdentifier

- (void).cxx_destruct
{
}

- (void)setCacheIndex:(int64_t)a3
{
  self->_cacheIndex = a3;
}

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

- (void)setSizeType:(unint64_t)a3
{
  self->_sizeType = a3;
}

- (unint64_t)sizeType
{
  return self->_sizeType;
}

- (void)setAssetUuid:(id)a3
{
}

- (NSString)assetUuid
{
  return self->_assetUuid;
}

@end