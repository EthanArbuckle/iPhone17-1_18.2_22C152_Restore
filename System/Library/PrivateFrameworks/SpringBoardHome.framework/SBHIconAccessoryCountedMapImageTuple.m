@interface SBHIconAccessoryCountedMapImageTuple
- (BOOL)isEqual:(id)a3;
- (NSCopying)sbh_countedMapKey;
- (SBHIconAccessoryCountedMapImageTuple)initWithImage:(id)a3 countedMapKey:(id)a4;
- (SBHIconAccessoryCountedMapImageTuple)initWithImage:(id)a3 countedMapKey:(id)a4 hash:(unint64_t)a5;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation SBHIconAccessoryCountedMapImageTuple

- (UIImage)image
{
  return self->_image;
}

- (NSCopying)sbh_countedMapKey
{
  return self->_countedMapKey;
}

- (SBHIconAccessoryCountedMapImageTuple)initWithImage:(id)a3 countedMapKey:(id)a4 hash:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHIconAccessoryCountedMapImageTuple;
  v11 = [(SBHIconAccessoryCountedMapImageTuple *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    objc_storeStrong((id *)&v12->_countedMapKey, a4);
    v12->_hash = a5;
  }

  return v12;
}

- (SBHIconAccessoryCountedMapImageTuple)initWithImage:(id)a3 countedMapKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogIcon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_INFO, "Assigning asset '%@' mapkey of %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F4F758] builder];
  id v10 = [v9 appendObject:v6];
  v11 = [v10 appendObject:v7];
  uint64_t v12 = [v11 hash];

  v13 = [(SBHIconAccessoryCountedMapImageTuple *)self initWithImage:v6 countedMapKey:v7 hash:v12];
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    countedMapKey = self->_countedMapKey;
    image = self->_image;
    int v9 = 138412546;
    id v10 = image;
    __int16 v11 = 2112;
    uint64_t v12 = countedMapKey;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Copying asset '%@' mapkey of %@", (uint8_t *)&v9, 0x16u);
  }

  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImage:countedMapKey:hash:", self->_image, self->_countedMapKey, self->_hash);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = SBLogIcon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    countedMapKey = self->_countedMapKey;
    image = self->_image;
    *(_DWORD *)buf = 138412546;
    v8 = image;
    __int16 v9 = 2112;
    id v10 = countedMapKey;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Dealloc asset '%@' mapkey of %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBHIconAccessoryCountedMapImageTuple;
  [(SBHIconAccessoryCountedMapImageTuple *)&v6 dealloc];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconAccessoryCountedMapImageTuple *)a3;
  if (v4 == self)
  {
    char v11 = 1;
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
    objc_super v6 = v5;
    if (v6)
    {
      id v7 = [(SBHIconAccessoryCountedMapImageTuple *)self image];
      v8 = [(SBHIconAccessoryCountedMapImageTuple *)v6 image];
      if (BSEqualObjects())
      {
        __int16 v9 = [(SBHIconAccessoryCountedMapImageTuple *)self sbh_countedMapKey];
        id v10 = [(SBHIconAccessoryCountedMapImageTuple *)v6 sbh_countedMapKey];
        char v11 = BSEqualObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_countedMapKey, 0);
}

@end