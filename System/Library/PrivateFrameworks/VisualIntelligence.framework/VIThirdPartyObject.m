@interface VIThirdPartyObject
- (BOOL)isEqual:(id)a3;
- (NSData)metadata;
- (NSString)imageURL;
- (NSString)objectIdentifier;
- (NSString)thumbnailURL;
- (VIThirdPartyObject)initWithObjectIdentifier:(id)a3 imageURL:(id)a4 thumbnailURL:(id)a5 metadata:(id)a6;
- (unint64_t)hash;
@end

@implementation VIThirdPartyObject

- (VIThirdPartyObject)initWithObjectIdentifier:(id)a3 imageURL:(id)a4 thumbnailURL:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VIThirdPartyObject;
  v14 = [(VIThirdPartyObject *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    objectIdentifier = v14->_objectIdentifier;
    v14->_objectIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    imageURL = v14->_imageURL;
    v14->_imageURL = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    thumbnailURL = v14->_thumbnailURL;
    v14->_thumbnailURL = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    metadata = v14->_metadata;
    v14->_metadata = (NSData *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIThirdPartyObject *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    objectIdentifier = self->_objectIdentifier;
    v8 = [(VIThirdPartyObject *)v6 objectIdentifier];
    if (VIObjectIsEqual((unint64_t)objectIdentifier, (uint64_t)v8))
    {
      imageURL = self->_imageURL;
      id v10 = [(VIThirdPartyObject *)v6 imageURL];
      if (VIObjectIsEqual((unint64_t)imageURL, (uint64_t)v10))
      {
        thumbnailURL = self->_thumbnailURL;
        id v12 = [(VIThirdPartyObject *)v6 thumbnailURL];
        if (VIObjectIsEqual((unint64_t)thumbnailURL, (uint64_t)v12))
        {
          metadata = self->_metadata;
          v14 = [(VIThirdPartyObject *)v6 metadata];
          char IsEqual = VIObjectIsEqual((unint64_t)metadata, (uint64_t)v14);
        }
        else
        {
          char IsEqual = 0;
        }
      }
      else
      {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_imageURL hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_thumbnailURL hash];
  return v4 ^ v5 ^ [(NSData *)self->_metadata hash];
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end