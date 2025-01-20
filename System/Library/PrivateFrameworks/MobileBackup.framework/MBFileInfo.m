@interface MBFileInfo
+ (BOOL)supportsSecureCoding;
+ (id)fileInfoWithAbsolutePath:(id)a3 mode:(unsigned __int16)a4 priority:(unint64_t)a5;
+ (id)fileInfoWithRestorable:(id)a3;
- (BOOL)isDirectory;
- (MBFileInfo)initWithCoder:(id)a3;
- (NSDictionary)extendedAttributes;
- (NSString)path;
- (id)_initWithAbsolutePath:(id)a3 extendedAttributes:(id)a4 isDirectory:(BOOL)a5 priority:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)priority;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MBFileInfo

+ (id)fileInfoWithRestorable:(id)a3
{
  id v3 = -[MBFileInfo _initWithAbsolutePath:extendedAttributes:isDirectory:priority:]([MBFileInfo alloc], "_initWithAbsolutePath:extendedAttributes:isDirectory:priority:", [a3 absolutePath], objc_msgSend(a3, "extendedAttributes"), (objc_msgSend(a3, "type") & 0xF000) == 0x4000, objc_msgSend(a3, "priority"));
  return v3;
}

+ (id)fileInfoWithAbsolutePath:(id)a3 mode:(unsigned __int16)a4 priority:(unint64_t)a5
{
  id v5 = [[MBFileInfo alloc] _initWithAbsolutePath:a3 extendedAttributes:0 isDirectory:(a4 & 0xF000) == 0x4000 priority:a5];
  return v5;
}

- (id)_initWithAbsolutePath:(id)a3 extendedAttributes:(id)a4 isDirectory:(BOOL)a5 priority:(unint64_t)a6
{
  v13.receiver = self;
  v13.super_class = (Class)MBFileInfo;
  v10 = [(MBFileInfo *)&v13 init];
  if (v10)
  {
    v10->_path = (NSString *)[a3 copy];
    uint64_t v11 = [a4 copy];
    v10->_isDirectory = a5;
    v10->_extendedAttributes = (NSDictionary *)v11;
    v10->_priority = a6;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBFileInfo)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MBFileInfo;
  v4 = [(MBFileInfo *)&v7 init];
  if (v4)
  {
    v4->_path = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    v4->_isDirectory = [a3 decodeBoolForKey:@"isDirectory"];
    v4->_priority = [a3 decodeIntegerForKey:@"priority"];
    uint64_t v5 = objc_opt_class();
    v4->_extendedAttributes = (NSDictionary *)(id)[a3 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() forKey:@"extendedAttributes"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_path forKey:@"path"];
  [a3 encodeBool:self->_isDirectory forKey:@"isDirectory"];
  [a3 encodeInteger:self->_priority forKey:@"priority"];
  extendedAttributes = self->_extendedAttributes;
  [a3 encodeObject:extendedAttributes forKey:@"extendedAttributes"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBFileInfo;
  [(MBFileInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MBFileInfo alloc];
  path = self->_path;
  extendedAttributes = self->_extendedAttributes;
  BOOL isDirectory = self->_isDirectory;
  unint64_t priority = self->_priority;
  return [(MBFileInfo *)v4 _initWithAbsolutePath:path extendedAttributes:extendedAttributes isDirectory:isDirectory priority:priority];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MBFileInfo;
  id v4 = [(MBFileInfo *)&v7 description];
  uint64_t v5 = "isDir ";
  if (!self->_isDirectory) {
    uint64_t v5 = "";
  }
  return (id)[v3 stringWithFormat:@"%@(%spriority %ld %@ xattr %@)", v4, v5, self->_priority, self->_path, self->_extendedAttributes];
}

- (NSString)path
{
  return self->_path;
}

- (NSDictionary)extendedAttributes
{
  return self->_extendedAttributes;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end