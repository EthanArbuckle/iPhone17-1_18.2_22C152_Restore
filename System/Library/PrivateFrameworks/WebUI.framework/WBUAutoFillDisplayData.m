@interface WBUAutoFillDisplayData
+ (BOOL)supportsSecureCoding;
- (NSArray)fillMatches;
- (NSString)label;
- (NSString)property;
- (NSString)valueString;
- (WBUAutoFillDisplayData)initWithCoder:(id)a3;
- (WBUAutoFillDisplayData)initWithLabel:(id)a3 fillMatches:(id)a4;
- (id)addressStringForLabel:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation WBUAutoFillDisplayData

- (WBUAutoFillDisplayData)initWithLabel:(id)a3 fillMatches:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBUAutoFillDisplayData;
  v9 = [(WBUAutoFillDisplayData *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    uint64_t v11 = [v8 copy];
    fillMatches = v10->_fillMatches;
    v10->_fillMatches = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)addressStringForLabel:(id)a3
{
  v3 = [(NSArray *)self->_fillMatches safari_mapObjectsUsingBlock:&__block_literal_global_1];
  v4 = _WBSLocalizedString();
  v5 = [v3 componentsJoinedByString:v4];

  return v5;
}

uint64_t __48__WBUAutoFillDisplayData_addressStringForLabel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (NSString)valueString
{
  v3 = [(NSArray *)self->_fillMatches firstObject];
  v4 = [v3 property];
  int v5 = [v4 isEqualToString:@"Address"];

  if (v5)
  {
    v6 = [v3 label];
    id v7 = [(WBUAutoFillDisplayData *)self addressStringForLabel:v6];
  }
  else
  {
    id v7 = +[WBUFormDataController valueStringForMatch:v3];
  }

  return (NSString *)v7;
}

- (NSString)property
{
  v2 = [(NSArray *)self->_fillMatches firstObject];
  v3 = [v2 property];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBUAutoFillDisplayData)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"fillMatches"];

  id v7 = [(WBUAutoFillDisplayData *)self initWithLabel:v5 fillMatches:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"label"];
  [v5 encodeObject:self->_fillMatches forKey:@"fillMatches"];
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSArray)fillMatches
{
  return self->_fillMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillMatches, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end