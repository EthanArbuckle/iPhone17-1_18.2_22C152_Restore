@interface CRLEncodedBlockInfoWithDecodedLengthInternal
- (CRLEncodedBlockInfoWithDecodedLengthInternal)initWithEncodedLength:(unint64_t)a3 decodedLength:(unint64_t)a4;
- (unint64_t)decodedLength;
@end

@implementation CRLEncodedBlockInfoWithDecodedLengthInternal

- (CRLEncodedBlockInfoWithDecodedLengthInternal)initWithEncodedLength:(unint64_t)a3 decodedLength:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLEncodedBlockInfoWithDecodedLengthInternal;
  result = [(CRLEncodedBlockInfoInternal *)&v6 initWithEncodedLength:a3];
  if (result) {
    result->_decodedLength = a4;
  }
  return result;
}

- (unint64_t)decodedLength
{
  return self->_decodedLength;
}

@end