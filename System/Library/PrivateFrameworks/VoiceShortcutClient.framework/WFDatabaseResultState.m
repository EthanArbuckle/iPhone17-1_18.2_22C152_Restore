@interface WFDatabaseResultState
+ (BOOL)supportsSecureCoding;
- (NSSet)state;
- (WFDatabaseResultState)initWithCoder:(id)a3;
- (WFDatabaseResultState)initWithObjectType:(unint64_t)a3 state:(id)a4;
- (unint64_t)objectType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDatabaseResultState

- (WFDatabaseResultState)initWithObjectType:(unint64_t)a3 state:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFDatabaseResultState.m", 17, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFDatabaseResultState;
  v8 = [(WFDatabaseResultState *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_objectType = a3;
    uint64_t v10 = [v7 copy];
    state = v9->_state;
    v9->_state = (NSSet *)v10;

    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (NSSet)state
{
  return self->_state;
}

- (unint64_t)objectType
{
  return self->_objectType;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFDatabaseResultState objectType](self, "objectType"), @"objectType");
  id v5 = [(WFDatabaseResultState *)self state];
  [v4 encodeObject:v5 forKey:@"state"];
}

- (WFDatabaseResultState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"objectType"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"state"];

  uint64_t v10 = [(WFDatabaseResultState *)self initWithObjectType:v5 state:v9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end