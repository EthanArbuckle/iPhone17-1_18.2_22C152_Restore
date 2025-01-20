@interface FCPBMessageStreamWriter
- (BOOL)close:(id *)a3;
- (FCPBMessageStreamWriter)initWithURL:(id)a3;
- (NSError)error;
- (NSOutputStream)outputStream;
- (NSURL)URL;
- (PBDataWriter)dataWriter;
- (_NSRange)writeMessage:(id)a3;
- (char)varIntBuffer;
- (unint64_t)currentOffset;
- (void)_open;
- (void)_openIfNeeded;
- (void)dealloc;
- (void)setCurrentOffset:(unint64_t)a3;
- (void)setError:(id)a3;
@end

@implementation FCPBMessageStreamWriter

- (FCPBMessageStreamWriter)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPBMessageStreamWriter;
  v6 = [(FCPBMessageStreamWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (void)dealloc
{
  varIntBuffer = self->_varIntBuffer;
  if (varIntBuffer)
  {
    free(varIntBuffer);
    self->_varIntBuffer = 0;
  }
  if ([(NSOutputStream *)self->_outputStream streamStatus]
    && (unint64_t)[(NSOutputStream *)self->_outputStream streamStatus] <= 5)
  {
    [(NSOutputStream *)self->_outputStream close];
  }
  v4.receiver = self;
  v4.super_class = (Class)FCPBMessageStreamWriter;
  [(FCPBMessageStreamWriter *)&v4 dealloc];
}

- (_NSRange)writeMessage:(id)a3
{
  id v4 = a3;
  [(FCPBMessageStreamWriter *)self _openIfNeeded];
  id v5 = [(FCPBMessageStreamWriter *)self error];

  if (!v5)
  {
    v8 = [(FCPBMessageStreamWriter *)self dataWriter];
    [v4 writeTo:v8];

    objc_super v9 = [(FCPBMessageStreamWriter *)self dataWriter];
    v10 = [v9 data];

    uint64_t v7 = [v10 length];
    if (v7)
    {
      [(FCPBMessageStreamWriter *)self varIntBuffer];
      uint64_t v11 = PBDataWriterWriteBareVarint();
      v12 = [(FCPBMessageStreamWriter *)self outputStream];
      uint64_t v13 = objc_msgSend(v12, "write:maxLength:", -[FCPBMessageStreamWriter varIntBuffer](self, "varIntBuffer"), v11);

      if (v13 == v11)
      {
        v14 = [(FCPBMessageStreamWriter *)self outputStream];
        uint64_t v15 = objc_msgSend(v14, "write:maxLength:", objc_msgSend(v10, "bytes"), v7);

        if (v15 == v7)
        {
          v16 = [(FCPBMessageStreamWriter *)self dataWriter];
          v17 = [v16 data];
          [v17 setLength:0];

          NSUInteger v6 = [(FCPBMessageStreamWriter *)self currentOffset] + v11;
          [(FCPBMessageStreamWriter *)self setCurrentOffset:[(FCPBMessageStreamWriter *)self currentOffset] + v11];
          [(FCPBMessageStreamWriter *)self setCurrentOffset:[(FCPBMessageStreamWriter *)self currentOffset] + v7];
LABEL_11:

          goto LABEL_12;
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __40__FCPBMessageStreamWriter_writeMessage___block_invoke_4;
        v20[3] = &unk_1E5B591A0;
        v20[4] = self;
        __40__FCPBMessageStreamWriter_writeMessage___block_invoke_4((uint64_t)v20);
      }
      else
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __40__FCPBMessageStreamWriter_writeMessage___block_invoke_3;
        v21[3] = &unk_1E5B591A0;
        v21[4] = self;
        __40__FCPBMessageStreamWriter_writeMessage___block_invoke_3((uint64_t)v21);
      }
      NSUInteger v6 = 0;
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    NSUInteger v6 = 0;
    goto LABEL_11;
  }
  NSUInteger v6 = 0;
  uint64_t v7 = 0;
LABEL_12:

  NSUInteger v18 = v6;
  NSUInteger v19 = v7;
  result.length = v19;
  result.location = v18;
  return result;
}

uint64_t __40__FCPBMessageStreamWriter_writeMessage___block_invoke_3(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Failed to write protobuf message length to disk");
  [*(id *)(a1 + 32) setError:v2];

  return 0;
}

uint64_t __40__FCPBMessageStreamWriter_writeMessage___block_invoke_4(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Failed to write protobuf message data to disk");
  [*(id *)(a1 + 32) setError:v2];

  return 0;
}

- (BOOL)close:(id *)a3
{
  id v5 = [(FCPBMessageStreamWriter *)self outputStream];
  [v5 close];

  NSUInteger v6 = [(FCPBMessageStreamWriter *)self error];

  if (!v6)
  {
    v10 = [(FCPBMessageStreamWriter *)self outputStream];
    uint64_t v11 = [v10 streamError];
    [(FCPBMessageStreamWriter *)self setError:v11];

    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    *a3 = [(FCPBMessageStreamWriter *)self error];
  }
LABEL_4:
  uint64_t v7 = [(FCPBMessageStreamWriter *)self error];
  BOOL v8 = v7 == 0;

  return v8;
}

- (void)_openIfNeeded
{
  v3 = [(FCPBMessageStreamWriter *)self outputStream];
  if (v3)
  {
  }
  else
  {
    id v4 = [(FCPBMessageStreamWriter *)self error];

    if (!v4)
    {
      [(FCPBMessageStreamWriter *)self _open];
    }
  }
}

- (void)_open
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAA8];
  id v4 = [(FCPBMessageStreamWriter *)self URL];
  id v5 = [v3 outputStreamWithURL:v4 append:0];

  if (v5)
  {
    [v5 open];
    objc_storeStrong((id *)&self->_outputStream, v5);
    NSUInteger v6 = (PBDataWriter *)objc_alloc_init(MEMORY[0x1E4F94098]);
    dataWriter = self->_dataWriter;
    self->_dataWriter = v6;

    self->_varIntBuffer = (char *)malloc_type_calloc(0xAuLL, 1uLL, 0x100004077774924uLL);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F28C58];
    v12 = @"URL";
    objc_super v9 = [(FCPBMessageStreamWriter *)self URL];
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = objc_msgSend(v8, "fc_errorWithCode:description:additionalUserInfo:", 16, @"Failed to create output stream", v10);
    [(FCPBMessageStreamWriter *)self setError:v11];
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (PBDataWriter)dataWriter
{
  return self->_dataWriter;
}

- (char)varIntBuffer
{
  return self->_varIntBuffer;
}

- (unint64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(unint64_t)a3
{
  self->_currentOffset = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataWriter, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end