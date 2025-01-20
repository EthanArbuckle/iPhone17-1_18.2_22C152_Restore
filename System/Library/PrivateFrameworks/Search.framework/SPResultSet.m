@interface SPResultSet
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSArray)resultSections;
- (NSArray)stableSections;
- (SPResultSet)initWithCoder:(id)a3;
- (SPResultSet)initWithSections:(id)a3;
- (SPResultSet)initWithSections:(id)a3 stableSections:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPResultSet

- (SPResultSet)initWithSections:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SPResultSet;
  v6 = [(SPResultSet *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultSections, a3);
    stableSections = v7->_stableSections;
    v7->_stableSections = 0;
  }
  return v7;
}

- (SPResultSet)initWithSections:(id)a3 stableSections:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPResultSet;
  v9 = [(SPResultSet *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultSections, a3);
    objc_storeStrong((id *)&v10->_stableSections, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
    uint64_t v8 = classesToDecode;
    classesToDecode = v7;
    MEMORY[0x270F9A758](v7, v8);
  }
}

- (SPResultSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPResultSet;
  uint64_t v5 = [(SPResultSet *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClasses:classesToDecode forKey:@"_resultSections"];
    resultSections = v5->_resultSections;
    v5->_resultSections = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClasses:classesToDecode forKey:@"_stableSections"];
    stableSections = v5->_stableSections;
    v5->_stableSections = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  resultSections = self->_resultSections;
  id v5 = a3;
  [v5 encodeObject:resultSections forKey:@"_resultSections"];
  [v5 encodeObject:self->_stableSections forKey:@"_stableSections"];
}

- (NSArray)resultSections
{
  return self->_resultSections;
}

- (NSArray)stableSections
{
  return self->_stableSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableSections, 0);

  objc_storeStrong((id *)&self->_resultSections, 0);
}

@end