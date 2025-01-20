@interface MFDAFolderChangeResult
- (BOOL)wasSuccessful;
- (MFDAFolderChangeResult)initWithStatusCode:(int64_t)a3 error:(id)a4 folderID:(id)a5 folderName:(id)a6;
- (NSError)error;
- (NSString)folderID;
- (NSString)folderName;
- (id)description;
- (int64_t)statusCode;
@end

@implementation MFDAFolderChangeResult

- (MFDAFolderChangeResult)initWithStatusCode:(int64_t)a3 error:(id)a4 folderID:(id)a5 folderName:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MFDAFolderChangeResult;
  v14 = [(MFDAFolderChangeResult *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_statusCode = a3;
    objc_storeStrong((id *)&v14->_error, a4);
    uint64_t v16 = [v12 copy];
    folderID = v15->_folderID;
    v15->_folderID = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    folderName = v15->_folderName;
    v15->_folderName = (NSString *)v18;
  }
  return v15;
}

- (BOOL)wasSuccessful
{
  return self->_statusCode == 2;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MFDAFolderChangeResult;
  v4 = [(MFDAFolderChangeResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ status %ld, error %@, folderID \"%@\", folderName \"%@\"", v4, self->_statusCode, self->_error, self->_folderID, self->_folderName];

  return v5;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)folderID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)folderName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end