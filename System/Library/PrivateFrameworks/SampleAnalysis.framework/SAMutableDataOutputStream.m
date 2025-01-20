@interface SAMutableDataOutputStream
- (BOOL)hasSpaceAvailable;
- (id)initWithMutableData:(id *)a1;
- (int)appendData:(id)a3;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
@end

@implementation SAMutableDataOutputStream

- (int)appendData:(id)a3
{
  outputData = self->_outputData;
  id v4 = a3;
  [(NSMutableData *)outputData appendData:v4];
  LODWORD(outputData) = [v4 length];

  return (int)outputData;
}

- (id)initWithMutableData:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SAMutableDataOutputStream;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 17, a2);
    }
  }

  return a1;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  return a4;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (void).cxx_destruct
{
}

@end