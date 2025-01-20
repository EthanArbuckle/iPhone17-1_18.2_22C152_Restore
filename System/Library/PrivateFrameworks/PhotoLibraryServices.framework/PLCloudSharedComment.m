@interface PLCloudSharedComment
+ (id)_cloudSharedCommentsWithPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)cloudSharedCommentWithGUID:(id)a3 inLibrary:(id)a4;
+ (id)cloudSharedCommentsWithCommentDate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)cloudSharedCommentsWithGUIDs:(id)a3 inLibrary:(id)a4;
+ (id)entityName;
+ (id)insertNewCommentIntoAsset:(id)a3 commentDate:(id)a4 withText:(id)a5 isLike:(BOOL)a6 isMyComment:(BOOL)a7 inLibrary:(id)a8;
+ (id)insertNewCommentWithCommentText:(id)a3 commentDate:(id)a4 isLike:(BOOL)a5 isMyComment:(BOOL)a6 inLibrary:(id)a7;
- (BOOL)_isInterestingToUser;
- (BOOL)canBeDeletedByUser;
- (BOOL)isInterestingForAlbumsSorting;
- (BOOL)isLikeBoolValue;
- (BOOL)matchesCommentText:(id)a3 isLike:(BOOL)a4;
- (BOOL)shouldNotifyAsNotificationWithMediaStreamInfo:(id)a3 asCaptionOnly:(BOOL *)a4;
- (NSString)commenterEmail;
- (NSString)commenterFirstName;
- (NSString)commenterFullName;
- (NSString)commenterLastName;
- (PLCloudFeedCommentsEntry)cloudFeedEntry;
- (PLCloudSharedComment)init;
- (id)asset;
- (id)commenterDisplayName;
- (void)awakeFromInsert;
- (void)performDelete;
- (void)willSave;
@end

@implementation PLCloudSharedComment

- (BOOL)matchesCommentText:(id)a3 isLike:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (unint64_t)a3;
  if (v4 && [(PLCloudSharedComment *)self isLikeBoolValue]) {
    goto LABEL_6;
  }
  v7 = [(PLCloudSharedComment *)self commentText];
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  v9 = [(PLCloudSharedComment *)self commentText];
  char v10 = [v9 isEqualToString:v6];

  if ((v10 & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = [(PLCloudSharedComment *)self commentText];
    unint64_t v13 = v6 | v12;

    BOOL v11 = v13 == 0;
    goto LABEL_9;
  }
LABEL_6:
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (NSString)commenterFullName
{
  v3 = [(PLManagedObject *)self photoLibrary];
  BOOL v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedComment *)self commenterHashedPersonID];
  unint64_t v6 = [v4 fullNameForPersonID:v5];

  return (NSString *)v6;
}

- (NSString)commenterLastName
{
  v3 = [(PLManagedObject *)self photoLibrary];
  BOOL v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedComment *)self commenterHashedPersonID];
  unint64_t v6 = [v4 lastNameForPersonID:v5];

  return (NSString *)v6;
}

- (NSString)commenterFirstName
{
  v3 = [(PLManagedObject *)self photoLibrary];
  BOOL v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedComment *)self commenterHashedPersonID];
  unint64_t v6 = [v4 firstNameForPersonID:v5];

  return (NSString *)v6;
}

- (NSString)commenterEmail
{
  v3 = [(PLManagedObject *)self photoLibrary];
  BOOL v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedComment *)self commenterHashedPersonID];
  unint64_t v6 = [v4 emailForPersonID:v5];

  return (NSString *)v6;
}

- (void)performDelete
{
  if ([(PLCloudSharedComment *)self canBeDeletedByUser])
  {
    v3 = [(PLManagedObject *)self photoLibrary];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__PLCloudSharedComment_performDelete__block_invoke;
    v4[3] = &unk_1E5875CE0;
    v4[4] = self;
    [v3 performTransaction:v4];
  }
}

void __37__PLCloudSharedComment_performDelete__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asset];
  [v2 userDeleteCloudSharedComment:*(void *)(a1 + 32)];
}

- (BOOL)canBeDeletedByUser
{
  v3 = [(PLCloudSharedComment *)self isDeletable];
  if ([v3 BOOLValue])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(PLCloudSharedComment *)self asset];
    char v4 = [v5 cloudIsMyAsset];
  }
  return v4;
}

- (id)commenterDisplayName
{
  v3 = [(PLCloudSharedComment *)self commenterFirstName];
  char v4 = [(PLCloudSharedComment *)self commenterLastName];
  v5 = [(PLCloudSharedComment *)self commenterFullName];
  if ([v5 length])
  {
    unint64_t v6 = v5;
  }
  else if ([v3 length] || objc_msgSend(v4, "length"))
  {
    PLLocalizedNameWithFirstAndLastName();
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v6 = [(PLCloudSharedComment *)self commenterEmail];
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = &stru_1EEB2EB80;
  }

  return v7;
}

- (BOOL)isInterestingForAlbumsSorting
{
  v3 = [(PLCloudSharedComment *)self isMyComment];
  char v4 = [v3 BOOLValue];

  if (v4) {
    return 1;
  }
  return [(PLCloudSharedComment *)self _isInterestingToUser];
}

- (BOOL)shouldNotifyAsNotificationWithMediaStreamInfo:(id)a3 asCaptionOnly:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(PLCloudSharedComment *)self isCaption];
  int v8 = [v7 BOOLValue];

  v9 = [v6 valueForKey:*MEMORY[0x1E4F5C4A0]];

  LODWORD(v6) = [v9 BOOLValue];
  if (!v6)
  {
    BOOL result = [(PLCloudSharedComment *)self _isInterestingToUser];
    if (!a4) {
      return result;
    }
    goto LABEL_11;
  }
  char v10 = PLPhotoSharingGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v11) {
      goto LABEL_10;
    }
    __int16 v16 = 0;
    uint64_t v12 = "Notifications: mstreamd says comment is not interesting, but allowing as caption";
    unint64_t v13 = (uint8_t *)&v16;
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    __int16 v15 = 0;
    uint64_t v12 = "Notifications: Ignoring comment notification because mstreamd says it's not interesting and is not a caption";
    unint64_t v13 = (uint8_t *)&v15;
  }
  _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
LABEL_10:

  BOOL result = 0;
  if (!a4) {
    return result;
  }
LABEL_11:
  if (!result) {
    *a4 = v8;
  }
  return result;
}

- (BOOL)_isInterestingToUser
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PLCloudSharedComment *)self asset];
  if (![v3 isCloudSharedAsset])
  {
    v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      __int16 v15 = v3;
      int v8 = "Comment marked as not interesting because it's not for a cloudSharedAsset: %@.";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  char v4 = [v3 cloudIsMyAsset];
  v5 = [(PLCloudSharedComment *)self isMyComment];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      int v8 = "Ignoring comment notification because it's my comment";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_7:
      _os_log_impl(&dword_19B3C7000, v9, v10, v8, (uint8_t *)&v14, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v4)
  {
    LOBYTE(v12) = 1;
    goto LABEL_10;
  }
  if ([v3 cloudHasCommentsByMe])
  {
    BOOL v12 = ![(PLCloudSharedComment *)self isLikeBoolValue];
    goto LABEL_10;
  }
LABEL_9:
  LOBYTE(v12) = 0;
LABEL_10:

  return v12;
}

- (BOOL)isLikeBoolValue
{
  id v2 = [(PLCloudSharedComment *)self isLike];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (PLCloudFeedCommentsEntry)cloudFeedEntry
{
  if ([(PLCloudSharedComment *)self isLikeBoolValue]) {
    [(PLCloudSharedComment *)self cloudFeedLikeCommentEntry];
  }
  else {
  char v3 = [(PLCloudSharedComment *)self cloudFeedCommentEntry];
  }
  return (PLCloudFeedCommentsEntry *)v3;
}

- (id)asset
{
  char v3 = [(PLCloudSharedComment *)self isLike];
  int v4 = [v3 BOOLValue];

  if (v4) {
    [(PLCloudSharedComment *)self likedAsset];
  }
  else {
  v5 = [(PLCloudSharedComment *)self commentedAsset];
  }
  return v5;
}

- (void)willSave
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedComment;
  [(PLManagedObject *)&v5 willSave];
  char v3 = [(PLCloudSharedComment *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 delayedSaveActions];
    [v4 recordCommentForCloudFeedUpdate:self];
  }
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedComment;
  [(PLCloudSharedComment *)&v4 awakeFromInsert];
  char v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLCloudSharedComment *)self setCloudGUID:v3];
}

- (PLCloudSharedComment)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCloudSharedComment;
  return [(PLCloudSharedComment *)&v3 init];
}

+ (id)cloudSharedCommentsWithCommentDate:(id)a3 inManagedObjectContext:(id)a4
{
  char v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  int v8 = [v6 predicateWithFormat:@"%K == %@", @"commentDate", a3];
  v9 = [a1 _cloudSharedCommentsWithPredicate:v8 inManagedObjectContext:v7];

  return v9;
}

+ (id)cloudSharedCommentWithGUID:(id)a3 inLibrary:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18[0] = v6;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  v9 = [v7 arrayWithObjects:v18 count:1];
  os_log_type_t v10 = [a1 cloudSharedCommentsWithGUIDs:v9 inLibrary:v8];

  if ((unint64_t)[v10 count] >= 2)
  {
    uint32_t v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one comment with cloudGUID %@, returning last one in array %@", (uint8_t *)&v14, 0x16u);
    }
  }
  BOOL v12 = [v10 lastObject];

  return v12;
}

+ (id)cloudSharedCommentsWithGUIDs:(id)a3 inLibrary:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"cloudGUID IN %@", a3];
  v9 = [v7 managedObjectContext];

  os_log_type_t v10 = [a1 _cloudSharedCommentsWithPredicate:v8 inManagedObjectContext:v9];

  return v10;
}

+ (id)_cloudSharedCommentsWithPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  os_log_type_t v10 = [a1 entityInManagedObjectContext:v7];
  [v9 setEntity:v10];

  [v9 setPredicate:v6];
  id v15 = 0;
  uint32_t v11 = [v7 executeFetchRequest:v9 error:&v15];
  id v12 = v15;
  if (!v11)
  {
    unint64_t v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch cloud shared comments with request %@: %@", buf, 0x16u);
    }
  }

  return v11;
}

+ (id)insertNewCommentWithCommentText:(id)a3 commentDate:(id)a4 isLike:(BOOL)a5 isMyComment:(BOOL)a6 inLibrary:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [a1 entityName];
  __int16 v16 = [v14 managedObjectContext];

  id v17 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v15, (uint64_t)v16, 0);

  if (v13)
  {
    [v17 setCommentDate:v13];
  }
  else
  {
    __int16 v18 = [MEMORY[0x1E4F1C9C8] date];
    [v17 setCommentDate:v18];
  }
  id v19 = [NSNumber numberWithBool:v8];
  [v17 setIsMyComment:v19];

  if (v9)
  {
    uint64_t v20 = [NSNumber numberWithBool:1];
    [v17 setIsLike:v20];
  }
  else
  {
    [v17 setCommentText:v12];
  }

  return v17;
}

+ (id)insertNewCommentIntoAsset:(id)a3 commentDate:(id)a4 withText:(id)a5 isLike:(BOOL)a6 isMyComment:(BOOL)a7 inLibrary:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v14 && ([v14 isCloudSharedAsset] & 1) == 0)
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot insert a comment in an asset that is not a CloudSharedAsset" userInfo:0];
    objc_exception_throw(v25);
  }
  __int16 v18 = [a1 entityName];
  id v19 = [v17 managedObjectContext];
  uint64_t v20 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v18, (uint64_t)v19, 0);

  if (v15)
  {
    [v20 setCommentDate:v15];
  }
  else
  {
    v21 = [MEMORY[0x1E4F1C9C8] date];
    [v20 setCommentDate:v21];
  }
  v22 = [NSNumber numberWithBool:v9];
  [v20 setIsMyComment:v22];

  if (v10)
  {
    v23 = [NSNumber numberWithBool:1];
    [v20 setIsLike:v23];

    if (!v14) {
      goto LABEL_12;
    }
  }
  else
  {
    [v20 setCommentText:v16];
    if (!v14) {
      goto LABEL_12;
    }
  }
  if (v20) {
    [v14 addComment:v20];
  }
LABEL_12:

  return v20;
}

+ (id)entityName
{
  return @"CloudSharedComment";
}

@end