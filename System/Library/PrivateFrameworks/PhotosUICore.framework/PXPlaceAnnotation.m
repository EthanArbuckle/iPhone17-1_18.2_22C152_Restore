@interface PXPlaceAnnotation
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlaceAnnotation:(id)a3;
- (NSData)data;
- (NSDictionary)dictionary;
- (NSNumber)placeLevel;
- (NSString)placeLevelAsString;
- (NSString)placeName;
- (PXPlaceAnnotation)initWithData:(id)a3;
- (PXPlaceAnnotation)initWithPlaceLevel:(id)a3 placeName:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setPlaceLevel:(id)a3;
- (void)setPlaceName:(id)a3;
@end

@implementation PXPlaceAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_placeLevel, 0);
}

- (void)setPlaceName:(id)a3
{
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceLevel:(id)a3
{
}

- (NSNumber)placeLevel
{
  return self->_placeLevel;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(PXPlaceAnnotation *)self placeLevel];
    v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(PXPlaceAnnotation *)self placeName];
    v8 = (void *)v4[2];
    v4[2] = v7;
  }
  return v4;
}

- (unint64_t)hash
{
  v3 = [(PXPlaceAnnotation *)self placeLevel];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(PXPlaceAnnotation *)self placeName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqualToPlaceAnnotation:(id)a3
{
  uint64_t v4 = (PXPlaceAnnotation *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_7;
  }
  if (!v4) {
    goto LABEL_8;
  }
  unint64_t v6 = [(PXPlaceAnnotation *)v4 placeName];
  uint64_t v7 = [(PXPlaceAnnotation *)self placeName];

  if (v6 != v7)
  {
    v8 = [(PXPlaceAnnotation *)v5 placeName];
    v9 = [(PXPlaceAnnotation *)self placeName];
    int v10 = [v8 isEqualToString:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  v11 = [(PXPlaceAnnotation *)v5 placeLevel];
  v12 = [(PXPlaceAnnotation *)self placeLevel];

  if (v11 == v12
    || ([(PXPlaceAnnotation *)v5 placeLevel],
        v13 = objc_claimAutoreleasedReturnValue(),
        [(PXPlaceAnnotation *)self placeLevel],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v13 isEqualToNumber:v14],
        v14,
        v13,
        v15))
  {
LABEL_7:
    BOOL v16 = 1;
  }
  else
  {
LABEL_8:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXPlaceAnnotation *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PXPlaceAnnotation *)self isEqualToPlaceAnnotation:v5];

  return v6;
}

- (NSDictionary)dictionary
{
  v3 = [(PXPlaceAnnotation *)self placeLevel];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [(PXPlaceAnnotation *)self placeName];

    if (!v4) {
      goto LABEL_8;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v5 = [(PXPlaceAnnotation *)self placeLevel];

  if (v5)
  {
    BOOL v6 = [(PXPlaceAnnotation *)self placeLevel];
    [v4 setObject:v6 forKeyedSubscript:@"level"];
  }
  uint64_t v7 = [(PXPlaceAnnotation *)self placeName];

  if (v7)
  {
    v8 = [(PXPlaceAnnotation *)self placeName];
    [v4 setObject:v8 forKeyedSubscript:@"name"];
  }
LABEL_8:
  return (NSDictionary *)v4;
}

- (NSData)data
{
  v2 = [(PXPlaceAnnotation *)self dictionary];
  if (v2)
  {
    uint64_t v5 = 0;
    v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:100 options:0 error:&v5];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSString)placeLevelAsString
{
  v3 = [(PXPlaceAnnotation *)self placeLevel];

  if (v3)
  {
    uint64_t v4 = [(PXPlaceAnnotation *)self placeLevel];
    uint64_t v5 = [v4 integerValue];

    if (v5 >= 0x15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%u", v5);
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v6 = off_1E5DCE518[(int)v5];
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  return (NSString *)v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(PXPlaceAnnotation *)self placeLevel];
  uint64_t v5 = [(PXPlaceAnnotation *)self placeName];
  BOOL v6 = [v3 stringWithFormat:@"placeLevel: %@, placeName: %@", v4, v5];

  return v6;
}

- (PXPlaceAnnotation)initWithPlaceLevel:(id)a3 placeName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPlaceAnnotation;
  v9 = [(PXPlaceAnnotation *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeLevel, a3);
    objc_storeStrong((id *)&v10->_placeName, a4);
  }

  return v10;
}

- (PXPlaceAnnotation)initWithData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPlaceAnnotation;
  uint64_t v5 = [(PXPlaceAnnotation *)&v13 init];
  BOOL v6 = v5;
  if (v4 && v5)
  {
    id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = [v7 objectForKeyedSubscript:@"level"];
      placeLevel = v6->_placeLevel;
      v6->_placeLevel = (NSNumber *)v8;

      uint64_t v10 = [v7 objectForKeyedSubscript:@"name"];
      placeName = (PXPlaceAnnotation *)v6->_placeName;
      v6->_placeName = (NSString *)v10;
    }
    else
    {
      placeName = v6;
      BOOL v6 = 0;
    }
  }
  return v6;
}

@end