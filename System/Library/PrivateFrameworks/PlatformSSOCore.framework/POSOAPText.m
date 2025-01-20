@interface POSOAPText
+ (id)definition;
- (NSString)description;
- (NSString)stringValue;
- (void)setStringValue:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation POSOAPText

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 setContentPropertyName:@"stringValue" type:objc_opt_class()];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 rangeOfString:@":"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8.receiver = self;
    v8.super_class = (Class)POSOAPText;
    [(POSOAPText *)&v8 setValue:v6 forKey:v7];
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end