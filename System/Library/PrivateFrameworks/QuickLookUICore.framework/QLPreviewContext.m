@interface QLPreviewContext
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeEdited;
- (BOOL)canBeShared;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPreventMachineReadableCodeDetection;
- (NSDictionary)attachments;
- (NSDictionary)clientPreviewItemDisplayState;
- (NSDictionary)clientPreviewOptions;
- (NSNumber)itemSize;
- (NSString)contentType;
- (NSString)originalContentType;
- (NSString)password;
- (NSString)previewTitle;
- (QLItem)item;
- (QLItemThumbnailGeneratorProtocolInternal)thumbnailGenerator;
- (QLPreviewContext)initWithCoder:(id)a3;
- (QLTBitmapFormat)bitmapFormat;
- (UIColor)backgroundColor;
- (int64_t)processIdentifier;
- (int64_t)viewDynamicRange;
- (unint64_t)editedFileBehavior;
- (unint64_t)previewItemType;
- (unint64_t)stringEncoding;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBitmapFormat:(id)a3;
- (void)setCanBeEdited:(BOOL)a3;
- (void)setCanBeShared:(BOOL)a3;
- (void)setClientPreviewItemDisplayState:(id)a3;
- (void)setClientPreviewOptions:(id)a3;
- (void)setContentType:(id)a3;
- (void)setEditedFileBehavior:(unint64_t)a3;
- (void)setItem:(id)a3;
- (void)setItemSize:(id)a3;
- (void)setOriginalContentType:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPreviewItemType:(unint64_t)a3;
- (void)setPreviewTitle:(id)a3;
- (void)setProcessIdentifier:(int64_t)a3;
- (void)setShouldPreventMachineReadableCodeDetection:(BOOL)a3;
- (void)setStringEncoding:(unint64_t)a3;
- (void)setThumbnailGenerator:(id)a3;
- (void)setViewDynamicRange:(int64_t)a3;
@end

@implementation QLPreviewContext

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(QLPreviewContext *)self thumbnailGenerator];
    v7 = [v5 thumbnailGenerator];
    int v8 = __18__QLItem_isEqual___block_invoke((uint64_t)v7, v6, v7);

    if (!v8) {
      goto LABEL_21;
    }
    v9 = [(QLPreviewContext *)self previewTitle];
    v10 = [v5 previewTitle];
    int v11 = __18__QLItem_isEqual___block_invoke((uint64_t)v10, v9, v10);

    if (!v11) {
      goto LABEL_21;
    }
    v12 = [(QLPreviewContext *)self contentType];
    v13 = [v5 contentType];
    int v14 = __18__QLItem_isEqual___block_invoke((uint64_t)v13, v12, v13);

    if (!v14) {
      goto LABEL_21;
    }
    v15 = [(QLPreviewContext *)self originalContentType];
    v16 = [v5 originalContentType];
    int v17 = __18__QLItem_isEqual___block_invoke((uint64_t)v16, v15, v16);

    if (!v17) {
      goto LABEL_21;
    }
    int v18 = [(QLPreviewContext *)self canBeEdited];
    if (v18 != [v5 canBeEdited]) {
      goto LABEL_21;
    }
    int v19 = [(QLPreviewContext *)self canBeShared];
    if (v19 != [v5 canBeShared]) {
      goto LABEL_21;
    }
    unint64_t v20 = [(QLPreviewContext *)self editedFileBehavior];
    if (v20 != [v5 editedFileBehavior]) {
      goto LABEL_21;
    }
    unint64_t v21 = [(QLPreviewContext *)self previewItemType];
    if (v21 != [v5 previewItemType]) {
      goto LABEL_21;
    }
    v22 = [(QLPreviewContext *)self backgroundColor];
    v23 = [v5 backgroundColor];
    int v24 = __18__QLItem_isEqual___block_invoke((uint64_t)v23, v22, v23);

    if (!v24) {
      goto LABEL_21;
    }
    v25 = [(QLPreviewContext *)self password];
    v26 = [v5 password];
    int v27 = __18__QLItem_isEqual___block_invoke((uint64_t)v26, v25, v26);

    if (!v27) {
      goto LABEL_21;
    }
    v28 = [(QLPreviewContext *)self itemSize];
    v29 = [v5 itemSize];
    int v30 = __18__QLItem_isEqual___block_invoke((uint64_t)v29, v28, v29);

    if (!v30) {
      goto LABEL_21;
    }
    int64_t v31 = [(QLPreviewContext *)self processIdentifier];
    if (v31 != [v5 processIdentifier]) {
      goto LABEL_21;
    }
    v32 = [(QLPreviewContext *)self clientPreviewOptions];
    v33 = [v5 clientPreviewOptions];
    int v34 = __18__QLItem_isEqual___block_invoke((uint64_t)v33, v32, v33);

    if (!v34) {
      goto LABEL_21;
    }
    v35 = [(QLPreviewContext *)self clientPreviewItemDisplayState];
    v36 = [v5 clientPreviewItemDisplayState];
    int v37 = __18__QLItem_isEqual___block_invoke((uint64_t)v36, v35, v36);

    if (!v37) {
      goto LABEL_21;
    }
    unint64_t v38 = [(QLPreviewContext *)self stringEncoding];
    if (v38 != [v5 stringEncoding]) {
      goto LABEL_21;
    }
    v39 = [(QLPreviewContext *)self attachments];
    v40 = [v5 attachments];
    int v41 = __18__QLItem_isEqual___block_invoke((uint64_t)v40, v39, v40);

    if (!v41) {
      goto LABEL_21;
    }
    v42 = [(QLPreviewContext *)self bitmapFormat];
    v43 = [v5 bitmapFormat];
    int v44 = __18__QLItem_isEqual___block_invoke((uint64_t)v43, v42, v43);

    if (v44)
    {
      int64_t v45 = [(QLPreviewContext *)self viewDynamicRange];
      BOOL v46 = v45 == [v5 viewDynamicRange];
    }
    else
    {
LABEL_21:
      BOOL v46 = 0;
    }
  }
  else
  {
    BOOL v46 = 0;
  }

  return v46;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v27 = a3;
  id v4 = [(QLPreviewContext *)self thumbnailGenerator];

  if (v4)
  {
    id v5 = [(QLPreviewContext *)self thumbnailGenerator];
    [v27 encodeObject:v5 forKey:@"thumbnailGenerator"];
  }
  v6 = [(QLPreviewContext *)self previewTitle];

  if (v6)
  {
    v7 = [(QLPreviewContext *)self previewTitle];
    [v27 encodeObject:v7 forKey:@"previewTitle"];
  }
  int v8 = [(QLPreviewContext *)self contentType];

  if (v8)
  {
    v9 = [(QLPreviewContext *)self contentType];
    [v27 encodeObject:v9 forKey:@"contentType"];
  }
  v10 = [(QLPreviewContext *)self originalContentType];

  if (v10)
  {
    int v11 = [(QLPreviewContext *)self originalContentType];
    [v27 encodeObject:v11 forKey:@"originalContentType"];
  }
  v12 = [(QLPreviewContext *)self itemSize];

  if (v12)
  {
    v13 = [(QLPreviewContext *)self itemSize];
    [v27 encodeObject:v13 forKey:@"itemSize"];
  }
  int v14 = [(QLPreviewContext *)self backgroundColor];

  if (v14)
  {
    v15 = [(QLPreviewContext *)self backgroundColor];
    [v27 encodeObject:v15 forKey:@"backgroundColor"];
  }
  v16 = [(QLPreviewContext *)self password];

  if (v16)
  {
    int v17 = [(QLPreviewContext *)self password];
    [v27 encodeObject:v17 forKey:@"password"];
  }
  int v18 = [(QLPreviewContext *)self clientPreviewOptions];

  if (v18)
  {
    int v19 = [(QLPreviewContext *)self clientPreviewOptions];
    [v27 encodeObject:v19 forKey:@"clientPreviewOptions"];
  }
  unint64_t v20 = [(QLPreviewContext *)self clientPreviewItemDisplayState];

  if (v20)
  {
    unint64_t v21 = [(QLPreviewContext *)self clientPreviewItemDisplayState];
    [v27 encodeObject:v21 forKey:@"clientPreviewItemDisplayState"];
  }
  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext previewItemType](self, "previewItemType"), @"previewItemType");
  objc_msgSend(v27, "encodeBool:forKey:", -[QLPreviewContext canBeEdited](self, "canBeEdited"), @"canBeEdited");
  objc_msgSend(v27, "encodeBool:forKey:", -[QLPreviewContext canBeShared](self, "canBeShared"), @"canBeShared");
  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext editedFileBehavior](self, "editedFileBehavior"), @"editedFileBehavior");
  v22 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v27, "encodeInteger:forKey:", (int)objc_msgSend(v22, "processIdentifier"), @"processIdentifier");

  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext stringEncoding](self, "stringEncoding"), @"stringEncoding");
  v23 = [(QLPreviewContext *)self attachments];

  if (v23)
  {
    int v24 = [(QLPreviewContext *)self attachments];
    [v27 encodeObject:v24 forKey:@"attachments"];
  }
  v25 = [(QLPreviewContext *)self bitmapFormat];

  if (v25)
  {
    v26 = [(QLPreviewContext *)self bitmapFormat];
    [v27 encodeObject:v26 forKey:@"bitmapFormat"];
  }
  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext viewDynamicRange](self, "viewDynamicRange"), @"viewDynamicRange");
}

- (QLPreviewContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)QLPreviewContext;
  id v5 = [(QLPreviewContext *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailGenerator"];
    thumbnailGenerator = v5->_thumbnailGenerator;
    v5->_thumbnailGenerator = (QLItemThumbnailGeneratorProtocolInternal *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewTitle"];
    previewTitle = v5->_previewTitle;
    v5->_previewTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalContentType"];
    originalContentType = v5->_originalContentType;
    v5->_originalContentType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemSize"];
    itemSize = v5->_itemSize;
    v5->_itemSize = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    password = v5->_password;
    v5->_password = (NSString *)v18;

    v5->_previewItemType = [v4 decodeIntegerForKey:@"previewItemType"];
    v5->_canBeEdited = [v4 decodeBoolForKey:@"canBeEdited"];
    v5->_canBeShared = [v4 decodeBoolForKey:@"canBeShared"];
    v5->_editedFileBehavior = [v4 decodeIntegerForKey:@"editedFileBehavior"];
    v5->_processIdentifier = [v4 decodeIntegerForKey:@"processIdentifier"];
    unint64_t v20 = +[QLItem customExtensionCommunicationEncodedClasses];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"clientPreviewOptions"];
    clientPreviewOptions = v5->_clientPreviewOptions;
    v5->_clientPreviewOptions = (NSDictionary *)v21;

    v23 = +[QLItem customExtensionCommunicationEncodedClasses];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"clientPreviewItemDisplayState"];
    clientPreviewItemDisplayState = v5->_clientPreviewItemDisplayState;
    v5->_clientPreviewItemDisplayState = (NSDictionary *)v24;

    v5->_stringEncoding = [v4 decodeIntegerForKey:@"stringEncoding"];
    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSDictionary *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitmapFormat"];
    bitmapFormat = v5->_bitmapFormat;
    v5->_bitmapFormat = (QLTBitmapFormat *)v31;

    v5->_viewDynamicRange = [v4 decodeIntegerForKey:@"viewDynamicRange"];
    v33 = v5;
  }

  return v5;
}

- (NSString)previewTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreviewTitle:(id)a3
{
}

- (NSString)originalContentType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOriginalContentType:(id)a3
{
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContentType:(id)a3
{
}

- (BOOL)canBeEdited
{
  return self->_canBeEdited;
}

- (void)setCanBeEdited:(BOOL)a3
{
  self->_canBeEdited = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)shouldPreventMachineReadableCodeDetection
{
  return self->_shouldPreventMachineReadableCodeDetection;
}

- (void)setShouldPreventMachineReadableCodeDetection:(BOOL)a3
{
  self->_shouldPreventMachineReadableCodeDetection = a3;
}

- (unint64_t)editedFileBehavior
{
  return self->_editedFileBehavior;
}

- (void)setEditedFileBehavior:(unint64_t)a3
{
  self->_editedFileBehavior = a3;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPassword:(id)a3
{
}

- (unint64_t)previewItemType
{
  return self->_previewItemType;
}

- (void)setPreviewItemType:(unint64_t)a3
{
  self->_previewItemType = a3;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSNumber)itemSize
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setItemSize:(id)a3
{
}

- (int64_t)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int64_t)a3
{
  self->_processIdentifier = a3;
}

- (QLItem)item
{
  return (QLItem *)objc_getProperty(self, a2, 88, 1);
}

- (void)setItem:(id)a3
{
}

- (NSDictionary)clientPreviewOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientPreviewOptions:(id)a3
{
}

- (NSDictionary)clientPreviewItemDisplayState
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientPreviewItemDisplayState:(id)a3
{
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAttachments:(id)a3
{
}

- (QLTBitmapFormat)bitmapFormat
{
  return (QLTBitmapFormat *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBitmapFormat:(id)a3
{
}

- (int64_t)viewDynamicRange
{
  return self->_viewDynamicRange;
}

- (void)setViewDynamicRange:(int64_t)a3
{
  self->_viewDynamicRange = a3;
}

- (QLItemThumbnailGeneratorProtocolInternal)thumbnailGenerator
{
  return (QLItemThumbnailGeneratorProtocolInternal *)objc_getProperty(self, a2, 144, 1);
}

- (void)setThumbnailGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_clientPreviewItemDisplayState, 0);
  objc_storeStrong((id *)&self->_clientPreviewOptions, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_itemSize, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_originalContentType, 0);
  objc_storeStrong((id *)&self->_previewTitle, 0);
}

@end