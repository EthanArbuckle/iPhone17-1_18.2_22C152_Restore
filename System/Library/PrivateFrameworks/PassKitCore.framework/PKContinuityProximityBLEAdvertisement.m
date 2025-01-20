@interface PKContinuityProximityBLEAdvertisement
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (PKContinuityProximityBLEAdvertisement)initWithDictionary:(id)a3;
- (PKContinuityProximityBLEAdvertisement)initWithIdentifier:(id)a3;
- (id)_dictionaryRepresentation;
@end

@implementation PKContinuityProximityBLEAdvertisement

- (PKContinuityProximityBLEAdvertisement)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKContinuityProximityBLEAdvertisement;
  v6 = [(PKContinuityProximityAdvertisement *)&v9 initWithType:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (PKContinuityProximityBLEAdvertisement)initWithDictionary:(id)a3
{
  v4 = [a3 PKStringForKey:@"identifier"];
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKContinuityProximityBLEAdvertisement;
    id v5 = [(PKContinuityProximityAdvertisement *)&v9 initWithType:1];
    v6 = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_identifier, v4);
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_dictionaryRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)PKContinuityProximityBLEAdvertisement;
  v3 = [(PKContinuityProximityAdvertisement *)&v5 _dictionaryRepresentation];
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end