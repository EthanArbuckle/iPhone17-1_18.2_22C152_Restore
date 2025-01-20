@interface STAlarmShowAlarmAndPerformActionRequest
+ (BOOL)supportsSecureCoding;
- (STAlarmShowAlarmAndPerformActionRequest)initWithCoder:(id)a3;
- (id)_initWithAction:(id)a3;
- (id)action;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAlarmShowAlarmAndPerformActionRequest

- (void).cxx_destruct
{
}

- (STAlarmShowAlarmAndPerformActionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAlarmShowAlarmAndPerformActionRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_action"];
    action = v5->_action;
    v5->_action = (STAlarmAction *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAlarmShowAlarmAndPerformActionRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, @"_action", v5.receiver, v5.super_class);
}

- (id)action
{
  return self->_action;
}

- (id)_initWithAction:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STAlarmShowAlarmAndPerformActionRequest.m", 19, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)STAlarmShowAlarmAndPerformActionRequest;
  v7 = [(AFSiriRequest *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_action, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end