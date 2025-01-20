@interface CLSFaceInformation
+ (id)_traitsFromTraitsPropertyListRepresentation:(id)a3;
- (BOOL)faceIsGood;
- (BOOL)faceIsOk;
- (BOOL)faceSizeIsGood;
- (BOOL)isHiddenPerson;
- (BOOL)isKnownPerson;
- (CLSFaceInformation)initWithDictionaryRepresentation:(id)a3;
- (NSArray)traits;
- (double)faceQuality;
- (double)faceSize;
- (id)_initWithFaceSize:(double)a3 faceQuality:(double)a4 isKnownPerson:(BOOL)a5 isHiddenPerson:(BOOL)a6 faceSizeIsGood:(BOOL)a7 faceIsGood:(BOOL)a8 faceIsOk:(BOOL)a9 traits:(id)a10;
- (id)_propertyListRepresentationOfTraits;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initForHiddenPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8;
- (id)initForKnownPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8;
- (id)initForUnknownPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8;
@end

@implementation CLSFaceInformation

- (void).cxx_destruct
{
}

- (NSArray)traits
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)faceIsOk
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (BOOL)faceIsGood
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (BOOL)faceSizeIsGood
{
  return *((unsigned char *)self + 8) & 1;
}

- (BOOL)isHiddenPerson
{
  return self->_isHiddenPerson;
}

- (BOOL)isKnownPerson
{
  return self->_isKnownPerson;
}

- (double)faceQuality
{
  return self->_faceQuality;
}

- (double)faceSize
{
  return self->_faceSize;
}

- (id)_propertyListRepresentationOfTraits
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_traits, "count"));
  traits = self->_traits;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CLSFaceInformation__propertyListRepresentationOfTraits__block_invoke;
  v7[3] = &unk_26544F578;
  id v5 = v3;
  id v8 = v5;
  [(NSArray *)traits enumerateObjectsUsingBlock:v7];

  return v5;
}

void __57__CLSFaceInformation__propertyListRepresentationOfTraits__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 propertyListRepresentation];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)dictionaryRepresentation
{
  v14[8] = *MEMORY[0x263EF8340];
  v13[0] = @"faceSize";
  id v3 = [NSNumber numberWithDouble:self->_faceSize];
  v14[0] = v3;
  v13[1] = @"faceQuality";
  v4 = [NSNumber numberWithDouble:self->_faceQuality];
  v14[1] = v4;
  v13[2] = @"isKnownPerson";
  id v5 = [NSNumber numberWithBool:self->_isKnownPerson];
  v14[2] = v5;
  v13[3] = @"isHiddenPerson";
  v6 = [NSNumber numberWithBool:self->_isHiddenPerson];
  v14[3] = v6;
  v13[4] = @"faceSizeIsGood";
  v7 = [NSNumber numberWithBool:*((unsigned char *)self + 8) & 1];
  v14[4] = v7;
  v13[5] = @"faceIsGood";
  id v8 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 8) >> 1) & 1];
  v14[5] = v8;
  v13[6] = @"faceIsOk";
  v9 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 8) >> 2) & 1];
  v14[6] = v9;
  v13[7] = @"traits";
  v10 = [(CLSFaceInformation *)self _propertyListRepresentationOfTraits];
  v14[7] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[CLSFaceInformation] size %.3f, quality %.3f", *(void *)&self->_faceSize, *(void *)&self->_faceQuality];
}

- (id)_initWithFaceSize:(double)a3 faceQuality:(double)a4 isKnownPerson:(BOOL)a5 isHiddenPerson:(BOOL)a6 faceSizeIsGood:(BOOL)a7 faceIsGood:(BOOL)a8 faceIsOk:(BOOL)a9 traits:(id)a10
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  id v19 = a10;
  v25.receiver = self;
  v25.super_class = (Class)CLSFaceInformation;
  v20 = [(CLSFaceInformation *)&v25 init];
  v21 = v20;
  if (v20)
  {
    v20->_faceSize = a3;
    v20->_faceQuality = a4;
    v20->_isKnownPerson = a5;
    v20->_isHiddenPerson = a6;
    if (v12) {
      char v22 = 2;
    }
    else {
      char v22 = 0;
    }
    if (v11) {
      char v23 = 4;
    }
    else {
      char v23 = 0;
    }
    *((unsigned char *)v20 + 8) = v22 | a7 | v23 | *((unsigned char *)v20 + 8) & 0xF8;
    objc_storeStrong((id *)&v20->_traits, a10);
  }

  return v21;
}

- (CLSFaceInformation)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"faceSize"];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"faceQuality"];
  [v8 doubleValue];
  double v10 = v9;

  BOOL v11 = [v4 objectForKeyedSubscript:@"isKnownPerson"];
  uint64_t v12 = [v11 BOOLValue];

  v13 = [v4 objectForKeyedSubscript:@"isHiddenPerson"];
  uint64_t v14 = [v13 BOOLValue];

  v15 = [v4 objectForKeyedSubscript:@"faceSizeIsGood"];
  uint64_t v16 = [v15 BOOLValue];

  v17 = [v4 objectForKeyedSubscript:@"faceIsGood"];
  uint64_t v18 = [v17 BOOLValue];

  id v19 = [v4 objectForKeyedSubscript:@"faceIsOk"];
  uint64_t v20 = [v19 BOOLValue];

  v21 = objc_opt_class();
  char v22 = [v4 objectForKeyedSubscript:@"traits"];

  char v23 = [v21 _traitsFromTraitsPropertyListRepresentation:v22];

  v24 = [(CLSFaceInformation *)self _initWithFaceSize:v12 faceQuality:v14 isKnownPerson:v16 isHiddenPerson:v18 faceSizeIsGood:v20 faceIsGood:v23 faceIsOk:v7 traits:v10];
  return v24;
}

- (id)initForUnknownPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8
{
  return [(CLSFaceInformation *)self _initWithFaceSize:0 faceQuality:0 isKnownPerson:a5 isHiddenPerson:a6 faceSizeIsGood:a7 faceIsGood:a8 faceIsOk:a3 traits:a4];
}

- (id)initForHiddenPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8
{
  return [(CLSFaceInformation *)self _initWithFaceSize:0 faceQuality:1 isKnownPerson:a5 isHiddenPerson:a6 faceSizeIsGood:a7 faceIsGood:a8 faceIsOk:a3 traits:a4];
}

- (id)initForKnownPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8
{
  return [(CLSFaceInformation *)self _initWithFaceSize:1 faceQuality:0 isKnownPerson:a5 isHiddenPerson:a6 faceSizeIsGood:a7 faceIsGood:a8 faceIsOk:a3 traits:a4];
}

+ (id)_traitsFromTraitsPropertyListRepresentation:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__CLSFaceInformation__traitsFromTraitsPropertyListRepresentation___block_invoke;
  v8[3] = &unk_26544F550;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __66__CLSFaceInformation__traitsFromTraitsPropertyListRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F14DE8];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithPropertyListRepresentation:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    id v5 = v6;
  }
}

@end