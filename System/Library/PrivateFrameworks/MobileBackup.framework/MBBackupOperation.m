@interface MBBackupOperation
+ (id)backupOperationWithType:(int)a3 domain:(id)a4 fileID:(id)a5 path:(id)a6 size:(unint64_t)a7;
+ (id)backupOperationWithType:(int)a3 domain:(id)a4 fileID:(id)a5 path:(id)a6 size:(unint64_t)a7 flags:(unsigned __int8)a8;
+ (id)nameForType:(int)a3;
- (MBBackupOperation)initWithDecoder:(id)a3;
- (MBBackupOperation)initWithDecoder:(id)a3 domainManager:(id)a4;
- (MBDomain)domain;
- (MBFileID)fileID;
- (NSString)path;
- (NSString)typeName;
- (id)description;
- (int)type;
- (unint64_t)size;
- (unsigned)flags;
- (void)encode:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFileID:(id)a3;
- (void)setFlags:(unsigned __int8)a3;
- (void)setPath:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setType:(int)a3;
@end

@implementation MBBackupOperation

+ (id)nameForType:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return *(&off_100417558 + a3);
  }
}

+ (id)backupOperationWithType:(int)a3 domain:(id)a4 fileID:(id)a5 path:(id)a6 size:(unint64_t)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = objc_alloc_init(MBBackupOperation);
  [(MBBackupOperation *)v14 setType:v10];
  [(MBBackupOperation *)v14 setDomain:v13];

  [(MBBackupOperation *)v14 setFileID:v12];
  [(MBBackupOperation *)v14 setPath:v11];

  [(MBBackupOperation *)v14 setSize:a7];
  return v14;
}

+ (id)backupOperationWithType:(int)a3 domain:(id)a4 fileID:(id)a5 path:(id)a6 size:(unint64_t)a7 flags:(unsigned __int8)a8
{
  uint64_t v8 = a8;
  v9 = [a1 backupOperationWithType:*(void *)&a3 domain:a4 fileID:a5 path:a6 size:a7];
  [v9 setFlags:v8];
  return v9;
}

- (MBBackupOperation)initWithDecoder:(id)a3
{
  return 0;
}

- (MBBackupOperation)initWithDecoder:(id)a3 domainManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MBBackupOperation;
  uint64_t v8 = [(MBBackupOperation *)&v20 init];
  if (v8)
  {
    id v9 = [v6 decodeInt8];
    if (v9 >= 5)
    {
      id v19 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, @"Invalid type: %d", v9);
    }
    else
    {
      v8->_type = (int)v9;
      v8->_flags = [v6 decodeInt8];
      uint64_t v10 = [v6 decodeString];
      if (v10
        && ([v7 domainForName:v10],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            domain = v8->_domain,
            v8->_domain = (MBDomain *)v11,
            domain,
            !v8->_domain))
      {
        id v19 = [objc_alloc((Class)MBException) initWithCode:11, @"Invalid domain name: %@", v10 format];
      }
      else
      {
        id v13 = [v6 decodeData];
        if (!v13
          || (v14 = [[MBFileID alloc] initWithData:v13],
              fileID = v8->_fileID,
              v8->_fileID = v14,
              fileID,
              v8->_fileID))
        {
          uint64_t v16 = [v6 decodeString];
          path = v8->_path;
          v8->_path = (NSString *)v16;

          v8->_size = (unint64_t)[v6 decodeInt64];
          goto LABEL_8;
        }
        id v19 = [objc_alloc((Class)MBException) initWithCode:11, @"Invalid file ID data: %@", v13 format];
      }
    }
    objc_exception_throw(v19);
  }
LABEL_8:

  return v8;
}

- (NSString)typeName
{
  return (NSString *)+[MBBackupOperation nameForType:self->_type];
}

- (void)encode:(id)a3
{
  uint64_t type_low = SLOBYTE(self->_type);
  id v7 = a3;
  [v7 encodeInt8:type_low];
  [v7 encodeInt8:(char)self->_flags];
  v5 = [(MBDomain *)self->_domain name];
  [v7 encodeString:v5];

  id v6 = [(MBFileID *)self->_fileID data];
  [v7 encodeData:v6];

  [v7 encodeString:self->_path];
  [v7 encodeInt64:self->_size];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(MBBackupOperation *)self typeName];
  v5 = +[NSString stringWithFormat:@"<%@: type=%@, domain=%@, fileID=%@, path=%@, size=%llu, flags=0x%x>", v3, v4, self->_domain, self->_fileID, self->_path, self->_size, self->_flags];

  return v5;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (MBDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (MBFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end