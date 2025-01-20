@interface _PHVariationInMemoryCachedValue
- (BOOL)isValid;
- (NSDate)expectedDate;
- (NSDictionary)info;
- (NSURL)fileURL;
- (_PHVariationInMemoryCachedValue)initWithInfo:(id)a3 fileURL:(id)a4;
- (id)_currentFileModificationDate;
@end

@implementation _PHVariationInMemoryCachedValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSDictionary)info
{
  return self->_info;
}

- (BOOL)isValid
{
  v3 = [(_PHVariationInMemoryCachedValue *)self _currentFileModificationDate];
  v4 = [(_PHVariationInMemoryCachedValue *)self expectedDate];
  char v5 = [v4 isEqualToDate:v3];

  return v5;
}

- (id)_currentFileModificationDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(_PHVariationInMemoryCachedValue *)self fileURL];
  char v5 = [v4 path];
  id v12 = 0;
  v6 = [v3 attributesOfItemAtPath:v5 error:&v12];
  id v7 = v12;

  if (v7)
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(_PHVariationInMemoryCachedValue *)self fileURL];
      *(_DWORD *)buf = 138412802;
      v14 = self;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%@: error reading file attributes of file at %@ (%@)", buf, 0x20u);
    }
  }
  v10 = [v6 fileModificationDate];

  return v10;
}

- (_PHVariationInMemoryCachedValue)initWithInfo:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_PHVariationInMemoryCachedValue;
  v8 = [(_PHVariationInMemoryCachedValue *)&v15 init];
  if (!v8)
  {
LABEL_5:
    v9 = v8;
    goto LABEL_6;
  }
  v9 = 0;
  if (v6 && v7)
  {
    uint64_t v10 = [v6 copy];
    info = v8->_info;
    v8->_info = (NSDictionary *)v10;

    objc_storeStrong((id *)&v8->_fileURL, a4);
    uint64_t v12 = [(_PHVariationInMemoryCachedValue *)v8 _currentFileModificationDate];
    expectedDate = v8->_expectedDate;
    v8->_expectedDate = (NSDate *)v12;

    if (!v8->_expectedDate)
    {
      v9 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

@end