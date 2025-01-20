@interface SearchUICollectionResultsViewRestorationContext
+ (BOOL)supportsSecureCoding;
- (NSArray)sections;
- (SearchUICollectionResultsViewRestorationContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation SearchUICollectionResultsViewRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchUICollectionResultsViewRestorationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICollectionResultsViewRestorationContext;
  v5 = [(SearchUICollectionViewRestorationContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionResultsViewRestorationContext;
  id v4 = a3;
  [(SearchUICollectionViewRestorationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, @"sections", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICollectionResultsViewRestorationContext;
  id v4 = [(SearchUICollectionViewRestorationContext *)&v7 copyWithZone:a3];
  objc_super v5 = [(SearchUICollectionResultsViewRestorationContext *)self sections];
  [v4 setSections:v5];

  return v4;
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end