@interface TSPDatabaseObjectWithFileState
- (BOOL)hasDataState;
- (BOOL)hasFileState;
- (TSPDatabaseObjectWithFileState)initWithIdentifier:(int64_t)a3 classType:(int)a4 fileState:(id)a5 packageURL:(id)a6;
- (id)fileState;
- (id)fileURL;
- (int64_t)dataState;
@end

@implementation TSPDatabaseObjectWithFileState

- (TSPDatabaseObjectWithFileState)initWithIdentifier:(int64_t)a3 classType:(int)a4 fileState:(id)a5 packageURL:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TSPDatabaseObjectWithFileState;
  v12 = [(TSPDatabaseObject *)&v18 initWithIdentifier:a3 classType:v7];
  if (v12)
  {
    v13 = (NSString *)[v10 copy];
    fileState = v12->_fileState;
    v12->_fileState = v13;

    v15 = (NSURL *)[v11 copy];
    packageURL = v12->_packageURL;
    v12->_packageURL = v15;
  }
  return v12;
}

- (BOOL)hasDataState
{
  return 0;
}

- (int64_t)dataState
{
  return 0;
}

- (BOOL)hasFileState
{
  return 1;
}

- (id)fileState
{
  return self->_fileState;
}

- (id)fileURL
{
  packageURL = self->_packageURL;
  fileState = self->_fileState;
  v8[0] = @"data";
  v8[1] = fileState;
  v4 = +[NSArray arrayWithObjects:v8 count:2];
  v5 = +[NSString pathWithComponents:v4];
  v6 = [(NSURL *)packageURL URLByAppendingPathComponent:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_fileState, 0);
}

@end