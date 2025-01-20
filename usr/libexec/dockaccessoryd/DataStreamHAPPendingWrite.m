@interface DataStreamHAPPendingWrite
- (BOOL)isComplete;
- (DataStreamHAPPendingWrite)initWithData:(id)a3 completion:(id)a4;
- (NSData)data;
- (id)completion;
- (id)popNextFrameUpToMaxLength:(unint64_t)a3;
- (unint64_t)bytesWritten;
- (void)setBytesWritten:(unint64_t)a3;
@end

@implementation DataStreamHAPPendingWrite

- (DataStreamHAPPendingWrite)initWithData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DataStreamHAPPendingWrite;
  v8 = [(DataStreamHAPPendingWrite *)&v14 init];
  if (v8)
  {
    v9 = (NSData *)[v6 copy];
    data = v8->_data;
    v8->_data = v9;

    id v11 = objc_retainBlock(v7);
    id completion = v8->_completion;
    v8->_id completion = v11;
  }
  return v8;
}

- (BOOL)isComplete
{
  v2 = self;
  v3 = [(DataStreamHAPPendingWrite *)self data];
  id v4 = [v3 length];
  LOBYTE(v2) = v4 <= (id)[(DataStreamHAPPendingWrite *)v2 bytesWritten];

  return (char)v2;
}

- (id)popNextFrameUpToMaxLength:(unint64_t)a3
{
  v5 = [(DataStreamHAPPendingWrite *)self data];
  id v6 = [v5 length];
  unint64_t v7 = v6 - (unsigned char *)[(DataStreamHAPPendingWrite *)self bytesWritten];

  if (v7 < a3) {
    a3 = v7;
  }
  v8 = [(DataStreamHAPPendingWrite *)self data];
  v9 = [v8 subdataWithRange:-[DataStreamHAPPendingWrite bytesWritten](self, "bytesWritten"), a3];

  [(DataStreamHAPPendingWrite *)self setBytesWritten:(char *)[(DataStreamHAPPendingWrite *)self bytesWritten] + a3];

  return v9;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end