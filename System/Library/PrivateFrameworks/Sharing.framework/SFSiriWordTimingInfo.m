@interface SFSiriWordTimingInfo
+ (id)serializableArrayWithTimingInfoArray:(id)a3;
+ (id)timingInfoArrayWithSerializableArray:(id)a3;
- (NSString)localizedText;
- (NSString)wordID;
- (SFSiriWordTimingInfo)initWithDictionary:(id)a3;
- (_NSRange)textRange;
- (double)timeOffset;
- (id)dictionary;
- (void)setLocalizedText:(id)a3;
- (void)setTextRange:(_NSRange)a3;
- (void)setTimeOffset:(double)a3;
- (void)setWordID:(id)a3;
@end

@implementation SFSiriWordTimingInfo

+ (id)serializableArrayWithTimingInfoArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionary", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)timingInfoArrayWithSerializableArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [SFSiriWordTimingInfo alloc];
          long long v12 = -[SFSiriWordTimingInfo initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (SFSiriWordTimingInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSiriWordTimingInfo;
  id v5 = [(SFSiriWordTimingInfo *)&v9 init];
  if (v5)
  {
    CFDictionaryGetDouble();
    v5->_timeOffset = v6;
    v5->_textRange.location = CFDictionaryGetInt64Ranged();
    v5->_textRange.length = CFDictionaryGetInt64Ranged();
    uint64_t v7 = v5;
  }

  return v5;
}

- (id)dictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"t";
  id v3 = [NSNumber numberWithDouble:self->_timeOffset];
  v9[0] = v3;
  v8[1] = @"o";
  id v4 = [NSNumber numberWithUnsignedInteger:self->_textRange.location];
  v9[1] = v4;
  v8[2] = @"l";
  id v5 = [NSNumber numberWithUnsignedInteger:self->_textRange.length];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (NSString)localizedText
{
  return self->_localizedText;
}

- (void)setLocalizedText:(id)a3
{
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (NSString)wordID
{
  return self->_wordID;
}

- (void)setWordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordID, 0);

  objc_storeStrong((id *)&self->_localizedText, 0);
}

@end