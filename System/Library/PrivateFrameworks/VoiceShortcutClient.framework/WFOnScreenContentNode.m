@interface WFOnScreenContentNode
+ (BOOL)supportsSecureCoding;
- (CGRect)applicationFrame;
- (INFile)file;
- (LPLinkMetadata)linkPresentationMetadata;
- (NSArray)children;
- (NSDate)fileCreationDate;
- (NSNumber)applicationLevel;
- (NSString)applicationBundleIdentifier;
- (NSString)chatRegistryContinuityKey;
- (NSString)contactIdentifier;
- (NSString)fileTypeIdentifier;
- (NSString)photoAssetIdentifier;
- (NSString)source;
- (NSString)string;
- (NSURL)URL;
- (WFContentItem)contentItem;
- (WFOnScreenContentNode)init;
- (WFOnScreenContentNode)initWithCoder:(id)a3;
- (WFOnScreenContentNode)initWithContentItem:(id)a3 file:(id)a4 applicationBundleIdentifier:(id)a5 applicationFrame:(CGRect)a6 applicationLevel:(id)a7 source:(id)a8 linkPresentationMetadata:(id)a9;
- (WFOnScreenContentNode)initWithContentItem:(id)a3 file:(id)a4 applicationBundleIdentifier:(id)a5 source:(id)a6;
- (WFOnScreenContentNode)initWithFile:(id)a3 applicationBundleIdentifier:(id)a4 source:(id)a5;
- (void)addChild:(id)a3;
- (void)addChildren:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)populateObjectsFromContentItem:(id)a3;
- (void)removeChild:(id)a3;
- (void)setChatRegistryContinuityKey:(id)a3;
@end

@implementation WFOnScreenContentNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_linkPresentationMetadata, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_photoAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_chatRegistryContinuityKey, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSString)source
{
  return self->_source;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (LPLinkMetadata)linkPresentationMetadata
{
  return self->_linkPresentationMetadata;
}

- (NSNumber)applicationLevel
{
  return self->_applicationLevel;
}

- (CGRect)applicationFrame
{
  double x = self->_applicationFrame.origin.x;
  double y = self->_applicationFrame.origin.y;
  double width = self->_applicationFrame.size.width;
  double height = self->_applicationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)photoAssetIdentifier
{
  return self->_photoAssetIdentifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setChatRegistryContinuityKey:(id)a3
{
}

- (NSString)chatRegistryContinuityKey
{
  return self->_chatRegistryContinuityKey;
}

- (NSArray)children
{
  return self->_children;
}

- (INFile)file
{
  return self->_file;
}

- (NSString)string
{
  return self->_string;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFOnScreenContentNode *)self string];
  [v4 encodeObject:v5 forKey:@"string"];

  v6 = [(WFOnScreenContentNode *)self URL];
  [v4 encodeObject:v6 forKey:@"URL"];

  v7 = [(WFOnScreenContentNode *)self file];
  [v4 encodeObject:v7 forKey:@"file"];

  v8 = [(WFOnScreenContentNode *)self contentItem];
  [v4 encodeObject:v8 forKey:@"contentItem"];

  v9 = [(WFOnScreenContentNode *)self applicationBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"applicationBundleIdentifier"];

  v10 = [(WFOnScreenContentNode *)self applicationLevel];
  [v4 encodeObject:v10 forKey:@"applicationLevel"];

  v11 = [(WFOnScreenContentNode *)self source];
  [v4 encodeObject:v11 forKey:@"source"];

  v12 = [(WFOnScreenContentNode *)self chatRegistryContinuityKey];
  [v4 encodeObject:v12 forKey:@"chatRegistryContinuityKey"];

  v13 = [(WFOnScreenContentNode *)self contactIdentifier];
  [v4 encodeObject:v13 forKey:@"contactIdentifier"];

  v14 = [(WFOnScreenContentNode *)self photoAssetIdentifier];
  [v4 encodeObject:v14 forKey:@"photoAssetIdentifier"];

  v15 = [(WFOnScreenContentNode *)self linkPresentationMetadata];
  [v4 encodeObject:v15 forKey:@"linkPresentationMetadata"];

  [(WFOnScreenContentNode *)self applicationFrame];
  v22[0] = v16;
  v22[1] = v17;
  v22[2] = v18;
  v22[3] = v19;
  v20 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v4 encodeObject:v20 forKey:@"applicationFrame"];

  v21 = [(WFOnScreenContentNode *)self children];
  [v4 encodeObject:v21 forKey:@"children"];
}

- (WFOnScreenContentNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)WFOnScreenContentNode;
  v5 = [(WFOnScreenContentNode *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
    v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    NSUInteger sizep = 0;
    p_NSUInteger sizep = &sizep;
    uint64_t v48 = 0x2050000000;
    v13 = (void *)getWFContentItemClass_softClass_12939;
    uint64_t v49 = getWFContentItemClass_softClass_12939;
    if (!getWFContentItemClass_softClass_12939)
    {
      *(void *)&long long v43 = MEMORY[0x1E4F143A8];
      *((void *)&v43 + 1) = 3221225472;
      *(void *)&long long v44 = __getWFContentItemClass_block_invoke_12940;
      *((void *)&v44 + 1) = &unk_1E6079C28;
      v45 = &sizep;
      __getWFContentItemClass_block_invoke_12940((uint64_t)&v43);
      v13 = (void *)p_sizep[3];
    }
    id v14 = v13;
    _Block_object_dispose(&sizep, 8);
    v15 = objc_msgSend(v12, "setWithObjects:", v14, 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"contentItem"];
    uint64_t v17 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    uint64_t v19 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v18;

    *((void *)v5 + 9) = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationLevel"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    v21 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chatRegistryContinuityKey"];
    v23 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    v25 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoAssetIdentifier"];
    v27 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v26;

    NSUInteger sizep = 0;
    p_NSUInteger sizep = &sizep;
    uint64_t v48 = 0x2050000000;
    v28 = (void *)getLPLinkMetadataClass_softClass_12942;
    uint64_t v49 = getLPLinkMetadataClass_softClass_12942;
    if (!getLPLinkMetadataClass_softClass_12942)
    {
      *(void *)&long long v43 = MEMORY[0x1E4F143A8];
      *((void *)&v43 + 1) = 3221225472;
      *(void *)&long long v44 = __getLPLinkMetadataClass_block_invoke_12943;
      *((void *)&v44 + 1) = &unk_1E6079C28;
      v45 = &sizep;
      __getLPLinkMetadataClass_block_invoke_12943((uint64_t)&v43);
      v28 = (void *)p_sizep[3];
    }
    id v29 = v28;
    _Block_object_dispose(&sizep, 8);
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkPresentationMetadata"];
    v31 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationFrame"];
    long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v43 = *MEMORY[0x1E4F1DB20];
    long long v44 = v33;
    NSUInteger sizep = 0;
    NSGetSizeAndAlignment("{CGRect={CGPoint=dd}{CGSize=dd}}", &sizep, 0);
    if (sizep == 32)
    {
      [v32 getValue:&v43];
      long long v34 = v44;
      *(_OWORD *)(v5 + 104) = v43;
      *(_OWORD *)(v5 + 120) = v34;
    }
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"children"];
    v39 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v38;

    v40 = v5;
  }

  return (WFOnScreenContentNode *)v5;
}

- (void)populateObjectsFromContentItem:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v5 = (void *)getWFStringContentItemClass_softClass;
  uint64_t v32 = getWFStringContentItemClass_softClass;
  if (!getWFStringContentItemClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getWFStringContentItemClass_block_invoke;
    v27 = &unk_1E6079C28;
    v28 = &v29;
    __getWFStringContentItemClass_block_invoke((uint64_t)&v24);
    v5 = (void *)v30[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v29, 8);
  if (objc_opt_isKindOfClass())
  {
    v7 = [v4 string];
    id string = self->_string;
    self->_id string = v7;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v9 = (void *)getWFURLContentItemClass_softClass;
  uint64_t v32 = getWFURLContentItemClass_softClass;
  if (!getWFURLContentItemClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getWFURLContentItemClass_block_invoke;
    v27 = &unk_1E6079C28;
    v28 = &v29;
    __getWFURLContentItemClass_block_invoke((uint64_t)&v24);
    v9 = (void *)v30[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v29, 8);
  if (objc_opt_isKindOfClass())
  {
    v11 = [v4 URL];
    id string = self->_URL;
    self->_URL = v11;
    goto LABEL_17;
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v12 = (void *)getWFContactContentItemClass_softClass;
  uint64_t v32 = getWFContactContentItemClass_softClass;
  if (!getWFContactContentItemClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getWFContactContentItemClass_block_invoke;
    v27 = &unk_1E6079C28;
    v28 = &v29;
    __getWFContactContentItemClass_block_invoke((uint64_t)&v24);
    v12 = (void *)v30[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v29, 8);
  if (objc_opt_isKindOfClass())
  {
    id string = v4;
    id v14 = [string contact];
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v15 = (void *)getWFCNContactClass_softClass;
    uint64_t v32 = getWFCNContactClass_softClass;
    if (!getWFCNContactClass_softClass)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getWFCNContactClass_block_invoke;
      v27 = &unk_1E6079C28;
      v28 = &v29;
      __getWFCNContactClass_block_invoke((uint64_t)&v24);
      v15 = (void *)v30[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v29, 8);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v14 contactIdentifier];
      contactIdentifier = self->_contactIdentifier;
      self->_contactIdentifier = v17;
    }
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  uint64_t v19 = (void *)getWFPhotoMediaContentItemClass_softClass;
  uint64_t v32 = getWFPhotoMediaContentItemClass_softClass;
  if (!getWFPhotoMediaContentItemClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getWFPhotoMediaContentItemClass_block_invoke;
    v27 = &unk_1E6079C28;
    v28 = &v29;
    __getWFPhotoMediaContentItemClass_block_invoke((uint64_t)&v24);
    uint64_t v19 = (void *)v30[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v29, 8);
  if (objc_opt_isKindOfClass())
  {
    v21 = [v4 asset];
    uint64_t v22 = [v21 localIdentifier];
    photoAssetIdentifier = self->_photoAssetIdentifier;
    self->_photoAssetIdentifier = v22;
  }
}

- (void)addChildren:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = [(WFOnScreenContentNode *)self children];
    v5 = (NSArray *)[v4 mutableCopy];

    [(NSArray *)v5 addObjectsFromArray:v7];
    children = self->_children;
    self->_children = v5;
  }
}

- (void)removeChild:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(WFOnScreenContentNode *)self children];
    id v6 = (NSArray *)[v5 mutableCopy];

    [(NSArray *)v6 removeObject:v4];
    children = self->_children;
    self->_children = v6;
  }
}

- (void)addChild:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(WFOnScreenContentNode *)self children];
    id v6 = (NSArray *)[v5 mutableCopy];

    [(NSArray *)v6 addObject:v4];
    children = self->_children;
    self->_children = v6;
  }
}

- (NSDate)fileCreationDate
{
  v3 = [(WFOnScreenContentNode *)self file];

  if (v3)
  {
    id v4 = [(WFOnScreenContentNode *)self file];
    v5 = [v4 fileURL];
    id v8 = 0;
    [v5 getResourceValue:&v8 forKey:*MEMORY[0x1E4F1C540] error:0];
    id v6 = v8;
  }
  else
  {
    id v6 = 0;
  }
  return (NSDate *)v6;
}

- (NSString)fileTypeIdentifier
{
  v3 = [(WFOnScreenContentNode *)self file];
  id v4 = [v3 fileURL];

  if (v4)
  {
    v5 = [(WFOnScreenContentNode *)self file];
    id v6 = [v5 fileURL];
    id v7 = [v6 pathExtension];
    id v8 = +[WFFileType typeFromFileExtension:v7];

    v9 = [v8 string];
  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (void)dealloc
{
  v3 = [(WFOnScreenContentNode *)self file];
  id v4 = [v3 fileURL];

  if (v4)
  {
    v5 = [(WFOnScreenContentNode *)self file];
    id v6 = [v5 fileURL];
    [v6 startAccessingSecurityScopedResource];

    file = self->_file;
    self->_file = 0;

    id v8 = [(WFOnScreenContentNode *)self file];
    v9 = [v8 fileURL];
    [v9 stopAccessingSecurityScopedResource];
  }
  v10.receiver = self;
  v10.super_class = (Class)WFOnScreenContentNode;
  [(WFOnScreenContentNode *)&v10 dealloc];
}

- (WFOnScreenContentNode)initWithFile:(id)a3 applicationBundleIdentifier:(id)a4 source:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFOnScreenContentNode;
  v12 = [(WFOnScreenContentNode *)&v16 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_file, a3);
    objc_storeStrong((id *)&v13->_applicationBundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_source, a5);
    id v14 = v13;
  }

  return v13;
}

- (WFOnScreenContentNode)initWithContentItem:(id)a3 file:(id)a4 applicationBundleIdentifier:(id)a5 applicationFrame:(CGRect)a6 applicationLevel:(id)a7 source:(id)a8 linkPresentationMetadata:(id)a9
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v20 = a3;
  id v29 = a4;
  id v28 = a5;
  v21 = (NSNumber *)a7;
  id v22 = a8;
  id v23 = a9;
  uint64_t v24 = [(WFOnScreenContentNode *)self init];
  uint64_t v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_contentItem, a3);
    objc_storeStrong((id *)&v25->_file, a4);
    objc_storeStrong((id *)&v25->_applicationBundleIdentifier, a5);
    v25->_applicationFrame.origin.CGFloat x = x;
    v25->_applicationFrame.origin.CGFloat y = y;
    v25->_applicationFrame.size.CGFloat width = width;
    v25->_applicationFrame.size.CGFloat height = height;
    v25->_applicationLevel = v21;
    objc_storeStrong((id *)&v25->_source, a8);
    objc_storeStrong((id *)&v25->_linkPresentationMetadata, a9);
    -[WFOnScreenContentNode populateObjectsFromContentItem:](v25, "populateObjectsFromContentItem:", v20, v28, v29);
    uint64_t v26 = v25;
  }

  return v25;
}

- (WFOnScreenContentNode)initWithContentItem:(id)a3 file:(id)a4 applicationBundleIdentifier:(id)a5 source:(id)a6
{
  return -[WFOnScreenContentNode initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:](self, "initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:", a3, a4, a5, 0, a6, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (WFOnScreenContentNode)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFOnScreenContentNode;
  v2 = [(WFOnScreenContentNode *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    children = v2->_children;
    v2->_children = (NSArray *)v3;

    v5 = v2;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end