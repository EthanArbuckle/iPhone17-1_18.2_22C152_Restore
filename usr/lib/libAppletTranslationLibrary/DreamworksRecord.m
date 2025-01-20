@interface DreamworksRecord
- (NSData)data;
- (unsigned)number;
- (unsigned)seqnum;
- (unsigned)sfi;
- (void)setData:(id)a3;
- (void)setNumber:(unsigned __int8)a3;
- (void)setSeqnum:(unsigned int)a3;
- (void)setSfi:(unsigned __int8)a3;
@end

@implementation DreamworksRecord

- (unsigned)sfi
{
  return self->_sfi;
}

- (void)setSfi:(unsigned __int8)a3
{
  self->_sfi = a3;
}

- (unsigned)number
{
  return self->_number;
}

- (void)setNumber:(unsigned __int8)a3
{
  self->_number = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unsigned)seqnum
{
  return self->_seqnum;
}

- (void)setSeqnum:(unsigned int)a3
{
  self->_seqnum = a3;
}

- (void).cxx_destruct
{
}

@end