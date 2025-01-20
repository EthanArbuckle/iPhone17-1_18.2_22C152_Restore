@interface NTKWorldClockComplication
+ (BOOL)supportsSecureCoding;
+ (id)_allCities;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (int64_t)compareComplication:(id)a3 toComplication:(id)a4;
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (NTKWorldClockComplication)initWithCoder:(id)a3;
- (WorldClockCity)city;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)description;
- (id)localizedDetailText;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)_handleAddedFromFaceSharing;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKWorldClockComplication

+ (int64_t)compareComplication:(id)a3 toComplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _allCities];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke;
  aBlock[3] = &unk_1E62C96A8;
  id v19 = v8;
  id v9 = v8;
  v10 = (uint64_t (**)(void *, id))_Block_copy(aBlock);
  uint64_t v11 = v10[2](v10, v6);
  uint64_t v12 = v10[2](v10, v7);
  if (v11 == v12)
  {
    unint64_t v13 = [v6 complicationType];
    unint64_t v14 = [v7 complicationType];
    uint64_t v15 = -1;
    if (v13 >= v14) {
      uint64_t v15 = 1;
    }
    if (v13 == v14) {
      int64_t v16 = 0;
    }
    else {
      int64_t v16 = v15;
    }
  }
  else if (v11 < v12)
  {
    int64_t v16 = -1;
  }
  else
  {
    int64_t v16 = 1;
  }

  return v16;
}

uint64_t __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = -3;
  }
  else if ([v3 complicationType] == 12)
  {
    uint64_t v4 = -1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v3 city];
      id v6 = [v5 alCityId];
    }
    else
    {
      id v6 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v3 complicationDescriptor];
      v8 = [v7 userInfo];
      id v9 = [v8 objectForKey:@"cityID"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v9 = 0;
      }

      id v6 = v9;
    }
    v10 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke_2;
    v14[3] = &unk_1E62C9680;
    id v15 = v6;
    id v11 = v6;
    uint64_t v12 = [v10 indexOfObjectPassingTest:v14];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v4 = -2;
    }
    else {
      uint64_t v4 = v12;
    }
  }
  return v4;
}

uint64_t __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 alCityId];
  id v7 = v6;
  if (v6 == *(void **)(a1 + 32)) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = objc_msgSend(v6, "isEqual:");
  }
  *a4 = v8;

  return v8;
}

+ (id)_allCities
{
  v2 = +[NTKWorldClockManager sharedManager];
  uint64_t v3 = [v2 cities];
  if (!v3 || (uint64_t v4 = (void *)v3, v5 = [v2 checkIfCitiesModified], v4, v5)) {
    [v2 loadCities];
  }
  id v6 = [v2 cities];

  return v6;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [a1 _allCities];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [objc_alloc((Class)a1) initWithComplicationType:a3];
        objc_storeStrong((id *)(v11 + 32), v10);
        uint64_t v12 = [(id)v11 _generateUniqueIdentifier];
        unint64_t v13 = *(void **)(v11 + 8);
        *(void *)(v11 + 8) = v12;

        [v5 addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v8 = 0;
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(NTKWorldClockComplication *)self city];
    uint64_t v6 = [v4 city];
    char v7 = [v5 isEqual:v6];

    if (v7) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (id)_generateUniqueIdentifier
{
  uint64_t v3 = NSString;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  int v5 = [v4 stringValue];
  uint64_t v6 = [(WorldClockCity *)self->_city alCityId];
  char v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (id)localizedDetailText
{
  uint64_t v3 = [(NTKWorldClockComplication *)self city];
  id v4 = [v3 name];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"79129411-2004-4B40-89F6-B0E14651B97F"];
    int v7 = [v5 supportsCapability:v6];

    if (v7)
    {
      id v8 = [NSString stringWithFormat:@"%@", v4];
    }
    else
    {
      id v8 = v4;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = NTKComplicationTypeLocalizedLabelText([(NTKComplication *)self complicationType]);
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKWorldClockComplication;
  id v4 = [(NTKComplication *)&v8 description];
  int v5 = [(WorldClockCity *)self->_city alCityId];
  uint64_t v6 = [v3 stringWithFormat:@"%@ (%d)", v4, objc_msgSend(v5, "intValue")];

  return v6;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  id v4 = NSString;
  int v5 = [(WorldClockCity *)self->_city alCityId];
  uint64_t v6 = objc_msgSend(v4, "stringWithFormat:", @"%d", objc_msgSend(v5, "intValue"));

  return v6;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 calendarDateMatchesContext:v6]
    && [v5 timeZoneMatchesContext:v6])
  {
    int v7 = [v5 localeMatchesContext:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplication;
  id v4 = [(NTKComplication *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_city);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKWorldClockComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKWorldClockComplication;
  id v5 = [(NTKComplication *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntForKey:@"WorldClockComplicationCityKey"];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F78BB8]) initWithALCityIdentifier:v6];
    city = v5->_city;
    v5->_city = (WorldClockCity *)v7;

    if (!v5->_city) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil city", objc_opt_class() format];
    }
    uint64_t v9 = [(NTKWorldClockComplication *)v5 _generateUniqueIdentifier];
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplication;
  id v4 = a3;
  [(NTKComplication *)&v6 encodeWithCoder:v4];
  id v5 = [(WorldClockCity *)self->_city alCityId];
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v5, "intValue"), @"WorldClockComplicationCityKey");
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplication;
  id v4 = a3;
  [(NTKComplication *)&v6 _addKeysToJSONDictionary:v4];
  id v5 = [(WorldClockCity *)self->_city alCityId];
  [v4 setObject:v5 forKeyedSubscript:@"city ID"];
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKWorldClockComplication;
  uint64_t v7 = [(NTKComplication *)&v12 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    objc_super v8 = [v6 objectForKeyedSubscript:@"city ID"];
    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for key '%@'", @"city ID" format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be number - invalid value: %@", @"city ID", v8 format];
    }
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F78BB8]), "initWithALCityIdentifier:", objc_msgSend(v8, "intValue"));
    v10 = (void *)v7[4];
    v7[4] = v9;

    if (!v7[4]) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"invalid value for key '%@': %@", @"city ID", v8 format];
    }
  }
  return v7;
}

- (void)_handleAddedFromFaceSharing
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "WorldClockManager can not add any city.", v1, 2u);
}

- (WorldClockCity)city
{
  return self->_city;
}

- (void).cxx_destruct
{
}

@end