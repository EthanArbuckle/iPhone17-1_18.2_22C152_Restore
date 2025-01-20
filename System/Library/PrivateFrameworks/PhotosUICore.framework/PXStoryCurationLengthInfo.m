@interface PXStoryCurationLengthInfo
- (PXStoryCurationLengthInfo)init;
- (PXStoryCurationLengthInfo)initWithAvailableLengths:(unint64_t)a3 defaultLength:(unint64_t)a4;
- (unint64_t)availableCurationLengths;
- (unint64_t)defaultCurationLength;
@end

@implementation PXStoryCurationLengthInfo

- (unint64_t)defaultCurationLength
{
  return self->_defaultCurationLength;
}

- (unint64_t)availableCurationLengths
{
  return self->_availableCurationLengths;
}

- (PXStoryCurationLengthInfo)initWithAvailableLengths:(unint64_t)a3 defaultLength:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryCurationLengthInfo;
  result = [(PXStoryCurationLengthInfo *)&v7 init];
  if (result)
  {
    result->_availableCurationLengths = a3;
    result->_defaultCurationLength = a4;
  }
  return result;
}

- (PXStoryCurationLengthInfo)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryCurationLengthInfo.m", 16, @"%s is not available as initializer", "-[PXStoryCurationLengthInfo init]");

  abort();
}

@end