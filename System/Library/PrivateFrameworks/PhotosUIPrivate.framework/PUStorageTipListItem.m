@interface PUStorageTipListItem
+ (unint64_t)storageTipTypeForCloudQuotaUsedBytesIdentifier:(id)a3;
- (NSString)cloudQuotaBytesUsedIdentifier;
- (NSString)systemImageName;
- (NSString)title;
- (PUStorageTipListItem)initWithStorageTipType:(unint64_t)a3 count:(int64_t)a4 totalSizeInBytes:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (int64_t)totalSizeInBytes;
- (unint64_t)storageTipType;
@end

@implementation PUStorageTipListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudQuotaBytesUsedIdentifier, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)cloudQuotaBytesUsedIdentifier
{
  return self->_cloudQuotaBytesUsedIdentifier;
}

- (unint64_t)storageTipType
{
  return self->_storageTipType;
}

- (int64_t)totalSizeInBytes
{
  return self->_totalSizeInBytes;
}

- (int64_t)count
{
  return self->_count;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)title
{
  return self->_title;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PUStorageTipListItem allocWithZone:a3];
  int64_t totalSizeInBytes = self->_totalSizeInBytes;
  unint64_t storageTipType = self->_storageTipType;
  int64_t count = self->_count;
  return [(PUStorageTipListItem *)v4 initWithStorageTipType:storageTipType count:count totalSizeInBytes:totalSizeInBytes];
}

- (PUStorageTipListItem)initWithStorageTipType:(unint64_t)a3 count:(int64_t)a4 totalSizeInBytes:(int64_t)a5
{
  v23.receiver = self;
  v23.super_class = (Class)PUStorageTipListItem;
  v9 = [(PUStorageTipListItem *)&v23 init];
  v10 = v9;
  if (v9)
  {
    v9->_unint64_t storageTipType = a3;
    switch(a3)
    {
      case 0uLL:
        uint64_t v11 = PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_DUPLICATES_ALBUM_TITLE");
        title = v10->_title;
        v10->_title = (NSString *)v11;

        systemImageName = v10->_systemImageName;
        v10->_systemImageName = (NSString *)@"square.on.square";
        v14 = (id *)MEMORY[0x1E4F395E0];
        goto LABEL_6;
      case 1uLL:
        uint64_t v15 = PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_SCREENSHOTS_ALBUM_TITLE");
        v16 = v10->_title;
        v10->_title = (NSString *)v15;

        systemImageName = v10->_systemImageName;
        v10->_systemImageName = (NSString *)@"camera.viewfinder";
        v14 = (id *)MEMORY[0x1E4F395E8];
        goto LABEL_6;
      case 2uLL:
        uint64_t v17 = PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_LARGE_VIDEOS_ALBUM_TITLE");
        v18 = v10->_title;
        v10->_title = (NSString *)v17;

        systemImageName = v10->_systemImageName;
        v10->_systemImageName = (NSString *)@"video";
        v14 = (id *)MEMORY[0x1E4F395F0];
LABEL_6:

        v19 = (NSString *)*v14;
        cloudQuotaBytesUsedIdentifier = v10->_cloudQuotaBytesUsedIdentifier;
        v10->_cloudQuotaBytesUsedIdentifier = v19;

        break;
      case 3uLL:
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2 object:v10 file:@"PUStorageTipListItem.m" lineNumber:41 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
        break;
    }
    v10->_int64_t count = a4;
    v10->_int64_t totalSizeInBytes = a5;
  }
  return v10;
}

+ (unint64_t)storageTipTypeForCloudQuotaUsedBytesIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:*MEMORY[0x1E4F395E0]])
  {
    unint64_t v6 = 0;
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F395E8]])
  {
    unint64_t v6 = 1;
  }
  else
  {
    if (([v5 isEqualToString:*MEMORY[0x1E4F395F0]] & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:a1 file:@"PUStorageTipListItem.m" lineNumber:60 description:@"Attempted to get PUStorageTipType for unknown CloudQuotaUsedBytesIdentifier"];

      abort();
    }
    unint64_t v6 = 2;
  }

  return v6;
}

@end