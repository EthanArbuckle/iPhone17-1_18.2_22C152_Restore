@interface PPKGPMagicPaperImageGenerationEvent
+ (int64_t)imageGenerationInvocationFromPPKInvocation:(int64_t)a3;
+ (int64_t)imageGenerationModeFromPPKMode:(int64_t)a3;
- (BOOL)isPencilPaired;
- (int64_t)invocation;
- (int64_t)mode;
- (unint64_t)handwrittenWordsCount;
- (unint64_t)imagesCount;
- (unint64_t)shapesCount;
- (unint64_t)signaturesCount;
- (unint64_t)strokesCount;
- (unint64_t)wordsCount;
- (void)setHandwrittenWordsCount:(unint64_t)a3;
- (void)setImagesCount:(unint64_t)a3;
- (void)setInvocation:(int64_t)a3;
- (void)setIsPencilPaired:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setShapesCount:(unint64_t)a3;
- (void)setSignaturesCount:(unint64_t)a3;
- (void)setStrokesCount:(unint64_t)a3;
- (void)setWordsCount:(unint64_t)a3;
@end

@implementation PPKGPMagicPaperImageGenerationEvent

+ (int64_t)imageGenerationInvocationFromPPKInvocation:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 2) {
    int64_t v3 = 2;
  }
  if (a3 == 3) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (int64_t)imageGenerationModeFromPPKMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)isPencilPaired
{
  return self->_isPencilPaired;
}

- (void)setIsPencilPaired:(BOOL)a3
{
  self->_isPencilPaired = a3;
}

- (unint64_t)wordsCount
{
  return self->_wordsCount;
}

- (void)setWordsCount:(unint64_t)a3
{
  self->_wordsCount = a3;
}

- (unint64_t)handwrittenWordsCount
{
  return self->_handwrittenWordsCount;
}

- (void)setHandwrittenWordsCount:(unint64_t)a3
{
  self->_handwrittenWordsCount = a3;
}

- (unint64_t)imagesCount
{
  return self->_imagesCount;
}

- (void)setImagesCount:(unint64_t)a3
{
  self->_imagesCount = a3;
}

- (unint64_t)shapesCount
{
  return self->_shapesCount;
}

- (void)setShapesCount:(unint64_t)a3
{
  self->_shapesCount = a3;
}

- (unint64_t)signaturesCount
{
  return self->_signaturesCount;
}

- (void)setSignaturesCount:(unint64_t)a3
{
  self->_signaturesCount = a3;
}

- (unint64_t)strokesCount
{
  return self->_strokesCount;
}

- (void)setStrokesCount:(unint64_t)a3
{
  self->_strokesCount = a3;
}

- (int64_t)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(int64_t)a3
{
  self->_invocation = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

@end