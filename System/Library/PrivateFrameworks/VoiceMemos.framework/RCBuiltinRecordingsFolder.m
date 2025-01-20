@interface RCBuiltinRecordingsFolder
+ (NSArray)allBuiltInFolders;
+ (id)builtInFolderWithType:(int64_t)a3;
- (BOOL)containsRecording:(id)a3;
- (NSString)description;
- (NSString)name;
- (NSString)uuid;
- (RCBuiltinRecordingsFolder)initWithType:(int64_t)a3;
- (RCFolderIdentifier)folderControllerID;
- (int64_t)folderType;
- (int64_t)rank;
@end

@implementation RCBuiltinRecordingsFolder

+ (id)builtInFolderWithType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v4 = [a1 allBuiltInFolders];
    v5 = [v4 objectAtIndexedSubscript:a3];
  }
  return v5;
}

+ (NSArray)allBuiltInFolders
{
  if (allBuiltInFolders_onceToken != -1) {
    dispatch_once(&allBuiltInFolders_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)allBuiltInFolders_allBuiltInFolders;
  return (NSArray *)v2;
}

- (int64_t)folderType
{
  return self->_folderType;
}

void __46__RCBuiltinRecordingsFolder_allBuiltInFolders__block_invoke()
{
  uint64_t v0 = 0;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  do
  {
    v1 = [RCBuiltinRecordingsFolder alloc];
    uint64_t v2 = -[RCBuiltinRecordingsFolder initWithType:](v1, "initWithType:", v0, v7, v8);
    v3 = (void *)*((void *)&v7 + v0);
    *((void *)&v7 + v0) = v2;

    ++v0;
  }
  while (v0 != 4);
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v7 count:4];
  v5 = (void *)allBuiltInFolders_allBuiltInFolders;
  allBuiltInFolders_allBuiltInFolders = v4;

  for (uint64_t i = 24; i != -8; i -= 8)
}

- (RCBuiltinRecordingsFolder)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCBuiltinRecordingsFolder;
  result = [(RCBuiltinRecordingsFolder *)&v5 init];
  if (result) {
    result->_folderType = a3;
  }
  return result;
}

- (NSString)uuid
{
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_folderType];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(RCBuiltinRecordingsFolder *)self name];
  v6 = [v3 stringWithFormat:@"<%@: %p> name = %@", v4, self, v5];

  return (NSString *)v6;
}

- (RCFolderIdentifier)folderControllerID
{
  return (RCFolderIdentifier *)[MEMORY[0x1E4F28ED0] numberWithInteger:self->_folderType];
}

- (NSString)name
{
  unint64_t folderType = self->_folderType;
  if (folderType > 3) {
    return (NSString *)&stru_1F1F06468;
  }
  else {
    return &off_1E6497860[folderType]->isa;
  }
}

- (int64_t)rank
{
  return self->_folderType;
}

- (BOOL)containsRecording:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  switch(self->_folderType)
  {
    case 1:
      char v6 = [v4 favorite];
      goto LABEL_8;
    case 2:
      if ([v4 recordedOnWatch]) {
        goto LABEL_6;
      }
      char v6 = [v5 watchOS];
LABEL_8:
      BOOL v8 = v6;
      break;
    case 3:
      long long v7 = [v4 deletionDate];
      BOOL v8 = v7 != 0;

      break;
    case 4:
      BOOL v8 = 0;
      break;
    default:
LABEL_6:
      BOOL v8 = 1;
      break;
  }

  return v8;
}

@end