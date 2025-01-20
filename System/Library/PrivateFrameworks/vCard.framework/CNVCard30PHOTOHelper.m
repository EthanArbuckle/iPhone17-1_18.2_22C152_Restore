@interface CNVCard30PHOTOHelper
+ (id)log;
- (CNVCard30PHOTOHelper)init;
- (CNVCard30PHOTOHelper)initWithPerson:(id)a3 options:(id)a4 maximumDataLength:(unint64_t)a5;
- (CNVCardPerson)person;
- (CNVCardWritingOptions)options;
- (id)bestEffortImage;
- (id)compressImage:(id)a3 allowableCompressions:(id)a4;
- (id)description;
- (id)image;
- (id)largeImage;
- (id)scaleImage:(id)a3 toFit:(CGSize)a4 allowableCompressionQuality:(id)a5;
- (id)scaleImage:(id)a3 toFitSizes:(id)a4 allowableCompressionQuality:(id)a5;
- (unint64_t)maxBytes;
- (void)logBestEfforImageIfNonNil:(id)a3;
@end

@implementation CNVCard30PHOTOHelper

+ (id)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_12);
  }
  v2 = (void *)log_cn_once_object_1;
  return v2;
}

uint64_t __27__CNVCard30PHOTOHelper_log__block_invoke()
{
  log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.vcard", "vcardphotohelper");
  return MEMORY[0x1F41817F8]();
}

- (CNVCard30PHOTOHelper)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNVCard30PHOTOHelper)initWithPerson:(id)a3 options:(id)a4 maximumDataLength:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNVCard30PHOTOHelper;
  v11 = [(CNVCard30PHOTOHelper *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_person, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v12->_maxBytes = a5;
    v13 = v12;
  }

  return v12;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNVCard30PHOTOHelper *)self person];
  id v5 = (id)[v3 appendName:@"person" object:v4];

  v6 = [(CNVCard30PHOTOHelper *)self options];
  id v7 = (id)[v3 appendName:@"options" object:v6];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CNVCard30PHOTOHelper maxBytes](self, "maxBytes"));
  id v9 = (id)[v3 appendName:@"maximumDataLength" object:v8];

  id v10 = [v3 build];

  return v10;
}

- (id)bestEffortImage
{
  v29[2] = *MEMORY[0x1E4F143B8];
  if (![(CNVCard30PHOTOHelper *)self maxBytes])
  {
    id v15 = 0;
    goto LABEL_14;
  }
  id v3 = [(CNVCard30PHOTOHelper *)self options];
  [v3 maximumImageSize];
  v31.width = v4;
  v31.height = v5;
  BOOL v6 = NSEqualSizes(*MEMORY[0x1E4F28AE0], v31);

  if (v6)
  {
    id v7 = [(CNVCard30PHOTOHelper *)self options];
    int v8 = [v7 prefersUncroppedPhotos];

    if (v8)
    {
      id v9 = [(CNVCard30PHOTOHelper *)self largeImage];
      id v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 1024.0, 1024.0);
      v28[0] = v10;
      v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 512.0, 512.0);
      v28[1] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      v13 = [(CNVCard30PHOTOHelper *)self scaleImage:v9 toFitSizes:v12 allowableCompressionQuality:&unk_1F3638E68];

      [(CNVCard30PHOTOHelper *)self logBestEfforImageIfNonNil:v13];
      id v14 = v13;
      if (v14)
      {
        id v15 = v14;
LABEL_8:
        id v21 = v15;
LABEL_12:

        id v15 = v21;
        goto LABEL_13;
      }
    }
    id v9 = [(CNVCard30PHOTOHelper *)self image];
    v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 1024.0, 1024.0);
    v27[0] = v22;
    v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 512.0, 512.0);
    v27[1] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v25 = [(CNVCard30PHOTOHelper *)self scaleImage:v9 toFitSizes:v24 allowableCompressionQuality:&unk_1F3638E80];

    [(CNVCard30PHOTOHelper *)self logBestEfforImageIfNonNil:v25];
    id v15 = v25;

    if (!v15)
    {
      id v21 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    id v9 = [(CNVCard30PHOTOHelper *)self image];
    v16 = [(CNVCard30PHOTOHelper *)self options];
    [v16 maximumImageSize];
    objc_msgSend(v9, "setSize:");

    v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 1024.0, 1024.0);
    v29[0] = v17;
    v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 512.0, 512.0);
    v29[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v20 = [(CNVCard30PHOTOHelper *)self scaleImage:v9 toFitSizes:v19 allowableCompressionQuality:&unk_1F3638E50];

    [(CNVCard30PHOTOHelper *)self logBestEfforImageIfNonNil:v20];
    id v15 = v20;
    if (v15) {
      goto LABEL_8;
    }
  }
LABEL_13:

LABEL_14:
  return v15;
}

- (id)largeImage
{
  id v3 = [CNVCardMutableImage alloc];
  CGFloat v4 = [(CNVCard30PHOTOHelper *)self person];
  CGFloat v5 = [v4 largeImageData];
  BOOL v6 = [(CNVCard30PHOTOHelper *)self person];
  id v7 = [v6 largeImageCropRects];
  int v8 = [(CNVCardImage *)v3 initWithData:v5 cropRects:v7];

  return v8;
}

- (id)image
{
  id v3 = [CNVCardMutableImage alloc];
  CGFloat v4 = [(CNVCard30PHOTOHelper *)self person];
  CGFloat v5 = [v4 imageData];
  BOOL v6 = [(CNVCard30PHOTOHelper *)self person];
  id v7 = [v6 imageCropRects];
  int v8 = [(CNVCardImage *)v3 initWithData:v5 cropRects:v7];

  return v8;
}

- (id)scaleImage:(id)a3 toFitSizes:(id)a4 allowableCompressionQuality:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNVCard30PHOTOHelper *)self options];
  char v12 = [v11 compressPhotos];

  if ((v12 & 1) == 0)
  {
    id v13 = v8;
    id v14 = [v13 data];
    unint64_t v15 = [v14 length];
    unint64_t v16 = [(CNVCard30PHOTOHelper *)self maxBytes];

    if (v15 < v16) {
      goto LABEL_16;
    }
  }
  id v13 = [(CNVCard30PHOTOHelper *)self compressImage:v8 allowableCompressions:v10];
  if (!v13)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "sizeValue", (void)v24);
          uint64_t v22 = -[CNVCard30PHOTOHelper scaleImage:toFit:allowableCompressionQuality:](self, "scaleImage:toFit:allowableCompressionQuality:", v8, v10);
          if (v22)
          {
            id v13 = (id)v22;
            goto LABEL_15;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_15:
  }
LABEL_16:

  return v13;
}

- (id)scaleImage:(id)a3 toFit:(CGSize)a4 allowableCompressionQuality:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  [v9 size];
  if (v11 <= width && ([v9 size], v12 <= height))
  {
    id v15 = 0;
  }
  else
  {
    objc_msgSend(v9, "setSize:", width, height);
    id v13 = [(CNVCard30PHOTOHelper *)self options];
    char v14 = [v13 compressPhotos];

    if (v14)
    {
      id v15 = [(CNVCard30PHOTOHelper *)self compressImage:v9 allowableCompressions:v10];
    }
    else
    {
      [v9 setCompressionQuality:&unk_1F3638ED8];
      id v16 = v9;
      id v17 = [v16 data];
      unint64_t v18 = [v17 length];
      unint64_t v19 = [(CNVCard30PHOTOHelper *)self maxBytes];

      if (v18 >= v19) {
        id v15 = 0;
      }
      else {
        id v15 = v16;
      }
    }
  }

  return v15;
}

- (id)compressImage:(id)a3 allowableCompressions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNVCard30PHOTOHelper *)self options];
  int v9 = [v8 compressPhotos];

  if (v9)
  {
    if (([v6 isSourceLossless] & 1) != 0 || objc_msgSend(v6, "hasAlphaChannel"))
    {
      [v6 setCompressionQuality:&unk_1F3638ED8];
      id v10 = v6;
      double v11 = [v10 data];
      unint64_t v12 = [v11 length];
      unint64_t v13 = [(CNVCard30PHOTOHelper *)self maxBytes];

      if (v12 < v13) {
        goto LABEL_19;
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v23 = v7;
      uint64_t v17 = *(void *)v25;
LABEL_8:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        [v6 setCompressionQuality:*(void *)(*((void *)&v24 + 1) + 8 * v18)];
        id v10 = v6;
        unint64_t v19 = [v10 data];
        unint64_t v20 = [v19 length];
        unint64_t v21 = [(CNVCard30PHOTOHelper *)self maxBytes];

        if (v20 < v21) {
          break;
        }

        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            goto LABEL_8;
          }
          id v10 = 0;
          break;
        }
      }
      id v7 = v23;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_19:

  return v10;
}

- (void)logBestEfforImageIfNonNil:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    CGFloat v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [v3 size];
      uint64_t v6 = v5;
      [v3 size];
      uint64_t v8 = v7;
      int v9 = [v3 cropRects];
      int v10 = 134218498;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1DC18F000, v4, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Best effort image with size (%.2f x %.2f) and cropRects %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (CNVCardPerson)person
{
  return self->_person;
}

- (CNVCardWritingOptions)options
{
  return self->_options;
}

- (unint64_t)maxBytes
{
  return self->_maxBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end