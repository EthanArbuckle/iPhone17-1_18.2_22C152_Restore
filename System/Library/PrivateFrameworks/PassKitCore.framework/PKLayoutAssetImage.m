@interface PKLayoutAssetImage
+ (id)assetKey;
+ (id)nameToAssetsMapFromDictionaries:(id)a3;
- (NSArray)subimages;
- (NSDictionary)configuration;
- (NSString)name;
- (PKLayoutAssetImage)initWithName:(id)a3 remoteImage:(id)a4;
- (PKLayoutAssetImage)initWithName:(id)a3 subimages:(id)a4;
- (PKOSVersionRequirementRange)osVersionRange;
- (PKRemoteImageSet)remoteImage;
- (void)setConfiguration:(id)a3;
- (void)setName:(id)a3;
- (void)setOsVersionRange:(id)a3;
- (void)setRemoteImage:(id)a3;
- (void)setSubimages:(id)a3;
@end

@implementation PKLayoutAssetImage

+ (id)assetKey
{
  return @"images";
}

+ (id)nameToAssetsMapFromDictionaries:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      v5 = [MEMORY[0x1E4F1CA60] dictionary];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke;
      v16[3] = &unk_1E56EEAA0;
      id v17 = v5;
      id v6 = v5;
      [v4 enumerateObjectsUsingBlock:v16];
      v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_24;
      v14 = &unk_1E56F2A78;
      id v15 = v7;
      id v8 = v7;
      [v6 enumerateKeysAndObjectsUsingBlock:&v11];
      v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);
    }
    else
    {
      v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 PKStringForKey:@"key"];
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [[PKRemoteImage alloc] initWithDictionary:v12];
    id v6 = [*(id *)(a1 + 32) objectForKey:v4];
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(a1 + 32) setObject:v6 forKey:v4];
    }
    uint64_t v7 = [v12 PKNumberForKey:@"index"];
    id v8 = (void *)v7;
    v9 = &unk_1EE22C548;
    if (v7) {
      v9 = (void *)v7;
    }
    id v10 = v9;

    uint64_t v11 = [v6 objectForKey:v10];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      [v6 setObject:v11 forKey:v10];
    }
    [v11 safelyAddObject:v5];
  }
}

void __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v5 count];
  if (v6 < 2)
  {
    v22 = 0;
  }
  else
  {
    v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  }
  v21 = v4;
  uint64_t v7 = 0;
  if (![v5 count])
  {
LABEL_11:
    if (v6 < 2)
    {
      v9 = [[PKLayoutAssetImage alloc] initWithName:v4 remoteImage:v7];
      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_27;
      v23[3] = &unk_1E56F2A50;
      id v15 = v4;
      v24 = v15;
      v16 = objc_msgSend(v22, "pk_arrayBySafelyApplyingBlock:", v23);
      v9 = [[PKLayoutAssetImage alloc] initWithName:v15 subimages:v16];

      if (v9)
      {
LABEL_13:
        id v17 = *(void **)(a1 + 32);
        v25 = v9;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        v19 = v17;
        v4 = v21;
        [v19 safelySetObject:v18 forKey:v21];
        goto LABEL_20;
      }
    }
    v18 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v4 = v21;
      v27 = v21;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Error parsing image set %@", buf, 0xCu);
      v9 = 0;
    }
    else
    {
      v4 = v21;
    }
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  while (1)
  {
    v9 = [NSNumber numberWithInteger:v8];
    uint64_t v10 = [v5 objectForKey:v9];
    if (!v10) {
      break;
    }
    uint64_t v11 = (void *)v10;
    id v12 = [[PKRemoteImageSet alloc] initWithName:v4 images:v10];
    v13 = v12;
    if (v6 < 2)
    {
      v14 = v12;

      uint64_t v7 = v14;
      v4 = v21;
    }
    else
    {
      [v22 safelyAddObject:v12];
    }

    if (++v8 >= (unint64_t)[v5 count]) {
      goto LABEL_11;
    }
  }
  v18 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v9;
    __int16 v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Missing image for index %@ in image group %@", buf, 0x16u);
  }
LABEL_20:
}

PKLayoutAssetImage *__54__PKLayoutAssetImage_nameToAssetsMapFromDictionaries___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PKLayoutAssetImage alloc] initWithName:*(void *)(a1 + 32) remoteImage:v3];

  return v4;
}

- (PKLayoutAssetImage)initWithName:(id)a3 remoteImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKLayoutAssetImage;
  v9 = [(PKLayoutAssetImage *)&v13 init];
  if (!v9) {
    goto LABEL_6;
  }
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = [v7 length];
  uint64_t v11 = 0;
  if (v8 && v10)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_remoteImage, a4);
LABEL_6:
    uint64_t v11 = v9;
  }
LABEL_8:

  return v11;
}

- (PKLayoutAssetImage)initWithName:(id)a3 subimages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKLayoutAssetImage;
  v9 = [(PKLayoutAssetImage *)&v13 init];
  if (!v9) {
    goto LABEL_6;
  }
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = [v7 length];
  uint64_t v11 = 0;
  if (v8 && v10)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_subimages, a4);
LABEL_6:
    uint64_t v11 = v9;
  }
LABEL_8:

  return v11;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)subimages
{
  return self->_subimages;
}

- (void)setSubimages:(id)a3
{
}

- (PKRemoteImageSet)remoteImage
{
  return self->_remoteImage;
}

- (void)setRemoteImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteImage, 0);
  objc_storeStrong((id *)&self->_subimages, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end