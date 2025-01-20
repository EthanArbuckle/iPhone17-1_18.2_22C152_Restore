@interface WMListLevelTextToken
+ (id)tokenWithString:(id)a3 level:(int)a4 formatter:(id)a5;
- (NSString)string;
- (WMListLevelTextToken)initWithString:(id)a3 level:(int)a4 formatter:(id)a5;
- (id)stringForIndex:(unint64_t)a3;
- (int)level;
@end

@implementation WMListLevelTextToken

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int)level
{
  return self->_level;
}

- (WMListLevelTextToken)initWithString:(id)a3 level:(int)a4 formatter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WMListLevelTextToken;
  v11 = [(WMListLevelTextToken *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_string, a3);
    v12->_level = a4;
    objc_storeStrong((id *)&v12->_formatter, a5);
  }

  return v12;
}

+ (id)tokenWithString:(id)a3 level:(int)a4 formatter:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [[WMListLevelTextToken alloc] initWithString:v7 level:v6 formatter:v8];

  return v9;
}

- (id)stringForIndex:(unint64_t)a3
{
  return [(CMNumberFormatter *)self->_formatter stringForNumber:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end