@interface SFResultFeedback
+ (BOOL)supportsSecureCoding;
- (SFResultFeedback)initWithCoder:(id)a3;
- (SFResultFeedback)initWithResult:(id)a3;
- (SFSearchResult)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation SFResultFeedback

- (void).cxx_destruct
{
}

- (void)setResult:(id)a3
{
}

- (SFSearchResult)result
{
  return self->_result;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  v4 = [(SFFeedback *)&v9 description];
  v5 = [(SFResultFeedback *)self result];
  v6 = [v5 title];
  v7 = [v3 stringWithFormat:@"%@ - %@", v4, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFResultFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, @"result", v5.receiver, v5.super_class);
}

- (SFResultFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    v7 = v5->_result;
    v5->_result = (SFSearchResult *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  id v4 = [(SFFeedback *)&v9 copyWithZone:a3];
  objc_super v5 = [(SFResultFeedback *)self result];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (SFResultFeedback)initWithResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  uint64_t v6 = [(SFFeedback *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    v7->super._queryId = [v5 queryId];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end