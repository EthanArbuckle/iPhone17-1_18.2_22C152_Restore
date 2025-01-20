@interface SFStartSearchFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)input;
- (NSString)uuid;
- (SFStartSearchFeedback)initWithCoder:(id)a3;
- (SFStartSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4;
- (SFStartSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5;
- (id)description;
- (unint64_t)searchType;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setInput:(id)a3;
- (void)setSearchType:(unint64_t)a3;
- (void)setTriggerEvent:(unint64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation SFStartSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartSearchFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, @"input", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_uuid forKey:@"uuid"];
  [v4 encodeInteger:self->_triggerEvent forKey:@"trigger_event"];
  [v4 encodeInteger:self->_searchType forKey:@"_searchType"];
}

- (SFStartSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFStartSearchFeedback;
  objc_super v5 = [(SFFeedback *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    input = v5->_input;
    v5->_input = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    v5->_triggerEvent = [v4 decodeIntegerForKey:@"trigger_event"];
    v5->_searchType = [v4 decodeIntegerForKey:@"_searchType"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SFStartSearchFeedback;
  id v4 = [(SFFeedback *)&v8 description];
  objc_super v5 = [(SFStartSearchFeedback *)self input];
  uint64_t v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (SFStartSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  result = [(SFStartSearchFeedback *)self initWithInput:a3 triggerEvent:a4];
  if (result) {
    result->super._queryId = a5;
  }
  return result;
}

- (SFStartSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFStartSearchFeedback;
  v7 = [(SFFeedback *)&v14 init];
  if (v7)
  {
    objc_super v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    uuid = v7->_uuid;
    v7->_uuid = (NSString *)v9;

    uint64_t v11 = [v6 copy];
    input = v7->_input;
    v7->_input = (NSString *)v11;

    v7->_triggerEvent = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end