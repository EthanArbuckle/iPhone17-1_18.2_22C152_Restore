@interface ODCurareDataProviderResult
- (NSArray)batchProviders;
- (NSArray)dataArray;
- (NSArray)dateArray;
- (NSDictionary)metadata;
- (ODCurareDataProviderResult)initWithBatchProviders:(id)a3 dateArray:(id)a4;
- (ODCurareDataProviderResult)initWithDataArray:(id)a3 dateArray:(id)a4;
- (void)setBatchProviders:(id)a3;
- (void)setDataArray:(id)a3;
- (void)setDateArray:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation ODCurareDataProviderResult

- (ODCurareDataProviderResult)initWithDataArray:(id)a3 dateArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ODCurareDataProviderResult;
  v8 = [(ODCurareDataProviderResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ODCurareDataProviderResult *)v8 setDataArray:v6];
    [(ODCurareDataProviderResult *)v9 setDateArray:v7];
  }

  return v9;
}

- (ODCurareDataProviderResult)initWithBatchProviders:(id)a3 dateArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ODCurareDataProviderResult;
  v8 = [(ODCurareDataProviderResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ODCurareDataProviderResult *)v8 setBatchProviders:v6];
    [(ODCurareDataProviderResult *)v9 setDateArray:v7];
  }

  return v9;
}

- (NSArray)dataArray
{
  return self->_dataArray;
}

- (void)setDataArray:(id)a3
{
}

- (NSArray)batchProviders
{
  return self->_batchProviders;
}

- (void)setBatchProviders:(id)a3
{
}

- (NSArray)dateArray
{
  return self->_dateArray;
}

- (void)setDateArray:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dateArray, 0);
  objc_storeStrong((id *)&self->_batchProviders, 0);
  objc_storeStrong((id *)&self->_dataArray, 0);
}

@end