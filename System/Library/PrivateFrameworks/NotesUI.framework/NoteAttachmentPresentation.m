@interface NoteAttachmentPresentation
+ (id)attachmentPresentationsForAttachments:(id)a3;
+ (id)presentationSelector;
+ (void)prepareDocumentForPresentationWithAttachmentContentIDs:(id)a3 withAttachmentPresentations:(id)a4 occurences:(id *)a5;
+ (void)prepareDocumentForSerializationWithAttachmentContentIDs:(id)a3 withAttachmentPresentations:(id)a4 newPresentationProvider:(id)a5 leftoverPresentations:(id *)a6;
- (BOOL)getPresentationData:(id *)a3 mimeType:(id *)a4 error:(id *)a5;
- (BOOL)isImage;
- (BOOL)sourceIsManaged;
- (CGSize)iconSize;
- (NSData)data;
- (NSError)dataFileURLError;
- (NSNumber)dataSizeNumber;
- (NSString)contentID;
- (NSString)contentIDURLAbsoluteString;
- (NSString)filename;
- (NSString)mimeType;
- (NSURL)contentIDURL;
- (NSURL)dataFileURL;
- (NoteAttachmentPresentation)initWithData:(id)a3 contentID:(id)a4 mimeType:(id)a5 filename:(id)a6;
- (NoteAttachmentPresentation)initWithNoteAttachmentObject:(id)a3;
- (void)clearCache;
- (void)setContentID:(id)a3;
- (void)setContentIDURL:(id)a3;
- (void)setContentIDURLAbsoluteString:(id)a3;
- (void)setData:(id)a3;
- (void)setDataFileURL:(id)a3;
- (void)setDataFileURLError:(id)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setImage:(BOOL)a3;
- (void)setMimeType:(id)a3;
- (void)updateContentIDURL;
@end

@implementation NoteAttachmentPresentation

+ (id)attachmentPresentationsForAttachments:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_alloc((Class)a1);
        v13 = objc_msgSend(v12, "initWithNoteAttachmentObject:", v11, (void)v16);
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (NoteAttachmentPresentation)initWithNoteAttachmentObject:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NoteAttachmentPresentation;
  v5 = [(NoteAttachmentPresentation *)&v28 init];
  if (v5)
  {
    id v6 = [v4 contentID];
    uint64_t v7 = [v6 copy];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v7;

    [(NoteAttachmentPresentation *)v5 updateContentIDURL];
    id v27 = 0;
    uint64_t v9 = [v4 attachmentDataFileURLWithError:&v27];
    id v10 = v27;
    id v11 = v27;
    uint64_t v12 = [v9 copy];
    dataFileURL = v5->_dataFileURL;
    v5->_dataFileURL = (NSURL *)v12;

    v14 = v5->_dataFileURL;
    if (v14)
    {
      id v26 = v11;
      v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v14 options:0 error:&v26];
      id v16 = v26;

      if (v15)
      {
        long long v17 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v15);
        v5->_image = v17 != 0;
      }
      else
      {
        long long v17 = [(NSURL *)v5->_dataFileURL path];
        NSLog(&cfstr_UnableToReadDa.isa, v17, v16);
      }
    }
    else
    {
      objc_storeStrong((id *)&v5->_dataFileURLError, v10);
      NSLog(&cfstr_CanTFindDataFo.isa, v4, v11);
      id v16 = v11;
    }
    uint64_t v18 = [v4 mimeType];
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v18;

    uint64_t v20 = [v4 filename];
    filename = v5->_filename;
    v5->_filename = (NSString *)v20;

    v22 = [v4 note];
    v23 = [v22 store];
    v24 = [v23 account];
    v5->_sourceIsManaged = [v24 isManaged];
  }
  return v5;
}

- (NoteAttachmentPresentation)initWithData:(id)a3 contentID:(id)a4 mimeType:(id)a5 filename:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)NoteAttachmentPresentation;
  v15 = [(NoteAttachmentPresentation *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    contentID = v15->_contentID;
    v15->_contentID = (NSString *)v16;

    [(NoteAttachmentPresentation *)v15 updateContentIDURL];
    uint64_t v18 = [v13 copy];
    mimeType = v15->_mimeType;
    v15->_mimeType = (NSString *)v18;

    objc_storeStrong((id *)&v15->_data, a3);
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v11);
    v15->_image = v20 != 0;
    uint64_t v21 = [v14 pathExtension];
    uint64_t v22 = [v21 length];

    if (!v22)
    {
      v23 = [MEMORY[0x1E4F442D8] typeWithMIMEType:v13];
      v24 = [v23 preferredFilenameExtension];

      if (v24)
      {
        v25 = [v23 preferredFilenameExtension];
        uint64_t v26 = [v14 stringByAppendingPathExtension:v25];

        id v14 = (id)v26;
      }
    }
    uint64_t v27 = [v14 copy];
    filename = v15->_filename;
    v15->_filename = (NSString *)v27;
  }
  return v15;
}

- (NSNumber)dataSizeNumber
{
  v3 = [(NoteAttachmentPresentation *)self dataFileURL];

  if (v3)
  {
    id v4 = [(NoteAttachmentPresentation *)self dataFileURL];
    id v10 = 0;
    [v4 getResourceValue:&v10 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    id v5 = v10;
  }
  else
  {
    id v6 = [(NoteAttachmentPresentation *)self data];

    if (v6)
    {
      uint64_t v7 = NSNumber;
      uint64_t v8 = [(NoteAttachmentPresentation *)self data];
      objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  return (NSNumber *)v5;
}

- (BOOL)getPresentationData:(id *)a3 mimeType:(id *)a4 error:(id *)a5
{
  uint64_t v9 = [(NoteAttachmentPresentation *)self dataFileURL];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F1C9B8];
    id v11 = [(NoteAttachmentPresentation *)self dataFileURL];
    id v12 = [v11 path];
    id v13 = [v10 dataWithContentsOfFile:v12 options:0 error:a5];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      if (a4)
      {
        *a4 = [(NoteAttachmentPresentation *)self mimeType];
      }
    }
  }
  else
  {
    v15 = [(NoteAttachmentPresentation *)self dataFileURL];
    if (v15)
    {
    }
    else
    {
      uint64_t v18 = [(NoteAttachmentPresentation *)self dataFileURLError];

      if (v18)
      {
        if (!a5) {
          return 0;
        }
        [(NoteAttachmentPresentation *)self dataFileURLError];
        BOOL v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        return v14;
      }
    }
    uint64_t v16 = [(NoteAttachmentPresentation *)self mimeType];
    if (a3)
    {
      *a3 = [(NoteAttachmentPresentation *)self data];
    }
    if (a4) {
      *a4 = v16;
    }

    return 1;
  }
  return v14;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
  [(NoteAttachmentPresentation *)self updateContentIDURL];
}

- (void)updateContentIDURL
{
  objc_msgSend(NSString, "ic_newURLForContentID:percentEscaped:", self->_contentID, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NoteAttachmentPresentation *)self setContentIDURL:v3];
}

- (void)setContentIDURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentIDURL, a3);
  id v5 = a3;
  id v6 = [v5 absoluteString];

  [(NoteAttachmentPresentation *)self setContentIDURLAbsoluteString:v6];
}

- (void)clearCache
{
}

+ (id)presentationSelector
{
  return @"img, object";
}

+ (void)prepareDocumentForPresentationWithAttachmentContentIDs:(id)a3 withAttachmentPresentations:(id)a4 occurences:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(a4, "ic_dictionaryByHashingContentWithFunction:", &__block_literal_global_58);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (*(void *)(*((void *)&v17 + 1) + 8 * v14))
        {
          v15 = [v8 objectForKeyedSubscript:(void)v17];
          if (v15)
          {
            uint64_t v16 = [[NoteAttachmentPresentationOccurence alloc] initWithPresentation:v15 element:0];
            [v9 addObject:v16];
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (a5) {
    *a5 = (id)[v9 copy];
  }
}

uint64_t __124__NoteAttachmentPresentation_prepareDocumentForPresentationWithAttachmentContentIDs_withAttachmentPresentations_occurences___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentID];
}

+ (void)prepareDocumentForSerializationWithAttachmentContentIDs:(id)a3 withAttachmentPresentations:(id)a4 newPresentationProvider:(id)a5 leftoverPresentations:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v9];
  v24 = v9;
  uint64_t v12 = objc_msgSend(v9, "ic_dictionaryByHashingContentWithFunction:", &__block_literal_global_25_0);
  uint64_t v13 = (void *)[v12 mutableCopy];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (v19)
        {
          uint64_t v20 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          if (v20)
          {
            uint64_t v21 = (void *)v20;
            [v11 removeObject:v20];
          }
          else
          {
            if (!v10) {
              continue;
            }
            uint64_t v22 = objc_msgSend(NSString, "ic_newURLForContentID:percentEscaped:", v19, 0);
            uint64_t v21 = v10[2](v10, v22);
            if (v21) {
              [v13 setObject:v21 forKey:v19];
            }
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  if (a6)
  {
    *a6 = [v11 array];
  }
}

uint64_t __160__NoteAttachmentPresentation_prepareDocumentForSerializationWithAttachmentContentIDs_withAttachmentPresentations_newPresentationProvider_leftoverPresentations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentID];
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSURL)contentIDURL
{
  return self->_contentIDURL;
}

- (NSURL)dataFileURL
{
  return self->_dataFileURL;
}

- (void)setDataFileURL:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

- (NSError)dataFileURLError
{
  return self->_dataFileURLError;
}

- (void)setDataFileURLError:(id)a3
{
}

- (NSString)contentIDURLAbsoluteString
{
  return self->_contentIDURLAbsoluteString;
}

- (void)setContentIDURLAbsoluteString:(id)a3
{
}

- (BOOL)isImage
{
  return self->_image;
}

- (void)setImage:(BOOL)a3
{
  self->_image = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentIDURLAbsoluteString, 0);
  objc_storeStrong((id *)&self->_dataFileURLError, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_dataFileURL, 0);
  objc_storeStrong((id *)&self->_contentIDURL, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end