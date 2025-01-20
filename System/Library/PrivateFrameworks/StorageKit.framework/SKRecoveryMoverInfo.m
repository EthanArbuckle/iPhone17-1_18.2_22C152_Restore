@interface SKRecoveryMoverInfo
- (NSNumber)partitionID;
- (SKRecoveryMoverInfo)initWithSrcOffset:(unint64_t)a3 dstOffset:(unint64_t)a4 length:(unint64_t)a5 partitionID:(id)a6;
- (unint64_t)dstOffset;
- (unint64_t)length;
- (unint64_t)srcOffset;
- (void)setDstOffset:(unint64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)setPartitionID:(id)a3;
- (void)setSrcOffset:(unint64_t)a3;
@end

@implementation SKRecoveryMoverInfo

- (SKRecoveryMoverInfo)initWithSrcOffset:(unint64_t)a3 dstOffset:(unint64_t)a4 length:(unint64_t)a5 partitionID:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SKRecoveryMoverInfo;
  v12 = [(SKRecoveryMoverInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_srcOffset = a3;
    v12->_dstOffset = a4;
    v12->_length = a5;
    objc_storeStrong((id *)&v12->_partitionID, a6);
  }

  return v13;
}

- (unint64_t)srcOffset
{
  return self->_srcOffset;
}

- (void)setSrcOffset:(unint64_t)a3
{
  self->_srcOffset = a3;
}

- (unint64_t)dstOffset
{
  return self->_dstOffset;
}

- (void)setDstOffset:(unint64_t)a3
{
  self->_dstOffset = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSNumber)partitionID
{
  return self->_partitionID;
}

- (void)setPartitionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end