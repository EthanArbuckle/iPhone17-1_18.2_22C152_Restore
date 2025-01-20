@interface SSPlistCacheObject
+ (id)cacheObjectTypeIdentifier;
- (SSPlistCacheObject)initWithCacheObjectDataRepresentation:(id)a3;
- (id)cacheObjectDataRepresentation;
- (id)cacheObjectTypeIdentifier;
- (id)plist;
- (void)dealloc;
- (void)setPlist:(id)a3;
@end

@implementation SSPlistCacheObject

+ (id)cacheObjectTypeIdentifier
{
  return @"bplist";
}

- (void)setPlist:(id)a3
{
  plist = self->_plist;
  if (plist != a3)
  {

    self->_plist = (NSDictionary *)a3;
  }
}

- (id)plist
{
  v2 = self->_plist;
  return v2;
}

- (id)cacheObjectTypeIdentifier
{
  return +[SSPlistCacheObject cacheObjectTypeIdentifier];
}

- (id)cacheObjectDataRepresentation
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_plist format:100 options:0 error:0];
}

- (SSPlistCacheObject)initWithCacheObjectDataRepresentation:(id)a3
{
  v4 = [(SSPlistCacheObject *)self init];
  if (v4) {
    v4->_plist = (NSDictionary *)(id)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSPlistCacheObject;
  [(SSPlistCacheObject *)&v3 dealloc];
}

@end