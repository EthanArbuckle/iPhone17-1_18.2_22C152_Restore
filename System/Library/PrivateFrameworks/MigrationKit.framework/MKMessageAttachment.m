@interface MKMessageAttachment
- (MKMessageAttachment)initWithID:(id)a3 contentType:(id)a4 base64Data:(id)a5;
- (NSData)data;
- (NSString)ID;
- (NSString)UUID;
- (NSString)contentType;
- (NSString)filename;
- (NSString)uniformTypeIdentifier;
- (int64_t)transferState;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
- (void)setFilename:(id)a3;
- (void)setID:(id)a3;
- (void)setTransferState:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)write;
@end

@implementation MKMessageAttachment

- (MKMessageAttachment)initWithID:(id)a3 contentType:(id)a4 base64Data:(id)a5
{
  v45[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v43.receiver = self;
  v43.super_class = (Class)MKMessageAttachment;
  v11 = [(MKMessageAttachment *)&v43 init];
  v12 = v11;
  if (v11)
  {
    [(MKMessageAttachment *)v11 setID:v8];
    [(MKMessageAttachment *)v12 setContentType:v9];
    v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];
    [(MKMessageAttachment *)v12 setData:v13];

    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [(MKMessageAttachment *)v12 setUUID:v15];

    [(MKMessageAttachment *)v12 setTransferState:5];
    v16 = [MEMORY[0x263F1D920] typeWithMIMEType:v12->_contentType];
    v17 = [v16 identifier];
    [(MKMessageAttachment *)v12 setUniformTypeIdentifier:v17];

    if (!v12->_uniformTypeIdentifier)
    {
      v33 = 0;
      goto LABEL_17;
    }
    id v36 = v10;
    v18 = [MEMORY[0x263F4A830] defaultHFSFileManager];
    v19 = [v18 pathExtensionForUTIType:v12->_uniformTypeIdentifier];

    if (![(__CFString *)v19 length])
    {
      v20 = [MEMORY[0x263F4A830] defaultHFSFileManager];
      uint64_t v21 = [v20 pathExtensionForMIMEType:v9];

      v19 = (__CFString *)v21;
    }
    id v37 = v9;
    if (![(__CFString *)v19 length])
    {

      v19 = @"bin";
    }
    id v38 = v8;
    unsigned __int8 v22 = [(NSString *)v12->_UUID hash];
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%02x", v22);
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%02d", v22 & 0xF);
    v25 = [(NSString *)v12->_UUID stringByAppendingPathExtension:v19];
    v26 = [@"/var/mobile/Library/SMS/Attachments" stringByResolvingAndStandardizingPath];
    v35 = (void *)v23;
    v45[0] = v23;
    v45[1] = v24;
    v45[2] = v25;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        uint64_t v31 = 0;
        v32 = v26;
        do
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          v26 = [v32 stringByAppendingPathComponent:*(void *)(*((void *)&v39 + 1) + 8 * v31)];

          ++v31;
          v32 = v26;
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v29);
    }

    [(MKMessageAttachment *)v12 setFilename:v26];
    id v9 = v37;
    id v8 = v38;
    id v10 = v36;
  }
  v33 = v12;
LABEL_17:

  return v33;
}

- (void)write
{
  id v4 = [MEMORY[0x263F08850] defaultManager];
  v3 = [(NSString *)self->_filename stringByDeletingLastPathComponent];
  [v4 makeDirectoriesInPath:v3 mode:448];
  [(NSData *)self->_data writeToFile:self->_filename atomically:1];
}

- (int64_t)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end