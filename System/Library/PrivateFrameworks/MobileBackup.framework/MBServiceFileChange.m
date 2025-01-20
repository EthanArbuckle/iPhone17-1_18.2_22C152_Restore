@interface MBServiceFileChange
+ (id)fileChange;
+ (id)fileChangeWithFile:(id)a3 type:(int)a4;
+ (id)stringForType:(int)a3;
- (BOOL)isAdded;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFileChange:(id)a3;
- (BOOL)isModified;
- (BOOL)isUnmodified;
- (MBFileID)fileID;
- (MBSFileReference)duplicateFileReference;
- (NSString)domainName;
- (NSString)relativePath;
- (NSString)typeString;
- (id)description;
- (int)result;
- (int)type;
- (int64_t)size;
- (void)dealloc;
- (void)setDomainName:(id)a3;
- (void)setDuplicateFileReference:(id)a3;
- (void)setFileID:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)setResult:(int)a3;
- (void)setSize:(int64_t)a3;
- (void)setType:(int)a3;
@end

@implementation MBServiceFileChange

+ (id)stringForType:(int)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_100415E08[a3];
  }
}

+ (id)fileChange
{
  v2 = objc_alloc_init(MBServiceFileChange);
  return v2;
}

+ (id)fileChangeWithFile:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = objc_alloc_init(MBServiceFileChange);
  -[MBServiceFileChange setFileID:](v6, "setFileID:", [a3 fileID]);
  [(MBServiceFileChange *)v6 setType:v4];
  -[MBServiceFileChange setDomainName:](v6, "setDomainName:", objc_msgSend(objc_msgSend(a3, "domain"), "name"));
  -[MBServiceFileChange setRelativePath:](v6, "setRelativePath:", [a3 relativePath]);
  -[MBServiceFileChange setSize:](v6, "setSize:", [a3 size]);
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBServiceFileChange;
  [(MBServiceFileChange *)&v3 dealloc];
}

- (BOOL)isUnmodified
{
  return self->_type == 0;
}

- (BOOL)isAdded
{
  return self->_type == 1;
}

- (BOOL)isModified
{
  return self->_type == 2;
}

- (BOOL)isDeleted
{
  return self->_type == 3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return _[a3 isEqualToFileChange:self];
}

- (BOOL)isEqualToFileChange:(id)a3
{
  unsigned int v5 = [*((id *)a3 + 2) isEqualToFileID:self->_fileID];
  if (v5)
  {
    if (*((_DWORD *)a3 + 2) != self->_type) {
      goto LABEL_8;
    }
    unsigned int v5 = [*((id *)a3 + 3) isEqualToString:self->_domainName];
    if (v5)
    {
      unsigned int v5 = [*((id *)a3 + 4) isEqualToString:self->_relativePath];
      if (v5)
      {
        unsigned int v5 = [*((id *)a3 + 5) isEqual:self->_duplicateFileReference];
        if (v5)
        {
          if (*((void *)a3 + 6) == self->_size)
          {
            LOBYTE(v5) = *((_DWORD *)a3 + 3) == self->_result;
            return v5;
          }
LABEL_8:
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

- (NSString)typeString
{
  return (NSString *)+[MBServiceFileChange stringForType:self->_type];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: fileID=\"%@\", type=%d, domain=\"%@\", relativePath=\"%@\", duplicateFileReference=%@, size=%llu, result=%d>", objc_opt_class(), self->_fileID, self->_type, self->_domainName, self->_relativePath, self->_duplicateFileReference, self->_size, self->_result];
}

- (MBFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (MBSFileReference)duplicateFileReference
{
  return self->_duplicateFileReference;
}

- (void)setDuplicateFileReference:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

@end