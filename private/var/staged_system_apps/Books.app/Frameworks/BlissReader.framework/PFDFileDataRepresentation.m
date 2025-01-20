@interface PFDFileDataRepresentation
- (PFDFileDataRepresentation)initWithPath:(id)a3 J00oNrNGGvbpr5VY2bUB:(id)a4;
- (id)bufferedInputStream;
- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3;
- (id)inputStream;
- (int64_t)dataLength;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PFDFileDataRepresentation

- (PFDFileDataRepresentation)initWithPath:(id)a3 J00oNrNGGvbpr5VY2bUB:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PFDFileDataRepresentation;
  v6 = [(PFDFileDataRepresentation *)&v8 init];
  if (v6)
  {
    v6->mPath = (NSString *)a3;
    v6->mDecryptionSession = (BuLr3rwnVU31zt9OioJ56 *)a4;
    v6->mDataLength = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFDFileDataRepresentation;
  [(PFDFileDataRepresentation *)&v3 dealloc];
}

- (int64_t)dataLength
{
  int64_t result = self->mDataLength;
  if (!result)
  {
    int64_t result = (int64_t)[+[NSFileManager defaultManager] pathUsage:self->mPath];
    self->mDataLength = result;
  }
  return result;
}

- (id)inputStream
{
  return [(PFDFileDataRepresentation *)self bufferedInputStream];
}

- (id)bufferedInputStream
{
  v2 = -[PFDInputStream initWithInputStream:J00oNrNGGvbpr5VY2bUB:]([PFDInputStream alloc], "initWithInputStream:J00oNrNGGvbpr5VY2bUB:", [objc_alloc((Class)SFUFileInputStream) initWithPath:self->mPath offset:0], self->mDecryptionSession);

  return v2;
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  return [(PFDFileDataRepresentation *)self bufferedInputStream];
}

- (unint64_t)hash
{
  return [(NSString *)self->mPath hash];
}

@end