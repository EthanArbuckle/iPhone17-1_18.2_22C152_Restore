@interface NTKPhotosReader
+ (id)readerForMemoriesWithResourceDirectory:(id)a3;
+ (id)readerForResourceDirectory:(id)a3;
+ (id)readerForSyncedAlbumWithResourceDirectory:(id)a3;
- (NSString)assetCollectionIdentifier;
- (NSString)resourceDirectory;
- (NTKPhotosReader)initWithResourceDirectory:(id)a3;
- (NTKPhotosReaderDelegate)delegate;
- (id)firstObject;
- (id)lastObject;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)mutationCount;
- (void)setAssetCollectionIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMutationCount:(unint64_t)a3;
@end

@implementation NTKPhotosReader

- (NTKPhotosReader)initWithResourceDirectory:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPhotosReader;
  v5 = [(NTKPhotosReader *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
      resourceDirectory = v5->_resourceDirectory;
      v5->_resourceDirectory = (NSString *)v6;
    }
    assetCollectionIdentifier = v5->_assetCollectionIdentifier;
    v5->_assetCollectionIdentifier = 0;
  }
  return v5;
}

+ (id)readerForResourceDirectory:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v11];
  id v6 = v11;
  if (v6)
  {
    v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[NTKPhotosReader readerForResourceDirectory:]();
    }

    goto LABEL_5;
  }
  if ([v5 containsObject:@"Info.plist"])
  {
    v9 = _NTKLegacySidecarPhotosReader;
  }
  else
  {
    if (![v5 containsObject:@"Images.plist"])
    {
LABEL_5:
      v8 = 0;
      goto LABEL_11;
    }
    v9 = _NTKImageListPhotosReader;
  }
  v8 = (void *)[[v9 alloc] initWithResourceDirectory:v3];
LABEL_11:

  return v8;
}

+ (id)readerForSyncedAlbumWithResourceDirectory:(id)a3
{
  id v3 = a3;
  id v4 = [[_NTKImageListPhotosReader alloc] initWithResourceDirectory:v3];

  return v4;
}

+ (id)readerForMemoriesWithResourceDirectory:(id)a3
{
  id v3 = a3;
  id v4 = [[_NTKImageListPhotosReader alloc] initWithResourceDirectory:v3];

  return v4;
}

- (unint64_t)count
{
  return 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)firstObject
{
  id v3 = [(NTKPhotosReader *)self count];
  if (v3)
  {
    id v3 = [(NTKPhotosReader *)self objectAtIndex:0];
  }

  return v3;
}

- (id)lastObject
{
  id v3 = [(NTKPhotosReader *)self count];
  if (v3)
  {
    id v3 = [(NTKPhotosReader *)self objectAtIndex:[(NTKPhotosReader *)self count] - 1];
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  a3->var2 = &self->_mutationCount;
  a3->var0 = 1;
  unint64_t v8 = a3->var3[0];
  unint64_t v9 = v8 + a5;
  if (v8 + a5 > [(NTKPhotosReader *)self count]) {
    unint64_t v9 = [(NTKPhotosReader *)self count];
  }
  unint64_t v10 = v9 - v8;
  if (v9 > v8)
  {
    id v11 = a4;
    do
      *v11++ = [(NTKPhotosReader *)self objectAtIndex:v8++];
    while (v9 != v8);
  }
  a3->var3[0] = v9;
  a3->var1 = a4;
  return v10;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (NTKPhotosReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKPhotosReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)assetCollectionIdentifier
{
  return self->_assetCollectionIdentifier;
}

- (void)setAssetCollectionIdentifier:(id)a3
{
}

- (unint64_t)mutationCount
{
  return self->_mutationCount;
}

- (void)setMutationCount:(unint64_t)a3
{
  self->_mutationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_resourceDirectory, 0);
}

+ (void)readerForResourceDirectory:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "%@: cannot read contents of %@", v4, v5, v6, v7, v8);
}

@end