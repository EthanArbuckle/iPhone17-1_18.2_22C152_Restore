@interface SCDAFBoost
+ (BOOL)supportsSecureCoding;
+ (id)arrayDictionaryRepresentation:(id)a3;
+ (id)boostsArrayWithDictionaryRepresentation:(id)a3;
- (SCDAFBoost)initWithCoder:(id)a3;
- (SCDAFBoost)initWithDictionaryRepresentation:(id)a3;
- (double)boostValue;
- (double)currentDecay;
- (double)totalDecay;
- (id)dictionaryRepresentation;
- (int64_t)kind;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBoostValue:(double)a3;
- (void)setCurrentDecay:(double)a3;
- (void)setKind:(int64_t)a3;
- (void)setTotalDecay:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SCDAFBoost

- (void)setTotalDecay:(double)a3
{
  self->_totalDecay = a3;
}

- (double)totalDecay
{
  return self->_totalDecay;
}

- (void)setCurrentDecay:(double)a3
{
  self->_currentDecay = a3;
}

- (double)currentDecay
{
  return self->_currentDecay;
}

- (void)setBoostValue:(double)a3
{
  self->_boostValue = a3;
}

- (double)boostValue
{
  return self->_boostValue;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (SCDAFBoost)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boostKind"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boostValue"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentDecay"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDecay"];

  v10 = objc_alloc_init(SCDAFBoost);
  -[SCDAFBoost setType:](v10, "setType:", [v5 integerValue]);
  -[SCDAFBoost setKind:](v10, "setKind:", [v6 integerValue]);
  [v7 floatValue];
  [(SCDAFBoost *)v10 setBoostValue:v11];
  -[SCDAFBoost setCurrentDecay:](v10, "setCurrentDecay:", (double)[v8 longLongValue]);
  -[SCDAFBoost setTotalDecay:](v10, "setTotalDecay:", (double)[v9 longLongValue]);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t type = self->_type;
  id v6 = a3;
  v7 = [v4 numberWithInteger:type];
  [v6 encodeObject:v7 forKey:@"type"];

  v8 = [NSNumber numberWithInteger:self->_kind];
  [v6 encodeObject:v8 forKey:@"boostKind"];

  v9 = [NSNumber numberWithDouble:self->_boostValue];
  [v6 encodeObject:v9 forKey:@"boostValue"];

  v10 = [NSNumber numberWithDouble:self->_currentDecay];
  [v6 encodeObject:v10 forKey:@"currentDecay"];

  id v11 = [NSNumber numberWithDouble:self->_totalDecay];
  [v6 encodeObject:v11 forKey:@"totalDecay"];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCDAFBoost type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCDAFBoost kind](self, "kind"));
  [v3 setObject:v5 forKeyedSubscript:@"boostKind"];

  id v6 = NSNumber;
  [(SCDAFBoost *)self boostValue];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"boostValue"];

  v8 = NSNumber;
  [(SCDAFBoost *)self currentDecay];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"currentDecay"];

  v10 = NSNumber;
  [(SCDAFBoost *)self totalDecay];
  id v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"totalDecay"];

  v12 = [NSDictionary dictionaryWithDictionary:v3];

  return v12;
}

- (SCDAFBoost)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCDAFBoost;
  v5 = [(SCDAFBoost *)&v13 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"type"];
    v5->_int64_t type = [v6 integerValue];

    v7 = [v4 objectForKeyedSubscript:@"boostKind"];
    v5->_kind = [v7 integerValue];

    v8 = [v4 objectForKeyedSubscript:@"boostValue"];
    [v8 floatValue];
    v5->_boostValue = v9;

    v10 = [v4 objectForKeyedSubscript:@"currentDecay"];
    v5->_currentDecay = (double)[v10 longLongValue];

    id v11 = [v4 objectForKeyedSubscript:@"totalDecay"];
    v5->_totalDecay = (double)[v11 longLongValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)boostsArrayWithDictionaryRepresentation:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SCDAFBoost_boostsArrayWithDictionaryRepresentation___block_invoke;
  v8[3] = &unk_2654BA888;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __54__SCDAFBoost_boostsArrayWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SCDAFBoost alloc] initWithDictionaryRepresentation:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

+ (id)arrayDictionaryRepresentation:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__SCDAFBoost_arrayDictionaryRepresentation___block_invoke;
  v9[3] = &unk_2654BA860;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];

  return v7;
}

uint64_t __44__SCDAFBoost_arrayDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dictionaryRepresentation];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

@end