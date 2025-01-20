@interface TSUStreamDataCompression
- (BOOL)handleData:(id)a3 isDone:(BOOL)a4;
- (OS_dispatch_data)outputData;
- (TSUStreamDataCompression)initWithAlgorithm:(int)a3 operation:(int)a4;
- (void)setHandler:(id)a3;
@end

@implementation TSUStreamDataCompression

- (TSUStreamDataCompression)initWithAlgorithm:(int)a3 operation:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSUStreamDataCompression;
  v4 = [(TSUStreamCompression *)&v8 initWithAlgorithm:*(void *)&a3 operation:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_outputData, &_dispatch_data_empty);
    v7.receiver = v5;
    v7.super_class = (Class)TSUStreamDataCompression;
    [(TSUStreamCompression *)&v7 setHandler:&stru_1001CECC8];
  }
  return v5;
}

- (BOOL)handleData:(id)a3 isDone:(BOOL)a4
{
  concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_outputData, (dispatch_data_t)a3);
  outputData = self->_outputData;
  self->_outputData = concat;

  return 1;
}

- (void)setHandler:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B75C4;
  v6[3] = &unk_1001CECF0;
  id v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TSUStreamDataCompression;
  id v4 = v7;
  [(TSUStreamCompression *)&v5 setHandler:v6];
}

- (OS_dispatch_data)outputData
{
  return self->_outputData;
}

- (void).cxx_destruct
{
}

@end