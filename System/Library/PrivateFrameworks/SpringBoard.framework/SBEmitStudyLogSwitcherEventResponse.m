@interface SBEmitStudyLogSwitcherEventResponse
- (NSDictionary)payload;
- (NSString)name;
- (SBEmitStudyLogSwitcherEventResponse)initWithStudyLogWithName:(id)a3 payload:(id)a4;
- (int64_t)type;
@end

@implementation SBEmitStudyLogSwitcherEventResponse

- (int64_t)type
{
  return 8;
}

- (SBEmitStudyLogSwitcherEventResponse)initWithStudyLogWithName:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBEmitStudyLogSwitcherEventResponse;
  v8 = [(SBChainableModifierEventResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    payload = v8->_payload;
    v8->_payload = (NSDictionary *)v11;
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end