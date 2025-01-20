@interface UISDActivityItemData
+ (BOOL)supportsSecureCoding;
- (BOOL)canAccessFileURL:(id)a3;
- (NSArray)securityContexts;
- (NSDictionary)openURLAnnotationsByURL;
- (NSMutableDictionary)attachmentNamesByItem;
- (NSMutableDictionary)dataTypesByItem;
- (NSMutableDictionary)previewImageDataByItem;
- (NSMutableDictionary)previewImagesByItem;
- (NSMutableDictionary)subjectsByItem;
- (UISDActivityItemData)init;
- (UISDActivityItemData)initWithCoder:(id)a3;
- (id)attachmentNameForItem:(id)a3;
- (id)dataTypeForItem:(id)a3;
- (id)previewImageDataForItem:(id)a3;
- (id)previewImageForItem:(id)a3;
- (id)subjectForItem:(id)a3;
- (void)addAttachmentName:(id)a3 forItem:(id)a4;
- (void)addDataType:(id)a3 forItem:(id)a4;
- (void)addPreviewImage:(id)a3 forItem:(id)a4;
- (void)addPreviewImageData:(id)a3 forItem:(id)a4;
- (void)addSubject:(id)a3 forItem:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setOpenURLAnnotationsByURL:(id)a3;
- (void)setSecurityContexts:(id)a3;
@end

@implementation UISDActivityItemData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISDActivityItemData)init
{
  v18.receiver = self;
  v18.super_class = (Class)UISDActivityItemData;
  v2 = [(UISDActivityItemData *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    attachmentNamesByItem = v2->_attachmentNamesByItem;
    v2->_attachmentNamesByItem = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    subjectsByItem = v2->_subjectsByItem;
    v2->_subjectsByItem = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    previewImagesByItem = v2->_previewImagesByItem;
    v2->_previewImagesByItem = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    previewImageDataByItem = v2->_previewImageDataByItem;
    v2->_previewImageDataByItem = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    dataTypesByItem = v2->_dataTypesByItem;
    v2->_dataTypesByItem = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    openURLAnnotationsByURL = v2->_openURLAnnotationsByURL;
    v2->_openURLAnnotationsByURL = (NSDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    securityContexts = v2->_securityContexts;
    v2->_securityContexts = (NSArray *)v15;
  }
  return v2;
}

- (UISDActivityItemData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UISDActivityItemData *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_attachmentNamesByItem);
    uint64_t v7 = _UISecureDecodeExtensionItemsWithKey(v4, v6);
    attachmentNamesByItem = v5->_attachmentNamesByItem;
    v5->_attachmentNamesByItem = (NSMutableDictionary *)v7;

    uint64_t v9 = NSStringFromSelector(sel_subjectsByItem);
    uint64_t v10 = _UISecureDecodeExtensionItemsWithKey(v4, v9);
    subjectsByItem = v5->_subjectsByItem;
    v5->_subjectsByItem = (NSMutableDictionary *)v10;

    v12 = NSStringFromSelector(sel_previewImagesByItem);
    uint64_t v13 = _UISecureDecodeExtensionItemsWithKey(v4, v12);
    previewImagesByItem = v5->_previewImagesByItem;
    v5->_previewImagesByItem = (NSMutableDictionary *)v13;

    uint64_t v15 = NSStringFromSelector(sel_previewImageDataByItem);
    uint64_t v16 = _UISecureDecodeExtensionItemsWithKey(v4, v15);
    previewImageDataByItem = v5->_previewImageDataByItem;
    v5->_previewImageDataByItem = (NSMutableDictionary *)v16;

    objc_super v18 = NSStringFromSelector(sel_dataTypesByItem);
    uint64_t v19 = _UISecureDecodeExtensionItemsWithKey(v4, v18);
    dataTypesByItem = v5->_dataTypesByItem;
    v5->_dataTypesByItem = (NSMutableDictionary *)v19;

    v21 = _UISecureStandardPropertyListClasses();
    v22 = NSStringFromSelector(sel_openURLAnnotationsByURL);
    uint64_t v23 = [v4 decodeObjectOfClasses:v21 forKey:v22];
    openURLAnnotationsByURL = v5->_openURLAnnotationsByURL;
    v5->_openURLAnnotationsByURL = (NSDictionary *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = NSStringFromSelector(sel_securityContexts);
    uint64_t v29 = [v4 decodeObjectOfClasses:v27 forKey:v28];
    securityContexts = v5->_securityContexts;
    v5->_securityContexts = (NSArray *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  attachmentNamesByItem = self->_attachmentNamesByItem;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_attachmentNamesByItem);
  [v5 encodeObject:attachmentNamesByItem forKey:v6];

  subjectsByItem = self->_subjectsByItem;
  v8 = NSStringFromSelector(sel_subjectsByItem);
  [v5 encodeObject:subjectsByItem forKey:v8];

  previewImagesByItem = self->_previewImagesByItem;
  uint64_t v10 = NSStringFromSelector(sel_previewImagesByItem);
  [v5 encodeObject:previewImagesByItem forKey:v10];

  previewImageDataByItem = self->_previewImageDataByItem;
  v12 = NSStringFromSelector(sel_previewImageDataByItem);
  [v5 encodeObject:previewImageDataByItem forKey:v12];

  dataTypesByItem = self->_dataTypesByItem;
  v14 = NSStringFromSelector(sel_dataTypesByItem);
  [v5 encodeObject:dataTypesByItem forKey:v14];

  openURLAnnotationsByURL = self->_openURLAnnotationsByURL;
  uint64_t v16 = NSStringFromSelector(sel_openURLAnnotationsByURL);
  [v5 encodeObject:openURLAnnotationsByURL forKey:v16];

  securityContexts = self->_securityContexts;
  NSStringFromSelector(sel_securityContexts);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:securityContexts forKey:v18];
}

- (void)addAttachmentName:(id)a3 forItem:(id)a4
{
}

- (id)attachmentNameForItem:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_attachmentNamesByItem objectForKeyedSubscript:a3];
}

- (void)addSubject:(id)a3 forItem:(id)a4
{
}

- (id)subjectForItem:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_subjectsByItem objectForKeyedSubscript:a3];
}

- (void)addPreviewImage:(id)a3 forItem:(id)a4
{
}

- (id)previewImageForItem:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_previewImagesByItem objectForKeyedSubscript:a3];
}

- (void)addPreviewImageData:(id)a3 forItem:(id)a4
{
}

- (id)previewImageDataForItem:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_previewImageDataByItem objectForKeyedSubscript:a3];
}

- (void)addDataType:(id)a3 forItem:(id)a4
{
}

- (id)dataTypeForItem:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dataTypesByItem objectForKeyedSubscript:a3];
}

- (BOOL)canAccessFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(UISDActivityItemData *)self securityContexts];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__UISDActivityItemData_canAccessFileURL___block_invoke;
  v8[3] = &unk_1E5A22C50;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __41__UISDActivityItemData_canAccessFileURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 accessibleURLs];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSArray)securityContexts
{
  return self->_securityContexts;
}

- (void)setSecurityContexts:(id)a3
{
}

- (NSDictionary)openURLAnnotationsByURL
{
  return self->_openURLAnnotationsByURL;
}

- (void)setOpenURLAnnotationsByURL:(id)a3
{
}

- (NSMutableDictionary)attachmentNamesByItem
{
  return self->_attachmentNamesByItem;
}

- (NSMutableDictionary)subjectsByItem
{
  return self->_subjectsByItem;
}

- (NSMutableDictionary)previewImagesByItem
{
  return self->_previewImagesByItem;
}

- (NSMutableDictionary)previewImageDataByItem
{
  return self->_previewImageDataByItem;
}

- (NSMutableDictionary)dataTypesByItem
{
  return self->_dataTypesByItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypesByItem, 0);
  objc_storeStrong((id *)&self->_previewImageDataByItem, 0);
  objc_storeStrong((id *)&self->_previewImagesByItem, 0);
  objc_storeStrong((id *)&self->_subjectsByItem, 0);
  objc_storeStrong((id *)&self->_attachmentNamesByItem, 0);
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, 0);
  objc_storeStrong((id *)&self->_securityContexts, 0);
}

@end