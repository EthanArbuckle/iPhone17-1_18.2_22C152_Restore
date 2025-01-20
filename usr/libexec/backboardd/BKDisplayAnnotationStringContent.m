@interface BKDisplayAnnotationStringContent
+ (id)contentWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)string;
- (void)setString:(id)a3;
@end

@implementation BKDisplayAnnotationStringContent

+ (id)contentWithString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setString:v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    string = self->_string;
    v6 = [v4 string];
    unsigned __int8 v7 = [(NSString *)string isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_string withName:@"string"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

@end