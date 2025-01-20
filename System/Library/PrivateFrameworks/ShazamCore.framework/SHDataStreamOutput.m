@interface SHDataStreamOutput
- (BOOL)closeWithError:(id *)a3;
- (BOOL)processData:(id)a3 error:(id *)a4;
- (NSOutputStream)outputStream;
- (SHDataStream)next;
- (SHDataStreamOutput)initWithDestination:(id)a3;
- (void)dealloc;
- (void)setNext:(id)a3;
- (void)setOutputStream:(id)a3;
@end

@implementation SHDataStreamOutput

- (void)dealloc
{
  [(NSOutputStream *)self->_outputStream close];
  v3.receiver = self;
  v3.super_class = (Class)SHDataStreamOutput;
  [(SHDataStreamOutput *)&v3 dealloc];
}

- (SHDataStreamOutput)initWithDestination:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHDataStreamOutput;
  v5 = [(SHDataStreamOutput *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9E0] outputStreamWithURL:v4 append:0];
    outputStream = v5->_outputStream;
    v5->_outputStream = (NSOutputStream *)v6;

    [(NSOutputStream *)v5->_outputStream open];
  }

  return v5;
}

- (BOOL)closeWithError:(id *)a3
{
  [(NSOutputStream *)self->_outputStream close];
  v5 = [(SHDataStreamOutput *)self next];
  if (v5)
  {
    uint64_t v6 = [(SHDataStreamOutput *)self next];
    char v7 = [v6 closeWithError:a3];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(SHDataStreamOutput *)self outputStream];
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  uint64_t v11 = [v7 write:v9 maxLength:v10];
  if (v11 <= 0)
  {
    v12 = [(SHDataStreamOutput *)self outputStream];
    v13 = [v12 streamError];
    +[SHCoreError annotateError:a4 withError:v13];
  }
  return v11 > 0;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

@end