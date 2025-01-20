@interface CRLStreamDataCompression
- (BOOL)handleData:(id)a3 isDone:(BOOL)a4;
- (CRLStreamDataCompression)initWithAlgorithm:(int)a3 operation:(int)a4;
- (OS_dispatch_data)outputData;
- (void)setHandler:(id)a3;
@end

@implementation CRLStreamDataCompression

- (CRLStreamDataCompression)initWithAlgorithm:(int)a3 operation:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRLStreamDataCompression;
  v4 = [(CRLStreamCompression *)&v8 initWithAlgorithm:*(void *)&a3 operation:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_outputData, &_dispatch_data_empty);
    v7.receiver = v5;
    v7.super_class = (Class)CRLStreamDataCompression;
    [(CRLStreamCompression *)&v7 setHandler:&stru_1014EAB20];
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
  v6[2] = sub_1002D6954;
  v6[3] = &unk_1014EAB48;
  id v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRLStreamDataCompression;
  id v4 = v7;
  [(CRLStreamCompression *)&v5 setHandler:v6];
}

- (OS_dispatch_data)outputData
{
  return self->_outputData;
}

- (void).cxx_destruct
{
}

@end