@interface RCLocalDropContext
+ (id)dropContextWithFolderType:(int64_t)a3 folderUUID:(id)a4 folderIndexPath:(id)a5 payloadType:(int64_t)a6;
- (NSIndexPath)folderIndexPath;
- (NSString)folderUUID;
- (int64_t)folderType;
- (int64_t)payloadType;
- (void)setFolderIndexPath:(id)a3;
- (void)setFolderType:(int64_t)a3;
- (void)setFolderUUID:(id)a3;
- (void)setPayloadType:(int64_t)a3;
@end

@implementation RCLocalDropContext

+ (id)dropContextWithFolderType:(int64_t)a3 folderUUID:(id)a4 folderIndexPath:(id)a5 payloadType:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  v11 = objc_opt_new();
  [v11 setFolderType:a3];
  [v11 setFolderUUID:v10];

  [v11 setFolderIndexPath:v9];
  [v11 setPayloadType:a6];

  return v11;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (NSString)folderUUID
{
  return self->_folderUUID;
}

- (void)setFolderUUID:(id)a3
{
}

- (NSIndexPath)folderIndexPath
{
  return self->_folderIndexPath;
}

- (void)setFolderIndexPath:(id)a3
{
}

- (int64_t)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(int64_t)a3
{
  self->_payloadType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIndexPath, 0);

  objc_storeStrong((id *)&self->_folderUUID, 0);
}

@end