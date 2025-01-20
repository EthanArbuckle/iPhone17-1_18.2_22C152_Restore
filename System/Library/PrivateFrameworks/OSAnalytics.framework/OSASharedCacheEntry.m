@interface OSASharedCacheEntry
- (BOOL)isDefaultSharedCache;
- (char)sharedCacheUuid;
- (dyld_shared_cache_loadinfo_v2)original;
- (dyld_uuid_info_64)layout;
- (unint64_t)sharedCacheSlide;
- (unint64_t)sharedCacheUnreliableSlidBaseAddress;
- (unsigned)layoutImageCount;
- (unsigned)sharedCacheID;
- (void)setSharedCacheInfo:(dyld_shared_cache_loadinfo_v2 *)a3;
- (void)setSharedCacheLayout:(dyld_uuid_info_64 *)a3 andCount:(unsigned int)a4;
@end

@implementation OSASharedCacheEntry

- (void)setSharedCacheInfo:(dyld_shared_cache_loadinfo_v2 *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  uuid_unparse(a3->sharedCacheUUID, v5);
  self->_sharedCacheUuid = (char (*)[37])v5;
  self->_sharedCacheID = a3->sharedCacheID;
  self->_sharedCacheSlide = a3->sharedCacheSlide;
  self->_sharedCacheUnreliableSlidBaseAddress = a3->sharedCacheUnreliableSlidBaseAddress;
  self->_original = a3;
  self->_isDefaultSharedCache = a3->sharedCacheFlags == 1;
}

- (void)setSharedCacheLayout:(dyld_uuid_info_64 *)a3 andCount:(unsigned int)a4
{
  self->_layout = a3;
  self->_layoutImageCount = a4;
}

- (unsigned)sharedCacheID
{
  return self->_sharedCacheID;
}

- (unint64_t)sharedCacheSlide
{
  return self->_sharedCacheSlide;
}

- (unint64_t)sharedCacheUnreliableSlidBaseAddress
{
  return self->_sharedCacheUnreliableSlidBaseAddress;
}

- (char)sharedCacheUuid
{
  return self->_sharedCacheUuid;
}

- (BOOL)isDefaultSharedCache
{
  return self->_isDefaultSharedCache;
}

- (dyld_shared_cache_loadinfo_v2)original
{
  return self->_original;
}

- (dyld_uuid_info_64)layout
{
  return self->_layout;
}

- (unsigned)layoutImageCount
{
  return self->_layoutImageCount;
}

@end