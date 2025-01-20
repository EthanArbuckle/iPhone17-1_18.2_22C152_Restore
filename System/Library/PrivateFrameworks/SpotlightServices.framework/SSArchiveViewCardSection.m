@interface SSArchiveViewCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isTopHit;
- (CSSearchableItemAttributeSet)attributeSet;
- (NSString)searchString;
- (SFCardSection)fallbackCardSection;
- (SSArchiveViewCardSection)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeSet:(id)a3;
- (void)setFallbackCardSection:(id)a3;
- (void)setIsTopHit:(BOOL)a3;
- (void)setSearchString:(id)a3;
@end

@implementation SSArchiveViewCardSection

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSArchiveViewCardSection;
  id v4 = a3;
  [(SFArchiveViewCardSection *)&v8 encodeWithCoder:v4];
  v5 = [(SSArchiveViewCardSection *)self attributeSet];
  [v4 encodeObject:v5 forKey:@"attributeSet"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SSArchiveViewCardSection isTopHit](self, "isTopHit"), @"isTopHit");
  v6 = [(SSArchiveViewCardSection *)self searchString];
  [v4 encodeObject:v6 forKey:@"searchString"];

  v7 = [(SSArchiveViewCardSection *)self fallbackCardSection];
  [v4 encodeObject:v7 forKey:@"fallbackCardSection"];
}

- (SSArchiveViewCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSArchiveViewCardSection;
  v5 = [(SFArchiveViewCardSection *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributeSet"];
    [(SSArchiveViewCardSection *)v5 setAttributeSet:v6];

    -[SSArchiveViewCardSection setIsTopHit:](v5, "setIsTopHit:", [v4 decodeBoolForKey:@"isTopHit"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    [(SSArchiveViewCardSection *)v5 setSearchString:v7];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackCardSection"];
    [(SSArchiveViewCardSection *)v5 setFallbackCardSection:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void)setAttributeSet:(id)a3
{
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (void)setIsTopHit:(BOOL)a3
{
  self->_isTopHit = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (SFCardSection)fallbackCardSection
{
  return self->_fallbackCardSection;
}

- (void)setFallbackCardSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackCardSection, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_attributeSet, 0);
}

@end