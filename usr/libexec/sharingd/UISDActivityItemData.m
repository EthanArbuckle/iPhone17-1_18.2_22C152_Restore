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
    uint64_t v3 = +[NSMutableDictionary dictionary];
    attachmentNamesByItem = v2->_attachmentNamesByItem;
    v2->_attachmentNamesByItem = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    subjectsByItem = v2->_subjectsByItem;
    v2->_subjectsByItem = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    previewImagesByItem = v2->_previewImagesByItem;
    v2->_previewImagesByItem = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    previewImageDataByItem = v2->_previewImageDataByItem;
    v2->_previewImageDataByItem = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    dataTypesByItem = v2->_dataTypesByItem;
    v2->_dataTypesByItem = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
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
    v6 = NSStringFromSelector("attachmentNamesByItem");
    uint64_t v7 = _UISecureDecodeExtensionItemsWithKey();
    attachmentNamesByItem = v5->_attachmentNamesByItem;
    v5->_attachmentNamesByItem = (NSMutableDictionary *)v7;

    uint64_t v9 = NSStringFromSelector("subjectsByItem");
    uint64_t v10 = _UISecureDecodeExtensionItemsWithKey();
    subjectsByItem = v5->_subjectsByItem;
    v5->_subjectsByItem = (NSMutableDictionary *)v10;

    v12 = NSStringFromSelector("previewImagesByItem");
    uint64_t v13 = _UISecureDecodeExtensionItemsWithKey();
    previewImagesByItem = v5->_previewImagesByItem;
    v5->_previewImagesByItem = (NSMutableDictionary *)v13;

    uint64_t v15 = NSStringFromSelector("previewImageDataByItem");
    uint64_t v16 = _UISecureDecodeExtensionItemsWithKey();
    previewImageDataByItem = v5->_previewImageDataByItem;
    v5->_previewImageDataByItem = (NSMutableDictionary *)v16;

    objc_super v18 = NSStringFromSelector("dataTypesByItem");
    uint64_t v19 = _UISecureDecodeExtensionItemsWithKey();
    dataTypesByItem = v5->_dataTypesByItem;
    v5->_dataTypesByItem = (NSMutableDictionary *)v19;

    v21 = _UISecureStandardPropertyListClasses();
    v22 = NSStringFromSelector("openURLAnnotationsByURL");
    uint64_t v23 = [v4 decodeObjectOfClasses:v21 forKey:v22];
    openURLAnnotationsByURL = v5->_openURLAnnotationsByURL;
    v5->_openURLAnnotationsByURL = (NSDictionary *)v23;

    uint64_t v25 = objc_opt_class();
    v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(), 0);
    v27 = NSStringFromSelector("securityContexts");
    uint64_t v28 = [v4 decodeObjectOfClasses:v26 forKey:v27];
    securityContexts = v5->_securityContexts;
    v5->_securityContexts = (NSArray *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  attachmentNamesByItem = self->_attachmentNamesByItem;
  id v5 = a3;
  v6 = NSStringFromSelector("attachmentNamesByItem");
  [v5 encodeObject:attachmentNamesByItem forKey:v6];

  subjectsByItem = self->_subjectsByItem;
  v8 = NSStringFromSelector("subjectsByItem");
  [v5 encodeObject:subjectsByItem forKey:v8];

  previewImagesByItem = self->_previewImagesByItem;
  uint64_t v10 = NSStringFromSelector("previewImagesByItem");
  [v5 encodeObject:previewImagesByItem forKey:v10];

  previewImageDataByItem = self->_previewImageDataByItem;
  v12 = NSStringFromSelector("previewImageDataByItem");
  [v5 encodeObject:previewImageDataByItem forKey:v12];

  dataTypesByItem = self->_dataTypesByItem;
  v14 = NSStringFromSelector("dataTypesByItem");
  [v5 encodeObject:dataTypesByItem forKey:v14];

  openURLAnnotationsByURL = self->_openURLAnnotationsByURL;
  uint64_t v16 = NSStringFromSelector("openURLAnnotationsByURL");
  [v5 encodeObject:openURLAnnotationsByURL forKey:v16];

  securityContexts = self->_securityContexts;
  NSStringFromSelector("securityContexts");
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:securityContexts forKey:v18];
}

- (void)addAttachmentName:(id)a3 forItem:(id)a4
{
}

- (id)attachmentNameForItem:(id)a3
{
  return [(NSMutableDictionary *)self->_attachmentNamesByItem objectForKeyedSubscript:a3];
}

- (void)addSubject:(id)a3 forItem:(id)a4
{
}

- (id)subjectForItem:(id)a3
{
  return [(NSMutableDictionary *)self->_subjectsByItem objectForKeyedSubscript:a3];
}

- (void)addPreviewImage:(id)a3 forItem:(id)a4
{
}

- (id)previewImageForItem:(id)a3
{
  return [(NSMutableDictionary *)self->_previewImagesByItem objectForKeyedSubscript:a3];
}

- (void)addPreviewImageData:(id)a3 forItem:(id)a4
{
}

- (id)previewImageDataForItem:(id)a3
{
  return [(NSMutableDictionary *)self->_previewImageDataByItem objectForKeyedSubscript:a3];
}

- (void)addDataType:(id)a3 forItem:(id)a4
{
}

- (id)dataTypeForItem:(id)a3
{
  return [(NSMutableDictionary *)self->_dataTypesByItem objectForKeyedSubscript:a3];
}

- (BOOL)canAccessFileURL:(id)a3
{
  id v5 = a3;
  if (([v5 isFileURL] & 1) == 0)
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UISDActivityItemData.m", 121, @"url provided is not a fileURL:%@", v5 object file lineNumber description];
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v6 = [(UISDActivityItemData *)self securityContexts];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F0E54;
  v11[3] = &unk_1008CD250;
  SEL v14 = a2;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  uint64_t v13 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];

  char v8 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v8;
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