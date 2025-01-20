@interface MBDeviceTransferFileMetadata
- (MBDeviceTransferFileMetadata)initWithDictionary:(id)a3 error:(id *)a4;
- (MBDeviceTransferFileMetadata)initWithFromPath:(id)a3 toRelativePath:(id)a4;
- (NSNumber)protectionClass;
- (NSString)relativePath;
- (id)dictionaryRepresentation;
@end

@implementation MBDeviceTransferFileMetadata

- (MBDeviceTransferFileMetadata)initWithFromPath:(id)a3 toRelativePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBDeviceTransferFileMetadata initWithFromPath:toRelativePath:]", "MBDeviceTransferFileMetadata.m", 21, "fromPath");
  }
  v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBDeviceTransferFileMetadata initWithFromPath:toRelativePath:]", "MBDeviceTransferFileMetadata.m", 22, "relativePath");
  }
  id v17 = 0;
  uint64_t v9 = +[MBProtectionClassUtils getWithPath:v6 error:&v17];
  id v10 = v17;
  v16.receiver = self;
  v16.super_class = (Class)MBDeviceTransferFileMetadata;
  v11 = [(MBDeviceTransferFileMetadata *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_relativePath, a4);
    uint64_t v13 = +[NSNumber numberWithUnsignedChar:v9];
    protectionClass = v12->_protectionClass;
    v12->_protectionClass = (NSNumber *)v13;
  }
  return v12;
}

- (MBDeviceTransferFileMetadata)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MBDeviceTransferFileMetadata;
  id v7 = [(MBDeviceTransferFileMetadata *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"MBRelativePath"];
    relativePath = v7->_relativePath;
    v7->_relativePath = (NSString *)v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"MBProtectionClass"];
    protectionClass = v7->_protectionClass;
    v7->_protectionClass = (NSNumber *)v10;

    if (!v7->_relativePath || !v7->_protectionClass)
    {
      if (a4)
      {
        *a4 = +[MBError errorWithCode:11 description:@"Failed to decode MBDeviceTransferFileMetadata from dictionary"];
      }

      id v7 = 0;
    }
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  v7[0] = @"MBRelativePath";
  v3 = [(MBDeviceTransferFileMetadata *)self relativePath];
  v7[1] = @"MBProtectionClass";
  v8[0] = v3;
  v4 = [(MBDeviceTransferFileMetadata *)self protectionClass];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (NSString)relativePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)protectionClass
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
}

@end