@interface TSUEncodedBlockInfoInternal
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (TSUEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3;
- (unint64_t)decodedLength;
- (unint64_t)encodedLength;
- (unint64_t)hash;
@end

@implementation TSUEncodedBlockInfoInternal

- (TSUEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUEncodedBlockInfoInternal;
  result = [(TSUEncodedBlockInfoInternal *)&v5 init];
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
  v9 = TSUProtocolCast(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___TSUEncodedBlockInfo);
  if (v9) {
    BOOL v10 = TSUEncodedBlockInfoAreEqual(self, v9);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TSUEncodedBlockInfoInternal *)self encodedLength];
  return [(TSUEncodedBlockInfoInternal *)self decodedLength] ^ v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[EncodedLength=%zu; DecodedLength=%zu]",
           [(TSUEncodedBlockInfoInternal *)self encodedLength],
           [(TSUEncodedBlockInfoInternal *)self decodedLength]);
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

@end