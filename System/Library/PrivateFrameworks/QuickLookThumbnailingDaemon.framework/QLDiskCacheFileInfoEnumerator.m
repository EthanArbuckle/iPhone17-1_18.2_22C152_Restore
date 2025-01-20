@interface QLDiskCacheFileInfoEnumerator
- (QLDiskCacheFileInfoEnumerator)initWithDiskCache:(id)a3 forUbiquitousFiles:(BOOL)a4 extraInfo:(BOOL)a5;
- (id)nextFileInfo;
@end

@implementation QLDiskCacheFileInfoEnumerator

- (QLDiskCacheFileInfoEnumerator)initWithDiskCache:(id)a3 forUbiquitousFiles:(BOOL)a4 extraInfo:(BOOL)a5
{
  result = [(QLDiskCacheEnumerator *)self initWithDiskCache:a3];
  if (result)
  {
    result->_ubiquitous = a4;
    result->_extraInfo = a5;
  }
  return result;
}

- (id)nextFileInfo
{
  uint64_t v17 = 0;
  int v16 = 0;
  uint64_t v15 = 0;
  indexEnumerator = self->_indexEnumerator;
  if (!indexEnumerator)
  {
    v4 = [(QLDiskCache *)self->super._diskCache indexDatabase];
    v5 = [v4 enumeratorForAllUbiquitousFiles:self->_ubiquitous withExtraInfo:self->_extraInfo];
    v6 = self->_indexEnumerator;
    self->_indexEnumerator = v5;

    indexEnumerator = self->_indexEnumerator;
  }
  uint64_t v18 = 0;
  id v14 = 0;
  BOOL v7 = [(QLCacheIndexDatabaseFileInfoEnumerator *)indexEnumerator nextFileWithCacheId:&v18 versionedFileIdentifier:&v14 thumbnailCount:(char *)&v17 + 4 minSize:&v17 maxSize:&v16 totalDataLength:&v15];
  id v8 = v14;
  v9 = 0;
  if (v7)
  {
    v10 = [QLCacheFileInfo alloc];
    LODWORD(v12) = v16;
    LODWORD(v11) = v17;
    v9 = [(QLCacheFileInfo *)v10 initWithCacheId:v18 versionedFileIdentifier:v8 thumbnailCount:HIDWORD(v17) minSize:v15 maxSize:v11 totalDataLength:v12];
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end