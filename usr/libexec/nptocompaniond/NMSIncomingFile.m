@interface NMSIncomingFile
- (IDSMessageContext)context;
- (NMSIncomingFile)initWithIDSURL:(id)a3 extensionOverride:(id)a4;
- (NSDictionary)metadata;
- (NSURL)URL;
- (id)description;
- (unsigned)messageID;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setMetadata:(id)a3;
- (void)setURL:(id)a3;
- (void)unlinkURL;
@end

@implementation NMSIncomingFile

- (NMSIncomingFile)initWithIDSURL:(id)a3 extensionOverride:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)NMSIncomingFile;
  v8 = [(NMSIncomingFile *)&v38 init];
  if (v8)
  {
    v9 = [[NPTOTransaction alloc] initWithDescription:@"com.apple.NanoPhotos.NanoMessagingService.NMSIncomingFile"];
    transaction = v8->_transaction;
    v8->_transaction = v9;

    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v6 fileSystemRepresentation]);
    v12 = [v11 pathExtension];
    v13 = [v11 stringByDeletingPathExtension];
    v14 = [v13 pathExtension];

    if ([v14 length] && (objc_msgSend(v14, "isEqualToString:", v12) & 1) == 0)
    {
      id v15 = v14;

      v12 = v15;
    }
    if (v7)
    {
      id v16 = v7;

      v12 = v16;
    }
    v17 = +[NSUUID UUID];
    v18 = [v17 UUIDString];
    id v19 = [v12 length];
    CFStringRef v20 = @".";
    if (!v19) {
      CFStringRef v20 = &stru_1000946D0;
    }
    v21 = +[NSString stringWithFormat:@"incoming-%@%@%@", v18, v20, v12];

    v22 = NSTemporaryDirectory();
    v23 = [v22 stringByAppendingPathComponent:v21];

    v24 = sub_10005CDAC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v23;
      __int16 v41 = 2112;
      id v42 = v11;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Copying file %@ => %@", buf, 0x16u);
    }

    v25 = copyfile_state_alloc();
    id v26 = v11;
    v27 = (const char *)[v26 fileSystemRepresentation];
    id v28 = v23;
    if (copyfile(v27, (const char *)[v28 fileSystemRepresentation], v25, 0xFu))
    {
      v37 = v21;
      v29 = v14;
      id v30 = v7;
      id v31 = v6;
      v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      v33 = sub_10005CDAC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v40 = v28;
        __int16 v41 = 2112;
        id v42 = v26;
        __int16 v43 = 2112;
        v44 = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to copy file %@ => %@ with error %@", buf, 0x20u);
      }

      id v6 = v31;
      id v7 = v30;
      v14 = v29;
      v21 = v37;
    }
    copyfile_state_free(v25);
    uint64_t v34 = +[NSURL fileURLWithPath:v28 isDirectory:0];
    URL = v8->_URL;
    v8->_URL = (NSURL *)v34;
  }
  return v8;
}

- (void)dealloc
{
  [(NMSIncomingFile *)self unlinkURL];
  v3.receiver = self;
  v3.super_class = (Class)NMSIncomingFile;
  [(NMSIncomingFile *)&v3 dealloc];
}

- (void)unlinkURL
{
  if (self->_URL)
  {
    objc_super v3 = sub_10005CDAC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      URL = self->_URL;
      int v8 = 138412290;
      v9 = URL;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unlinking %@", (uint8_t *)&v8, 0xCu);
    }

    if (unlink([(NSURL *)self->_URL fileSystemRepresentation]))
    {
      v5 = sub_10005CDAC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v7 = self->_URL;
        int v8 = 138412290;
        v9 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to unlink %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v6 = self->_URL;
    self->_URL = 0;
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)NMSIncomingFile;
  objc_super v3 = [(NMSIncomingFile *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" url: %@", self->_URL];

  return v4;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (IDSMessageContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end