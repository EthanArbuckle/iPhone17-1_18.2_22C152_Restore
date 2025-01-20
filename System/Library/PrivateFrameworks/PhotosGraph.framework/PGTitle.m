@interface PGTitle
+ (PGTitle)titleWithString:(id)a3 category:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)stringValue;
- (id)description;
- (int64_t)category;
- (unint64_t)hash;
@end

@implementation PGTitle

- (void).cxx_destruct
{
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p> \"%@\" (%lu)", v5, self, self->_stringValue, self->_category];

  return v6;
}

- (unint64_t)hash
{
  return self->_category ^ [(NSString *)self->_stringValue hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGTitle *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(PGTitle *)v7 stringValue];
      int64_t category = self->_category;
      if (category == [(PGTitle *)v7 category])
      {
        stringValue = self->_stringValue;
        if (stringValue == v8) {
          char v6 = 1;
        }
        else {
          char v6 = [(NSString *)stringValue isEqualToString:v8];
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

+ (PGTitle)titleWithString:(id)a3 category:(int64_t)a4
{
  uint64_t v5 = (NSString *)a3;
  char v6 = objc_alloc_init(PGTitle);
  stringValue = v6->_stringValue;
  v6->_stringValue = v5;

  v6->_int64_t category = a4;
  return v6;
}

@end