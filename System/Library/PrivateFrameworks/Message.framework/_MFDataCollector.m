@interface _MFDataCollector
+ (void)writeData:(id)a3 library:(id)a4 message:(id)a5 isPartial:(BOOL)a6;
- (_MFDataCollector)initWithLibrary:(id)a3 message:(id)a4 part:(id)a5 partial:(BOOL)a6 incomplete:(BOOL)a7 relaxDataProtection:(BOOL)a8 data:(id)a9;
- (id)data;
- (id)pathForStorage;
- (int64_t)appendData:(id)a3;
- (void)done;
- (void)pathForStorage;
@end

@implementation _MFDataCollector

- (_MFDataCollector)initWithLibrary:(id)a3 message:(id)a4 part:(id)a5 partial:(BOOL)a6 incomplete:(BOOL)a7 relaxDataProtection:(BOOL)a8 data:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a5;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_MFDataCollector;
  v18 = [(_MFDataCollector *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_library, a3);
    objc_storeStrong((id *)&v19->_message, a4);
    objc_storeStrong((id *)&v19->_part, a5);
    v19->_partial = a6;
    v19->_incomplete = a7;
    v19->_relaxDataProtection = a8;
    if (v17)
    {
      v20 = (NSData *)v17;
      data = v19->_data;
      v19->_data = v20;
    }
    else
    {
      v22 = (MFBufferedDataConsumer *)objc_alloc_init(MEMORY[0x1E4F734A8]);
      data = v19->_consumer;
      v19->_consumer = v22;
    }
  }
  return v19;
}

+ (void)writeData:(id)a3 library:(id)a4 message:(id)a5 isPartial:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1AD0E3E00]();
  v12 = [[_MFDataCollector alloc] initWithLibrary:v9 message:v10 part:0 partial:v6 incomplete:0 relaxDataProtection:0 data:v13];
  [(_MFDataCollector *)v12 done];
}

- (id)pathForStorage
{
  v9[3] = *MEMORY[0x1E4F143B8];
  part = self->_part;
  library = self->_library;
  if (part) {
    _dataPathForMessageAndPart(library, self->_message, part);
  }
  else {
  v5 = [(MFMailMessageLibrary *)library dataPathForMessage:self->_message type:self->_partial];
  }
  BOOL v6 = objc_msgSend(v5, "ef_pathByReplacingRelativePathWithFolderName:", @"mbox");
  v7 = MFPersistenceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(_MFDataCollector *)(uint64_t)v6 pathForStorage];
  }

  return v6;
}

- (int64_t)appendData:(id)a3
{
  id v5 = a3;
  consumer = self->_consumer;
  if (!consumer)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MailMessageLibrary.m", 8501, @"Invalid parameter not satisfying: %@", @"_consumer" object file lineNumber description];

    consumer = self->_consumer;
  }
  int64_t v7 = [(MFBufferedDataConsumer *)consumer appendData:v5];

  return v7;
}

- (void)done
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v1, (uint64_t)v1, "Exception occurred while writing to \"%@\": %@", v2);
}

- (id)data
{
  return [(MFBufferedDataConsumer *)self->_consumer data];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_part, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)pathForStorage
{
  OUTLINED_FUNCTION_9_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_12_1(&dword_1A7EFF000, v5, v3, "Sanitized path for libraryID %lld - %@", v4);
}

@end