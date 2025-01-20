@interface TCMPSStyleTransferWeights
- (NSArray)shape;
- (NSData)data;
- (void)setData:(id)a3;
- (void)setShape:(id)a3;
@end

@implementation TCMPSStyleTransferWeights

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end