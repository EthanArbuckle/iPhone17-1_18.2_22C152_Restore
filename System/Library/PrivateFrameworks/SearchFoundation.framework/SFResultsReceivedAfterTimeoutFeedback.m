@interface SFResultsReceivedAfterTimeoutFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)results;
- (SFResultsReceivedAfterTimeoutFeedback)initWithCoder:(id)a3;
- (SFResultsReceivedAfterTimeoutFeedback)initWithResults:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation SFResultsReceivedAfterTimeoutFeedback

- (void).cxx_destruct
{
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, @"_results", v5.receiver, v5.super_class);
}

- (SFResultsReceivedAfterTimeoutFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  objc_super v5 = [(SFFeedback *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_results"];
    results = v5->_results;
    v5->_results = (NSArray *)v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  id v4 = [(SFFeedback *)&v9 copyWithZone:a3];
  objc_super v5 = [(SFResultsReceivedAfterTimeoutFeedback *)self results];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (SFResultsReceivedAfterTimeoutFeedback)initWithResults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  objc_super v5 = [(SFFeedback *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    results = v5->_results;
    v5->_results = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end