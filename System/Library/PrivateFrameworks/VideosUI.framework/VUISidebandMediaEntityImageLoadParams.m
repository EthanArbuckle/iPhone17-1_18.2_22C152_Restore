@interface VUISidebandMediaEntityImageLoadParams
- (BOOL)isEqual:(id)a3;
- (NSString)imageIdentifier;
- (NSString)imageIdentifierInternal;
- (VUIImageInfoManagedObject)imageInfo;
- (VUISidebandMediaEntityImageLoadParams)initWithVideoManagedObject:(id)a3 imageType:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)imageType;
- (unint64_t)imageTypeInternal;
- (void)setImageIdentifierInternal:(id)a3;
- (void)setImageInfo:(id)a3;
- (void)setImageTypeInternal:(unint64_t)a3;
@end

@implementation VUISidebandMediaEntityImageLoadParams

- (VUISidebandMediaEntityImageLoadParams)initWithVideoManagedObject:(id)a3 imageType:(unint64_t)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VUISidebandMediaEntityImageLoadParams;
  v7 = [(VUISidebandMediaEntityImageLoadParams *)&v30 init];
  if (v7)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__8;
    v28 = __Block_byref_object_dispose__8;
    id v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__8;
    v22 = __Block_byref_object_dispose__8;
    id v23 = 0;
    v8 = [v6 managedObjectContext];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __78__VUISidebandMediaEntityImageLoadParams_initWithVideoManagedObject_imageType___block_invoke;
    v13 = &unk_1E6DF7C10;
    id v14 = v6;
    v15 = &v24;
    v16 = &v18;
    unint64_t v17 = a4;
    [v8 performBlockAndWait:&v10];

    if (v25[5] && objc_msgSend((id)v19[5], "length", v10, v11, v12, v13))
    {
      objc_storeStrong((id *)&v7->_imageInfo, (id)v25[5]);
      objc_storeStrong((id *)&v7->_imageIdentifierInternal, (id)v19[5]);
      v7->_imageTypeInternal = a4;
    }
    else
    {

      v7 = 0;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  return v7;
}

void __78__VUISidebandMediaEntityImageLoadParams_initWithVideoManagedObject_imageType___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !*(void *)(a1 + 56))
  {
    v16 = [*(id *)(a1 + 32) series];
    v2 = [v16 imageInfos];
  }
  else
  {
    v2 = [*(id *)(a1 + 32) imageInfos];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v8 imageType] == *(void *)(a1 + 56))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
          v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) urlFormat];
          if ([v9 length])
          {
            uint64_t v10 = NSString;
            uint64_t v11 = VUIImageTypeString(*(void *)(a1 + 56));
            v12 = [v10 stringWithFormat:@"%@_%@", v9, v11, (void)v17];
            uint64_t v13 = objc_msgSend(v12, "tv_filenameSafeString");
            uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
            v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;
          }
          goto LABEL_16;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (unint64_t)imageType
{
  return self->_imageTypeInternal;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifierInternal;
}

- (unint64_t)hash
{
  v2 = [(VUISidebandMediaEntityImageLoadParams *)self imageIdentifierInternal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUISidebandMediaEntityImageLoadParams *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(VUISidebandMediaEntityImageLoadParams *)self imageIdentifierInternal];
      uint64_t v6 = [(VUISidebandMediaEntityImageLoadParams *)v4 imageIdentifierInternal];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (VUIImageInfoManagedObject)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (unint64_t)imageTypeInternal
{
  return self->_imageTypeInternal;
}

- (void)setImageTypeInternal:(unint64_t)a3
{
  self->_imageTypeInternal = a3;
}

- (NSString)imageIdentifierInternal
{
  return self->_imageIdentifierInternal;
}

- (void)setImageIdentifierInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIdentifierInternal, 0);
  objc_storeStrong((id *)&self->_imageInfo, 0);
}

@end