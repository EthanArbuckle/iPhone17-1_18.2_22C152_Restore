@interface SDTraceItem
+ (id)stringFromReferenceDate:(double)a3;
+ (void)appendDescription:(id)a3 prefix:(id)a4 toString:(id)a5;
- (NSObject)data;
- (NSString)label;
- (NSString)string;
- (double)duration;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)identifier;
- (void)setData:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setString:(id)a3;
@end

@implementation SDTraceItem

- (void)setString:(id)a3
{
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setLabel:(id)a3
{
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setData:(id)a3
{
}

- (int64_t)identifier
{
  return self->_identifier;
}

+ (id)stringFromReferenceDate:(double)a3
{
  if (stringFromReferenceDate__once != -1) {
    dispatch_once(&stringFromReferenceDate__once, &__block_literal_global_5);
  }
  v4 = (void *)stringFromReferenceDate__formatter;
  v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:a3];
  v6 = [v4 stringFromDate:v5];

  return v6;
}

uint64_t __39__SDTraceItem_stringFromReferenceDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)stringFromReferenceDate__formatter;
  stringFromReferenceDate__formatter = (uint64_t)v0;

  v2 = (void *)stringFromReferenceDate__formatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [(SDTraceItem *)self startTime];
  objc_msgSend(v4, "setStartTime:");
  objc_msgSend(v4, "setIdentifier:", -[SDTraceItem identifier](self, "identifier"));
  v5 = [(SDTraceItem *)self label];
  [v4 setLabel:v5];

  [(SDTraceItem *)self duration];
  objc_msgSend(v4, "setDuration:");
  v6 = [(SDTraceItem *)self data];
  [v4 setData:v6];

  v7 = [(SDTraceItem *)self string];
  [v4 setString:v7];

  v8 = self;
  return v8;
}

+ (void)appendDescription:(id)a3 prefix:(id)a4 toString:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (__CFString *)a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v11 = v7;
    v12 = &stru_26D0BD940;
    if (v8) {
      v12 = v8;
    }
    v13 = [NSString stringWithFormat:@"%@   ", v12];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          [v9 appendFormat:@"\n"];
          +[SDTraceItem appendDescription:v19 prefix:v13 toString:v9];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v16);
    }

    id v7 = v10;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = v7;
      id v20 = v7;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v33;
        if (v8) {
          v24 = v8;
        }
        else {
          v24 = &stru_26D0BD940;
        }
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            v27 = [v20 objectForKeyedSubscript:v26];
            [v9 appendFormat:@"\n%@%@ - ", v8, v26];
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v28 = [NSString stringWithFormat:@"%@   ", v24];
              +[SDTraceItem appendDescription:v27 prefix:v28 toString:v9];
            }
            else
            {
              v28 = [v27 description];
              [v9 appendString:v28];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v22);
      }

      v13 = v8;
      id v7 = v31;
    }
    else
    {
      if (v8) {
        v29 = v8;
      }
      else {
        v29 = &stru_26D0BD940;
      }
      v30 = [v7 description];
      [v9 appendFormat:@"%@%@", v29, v30];

      v13 = v8;
    }
  }
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = +[SDTraceItem stringFromReferenceDate:self->_startTime];
  [v3 appendString:v4];

  if (self->_identifier != -1) {
    objc_msgSend(v3, "appendFormat:", @"\t%ld", self->_identifier);
  }
  if ([(NSString *)self->_label length]) {
    [v3 appendFormat:@"\t%@", self->_label];
  }
  if (self->_duration != 0.0) {
    objc_msgSend(v3, "appendFormat:", @"\telapsed: %g", *(void *)&self->_duration);
  }
  if ([(NSString *)self->_string length])
  {
    [v3 appendFormat:@"\t"];
    [v3 appendString:self->_string];
  }
  data = self->_data;
  if (data) {
    +[SDTraceItem appendDescription:data prefix:@"   " toString:v3];
  }
  return v3;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)label
{
  return self->_label;
}

- (NSObject)data
{
  return self->_data;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end