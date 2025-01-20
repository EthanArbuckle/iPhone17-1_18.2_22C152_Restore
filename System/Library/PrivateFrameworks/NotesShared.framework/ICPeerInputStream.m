@interface ICPeerInputStream
- (BOOL)isMessage;
- (ICPeerInputStream)initWithInputStream:(id)a3;
- (ICPeerInputStreamDelegate)delegate;
- (NSInputStream)inputStream;
- (NSMutableData)data;
- (unint64_t)length;
- (unint64_t)maxLength;
- (void)dealloc;
- (void)readDataFrom:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMessage:(BOOL)a3;
- (void)setLength:(unint64_t)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)startReadLength;
- (void)startReadMessage:(unint64_t)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation ICPeerInputStream

- (ICPeerInputStream)initWithInputStream:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICPeerInputStream;
  v6 = [(ICPeerInputStream *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputStream, a3);
    [v5 setDelegate:v7];
    v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 scheduleInRunLoop:v8 forMode:*MEMORY[0x1E4F1C3A0]];

    if (![v5 streamStatus]) {
      [v5 open];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(NSInputStream *)self->_inputStream setDelegate:0];
  [(NSInputStream *)self->_inputStream close];
  inputStream = self->_inputStream;
  self->_inputStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)ICPeerInputStream;
  [(ICPeerInputStream *)&v4 dealloc];
}

- (void)startReadLength
{
  v3 = [MEMORY[0x1E4F1CA58] dataWithLength:4];
  [(ICPeerInputStream *)self setData:v3];

  [(ICPeerInputStream *)self setLength:0];
  [(ICPeerInputStream *)self setMaxLength:4];
  [(ICPeerInputStream *)self setIsMessage:0];
}

- (void)startReadMessage:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  [(ICPeerInputStream *)self setData:v5];

  [(ICPeerInputStream *)self setLength:0];
  [(ICPeerInputStream *)self setMaxLength:a3];
  [(ICPeerInputStream *)self setIsMessage:1];
}

- (void)readDataFrom:(id)a3
{
  id v4 = a3;
  if (![v4 hasBytesAvailable]) {
    goto LABEL_18;
  }
  uint64_t v5 = *MEMORY[0x1E4F28798];
  while (1)
  {
    unint64_t v6 = [(ICPeerInputStream *)self maxLength];
    unint64_t v7 = v6 - [(ICPeerInputStream *)self length];
    id v8 = [(ICPeerInputStream *)self data];
    uint64_t v9 = objc_msgSend(v4, "read:maxLength:", objc_msgSend(v8, "bytes") + -[ICPeerInputStream length](self, "length"), v7);

    if (v9 >= 1)
    {
      [(ICPeerInputStream *)self setLength:[(ICPeerInputStream *)self length] + v9];
      unint64_t v10 = [(ICPeerInputStream *)self maxLength];
      if (v10 == [(ICPeerInputStream *)self length])
      {
        if ([(ICPeerInputStream *)self isMessage])
        {
          v11 = [(ICPeerInputStream *)self delegate];
          v12 = [(ICPeerInputStream *)self data];
          [v11 handleMessage:v12 fromInputStream:self];

          [(ICPeerInputStream *)self startReadLength];
        }
        else
        {
          id v17 = [(ICPeerInputStream *)self data];
          uint64_t v18 = *(unsigned int *)[v17 bytes];

          [(ICPeerInputStream *)self startReadMessage:v18];
        }
      }
      goto LABEL_12;
    }
    if (v9 < 0) {
      break;
    }
LABEL_12:
    if (([v4 hasBytesAvailable] & 1) == 0) {
      goto LABEL_18;
    }
  }
  v13 = [v4 streamError];
  v14 = [v13 domain];
  if ([v14 isEqualToString:v5])
  {
    v15 = [v4 streamError];
    uint64_t v16 = [v15 code];

    if (v16 != 35) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }

LABEL_15:
  v19 = os_log_create("com.apple.notes", "Multipeer");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[ICPeerInputStream readDataFrom:](v4, v19);
  }

LABEL_18:
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      unint64_t v7 = os_log_create("com.apple.notes", "Multipeer");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      int v16 = 138412290;
      id v17 = v6;
      id v8 = "Stream none event %@.";
      goto LABEL_15;
    case 1uLL:
      v11 = os_log_create("com.apple.notes", "Multipeer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, "Stream open %@.", (uint8_t *)&v16, 0xCu);
      }

      [(ICPeerInputStream *)self startReadLength];
      goto LABEL_21;
    case 2uLL:
      v12 = os_log_create("com.apple.notes", "Multipeer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Stream bytes available %@.", (uint8_t *)&v16, 0xCu);
      }

      [(ICPeerInputStream *)self readDataFrom:v6];
      goto LABEL_21;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_21;
    case 4uLL:
      unint64_t v7 = os_log_create("com.apple.notes", "Multipeer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v6;
        id v8 = "Stream space available %@.";
LABEL_15:
        _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v16, 0xCu);
      }
LABEL_16:

      goto LABEL_21;
    case 8uLL:
      uint64_t v9 = os_log_create("com.apple.notes", "Multipeer");
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      int v16 = 138412290;
      id v17 = v6;
      unint64_t v10 = "Stream error occurred %@.";
      goto LABEL_19;
    default:
      if (a4 != 16) {
        goto LABEL_21;
      }
      uint64_t v9 = os_log_create("com.apple.notes", "Multipeer");
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      int v16 = 138412290;
      id v17 = v6;
      unint64_t v10 = "Stream end %@.";
LABEL_19:
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0xCu);
LABEL_20:

      [v6 close];
      v13 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v6 removeFromRunLoop:v13 forMode:*MEMORY[0x1E4F1C3A0]];

      inputStream = self->_inputStream;
      self->_inputStream = 0;

      v15 = [(ICPeerInputStream *)self delegate];
      [v15 didDisconnectInputStream:self];

LABEL_21:
      return;
  }
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (ICPeerInputStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICPeerInputStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (void)setIsMessage:(BOOL)a3
{
  self->_isMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

- (void)readDataFrom:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 streamError];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "ICPeerInputStream error reading data: %@", (uint8_t *)&v4, 0xCu);
}

@end