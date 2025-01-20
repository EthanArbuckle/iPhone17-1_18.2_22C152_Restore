@interface _PXAssetResourceBag
- (NSURL)url;
- (_PXAssetResourceBag)initWithResourceType:(int64_t)a3 atURL:(id)a4;
- (int64_t)resourceType;
@end

@implementation _PXAssetResourceBag

- (void).cxx_destruct
{
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (_PXAssetResourceBag)initWithResourceType:(int64_t)a3 atURL:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_PXAssetResourceBag;
  v8 = [(_PXAssetResourceBag *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_resourceType = a3;
    objc_storeStrong((id *)&v8->_url, a4);
  }

  return v9;
}

@end