@interface TTSWordMarker
- (AVSpeechSynthesisMarker)avMark;
- (_NSRange)wordRange;
- (int64_t)byteOffset;
- (int64_t)markType;
- (void)setByteOffset:(int64_t)a3;
- (void)setWordRange:(_NSRange)a3;
@end

@implementation TTSWordMarker

- (int64_t)markType
{
  return 1;
}

- (AVSpeechSynthesisMarker)avMark
{
  id v3 = objc_alloc(MEMORY[0x1E4F15448]);
  uint64_t v8 = objc_msgSend_wordRange(self, v4, v5, v6, v7);
  uint64_t v10 = (uint64_t)v9;
  uint64_t v14 = objc_msgSend_byteOffset(self, v9, v11, v12, v13);
  v16 = objc_msgSend_initWithWordRange_atByteSampleOffset_(v3, v15, v8, v10, v14);

  return (AVSpeechSynthesisMarker *)v16;
}

- (int64_t)byteOffset
{
  return self->_byteOffset;
}

- (void)setByteOffset:(int64_t)a3
{
  self->_byteOffset = a3;
}

- (_NSRange)wordRange
{
  NSUInteger length = self->_wordRange.length;
  NSUInteger location = self->_wordRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setWordRange:(_NSRange)a3
{
  self->_wordRange = a3;
}

@end