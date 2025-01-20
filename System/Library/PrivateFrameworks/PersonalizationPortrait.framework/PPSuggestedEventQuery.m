@interface PPSuggestedEventQuery
+ (BOOL)supportsSecureCoding;
- (NSSet)matchingCategories;
- (PPSuggestedEventQuery)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMatchingCategories:(id)a3;
@end

@implementation PPSuggestedEventQuery

- (void).cxx_destruct
{
}

- (void)setMatchingCategories:(id)a3
{
}

- (NSSet)matchingCategories
{
  return self->_matchingCategories;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPEventQuery *)self fromDate];
  v5 = [(PPEventQuery *)self toDate];
  v6 = (void *)[v3 initWithFormat:@"<PPSuggestedEventQuery f:%@ t:%@ m:%@>", v4, v5, self->_matchingCategories];

  return v6;
}

- (PPSuggestedEventQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPSuggestedEventQuery;
  v5 = [(PPEventQuery *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192F97350]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"mtcat"];
    matchingCategories = v5->_matchingCategories;
    v5->_matchingCategories = (NSSet *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPSuggestedEventQuery;
  id v4 = a3;
  [(PPEventQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingCategories, @"mtcat", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end