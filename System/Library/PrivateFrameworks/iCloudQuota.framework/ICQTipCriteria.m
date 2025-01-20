@interface ICQTipCriteria
+ (BOOL)supportsSecureCoding;
- (ICQTipCriteria)initWithCoder:(id)a3;
- (NSArray)excludeApps;
- (NSNumber)maximumRange;
- (NSNumber)minimumRange;
- (NSURL)criteriaURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCriteriaURL:(id)a3;
- (void)setExcludeApps:(id)a3;
- (void)setMaximumRange:(id)a3;
- (void)setMinimumRange:(id)a3;
@end

@implementation ICQTipCriteria

- (id)description
{
  return (id)[NSString stringWithFormat:@"minimumRange: %@, maximumRange: %@, criteriaURL: %@, excludeApps: %@", self->_minimumRange, self->_maximumRange, self->_criteriaURL, self->_excludeApps];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQTipCriteria);
  [(ICQTipCriteria *)v4 setMinimumRange:self->_minimumRange];
  [(ICQTipCriteria *)v4 setMaximumRange:self->_maximumRange];
  [(ICQTipCriteria *)v4 setCriteriaURL:self->_criteriaURL];
  [(ICQTipCriteria *)v4 setExcludeApps:self->_excludeApps];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  minimumRange = self->_minimumRange;
  id v5 = a3;
  [v5 encodeObject:minimumRange forKey:@"minimumRange"];
  [v5 encodeObject:self->_maximumRange forKey:@"maximumRange"];
  [v5 encodeObject:self->_criteriaURL forKey:@"criteriaURL"];
  [v5 encodeObject:self->_excludeApps forKey:@"excludeApps"];
}

- (ICQTipCriteria)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICQTipCriteria;
  id v5 = [(ICQTipCriteria *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumRange"];
    minimumRange = v5->_minimumRange;
    v5->_minimumRange = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumRange"];
    maximumRange = v5->_maximumRange;
    v5->_maximumRange = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"criteriaURL"];
    criteriaURL = v5->_criteriaURL;
    v5->_criteriaURL = (NSURL *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"excludeApps"];
    excludeApps = v5->_excludeApps;
    v5->_excludeApps = (NSArray *)v15;
  }
  return v5;
}

- (NSNumber)minimumRange
{
  return self->_minimumRange;
}

- (void)setMinimumRange:(id)a3
{
}

- (NSNumber)maximumRange
{
  return self->_maximumRange;
}

- (void)setMaximumRange:(id)a3
{
}

- (NSURL)criteriaURL
{
  return self->_criteriaURL;
}

- (void)setCriteriaURL:(id)a3
{
}

- (NSArray)excludeApps
{
  return self->_excludeApps;
}

- (void)setExcludeApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeApps, 0);
  objc_storeStrong((id *)&self->_criteriaURL, 0);
  objc_storeStrong((id *)&self->_maximumRange, 0);
  objc_storeStrong((id *)&self->_minimumRange, 0);
}

@end