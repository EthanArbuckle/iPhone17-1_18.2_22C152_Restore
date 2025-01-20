@interface MSVFrameworkDescription
- (BOOL)isDebug;
- (BOOL)isRoot;
- (MSVFrameworkDescription)initWithName:(id)a3 uuid:(id)a4 version:(id)a5 root:(BOOL)a6 debug:(BOOL)a7;
- (NSString)name;
- (NSString)version;
- (NSUUID)uuid;
- (id)description;
@end

@implementation MSVFrameworkDescription

- (NSString)name
{
  return self->_name;
}

- (MSVFrameworkDescription)initWithName:(id)a3 uuid:(id)a4 version:(id)a5 root:(BOOL)a6 debug:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MSVFrameworkDescription;
  v15 = [(MSVFrameworkDescription *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v18;

    uint64_t v20 = [v14 copy];
    version = v15->_version;
    v15->_version = (NSString *)v20;

    v15->_root = a6;
    v15->_debug = a7;
  }

  return v15;
}

- (BOOL)isRoot
{
  return self->_root;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)version
{
  return self->_version;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSString *)self->_name UTF8String];
  uint64_t v5 = [(NSUUID *)self->_uuid UUIDString];
  v6 = (void *)v5;
  v7 = @"YES";
  if (self->_root) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (!self->_debug) {
    v7 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"name: %-40s; uuid: %@; version: %@; isRoot: %@; isDebug: %@",
    v4,
    v5,
    self->_version,
    v8,
  v9 = v7);

  return v9;
}

@end