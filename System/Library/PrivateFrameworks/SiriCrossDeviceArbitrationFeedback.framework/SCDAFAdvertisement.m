@interface SCDAFAdvertisement
+ (BOOL)supportsSecureCoding;
+ (id)advertisementsArrayWithDictionaryRepresentation:(id)a3;
+ (id)arrayDictionaryRepresentation:(id)a3;
- (NSNumber)advertHash;
- (NSString)identifier;
- (SCDAFAdvertisement)initWithCoder:(id)a3;
- (SCDAFAdvertisement)initWithDictionaryRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)confidence;
- (unint64_t)deviceClass;
- (unint64_t)deviceGroup;
- (unint64_t)goodnessScore;
- (unint64_t)productType;
- (unint64_t)tieBreaker;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertHash:(id)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setDeviceClass:(unint64_t)a3;
- (void)setDeviceGroup:(unint64_t)a3;
- (void)setDeviceGroupWithNumber:(id)a3;
- (void)setGoodnessScore:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setTieBreaker:(unint64_t)a3;
@end

@implementation SCDAFAdvertisement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertHash, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDeviceGroup:(unint64_t)a3
{
  self->_deviceGroup = a3;
}

- (unint64_t)deviceGroup
{
  return self->_deviceGroup;
}

- (void)setGoodnessScore:(unint64_t)a3
{
  self->_goodnessScore = a3;
}

- (unint64_t)goodnessScore
{
  return self->_goodnessScore;
}

- (void)setTieBreaker:(unint64_t)a3
{
  self->_tieBreaker = a3;
}

- (unint64_t)tieBreaker
{
  return self->_tieBreaker;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setAdvertHash:(id)a3
{
}

- (NSNumber)advertHash
{
  return self->_advertHash;
}

- (void)setDeviceClass:(unint64_t)a3
{
  self->_deviceClass = a3;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setIdentifier:(id)a3
{
}

- (SCDAFAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceClass"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertHash"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tieBreaker"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goodnessScore"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceGroup"];

  v13 = objc_alloc_init(SCDAFAdvertisement);
  [(SCDAFAdvertisement *)v13 setIdentifier:v5];
  -[SCDAFAdvertisement setConfidence:](v13, "setConfidence:", [v6 integerValue]);
  -[SCDAFAdvertisement setDeviceClass:](v13, "setDeviceClass:", [v7 integerValue]);
  [(SCDAFAdvertisement *)v13 setAdvertHash:v8];
  -[SCDAFAdvertisement setProductType:](v13, "setProductType:", [v9 integerValue]);
  -[SCDAFAdvertisement setTieBreaker:](v13, "setTieBreaker:", [v10 integerValue]);
  -[SCDAFAdvertisement setGoodnessScore:](v13, "setGoodnessScore:", [v11 integerValue]);
  -[SCDAFAdvertisement setDeviceGroup:](v13, "setDeviceGroup:", [v12 integerValue]);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_confidence];
  [v5 encodeObject:v6 forKey:@"confidence"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_deviceClass];
  [v5 encodeObject:v7 forKey:@"deviceClass"];

  [v5 encodeObject:self->_advertHash forKey:@"advertHash"];
  v8 = [NSNumber numberWithUnsignedInteger:self->_productType];
  [v5 encodeObject:v8 forKey:@"productType"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_tieBreaker];
  [v5 encodeObject:v9 forKey:@"tieBreaker"];

  v10 = [NSNumber numberWithUnsignedInteger:self->_goodnessScore];
  [v5 encodeObject:v10 forKey:@"goodnessScore"];

  id v11 = [NSNumber numberWithUnsignedInteger:self->_deviceGroup];
  [v5 encodeObject:v11 forKey:@"deviceGroup"];
}

- (void)setDeviceGroupWithNumber:(id)a3
{
  self->_deviceGroup = [a3 integerValue];
}

- (NSString)identifier
{
  v3 = NSString;
  id v4 = [(SCDAFAdvertisement *)self advertHash];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement confidence](self, "confidence"));
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceClass](self, "deviceClass"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement productType](self, "productType"));
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceGroup](self, "deviceGroup"));
  v9 = [v3 stringWithFormat:@"%@-%@-%@-%@-%@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(SCDAFAdvertisement *)self identifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(SCDAFAdvertisement *)self identifier];
    [v3 setObject:v6 forKeyedSubscript:@"identifier"];
  }
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement confidence](self, "confidence"));
  [v3 setObject:v7 forKeyedSubscript:@"confidence"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceClass](self, "deviceClass"));
  [v3 setObject:v8 forKeyedSubscript:@"deviceClass"];

  v9 = [(SCDAFAdvertisement *)self advertHash];
  [v3 setObject:v9 forKeyedSubscript:@"advertHash"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement productType](self, "productType"));
  [v3 setObject:v10 forKeyedSubscript:@"productType"];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement tieBreaker](self, "tieBreaker"));
  [v3 setObject:v11 forKeyedSubscript:@"tieBreaker"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement goodnessScore](self, "goodnessScore"));
  [v3 setObject:v12 forKeyedSubscript:@"goodnessScore"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceGroup](self, "deviceGroup"));
  [v3 setObject:v13 forKeyedSubscript:@"deviceGroup"];

  v14 = [NSDictionary dictionaryWithDictionary:v3];

  return v14;
}

- (SCDAFAdvertisement)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SCDAFAdvertisement;
  uint64_t v5 = [(SCDAFAdvertisement *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length]) {
      objc_storeStrong((id *)&v5->_identifier, v6);
    }
    v7 = [v4 objectForKeyedSubscript:@"confidence"];
    v5->_confidence = [v7 integerValue];

    v8 = [v4 objectForKeyedSubscript:@"deviceClass"];
    v5->_deviceClass = [v8 integerValue];

    v9 = [v4 objectForKeyedSubscript:@"advertHash"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"advertHash"];
      advertHash = v5->_advertHash;
      v5->_advertHash = (NSNumber *)v11;
    }
    v13 = [v4 objectForKeyedSubscript:@"productType"];
    v5->_productType = [v13 integerValue];

    v14 = [v4 objectForKeyedSubscript:@"tieBreaker"];
    v5->_tieBreaker = [v14 integerValue];

    v15 = [v4 objectForKeyedSubscript:@"goodnessScore"];
    v5->_goodnessScore = [v15 integerValue];

    v16 = [v4 objectForKeyedSubscript:@"deviceGroup"];
    v5->_deviceGroup = [v16 integerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)arrayDictionaryRepresentation:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__SCDAFAdvertisement_arrayDictionaryRepresentation___block_invoke;
  v9[3] = &unk_2654BA8B0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];

  return v7;
}

uint64_t __52__SCDAFAdvertisement_arrayDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dictionaryRepresentation];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

+ (id)advertisementsArrayWithDictionaryRepresentation:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__SCDAFAdvertisement_advertisementsArrayWithDictionaryRepresentation___block_invoke;
  v8[3] = &unk_2654BA888;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __70__SCDAFAdvertisement_advertisementsArrayWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SCDAFAdvertisement alloc] initWithDictionaryRepresentation:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

@end