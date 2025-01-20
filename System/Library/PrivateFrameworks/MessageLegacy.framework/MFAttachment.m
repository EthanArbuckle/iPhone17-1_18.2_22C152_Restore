@interface MFAttachment
- (BOOL)conformsToType:(id)a3;
- (BOOL)contentTypeConformsToEvent;
- (BOOL)contentTypeConformsToEventICS;
- (BOOL)contentTypeConformsToEventVCS;
- (BOOL)contentTypeConformsToIWork;
- (BOOL)contentTypeConformsToMarkup;
- (BOOL)contentTypeConformsToPassbook;
- (BOOL)contentTypeConformsToProvisionment;
- (BOOL)contentTypeConformsToVCard;
- (BOOL)isAutoArchive;
- (BOOL)isAvailable;
- (BOOL)isCached;
- (BOOL)isContainedInCompose;
- (BOOL)isContainedInRFC822;
- (BOOL)isDataAvailableLocally;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageFile;
- (BOOL)isMailDrop;
- (BOOL)isMailDropPhotoArchive;
- (BOOL)isPlaceholder;
- (BOOL)wantsCompletionBlockOffMainThread;
- (MFAttachment)initWithURL:(id)a3 attachmentManager:(id)a4;
- (MFAttachmentManager)attachmentManager;
- (MFAttachmentPlaceholder)placeholder;
- (MFDataConsumer)customConsumer;
- (MFMimePart)part;
- (NSProgress)downloadProgress;
- (NSString)contentID;
- (NSString)description;
- (NSString)disposition;
- (NSString)fileName;
- (NSString)fileUTType;
- (NSString)inferredMimeType;
- (NSString)mimeType;
- (NSString)path;
- (NSString)remoteImageFileName;
- (NSURL)url;
- (double)lastProgressTime;
- (id)_dataProvider;
- (id)_fileUTTypeForFileName:(id)a3;
- (id)attachmentContentTypeForFileName:(id)a3;
- (id)decodeFilterWithDataConsumer:(id)a3;
- (id)fetchCompletionBlock;
- (id)fetchDataSynchronously:(id *)a3;
- (id)fetchDataSynchronously:(id *)a3 stripPrivateMetadata:(BOOL)a4;
- (id)fetchDataToURL:(id *)a3;
- (id)fetchLocalData;
- (id)fetchLocalData:(id *)a3 stripPrivateMetadata:(BOOL)a4;
- (id)fetchPlaceholderData;
- (id)fileAttributes;
- (id)fileNameByStrippingZipIfNeeded:(BOOL)a3;
- (id)fileURL;
- (id)filterData:(id)a3;
- (id)filterICSData:(id)a3;
- (id)filterVCSData:(id)a3;
- (id)metadataValueForKey:(id)a3;
- (id)readFromDisk;
- (id)textEncodingGuessWithData:(id)a3;
- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4;
- (unint64_t)decodedFileSize;
- (unint64_t)encodedFileSize;
- (unint64_t)hash;
- (unint64_t)lastProgressBytes;
- (unint64_t)sizeOnDisk;
- (void)_dataProvider;
- (void)cancel;
- (void)dealloc;
- (void)fetchData;
- (void)fetchPlaceholderData;
- (void)readFromDisk;
- (void)resetProgress;
- (void)setAttachmentManager:(id)a3;
- (void)setContentID:(id)a3;
- (void)setCustomConsumer:(id)a3;
- (void)setDecodedFileSize:(unint64_t)a3;
- (void)setDisposition:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setEncodedFileSize:(unint64_t)a3;
- (void)setFetchCompletionBlock:(id)a3;
- (void)setFileName:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setLastProgressBytes:(unint64_t)a3;
- (void)setLastProgressTime:(double)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setMimeType:(id)a3;
- (void)setPart:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRemoteImageFileName:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWantsCompletionBlockOffMainThread:(BOOL)a3;
- (void)updateProgressWithCurrentBytes:(unint64_t)a3;
- (void)writeToDiskWithData:(id)a3;
@end

@implementation MFAttachment

- (MFAttachment)initWithURL:(id)a3 attachmentManager:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MFAttachment;
  v6 = [(MFAttachment *)&v8 init];
  if (v6)
  {
    v6->_url = (NSURL *)a3;
    v6->_attachmentManager = (MFAttachmentManager *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFAttachment;
  [(MFAttachment *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> url=%@, path=%@, contentID=%@, mimeType=%@, mimePart=%@, isMailDrop=%d", objc_opt_class(), self, -[MFAttachment url](self, "url"), -[MFAttachment path](self, "path"), -[MFAttachment contentID](self, "contentID"), -[MFAttachment mimeType](self, "mimeType"), -[MFAttachment part](self, "part"), -[MFAttachment isMailDrop](self, "isMailDrop")];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(MFAttachment *)self contentID];
  uint64_t v6 = [a3 contentID];
  return [(NSString *)v5 isEqualToString:v6];
}

- (unint64_t)hash
{
  v2 = [(MFAttachment *)self contentID];
  return [(NSString *)v2 hash];
}

- (id)metadataValueForKey:(id)a3
{
  return [(MFAttachmentManager *)self->_attachmentManager metadataForAttachment:self forKey:a3];
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
}

- (id)decodeFilterWithDataConsumer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[(MFMimePart *)[(MFAttachment *)self part] contentTransferEncoding];
  if ([(MFAttachment *)self isMailDrop] && ![(MFAttachment *)self part])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F73498] filterWithConsumer:a3];
    v12 = MFLogGeneral();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    int v15 = 138413570;
    v16 = self;
    __int16 v17 = 1024;
    *(_DWORD *)v18 = [(MFAttachment *)self isDataAvailableLocally];
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = [(MFAttachment *)self isContainedInRFC822];
    __int16 v19 = 1024;
    BOOL v20 = [(MFAttachment *)self isMailDrop];
    __int16 v21 = 2048;
    v22 = [(MFAttachment *)self part];
    __int16 v23 = 2114;
    v24 = v5;
    objc_super v8 = "#Attachments %@ performing no conversion (isDataAvailableLocally=%d, isContainedInRFC822=%d, isMailDrop=%d, par"
         "t=%p, contentTransferEncoding=%{public}@)";
    v9 = v12;
    uint32_t v10 = 50;
    goto LABEL_10;
  }
  if (v5
    && ([v5 isEqualToString:@"7bit"] & 1) == 0
    && ([v5 isEqualToString:@"8bit"] & 1) == 0
    && ![v5 isEqualToString:@"binary"])
  {
    if ([v5 isEqualToString:@"quoted-printable"])
    {
      v13 = (void *)[MEMORY[0x1E4F73568] filterWithConsumer:a3];
      uint64_t v6 = (void *)[MEMORY[0x1E4F734E0] filterWithConsumer:v13];
      objc_msgSend(v13, "setForTextPart:", objc_msgSend((id)-[MFMimePart type](-[MFAttachment part](self, "part"), "type"), "isEqualToString:", @"text"));
      v14 = MFLogGeneral();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        return v6;
      }
      int v15 = 138412290;
      v16 = self;
      objc_super v8 = "#Attachments %@ quoted-printable";
    }
    else if ([v5 isEqualToString:@"base64"])
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F73488] filterWithConsumer:a3];
      v14 = MFLogGeneral();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        return v6;
      }
      int v15 = 138412290;
      v16 = self;
      objc_super v8 = "#Attachments %@ base64";
    }
    else
    {
      if (![v5 isEqualToString:@"x-uuencode"])
      {
        uint64_t v6 = (void *)[MEMORY[0x1E4F73498] filterWithConsumer:a3];
        v7 = MFLogGeneral();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          return v6;
        }
        int v15 = 138412546;
        v16 = self;
        __int16 v17 = 2114;
        *(void *)v18 = v5;
        objc_super v8 = "#Attachments %@ unknown encoding (contentTransferEncoding=%{public}@)";
        goto LABEL_9;
      }
      uint64_t v6 = (void *)[MEMORY[0x1E4F73590] filterWithConsumer:a3];
      v14 = MFLogGeneral();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        return v6;
      }
      int v15 = 138412290;
      v16 = self;
      objc_super v8 = "#Attachments %@ uuencode";
    }
    v9 = v14;
    uint32_t v10 = 12;
    goto LABEL_10;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F734E0] filterWithConsumer:a3];
  v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = self;
    __int16 v17 = 2114;
    *(void *)v18 = v5;
    objc_super v8 = "#Attachments %@ stripping line endings (contentTransferEncoding=%{public}@)";
LABEL_9:
    v9 = v7;
    uint32_t v10 = 22;
LABEL_10:
    _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
  }
  return v6;
}

- (void)fetchData
{
  [(MFAttachmentManager *)self->_attachmentManager fetchDataForAttachment:self];
  objc_super v3 = [(MFAttachment *)self downloadProgress];
  [(NSProgress *)v3 resume];
}

- (id)fetchLocalData
{
  return [(MFAttachment *)self fetchLocalData:0 stripPrivateMetadata:0];
}

- (id)fetchLocalData:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(MFAttachment *)self isContainedInRFC822]
    || [(MFAttachment *)self isContainedInCompose])
  {
    if (!self->_attachmentManager) {
      self->_attachmentManager = (MFAttachmentManager *)+[MFAttachmentManager defaultManager];
    }
    uint64_t v6 = (void *)[MEMORY[0x1E4F60E18] promise];
    id v7 = objc_alloc_init(MEMORY[0x1E4F734A8]);
    uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    id v9 = [(MFAttachment *)self _dataProvider];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __EFPromiseAttachmentDataHandler_block_invoke;
    v14[3] = &unk_1E6866EA8;
    v14[4] = v7;
    v14[5] = v6;
    objc_msgSend(v9, "fetchDataForAttachment:consumer:progress:completion:", self, v7, v8, (id)objc_msgSend(v14, "copy"));
    CFDataRef v10 = (const __CFData *)objc_msgSend((id)objc_msgSend(v6, "future"), "result:", 0);
  }
  else
  {
    CFDataRef v10 = [(MFAttachment *)self readFromDisk];
  }
  CFDataRef v11 = v10;
  if ([(__CFData *)v10 length])
  {
    if (v4 && [(MFAttachment *)self isImageFile]) {
      CFDataRef v11 = _stripPrivateFileMetadata(v11);
    }
    return [(MFAttachment *)self filterData:v11];
  }
  else
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MFAttachment fetchLocalData:stripPrivateMetadata:](self);
    }
  }
  return v11;
}

- (id)fetchDataSynchronously:(id *)a3
{
  return [(MFAttachment *)self fetchDataSynchronously:a3 stripPrivateMetadata:0];
}

- (id)fetchDataSynchronously:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:](v7);
    }
    CFDataRef v8 = [(MFAttachment *)self fetchLocalData:&v17 stripPrivateMetadata:0];
  }
  else
  {
    id v9 = (void *)[MEMORY[0x1E4F60E18] promise];
    id v10 = [(MFAttachment *)self fetchCompletionBlock];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke;
    v16[3] = &unk_1E6866E80;
    v16[5] = v9;
    v16[6] = v10;
    v16[4] = self;
    [(MFAttachment *)self setFetchCompletionBlock:v16];
    [(MFAttachmentManager *)self->_attachmentManager fetchDataSynchronouslyForAttachment:self];
    CFDataRef v8 = (const __CFData *)objc_msgSend((id)objc_msgSend(v9, "future"), "result:", &v17);
  }
  CFDataRef v11 = v8;
  if ([(__CFData *)v8 length])
  {
    if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:v11])
    {
      id v12 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v11];
      if (v12)
      {
        id v13 = v12;
        CFDataRef v11 = +[MFAttachmentPlaceholder dataForPlaceholder:v12];
        [(MFAttachment *)self setPlaceholder:v13];
      }
    }
    if (v4 && [(MFAttachment *)self isImageFile])
    {
      CFDataRef v11 = _stripPrivateFileMetadata(v11);
      if (!a3) {
        return v11;
      }
      goto LABEL_16;
    }
  }
  else
  {
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:](self, &v17);
      if (!a3) {
        return v11;
      }
      goto LABEL_16;
    }
  }
  if (a3) {
LABEL_16:
  }
    *a3 = v17;
  return v11;
}

uint64_t __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  }
  if (a2) {
    uint64_t v7 = [*(id *)(a1 + 32) filterData:a2];
  }
  else {
    uint64_t v7 = 0;
  }
  CFDataRef v8 = *(void **)(a1 + 40);
  return [v8 finishWithResult:v7 error:a3];
}

- (void)cancel
{
}

- (id)fetchDataToURL:(id *)a3
{
  uint64_t v8 = 0;
  if ([(MFAttachment *)self isPlaceholder])
  {
    BOOL v4 = [(MFAttachment *)self placeholder];
    return [(MFAttachmentPlaceholder *)v4 fileURL];
  }
  else
  {
    id v6 = [(MFAttachment *)self fetchDataSynchronously:&v8];
    id result = +[MFAttachmentUtilities temporaryFileURLWithFileName:[(MFAttachment *)self fileName]];
    if (result)
    {
      id v7 = result;
      if ([v6 writeToURL:result options:0 error:&v8]) {
        return v7;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)isMailDrop
{
  return 0;
}

- (BOOL)isMailDropPhotoArchive
{
  return 0;
}

- (id)fetchPlaceholderData
{
  placeholder = self->_placeholder;
  if (placeholder)
  {
    return [(MFAttachmentPlaceholder *)placeholder serializedRepresentation];
  }
  else
  {
    id v5 = [(MFAttachment *)self _dataProvider];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = objc_msgSend(-[MFAttachment _dataProvider](self, "_dataProvider"), "rawDataForContentID:", -[MFAttachment contentID](self, "contentID"));
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F734A8]);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F73578], "rangedFilterWithConsumer:range:", v7, 0, 2100);
      id v9 = (void *)[MEMORY[0x1E4F60E18] promise];
      uint64_t v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __EFPromiseAttachmentDataHandler_block_invoke;
      v15[3] = &unk_1E6866EA8;
      v15[4] = v7;
      v15[5] = v9;
      objc_msgSend(v5, "fetchDataForAttachment:consumer:progress:completion:", self, v8, v10, (id)objc_msgSend(v15, "copy"));
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v9, "future"), "result:", 0);
    }
    CFDataRef v11 = (void *)v6;
    if (v6)
    {
      id v12 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v6];
      if (v12)
      {
        id v13 = v12;

        self->_placeholder = (MFAttachmentPlaceholder *)v13;
      }
    }
    else
    {
      v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MFAttachment fetchPlaceholderData](self);
      }
      return 0;
    }
    return v11;
  }
}

- (MFAttachmentPlaceholder)placeholder
{
  id result = self->_placeholder;
  if (!result)
  {
    [(MFAttachment *)self fetchPlaceholderData];
    return self->_placeholder;
  }
  return result;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(MFAttachment *)self setMetadataValue:v4 forKey:@"MFAttachmentIsPlaceholder"];
}

- (BOOL)isPlaceholder
{
  id v3 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentIsPlaceholder"];
  if (!v3) {
    return [(MFAttachment *)self placeholder] != 0;
  }
  return [v3 BOOLValue];
}

- (NSProgress)downloadProgress
{
  id result = self->_downloadProgress;
  if (!result)
  {
    unint64_t v4 = [(MFAttachment *)self encodedFileSize];
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = -1;
    }
    uint64_t v6 = (void *)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v5];
    if ([(MFAttachment *)self isDataAvailableLocally]) {
      [v6 setCompletedUnitCount:v5];
    }
    else {
      [v6 pause];
    }
    [(MFAttachment *)self setDownloadProgress:v6];
    return self->_downloadProgress;
  }
  return result;
}

- (void)updateProgressWithCurrentBytes:(unint64_t)a3
{
}

- (void)resetProgress
{
}

- (id)fileURL
{
  id result = [(MFAttachment *)self path];
  if (result)
  {
    unint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v5 = [(MFAttachment *)self path];
    return (id)[v4 fileURLWithPath:v5 isDirectory:0];
  }
  return result;
}

- (id)filterData:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"DisableAttachmentFilters") & 1) != 0|| !objc_msgSend(a3, "length")|| !-[MFAttachment contentTypeConformsToEventVCS](self, "contentTypeConformsToEventVCS"))
  {
    return a3;
  }
  return [(MFAttachment *)self filterVCSData:a3];
}

- (id)filterVCSData:(id)a3
{
  uint64_t v4 = [a3 rangeOfData:objc_msgSend(@"\nVERSION:1.0", "dataUsingEncoding:", 4), 0, 0, objc_msgSend(a3, "length") options range];
  id v6 = 0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    id v6 = (id)[a3 mutableCopy];
    [v6 replaceBytesInRange:v7 + 1, v8 - 1, objc_msgSend(@"VERSION:2.0", "UTF8String"), objc_msgSend(@"VERSION:2.0", "length") withBytes length];
  }
  if (v6) {
    return v6;
  }
  else {
    return a3;
  }
}

- (id)filterICSData:(id)a3
{
  return a3;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)_dataProvider
{
  if (![(MFAttachment *)self url]) {
    return 0;
  }
  id v6 = 0;
  id v3 = [(MFAttachmentManager *)self->_attachmentManager _dataProviderForAttachmentURL:[(MFAttachment *)self url] error:&v6];
  if (v6)
  {
    uint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(MFAttachment *)self _dataProvider];
    }
  }
  return v3;
}

- (BOOL)isDataAvailableLocally
{
  if ([(MFAttachment *)self isContainedInRFC822]
    || [(MFAttachment *)self isContainedInCompose])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v3 = [(MFAttachment *)self fileURL];
    if (v3)
    {
      uint64_t v4 = +[MFAttachmentDataProvider dataProviderWithURL:v3];
      LOBYTE(v3) = [(MFAttachmentDataProvider *)v4 exists];
    }
  }
  return (char)v3;
}

- (NSString)inferredMimeType
{
  v2 = NSString;
  id v3 = [(MFAttachment *)self fileName];
  return (NSString *)objc_msgSend(v2, "mf_stringForMimeTypeFromFileName:", v3);
}

- (BOOL)isContainedInRFC822
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[MFAttachment _dataProvider](self, "_dataProvider"), "messageForAttachment:", self), "messageURL"), "scheme"), "isEqualToString:", @"x-attach-RFC822") & 1) == 0)
  {
    uint64_t v3 = [(MFMimePart *)[(MFAttachment *)self part] parentPart];
    if (!v3) {
      return v3;
    }
    uint64_t v4 = (void *)v3;
    while (1)
    {
      uint64_t v5 = [v4 type];
      uint64_t v6 = [v4 subtype];
      uint64_t v7 = (void *)[NSString stringWithFormat:@"%@/%@", v5, v6];
      if (v5)
      {
        uint64_t v8 = v7;
        if (![v7 caseInsensitiveCompare:@"message/rfc822"]
          || ![v8 caseInsensitiveCompare:@"message/delivery-status"])
        {
          break;
        }
      }
      uint64_t v3 = [v4 parentPart];
      uint64_t v4 = (void *)v3;
      if (!v3) {
        return v3;
      }
    }
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)isContainedInCompose
{
  v2 = [(NSURL *)self->_url scheme];
  return [(NSString *)v2 isEqualToString:@"x-attach-compose"];
}

- (BOOL)isImageFile
{
  uint64_t v3 = (MFAttachment *)objc_alloc_init(MEMORY[0x1E4F73588]);
  [(MFAttachment *)v3 setPathExtension:[(NSString *)[(MFAttachment *)self fileName] pathExtension]];
  [(MFAttachment *)v3 setFilename:[(MFAttachment *)self fileName]];
  if (!MFGetTypeInfo())
  {
    if (![(MFAttachment *)self mimeType]) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v4 = [(NSString *)[(MFAttachment *)self mimeType] rangeOfString:@"image/" options:9] != 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  self = v3;
  if ([(MFAttachment *)v3 mimeType]) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v4 = 0;
LABEL_6:

  return v4;
}

- (id)fileNameByStrippingZipIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentFileNameKey"];
  uint64_t v5 = v4;
  if (!v3 || objc_msgSend((id)objc_msgSend(v4, "pathExtension"), "caseInsensitiveCompare:", @"zip")) {
    return v5;
  }
  return (id)[v5 stringByDeletingPathExtension];
}

- (NSString)fileName
{
  return (NSString *)[(MFAttachment *)self fileNameByStrippingZipIfNeeded:0];
}

- (void)setFileName:(id)a3
{
  [(MFAttachment *)self setMetadataValue:a3 forKey:@"MFAttachmentFileNameKey"];
  if (a3)
  {
    id v5 = [(MFAttachmentManager *)self->_attachmentManager _filePathForAttachment:self];
    [(MFAttachment *)self setMetadataValue:v5 forKey:@"MFAttachmentPathKey"];
  }
}

- (NSString)remoteImageFileName
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"MFAttachmentRemoteImageFileNameKey"];
}

- (void)setRemoteImageFileName:(id)a3
{
  [(MFAttachment *)self setMetadataValue:a3 forKey:@"MFAttachmentRemoteImageFileNameKey"];
  if (a3)
  {
    id v5 = [(MFAttachmentManager *)self->_attachmentManager _filePathForAttachment:self];
    [(MFAttachment *)self setMetadataValue:v5 forKey:@"MFAttachmentPathKey"];
  }
}

- (NSString)path
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"MFAttachmentPathKey"];
}

- (id)_fileUTTypeForFileName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentUTTypeKey"];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MFAttachment _fileUTTypeForFileName:]((uint64_t)v6, self);
    }
    goto LABEL_21;
  }
  uint64_t v8 = [(MFAttachment *)self mimeType];
  id v9 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "lowercaseString");
  if ([(__CFString *)v8 isEqualToString:@"application/zip"]
    && (!v9 || [(__CFString *)v9 isEqualToString:@"zip"]))
  {
    id v9 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "pathExtension"), "lowercaseString");
    if (![(__CFString *)v9 length]) {
      id v9 = @"zip";
    }
  }
  if ([(__CFString *)v9 length])
  {
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v9, 0);
    if (PreferredIdentifierForTag)
    {
      CFDataRef v11 = (__CFString *)PreferredIdentifierForTag;
      if (UTTypeIsDynamic(PreferredIdentifierForTag))
      {
        CFRelease(v11);
      }
      else
      {
        [(MFAttachment *)self setMetadataValue:v11 forKey:@"MFAttachmentUTTypeKey"];
        uint64_t v6 = v11;
        v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 138413058;
          id v21 = v6;
          __int16 v22 = 2112;
          p_isa = [(MFAttachment *)self fileName];
          __int16 v24 = 2112;
          uint64_t v25 = v9;
          __int16 v26 = 2112;
          v27 = v8;
          _os_log_debug_impl(&dword_1CFCFE000, v18, OS_LOG_TYPE_DEBUG, "UTType [%@] for filename:[%@] via extension:[%@] mimeType:[%@]", (uint8_t *)&v20, 0x2Au);
        }
        CFRelease(v11);
        if (v6) {
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    id v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[MFAttachment _fileUTTypeForFileName:](self);
    }
  }
  CFStringRef v13 = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], v8, 0);
  if (!v13)
  {
LABEL_18:
    int v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412802;
      id v21 = a3;
      __int16 v22 = 2112;
      p_isa = &v9->isa;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_error_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_ERROR, "#Attachments UTType for filename:[%@] extension:[%@] mimeType:[%@] indeterminate", (uint8_t *)&v20, 0x20u);
    }
    -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", [MEMORY[0x1E4F1CA98] null], @"MFAttachmentUTTypeKey");
    uint64_t v6 = 0;
    goto LABEL_21;
  }
  v14 = (__CFString *)v13;
  if (UTTypeIsDynamic(v13))
  {
    CFRelease(v14);
    goto LABEL_18;
  }
  [(MFAttachment *)self setMetadataValue:v14 forKey:@"MFAttachmentUTTypeKey"];
  uint64_t v6 = v14;
  id v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = [(MFAttachment *)self fileName];
    int v20 = 138413058;
    id v21 = v6;
    __int16 v22 = 2112;
    p_isa = v19;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_1CFCFE000, v17, OS_LOG_TYPE_DEBUG, "UTType [%@] for filename:[%@] extension:[%@] via mimeType:[%@]", (uint8_t *)&v20, 0x2Au);
  }
  CFRelease(v14);
  if (!v6) {
    goto LABEL_18;
  }
LABEL_21:
  if (v6 == (__CFString *)[MEMORY[0x1E4F1CA98] null]) {
    return 0;
  }
  else {
    return v6;
  }
}

- (NSString)fileUTType
{
  BOOL v3 = [(MFAttachment *)self fileName];
  return (NSString *)[(MFAttachment *)self _fileUTTypeForFileName:v3];
}

- (id)attachmentContentTypeForFileName:(id)a3
{
  id result = [(MFAttachment *)self _fileUTTypeForFileName:a3];
  if (!result) {
    return (id)*MEMORY[0x1E4F22608];
  }
  return result;
}

- (NSString)contentID
{
  return (NSString *)[(MFAttachmentManager *)self->_attachmentManager _contentIDForAttachment:self];
}

- (void)setContentID:(id)a3
{
}

- (NSString)mimeType
{
  BOOL v3 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentMimetypeKey"];
  if (objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", @"MFAttachmentIsPlaceholder"), "BOOLValue"))
  {
    id v4 = [(MFAttachmentPlaceholder *)[(MFAttachment *)self placeholder] mimeType];
    if (v4) {
      return v4;
    }
  }
  return v3;
}

- (void)setMimeType:(id)a3
{
}

- (unint64_t)decodedFileSize
{
  unint64_t v3 = objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", @"MFAttachmentDecodedFileSizeKey"), "unsignedIntegerValue");
  if (objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", @"MFAttachmentIsPlaceholder"), "BOOLValue"))
  {
    unint64_t v4 = [(MFAttachmentPlaceholder *)[(MFAttachment *)self placeholder] fileSize];
    if (v4) {
      return v4;
    }
  }
  return v3;
}

- (void)setDecodedFileSize:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(MFAttachment *)self setMetadataValue:v4 forKey:@"MFAttachmentDecodedFileSizeKey"];
}

- (unint64_t)encodedFileSize
{
  unint64_t v3 = objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", @"MFAttachmentEncodedFileSizeKey"), "unsignedIntegerValue");
  if (objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", @"MFAttachmentIsPlaceholder"), "BOOLValue"))
  {
    unint64_t v4 = [(MFAttachmentPlaceholder *)[(MFAttachment *)self placeholder] fileSize];
    if (v4) {
      return v4;
    }
  }
  return v3;
}

- (void)setEncodedFileSize:(unint64_t)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"), @"MFAttachmentEncodedFileSizeKey");
  id v5 = [(MFAttachment *)self downloadProgress];
  [(NSProgress *)v5 setTotalUnitCount:a3];
}

- (BOOL)isCached
{
  unint64_t v3 = [(MFAttachment *)self sizeOnDisk];
  unint64_t v4 = [(MFAttachment *)self decodedFileSize];
  unint64_t v5 = [(MFAttachment *)self encodedFileSize];
  if (v3) {
    BOOL v6 = v3 >= v4;
  }
  else {
    BOOL v6 = 0;
  }
  return v6 && v3 <= v5;
}

- (id)fileAttributes
{
  unint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  unint64_t v4 = (void *)[(MFMimePart *)[(MFAttachment *)self part] bodyParameterForKey:@"x-unix-mode"];
  if (v4)
  {
    unint64_t v5 = strtoul((const char *)objc_msgSend(v4, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v5)
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:v5];
      [v3 setObject:v6 forKey:*MEMORY[0x1E4F28330]];
    }
  }
  return v3;
}

- (unint64_t)sizeOnDisk
{
  uint64_t v5 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", -[MFAttachment path](self, "path"), &v5);
  unint64_t v3 = 0;
  if (!v5) {
    return objc_msgSend((id)objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E4F28390]), "unsignedIntegerValue");
  }
  return v3;
}

- (void)writeToDiskWithData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MFAttachment *)self path];
  if (a3 && v5)
  {
    uint64_t v6 = (void *)[(NSString *)[(MFAttachment *)self path] copy];
    uint64_t v7 = [v6 stringByDeletingLastPathComponent];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      id v20 = 0;
      if ([v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v20])
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[MFAttachment fileAttributes](self, "fileAttributes"));
        [v10 setObject:*MEMORY[0x1E4F28348] forKey:*MEMORY[0x1E4F28370]];
        if ([v9 createFileAtPath:v6 contents:a3 attributes:v10]) {
          goto LABEL_9;
        }
        CFDataRef v11 = MFLogGeneral();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_9;
        }
        id v12 = [(MFAttachment *)self fileURL];
        uint64_t v13 = objc_msgSend(v20, "ef_publicDescription");
        *(_DWORD *)buf = 138413058;
        uint64_t v22 = (uint64_t)v6;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v12;
        __int16 v27 = 2114;
        uint64_t v28 = v13;
        v14 = "#Attachments Failed to create path %@ for attachment [%p, %@]: %{public}@";
        int v15 = v11;
        uint32_t v16 = 42;
        goto LABEL_12;
      }
      id v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [(MFAttachment *)self fileURL];
        uint64_t v19 = objc_msgSend(v20, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        __int16 v24 = v18;
        __int16 v25 = 2114;
        uint64_t v26 = v19;
        v14 = "#Attachments Failed to create directory %@ for attachment [%@]: %{public}@";
        int v15 = v17;
        uint32_t v16 = 32;
LABEL_12:
        _os_log_error_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
LABEL_9:
  }
}

- (id)readFromDisk
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (![(MFAttachment *)self path] || [(MFAttachment *)self isContainedInRFC822]) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isReadableFileAtPath:", objc_msgSend(-[MFAttachment fileURL](self, "fileURL"), "path")))
  {
    uint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v7 = 138412290;
      *(void *)&v7[4] = [(MFAttachment *)self fileURL];
      _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "#Attachments Unable to read file URL [%@]", v7, 0xCu);
    }
    return 0;
  }
  *(void *)uint64_t v7 = 0;
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:options:error:", -[MFAttachment fileURL](self, "fileURL"), 3, v7);
  if (*(void *)v7)
  {
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(MFAttachment *)self readFromDisk];
    }
  }
  return v3;
}

- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4
{
  if (!a4) {
    return 0;
  }
  if (!strcmp("text/html", (const char *)[a4 UTF8String]))
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFAllocatorRef v9 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorSetDefault(v9);
    CFStringRef v10 = CFStringCreateWithBytes(v9, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x8000100u, 0);
    CFAllocatorSetDefault(Default);
    if (v10)
    {
      CFRelease(v10);
      return @"UTF-8";
    }
    return 0;
  }
  if (![a4 hasPrefix:@"text/"]) {
    return 0;
  }
  id result = [(MFAttachment *)self textEncodingGuessWithData:a3];
  if (!result) {
    return @"UTF-8";
  }
  return result;
}

- (id)textEncodingGuessWithData:(id)a3
{
  CFStringRef v5 = [(MFAttachment *)self metadataValueForKey:@"_MFAttachmentEncodingKey"];
  CFStringRef v6 = v5;
  if (a3 && !v5)
  {
    [a3 bytes];
    [a3 length];
    CFStringEncoding v7 = MFGuessEncodingForBytes();
    if (v7 == -1)
    {
      return 0;
    }
    else
    {
      CFStringRef v6 = CFStringConvertEncodingToIANACharSetName(v7);
      [(MFAttachment *)self setMetadataValue:v6 forKey:@"_MFAttachmentEncodingKey"];
    }
  }
  return (id)v6;
}

- (BOOL)conformsToType:(id)a3
{
  CFStringRef v4 = [(MFAttachment *)self fileUTType];
  if (v4) {
    LOBYTE(v4) = UTTypeConformsTo(v4, (CFStringRef)a3) != 0;
  }
  return (char)v4;
}

- (BOOL)contentTypeConformsToVCard
{
  CFStringRef v2 = [(MFAttachment *)self fileUTType];
  if (v2) {
    LOBYTE(v2) = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22718]) != 0;
  }
  return (char)v2;
}

- (BOOL)contentTypeConformsToEvent
{
  if ([(MFAttachment *)self contentTypeConformsToEventICS]
    || (BOOL v3 = [(MFAttachment *)self contentTypeConformsToEventVCS]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToEventVCS
{
  return [(MFAttachment *)self conformsToType:@"com.apple.ical.vcs"];
}

- (BOOL)contentTypeConformsToEventICS
{
  return [(MFAttachment *)self conformsToType:@"com.apple.ical.ics"];
}

- (BOOL)contentTypeConformsToProvisionment
{
  CFStringRef v2 = [(MFAttachment *)self fileUTType];
  if (UTTypeConformsTo(v2, @"com.apple.mobileconfig")
    || UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22670])
    || UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22738])
    || (int v3 = UTTypeConformsTo(v2, @"com.apple.mobileprovision")) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToMarkup
{
  CFStringRef v2 = [(MFAttachment *)self fileUTType];
  if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F225F8])
    || (int v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22668])) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToPassbook
{
  CFStringRef v2 = [(MFAttachment *)self fileUTType];
  if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F224D0])
    || (int v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F224C8])) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToIWork
{
  CFStringRef v2 = [(MFAttachment *)self fileUTType];
  return [(NSString *)v2 hasPrefix:@"com.apple.iwork"];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (MFMimePart)part
{
  return self->_part;
}

- (void)setPart:(id)a3
{
}

- (NSString)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(id)a3
{
}

- (BOOL)isAutoArchive
{
  return self->_isAutoArchive;
}

- (void)setPlaceholder:(id)a3
{
}

- (void)setDownloadProgress:(id)a3
{
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
}

- (MFDataConsumer)customConsumer
{
  return self->_customConsumer;
}

- (void)setCustomConsumer:(id)a3
{
}

- (BOOL)wantsCompletionBlockOffMainThread
{
  return self->_wantsCompletionBlockOffMainThread;
}

- (void)setWantsCompletionBlockOffMainThread:(BOOL)a3
{
  self->_wantsCompletionBlockOffMainThread = a3;
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
  self->_attachmentManager = (MFAttachmentManager *)a3;
}

- (unint64_t)lastProgressBytes
{
  return self->_lastProgressBytes;
}

- (void)setLastProgressBytes:(unint64_t)a3
{
  self->_lastProgressBytes = a3;
}

- (double)lastProgressTime
{
  return self->_lastProgressTime;
}

- (void)setLastProgressTime:(double)a3
{
  self->_lastProgressTime = a3;
}

- (void)fetchLocalData:(void *)a1 stripPrivateMetadata:.cold.1(void *a1)
{
  [a1 fileURL];
  OUTLINED_FUNCTION_2_0(&dword_1CFCFE000, v1, v2, "#Attachments Failed to fetch data for attachment [%@]", v3, v4, v5, v6, 2u);
}

- (void)fetchDataSynchronously:(void *)a1 stripPrivateMetadata:(id *)a2 .cold.1(void *a1, id *a2)
{
  [a1 fileURL];
  objc_msgSend(*a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CFCFE000, v3, v4, "#Attachments Failed to fetch data for attachment [%@] due to %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchDataSynchronously:(os_log_t)log stripPrivateMetadata:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_DEBUG, "FIXME: calls that come from the main thread should use fetchLocalData", v1, 2u);
}

- (void)fetchPlaceholderData
{
  [a1 fileURL];
  OUTLINED_FUNCTION_2_0(&dword_1CFCFE000, v1, v2, "#Attachments Failed to fetch candidate placeholder contents for attachment [%@]", v3, v4, v5, v6, 2u);
}

- (void)_dataProvider
{
  [a1 fileURL];
  objc_msgSend(*a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CFCFE000, v3, v4, "#Attachments Unable to obtain data provider for attachemnt [%@] due to %{public}@", v5, v6, v7, v8, v9);
}

- (void)_fileUTTypeForFileName:(void *)a1 .cold.1(void *a1)
{
  [a1 fileName];
  OUTLINED_FUNCTION_3_0(&dword_1CFCFE000, v1, v2, "UTType [%@] for filename:[%@] could not derive extension", v3, v4, v5, v6, 2u);
}

- (void)_fileUTTypeForFileName:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  [a2 fileName];
  OUTLINED_FUNCTION_3_0(&dword_1CFCFE000, v2, v3, "UTType [%@] for filename:[%@] via cache", v4, v5, v6, v7, 2u);
}

- (void)readFromDisk
{
  [a1 fileURL];
  objc_msgSend(*a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CFCFE000, v3, v4, "#Attachments Unable to read file URL [%@] due to error: %{public}@", v5, v6, v7, v8, v9);
}

@end