@interface AXKonaSpeechSegment
+ (NSDictionary)encodingReplacements;
- (AXKonaMarker)marker;
- (AXKonaSpeechSegment)init;
- (NSString)text;
- (_NSRange)range;
- (char)encodedString;
- (unint64_t)encodedStringLength;
- (unint64_t)targetEncoding;
- (void)dealloc;
- (void)setEncodedStringLength:(unint64_t)a3;
- (void)setMarker:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setTargetEncoding:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation AXKonaSpeechSegment

+ (NSDictionary)encodingReplacements
{
  v2 = (void *)EncodingReplacements;
  if (!EncodingReplacements)
  {
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"KonaEncodingReplacements" ofType:@"plist"];
    uint64_t v6 = [v3 dictionaryWithContentsOfFile:v5];
    v7 = (void *)EncodingReplacements;
    EncodingReplacements = v6;

    v2 = (void *)EncodingReplacements;
  }
  return (NSDictionary *)v2;
}

- (AXKonaSpeechSegment)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXKonaSpeechSegment;
  result = [(AXKonaSpeechSegment *)&v3 init];
  if (result) {
    result->_encodedString = 0;
  }
  return result;
}

- (void)dealloc
{
  encodedString = self->_encodedString;
  if (encodedString) {
    free(encodedString);
  }
  v4.receiver = self;
  v4.super_class = (Class)AXKonaSpeechSegment;
  [(AXKonaSpeechSegment *)&v4 dealloc];
}

- (void)setText:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  objc_super v4 = (void *)[v18 copy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = +[AXKonaSpeechSegment encodingReplacements];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        v12 = +[AXKonaSpeechSegment encodingReplacements];
        v13 = [v12 objectForKeyedSubscript:v11];
        objc_super v4 = [v10 stringByReplacingOccurrencesOfString:v11 withString:v13];

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  objc_storeStrong((id *)&self->_text, v4);
  encodedString = self->_encodedString;
  if (encodedString)
  {
    free(encodedString);
    self->_encodedString = 0;
  }
  uint64_t v19 = 0;
  uint64_t v15 = objc_msgSend(v4, "maximumLengthOfBytesUsingEncoding:", -[AXKonaSpeechSegment targetEncoding](self, "targetEncoding"));
  v16 = (char *)malloc_type_malloc(v15 + 1, 0xECBC1A28uLL);
  self->_encodedString = v16;
  objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16, v15, &v19, -[AXKonaSpeechSegment targetEncoding](self, "targetEncoding"), 1, 0, objc_msgSend(v4, "length"), 0);
  self->_encodedString[v19] = 0;
  [(AXKonaSpeechSegment *)self setEncodedStringLength:v19];
  for (unint64_t i = 0; [v4 length] > i; ++i)
  {
    if (self->_encodedString[i] == 63 && [v4 characterAtIndex:i] != 63) {
      self->_encodedString[i] = 32;
    }
  }
}

- (char)encodedString
{
  return self->_encodedString;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)targetEncoding
{
  return self->_targetEncoding;
}

- (void)setTargetEncoding:(unint64_t)a3
{
  self->_targetEncoding = a3;
}

- (unint64_t)encodedStringLength
{
  return self->_encodedStringLength;
}

- (void)setEncodedStringLength:(unint64_t)a3
{
  self->_encodedStringLength = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (AXKonaMarker)marker
{
  return self->_marker;
}

- (void)setMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end