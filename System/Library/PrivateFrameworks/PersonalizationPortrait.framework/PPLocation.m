@interface PPLocation
+ (BOOL)supportsSecureCoding;
+ (id)clusterIdentifierFromPlacemark:(id)a3;
+ (id)describeCategory:(unsigned __int16)a3;
+ (unsigned)categoryForDescription:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocation:(id)a3;
- (CLPlacemark)placemark;
- (NSSet)featureNames;
- (NSString)clusterIdentifier;
- (PPLocation)initWithCoder:(id)a3;
- (PPLocation)initWithPlacemark:(id)a3 category:(unsigned __int16)a4 mostRelevantRecord:(id)a5;
- (PPLocationRecord)mostRelevantRecord;
- (id)customizedDescription;
- (id)description;
- (id)featureValueForName:(id)a3;
- (unint64_t)hash;
- (unsigned)category;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRelevantRecord, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (PPLocationRecord)mostRelevantRecord
{
  return self->_mostRelevantRecord;
}

- (unsigned)category
{
  return self->_category;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"category_"])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1E950], "featureValueWithInt64:", -[PPLocation category](self, "category"));
    goto LABEL_9;
  }
  if ([v4 hasPrefix:@"placemark_"])
  {
    v6 = [(PPLocation *)self placemark];
    v7 = [v4 substringFromIndex:objc_msgSend(@"placemark_", "length")];
    uint64_t v8 = objc_msgSend(v6, "pp_featureValueForName:", v7);
LABEL_7:
    v5 = (void *)v8;

    goto LABEL_9;
  }
  if ([v4 hasPrefix:@"record_"])
  {
    v6 = [(PPLocation *)self mostRelevantRecord];
    v7 = [v4 substringFromIndex:objc_msgSend(@"record_", "length")];
    uint64_t v8 = [v6 featureValueForName:v7];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (NSSet)featureNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PPLocation_featureNames__block_invoke;
  block[3] = &unk_1E550F7E0;
  block[4] = self;
  if (featureNames__pasOnceToken8 != -1) {
    dispatch_once(&featureNames__pasOnceToken8, block);
  }
  return (NSSet *)(id)featureNames__pasExprOnceResult_3788;
}

void __26__PPLocation_featureNames__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F97350]();
  v3 = (void *)MEMORY[0x192F97350]();
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"category_", 0);
  v5 = [*(id *)(a1 + 32) placemark];
  v6 = objc_msgSend(v5, "pp_featureNames");
  v7 = [v6 allObjects];
  uint64_t v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_3790);

  v9 = [*(id *)(a1 + 32) mostRelevantRecord];
  v10 = [v9 featureNames];
  v11 = [v10 allObjects];
  v12 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_201);

  v13 = [v4 setByAddingObjectsFromArray:v8];
  uint64_t v14 = [v13 setByAddingObjectsFromArray:v12];

  v15 = (void *)featureNames__pasExprOnceResult_3788;
  featureNames__pasExprOnceResult_3788 = v14;
}

uint64_t __26__PPLocation_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [@"record_" stringByAppendingString:a2];
}

uint64_t __26__PPLocation_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [@"placemark_" stringByAppendingString:a2];
}

- (unint64_t)hash
{
  v3 = [(CLPlacemark *)self->_placemark name];
  uint64_t v4 = [v3 hash];

  v5 = [(CLPlacemark *)self->_placemark thoroughfare];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(CLPlacemark *)self->_placemark subThoroughfare];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  v9 = [(CLPlacemark *)self->_placemark locality];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  v11 = [(CLPlacemark *)self->_placemark subLocality];
  uint64_t v12 = [v11 hash] - v10 + 32 * v10;

  v13 = [(CLPlacemark *)self->_placemark administrativeArea];
  uint64_t v14 = [v13 hash] - v12 + 32 * v12;

  v15 = [(CLPlacemark *)self->_placemark subAdministrativeArea];
  uint64_t v16 = [v15 hash] - v14 + 32 * v14;

  v17 = [(CLPlacemark *)self->_placemark postalCode];
  uint64_t v18 = [v17 hash] - v16 + 32 * v16;

  v19 = [(CLPlacemark *)self->_placemark country];
  uint64_t v20 = [v19 hash] - v18 + 32 * v18;

  return self->_category - v20 + 32 * v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PPLocation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPLocation *)self isEqualToLocation:v5];

  return v6;
}

- (id)customizedDescription
{
  placemark = self->_placemark;
  uint64_t v4 = &stru_1EDA56F70;
  if (placemark)
  {
    v5 = [(CLPlacemark *)placemark postalAddress];
    BOOL v6 = (void *)[v5 mutableCopy];

    v7 = [v6 street];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      v9 = objc_opt_new();
      uint64_t v10 = [(CLPlacemark *)self->_placemark subThoroughfare];

      if (v10)
      {
        v11 = [(CLPlacemark *)self->_placemark subThoroughfare];
        [v9 appendString:v11];
      }
      uint64_t v12 = [(CLPlacemark *)self->_placemark thoroughfare];

      if (v12)
      {
        id v13 = [NSString alloc];
        uint64_t v14 = [(CLPlacemark *)self->_placemark thoroughfare];
        v15 = (void *)[v13 initWithFormat:@" %@", v14];
        [v9 appendString:v15];
      }
      [v6 setStreet:v9];
    }
    uint64_t v16 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v6 addCountryName:0];
    if ([v16 length])
    {
      v17 = v16;
    }
    else
    {
      v17 = [(CLPlacemark *)self->_placemark name];
    }
    uint64_t v18 = v17;
    if (v17) {
      v19 = v17;
    }
    else {
      v19 = &stru_1EDA56F70;
    }
    uint64_t v4 = v19;
  }
  return v4;
}

- (BOOL)isEqualToLocation:(id)a3
{
  uint64_t v4 = (PPLocation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v21 = 1;
    goto LABEL_48;
  }
  if (!v4) {
    goto LABEL_47;
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark name];
  uint64_t v7 = [(CLPlacemark *)v5->_placemark name];
  if (v6 | v7)
  {
    v9 = (void *)v7;
    if (!v6 || !v7) {
      goto LABEL_46;
    }
    int v22 = [(id)v6 isEqualToString:v7];

    if (!v22) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark thoroughfare];
  uint64_t v8 = [(CLPlacemark *)v5->_placemark thoroughfare];
  if (v6 | v8)
  {
    v9 = (void *)v8;
    if (!v6 || !v8) {
      goto LABEL_46;
    }
    int v10 = [(id)v6 isEqualToString:v8];

    if (!v10) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark subThoroughfare];
  uint64_t v11 = [(CLPlacemark *)v5->_placemark subThoroughfare];
  if (v6 | v11)
  {
    v9 = (void *)v11;
    if (!v6 || !v11) {
      goto LABEL_46;
    }
    int v12 = [(id)v6 isEqualToString:v11];

    if (!v12) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark locality];
  uint64_t v13 = [(CLPlacemark *)v5->_placemark locality];
  if (v6 | v13)
  {
    v9 = (void *)v13;
    if (!v6 || !v13) {
      goto LABEL_46;
    }
    int v23 = [(id)v6 isEqualToString:v13];

    if (!v23) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark subLocality];
  uint64_t v14 = [(CLPlacemark *)v5->_placemark subLocality];
  if (v6 | v14)
  {
    v9 = (void *)v14;
    if (!v6 || !v14) {
      goto LABEL_46;
    }
    int v15 = [(id)v6 isEqualToString:v14];

    if (!v15) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark administrativeArea];
  uint64_t v16 = [(CLPlacemark *)v5->_placemark administrativeArea];
  if (v6 | v16)
  {
    v9 = (void *)v16;
    if (!v6 || !v16) {
      goto LABEL_46;
    }
    int v24 = [(id)v6 isEqualToString:v16];

    if (!v24) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark subAdministrativeArea];
  uint64_t v17 = [(CLPlacemark *)v5->_placemark subAdministrativeArea];
  if (v6 | v17)
  {
    v9 = (void *)v17;
    if (!v6 || !v17) {
      goto LABEL_46;
    }
    int v25 = [(id)v6 isEqualToString:v17];

    if (!v25) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark postalCode];
  uint64_t v18 = [(CLPlacemark *)v5->_placemark postalCode];
  if (v6 | v18)
  {
    v9 = (void *)v18;
    if (!v6 || !v18) {
      goto LABEL_46;
    }
    int v26 = [(id)v6 isEqualToString:v18];

    if (!v26) {
      goto LABEL_47;
    }
  }
  uint64_t v6 = [(CLPlacemark *)self->_placemark country];
  uint64_t v19 = [(CLPlacemark *)v5->_placemark country];
  if (v6 | v19)
  {
    v9 = (void *)v19;
    if (v6 && v19)
    {
      int v20 = [(id)v6 isEqualToString:v19];

      if (v20) {
        goto LABEL_24;
      }
LABEL_47:
      BOOL v21 = 0;
      goto LABEL_48;
    }
LABEL_46:

    goto LABEL_47;
  }
LABEL_24:
  BOOL v21 = self->_category == v5->_category;
LABEL_48:

  return v21;
}

- (id)description
{
  id v3 = [NSString alloc];
  placemark = self->_placemark;
  v5 = +[PPLocation describeCategory:self->_category];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<PPLocation p:'%@' c:%@ r:%@>", placemark, v5, self->_mostRelevantRecord];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  placemark = self->_placemark;
  id v5 = a3;
  [v5 encodeObject:placemark forKey:@"pmk"];
  [v5 encodeInt32:self->_category forKey:@"cat"];
  [v5 encodeObject:self->_mostRelevantRecord forKey:@"mrr"];
}

- (PPLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pmk"];
  unsigned __int16 v6 = [v4 decodeInt32ForKey:@"cat"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mrr"];

  if (v5)
  {
    self = [(PPLocation *)self initWithPlacemark:v5 category:v6 mostRelevantRecord:v7];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PPLocation)initWithPlacemark:(id)a3 category:(unsigned __int16)a4 mostRelevantRecord:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PPLocation.m", 147, @"Invalid parameter not satisfying: %@", @"placemark" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PPLocation;
  int v12 = [(PPLocation *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_placemark, a3);
    v13->_category = a4;
    objc_storeStrong((id *)&v13->_mostRelevantRecord, a5);
    uint64_t v14 = +[PPLocation clusterIdentifierFromPlacemark:v10];
    clusterIdentifier = v13->_clusterIdentifier;
    v13->_clusterIdentifier = (NSString *)v14;
  }
  return v13;
}

+ (id)clusterIdentifierFromPlacemark:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x192F97350]();
  id v5 = [v3 name];
  uint64_t v6 = [v5 length];

  uint64_t v7 = [v3 subThoroughfare];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [v3 thoroughfare];

      if (v9)
      {
        uint64_t v8 = [v3 name];
        v27[0] = v8;
        id v10 = [v3 subThoroughfare];
        v27[1] = v10;
        id v11 = [v3 thoroughfare];
        v27[2] = v11;
        int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
        uint64_t v13 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @" ");

LABEL_11:
        uint64_t v8 = (void *)v13;
        goto LABEL_12;
      }
    }
    uint64_t v14 = [v3 thoroughfare];

    uint64_t v15 = [v3 name];
    uint64_t v8 = (void *)v15;
    if (!v14) {
      goto LABEL_12;
    }
    v26[0] = v15;
    id v10 = [v3 thoroughfare];
    v26[1] = v10;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v17 = v26;
LABEL_10:
    id v11 = [v16 arrayWithObjects:v17 count:2];
    uint64_t v13 = objc_msgSend(v11, "_pas_componentsJoinedByString:", @" ");
    goto LABEL_11;
  }
  if (!v7) {
    goto LABEL_12;
  }
  objc_super v18 = [v3 thoroughfare];

  if (v18)
  {
    uint64_t v8 = [v3 subThoroughfare];
    id v10 = objc_msgSend(v3, "thoroughfare", v8);
    v25[1] = v10;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v17 = v25;
    goto LABEL_10;
  }
  uint64_t v8 = 0;
LABEL_12:
  if (![v8 length])
  {
    uint64_t v19 = [v3 thoroughfare];

    uint64_t v8 = (void *)v19;
  }
  if (![v8 length])
  {
    uint64_t v20 = [v3 locality];

    uint64_t v8 = (void *)v20;
  }
  if (![v8 length])
  {
    uint64_t v21 = [v3 administrativeArea];

    uint64_t v8 = (void *)v21;
  }
  int v22 = (void *)MEMORY[0x192F97350]();
  int v23 = [v8 lowercaseString];

  return v23;
}

+ (unsigned)categoryForDescription:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"restaurant"])
  {
    unsigned __int16 v4 = 2;
  }
  else if ([v3 isEqualToString:@"organization"])
  {
    unsigned __int16 v4 = 1;
  }
  else if ([v3 isEqualToString:@"activity location"])
  {
    unsigned __int16 v4 = 3;
  }
  else if ([v3 isEqualToString:@"tourist attraction"])
  {
    unsigned __int16 v4 = 4;
  }
  else if ([v3 isEqualToString:@"work"])
  {
    unsigned __int16 v4 = 6;
  }
  else if ([v3 isEqualToString:@"home"])
  {
    unsigned __int16 v4 = 5;
  }
  else if ([v3 isEqualToString:@"dynamic"])
  {
    unsigned __int16 v4 = 7;
  }
  else
  {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

+ (id)describeCategory:(unsigned __int16)a3
{
  if (a3 > 7u) {
    return @"restaurant";
  }
  else {
    return off_1E550E6F0[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end