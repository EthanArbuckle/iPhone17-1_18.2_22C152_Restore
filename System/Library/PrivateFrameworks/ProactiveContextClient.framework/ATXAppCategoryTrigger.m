@interface ATXAppCategoryTrigger
+ (BOOL)supportsSecureCoding;
- (ATXAppCategoryTrigger)initWithCoder:(id)a3;
- (ATXAppCategoryTrigger)initWithiTunesCategoryId:(unint64_t)a3;
- (int64_t)iTunesCategoryId;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXAppCategoryTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 0;
}

- (ATXAppCategoryTrigger)initWithiTunesCategoryId:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXAppCategoryTrigger;
  v4 = [(ATXAppCategoryTrigger *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_iTunesCategoryId = a3;
    v6 = v4;
  }

  return v5;
}

- (ATXAppCategoryTrigger)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"iTunesCategory"];

  return [(ATXAppCategoryTrigger *)self initWithiTunesCategoryId:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)iTunesCategoryId
{
  return self->_iTunesCategoryId;
}

@end