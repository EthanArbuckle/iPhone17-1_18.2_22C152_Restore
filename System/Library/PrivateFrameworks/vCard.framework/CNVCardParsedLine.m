@interface CNVCardParsedLine
- (BOOL)isPrimary;
- (CNVCardParsedLine)initWithName:(id)a3;
- (NSArray)parameters;
- (NSString)grouping;
- (NSString)name;
- (id)description;
- (id)value;
- (void)setGrouping:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CNVCardParsedLine

- (CNVCardParsedLine)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVCardParsedLine;
  v5 = [(CNVCardParsedLine *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CNVCardParsedLine *)self name];
  uint64_t v6 = [(CNVCardParsedLine *)self value];
  v7 = [v3 stringWithFormat:@"<%@ %p %@='%@' primary=%d>", v4, self, v5, v6, -[CNVCardParsedLine isPrimary](self, "isPrimary")];

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setValue:(id)a3
{
}

- (NSArray)parameters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParameters:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGrouping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end