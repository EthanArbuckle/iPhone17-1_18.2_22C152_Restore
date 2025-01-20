@interface SSVMediaSocialPostAttachment
- (BOOL)deletesAssetWhenFinished;
- (BOOL)isExplicitContent;
- (NSArray)artists;
- (NSData)assetData;
- (NSString)UTI;
- (NSString)albumIdentifier;
- (NSString)attachmentDescription;
- (NSString)categoryName;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)assetURL;
- (SSVMediaSocialPostAttachment)initWithXPCEncoding:(id)a3;
- (double)previewFrameTimestamp;
- (id)childAttachmentForRelationship:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)attachmentType;
- (void)enumerateChildAttachmentsUsingBlock:(id)a3;
- (void)setAlbumIdentifier:(id)a3;
- (void)setArtists:(id)a3;
- (void)setAssetData:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setAttachmentDescription:(id)a3;
- (void)setCategoryName:(id)a3;
- (void)setChildAttachment:(id)a3 forRelationship:(id)a4;
- (void)setDeletesAssetWhenFinished:(BOOL)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setPreviewFrameTimestamp:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUTI:(id)a3;
@end

@implementation SSVMediaSocialPostAttachment

- (int64_t)attachmentType
{
  return SSVMediaSocialAttachmentTypeForTypeIdentifier(self->_uti);
}

- (id)childAttachmentForRelationship:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_childAttachments objectForKey:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)enumerateChildAttachmentsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  childAttachments = self->_childAttachments;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SSVMediaSocialPostAttachment_enumerateChildAttachmentsUsingBlock___block_invoke;
  v7[3] = &unk_1E5BAD8A0;
  id v6 = v4;
  id v8 = v6;
  v9 = v10;
  [(NSMutableDictionary *)childAttachments enumerateKeysAndObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __68__SSVMediaSocialPostAttachment_enumerateChildAttachmentsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)setChildAttachment:(id)a3 forRelationship:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = v13;
  id v8 = v6;
  childAttachments = self->_childAttachments;
  if (v13)
  {
    if (!childAttachments)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_childAttachments;
      self->_childAttachments = v10;

      v7 = v13;
    }
    v12 = (void *)[v7 copy];
    [(NSMutableDictionary *)self->_childAttachments setObject:v12 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)childAttachments removeObjectForKey:v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setAlbumIdentifier:self->_albumIdentifier];
  [v5 setArtists:self->_artists];
  [v5 setAssetData:self->_assetData];
  [v5 setAssetURL:self->_assetURL];
  [v5 setAttachmentDescription:self->_attachmentDescription];
  [v5 setCategoryName:self->_categoryName];
  uint64_t v6 = [(NSMutableDictionary *)self->_childAttachments mutableCopyWithZone:a3];
  v7 = (void *)v5[7];
  v5[7] = v6;

  [v5 setDeletesAssetWhenFinished:self->_deletesAssetWhenFinished];
  [v5 setExplicitContent:self->_explicitContent];
  [v5 setPreviewFrameTimestamp:self->_previewFrameTimestamp];
  [v5 setSubtitle:self->_subtitle];
  [v5 setTitle:self->_title];
  [v5 setUTI:self->_uti];
  return v5;
}

- (SSVMediaSocialPostAttachment)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (uint64_t v6 = MEMORY[0x1A62689E0](v4), v7 = MEMORY[0x1E4F14590], v6 == MEMORY[0x1E4F14590]))
  {
    id v8 = [(SSVMediaSocialPostAttachment *)self init];
    if (v8)
    {
      v10 = xpc_dictionary_get_value(v5, "0");
      uint64_t v11 = objc_opt_class();
      v12 = (NSArray *)SSXPCCreateNSArrayFromXPCEncodedArray(v10, v11);
      artists = v8->_artists;
      v8->_artists = v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v14);
      assetData = v8->_assetData;
      v8->_assetData = (NSData *)v15;

      uint64_t v17 = objc_opt_class();
      v18 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
      if (v18)
      {
        uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v18];
        assetURL = v8->_assetURL;
        v8->_assetURL = (NSURL *)v19;
      }
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = SSXPCDictionaryCopyObjectWithClass(v5, "C", v21);
      albumIdentifier = v8->_albumIdentifier;
      v8->_albumIdentifier = (NSString *)v22;

      uint64_t v24 = objc_opt_class();
      uint64_t v25 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v24);
      attachmentDescription = v8->_attachmentDescription;
      v8->_attachmentDescription = (NSString *)v25;

      uint64_t v27 = objc_opt_class();
      uint64_t v28 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v27);
      categoryName = v8->_categoryName;
      v8->_categoryName = (NSString *)v28;

      v8->_deletesAssetWhenFinished = xpc_dictionary_get_BOOL(v5, "9");
      v8->_explicitContent = xpc_dictionary_get_BOOL(v5, "5");
      v8->_previewFrameTimestamp = xpc_dictionary_get_double(v5, "B");
      uint64_t v30 = objc_opt_class();
      uint64_t v31 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v30);
      subtitle = v8->_subtitle;
      v8->_subtitle = (NSString *)v31;

      uint64_t v33 = objc_opt_class();
      uint64_t v34 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v33);
      title = v8->_title;
      v8->_title = (NSString *)v34;

      uint64_t v36 = objc_opt_class();
      uint64_t v37 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v36);
      uti = v8->_uti;
      v8->_uti = (NSString *)v37;

      uint64_t v39 = xpc_dictionary_get_value(v5, "A");
      v40 = (void *)v39;
      if (v39 && MEMORY[0x1A62689E0](v39) == v7)
      {
        v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        childAttachments = v8->_childAttachments;
        v8->_childAttachments = v41;

        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __52__SSVMediaSocialPostAttachment_initWithXPCEncoding___block_invoke;
        applier[3] = &unk_1E5BAAA68;
        v44 = v8;
        xpc_dictionary_apply(v40, applier);
      }
    }
  }
  else
  {

    id v8 = 0;
  }

  return v8;
}

uint64_t __52__SSVMediaSocialPostAttachment_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [[SSVMediaSocialPostAttachment alloc] initWithXPCEncoding:v5];

  if (v6)
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithUTF8String:a2];
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v6 forKey:v7];
  }
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "C", self->_albumIdentifier);
  SSXPCDictionarySetObject(v3, "0", self->_artists);
  SSXPCDictionarySetObject(v3, "1", self->_assetData);
  id v4 = [(NSURL *)self->_assetURL absoluteString];
  SSXPCDictionarySetObject(v3, "2", v4);

  SSXPCDictionarySetObject(v3, "4", self->_attachmentDescription);
  SSXPCDictionarySetObject(v3, "3", self->_categoryName);
  xpc_dictionary_set_BOOL(v3, "9", self->_deletesAssetWhenFinished);
  xpc_dictionary_set_BOOL(v3, "5", self->_explicitContent);
  xpc_dictionary_set_double(v3, "B", self->_previewFrameTimestamp);
  SSXPCDictionarySetObject(v3, "6", self->_subtitle);
  SSXPCDictionarySetObject(v3, "7", self->_title);
  SSXPCDictionarySetObject(v3, "8", self->_uti);
  if (self->_childAttachments)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    childAttachments = self->_childAttachments;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__SSVMediaSocialPostAttachment_copyXPCEncoding__block_invoke;
    v9[3] = &unk_1E5BAD8C8;
    id v10 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)childAttachments enumerateKeysAndObjectsUsingBlock:v9];
    xpc_dictionary_set_value(v3, "A", v7);
  }
  return v3;
}

void __47__SSVMediaSocialPostAttachment_copyXPCEncoding__block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = a3;
  SSXPCDictionarySetObject(v4, [v5 UTF8String], v6);
}

- (NSString)albumIdentifier
{
  return self->_albumIdentifier;
}

- (void)setAlbumIdentifier:(id)a3
{
}

- (NSArray)artists
{
  return self->_artists;
}

- (void)setArtists:(id)a3
{
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (NSString)attachmentDescription
{
  return self->_attachmentDescription;
}

- (void)setAttachmentDescription:(id)a3
{
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (double)previewFrameTimestamp
{
  return self->_previewFrameTimestamp;
}

- (void)setPreviewFrameTimestamp:(double)a3
{
  self->_previewFrameTimestamp = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)UTI
{
  return self->_uti;
}

- (void)setUTI:(id)a3
{
}

- (BOOL)deletesAssetWhenFinished
{
  return self->_deletesAssetWhenFinished;
}

- (void)setDeletesAssetWhenFinished:(BOOL)a3
{
  self->_deletesAssetWhenFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_childAttachments, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_attachmentDescription, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_artists, 0);
  objc_storeStrong((id *)&self->_albumIdentifier, 0);
}

@end