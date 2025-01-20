@interface TUConversationActivityMetadata
+ (BOOL)supportsSecureCoding;
+ (TUConversationActivityMetadata)activityMetadataWithDataBlob:(id)a3;
- (BOOL)_createImageFolderIfNeeded;
- (BOOL)_isEqualToActivityMetadata:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToActivityMetadata:(id)a3;
- (BOOL)supportsActivityPreviews;
- (BOOL)supportsContinuationOnTV;
- (NSData)imageData;
- (NSData)linkMetadatablob;
- (NSString)description;
- (NSString)subTitle;
- (NSString)title;
- (NSURL)fallbackURL;
- (NSURL)invitationURL;
- (TUConversationActivityContext)context;
- (TUConversationActivityMetadata)initWithCoder:(id)a3;
- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10;
- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10 preferredBroadcastingAttributes:(int64_t)a11 sceneAssociationBehavior:(id)a12 supportsActivityPreviews:(BOOL)a13;
- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10 preferredBroadcastingAttributes:(int64_t)a11 sceneAssociationBehavior:(id)a12 supportsActivityPreviews:(BOOL)a13 lifetimePolicy:(int64_t)a14;
- (TUConversationActivitySceneAssociationBehavior)sceneAssociationBehavior;
- (TUSandboxExtendedURL)imageFileURL;
- (id)_filePathForImage;
- (id)_imagePreviewDirectoryPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (id)serializedData;
- (int64_t)contentAssociation;
- (int64_t)lifetimePolicy;
- (int64_t)preferredBroadcastingAttributes;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_createImageFolderIfNeeded;
- (void)encodeWithCoder:(id)a3;
- (void)imageData;
- (void)removeImageDiskFile;
- (void)saveImageToDisk;
- (void)setImageData:(id)a3;
- (void)setImageFileURL:(id)a3;
- (void)setLinkMetadatablob:(id)a3;
- (void)setPreferredBroadcastingAttributes:(int64_t)a3;
- (void)setSupportsContinuationOnTV:(BOOL)a3;
@end

@implementation TUConversationActivityMetadata

- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10 preferredBroadcastingAttributes:(int64_t)a11 sceneAssociationBehavior:(id)a12 supportsActivityPreviews:(BOOL)a13 lifetimePolicy:(int64_t)a14
{
  id v41 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  v42.receiver = self;
  v42.super_class = (Class)TUConversationActivityMetadata;
  v26 = [(TUConversationActivityMetadata *)&v42 init];
  if (v26)
  {
    uint64_t v27 = [v41 copy];
    context = v26->_context;
    v26->_context = (TUConversationActivityContext *)v27;

    uint64_t v29 = [v19 copy];
    linkMetadatablob = v26->_linkMetadatablob;
    v26->_linkMetadatablob = (NSData *)v29;

    uint64_t v31 = [v20 copy];
    fallbackURL = v26->_fallbackURL;
    v26->_fallbackURL = (NSURL *)v31;

    uint64_t v33 = [v21 copy];
    invitationURL = v26->_invitationURL;
    v26->_invitationURL = (NSURL *)v33;

    v26->_supportsContinuationOnTV = a7;
    uint64_t v35 = [v22 copy];
    title = v26->_title;
    v26->_title = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    subTitle = v26->_subTitle;
    v26->_subTitle = (NSString *)v37;

    objc_storeStrong((id *)&v26->_imageData, a10);
    v26->_preferredBroadcastingAttributes = a11;
    objc_storeStrong((id *)&v26->_sceneAssociationBehavior, a12);
    v26->_supportsActivityPreviews = a13;
    v26->_lifetimePolicy = a14;
  }

  return v26;
}

- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10 preferredBroadcastingAttributes:(int64_t)a11 sceneAssociationBehavior:(id)a12 supportsActivityPreviews:(BOOL)a13
{
  id v40 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  v41.receiver = self;
  v41.super_class = (Class)TUConversationActivityMetadata;
  id v25 = [(TUConversationActivityMetadata *)&v41 init];
  if (v25)
  {
    uint64_t v26 = [v40 copy];
    context = v25->_context;
    v25->_context = (TUConversationActivityContext *)v26;

    uint64_t v28 = [v18 copy];
    linkMetadatablob = v25->_linkMetadatablob;
    v25->_linkMetadatablob = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    fallbackURL = v25->_fallbackURL;
    v25->_fallbackURL = (NSURL *)v30;

    uint64_t v32 = [v20 copy];
    invitationURL = v25->_invitationURL;
    v25->_invitationURL = (NSURL *)v32;

    v25->_supportsContinuationOnTV = a7;
    uint64_t v34 = [v21 copy];
    title = v25->_title;
    v25->_title = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    subTitle = v25->_subTitle;
    v25->_subTitle = (NSString *)v36;

    objc_storeStrong((id *)&v25->_imageData, a10);
    v25->_preferredBroadcastingAttributes = a11;
    objc_storeStrong((id *)&v25->_sceneAssociationBehavior, a12);
    v25->_supportsActivityPreviews = a13;
    v25->_lifetimePolicy = 2;
  }

  return v25;
}

- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10
{
  BOOL v11 = a7;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = +[TUConversationActivitySceneAssociationBehavior defaultBehavior];
  LOBYTE(v27) = 0;
  id v25 = [(TUConversationActivityMetadata *)self initWithContext:v23 linkMetadata:v22 fallbackURL:v21 invitationURL:v20 supportsContinuationOnTV:v11 title:v19 subTitle:v18 imageData:v17 preferredBroadcastingAttributes:0 sceneAssociationBehavior:v24 supportsActivityPreviews:v27 lifetimePolicy:2];

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v31 = a3;
  v4 = (void *)MEMORY[0x19F397B80]();
  v5 = [(TUConversationActivityMetadata *)self context];
  v6 = NSStringFromSelector(sel_context);
  [v31 encodeObject:v5 forKey:v6];

  v7 = [(TUConversationActivityMetadata *)self linkMetadatablob];
  v8 = NSStringFromSelector(sel_linkMetadatablob);
  [v31 encodeObject:v7 forKey:v8];

  v9 = [(TUConversationActivityMetadata *)self fallbackURL];
  v10 = NSStringFromSelector(sel_fallbackURL);
  [v31 encodeObject:v9 forKey:v10];

  BOOL v11 = [(TUConversationActivityMetadata *)self invitationURL];
  v12 = NSStringFromSelector(sel_invitationURL);
  [v31 encodeObject:v11 forKey:v12];

  BOOL v13 = [(TUConversationActivityMetadata *)self supportsContinuationOnTV];
  v14 = NSStringFromSelector(sel_supportsContinuationOnTV);
  [v31 encodeBool:v13 forKey:v14];

  v15 = [(TUConversationActivityMetadata *)self title];
  v16 = NSStringFromSelector(sel_title);
  [v31 encodeObject:v15 forKey:v16];

  id v17 = [(TUConversationActivityMetadata *)self subTitle];
  id v18 = NSStringFromSelector(sel_subTitle);
  [v31 encodeObject:v17 forKey:v18];

  int64_t v19 = [(TUConversationActivityMetadata *)self preferredBroadcastingAttributes];
  id v20 = NSStringFromSelector(sel_preferredBroadcastingAttributes);
  [v31 encodeInteger:v19 forKey:v20];

  id v21 = [(TUConversationActivityMetadata *)self sceneAssociationBehavior];
  id v22 = NSStringFromSelector(sel_sceneAssociationBehavior);
  [v31 encodeObject:v21 forKey:v22];

  BOOL v23 = [(TUConversationActivityMetadata *)self supportsActivityPreviews];
  id v24 = NSStringFromSelector(sel_supportsActivityPreviews);
  [v31 encodeBool:v23 forKey:v24];

  int64_t v25 = [(TUConversationActivityMetadata *)self lifetimePolicy];
  uint64_t v26 = NSStringFromSelector(sel_lifetimePolicy);
  [v31 encodeInteger:v25 forKey:v26];

  uint64_t v27 = [(TUConversationActivityMetadata *)self imageFileURL];

  if (v27)
  {
    uint64_t v28 = [(TUConversationActivityMetadata *)self imageFileURL];
    uint64_t v29 = sel_imageFileURL;
  }
  else
  {
    uint64_t v28 = [(TUConversationActivityMetadata *)self imageData];
    uint64_t v29 = sel_imageData;
  }
  uint64_t v30 = NSStringFromSelector(v29);
  [v31 encodeObject:v28 forKey:v30];
}

- (TUConversationActivityMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  context = (void *)MEMORY[0x19F397B80]();
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromSelector(sel_context);
  uint64_t v51 = [v3 decodeObjectOfClass:v4 forKey:v5];

  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_linkMetadatablob);
  uint64_t v50 = [v3 decodeObjectOfClass:v6 forKey:v7];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_fallbackURL);
  v10 = [v3 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_invitationURL);
  v46 = [v3 decodeObjectOfClass:v11 forKey:v12];

  BOOL v13 = NSStringFromSelector(sel_supportsContinuationOnTV);
  unsigned int v45 = [v3 decodeBoolForKey:v13];

  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_title);
  uint64_t v16 = [v3 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = objc_opt_class();
  id v18 = NSStringFromSelector(sel_subTitle);
  uint64_t v19 = [v3 decodeObjectOfClass:v17 forKey:v18];

  id v20 = NSStringFromSelector(sel_preferredBroadcastingAttributes);
  uint64_t v21 = [v3 decodeIntegerForKey:v20];

  uint64_t v22 = objc_opt_class();
  BOOL v23 = NSStringFromSelector(sel_imageData);
  id v24 = [v3 decodeObjectOfClass:v22 forKey:v23];

  uint64_t v25 = objc_opt_class();
  uint64_t v26 = NSStringFromSelector(sel_sceneAssociationBehavior);
  uint64_t v27 = [v3 decodeObjectOfClass:v25 forKey:v26];

  uint64_t v28 = NSStringFromSelector(sel_supportsActivityPreviews);
  LOBYTE(v26) = [v3 decodeBoolForKey:v28];

  uint64_t v29 = NSStringFromSelector(sel_lifetimePolicy);
  uint64_t v30 = [v3 decodeIntegerForKey:v29];

  uint64_t v44 = v30;
  id v31 = (void *)v50;
  LOBYTE(v43) = (_BYTE)v26;
  uint64_t v32 = (void *)v51;
  uint64_t v42 = v19;
  v47 = (void *)v19;
  uint64_t v33 = (void *)v16;
  uint64_t v34 = [(TUConversationActivityMetadata *)self initWithContext:v51 linkMetadata:v50 fallbackURL:v10 invitationURL:v46 supportsContinuationOnTV:v45 title:v16 subTitle:v42 imageData:v24 preferredBroadcastingAttributes:v21 sceneAssociationBehavior:v27 supportsActivityPreviews:v43 lifetimePolicy:v44];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = NSStringFromSelector(sel_imageFileURL);
  uint64_t v37 = [v3 decodeObjectOfClass:v35 forKey:v36];

  if (v37)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [v3 connection];
      v39 = [v37 URL];
      int v40 = objc_msgSend(v38, "tu_clientSandboxCanAccessFileURL:", v39);

      if (v40) {
        [(TUConversationActivityMetadata *)v34 setImageFileURL:v37];
      }

      uint64_t v32 = (void *)v51;
      id v31 = (void *)v50;
    }
    else
    {
      [(TUConversationActivityMetadata *)v34 setImageFileURL:v37];
    }
  }

  return v34;
}

- (id)_imagePreviewDirectoryPath
{
  v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"groupactivityimgpreview"];

  return v3;
}

- (id)_filePathForImage
{
  id v3 = [(TUConversationActivityMetadata *)self imageFileURL];

  if (v3)
  {
    uint64_t v4 = [(TUConversationActivityMetadata *)self imageFileURL];
  }
  else
  {
    v5 = [(TUConversationActivityMetadata *)self _imagePreviewDirectoryPath];
    uint64_t v6 = [NSString stringGUID];
    v7 = [v5 stringByAppendingPathComponent:v6];

    uint64_t v8 = [TUSandboxExtendedURL alloc];
    v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    v10 = [(TUSandboxExtendedURL *)v8 initWithURL:v9];
    [(TUConversationActivityMetadata *)self setImageFileURL:v10];

    uint64_t v11 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14000]];
    v12 = [(TUConversationActivityMetadata *)self imageFileURL];
    [v12 setSandboxExtensionClass:v11];

    uint64_t v4 = [(TUConversationActivityMetadata *)self imageFileURL];
  }

  return v4;
}

- (BOOL)_createImageFolderIfNeeded
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [(TUConversationActivityMetadata *)self _imagePreviewDirectoryPath];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  id v5 = 0;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = *MEMORY[0x1E4F28370];
    v12[0] = *MEMORY[0x1E4F28358];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = 0;
    [v6 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:v7 error:&v10];
    id v5 = v10;

    if (v5)
    {
      uint64_t v8 = TUDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TUConversationActivityMetadata _createImageFolderIfNeeded]();
      }
    }
  }

  return v5 == 0;
}

- (void)saveImageToDisk
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "TUConversationActivityMetadata %@ failed to create image folder, can't write to disk.", (uint8_t *)&v2, 0xCu);
}

- (void)removeImageDiskFile
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "TUConversationActivityMetadata %@ Wasn't able to delete image file error %@");
}

- (NSData)imageData
{
  imageData = self->_imageData;
  if (imageData)
  {
    uint64_t v3 = imageData;
  }
  else
  {
    uint64_t v3 = [(TUConversationActivityMetadata *)self imageFileURL];

    if (v3)
    {
      id v5 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v6 = [(TUConversationActivityMetadata *)self imageFileURL];
      v7 = [v6 URL];
      id v11 = 0;
      uint64_t v3 = [v5 dataWithContentsOfURL:v7 options:8 error:&v11];
      id v8 = v11;

      if (v8)
      {
        v9 = TUDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[TUConversationActivityMetadata imageData]();
        }
      }
    }
  }

  return v3;
}

- (int64_t)contentAssociation
{
  return self->_lifetimePolicy;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationActivityMetadata *)a3;
  if ([(TUConversationActivityMetadata *)v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = v4 == self
  }
      || [(TUConversationActivityMetadata *)self _isEqualToActivityMetadata:v4];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEquivalentToActivityMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivityMetadata *)self context];
  uint64_t v6 = [v4 context];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUConversationActivityMetadata *)self linkMetadatablob];
    id v8 = [v4 linkMetadatablob];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = [(TUConversationActivityMetadata *)self fallbackURL];
      id v10 = [v4 fallbackURL];
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        id v11 = [(TUConversationActivityMetadata *)self invitationURL];
        v12 = [v4 invitationURL];
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          uint64_t v27 = v11;
          int v13 = [(TUConversationActivityMetadata *)self supportsContinuationOnTV];
          if (v13 == [v4 supportsContinuationOnTV])
          {
            unint64_t v15 = [(TUConversationActivityMetadata *)self title];
            uint64_t v25 = [v4 title];
            uint64_t v26 = (void *)v15;
            if (TUObjectsAreEqualOrNil(v15, (uint64_t)v25))
            {
              id v24 = [(TUConversationActivityMetadata *)self subTitle];
              BOOL v23 = [v4 subTitle];
              if (TUObjectsAreEqualOrNil((unint64_t)v24, (uint64_t)v23)
                && (int64_t v16 = -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes"), v16 == [v4 preferredBroadcastingAttributes]))
              {
                uint64_t v17 = [(TUConversationActivityMetadata *)self sceneAssociationBehavior];
                uint64_t v21 = [v4 sceneAssociationBehavior];
                uint64_t v22 = v17;
                if (objc_msgSend(v17, "isEqual:")
                  && (int v18 = [(TUConversationActivityMetadata *)self supportsActivityPreviews],
                      v18 == [v4 supportsActivityPreviews]))
                {
                  int64_t v19 = [(TUConversationActivityMetadata *)self lifetimePolicy];
                  BOOL v14 = v19 == [v4 lifetimePolicy];
                }
                else
                {
                  BOOL v14 = 0;
                }
                id v11 = v27;
              }
              else
              {
                BOOL v14 = 0;
                id v11 = v27;
              }
            }
            else
            {
              BOOL v14 = 0;
              id v11 = v27;
            }
          }
          else
          {
            BOOL v14 = 0;
            id v11 = v27;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_isEqualToActivityMetadata:(id)a3
{
  id v4 = a3;
  if ([(TUConversationActivityMetadata *)self isEquivalentToActivityMetadata:v4])
  {
    uint64_t v5 = [(TUConversationActivityMetadata *)self imageFileURL];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [v4 imageFileURL],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      id v8 = [(TUConversationActivityMetadata *)self imageFileURL];
      uint64_t v9 = [v4 imageFileURL];
    }
    else
    {
      id v8 = [(TUConversationActivityMetadata *)self imageData];
      uint64_t v9 = [v4 imageData];
    }
    id v11 = (void *)v9;
    char v10 = TUObjectsAreEqualOrNil((unint64_t)v8, v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TUConversationActivityMetadata *)self imageFileURL];
  if (v3) {
    [(TUConversationActivityMetadata *)self imageFileURL];
  }
  else {
  id v4 = [(TUConversationActivityMetadata *)self imageData];
  }
  uint64_t v24 = [v4 hash];

  uint64_t v26 = [(TUConversationActivityMetadata *)self context];
  uint64_t v22 = [v26 hash];
  uint64_t v25 = [(TUConversationActivityMetadata *)self linkMetadatablob];
  uint64_t v21 = [v25 hash];
  BOOL v23 = [(TUConversationActivityMetadata *)self fallbackURL];
  uint64_t v20 = [v23 hash];
  uint64_t v5 = [(TUConversationActivityMetadata *)self invitationURL];
  uint64_t v19 = [v5 hash];
  BOOL v6 = [(TUConversationActivityMetadata *)self supportsContinuationOnTV];
  uint64_t v7 = 1237;
  uint64_t v8 = 1231;
  if (!v6) {
    uint64_t v8 = 1237;
  }
  uint64_t v18 = v8;
  uint64_t v9 = [(TUConversationActivityMetadata *)self title];
  uint64_t v10 = [v9 hash];
  id v11 = [(TUConversationActivityMetadata *)self subTitle];
  uint64_t v12 = [v11 hash];
  int64_t v13 = [(TUConversationActivityMetadata *)self preferredBroadcastingAttributes];
  BOOL v14 = [(TUConversationActivityMetadata *)self sceneAssociationBehavior];
  uint64_t v15 = [v14 hash];
  if ([(TUConversationActivityMetadata *)self supportsActivityPreviews]) {
    uint64_t v7 = 1231;
  }
  unint64_t v16 = v22 ^ v24 ^ v21 ^ v20 ^ v19 ^ v18 ^ v10 ^ v12 ^ v13 ^ v15 ^ v7 ^ [(TUConversationActivityMetadata *)self lifetimePolicy];

  return v16;
}

- (unint64_t)length
{
  int v2 = [(TUConversationActivityMetadata *)self serializedData];
  unint64_t v3 = [v2 length];

  return v3;
}

- (id)serializedData
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (TUConversationActivityMetadata)activityMetadataWithDataBlob:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v9 = 0;
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];
    id v5 = v9;
    if (v5 || !v4)
    {
      uint64_t v7 = TUDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[TUConversationActivityMetadata activityMetadataWithDataBlob:]((uint64_t)v5, v7);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (TUConversationActivityMetadata *)v6;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUConversationActivityMetadata *)self context];
  [v3 appendFormat:@" context=%@", v4];

  id v5 = [(TUConversationActivityMetadata *)self fallbackURL];

  if (v5)
  {
    id v6 = [(TUConversationActivityMetadata *)self fallbackURL];
    [v3 appendFormat:@" fallbackURL=%@", v6];
  }
  uint64_t v7 = [(TUConversationActivityMetadata *)self invitationURL];

  if (v7)
  {
    uint64_t v8 = [(TUConversationActivityMetadata *)self invitationURL];
    [v3 appendFormat:@" invitationURL=%@", v8];
  }
  if ([(TUConversationActivityMetadata *)self supportsContinuationOnTV]) {
    objc_msgSend(v3, "appendFormat:", @" supportsContinuationOnTV=%d", -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV"));
  }
  id v9 = [(TUConversationActivityMetadata *)self title];

  if (v9)
  {
    uint64_t v10 = [(TUConversationActivityMetadata *)self title];
    [v3 appendFormat:@" title=%@", v10];
  }
  id v11 = [(TUConversationActivityMetadata *)self subTitle];

  if (v11)
  {
    uint64_t v12 = [(TUConversationActivityMetadata *)self subTitle];
    [v3 appendFormat:@" subTitle=%@", v12];
  }
  if ([(TUConversationActivityMetadata *)self preferredBroadcastingAttributes]) {
    objc_msgSend(v3, "appendFormat:", @" preferredBroadcastingAttributes=%ld", -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes"));
  }
  int64_t v13 = [(TUConversationActivityMetadata *)self imageFileURL];

  if (v13)
  {
    BOOL v14 = [(TUConversationActivityMetadata *)self imageFileURL];

    if (!v14) {
      goto LABEL_19;
    }
    uint64_t v15 = [(TUConversationActivityMetadata *)self imageFileURL];
    [v3 appendFormat:@" imageFileURL=%@", v15];
  }
  else
  {
    unint64_t v16 = [(TUConversationActivityMetadata *)self imageData];

    if (!v16) {
      goto LABEL_19;
    }
    uint64_t v15 = [(TUConversationActivityMetadata *)self imageData];
    [v3 appendFormat:@" imageData=%@", v15];
  }

LABEL_19:
  uint64_t v17 = [(TUConversationActivityMetadata *)self sceneAssociationBehavior];
  [v3 appendFormat:@" sceneAssociationBehavior=%@", v17];

  uint64_t v18 = self;
  int v19 = [v18 supportsActivityPreviews];

  if (v19)
  {
    uint64_t v20 = self;
    objc_msgSend(v3, "appendFormat:", @" self.supportsActivityPreviews=%d", objc_msgSend(v20, "supportsActivityPreviews"));
  }
  uint64_t v21 = self;
  uint64_t v22 = [v21 lifetimePolicy];

  if (v22)
  {
    BOOL v23 = self;
    objc_msgSend(v3, "appendFormat:", @" self.lifetimePolicy=%ld", objc_msgSend(v23, "lifetimePolicy"));
  }
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v19 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v4 = [(TUConversationActivityMetadata *)self context];
  uint64_t v20 = [(TUConversationActivityMetadata *)self linkMetadatablob];
  uint64_t v5 = [(TUConversationActivityMetadata *)self fallbackURL];
  id v6 = [(TUConversationActivityMetadata *)self invitationURL];
  BOOL v18 = [(TUConversationActivityMetadata *)self supportsContinuationOnTV];
  uint64_t v7 = [(TUConversationActivityMetadata *)self title];
  uint64_t v8 = [(TUConversationActivityMetadata *)self subTitle];
  id v9 = [(TUConversationActivityMetadata *)self imageFileURL];
  uint64_t v10 = (void *)v5;
  id v11 = (void *)v4;
  if (v9)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = [(TUConversationActivityMetadata *)self imageData];
  }
  int64_t v12 = [(TUConversationActivityMetadata *)self preferredBroadcastingAttributes];
  int64_t v13 = [(TUConversationActivityMetadata *)self sceneAssociationBehavior];
  LOBYTE(v17) = [(TUConversationActivityMetadata *)self supportsActivityPreviews];
  BOOL v14 = objc_msgSend(v19, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v11, v20, v10, v6, v18, v7, v8, v21, v12, v13, v17, -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy"));

  if (!v9) {
  uint64_t v15 = [(TUConversationActivityMetadata *)self imageFileURL];
  }
  [v14 setImageFileURL:v15];

  return v14;
}

- (id)sanitizedCopy
{
  return [(TUConversationActivityMetadata *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  BOOL v18 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v4 = [(TUConversationActivityMetadata *)self context];
  uint64_t v21 = [(TUConversationActivityMetadata *)self linkMetadatablob];
  uint64_t v20 = [(TUConversationActivityMetadata *)self fallbackURL];
  uint64_t v5 = [v20 sanitizedCopy];
  int v19 = [(TUConversationActivityMetadata *)self invitationURL];
  id v6 = [v19 sanitizedCopy];
  BOOL v16 = [(TUConversationActivityMetadata *)self supportsContinuationOnTV];
  uint64_t v7 = [(TUConversationActivityMetadata *)self title];
  uint64_t v17 = [(TUConversationActivityMetadata *)self subTitle];
  uint64_t v8 = [(TUConversationActivityMetadata *)self imageFileURL];
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(TUConversationActivityMetadata *)self imageData];
  }
  int64_t v10 = [(TUConversationActivityMetadata *)self preferredBroadcastingAttributes];
  id v11 = [(TUConversationActivityMetadata *)self sceneAssociationBehavior];
  LOBYTE(v15) = [(TUConversationActivityMetadata *)self supportsActivityPreviews];
  int64_t v12 = objc_msgSend(v18, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v4, v21, v5, v6, v16, v7, v17, v9, v10, v11, v15, -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy"));

  if (!v8) {
  int64_t v13 = [(TUConversationActivityMetadata *)self imageFileURL];
  }
  [v12 setImageFileURL:v13];

  return v12;
}

- (TUConversationActivityContext)context
{
  return self->_context;
}

- (NSData)linkMetadatablob
{
  return self->_linkMetadatablob;
}

- (void)setLinkMetadatablob:(id)a3
{
}

- (NSURL)fallbackURL
{
  return self->_fallbackURL;
}

- (NSURL)invitationURL
{
  return self->_invitationURL;
}

- (BOOL)supportsContinuationOnTV
{
  return self->_supportsContinuationOnTV;
}

- (void)setSupportsContinuationOnTV:(BOOL)a3
{
  self->_supportsContinuationOnTV = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setImageData:(id)a3
{
}

- (int64_t)preferredBroadcastingAttributes
{
  return self->_preferredBroadcastingAttributes;
}

- (void)setPreferredBroadcastingAttributes:(int64_t)a3
{
  self->_preferredBroadcastingAttributes = a3;
}

- (TUConversationActivitySceneAssociationBehavior)sceneAssociationBehavior
{
  return self->_sceneAssociationBehavior;
}

- (BOOL)supportsActivityPreviews
{
  return self->_supportsActivityPreviews;
}

- (int64_t)lifetimePolicy
{
  return self->_lifetimePolicy;
}

- (TUSandboxExtendedURL)imageFileURL
{
  return self->_imageFileURL;
}

- (void)setImageFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFileURL, 0);
  objc_storeStrong((id *)&self->_sceneAssociationBehavior, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_invitationURL, 0);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_linkMetadatablob, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_createImageFolderIfNeeded
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "TUConversationActivityMetadata Error creating folder at %@ error %@");
}

- (void)imageData
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Failed to read image data for %@, error: %@");
}

+ (void)activityMetadataWithDataBlob:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Error deserializing activity metadata %@,", (uint8_t *)&v2, 0xCu);
}

@end