@interface PTPCancelPacket
- (PTPCancelPacket)initWithTCPBuffer:(void *)a3;
- (PTPCancelPacket)initWithTransactionID:(unsigned int)a3;
- (id)contentForTCP;
- (id)description;
- (unsigned)transactionID;
- (void)setTransactionID:(unsigned int)a3;
@end

@implementation PTPCancelPacket

- (PTPCancelPacket)initWithTransactionID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTPCancelPacket;
  result = [(PTPCancelPacket *)&v5 init];
  if (result) {
    result->_transactionID = a3;
  }
  return result;
}

- (PTPCancelPacket)initWithTCPBuffer:(void *)a3
{
  if (*(_DWORD *)a3 == 12 && *((_DWORD *)a3 + 1) == 11)
  {
    v8.receiver = self;
    v8.super_class = (Class)PTPCancelPacket;
    v6 = [(PTPCancelPacket *)&v8 init];
    if (v6) {
      v6->_transactionID = *((_DWORD *)a3 + 2);
    }
    self = v6;
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)contentForTCP
{
  v3 = +[PTPWrappedBytes wrappedBytesWithCapacity:12];
  objc_super v5 = [v3 mutableBytes];
  sub_10001F130(&v5, 12);
  sub_10001F130(&v5, 11);
  sub_10001F130(&v5, self->_transactionID);
  [v3 setLength:12];

  return v3;
}

- (id)description
{
  return +[NSMutableString stringWithFormat:@"<PTPCancelPacket %p>{\n  _transactionID: %lu\n}", self, self->_transactionID];
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

@end