@interface WFAQIScaleGradient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScaleGradient:(id)a3;
- (NSArray)stops;
- (WFAQIScaleGradient)initWithCoder:(id)a3;
- (WFAQIScaleGradient)initWithStops:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAQIScaleGradient

- (WFAQIScaleGradient)initWithStops:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFAQIScaleGradient;
  v5 = [(WFAQIScaleGradient *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stops = v5->_stops;
    v5->_stops = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFAQIScaleGradient *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WFAQIScaleGradient *)self isEqualToScaleGradient:v4];
  }

  return v5;
}

- (BOOL)isEqualToScaleGradient:(id)a3
{
  id v4 = [a3 stops];
  BOOL v5 = [(WFAQIScaleGradient *)self stops];
  char v6 = [v4 isEqualToArray:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WFAQIScaleGradient alloc];
  BOOL v5 = [(WFAQIScaleGradient *)self stops];
  char v6 = [(WFAQIScaleGradient *)v4 initWithStops:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAQIScaleGradient *)self stops];
  [v4 encodeObject:v5 forKey:@"WFAQIScaleGradientStopsKey"];
}

- (WFAQIScaleGradient)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__onceToken_2;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__onceToken_2, &__block_literal_global_24);
  }
  char v6 = [v5 decodeObjectOfClasses:initWithCoder__classes_1 forKey:@"WFAQIScaleGradientStopsKey"];

  v7 = (void *)[v6 copy];
  v8 = [(WFAQIScaleGradient *)self initWithStops:v7];

  return v8;
}

uint64_t __36__WFAQIScaleGradient_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = initWithCoder__classes_1;
  initWithCoder__classes_1 = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

- (id)description
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(WFAQIScaleGradient *)self stops];
  uint64_t v4 = [v2 stringWithFormat:@"<WFAQIScaleGradient stops: %@", v3];

  return v4;
}

- (NSArray)stops
{
  return self->_stops;
}

- (void).cxx_destruct
{
}

@end