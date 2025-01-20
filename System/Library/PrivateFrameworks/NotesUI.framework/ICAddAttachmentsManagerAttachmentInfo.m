@interface ICAddAttachmentsManagerAttachmentInfo
- (BOOL)isPhoto;
- (BOOL)isVideo;
- (BOOL)usesTemporaryFile;
- (ICAddAttachmentsManagerAttachmentInfo)initWithFileURL:(id)a3;
- (ICAttachment)attachment;
- (NSAttributedString)attributedContentText;
- (NSData)mediaData;
- (NSDictionary)metadata;
- (NSString)mediaFilenameExtension;
- (NSString)mediaUTI;
- (NSString)title;
- (NSURL)mediaURL;
- (UIImage)image;
- (id)attachmentIfExistsForAccount:(id)a3;
- (id)description;
- (unint64_t)mediaSize;
- (void)deleteTemporaryImageFileIfNecessary;
- (void)setAttachment:(id)a3;
- (void)setAttributedContentText:(id)a3;
- (void)setImage:(id)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaFilenameExtension:(id)a3;
- (void)setMediaURL:(id)a3;
- (void)setMediaUTI:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsesTemporaryFile:(BOOL)a3;
@end

@implementation ICAddAttachmentsManagerAttachmentInfo

- (ICAddAttachmentsManagerAttachmentInfo)initWithFileURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAddAttachmentsManagerAttachmentInfo;
  v5 = [(ICAddAttachmentsManagerAttachmentInfo *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICAddAttachmentsManagerAttachmentInfo *)v5 setMediaURL:v4];
  }

  return v6;
}

- (void)setMediaURL:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mediaURL, a3);
  id v33 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C6C8];
  id v32 = 0;
  int v7 = [v5 getResourceValue:&v33 forKey:v6 error:&v32];
  id v8 = v33;
  if (v7)
  {
    id v9 = v32;
    [(ICAddAttachmentsManagerAttachmentInfo *)self setTitle:v8];
  }
  else
  {
    v10 = (objc_class *)MEMORY[0x1E4F29088];
    id v11 = v32;
    id v9 = (id)[[v10 alloc] initWithURL:v5 resolvingAgainstBaseURL:0];

    v12 = [v9 path];
    v13 = [v12 lastPathComponent];
    [(ICAddAttachmentsManagerAttachmentInfo *)self setTitle:v13];
  }
  id v31 = 0;
  uint64_t v14 = *MEMORY[0x1E4F1C728];
  id v30 = 0;
  int v15 = [v5 getResourceValue:&v31 forKey:v14 error:&v30];
  id v16 = v31;
  id v17 = v30;
  v18 = v17;
  if (v15) {
    [(ICAddAttachmentsManagerAttachmentInfo *)self setMediaUTI:v16];
  }
  else {
    NSLog(&cfstr_ErrorReadingAt.isa, v17);
  }
  v19 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaUTI];
  if (![v19 length])
  {
LABEL_13:

    goto LABEL_14;
  }
  v20 = (void *)MEMORY[0x1E4F442D8];
  v21 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaUTI];
  v22 = [v20 typeWithIdentifier:v21];
  int v23 = [v22 conformsToType:*MEMORY[0x1E4F44450]];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F38DA0]);
    v25 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaURL];
    v19 = (void *)[v24 initWithURL:v25];

    v26 = [v19 documentAttributes];
    v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F38DD0]];

    if ([v27 length])
    {
      [(ICAddAttachmentsManagerAttachmentInfo *)self setTitle:v27];
    }
    else
    {
      v28 = [(ICAddAttachmentsManagerAttachmentInfo *)self title];
      v29 = [v28 stringByDeletingPathExtension];
      [(ICAddAttachmentsManagerAttachmentInfo *)self setTitle:v29];
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (id)attachmentIfExistsForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 note];
    id v8 = [v7 account];

    id v9 = v6;
    if (v8 != v4)
    {
      v10 = (void *)MEMORY[0x1E4F832A0];
      id v11 = [MEMORY[0x1E4F29128] UUID];
      v12 = [v11 UUIDString];
      v13 = [v4 managedObjectContext];
      id v9 = (void *)[v10 newObjectWithIdentifier:v12 context:v13];

      uint64_t v14 = [v4 persistentStore];
      [v9 assignToPersistentStore:v14];

      int v15 = [v6 typeUTI];
      [v9 setTypeUTI:v15];

      id v16 = [v6 urlString];
      [v9 setUrlString:v16];

      id v17 = [v6 title];
      [v9 setTitle:v17];

      v18 = [v6 creationDate];
      [v9 setCreationDate:v18];

      v19 = [v6 modificationDate];
      [v9 setModificationDate:v19];

      [v9 updateChangeCountWithReason:@"Created attachment"];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)mediaSize
{
  v3 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaData];

  if (v3)
  {
    id v4 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaData];
    unint64_t v5 = [v4 length];

    return v5;
  }
  else
  {
    int v7 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaURL];
    id v14 = 0;
    uint64_t v8 = *MEMORY[0x1E4F1C5F8];
    id v13 = 0;
    int v9 = [v7 getResourceValue:&v14 forKey:v8 error:&v13];
    id v10 = v14;
    id v11 = v13;

    unint64_t v12 = 0;
    if (v9) {
      unint64_t v12 = [v10 unsignedLongLongValue];
    }

    return v12;
  }
}

- (BOOL)isPhoto
{
  id v4 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];
  if (v4)
  {
    v2 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];
    if ([v2 attachmentType] == 3)
    {
      BOOL v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F832A0];
  int v7 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaUTI];
  if ([v6 typeUTIIsImage:v7])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v8 = [(ICAddAttachmentsManagerAttachmentInfo *)self image];
    BOOL v5 = v8 != 0;
  }
  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (BOOL)isVideo
{
  id v4 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];
  if (v4)
  {
    v2 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];
    if ([v2 attachmentType] == 5)
    {
      char v5 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F832A0];
  int v7 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaUTI];
  char v5 = [v6 typeUTIIsPlayableMovie:v7];

  if (v4) {
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

- (id)description
{
  v33.receiver = self;
  v33.super_class = (Class)ICAddAttachmentsManagerAttachmentInfo;
  v3 = [(ICAddAttachmentsManagerAttachmentInfo *)&v33 description];
  id v4 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];

  if (v4)
  {
    char v5 = NSString;
    uint64_t v6 = [(ICAddAttachmentsManagerAttachmentInfo *)self attachment];
    uint64_t v7 = [v5 stringWithFormat:@"%@ attachment:%@", v3, v6];

    v3 = (void *)v7;
  }
  uint64_t v8 = [(ICAddAttachmentsManagerAttachmentInfo *)self title];

  if (v8)
  {
    int v9 = NSString;
    id v10 = [(ICAddAttachmentsManagerAttachmentInfo *)self title];
    uint64_t v11 = [v9 stringWithFormat:@"%@ title:%@", v3, v10];

    v3 = (void *)v11;
  }
  unint64_t v12 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaURL];

  if (v12)
  {
    id v13 = NSString;
    id v14 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaURL];
    uint64_t v15 = [v13 stringWithFormat:@"%@ mediaURL:%@", v3, v14];

    v3 = (void *)v15;
  }
  id v16 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaUTI];

  if (v16)
  {
    id v17 = NSString;
    v18 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaUTI];
    uint64_t v19 = [v17 stringWithFormat:@"%@ mediaUTI:%@", v3, v18];

    v3 = (void *)v19;
  }
  v20 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaData];

  if (v20)
  {
    v21 = NSString;
    v22 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaData];
    uint64_t v23 = [v21 stringWithFormat:@"%@ mediaData:%@", v3, v22];

    v3 = (void *)v23;
  }
  id v24 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaFilenameExtension];

  if (v24)
  {
    v25 = NSString;
    v26 = [(ICAddAttachmentsManagerAttachmentInfo *)self mediaFilenameExtension];
    uint64_t v27 = [v25 stringWithFormat:@"%@ mediaFilenameExtension:%@", v3, v26];

    v3 = (void *)v27;
  }
  v28 = [(ICAddAttachmentsManagerAttachmentInfo *)self image];

  if (v28)
  {
    v29 = NSString;
    id v30 = [(ICAddAttachmentsManagerAttachmentInfo *)self image];
    uint64_t v31 = [v29 stringWithFormat:@"%@ attachment:%@", v3, v30];

    v3 = (void *)v31;
  }
  return v3;
}

- (void)deleteTemporaryImageFileIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 mediaURL];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Failed to delete temporary image file at %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (NSString)mediaUTI
{
  return self->_mediaUTI;
}

- (void)setMediaUTI:(id)a3
{
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)mediaFilenameExtension
{
  return self->_mediaFilenameExtension;
}

- (void)setMediaFilenameExtension:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSAttributedString)attributedContentText
{
  return self->_attributedContentText;
}

- (void)setAttributedContentText:(id)a3
{
}

- (BOOL)usesTemporaryFile
{
  return self->_usesTemporaryFile;
}

- (void)setUsesTemporaryFile:(BOOL)a3
{
  self->_usesTemporaryFile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedContentText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaFilenameExtension, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_mediaUTI, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end