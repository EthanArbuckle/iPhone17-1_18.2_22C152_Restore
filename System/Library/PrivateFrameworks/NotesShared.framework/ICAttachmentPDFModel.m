@interface ICAttachmentPDFModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
+ (id)contentTextFromPDFAtURL:(id)a3;
- (BOOL)canMarkup;
- (BOOL)hasPreviews;
- (BOOL)providesStandaloneTitleForNote;
- (BOOL)showThumbnailInNoteList;
- (id)searchableTextContent;
- (id)standaloneTitleForNote;
@end

@implementation ICAttachmentPDFModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_PDFS_%lu" value:@"NOTE_LIST_PDFS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (BOOL)hasPreviews
{
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 previewImages];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v7 = [(ICAttachmentModel *)self attachment];
    v8 = [v7 media];
    CFURLRef v9 = [v8 mediaURL];
    v10 = CGPDFDocumentCreateWithURL(v9);

    if (v10)
    {
      BOOL v6 = !CGPDFDocumentIsEncrypted(v10);
      CGPDFDocumentRelease(v10);
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)showThumbnailInNoteList
{
  if (![(ICAttachmentModel *)self hasThumbnailImage]) {
    return 0;
  }
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 previewImages];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)canMarkup
{
  return 1;
}

+ (id)contentTextFromPDFAtURL:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v34 = v3;
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F38DA0]) initWithURL:v3];
  BOOL v5 = (CGPDFDocument *)[v35 documentRef];
  if (v5)
  {
    Info = CGPDFDocumentGetInfo(v5);
    if (Info)
    {
      v7 = Info;
      CGPDFArrayRef array = 0;
      CGPDFStringRef value = 0;
      if (CGPDFDictionaryGetString(Info, "Title", &value))
      {
        v8 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v8];
      }
      if (CGPDFDictionaryGetString(v7, "Author", &value))
      {
        CFURLRef v9 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v9];
      }
      if (CGPDFDictionaryGetString(v7, "Subject", &value))
      {
        v10 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v10];
      }
      if (CGPDFDictionaryGetString(v7, "Creator", &value))
      {
        v11 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v11];
      }
      if (CGPDFDictionaryGetString(v7, "Producer", &value))
      {
        v12 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v12];
      }
      if (CGPDFDictionaryGetString(v7, "CreationDate", &value))
      {
        v13 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v13];
      }
      if (CGPDFDictionaryGetArray(v7, "AAPL:Keywords", &array))
      {
        size_t Count = CGPDFArrayGetCount(array);
        if (Count)
        {
          size_t v15 = Count;
          for (size_t i = 0; i != v15; ++i)
          {
            if (CGPDFArrayGetString(array, i, &value))
            {
              v17 = (__CFString *)CGPDFStringCopyTextString(value);
              [v4 addObject:v17];
            }
          }
        }
      }
      else if (CGPDFDictionaryGetString(v7, "Keywords", &value))
      {
        v18 = (__CFString *)CGPDFStringCopyTextString(value);
        [v4 addObject:v18];
      }
    }
    unint64_t v19 = [v35 pageCount];
    uint64_t v20 = 0;
    if (v19 >= 0x64) {
      uint64_t v21 = 100;
    }
    else {
      uint64_t v21 = v19;
    }
    do
    {
      v22 = (void *)MEMORY[0x1C877DB80]();
      v23 = [v35 pageAtIndex:v20];
      if ([v23 pageRef])
      {
        v24 = (void *)CGPDFPageCopyString();
        objc_msgSend(v4, "ic_addNonNilObject:", v24);
      }
      v25 = [v23 annotations];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = [*(id *)(*((void *)&v36 + 1) + 8 * j) contents];
            objc_msgSend(v4, "ic_addNonNilObject:", v30);
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v27);
      }
    }
    while (v20++ != v21);
  }
  v32 = [v4 componentsJoinedByString:@" "];

  return v32;
}

- (id)searchableTextContent
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentPDFModel;
  v4 = [(ICAttachmentModel *)&v14 searchableTextContent];
  if (v4) {
    [v3 addObject:v4];
  }
  BOOL v5 = [(ICAttachmentModel *)self attachment];
  BOOL v6 = [v5 media];
  v7 = [v6 mediaURL];

  if (v7)
  {
    v8 = [(ICAttachmentModel *)self attachment];
    CFURLRef v9 = [v8 media];
    v10 = [v9 mediaURL];
    v11 = +[ICAttachmentPDFModel contentTextFromPDFAtURL:v10];

    if (v11) {
      [v3 addObject:v11];
    }
  }
  v12 = [v3 componentsJoinedByString:@" "];

  return v12;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  id v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 userTitle];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    BOOL v6 = [(ICAttachmentModel *)self attachment];
    id v5 = [v6 title];
  }
  if (![v5 length])
  {
    uint64_t v7 = +[ICNote defaultTitleForEmptyNote];

    id v5 = (id)v7;
  }
  v8 = [v5 pathExtension];
  if ([v8 length])
  {
    CFURLRef v9 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v8];
    if ([v9 isEqual:*MEMORY[0x1E4F44450]])
    {
      uint64_t v10 = [v5 stringByDeletingPathExtension];

      id v5 = (id)v10;
    }
  }
  return v5;
}

@end