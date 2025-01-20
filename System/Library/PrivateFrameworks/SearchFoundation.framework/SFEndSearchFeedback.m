@interface SFEndSearchFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)isCanceled;
- (NSString)uuid;
- (SFEndSearchFeedback)initWithCoder:(id)a3;
- (SFEndSearchFeedback)initWithStartSearch:(id)a3;
- (unint64_t)cancelSearchEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelSearchEvent:(unint64_t)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation SFEndSearchFeedback

- (void).cxx_destruct
{
}

- (void)setCancelSearchEvent:(unint64_t)a3
{
  self->_cancelSearchEvent = a3;
}

- (unint64_t)cancelSearchEvent
{
  return self->_cancelSearchEvent;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFEndSearchFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, @"uuid", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_isCanceled forKey:@"_isCanceled"];
  [v4 encodeInteger:self->_cancelSearchEvent forKey:@"_cancelSearchEvent"];
}

- (SFEndSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFEndSearchFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_isCanceled = [v4 decodeBoolForKey:@"_isCanceled"];
    v5->_cancelSearchEvent = [v4 decodeIntegerForKey:@"_cancelSearchEvent"];
  }

  return v5;
}

- (SFEndSearchFeedback)initWithStartSearch:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFEndSearchFeedback;
  objc_super v5 = [(SFFeedback *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v6 copy];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v5->super._queryId = [v4 queryId];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end