@interface CRLEncodedBlockInfoInternal
- (BOOL)isEqual:(id)a3;
- (CRLEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3;
- (NSString)description;
- (unint64_t)decodedLength;
- (unint64_t)encodedLength;
- (unint64_t)hash;
@end

@implementation CRLEncodedBlockInfoInternal

- (CRLEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLEncodedBlockInfoInternal;
  result = [(CRLEncodedBlockInfoInternal *)&v5 init];
  if (result) {
    result->_encodedLength = a3;
  }
  return result;
}

- (unint64_t)decodedLength
{
  return self->_encodedLength;
}

- (BOOL)isEqual:(id)a3
{
  v9 = sub_100246AC8(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLEncodedBlockInfo);
  if (v9) {
    BOOL v10 = sub_10021EEB4(self, v9);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CRLEncodedBlockInfoInternal *)self encodedLength];
  return [(CRLEncodedBlockInfoInternal *)self decodedLength] ^ v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[EncodedLength=%zu; DecodedLength=%zu]",
           [(CRLEncodedBlockInfoInternal *)self encodedLength],
           [(CRLEncodedBlockInfoInternal *)self decodedLength]);
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

@end