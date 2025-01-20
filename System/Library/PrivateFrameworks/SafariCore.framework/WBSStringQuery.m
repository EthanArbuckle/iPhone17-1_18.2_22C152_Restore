@interface WBSStringQuery
+ (WBSStringQuery)queryThatMatchesEverything;
- (NSString)matchingTypeDescriptionString;
- (NSString)string;
- (WBSStringQuery)initWithString:(id)a3 matchingType:(int64_t)a4;
- (int64_t)matchingType;
@end

@implementation WBSStringQuery

+ (WBSStringQuery)queryThatMatchesEverything
{
  v2 = (void *)[objc_alloc((Class)a1) initWithString:&stru_1F105D3F0 matchingType:0];
  return (WBSStringQuery *)v2;
}

- (WBSStringQuery)initWithString:(id)a3 matchingType:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSStringQuery;
  v7 = [(WBSStringQuery *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    string = v7->_string;
    v7->_string = (NSString *)v8;

    v7->_matchingType = a4;
    v10 = v7;
  }

  return v7;
}

- (NSString)matchingTypeDescriptionString
{
  if (self->_matchingType) {
    return (NSString *)@"exact";
  }
  else {
    return (NSString *)@"prefix";
  }
}

- (NSString)string
{
  return self->_string;
}

- (int64_t)matchingType
{
  return self->_matchingType;
}

- (void).cxx_destruct
{
}

@end