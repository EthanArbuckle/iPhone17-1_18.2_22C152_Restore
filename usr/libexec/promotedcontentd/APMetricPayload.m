@interface APMetricPayload
- (APEventChannel)channel;
- (APFakeNetworkResponse)fakeNetworkResponse;
- (NSArray)batchInfos;
- (NSData)batchesData;
- (NSString)billing;
- (void)setBatchInfos:(id)a3;
- (void)setBatchesData:(id)a3;
- (void)setBilling:(id)a3;
- (void)setChannel:(id)a3;
- (void)setFakeNetworkResponse:(id)a3;
@end

@implementation APMetricPayload

- (NSData)batchesData
{
  return self->_batchesData;
}

- (void)setBatchesData:(id)a3
{
}

- (NSString)billing
{
  return self->_billing;
}

- (void)setBilling:(id)a3
{
}

- (APEventChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSArray)batchInfos
{
  return self->_batchInfos;
}

- (void)setBatchInfos:(id)a3
{
}

- (APFakeNetworkResponse)fakeNetworkResponse
{
  return self->_fakeNetworkResponse;
}

- (void)setFakeNetworkResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, 0);
  objc_storeStrong((id *)&self->_batchInfos, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_billing, 0);

  objc_storeStrong((id *)&self->_batchesData, 0);
}

@end