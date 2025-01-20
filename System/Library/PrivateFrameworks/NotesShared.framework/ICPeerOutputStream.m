@interface ICPeerOutputStream
- (ICPeerOutputStream)initWithOutputStream:(id)a3;
- (NSMutableData)data;
- (NSOutputStream)outputStream;
- (void)dealloc;
- (void)setData:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeData;
- (void)writeMessageData:(id)a3;
@end

@implementation ICPeerOutputStream

- (ICPeerOutputStream)initWithOutputStream:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICPeerOutputStream;
  v6 = [(ICPeerOutputStream *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    [v5 setDelegate:v7];
    v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 scheduleInRunLoop:v8 forMode:*MEMORY[0x1E4F1C3A0]];

    if (![v5 streamStatus]) {
      [v5 open];
    }
    v9 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    data = v7->_data;
    v7->_data = v9;
  }
  return v7;
}

- (void)dealloc
{
  [(NSOutputStream *)self->_outputStream setDelegate:0];
  [(NSOutputStream *)self->_outputStream close];
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)ICPeerOutputStream;
  [(ICPeerOutputStream *)&v4 dealloc];
}

- (void)writeMessageData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICPeerOutputStream *)self data];
  objc_sync_enter(v5);
  int v8 = [v4 length];
  v6 = [(ICPeerOutputStream *)self data];
  [v6 appendBytes:&v8 length:4];

  v7 = [(ICPeerOutputStream *)self data];
  [v7 appendData:v4];

  objc_sync_exit(v5);
  [(ICPeerOutputStream *)self writeData];
}

- (void)writeData
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICPeerOutputStream error writing data: %@", buf, 0xCu);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      v7 = os_log_create("com.apple.notes", "networking");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      id v15 = v6;
      int v8 = "Stream none event %@.";
      goto LABEL_11;
    case 1uLL:
      v7 = os_log_create("com.apple.notes", "networking");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      id v15 = v6;
      int v8 = "Stream open %@.";
      goto LABEL_11;
    case 2uLL:
      v7 = os_log_create("com.apple.notes", "networking");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      id v15 = v6;
      int v8 = "Stream bytes available %@.";
LABEL_11:
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
LABEL_12:

      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v10 = os_log_create("com.apple.notes", "networking");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_DEFAULT, "Stream space available %@.", (uint8_t *)&v14, 0xCu);
      }

      [(ICPeerOutputStream *)self writeData];
      break;
    case 8uLL:
      v9 = os_log_create("com.apple.notes", "networking");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v6 streamError];
        int v14 = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Stream error occurred %@ %@.", (uint8_t *)&v14, 0x16u);
      }
      goto LABEL_19;
    default:
      if (a4 != 16) {
        break;
      }
      v9 = os_log_create("com.apple.notes", "networking");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Stream end %@.", (uint8_t *)&v14, 0xCu);
      }
LABEL_19:

      [v6 close];
      objc_super v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v6 removeFromRunLoop:v12 forMode:*MEMORY[0x1E4F1C3A0]];

      outputStream = self->_outputStream;
      self->_outputStream = 0;

      break;
  }
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end