@interface TTSPhonemeMarker
- (AVSpeechSynthesisMarker)avMark;
- (NSString)phoneme;
- (id)toAVMarkAtOffset:(int64_t)a3;
- (int64_t)alphabet;
- (int64_t)byteOffset;
- (int64_t)markType;
- (void)setAlphabet:(int64_t)a3;
- (void)setByteOffset:(int64_t)a3;
- (void)setPhoneme:(id)a3;
@end

@implementation TTSPhonemeMarker

- (int64_t)markType
{
  return 4;
}

- (id)toAVMarkAtOffset:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F15448]);
  v10 = objc_msgSend_phoneme(self, v6, v7, v8, v9);
  v13 = objc_msgSend_initWithPhonemeString_atByteSampleOffset_(v5, v11, (uint64_t)v10, a3, v12);

  return v13;
}

- (AVSpeechSynthesisMarker)avMark
{
  id v3 = objc_alloc(MEMORY[0x1E4F15448]);
  uint64_t v8 = objc_msgSend_phoneme(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_byteOffset(self, v9, v10, v11, v12);
  v16 = objc_msgSend_initWithPhonemeString_atByteSampleOffset_(v3, v14, (uint64_t)v8, v13, v15);

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

- (NSString)phoneme
{
  return self->_phoneme;
}

- (void)setPhoneme:(id)a3
{
}

- (int64_t)alphabet
{
  return self->_alphabet;
}

- (void)setAlphabet:(int64_t)a3
{
  self->_alphabet = a3;
}

- (void).cxx_destruct
{
}

@end