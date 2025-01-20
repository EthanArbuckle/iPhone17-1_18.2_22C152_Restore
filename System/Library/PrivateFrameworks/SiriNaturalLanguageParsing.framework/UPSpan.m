@interface UPSpan
+ (unint64_t)_getSpanTypeFromProtobufSpan:(id)a3;
- (NSString)category;
- (SIRINLUEXTERNALUsoGraph)sharedEntityGraph;
- (UPSpan)initWithProtobufSpan:(id)a3 nonWhitespaceTokenIndexes:(id)a4 error:(id *)a5;
- (UPSpan)initWithRange:(_NSRange)a3 type:(unint64_t)a4 category:(id)a5;
- (UPSpan)initWithRange:(_NSRange)a3 type:(unint64_t)a4 category:(id)a5 sharedEntityGraph:(id)a6;
- (_NSRange)range;
- (id)description;
- (unint64_t)type;
@end

@implementation UPSpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntityGraph, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (SIRINLUEXTERNALUsoGraph)sharedEntityGraph
{
  return self->_sharedEntityGraph;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v10.location = [(UPSpan *)self range];
  v4 = NSStringFromRange(v10);
  unint64_t v5 = [(UPSpan *)self type];
  v6 = [(UPSpan *)self category];
  v7 = [v3 stringWithFormat:@"{UPSpan range: %@ ; type: %lu ; category: %@}", v4, v5, v6];

  return v7;
}

- (UPSpan)initWithProtobufSpan:(id)a3 nonWhitespaceTokenIndexes:(id)a4 error:(id *)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if [v8 hasStartTokenIndex] && (objc_msgSend(v8, "hasEndTokenIndex"))
  {
    unsigned int v10 = [v8 startTokenIndex];
    if (v10 >= [v8 endTokenIndex])
    {
      if (a5)
      {
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid span: start token index (%u) >= end token index (%u)", objc_msgSend(v8, "startTokenIndex"), objc_msgSend(v8, "endTokenIndex"));
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40 = v19;
        v24 = (void *)MEMORY[0x1E4F1C9E8];
        v25 = &v40;
        v26 = &v39;
LABEL_15:
        v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
        *a5 = [v23 errorWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v27];

        v21 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      unint64_t v11 = +[UPSpan _getSpanTypeFromProtobufSpan:v8];
      uint64_t v12 = [v8 startTokenIndex];
      int v13 = [v8 endTokenIndex];
      if ([v9 containsIndex:v12])
      {
        uint64_t v14 = (v13 - 1);
        if ([v9 containsIndex:v14])
        {
          uint64_t v15 = objc_msgSend(v9, "countOfIndexesInRange:", 0, v12);
          uint64_t v16 = objc_msgSend(v9, "countOfIndexesInRange:", 0, v14 + 1);
          v17 = SNLPOSLoggerForCategory(3);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            int v30 = [v8 startTokenIndex];
            __int16 v31 = 1024;
            int v32 = [v8 endTokenIndex];
            __int16 v33 = 2048;
            uint64_t v34 = v15;
            __int16 v35 = 2048;
            uint64_t v36 = v16;
            _os_log_impl(&dword_1C8DA9000, v17, OS_LOG_TYPE_DEBUG, "Converted protobuf token indexes (%u -> %u) to non-whitespace token indexes (%lu -> %lu)", buf, 0x22u);
          }

          uint64_t v18 = v16 - v15;
          v19 = [v8 label];
          v20 = [v8 usoGraph];
          self = -[UPSpan initWithRange:type:category:sharedEntityGraph:](self, "initWithRange:type:category:sharedEntityGraph:", v15, v18, v11, v19, v20);

          v21 = self;
          goto LABEL_16;
        }
      }
      if (a5)
      {
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"Warning: discarding data detector matching span not aligned with non-whitespace tokens (%u -> %u)", objc_msgSend(v8, "startTokenIndex"), objc_msgSend(v8, "endTokenIndex"));
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        v38 = v19;
        v24 = (void *)MEMORY[0x1E4F1C9E8];
        v25 = &v38;
        v26 = &v37;
        goto LABEL_15;
      }
    }
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  if (!a5) {
    goto LABEL_17;
  }
  v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  v42[0] = @"protobuf message is missing a start/end index";
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  [v22 errorWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v19];
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_18:
  return v21;
}

- (UPSpan)initWithRange:(_NSRange)a3 type:(unint64_t)a4 category:(id)a5
{
  return -[UPSpan initWithRange:type:category:sharedEntityGraph:](self, "initWithRange:type:category:sharedEntityGraph:", a3.location, a3.length, a4, a5, 0);
}

- (UPSpan)initWithRange:(_NSRange)a3 type:(unint64_t)a4 category:(id)a5 sharedEntityGraph:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UPSpan;
  uint64_t v14 = [(UPSpan *)&v17 init];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_range.NSUInteger location = location;
    v14->_range.NSUInteger length = length;
    v14->_type = a4;
    objc_storeStrong((id *)&v14->_category, a5);
    objc_storeStrong((id *)&v15->_sharedEntityGraph, a6);
  }

  return v15;
}

+ (unint64_t)_getSpanTypeFromProtobufSpan:(id)a3
{
  id v3 = a3;
  if (![v3 matcherNamesCount])
  {
    v4 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C8DA9000, v4, OS_LOG_TYPE_DEBUG, "No matcher names provided - type property will be UPSpanTypeNone", buf, 2u);
    }
  }
  if ([v3 matcherNamesCount])
  {
    unint64_t v5 = 1;
    do
    {
      int v6 = [v3 matcherNamesAtIndex:v5 - 1];
      if (v6)
      {
        if (v6 == 2)
        {
          int v7 = 0;
          unint64_t v8 = 4;
        }
        else
        {
          id v9 = SNLPOSLoggerForCategory(3);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v13 = 0;
            _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_ERROR, "Span not recognized by the span matchers - type property will be UPSpanTypeNone", v13, 2u);
          }

          unint64_t v8 = 0;
          int v7 = 1;
        }
      }
      else
      {
        int v7 = 0;
        unint64_t v8 = 2;
      }
      unint64_t v10 = [v3 matcherNamesCount];
      if (!v7) {
        break;
      }
    }
    while (v10 > v5++);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

@end