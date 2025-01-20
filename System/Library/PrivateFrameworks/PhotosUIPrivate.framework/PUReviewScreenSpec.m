@interface PUReviewScreenSpec
- (BOOL)allowSendButton;
- (PUReviewScreenSpec)initWithOptions:(unint64_t)a3;
- (unint64_t)oneUpOptions;
- (unint64_t)options;
@end

@implementation PUReviewScreenSpec

- (BOOL)allowSendButton
{
  return self->_allowSendButton;
}

- (unint64_t)oneUpOptions
{
  return self->_oneUpOptions;
}

- (unint64_t)options
{
  return self->_options;
}

- (PUReviewScreenSpec)initWithOptions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUReviewScreenSpec;
  result = [(PUReviewScreenSpec *)&v6 init];
  if (result)
  {
    uint64_t v5 = 263400;
    if ((a3 & 2) != 0) {
      uint64_t v5 = 279784;
    }
    result->_options = a3;
    result->_oneUpOptions = ((a3 & 1) << 8) & 0xFDFF | ((a3 & 1) << 9) | v5;
    result->_allowSendButton = a3 & 1;
  }
  return result;
}

@end