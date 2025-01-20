@interface CNVCardReadingOptions
- (BOOL)useConcurrentParsing;
- (CNVCardReadingOptions)init;
- (NSArray)propertiesToFetch;
- (id)description;
- (unint64_t)contactLimit;
- (unint64_t)maximumValueLength;
- (void)setContactLimit:(unint64_t)a3;
- (void)setMaximumValueLength:(unint64_t)a3;
- (void)setPropertiesToFetch:(id)a3;
- (void)setUseConcurrentParsing:(BOOL)a3;
@end

@implementation CNVCardReadingOptions

- (CNVCardReadingOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNVCardReadingOptions;
  v2 = [(CNVCardReadingOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_contactLimit = -1;
    v2->_maximumValueLength = -1;
    v2->_useConcurrentParsing = 1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  if ([(CNVCardReadingOptions *)self contactLimit] == -1)
  {
    id v6 = (id)[v3 appendName:@"contactLimit" object:@"unlimited"];
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CNVCardReadingOptions contactLimit](self, "contactLimit"));
    id v5 = (id)[v3 appendName:@"contactLimit" object:v4];
  }
  v7 = [(CNVCardReadingOptions *)self propertiesToFetch];
  id v8 = (id)[v3 appendName:@"propertiesToFetch" object:v7];

  if ([(CNVCardReadingOptions *)self maximumValueLength] == -1)
  {
    id v11 = (id)[v3 appendName:@"maximumValueLength" object:@"unlimited"];
  }
  else
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CNVCardReadingOptions maximumValueLength](self, "maximumValueLength"));
    id v10 = (id)[v3 appendName:@"maximumValueLength" object:v9];
  }
  id v12 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"useConcurrentParsing", -[CNVCardReadingOptions useConcurrentParsing](self, "useConcurrentParsing"));
  v13 = [v3 build];

  return v13;
}

- (unint64_t)contactLimit
{
  return self->_contactLimit;
}

- (void)setContactLimit:(unint64_t)a3
{
  self->_contactLimit = a3;
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (void)setPropertiesToFetch:(id)a3
{
}

- (unint64_t)maximumValueLength
{
  return self->_maximumValueLength;
}

- (void)setMaximumValueLength:(unint64_t)a3
{
  self->_maximumValueLength = a3;
}

- (BOOL)useConcurrentParsing
{
  return self->_useConcurrentParsing;
}

- (void)setUseConcurrentParsing:(BOOL)a3
{
  self->_useConcurrentParsing = a3;
}

- (void).cxx_destruct
{
}

@end