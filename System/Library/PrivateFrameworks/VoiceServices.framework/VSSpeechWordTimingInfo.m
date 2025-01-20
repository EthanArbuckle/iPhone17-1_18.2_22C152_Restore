@interface VSSpeechWordTimingInfo
+ (BOOL)supportsSecureCoding;
+ (id)utf16TimingInfoWithUTF8Range:(id)a3 withText:(id)a4;
+ (id)wordTimingInfoFrom:(id)a3 timestamps:(id)a4;
+ (unint64_t)extraBytesFromUTF8ToUTF16With:(const char *)a3 totalLength:(unint64_t)a4 begin:(unint64_t)a5 end:(unint64_t)a6;
+ (void)adjustWordTimingInfo:(id)a3 forContext:(id)a4;
- (BOOL)isEqual:(id)a3;
- (VSSpeechWordTimingInfo)initWithCoder:(id)a3;
- (_NSRange)textRange;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTextRange:(_NSRange)a3;
@end

@implementation VSSpeechWordTimingInfo

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)description
{
  v2 = NSString;
  double startTime = self->_startTime;
  v4 = NSStringFromRange(self->_textRange);
  objc_msgSend(v2, "stringWithFormat:", @"<VSSpeechWordTimingInfo>{double startTime = %.3f; textRange = %@}",
    *(void *)&startTime,
  v5 = v4);

  return v5;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(VSSpeechWordTimingInfo *)self startTime];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(VSSpeechWordTimingInfo *)self textRange] - v5 + 32 * v5;
  [(VSSpeechWordTimingInfo *)self textRange];
  return v7 - v6 + 32 * v6 + 29791;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    [v5 startTime];
    double v7 = v6;
    [(VSSpeechWordTimingInfo *)self startTime];
    if (v7 == v8)
    {
      uint64_t v9 = [v5 textRange];
      uint64_t v11 = v10;
      BOOL v14 = v9 == [(VSSpeechWordTimingInfo *)self textRange] && v11 == v12;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[VSSpeechWordTimingInfo allocWithZone:a3] init];
  [(VSSpeechWordTimingInfo *)self startTime];
  -[VSSpeechWordTimingInfo setStartTime:](v4, "setStartTime:");
  uint64_t v5 = [(VSSpeechWordTimingInfo *)self textRange];
  -[VSSpeechWordTimingInfo setTextRange:](v4, "setTextRange:", v5, v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double startTime = self->_startTime;
  id v5 = a3;
  [v5 encodeDouble:@"_startTime" forKey:startTime];
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_textRange.location, self->_textRange.length);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"_textRange"];
}

- (VSSpeechWordTimingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSSpeechWordTimingInfo;
  id v5 = [(VSSpeechWordTimingInfo *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_startTime"];
    v5->_double startTime = v6;
    double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_textRange"];
    v5->_textRange.NSUInteger location = [v7 rangeValue];
    v5->_textRange.NSUInteger length = v8;
  }
  return v5;
}

+ (void)adjustWordTimingInfo:(id)a3 forContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = objc_msgSend(NSString, "vs_markerStringForContext:", a4);
  uint64_t v7 = [v6 length];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "textRange", (void)v16) - v7;
        [v13 textRange];
        objc_msgSend(v13, "setTextRange:", v14, v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

+ (id)utf16TimingInfoWithUTF8Range:(id)a3 withText:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v33 = [MEMORY[0x263EFF980] array];
  id v8 = v7;
  uint64_t v9 = [v8 UTF8String];
  uint64_t v10 = [v8 lengthOfBytesUsingEncoding:4];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v32)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v31 = *(void *)v35;
    id v29 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v15 = objc_alloc_init(VSSpeechWordTimingInfo);
        [v14 startTime];
        -[VSSpeechWordTimingInfo setStartTime:](v15, "setStartTime:");
        uint64_t v16 = objc_msgSend(a1, "extraBytesFromUTF8ToUTF16With:totalLength:begin:end:", v9, v10, v11, objc_msgSend(v14, "textRange"));
        if (v16 == -1
          || (uint64_t v17 = v16,
              uint64_t v18 = [v14 textRange],
              uint64_t v19 = [v14 textRange],
              [v14 textRange],
              uint64_t v21 = [a1 extraBytesFromUTF8ToUTF16With:v9 totalLength:v10 begin:v18 end:v20 + v19],
              v21 == -1))
        {

          id v8 = v29;
          goto LABEL_12;
        }
        uint64_t v22 = v21;
        uint64_t v23 = v17 + v12;
        uint64_t v24 = [v14 textRange] - v23;
        [v14 textRange];
        -[VSSpeechWordTimingInfo setTextRange:](v15, "setTextRange:", v24, v25 - v22);
        uint64_t v12 = v23 + v22;
        [v33 addObject:v15];
        uint64_t v26 = [v14 textRange];
        [v14 textRange];
        uint64_t v11 = v27 + v26;
      }
      id v8 = v29;
      uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v33;
}

+ (unint64_t)extraBytesFromUTF8ToUTF16With:(const char *)a3 totalLength:(unint64_t)a4 begin:(unint64_t)a5 end:(unint64_t)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v6 = a6 - a5;
  if (a6 <= a5) {
    return 0;
  }
  if (a6 <= a4)
  {
    unint64_t result = 0;
    uint64_t v11 = &a3[a5];
    do
    {
      char v12 = *v11++;
      int v13 = v12 & 0xE0;
      int v14 = v12 & 0xF0;
      if ((v12 & 0xF8) == 0xF0) {
        unint64_t v15 = result + 2;
      }
      else {
        unint64_t v15 = result;
      }
      if (v14 == 224) {
        unint64_t v15 = result + 2;
      }
      if (v13 == 192) {
        ++result;
      }
      else {
        unint64_t result = v15;
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218240;
      unint64_t v17 = a6;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      _os_log_error_impl(&dword_20CABC000, v9, OS_LOG_TYPE_ERROR, "Out of word boundary: %ld is greater than %ld", (uint8_t *)&v16, 0x16u);
    }

    return -1;
  }
  return result;
}

+ (id)wordTimingInfoFrom:(id)a3 timestamps:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v8 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v16 = objc_alloc_init(VSSpeechWordTimingInfo);
        objc_msgSend(v15, "doubleValue", (void)v22);
        -[VSSpeechWordTimingInfo setStartTime:](v16, "setStartTime:");
        if (v12 >= [v5 length])
        {

          goto LABEL_18;
        }
        for (unint64_t j = v12; j < [v5 length]; ++j)
        {
          if (!objc_msgSend(v7, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", j))) {
            break;
          }
        }
        unint64_t v12 = j;
        if (j < [v5 length])
        {
          unint64_t v12 = j;
          do
          {
            if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v12))) {
              break;
            }
            ++v12;
          }
          while (v12 < [v5 length]);
        }
        -[VSSpeechWordTimingInfo setTextRange:](v16, "setTextRange:", j, v12 - j);
        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  __int16 v18 = [v8 lastObject];
  uint64_t v19 = [v18 textRange];
  if (v19 + v20 < (unint64_t)[v5 length]) {
    objc_msgSend(v18, "setTextRange:", objc_msgSend(v18, "textRange"), objc_msgSend(v5, "length") - objc_msgSend(v18, "textRange"));
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end