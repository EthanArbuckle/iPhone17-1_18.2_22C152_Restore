@interface WTSmartReplyConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)baseResponse;
- (NSString)entryPoint;
- (TIInputContextHistory)inputContextHistory;
- (WTSmartReplyConfiguration)initWithCoder:(id)a3;
- (WTSmartReplyConfiguration)initWithInputContextHistory:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseResponse:(id)a3;
- (void)setEntryPoint:(id)a3;
@end

@implementation WTSmartReplyConfiguration

- (WTSmartReplyConfiguration)initWithInputContextHistory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WTSmartReplyConfiguration;
  v6 = [(WTSmartReplyConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inputContextHistory, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(WTSmartReplyConfiguration *)self baseResponse];

  if (v4)
  {
    id v5 = [(WTSmartReplyConfiguration *)self baseResponse];
    [v10 encodeObject:v5 forKey:@"BaseResponseKey"];
  }
  v6 = [(WTSmartReplyConfiguration *)self entryPoint];

  if (v6)
  {
    v7 = [(WTSmartReplyConfiguration *)self entryPoint];
    [v10 encodeObject:v7 forKey:@"SelectedEntryKey"];
  }
  v8 = [(WTSmartReplyConfiguration *)self inputContextHistory];

  if (v8)
  {
    objc_super v9 = [(WTSmartReplyConfiguration *)self inputContextHistory];
    [v10 encodeObject:v9 forKey:@"InputContextHistoryKey"];
  }
}

- (WTSmartReplyConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WTSmartReplyConfiguration;
  id v5 = [(WTSmartReplyConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BaseResponseKey"];
    baseResponse = v5->_baseResponse;
    v5->_baseResponse = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SelectedEntryKey"];
    entryPoint = v5->_entryPoint;
    v5->_entryPoint = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InputContextHistoryKey"];
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)baseResponse
{
  return self->_baseResponse;
}

- (void)setBaseResponse:(id)a3
{
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);

  objc_storeStrong((id *)&self->_baseResponse, 0);
}

@end