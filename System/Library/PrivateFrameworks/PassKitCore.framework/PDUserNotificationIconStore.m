@interface PDUserNotificationIconStore
- (BOOL)_assetExists:(int64_t)a3 identifier:(id)a4;
- (BOOL)_removeAssetsForIdentifier:(id)a3;
- (BOOL)_storeData:(id)a3 assetType:(int64_t)a4 identifier:(id)a5;
- (BOOL)_storeImage:(id)a3 assetType:(int64_t)a4 identifier:(id)a5;
- (BOOL)removeAssetsForIdentifier:(id)a3;
- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3;
- (PDUserNotificationIconStore)initWithDatabaseManager:(id)a3;
- (id)_filePathForAssetType:(int64_t)a3 identifier:(id)a4;
- (id)_imageForAssetType:(int64_t)a3 accountIdentifier:(id)a4;
- (id)_imageForAssetType:(int64_t)a3 passUniqueIdentifier:(id)a4;
- (id)fileURLForAsset:(int64_t)a3 accountIdentifier:(id)a4;
- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4;
- (id)fileURLForImage:(id)a3 identifier:(id)a4;
- (void)_migrateAssetsIfNeeded;
@end

@implementation PDUserNotificationIconStore

- (PDUserNotificationIconStore)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PDUserNotificationIconStore;
  v6 = [(PDUserNotificationIconStore *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    uint64_t v8 = +[NSFileManager defaultManager];
    fileManager = v7->_fileManager;
    v7->_fileManager = (NSFileManager *)v8;

    v10 = PDUtilityQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003766AC;
    block[3] = &unk_10072E1E8;
    v13 = v7;
    dispatch_async(v10, block);
  }
  return v7;
}

- (id)fileURLForAsset:(int64_t)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(PDUserNotificationIconStore *)self _filePathForAssetType:a3 identifier:v6];
  if ([(PDUserNotificationIconStore *)self _assetExists:a3 identifier:v6]) {
    goto LABEL_5;
  }
  uint64_t v8 = [(PDUserNotificationIconStore *)self _imageForAssetType:a3 accountIdentifier:v6];
  if (v8)
  {
    if ([(PDUserNotificationIconStore *)self _storeImage:v8 assetType:a3 identifier:v6])
    {

LABEL_5:
      v9 = +[NSURL fileURLWithPath:v7];
      goto LABEL_18;
    }
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = (uint64_t)*(&off_10074BD18 + a3);
      }
      int v15 = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      v13 = "Error storing notification asset %@ for account %@.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = (uint64_t)*(&off_10074BD18 + a3);
      }
      int v15 = 138412546;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      v13 = "No image for notification asset %@ for account %@.";
      goto LABEL_16;
    }
  }

  v9 = 0;
LABEL_18:

  return v9;
}

- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(PDUserNotificationIconStore *)self _filePathForAssetType:a3 identifier:v6];
  if ([(PDUserNotificationIconStore *)self _assetExists:a3 identifier:v6]) {
    goto LABEL_5;
  }
  uint64_t v8 = [(PDUserNotificationIconStore *)self _imageForAssetType:a3 passUniqueIdentifier:v6];
  if (v8)
  {
    if ([(PDUserNotificationIconStore *)self _storeImage:v8 assetType:a3 identifier:v6])
    {

LABEL_5:
      v9 = +[NSURL fileURLWithPath:v7];
      goto LABEL_18;
    }
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = (uint64_t)*(&off_10074BD18 + a3);
      }
      int v15 = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      v13 = "Error storing notification asset %@ for pass %@.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = (uint64_t)*(&off_10074BD18 + a3);
      }
      int v15 = 138412546;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      v13 = "No image for notification asset %@ for pass %@.";
      goto LABEL_16;
    }
  }

  v9 = 0;
LABEL_18:

  return v9;
}

- (id)fileURLForImage:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  if ([v6 length] && -[__CFString length](v7, "length"))
  {
    uint64_t v8 = [(PDUserNotificationIconStore *)self _filePathForAssetType:3 identifier:v7];
    if ([(PDUserNotificationIconStore *)self _assetExists:3 identifier:v7]
      || [(PDUserNotificationIconStore *)self _storeData:v6 assetType:3 identifier:v7])
    {
      v9 = +[NSURL fileURLWithPath:v8];
      goto LABEL_12;
    }
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      CFStringRef v13 = @"PDUserNotificationAssetTypeCustom";
      __int16 v14 = 2112;
      int v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error storing notification asset %@ for identifier %@.", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      CFStringRef v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No image for notification asset for identifier %@.", (uint8_t *)&v12, 0xCu);
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)removeAssetsForIdentifier:(id)a3
{
  return [(PDUserNotificationIconStore *)self _removeAssetsForIdentifier:a3];
}

- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(PDUserNotificationIconStore *)self _imageForAssetType:0 passUniqueIdentifier:v4];
  if (v5)
  {
    id v6 = [(PDUserNotificationIconStore *)self _imageForAssetType:0 passUniqueIdentifier:v4];
    BOOL v7 = [(PDUserNotificationIconStore *)self _storeImage:v6 assetType:0 identifier:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_storeImage:(id)a3 assetType:(int64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  v9 = [a3 imageData];
  LOBYTE(a4) = [(PDUserNotificationIconStore *)self _storeData:v9 assetType:a4 identifier:v8];

  return a4;
}

- (BOOL)_storeData:(id)a3 assetType:(int64_t)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = sub_100376E4C();
  uint64_t v11 = [v10 stringByAppendingPathComponent:v9];

  if ([(NSFileManager *)self->_fileManager fileExistsAtPath:v11 isDirectory:0]
    || [(NSFileManager *)self->_fileManager createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0])
  {
    int v12 = [(PDUserNotificationIconStore *)self _filePathForAssetType:a4 identifier:v9];
    BOOL v13 = [(NSFileManager *)self->_fileManager createFileAtPath:v12 contents:v8 attributes:0];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_assetExists:(int64_t)a3 identifier:(id)a4
{
  fileManager = self->_fileManager;
  id v5 = [(PDUserNotificationIconStore *)self _filePathForAssetType:a3 identifier:a4];
  LOBYTE(fileManager) = [(NSFileManager *)fileManager fileExistsAtPath:v5];

  return (char)fileManager;
}

- (BOOL)_removeAssetsForIdentifier:(id)a3
{
  fileManager = self->_fileManager;
  id v4 = a3;
  id v5 = sub_100376E4C();
  id v6 = [v5 stringByAppendingPathComponent:v4];

  LOBYTE(fileManager) = [(NSFileManager *)fileManager removeItemAtPath:v6 error:0];
  return (char)fileManager;
}

- (id)_imageForAssetType:(int64_t)a3 passUniqueIdentifier:(id)a4
{
  id v5 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:a4];
  id v6 = v5;
  if (a3 == 2)
  {
    id v8 = PKPassKitUIBundle();
    CFURLRef v9 = [v8 URLForResource:@"CashBackIcon" withExtension:@"pdf"];

    CGPDFDocumentRef v10 = CGPDFDocumentCreateWithURL(v9);
    if (v10)
    {
      uint64_t v11 = v10;
      PKScreenScale();
      BOOL v7 = PKGetImageFromPDFDocument();
      CGPDFDocumentRelease(v11);
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    CFURLRef v9 = [v5 frontFaceImage];
    if (v9)
    {
      int v12 = +[PKImageResizingConstraints constraintsWithAspectFitToSize:](PKImageResizingConstraints, "constraintsWithAspectFitToSize:", 35.0, 35.0);
      BOOL v7 = [v12 resizedImage:v9];

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [v5 notificationIconImage];
  }
LABEL_12:

  return v7;
}

- (id)_imageForAssetType:(int64_t)a3 accountIdentifier:(id)a4
{
  id v5 = [(PDDatabaseManager *)self->_databaseManager accountWithIdentifier:a4];
  id v6 = v5;
  if (a3 || [v5 type] != (id)4)
  {
    uint64_t v11 = 0;
  }
  else
  {
    BOOL v7 = PKPassKitUIBundle();
    CFURLRef v8 = [v7 URLForResource:@"SAVINGS_Icon" withExtension:@"pdf"];

    CGPDFDocumentRef v9 = CGPDFDocumentCreateWithURL(v8);
    if (v9)
    {
      CGPDFDocumentRef v10 = v9;
      PKScreenScale();
      uint64_t v11 = PKGetImageFromPDFDocument();
      CGPDFDocumentRelease(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  return v11;
}

- (id)_filePathForAssetType:(int64_t)a3 identifier:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 0:
      CFStringRef v6 = @"notificationIcon.png";
      goto LABEL_7;
    case 1:
      CFStringRef v6 = @"frontFace.png";
      goto LABEL_7;
    case 2:
      BOOL v7 = sub_100376E4C();
      CFURLRef v8 = [v7 stringByAppendingPathComponent:@"notificationIconDailyCash.png"];
      goto LABEL_8;
    case 3:
      CFStringRef v6 = @"custom.png";
      goto LABEL_7;
    default:
      CFStringRef v6 = 0;
LABEL_7:
      BOOL v7 = sub_100376E4C();
      CGPDFDocumentRef v9 = [v7 stringByAppendingPathComponent:v5];
      CFURLRef v8 = [v9 stringByAppendingPathComponent:v6];

LABEL_8:
      return v8;
  }
}

- (void)_migrateAssetsIfNeeded
{
  if (PKSharedCacheGetIntegerForKey() != 1)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating PDUserNotificationIconStore", buf, 2u);
    }

    id v4 = [(PDDatabaseManager *)self->_databaseManager passUniqueIDs];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          if ([(PDUserNotificationIconStore *)self _assetExists:0 identifier:v9]) {
            [(PDUserNotificationIconStore *)self updatePassAssetsWithPassUniqueID:v9];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
    PKSharedCacheSetObjectForKey();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end