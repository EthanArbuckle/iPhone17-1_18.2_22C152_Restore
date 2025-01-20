@interface SFLateSectionsAppendedFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)sections;
- (SFLateSectionsAppendedFeedback)initWithCoder:(id)a3;
- (SFLateSectionsAppendedFeedback)initWithSections:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation SFLateSectionsAppendedFeedback

- (void).cxx_destruct
{
}

- (void)setSections:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFLateSectionsAppendedFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, @"_sections", v5.receiver, v5.super_class);
}

- (SFLateSectionsAppendedFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFLateSectionsAppendedFeedback;
  objc_super v5 = [(SFFeedback *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFLateSectionsAppendedFeedback;
  id v4 = [(SFFeedback *)&v9 copyWithZone:a3];
  objc_super v5 = [(SFLateSectionsAppendedFeedback *)self sections];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (SFLateSectionsAppendedFeedback)initWithSections:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFLateSectionsAppendedFeedback;
  objc_super v5 = [(SFFeedback *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;

    uint64_t v8 = [(NSArray *)v5->_sections firstObject];
    objc_super v9 = [v8 results];
    uint64_t v10 = [v9 firstObject];
    v5->super._queryId = [v10 queryId];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end