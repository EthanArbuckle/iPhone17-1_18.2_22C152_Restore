@interface SFCustomFeedback
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (NSDictionary)jsonFeedback;
- (SFCustomFeedback)initWithCoder:(id)a3;
- (SFCustomFeedback)initWithType:(unint64_t)a3 data:(id)a4;
- (SFCustomFeedback)initWithType:(unint64_t)a3 jsonFeedback:(id)a4;
- (unint64_t)feedbackType;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFeedbackType:(unint64_t)a3;
- (void)setJsonFeedback:(id)a3;
@end

@implementation SFCustomFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_jsonFeedback, 0);
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)jsonFeedback
{
  return self->_jsonFeedback;
}

- (void)setFeedbackType:(unint64_t)a3
{
  self->_feedbackType = a3;
}

- (unint64_t)feedbackType
{
  return self->_feedbackType;
}

- (void)setJsonFeedback:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v8];
  id v5 = v8;
  data = self->_data;
  self->_data = v4;

  if (v5)
  {
    if (PARLogHandleForCategory_onceToken_32571 != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken_32571, &__block_literal_global_32572);
    }
    v7 = PARLogHandleForCategory_logHandles_1_32573;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_32573, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1A0C02000, v7, OS_LOG_TYPE_ERROR, "SFCustomFeedback: jsonFeedback did not serialize: %@.", buf, 0xCu);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCustomFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_feedbackType, @"feedback_type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_data forKey:@"_data"];
}

- (SFCustomFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCustomFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_feedbackType = [v4 decodeIntegerForKey:@"feedback_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (SFCustomFeedback)initWithType:(unint64_t)a3 data:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFCustomFeedback;
  v7 = [(SFFeedback *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_feedbackType = a3;
    uint64_t v9 = [v6 copy];
    data = v8->_data;
    v8->_data = (NSData *)v9;
  }
  return v8;
}

- (SFCustomFeedback)initWithType:(unint64_t)a3 jsonFeedback:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFCustomFeedback;
  v7 = [(SFFeedback *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    v7->_feedbackType = a3;
    [(SFCustomFeedback *)v7 setJsonFeedback:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end