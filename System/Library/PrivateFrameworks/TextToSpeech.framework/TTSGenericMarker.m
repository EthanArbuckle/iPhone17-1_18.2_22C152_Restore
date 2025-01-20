@interface TTSGenericMarker
- (AVSpeechSynthesisMarker)avMark;
- (NSString)name;
- (int64_t)byteOffset;
- (int64_t)markType;
- (void)setByteOffset:(int64_t)a3;
- (void)setName:(id)a3;
@end

@implementation TTSGenericMarker

- (int64_t)markType
{
  return 3;
}

- (AVSpeechSynthesisMarker)avMark
{
  id v3 = objc_alloc(MEMORY[0x1E4F15448]);
  v8 = objc_msgSend_name(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_byteOffset(self, v9, v10, v11, v12);
  v16 = objc_msgSend_initWithBookmarkName_atByteSampleOffset_(v3, v14, (uint64_t)v8, v13, v15);

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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end