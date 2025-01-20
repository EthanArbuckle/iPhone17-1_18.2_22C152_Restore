@interface ATXLocationEnteredTrigger
+ (BOOL)supportsSecureCoding;
- (ATXLocationEnteredTrigger)initWithCoder:(id)a3;
- (ATXLocationEnteredTrigger)initWithLocationIdentifier:(id)a3 namedLOI:(unint64_t)a4;
- (NSString)locationIdentifier;
- (int64_t)type;
- (unint64_t)namedLOI;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXLocationEnteredTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 1;
}

- (ATXLocationEnteredTrigger)initWithLocationIdentifier:(id)a3 namedLOI:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXLocationEnteredTrigger;
  v8 = [(ATXLocationEnteredTrigger *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationIdentifier, a3);
    v9->_namedLOI = a4;
    v10 = v9;
  }

  return v9;
}

- (ATXLocationEnteredTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"namedLOI"];

  id v7 = [(ATXLocationEnteredTrigger *)self initWithLocationIdentifier:v5 namedLOI:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  locationIdentifier = self->_locationIdentifier;
  id v5 = a3;
  [v5 encodeObject:locationIdentifier forKey:@"location"];
  [v5 encodeInteger:self->_namedLOI forKey:@"namedLOI"];
}

- (unint64_t)namedLOI
{
  return self->_namedLOI;
}

- (NSString)locationIdentifier
{
  return self->_locationIdentifier;
}

- (void).cxx_destruct
{
}

@end