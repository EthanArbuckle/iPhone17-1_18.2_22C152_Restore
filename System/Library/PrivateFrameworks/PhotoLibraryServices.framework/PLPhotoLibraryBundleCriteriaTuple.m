@interface PLPhotoLibraryBundleCriteriaTuple
- (BOOL)isEqual:(id)a3;
- (PLBackgroundJobCriteria)criteria;
- (PLPhotoLibraryBundle)bundle;
- (PLPhotoLibraryBundleCriteriaTuple)initWithBundle:(id)a3 withCriteria:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PLPhotoLibraryBundleCriteriaTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (PLBackgroundJobCriteria)criteria
{
  return self->_criteria;
}

- (PLPhotoLibraryBundle)bundle
{
  return self->_bundle;
}

- (unint64_t)hash
{
  v3 = [(PLPhotoLibraryBundleCriteriaTuple *)self bundle];
  v4 = [v3 libraryURL];
  uint64_t v5 = [v4 hash];
  v6 = [(PLPhotoLibraryBundleCriteriaTuple *)self criteria];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLPhotoLibraryBundleCriteriaTuple *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PLPhotoLibraryBundleCriteriaTuple;
    if ([(PLPhotoLibraryBundleCriteriaTuple *)&v15 isEqual:v4])
    {
      uint64_t v5 = [(PLPhotoLibraryBundleCriteriaTuple *)self bundle];
      v6 = [v5 libraryURL];
      unint64_t v7 = [v6 absoluteString];
      v8 = [(PLPhotoLibraryBundleCriteriaTuple *)v4 bundle];
      v9 = [v8 libraryURL];
      v10 = [v9 absoluteString];
      if ([v7 isEqualToString:v10])
      {
        v11 = [(PLPhotoLibraryBundleCriteriaTuple *)self criteria];
        v12 = [(PLPhotoLibraryBundleCriteriaTuple *)v4 criteria];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLBackgroundJobCriteria *)self->_criteria shortCode];
  uint64_t v5 = [v3 stringWithFormat:@"[%@] - %@", v4, self->_bundle];

  return v5;
}

- (PLPhotoLibraryBundleCriteriaTuple)initWithBundle:(id)a3 withCriteria:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoLibraryBundleCriteriaTuple;
  v9 = [(PLPhotoLibraryBundleCriteriaTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a3);
    objc_storeStrong((id *)&v10->_criteria, a4);
  }

  return v10;
}

@end