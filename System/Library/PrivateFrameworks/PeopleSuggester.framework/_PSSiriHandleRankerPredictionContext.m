@interface _PSSiriHandleRankerPredictionContext
+ (BOOL)supportsSecureCoding;
- (NSArray)bundleIds;
- (NSDate)suggestionDate;
- (_PSSiriHandleRankerPredictionContext)initWithCoder:(id)a3;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setSuggestionDate:(id)a3;
@end

@implementation _PSSiriHandleRankerPredictionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)suggestionDate
{
  suggestionDate = self->_suggestionDate;
  if (!suggestionDate)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    v5 = self->_suggestionDate;
    self->_suggestionDate = v4;

    suggestionDate = self->_suggestionDate;
  }

  return suggestionDate;
}

- (_PSSiriHandleRankerPredictionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_PSSiriHandleRankerPredictionContext;
  v5 = [(_PSSiriHandleRankerPredictionContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionDate"];
    suggestionDate = v5->_suggestionDate;
    v5->_suggestionDate = (NSDate *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"bundleIds"];
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSArray *)v11;

    v5->_domain = [v4 decodeInt64ForKey:@"domain"];
    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  suggestionDate = self->_suggestionDate;
  id v5 = a3;
  [v5 encodeObject:suggestionDate forKey:@"suggestionDate"];
  [v5 encodeObject:self->_bundleIds forKey:@"bundleIds"];
  [v5 encodeInt64:self->_domain forKey:@"domain"];
}

- (void)setSuggestionDate:(id)a3
{
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIds, 0);

  objc_storeStrong((id *)&self->_suggestionDate, 0);
}

@end