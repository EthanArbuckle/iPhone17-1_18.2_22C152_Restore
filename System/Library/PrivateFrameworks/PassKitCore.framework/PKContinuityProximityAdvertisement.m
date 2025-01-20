@interface PKContinuityProximityAdvertisement
+ (BOOL)supportsSecureCoding;
+ (id)advertisementWithDictionary:(id)a3;
- (PKContinuityProximityAdvertisement)initWithCoder:(id)a3;
- (PKContinuityProximityAdvertisement)initWithType:(unint64_t)a3;
- (id)_dictionaryRepresentation;
- (id)dictionaryRepresentation;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKContinuityProximityAdvertisement

- (PKContinuityProximityAdvertisement)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKContinuityProximityAdvertisement;
  result = [(PKContinuityProximityAdvertisement *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)advertisementWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 PKStringForKey:@"type"];
  objc_super v5 = v4;
  if (v4 && PKContinuityProximityVerifierTypeFromString(v4)) {
    v6 = [[PKContinuityProximityBLEAdvertisement alloc] initWithDictionary:v3];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [(PKContinuityProximityAdvertisement *)self _dictionaryRepresentation];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  if (self->_type == 1) {
    objc_super v5 = @"BLE";
  }
  else {
    objc_super v5 = 0;
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKContinuityProximityAdvertisement *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dict"];
}

- (PKContinuityProximityAdvertisement)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"dict"];

  if (v10) {
    v11 = +[PKContinuityProximityAdvertisement advertisementWithDictionary:v10];
  }
  else {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

@end