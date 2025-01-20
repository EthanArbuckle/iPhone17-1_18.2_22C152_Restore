@interface RTStateModelOneState
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)stateTransitions;
- (NSUUID)uniqueId;
- (RTStateDepiction)stateDepiction;
- (RTStateModelOneState)init;
- (RTStateModelOneState)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setStateDepiction:(id)a3;
- (void)setStateTransitions:(id)a3;
- (void)setUniqueId:(id)a3;
@end

@implementation RTStateModelOneState

- (RTStateModelOneState)init
{
  v10.receiver = self;
  v10.super_class = (Class)RTStateModelOneState;
  v2 = [(RTStateModelOneState *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSUUID *)v3;

    uint64_t v5 = objc_opt_new();
    stateDepiction = v2->_stateDepiction;
    v2->_stateDepiction = (RTStateDepiction *)v5;

    uint64_t v7 = objc_opt_new();
    stateTransitions = v2->_stateTransitions;
    v2->_stateTransitions = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTStateModelOneState *)self uniqueId];
  [v4 encodeObject:v5 forKey:@"uniqueId"];

  v6 = [(RTStateModelOneState *)self stateDepiction];
  [v4 encodeObject:v6 forKey:@"stateDepiction"];

  id v7 = [(RTStateModelOneState *)self stateTransitions];
  [v4 encodeObject:v7 forKey:@"stateTransitions"];
}

- (RTStateModelOneState)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RTStateModelOneState;
  uint64_t v5 = [(RTStateModelOneState *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueId"];
    uniqueId = v5->_uniqueId;
    v5->_uniqueId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateDepiction"];
    stateDepiction = v5->_stateDepiction;
    v5->_stateDepiction = (RTStateDepiction *)v8;

    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = [v10 setWithObjects:v11, v12, objc_opt_class(), 0];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"stateTransitions"];
    stateTransitions = v5->_stateTransitions;
    v5->_stateTransitions = (NSMutableDictionary *)v14;
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(RTStateModelOneState *)self uniqueId];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = [(RTStateModelOneState *)self stateDepiction];
  id v7 = [v3 stringWithFormat:@"identifier, %@, stateDepiction, %@", v5, v6];

  return v7;
}

- (NSUUID)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (RTStateDepiction)stateDepiction
{
  return self->_stateDepiction;
}

- (void)setStateDepiction:(id)a3
{
}

- (NSMutableDictionary)stateTransitions
{
  return self->_stateTransitions;
}

- (void)setStateTransitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitions, 0);
  objc_storeStrong((id *)&self->_stateDepiction, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end