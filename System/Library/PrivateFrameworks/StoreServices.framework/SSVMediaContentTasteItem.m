@interface SSVMediaContentTasteItem
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)playlistGlobalID;
- (SSVMediaContentTasteItem)initWithCoder:(id)a3;
- (SSVMediaContentTasteItem)initWithXPCEncoding:(id)a3;
- (id)_copyWithMediaContentTasteItemClass:(Class)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)storeAdamID;
- (unint64_t)contentType;
- (unint64_t)tasteType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSVMediaContentTasteItem

- (SSVMediaContentTasteItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSVMediaContentTasteItem *)self init];
  if (v5)
  {
    v5->_contentType = [v4 decodeIntegerForKey:@"SSVMediaContentTasteItemContentType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSVMediaContentTasteItemPlaylistGlobalID"];
    playlistGlobalID = v5->_playlistGlobalID;
    v5->_playlistGlobalID = (NSString *)v6;

    v5->_storeAdamID = [v4 decodeInt64ForKey:@"SSVMediaContentTasteItemStoreAdamID"];
    v5->_tasteType = [v4 decodeIntegerForKey:@"SSVMediaContentTasteItemTasteType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t contentType = self->_contentType;
  id v5 = a3;
  [v5 encodeInteger:contentType forKey:@"SSVMediaContentTasteItemContentType"];
  [v5 encodeObject:self->_playlistGlobalID forKey:@"SSVMediaContentTasteItemPlaylistGlobalID"];
  [v5 encodeInt64:self->_storeAdamID forKey:@"SSVMediaContentTasteItemStoreAdamID"];
  [v5 encodeInteger:self->_tasteType forKey:@"SSVMediaContentTasteItemTasteType"];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)v5;
  unint64_t contentType = self->_contentType;
  if (contentType > 4) {
    v8 = 0;
  }
  else {
    v8 = off_1E5BABEB0[contentType];
  }
  v9 = [v3 stringWithFormat:@"<%@ %p contentType:%@", v5, self, v8];

  if ([(NSString *)self->_playlistGlobalID length]) {
    [v9 appendFormat:@" playlistGlobalID:'%@'", self->_playlistGlobalID];
  }
  else {
    objc_msgSend(v9, "appendFormat:", @" storeAdamID:%lli", self->_storeAdamID);
  }
  objc_msgSend(v9, "appendFormat:", @" tasteType:%td>", self->_tasteType);
  return (NSString *)v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SSVMediaContentTasteItem *)self _copyWithMediaContentTasteItemClass:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSVMediaContentTasteItem)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(v4, v5);

  v7 = (SSVMediaContentTasteItem *)NSSecureCodingObjectForXPCObject;
  return v7;
}

- (id)_copyWithMediaContentTasteItemClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  uint64_t v5 = v4;
  if (v4)
  {
    *((void *)v4 + 1) = self->_contentType;
    objc_storeStrong((id *)v4 + 2, self->_playlistGlobalID);
    v5[3] = self->_storeAdamID;
    v5[4] = self->_tasteType;
  }
  return v5;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (unint64_t)tasteType
{
  return self->_tasteType;
}

- (void).cxx_destruct
{
}

@end