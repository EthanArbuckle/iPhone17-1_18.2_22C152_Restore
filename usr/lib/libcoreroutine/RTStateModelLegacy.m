@interface RTStateModelLegacy
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)stateModelLut;
- (RTStateModelLegacy)initWithCoder:(id)a3;
- (id)description;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setStateModelLut:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation RTStateModelLegacy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_stateModelLut forKey:@"stateModelLut"];
}

- (RTStateModelLegacy)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTStateModelLegacy;
  id v5 = [(RTStateModelLegacy *)&v13 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"version"]) {
      v5->_int64_t version = [v4 decodeIntegerForKey:@"version"];
    }
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = [v6 setWithObjects:v7, v8, objc_opt_class(), 0];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"stateModelLut"];
    stateModelLut = v5->_stateModelLut;
    v5->_stateModelLut = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(RTStateModelLegacy *)self version];
  id v5 = [(RTStateModelLegacy *)self stateModelLut];
  v6 = [v3 stringWithFormat:@"version, %lu, states, %lu", v4, [v5 count]];

  return v6;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (NSMutableDictionary)stateModelLut
{
  return self->_stateModelLut;
}

- (void)setStateModelLut:(id)a3
{
}

- (void).cxx_destruct
{
}

@end