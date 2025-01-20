@interface _NTKImageListPhotosReader
- (_NTKImageListPhotosReader)initWithResourceDirectory:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _NTKImageListPhotosReader

- (_NTKImageListPhotosReader)initWithResourceDirectory:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_NTKImageListPhotosReader;
  v5 = [(NTKPhotosReader *)&v24 initWithResourceDirectory:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    photos = v5->_photos;
    v5->_photos = (NSMutableArray *)v6;

    if (v4)
    {
      v8 = [v4 stringByAppendingPathComponent:@"Images.plist"];
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v8];
      v10 = v9;
      if (v9)
      {
        v11 = [v9 objectForKeyedSubscript:@"assetCollection"];
        [(NTKPhotosReader *)v5 setAssetCollectionIdentifier:v11];

        v12 = [v10 objectForKeyedSubscript:@"imageList"];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          v19 = v8;
          uint64_t v15 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = +[NTKPhoto decodeFromDictionary:*(void *)(*((void *)&v20 + 1) + 8 * i) forResourceDirectory:v4];
              if (v17) {
                [(NSMutableArray *)v5->_photos addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
          }
          while (v14);
          v8 = v19;
        }
      }
      else
      {
        v12 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[_NTKImageListPhotosReader initWithResourceDirectory:]();
        }
      }
    }
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_photos count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_photos count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)initWithResourceDirectory:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "%@: cannot read image list from %@", v4, v5, v6, v7, v8);
}

@end