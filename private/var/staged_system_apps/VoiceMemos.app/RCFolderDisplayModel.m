@interface RCFolderDisplayModel
+ (id)_folderImageForFolderOfType:(int64_t)a3;
+ (id)folderDisplayModelWithDisplayName:(id)a3 iconImage:(id)a4 recordingsCount:(int64_t)a5 folderType:(int64_t)a6 UUID:(id)a7;
+ (id)folderDisplayModelWithFolderModel:(id)a3;
+ (id)folderNameForBuiltInFolderOfType:(int64_t)a3;
+ (id)folderSystemImageNameForFolderOfType:(int64_t)a3;
- (BOOL)representsPossibleMoveDestination;
- (NSString)UUID;
- (NSString)displayName;
- (UIImage)iconImage;
- (id)description;
- (int64_t)folderType;
- (int64_t)recordingsCount;
- (void)setDisplayName:(id)a3;
- (void)setFolderType:(int64_t)a3;
- (void)setIconImage:(id)a3;
- (void)setRecordingsCount:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation RCFolderDisplayModel

+ (id)folderNameForBuiltInFolderOfType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"ALL_RECORDINGS";
      goto LABEL_7;
    case 1:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"FAVORITES_FOLDER_TITLE";
      goto LABEL_7;
    case 2:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"WATCH_FOLDER_TITLE";
      goto LABEL_7;
    case 3:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"RECENTLY_DELETED";
LABEL_7:
      v6 = [v3 localizedStringForKey:v5 value:&stru_100228BC8 table:0];

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (id)folderDisplayModelWithFolderModel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 folderType];
  CFStringRef v5 = +[RCFolderDisplayModel _folderImageForFolderOfType:](RCFolderDisplayModel, "_folderImageForFolderOfType:", [v3 folderType]);
  if (v4 == (id)4) {
    [v3 name];
  }
  else {
  v6 = +[RCFolderDisplayModel folderNameForBuiltInFolderOfType:](RCFolderDisplayModel, "folderNameForBuiltInFolderOfType:", [v3 folderType]);
  }
  v7 = +[RCApplicationModel sharedApplicationModel];
  id v8 = [v7 playableCountForFolder:v3];

  id v9 = [v3 folderType];
  v10 = [v3 uuid];
  v11 = +[RCFolderDisplayModel folderDisplayModelWithDisplayName:v6 iconImage:v5 recordingsCount:v8 folderType:v9 UUID:v10];

  return v11;
}

+ (id)_folderImageForFolderOfType:(int64_t)a3
{
  id v3 = [a1 folderSystemImageNameForFolderOfType:a3];
  if (v3)
  {
    id v4 = +[UIImage systemImageNamed:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)folderSystemImageNameForFolderOfType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return *(&off_100221EA8 + a3);
  }
}

+ (id)folderDisplayModelWithDisplayName:(id)a3 iconImage:(id)a4 recordingsCount:(int64_t)a5 folderType:(int64_t)a6 UUID:(id)a7
{
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_opt_new();
  [v14 setDisplayName:v13];

  [v14 setIconImage:v12];
  [v14 setRecordingsCount:a5];
  [v14 setFolderType:a6];
  [v14 setUUID:v11];

  return v14;
}

- (id)description
{
  id v3 = [(RCFolderDisplayModel *)self displayName];
  int64_t v4 = [(RCFolderDisplayModel *)self recordingsCount];
  int64_t v5 = [(RCFolderDisplayModel *)self folderType];
  v6 = [(RCFolderDisplayModel *)self UUID];
  v7 = +[NSString stringWithFormat:@"displayName =%@, count = %lu, type = %lu, UUID = %@", v3, v4, v5, v6];

  return v7;
}

- (BOOL)representsPossibleMoveDestination
{
  unint64_t v2 = [(RCFolderDisplayModel *)self folderType];
  return (v2 < 5) & (0x1Bu >> v2);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (int64_t)recordingsCount
{
  return self->_recordingsCount;
}

- (void)setRecordingsCount:(int64_t)a3
{
  self->_recordingsCount = a3;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end