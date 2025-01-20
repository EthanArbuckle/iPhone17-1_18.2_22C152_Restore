@interface SFLookupHintRelevancyFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)discarded;
- (NSString)context;
- (NSString)domain;
- (SFLookupHintRelevancyFeedback)initWithCoder:(id)a3;
- (SFLookupHintRelevancyFeedback)initWithContext:(id)a3 hintRange:(_NSRange)a4 domain:(id)a5 discarded:(BOOL)a6 grade:(unint64_t)a7;
- (_NSRange)hintRange;
- (unint64_t)grade;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setDiscarded:(BOOL)a3;
- (void)setDomain:(id)a3;
- (void)setGrade:(unint64_t)a3;
- (void)setHintRange:(_NSRange)a3;
@end

@implementation SFLookupHintRelevancyFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setGrade:(unint64_t)a3
{
  self->_grade = a3;
}

- (unint64_t)grade
{
  return self->_grade;
}

- (void)setDiscarded:(BOOL)a3
{
  self->_discarded = a3;
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setHintRange:(_NSRange)a3
{
  self->_hintRange = a3;
}

- (_NSRange)hintRange
{
  p_hintRange = &self->_hintRange;
  NSUInteger location = self->_hintRange.location;
  NSUInteger length = p_hintRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFLookupHintRelevancyFeedback;
  id v4 = a3;
  [(SFFeedback *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, @"_context", v6.receiver, v6.super_class);
  v5 = NSStringFromRange(self->_hintRange);
  [v4 encodeObject:v5 forKey:@"_hintRange"];

  [v4 encodeObject:self->_domain forKey:@"_domain"];
  [v4 encodeBool:self->_discarded forKey:@"_discarded"];
  [v4 encodeInteger:self->_grade forKey:@"_grade"];
}

- (SFLookupHintRelevancyFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFLookupHintRelevancyFeedback;
  v5 = [(SFFeedback *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hintRange"];
    v5->_hintRange = NSRangeFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v9;

    v5->_discarded = [v4 decodeBoolForKey:@"_discarded"];
    v5->_grade = [v4 decodeIntegerForKey:@"_grade"];
  }

  return v5;
}

- (SFLookupHintRelevancyFeedback)initWithContext:(id)a3 hintRange:(_NSRange)a4 domain:(id)a5 discarded:(BOOL)a6 grade:(unint64_t)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFLookupHintRelevancyFeedback;
  v16 = [(SFFeedback *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a3);
    v17->_hintRange.NSUInteger location = location;
    v17->_hintRange.NSUInteger length = length;
    objc_storeStrong((id *)&v17->_domain, a5);
    v17->_discarded = a6;
    v17->_grade = a7;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end