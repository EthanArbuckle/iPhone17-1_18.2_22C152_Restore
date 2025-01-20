@interface PPContactRecordResultBuffer
- (BOOL)loadingComplete;
- (NSMutableArray)records;
- (PPContactRecordResultBuffer)init;
- (void)setLoadingComplete:(BOOL)a3;
@end

@implementation PPContactRecordResultBuffer

- (void).cxx_destruct
{
}

- (void)setLoadingComplete:(BOOL)a3
{
  self->_loadingComplete = a3;
}

- (BOOL)loadingComplete
{
  return self->_loadingComplete;
}

- (NSMutableArray)records
{
  return self->_records;
}

- (PPContactRecordResultBuffer)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPContactRecordResultBuffer;
  v2 = [(PPContactRecordResultBuffer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    records = v2->_records;
    v2->_records = (NSMutableArray *)v3;

    v2->_loadingComplete = 0;
  }
  return v2;
}

@end