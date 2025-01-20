@interface MFDecryptedAttachmentDataProvider
- (MFDecryptedAttachmentDataProvider)initWithDecryptedMessage:(id)a3;
- (id)fetchLocalDataForAttachment:(id)a3;
- (id)messageForAttachment:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)dealloc;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation MFDecryptedAttachmentDataProvider

- (MFDecryptedAttachmentDataProvider)initWithDecryptedMessage:(id)a3
{
  v4 = [(MFDecryptedAttachmentDataProvider *)self init];
  if (v4) {
    v4->_message = (MFMailMessage *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFDecryptedAttachmentDataProvider;
  [(MFDecryptedAttachmentDataProvider *)&v3 dealloc];
}

- (id)fetchLocalDataForAttachment:(id)a3
{
  id v5 = [(MFMailMessage *)self->_message messageStore];
  objc_msgSend((id)objc_msgSend(a3, "part"), "setMimeBody:", -[MFMailMessage messageBody](self->_message, "messageBody"));
  id result = (id)[a3 readFromDisk];
  if (result)
  {
    uint64_t v7 = [a3 part];
    objc_msgSend((id)objc_msgSend(a3, "part"), "range");
    return (id)objc_msgSend(v5, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v7, 0, v8, 0, 0, 0);
  }
  return result;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  v23[3] = &unk_1E6867290;
  v23[4] = a5;
  id v11 = [(MFMailMessage *)self->_message messageStore];
  v12 = (void *)[a3 part];
  objc_msgSend(v12, "setMimeBody:", -[MFMailMessage messageBody](self->_message, "messageBody"));
  uint64_t v13 = [a3 readFromDisk];
  if (v13)
  {
    v14 = (void *)v13;
    [a4 appendData:v13];
    uint64_t v15 = [v14 length];
    [a5 setCompletedUnitCount:v15];
    [a5 setTotalUnitCount:v15];
    uint64_t v16 = 0;
    id v17 = 0;
    v18 = 0;
    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v20 = [a3 decodeFilterWithDataConsumer:a4];
    id v21 = objc_alloc(MEMORY[0x1E4F73560]);
    v26[0] = v20;
    uint64_t v19 = 1;
    id v17 = (id)objc_msgSend(v21, "initWithConsumers:expectedSize:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 1), objc_msgSend(a3, "encodedFileSize"));
    [v17 setProgressBlock:v23];
    [v12 range];
    if (objc_msgSend(v11, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v12, 0, v22, v17, 1))
    {
      v18 = 0;
      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      uint64_t v25 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error");
      v18 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1030, @"Could not retrieve decrypted data for attachment.", @"No Data Found", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1]);
      uint64_t v19 = 0;
      uint64_t v16 = 0;
    }
  }
  [v17 done];
  [a4 done];
  (*((void (**)(id, uint64_t, MFError *, uint64_t))a6 + 2))(a6, v19, v18, v16);
}

uint64_t __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setTotalUnitCount:a4];
  v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:a2];
}

- (id)messageForAttachment:(id)a3
{
  return self->_message;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id result = (id)[a4 attachmentStorageLocation];
  if (result)
  {
    v6 = objc_msgSend(result, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "part"), "partNumber"));
    uint64_t v7 = [a3 fileName];
    return (id)[v6 stringByAppendingPathComponent:v7];
  }
  return result;
}

@end