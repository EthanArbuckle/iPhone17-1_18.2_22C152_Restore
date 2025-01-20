@interface MFAttachment
+ (BOOL)isSinglePagePDF:(id)a3;
+ (id)fileTypeForFilename:(id)a3 mimeType:(id)a4;
- (BOOL)_isSinglePagePDFFileFetchLocalData:(BOOL)a3;
- (BOOL)conformsToType:(id)a3;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)contentTypeConformsToEvent;
- (BOOL)contentTypeConformsToEventICS;
- (BOOL)contentTypeConformsToEventVCS;
- (BOOL)contentTypeConformsToIWork;
- (BOOL)contentTypeConformsToMarkup;
- (BOOL)contentTypeConformsToPassbook;
- (BOOL)contentTypeConformsToProvisionment;
- (BOOL)contentTypeConformsToVCard;
- (BOOL)hasCalendarMetadata;
- (BOOL)isAutoArchive;
- (BOOL)isAvailable;
- (BOOL)isCached;
- (BOOL)isCalendarFile;
- (BOOL)isContainedInCompose;
- (BOOL)isContainedInRFC822;
- (BOOL)isDataAvailableLocally;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageFile;
- (BOOL)isMailDrop;
- (BOOL)isMailDropPhotoArchive;
- (BOOL)isMediaFile;
- (BOOL)isPDFFile;
- (BOOL)isPlaceholder;
- (BOOL)isRFC822;
- (BOOL)isSinglePagePDFFile;
- (BOOL)isVideoFile;
- (BOOL)shouldAutoDownload;
- (BOOL)shouldPreserveFidelity;
- (BOOL)wantsCompletionBlockOffMainThread;
- (CGSize)imageDimensions;
- (EMMailDropMetadata)mailDropMetadata;
- (MFAttachment)initWithURL:(id)a3 attachmentManager:(id)a4;
- (MFAttachmentPlaceholder)placeholder;
- (MFDataConsumer)customConsumer;
- (MFMimePart)part;
- (NSItemProvider)attachmentDataProvider;
- (NSNumber)fileHasSynapseAttributes;
- (NSString)contentID;
- (NSString)disposition;
- (NSString)ef_publicDescription;
- (NSString)eventID;
- (NSString)fileName;
- (NSString)fileUTType;
- (NSString)icsRepresentation;
- (NSString)inferredMimeType;
- (NSString)meetingStorePersistentID;
- (NSString)mimePartNumber;
- (NSString)mimeType;
- (NSString)path;
- (NSString)remoteImageFileName;
- (NSURL)url;
- (id)_dataProvider;
- (id)_fileUTTypeForFileName:(id)a3;
- (id)attachmentContentTypeForFileName:(id)a3;
- (id)decodeFilterWithDataConsumer:(id)a3;
- (id)fetchCompletionBlock;
- (id)fetchData;
- (id)fetchDataSynchronously:(id *)a3;
- (id)fetchDataSynchronously:(id *)a3 stripPrivateMetadata:(BOOL)a4;
- (id)fetchDataToURL:(id *)a3;
- (id)fetchLocalData;
- (id)fetchLocalData:(id *)a3 stripPrivateMetadata:(BOOL)a4;
- (id)fetchPlaceholderData;
- (id)fileAttributes;
- (id)fileNameByStrippingZipIfNeeded:(BOOL)a3;
- (id)fileURL;
- (id)fileWrapperUsingFetchedLocalData;
- (id)filterData:(id)a3;
- (id)filterICSData:(id)a3;
- (id)filterVCSData:(id)a3;
- (id)metadataValueForKey:(id)a3;
- (id)newDownloadProgress;
- (id)readFromDisk;
- (id)textEncodingGuessWithData:(id)a3;
- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4;
- (unint64_t)decodedFileSize;
- (unint64_t)encodedFileSize;
- (unint64_t)hash;
- (unint64_t)sizeOnDisk;
- (void)_dataProvider;
- (void)fetchPlaceholderData;
- (void)readFromDisk;
- (void)setAttachmentDataProvider:(id)a3;
- (void)setContentID:(id)a3;
- (void)setCustomConsumer:(id)a3;
- (void)setDecodedFileSize:(unint64_t)a3;
- (void)setDisposition:(id)a3;
- (void)setEncodedFileSize:(unint64_t)a3;
- (void)setEventID:(id)a3;
- (void)setFetchCompletionBlock:(id)a3;
- (void)setFileHasSynapseAttributes:(id)a3;
- (void)setFileName:(id)a3;
- (void)setIcsRepresentation:(id)a3;
- (void)setImageDimensions:(CGSize)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setMailDropMetadata:(id)a3;
- (void)setMeetingStorePersistentID:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setMimePartNumber:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setPart:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRemoteImageFileName:(id)a3;
- (void)setShouldPreserveFidelity:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setWantsCompletionBlockOffMainThread:(BOOL)a3;
- (void)updatePath;
- (void)updatePathIfNeeded;
@end

@implementation MFAttachment

- (BOOL)isContainedInRFC822
{
  v3 = [(MFAttachment *)self _dataProvider];
  v4 = [v3 messageForAttachment:self];

  v5 = [v4 messageURL];
  v6 = [v5 scheme];
  char v7 = [v6 isEqualToString:@"x-attach-RFC822"];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = [(MFAttachment *)self part];
    v10 = [v9 parentPart];

    BOOL v8 = v10 != 0;
    if (v10)
    {
      while (1)
      {
        v11 = [v10 type];
        v12 = [v10 subtype];
        v13 = [NSString stringWithFormat:@"%@/%@", v11, v12];
        v14 = v13;
        if (v11)
        {
          if (![v13 caseInsensitiveCompare:@"message/rfc822"]
            || ![v14 caseInsensitiveCompare:@"message/delivery-status"])
          {
            break;
          }
        }
        v15 = [v10 parentPart];

        BOOL v8 = v15 != 0;
        v10 = v15;
        if (!v15) {
          goto LABEL_11;
        }
      }
    }
    v15 = v10;
LABEL_11:
  }
  return v8;
}

- (id)_dataProvider
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(MFAttachment *)self url];

  if (v3)
  {
    attachmentManager = self->_attachmentManager;
    v5 = [(MFAttachment *)self url];
    v9[0] = 0;
    v3 = [(MFAttachmentManager *)attachmentManager _dataProviderForAttachmentURL:v5 error:v9];
    id v6 = v9[0];

    if (v6)
    {
      char v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        [(MFAttachment *)self fileURL];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment _dataProvider]();
      }
    }
  }
  return v3;
}

- (id)metadataValueForKey:(id)a3
{
  v3 = [(MFAttachmentManager *)self->_attachmentManager metadataForAttachment:self forKey:a3];
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)fileName
{
  return (NSString *)[(MFAttachment *)self fileNameByStrippingZipIfNeeded:0];
}

- (id)fileNameByStrippingZipIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentFileNameKey"];
  v5 = v4;
  if (v3)
  {
    id v6 = [v4 pathExtension];
    uint64_t v7 = [v6 caseInsensitiveCompare:@"zip"];

    if (!v7)
    {
      uint64_t v8 = [v5 stringByDeletingPathExtension];

      v5 = (void *)v8;
    }
  }
  return v5;
}

- (NSString)mimeType
{
  BOOL v3 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentMimetypeKey"];
  v4 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentIsPlaceholder"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = [(MFAttachment *)self placeholder];
    uint64_t v7 = [v6 mimeType];
    uint64_t v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = v3;
    }
    id v10 = v9;

    BOOL v3 = v10;
  }
  return (NSString *)v3;
}

- (void)setPart:(id)a3
{
}

- (void)setMimeType:(id)a3
{
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
}

- (void)setEncodedFileSize:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
}

- (void)setDisposition:(id)a3
{
}

- (NSString)path
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"MFAttachmentPathKey"];
}

- (MFMimePart)part
{
  return self->_part;
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (EMMailDropMetadata)mailDropMetadata
{
  return (EMMailDropMetadata *)[(MFAttachment *)self metadataValueForKey:@"MFAttachmentMailDropMetaData"];
}

- (BOOL)isMailDrop
{
  BOOL v3 = [(NSURL *)self->_url scheme];
  if ([v3 isEqualToString:@"x-attach-maildrop"])
  {
    BOOL v4 = 1;
LABEL_6:

    return v4;
  }
  int v5 = [(NSURL *)self->_url scheme];
  char v6 = [v5 isEqualToString:@"x-attach-maildrop-image"];

  if ((v6 & 1) == 0)
  {
    BOOL v3 = [(MFAttachment *)self mailDropMetadata];
    uint64_t v7 = [v3 directUrl];
    BOOL v4 = v7 != 0;

    goto LABEL_6;
  }
  return 1;
}

- (BOOL)isDataAvailableLocally
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MFAttachment *)self isContainedInRFC822]
    || [(MFAttachment *)self isContainedInCompose])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v4 = [(MFAttachment *)self fileURL];
    if (v4)
    {
      int v5 = +[MFAttachmentDataProvider dataProviderWithURL:v4];
      int v3 = [v5 exists];
    }
    else
    {
      int v3 = 0;
    }
    char v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(MFAttachment *)self mimePartNumber];
      v9 = [(MFAttachment *)self fileURL];
      int v10 = 138543874;
      v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      __int16 v14 = 1024;
      int v15 = v3;
      _os_log_debug_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEBUG, "#Attachments Attachment '%{public}@' '%{public}@' has data available locally: %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
    }
  }
  return v3;
}

- (BOOL)isContainedInCompose
{
  v2 = [(NSURL *)self->_url scheme];
  char v3 = [v2 isEqualToString:@"x-attach-compose"];

  return v3;
}

- (MFAttachment)initWithURL:(id)a3 attachmentManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFAttachment;
  v9 = [(MFAttachment *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_attachmentManager, a4);
  }

  return v10;
}

- (NSString)fileUTType
{
  char v3 = [(MFAttachment *)self fileName];
  BOOL v4 = [(MFAttachment *)self _fileUTTypeForFileName:v3];

  return (NSString *)v4;
}

- (id)fileURL
{
  char v3 = [(MFAttachment *)self path];

  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CB10];
    int v5 = [(MFAttachment *)self path];
    char v3 = [v4 fileURLWithPath:v5 isDirectory:0];
  }
  return v3;
}

- (NSString)ef_publicDescription
{
  char v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  int v5 = NSString;
  uint64_t v6 = objc_opt_class();
  if (v4)
  {
    id v7 = [(MFAttachment *)self url];
    id v8 = [(MFAttachment *)self path];
    v9 = [(MFAttachment *)self contentID];
    int v10 = [(MFAttachment *)self mimeType];
    v11 = [(MFAttachment *)self part];
    objc_super v12 = [v5 stringWithFormat:@"<%@: %p> url=%@, path=%@, contentID=%@, mimeType=%@, mimePart=%@, isMailDrop=%d", v6, self, v7, v8, v9, v10, v11, -[MFAttachment isMailDrop](self, "isMailDrop")];
  }
  else
  {
    id v7 = [(MFAttachment *)self contentID];
    id v8 = [(MFAttachment *)self mimeType];
    v9 = [(MFAttachment *)self disposition];
    BOOL v13 = [(MFAttachment *)self isMailDrop];
    int v10 = [(MFAttachment *)self path];
    if (v10) {
      __int16 v14 = @"Has path";
    }
    else {
      __int16 v14 = @"Does not have path";
    }
    objc_super v12 = [v5 stringWithFormat:@"<%@: %p> contentID=%@, mimeType=%@, disposition=%@, isMailDrop=%d %@", v6, self, v7, v8, v9, v13, v14];
  }

  return (NSString *)v12;
}

- (NSString)disposition
{
  return self->_disposition;
}

- (NSString)contentID
{
  return (NSString *)[(MFAttachmentManager *)self->_attachmentManager _contentIDForAttachment:self];
}

- (id)_fileUTTypeForFileName:(id)a3
{
  id v4 = a3;
  int v5 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentUTTypeKey"];
  if (!v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(MFAttachment *)self mimeType];
    id v8 = [v6 fileTypeForFilename:v4 mimeType:v7];

    int v5 = [v8 identifier];
    if (v5)
    {
      [(MFAttachment *)self setMetadataValue:v5 forKey:@"MFAttachmentUTTypeKey"];
    }
    else if ([v4 length])
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [(MFAttachment *)self setMetadataValue:v9 forKey:@"MFAttachmentUTTypeKey"];
    }
  }
  int v10 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v10)
  {

    int v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHasSynapseAttributes, 0);
  objc_storeStrong((id *)&self->_customConsumer, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_attachmentDataProvider, 0);
  objc_storeStrong((id *)&self->_disposition, 0);
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
  objc_storeStrong((id *)&self->_part, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MFAttachment *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      uint64_t v6 = [(MFAttachment *)self contentID];
      id v7 = [(MFAttachment *)v5 contentID];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MFAttachment *)self contentID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)decodeFilterWithDataConsumer:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(MFAttachment *)self part];
  id v7 = [v6 contentTransferEncoding];

  BOOL v8 = [(MFAttachment *)self isMailDrop];
  if (v8)
  {
    unint64_t v3 = [(MFAttachment *)self part];
    if (!v3) {
      goto LABEL_13;
    }
  }
  int v9 = [v7 isEqualToString:@"binary"];
  char v10 = v9;
  if (v8)
  {

    if ((v10 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_13:
    id v11 = [MEMORY[0x1E4F73498] filterWithConsumer:v5];
    objc_super v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = [(MFAttachment *)self isDataAvailableLocally];
      BOOL v17 = [(MFAttachment *)self isContainedInRFC822];
      BOOL v18 = [(MFAttachment *)self isMailDrop];
      v19 = [(MFAttachment *)self part];
      int v25 = 138413570;
      v26 = self;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = v16;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v17;
      __int16 v29 = 1024;
      BOOL v30 = v18;
      __int16 v31 = 2048;
      v32 = v19;
      __int16 v33 = 2114;
      v34 = v7;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "#Attachments %@ performing no conversion (isDataAvailableLocally=%d, isContainedInRFC822=%d, isMailDrop=%d, part=%p, contentTransferEncoding=%{public}@)", (uint8_t *)&v25, 0x32u);
    }
    goto LABEL_15;
  }
  if (v9) {
    goto LABEL_13;
  }
LABEL_5:
  if (!v7
    || ([v7 isEqualToString:@"7bit"] & 1) != 0
    || [v7 isEqualToString:@"8bit"])
  {
    id v11 = [MEMORY[0x1E4F734E0] filterWithConsumer:v5];
    objc_super v12 = MFLogGeneral();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v25 = 138412546;
    v26 = self;
    __int16 v27 = 2114;
    *(void *)v28 = v7;
    BOOL v13 = "#Attachments %@ stripping line endings (contentTransferEncoding=%{public}@)";
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"quoted-printable"])
  {
    objc_super v12 = [MEMORY[0x1E4F73568] filterWithConsumer:v5];
    v21 = [MEMORY[0x1E4F734E0] filterWithConsumer:v12];
    v22 = [(MFAttachment *)self part];
    v23 = [v22 type];
    -[NSObject setForTextPart:](v12, "setForTextPart:", [v23 isEqualToString:@"text"]);

    id v11 = v21;
    v24 = MFLogGeneral();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "#Attachments %@ quoted-printable", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_15;
  }
  if ([v7 isEqualToString:@"base64"])
  {
    id v11 = [MEMORY[0x1E4F73488] filterWithConsumer:v5];
    objc_super v12 = MFLogGeneral();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v25 = 138412290;
    v26 = self;
    BOOL v13 = "#Attachments %@ base64";
    goto LABEL_28;
  }
  if ([v7 isEqualToString:@"x-uuencode"])
  {
    id v11 = [MEMORY[0x1E4F73590] filterWithConsumer:v5];
    objc_super v12 = MFLogGeneral();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v25 = 138412290;
    v26 = self;
    BOOL v13 = "#Attachments %@ uuencode";
LABEL_28:
    __int16 v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_11;
  }
  id v11 = [MEMORY[0x1E4F73498] filterWithConsumer:v5];
  objc_super v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412546;
    v26 = self;
    __int16 v27 = 2114;
    *(void *)v28 = v7;
    BOOL v13 = "#Attachments %@ unknown encoding (contentTransferEncoding=%{public}@)";
LABEL_10:
    __int16 v14 = v12;
    uint32_t v15 = 22;
LABEL_11:
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v25, v15);
  }
LABEL_15:

  return v11;
}

- (id)fetchData
{
  return [(MFAttachmentManager *)self->_attachmentManager fetchDataForAttachment:self];
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
    if (!self->_attachmentManager)
    {
      uint64_t v6 = +[MFAttachmentManager defaultManager];
      attachmentManager = self->_attachmentManager;
      self->_attachmentManager = v6;
    }
    BOOL v8 = [MEMORY[0x1E4F60E18] promise];
    id v9 = objc_alloc_init(MEMORY[0x1E4F734A8]);
    char v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    id v11 = [(MFAttachment *)self _dataProvider];
    objc_super v12 = EFPromiseAttachmentDataHandler(v8, v9);
    [v11 fetchDataForAttachment:self consumer:v9 progress:v10 completion:v12];

    BOOL v13 = [v8 future];
    uint64_t v14 = [v13 result:0];

    uint32_t v15 = (void *)v14;
  }
  else
  {
    uint32_t v15 = [(MFAttachment *)self readFromDisk];
  }
  if ([v15 length])
  {
    if (v4 && [(MFAttachment *)self isImageFile])
    {
      uint64_t v16 = _stripPrivateFileMetadata(v15);

      uint32_t v15 = (void *)v16;
    }
    uint64_t v17 = [(MFAttachment *)self filterData:v15];

    uint32_t v15 = (void *)v17;
  }
  else
  {
    BOOL v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [(MFAttachment *)self fileURL];
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment fetchLocalData:stripPrivateMetadata:]();
    }
  }
  return v15;
}

- (id)fetchDataSynchronously:(id *)a3
{
  return [(MFAttachment *)self fetchDataSynchronously:a3 stripPrivateMetadata:0];
}

- (id)fetchDataSynchronously:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  BOOL v4 = a4;
  v25[4] = *(id *)MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F29060] isMainThread] || (EFIsRunningUnitTests() & 1) != 0)
  {
    id v11 = [MEMORY[0x1E4F60E18] promise];
    objc_super v12 = [(MFAttachment *)self fetchCompletionBlock];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke;
    v22[3] = &unk_1E5D3DBE0;
    id v13 = v12;
    id v24 = v13;
    v22[4] = self;
    id v14 = v11;
    id v23 = v14;
    [(MFAttachment *)self setFetchCompletionBlock:v22];
    [(MFAttachmentManager *)self->_attachmentManager fetchDataSynchronouslyForAttachment:self];
    uint32_t v15 = [v14 future];
    id v21 = 0;
    uint64_t v16 = [v15 result:&v21];
    id v9 = v21;

    char v10 = v16;
  }
  else
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:](v7);
    }

    v25[0] = 0;
    uint64_t v8 = [(MFAttachment *)self fetchLocalData:v25 stripPrivateMetadata:0];
    id v9 = v25[0];
    char v10 = v8;
  }
  if (![v10 length])
  {
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      [(MFAttachment *)self fileURL];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:]();
    }
    goto LABEL_17;
  }
  if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:v10])
  {
    uint64_t v17 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v10];
    if (v17)
    {
      uint64_t v18 = +[MFAttachmentPlaceholder dataForPlaceholder:v17];

      char v10 = v18;
      [(MFAttachment *)self setPlaceholder:v17];
    }
  }
  if (v4 && [(MFAttachment *)self isImageFile])
  {
    _stripPrivateFileMetadata(v10);
    char v10 = v19 = v10;
LABEL_17:
  }
  if (a3) {
    *a3 = v9;
  }

  return v10;
}

void __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
  if (v7)
  {
    uint64_t v10 = [*(id *)(a1 + 32) filterData:v7];

    id v7 = (id)v10;
  }
  [*(id *)(a1 + 40) finishWithResult:v7 error:v8];
}

- (id)fetchDataToURL:(id *)a3
{
  v12[6] = *(id *)MEMORY[0x1E4F143B8];
  if ([(MFAttachment *)self isPlaceholder])
  {
    BOOL v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [(MFAttachment *)self fileName];
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment fetchDataToURL:]();
    }

    id v5 = [(MFAttachment *)self placeholder];
    uint64_t v6 = [v5 fileURL];
  }
  else
  {
    v12[0] = 0;
    id v7 = [(MFAttachment *)self fetchDataSynchronously:v12];
    id v5 = v12[0];
    if (v7)
    {
      id v8 = [(MFAttachment *)self fileName];
      uint64_t v9 = +[MFAttachmentUtilities writeData:v7 toTemporaryFileURLWithFileName:v8];

      if (v9)
      {
        uint64_t v9 = v9;
        uint64_t v6 = v9;
      }
      else
      {
        uint64_t v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          [v7 length];
          [(MFAttachment *)self fileName];
          objc_claimAutoreleasedReturnValue();
          -[MFAttachment fetchDataToURL:]();
        }

        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        [(MFAttachment *)self fileName];
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment fetchDataToURL:]();
      }
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)fileWrapperUsingFetchedLocalData
{
  id v3 = objc_alloc(MEMORY[0x1E4F28CF0]);
  BOOL v4 = [(MFAttachment *)self fetchLocalData];
  id v5 = (void *)[v3 initRegularFileWithContents:v4];

  uint64_t v6 = [(MFAttachment *)self fileName];
  [v5 setPreferredFilename:v6];

  return v5;
}

- (BOOL)isMailDropPhotoArchive
{
  if ([(MFAttachment *)self isMailDrop])
  {
    id v3 = [(MFAttachment *)self mailDropMetadata];
    unint64_t v4 = ((unint64_t)[v3 flags] >> 1) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)fetchPlaceholderData
{
  p_placeholder = &self->_placeholder;
  placeholder = self->_placeholder;
  if (placeholder)
  {
    id v5 = [(MFAttachmentPlaceholder *)placeholder serializedRepresentation];
  }
  else
  {
    uint64_t v6 = [(MFAttachment *)self _dataProvider];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(MFAttachment *)self _dataProvider];
      id v8 = [(MFAttachment *)self contentID];
      id v5 = [v7 rawDataForContentID:v8];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F734A8]);
      id v8 = objc_msgSend(MEMORY[0x1E4F73578], "rangedFilterWithConsumer:range:", v7, 0, 2100);
      uint64_t v9 = [MEMORY[0x1E4F60E18] promise];
      uint64_t v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
      id v11 = EFPromiseAttachmentDataHandler(v9, v7);
      [v6 fetchDataForAttachment:self consumer:v8 progress:v10 completion:v11];

      objc_super v12 = [v9 future];
      id v5 = [v12 result:0];
    }
    if (v5)
    {
      id v13 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v5];
      if (v13) {
        objc_storeStrong((id *)p_placeholder, v13);
      }
    }
    else
    {
      id v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [(MFAttachment *)self fileURL];
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment fetchPlaceholderData]();
      }
    }
  }
  return v5;
}

- (MFAttachmentPlaceholder)placeholder
{
  if (!self->_placeholder
    && +[MFAttachmentCapabilities placeholdersAvailable])
  {
    id v3 = [(NSURL *)self->_url scheme];
    if (([v3 isEqualToString:@"x-attach-maildrop"] & 1) == 0) {
      id v4 = [(MFAttachment *)self fetchPlaceholderData];
    }
  }
  placeholder = self->_placeholder;
  return placeholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
}

- (BOOL)isPlaceholder
{
  id v3 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentIsPlaceholder"];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    uint64_t v6 = [(MFAttachment *)self placeholder];
    char v5 = v6 != 0;
  }
  return v5;
}

- (void)setMailDropMetadata:(id)a3
{
}

- (id)newDownloadProgress
{
  unint64_t v3 = [(MFAttachment *)self encodedFileSize];
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = -1;
  }
  char v5 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v4];
  if ([(MFAttachment *)self isDataAvailableLocally]) {
    [v5 setCompletedUnitCount:v4];
  }
  return v5;
}

- (id)filterData:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v6 = [v5 BOOLForKey:@"DisableAttachmentFilters"];

  id v7 = v4;
  if ((v6 & 1) == 0)
  {
    id v7 = v4;
    if ([v4 length])
    {
      id v7 = v4;
      if ([(MFAttachment *)self contentTypeConformsToEventVCS])
      {
        id v7 = [(MFAttachment *)self filterVCSData:v4];
      }
    }
  }

  return v7;
}

- (id)filterVCSData:(id)a3
{
  id v3 = a3;
  id v4 = [@"\nVERSION:1.0" dataUsingEncoding:4];
  uint64_t v5 = objc_msgSend(v3, "rangeOfData:options:range:", v4, 0, 0, objc_msgSend(v3, "length"));
  uint64_t v7 = v6;

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (id)[v3 mutableCopy];
    [v8 replaceBytesInRange:v5 + 1, v7 - 1, objc_msgSend(@"VERSION:2.0", "UTF8String"), objc_msgSend(@"VERSION:2.0", "length") withBytes length];
    if (v8)
    {
      id v8 = v8;

      id v3 = v8;
    }
  }

  return v3;
}

- (id)filterICSData:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)isAvailable
{
  if (![(MFAttachment *)self isMailDrop]) {
    return 1;
  }
  id v3 = [(MFAttachment *)self mailDropMetadata];
  if (v3)
  {
    id v4 = [(MFAttachment *)self mailDropMetadata];
    char v5 = [v4 isInvalid];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 0;
  }

  uint64_t v7 = [(MFAttachment *)self mailDropMetadata];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(MFAttachment *)self mailDropMetadata];
    if ([v9 isExpired])
    {
      BOOL v10 = [(MFAttachment *)self isCached];

      return v10 & v6;
    }
    else
    {
    }
  }
  return v6;
}

- (BOOL)isCalendarFile
{
  v2 = [(MFAttachment *)self mimeType];
  char v3 = [v2 isEqualToString:@"text/calendar"];

  return v3;
}

- (NSString)eventID
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"_MFEventUniqueID"];
}

- (void)setEventID:(id)a3
{
}

- (NSString)meetingStorePersistentID
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"_MFMeetingStorePersistentID"];
}

- (void)setMeetingStorePersistentID:(id)a3
{
}

- (NSString)icsRepresentation
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"_MFICSRepresentation"];
}

- (void)setIcsRepresentation:(id)a3
{
}

- (BOOL)hasCalendarMetadata
{
  char v3 = [(MFAttachment *)self icsRepresentation];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(MFAttachment *)self eventID];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      char v6 = [(MFAttachment *)self meetingStorePersistentID];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (BOOL)shouldAutoDownload
{
  if ([(MFAttachment *)self isDataAvailableLocally])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v4 = [(MFAttachment *)self _dataProvider];
    char v5 = [v4 messageForAttachment:self];

    char v6 = [v5 messageStore];
    uint64_t v7 = [v6 account];

    id v8 = [v7 fetchLimits];
    if (v8
      && ((unint64_t v9 = -[MFAttachment encodedFileSize](self, "encodedFileSize"), v9 > [v8 fetchMaxBytes])
       || v9 > +[MFAttachmentCapabilities currentDownloadLimit])|| [(MFAttachment *)self isMailDrop])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      int v3 = [v7 connectionsAreConstrained] ^ 1;
    }
  }
  return v3;
}

- (NSString)inferredMimeType
{
  v2 = NSString;
  int v3 = [(MFAttachment *)self fileName];
  BOOL v4 = objc_msgSend(v2, "mf_stringForMimeTypeFromFileName:", v3);

  return (NSString *)v4;
}

- (BOOL)isRFC822
{
  char v5 = [(MFAttachment *)self mimeType];
  if (v5)
  {
    v2 = [(MFAttachment *)self mimeType];
    if (![v2 caseInsensitiveCompare:@"message/rfc822"])
    {
      char v6 = 1;
      goto LABEL_8;
    }
    int v3 = [(MFAttachment *)self mimeType];
    if (![v3 caseInsensitiveCompare:@"message/delivery-status"])
    {
      char v6 = 1;
LABEL_6:

LABEL_8:
      goto LABEL_9;
    }
  }
  uint64_t v7 = [(MFAttachment *)self fileName];
  id v8 = [v7 pathExtension];
  unint64_t v9 = [v8 lowercaseString];
  char v6 = [v9 isEqualToString:@"eml"];

  if (v5) {
    goto LABEL_6;
  }
LABEL_9:

  return v6;
}

- (BOOL)isImageFile
{
  return [(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44400]];
}

- (BOOL)isVideoFile
{
  return [(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44448]];
}

- (BOOL)isMediaFile
{
  if ([(MFAttachment *)self isImageFile]) {
    return 1;
  }
  return [(MFAttachment *)self isVideoFile];
}

- (BOOL)isPDFFile
{
  return [(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44450]];
}

- (void)setFileName:(id)a3
{
  id v4 = a3;
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
  if (v4) {
    [(MFAttachment *)self updatePath];
  }
}

- (NSString)remoteImageFileName
{
  return (NSString *)[(MFAttachment *)self metadataValueForKey:@"MFAttachmentRemoteImageFileNameKey"];
}

- (void)setRemoteImageFileName:(id)a3
{
  id v4 = a3;
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
  if (v4) {
    [(MFAttachment *)self updatePath];
  }
}

- (void)updatePath
{
  id v3 = [(MFAttachmentManager *)self->_attachmentManager _filePathForAttachment:self];
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
}

- (void)updatePathIfNeeded
{
  id v3 = [(MFAttachment *)self path];

  if (!v3)
  {
    [(MFAttachment *)self updatePath];
  }
}

- (id)attachmentContentTypeForFileName:(id)a3
{
  id v3 = [(MFAttachment *)self _fileUTTypeForFileName:a3];
  if (!v3)
  {
    id v3 = [(id)*MEMORY[0x1E4F44408] identifier];
  }
  return v3;
}

- (void)setContentID:(id)a3
{
}

+ (BOOL)isSinglePagePDF:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  if (objc_msgSend(MEMORY[0x1E4F1CB18], "em_lockdownModeEnabled"))
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[MFAttachment isSinglePagePDF:](v4);
    }

    goto LABEL_10;
  }
  if (!v3)
  {
LABEL_10:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  char v5 = CGDataProviderCreateWithCFData(v3);
  char v6 = CGPDFDocumentCreateWithProvider(v5);
  uint64_t v7 = v6;
  if (v6)
  {
    BOOL v8 = CGPDFDocumentIsUnlocked(v6) && CGPDFDocumentGetNumberOfPages(v7) == 1 && CGPDFDocumentGetPage(v7, 1uLL) != 0;
    CGPDFDocumentRelease(v7);
  }
  else
  {
    BOOL v8 = 0;
  }
  CGDataProviderRelease(v5);
LABEL_15:

  return v8;
}

- (BOOL)_isSinglePagePDFFileFetchLocalData:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentIsSinglePagePDFKey"];
  char v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
    goto LABEL_13;
  }
  BOOL v8 = [(MFAttachment *)self isPDFFile];
  BOOL v9 = [(MFAttachment *)self isDataAvailableLocally];
  BOOL v10 = [(MFAttachment *)self disposition];
  if (!v10)
  {
    if (v8 && (v9 || v3)) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  id v11 = [(MFAttachment *)self disposition];
  if (![v11 caseInsensitiveCompare:@"attachment"])
  {

    uint64_t v7 = 0;
    goto LABEL_10;
  }

  if (!v8 || !v9 && !v3) {
    goto LABEL_8;
  }
LABEL_6:
  objc_super v12 = objc_opt_class();
  BOOL v10 = [(MFAttachment *)self fetchLocalData];
  uint64_t v7 = [v12 isSinglePagePDF:v10];
LABEL_10:

LABEL_11:
  if (v9 || !v8)
  {
    id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
    [(MFAttachment *)self setMetadataValue:v13 forKey:@"MFAttachmentIsSinglePagePDFKey"];
  }
LABEL_13:

  return v7;
}

- (BOOL)isSinglePagePDFFile
{
  return [(MFAttachment *)self _isSinglePagePDFFileFetchLocalData:0];
}

- (BOOL)shouldPreserveFidelity
{
  v2 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentPreserveFidelityKey"];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setShouldPreserveFidelity:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
}

- (unint64_t)decodedFileSize
{
  BOOL v3 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentDecodedFileSizeKey"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  char v5 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentIsPlaceholder"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = [(MFAttachment *)self placeholder];
    uint64_t v8 = [v7 fileSize];
    if (v8) {
      unint64_t v4 = v8;
    }
  }
  return v4;
}

- (void)setDecodedFileSize:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
}

- (unint64_t)encodedFileSize
{
  BOOL v3 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentEncodedFileSizeKey"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  char v5 = [(MFAttachment *)self metadataValueForKey:@"MFAttachmentIsPlaceholder"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = [(MFAttachment *)self placeholder];
    uint64_t v8 = [v7 fileSize];
    if (v8) {
      unint64_t v4 = v8;
    }
  }
  return v4;
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
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  unint64_t v4 = [(MFAttachment *)self part];
  unint64_t v5 = [v4 bodyParameterForKey:@"x-unix-mode"];

  if (v5)
  {
    unint64_t v6 = strtoul((const char *)objc_msgSend(v5, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v6];
      [v3 setObject:v7 forKey:*MEMORY[0x1E4F28330]];
    }
  }

  return v3;
}

- (unint64_t)sizeOnDisk
{
  unint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v4 = [(MFAttachment *)self path];
  id v10 = 0;
  unint64_t v5 = [v3 attributesOfItemAtPath:v4 error:&v10];
  id v6 = v10;

  if (v6)
  {
    unint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 valueForKey:*MEMORY[0x1E4F28390]];
    unint64_t v7 = [v8 unsignedIntegerValue];
  }
  return v7;
}

- (id)readFromDisk
{
  v11[4] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MFAttachment *)self path];
  if (v3 && (BOOL v4 = [(MFAttachment *)self isContainedInRFC822], v3, !v4))
  {
    id v6 = (void *)MEMORY[0x1E4F1C9B8];
    unint64_t v7 = [(MFAttachment *)self fileURL];
    v11[0] = 0;
    unint64_t v5 = [v6 dataWithContentsOfURL:v7 options:3 error:v11];
    id v8 = v11[0];

    if (!v5)
    {
      BOOL v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        [(MFAttachment *)self fileURL];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment readFromDisk]();
      }

      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  id v9 = v7;
  if (!strcmp("text/html", (const char *)[v9 UTF8String]))
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFAllocatorRef v15 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorSetDefault(v15);
    id v16 = v6;
    CFStringRef v17 = CFStringCreateWithBytes(v15, (const UInt8 *)[v16 bytes], objc_msgSend(v16, "length"), 0x8000100u, 0);
    CFAllocatorSetDefault(Default);
    if (v17)
    {
      CFRelease(v17);
      id v13 = @"UTF-8";
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (![v9 hasPrefix:@"text/"])
  {
LABEL_9:
    id v13 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = [(MFAttachment *)self textEncodingGuessWithData:v6];
  id v11 = (void *)v10;
  objc_super v12 = @"UTF-8";
  if (v10) {
    objc_super v12 = (__CFString *)v10;
  }
  id v13 = v12;

LABEL_10:
  return v13;
}

- (id)textEncodingGuessWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFAttachment *)self metadataValueForKey:@"_MFAttachmentEncodingKey"];
  id v6 = (void *)v5;
  if (v4 && !v5)
  {
    id v7 = v4;
    [v7 bytes];
    [v7 length];
    CFStringEncoding v8 = MFGuessEncodingForBytes();
    if (v8 == -1)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = CFStringConvertEncodingToIANACharSetName(v8);
      [(MFAttachment *)self setMetadataValue:v6 forKey:@"_MFAttachmentEncodingKey"];
    }
  }

  return v6;
}

- (BOOL)conformsToType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFAttachment *)self fileUTType];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F442D8];
    id v7 = [(MFAttachment *)self fileUTType];
    CFStringEncoding v8 = [v6 typeWithIdentifier:v7];

    LOBYTE(v5) = 0;
    if (v4 && v8) {
      LOBYTE(v5) = [v8 conformsToType:v4];
    }
  }
  else
  {
    CFStringEncoding v8 = 0;
  }

  return (char)v5;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  id v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a3];
  LOBYTE(self) = [(MFAttachment *)self conformsToType:v4];

  return (char)self;
}

- (BOOL)contentTypeConformsToVCard
{
  return [(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44518]];
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
  return [(MFAttachment *)self conformsToTypeIdentifier:@"com.apple.ical.vcs"];
}

- (BOOL)contentTypeConformsToEventICS
{
  return [(MFAttachment *)self conformsToTypeIdentifier:@"com.apple.ical.ics"];
}

- (BOOL)contentTypeConformsToProvisionment
{
  if ([(MFAttachment *)self conformsToTypeIdentifier:@"com.apple.mobileconfig"]
    || [(MFAttachment *)self conformsToTypeIdentifier:@"com.apple.mobileprovision"]
    || [(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44458]])
  {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F44540];
  return [(MFAttachment *)self conformsToType:v4];
}

- (BOOL)contentTypeConformsToMarkup
{
  if ([(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44400]]) {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F44450];
  return [(MFAttachment *)self conformsToType:v4];
}

- (BOOL)contentTypeConformsToPassbook
{
  if ([(MFAttachment *)self conformsToType:*MEMORY[0x1E4F44578]]) {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F44570];
  return [(MFAttachment *)self conformsToType:v4];
}

- (BOOL)contentTypeConformsToIWork
{
  v2 = [(MFAttachment *)self fileUTType];
  char v3 = [v2 hasPrefix:@"com.apple.iwork"];

  return v3;
}

- (void)setUrl:(id)a3
{
}

- (void)setMimePartNumber:(id)a3
{
}

- (BOOL)isAutoArchive
{
  return self->_isAutoArchive;
}

- (void)setPlaceholder:(id)a3
{
}

- (NSItemProvider)attachmentDataProvider
{
  return self->_attachmentDataProvider;
}

- (void)setAttachmentDataProvider:(id)a3
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

- (CGSize)imageDimensions
{
  double width = self->_imageDimensions.width;
  double height = self->_imageDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageDimensions:(CGSize)a3
{
  self->_imageDimensions = a3;
}

- (NSNumber)fileHasSynapseAttributes
{
  return self->_fileHasSynapseAttributes;
}

- (void)setFileHasSynapseAttributes:(id)a3
{
}

+ (id)fileTypeForFilename:(id)a3 mimeType:(id)a4
{
  id v13 = a1;
  id v19 = a3;
  id v17 = a4;
  swift_getObjCClassMetadata();
  unint64_t v12 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9748770) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v20 = (char *)&v10 - v12;
  id v4 = (id)MEMORY[0x1F4188790](v19);
  id v5 = v17;
  uint64_t v15 = sub_1A8A76558();
  uint64_t v18 = v6;
  uint64_t v14 = sub_1A8A76558();
  uint64_t v16 = v7;
  swift_getObjCClassMetadata();
  sub_1A8323A74(v15, v18, v14, v16, v20);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v21 = sub_1A8A75298();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v21 - 8;
  if ((*(unsigned int (**)(char *, uint64_t))(v22 + 48))(v20, 1) == 1)
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_1A8A75168();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
    id v11 = (void *)v10;
  }
  CFStringEncoding v8 = v11;
  return v8;
}

- (void)fetchLocalData:stripPrivateMetadata:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_ERROR, "#Attachments Failed to fetch data for attachment [%@]", v4, 0xCu);
}

- (void)fetchDataSynchronously:stripPrivateMetadata:.cold.1()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "#Attachments Failed to fetch data for attachment [%@] due to %{public}@", v5, v6);
}

- (void)fetchDataSynchronously:(os_log_t)log stripPrivateMetadata:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "FIXME: calls that come from the main thread should use fetchLocalData", v1, 2u);
}

- (void)fetchDataToURL:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_1(v1, v2, 7.2225e-34);
  _os_log_debug_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEBUG, "#Attachments Using placeholder file for '%{mask.hash}@'.", v4, 0x16u);
}

- (void)fetchDataToURL:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_1(v1, v2, 7.2225e-34);
  _os_log_fault_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_FAULT, "#Attachments Failed to get attachment data for '%{mask.hash}@'.", v4, 0x16u);
}

- (void)fetchDataToURL:.cold.3()
{
  OUTLINED_FUNCTION_1_5();
  *(_DWORD *)uint64_t v1 = 134218498;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2160;
  *(void *)(v1 + 14) = 1752392040;
  *(_WORD *)(v1 + 22) = 2112;
  *(void *)(v1 + 24) = v3;
  _os_log_fault_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_FAULT, "#Attachments Unable to create temp file for data (%{bytes}llu) for '%{mask.hash}@'.", v4, 0x20u);
}

- (void)fetchPlaceholderData
{
  OUTLINED_FUNCTION_1_5();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_ERROR, "#Attachments Failed to fetch candidate placeholder contents for attachment [%@]", v4, 0xCu);
}

- (void)_dataProvider
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "#Attachments Unable to obtain data provider for attachemnt [%@] due to %{public}@", v5, v6);
}

+ (void)isSinglePagePDF:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "Lockdown Mode detected, disabling PDF parsing", v1, 2u);
}

- (void)readFromDisk
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "#Attachments Unable to read file URL [%@] due to error: %{public}@", v5, v6);
}

@end