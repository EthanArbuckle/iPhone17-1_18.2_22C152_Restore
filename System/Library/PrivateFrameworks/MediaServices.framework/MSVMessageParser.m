@interface MSVMessageParser
+ (id)createHeader:(unint64_t)a3;
- (MSVMessageParserDelegate)delegate;
- (NSMutableData)unhandledPartialData;
- (NSMutableData)unhandledPartialObjectData;
- (int64_t)unhandledObjectDataExpectedLength;
- (void)_notifyDelegate:(id)a3;
- (void)processData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnhandledObjectDataExpectedLength:(int64_t)a3;
- (void)setUnhandledPartialData:(id)a3;
- (void)setUnhandledPartialObjectData:(id)a3;
@end

@implementation MSVMessageParser

+ (id)createHeader:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:v5 length:PBDataWriterWriteBareVarint()];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhandledPartialData, 0);
  objc_storeStrong((id *)&self->_unhandledPartialObjectData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setUnhandledPartialData:(id)a3
{
}

- (NSMutableData)unhandledPartialData
{
  return self->_unhandledPartialData;
}

- (void)setUnhandledObjectDataExpectedLength:(int64_t)a3
{
  self->_unhandledObjectDataExpectedLength = a3;
}

- (int64_t)unhandledObjectDataExpectedLength
{
  return self->_unhandledObjectDataExpectedLength;
}

- (void)setUnhandledPartialObjectData:(id)a3
{
}

- (NSMutableData)unhandledPartialObjectData
{
  return self->_unhandledPartialObjectData;
}

- (void)setDelegate:(id)a3
{
}

- (MSVMessageParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSVMessageParserDelegate *)WeakRetained;
}

- (void)_notifyDelegate:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained parser:self didParseMessage:v5];
  }
  [(MSVMessageParser *)self setUnhandledPartialObjectData:0];
  [(MSVMessageParser *)self setUnhandledObjectDataExpectedLength:0];
}

- (void)processData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];
  unhandledPartialData = self->_unhandledPartialData;
  if (unhandledPartialData)
  {
    [(NSMutableData *)unhandledPartialData appendData:v4];
    uint64_t v5 = [(NSMutableData *)self->_unhandledPartialData bytes];
    uint64_t v6 = [(NSMutableData *)self->_unhandledPartialData length];
  }
  unhandledPartialObjectData = self->_unhandledPartialObjectData;
  if (unhandledPartialObjectData)
  {
    int64_t unhandledObjectDataExpectedLength = self->_unhandledObjectDataExpectedLength;
    uint64_t v10 = [(NSMutableData *)unhandledPartialObjectData length];
    uint64_t v11 = unhandledObjectDataExpectedLength - v10;
    if (unhandledObjectDataExpectedLength - v10 >= v6) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = unhandledObjectDataExpectedLength - v10;
    }
    v13 = [MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v5 length:v12 freeWhenDone:0];
    v14 = self->_unhandledPartialObjectData;
    id v15 = v13;
    -[NSMutableData appendBytes:length:](v14, "appendBytes:length:", [v15 bytes], objc_msgSend(v15, "length"));
    if (v11 <= v6) {
      [(MSVMessageParser *)self _notifyDelegate:self->_unhandledPartialObjectData];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v12 >= v6)
  {
LABEL_17:
    v18 = self->_unhandledPartialData;
    self->_unhandledPartialData = 0;
  }
  else
  {
    while (PBReaderReadVarIntBuf())
    {
      uint64_t v16 = v5 + v12;
      if (v6 - v12 >= 0)
      {
        v17 = [MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v16 length:0 freeWhenDone:0];
        [(MSVMessageParser *)self _notifyDelegate:v17];
      }
      else
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithBytes:length:", v16);
        [(MSVMessageParser *)self setUnhandledPartialObjectData:v17];
        [(MSVMessageParser *)self setUnhandledObjectDataExpectedLength:0];
      }
      v12 += objc_msgSend(v17, "length", 0);

      if (v12 >= v6) {
        goto LABEL_17;
      }
    }
    v19 = [MEMORY[0x1E4F1CA58] dataWithBytes:v5 + v12 length:v6 - v12];
    v18 = self->_unhandledPartialData;
    self->_unhandledPartialData = v19;
  }
}

@end