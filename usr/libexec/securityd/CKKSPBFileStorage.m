@interface CKKSPBFileStorage
- (CKKSPBCodable)protobufStorage;
- (CKKSPBFileStorage)initWithStoragePath:(id)a3 storageClass:(Class)a4;
- (Class)storageClass;
- (NSURL)storageFile;
- (id)storage;
- (void)setProtobufStorage:(id)a3;
- (void)setStorage:(id)a3;
- (void)setStorageClass:(Class)a3;
- (void)setStorageFile:(id)a3;
@end

@implementation CKKSPBFileStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobufStorage, 0);
  objc_storeStrong((id *)&self->_storageClass, 0);

  objc_storeStrong((id *)&self->_storageFile, 0);
}

- (void)setProtobufStorage:(id)a3
{
}

- (CKKSPBCodable)protobufStorage
{
  return (CKKSPBCodable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStorageClass:(Class)a3
{
}

- (Class)storageClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setStorageFile:(id)a3
{
}

- (NSURL)storageFile
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorage:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v9 = v4;
  v6 = [v9 data];
  v7 = [(CKKSPBFileStorage *)v5 storageFile];
  [v6 writeToURL:v7 atomically:1];

  v8 = [[(objc_class *)[(CKKSPBFileStorage *)v5 storageClass] alloc] initWithData:v6];
  [(CKKSPBFileStorage *)v5 setProtobufStorage:v8];

  objc_sync_exit(v5);
}

- (id)storage
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CKKSPBFileStorage *)v2 protobufStorage];
  objc_sync_exit(v2);

  return v3;
}

- (CKKSPBFileStorage)initWithStoragePath:(id)a3 storageClass:(Class)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKKSPBFileStorage;
  v7 = [(CKKSPBFileStorage *)&v15 init];
  v8 = v7;
  if (v7)
  {
    [(CKKSPBFileStorage *)v7 setStorageFile:v6];
    [(CKKSPBFileStorage *)v8 setStorageClass:a4];
    id v9 = +[NSData dataWithContentsOfURL:v6];
    if (v9)
    {
      v10 = [[(objc_class *)[(CKKSPBFileStorage *)v8 storageClass] alloc] initWithData:v9];
      [(CKKSPBFileStorage *)v8 setProtobufStorage:v10];
    }
    v11 = [(CKKSPBFileStorage *)v8 protobufStorage];

    if (!v11)
    {
      v12 = [[(objc_class *)[(CKKSPBFileStorage *)v8 storageClass] alloc] init];
      [(CKKSPBFileStorage *)v8 setProtobufStorage:v12];
    }
    v13 = v8;
  }
  return v8;
}

@end