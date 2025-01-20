@interface TRIFetchOptions
+ (id)optionsWithDownloadOptions:(id)a3 cacheDeleteAvailableSpaceClass:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (NSNumber)cacheDeleteAvailableSpaceClass;
- (TRIDownloadOptions)downloadOptions;
- (TRIFetchOptions)initWithDownloadOptions:(id)a3 cacheDeleteAvailableSpaceClass:(id)a4;
- (id)copyWithReplacementCacheDeleteAvailableSpaceClass:(id)a3;
- (id)copyWithReplacementDownloadOptions:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIFetchOptions

- (TRIFetchOptions)initWithDownloadOptions:(id)a3 cacheDeleteAvailableSpaceClass:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4647, @"Invalid parameter not satisfying: %@", @"downloadOptions != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4648, @"Invalid parameter not satisfying: %@", @"cacheDeleteAvailableSpaceClass != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIFetchOptions;
  v11 = [(TRIFetchOptions *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downloadOptions, a3);
    objc_storeStrong((id *)&v12->_cacheDeleteAvailableSpaceClass, a4);
  }

  return v12;
}

+ (id)optionsWithDownloadOptions:(id)a3 cacheDeleteAvailableSpaceClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDownloadOptions:v7 cacheDeleteAvailableSpaceClass:v6];

  return v8;
}

- (id)copyWithReplacementDownloadOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDownloadOptions:v4 cacheDeleteAvailableSpaceClass:self->_cacheDeleteAvailableSpaceClass];

  return v5;
}

- (id)copyWithReplacementCacheDeleteAvailableSpaceClass:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDownloadOptions:self->_downloadOptions cacheDeleteAvailableSpaceClass:v4];

  return v5;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_downloadOptions != 0;
  id v7 = [v4 downloadOptions];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  downloadOptions = self->_downloadOptions;
  if (downloadOptions)
  {
    v10 = [v5 downloadOptions];
    int v11 = [(TRIDownloadOptions *)downloadOptions isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_cacheDeleteAvailableSpaceClass != 0;
  v13 = [v5 cacheDeleteAvailableSpaceClass];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    cacheDeleteAvailableSpaceClass = self->_cacheDeleteAvailableSpaceClass;
    if (cacheDeleteAvailableSpaceClass)
    {
      objc_super v16 = [v5 cacheDeleteAvailableSpaceClass];
      char v17 = [(NSNumber *)cacheDeleteAvailableSpaceClass isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFetchOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFetchOptions *)self isEqualToOptions:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIDownloadOptions *)self->_downloadOptions hash];
  return [(NSNumber *)self->_cacheDeleteAvailableSpaceClass hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIFetchOptions | downloadOptions:%@ cacheDeleteAvailableSpaceClass:%@>", self->_downloadOptions, self->_cacheDeleteAvailableSpaceClass];
  return v2;
}

- (TRIDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  return self->_cacheDeleteAvailableSpaceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
}

@end