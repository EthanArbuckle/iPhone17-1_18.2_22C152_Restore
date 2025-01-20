@interface STUpdateAlarmAction
+ (BOOL)supportsSecureCoding;
- (STUpdateAlarmAction)initWithCoder:(id)a3;
- (id)_initWithModifications:(id)a3;
- (id)modifications;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STUpdateAlarmAction

- (void).cxx_destruct
{
}

- (STUpdateAlarmAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUpdateAlarmAction;
  v5 = [(STSiriModelObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modifications"];
    modifications = v5->_modifications;
    v5->_modifications = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUpdateAlarmAction;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_modifications, @"_modifications", v5.receiver, v5.super_class);
}

- (id)modifications
{
  return self->_modifications;
}

- (id)_initWithModifications:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STUpdateAlarmAction.m", 19, @"Invalid parameter not satisfying: %@", @"modifications" object file lineNumber description];
  }
  if (![v6 count])
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"STUpdateAlarmAction.m", 20, @"Invalid parameter not satisfying: %@", @"[modifications count] > 0" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)STUpdateAlarmAction;
  v7 = [(STUpdateAlarmAction *)&v12 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_modifications, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end