@interface ML3UpdateArtworkInterestDataOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3;
- (unint64_t)type;
@end

@implementation ML3UpdateArtworkInterestDataOperation

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ML3UpdateArtworkInterestDataOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v13, sel__verifyLibraryConnectionAndAttributesProperties_))return 0; {
  v5 = [(ML3DatabaseOperation *)self attributes];
  }
  v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeArtworkTokenKey"];

  v7 = [(ML3DatabaseOperation *)self attributes];
  v8 = [v7 objectForKey:@"MLDatabaseOperationAttributeArtworkInterestDataKey"];

  objc_opt_class();
  BOOL v9 = (objc_opt_isKindOfClass() & 1) != 0 && [v6 length] != 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  BOOL v10 = v9 & isKindOfClass;
  if (a3 && !v10)
  {
    *a3 = +[ML3MediaLibraryWriter writerErrorWithCode:500 description:@"ML3UpdateArtworkInterestDataOperation requires an artworkToken attribute and an artwork interest data blob"];
  }

  return v10;
}

- (BOOL)_execute:(id *)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v5 = [(ML3DatabaseOperation *)self attributes];
  v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeArtworkTokenKey"];

  v7 = [(ML3DatabaseOperation *)self attributes];
  v8 = [v7 objectForKey:@"MLDatabaseOperationAttributeArtworkInterestDataKey"];

  BOOL v9 = [(ML3DatabaseOperation *)self transaction];
  BOOL v10 = [v9 connection];

  v22[0] = v8;
  v22[1] = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v17 = 0;
  char v12 = [v10 executeUpdate:@"UPDATE artwork SET interest_data = ? WHERE artwork_token = ?" withParameters:v11 error:&v17];
  id v13 = v17;

  if ((v12 & 1) == 0)
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "Failed to save interest data to database for artwork_token %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
  id v15 = v13;
  *a3 = v15;

  return v12;
}

- (unint64_t)type
{
  return 5;
}

@end