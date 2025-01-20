@interface PPLocationRecord
+ (BOOL)supportsSecureCoding;
+ (id)algorithmForName:(id)a3;
+ (id)describeAlgorithm:(unsigned __int16)a3;
+ (id)sharedAmbiguousRecord;
- (BOOL)isAmbiguous;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocationRecord:(id)a3;
- (NSArray)contextualNamedEntities;
- (NSSet)featureNames;
- (NSString)extractionOsBuild;
- (NSUUID)uuid;
- (PPLocation)location;
- (PPLocationRecord)initWithCoder:(id)a3;
- (PPSource)source;
- (double)decayRate;
- (double)initialScore;
- (double)sentimentScore;
- (id)description;
- (id)featureValueForName:(id)a3;
- (id)identifier;
- (id)initAmbiguousRecord;
- (id)init_;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)algorithm;
- (unsigned)extractionAssetVersion;
- (void)encodeWithCoder:(id)a3;
- (void)supplementFieldsWithClusterID:(id)a3 locationWithLatLong:(id)a4;
@end

@implementation PPLocationRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionOsBuild, 0);
  objc_storeStrong((id *)&self->_contextualNamedEntities, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (BOOL)isAmbiguous
{
  return self->_isAmbiguous;
}

- (NSString)extractionOsBuild
{
  return self->_extractionOsBuild;
}

- (NSArray)contextualNamedEntities
{
  return self->_contextualNamedEntities;
}

- (id)identifier
{
  return [(PPLocation *)self->_location clusterIdentifier];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"location_"])
  {
    v5 = [(PPLocationRecord *)self location];
    v6 = @"location_";
LABEL_5:
    v7 = objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v6, "length"));
    v8 = [v5 featureValueForName:v7];

    goto LABEL_6;
  }
  if ([v4 hasPrefix:@"source_"])
  {
    v5 = [(PPLocationRecord *)self source];
    v6 = @"source_";
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"extractionAssetVersion"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t extractionAssetVersion = self->_extractionAssetVersion;
LABEL_18:
    uint64_t v17 = [v10 featureValueWithInt64:extractionAssetVersion];
LABEL_19:
    v8 = (void *)v17;
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"extractionOsBuild"])
  {
    v12 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v13 = [(PPLocationRecord *)self extractionOsBuild];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = &stru_1EDA56F70;
    }
    uint64_t v16 = [v12 featureValueWithString:v15];
LABEL_25:
    v8 = (void *)v16;

    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"algorithm"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t extractionAssetVersion = self->_algorithm;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"contextualNamedEntities"])
  {
    v18 = (void *)MEMORY[0x1E4F1E950];
    if (self->_contextualNamedEntities) {
      contextualNamedEntities = self->_contextualNamedEntities;
    }
    else {
      contextualNamedEntities = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v14 = [MEMORY[0x1E4F1E9F0] sequenceWithStringArray:contextualNamedEntities];
    uint64_t v16 = [v18 featureValueWithSequence:v14];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"decayRate"])
  {
    v20 = (void *)MEMORY[0x1E4F1E950];
    float decayRate = self->_decayRate;
LABEL_30:
    double v22 = decayRate;
LABEL_31:
    uint64_t v17 = [v20 featureValueWithDouble:v22];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"initialScore"])
  {
    v20 = (void *)MEMORY[0x1E4F1E950];
    float decayRate = self->_initialScore;
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"sentimentScore"])
  {
    v23 = (void *)MEMORY[0x1E4F1E950];
    [(PPLocationRecord *)self sentimentScore];
    v20 = v23;
    goto LABEL_31;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (NSSet)featureNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PPLocationRecord_featureNames__block_invoke;
  block[3] = &unk_1E550F7E0;
  block[4] = self;
  if (featureNames__pasOnceToken14 != -1) {
    dispatch_once(&featureNames__pasOnceToken14, block);
  }
  return (NSSet *)(id)featureNames__pasExprOnceResult_302;
}

void __32__PPLocationRecord_featureNames__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F97350]();
  v3 = (void *)MEMORY[0x192F97350]();
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"extractionOsBuild", @"extractionAssetVersion", @"contextualNamedEntities", @"decayRate", @"initialScore", @"sentimentScore", @"algorithm", 0);
  v5 = [*(id *)(a1 + 32) location];
  v6 = [v5 featureNames];
  v7 = [v6 allObjects];
  v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_304);

  v9 = [*(id *)(a1 + 32) source];
  v10 = [v9 featureNames];
  v11 = [v10 allObjects];
  v12 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_306);

  uint64_t v13 = [v4 setByAddingObjectsFromArray:v12];
  uint64_t v14 = [v13 setByAddingObjectsFromArray:v8];

  v15 = (void *)featureNames__pasExprOnceResult_302;
  featureNames__pasExprOnceResult_302 = v14;
}

uint64_t __32__PPLocationRecord_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [@"source_" stringByAppendingString:a2];
}

uint64_t __32__PPLocationRecord_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [@"location_" stringByAppendingString:a2];
}

- (id)description
{
  id v3 = [NSString alloc];
  uuid = self->_uuid;
  location = self->_location;
  v6 = [(PPSource *)self->_source bundleId];
  v7 = +[PPLocationRecord describeAlgorithm:self->_algorithm];
  double initialScore = self->_initialScore;
  double decayRate = self->_decayRate;
  [(PPLocationRecord *)self sentimentScore];
  v11 = (void *)[v3 initWithFormat:@"<PPLocationRecord u:%@ l:%@ src:%@ a:'%@' is:%f dr:%f ss:%f cne:%@ eos:%@ eav:%u>", uuid, location, v6, v7, *(void *)&initialScore, *(void *)&decayRate, v10, self->_contextualNamedEntities, self->_extractionOsBuild, self->_extractionAssetVersion];

  return v11;
}

- (unsigned)extractionAssetVersion
{
  return self->_extractionAssetVersion;
}

- (double)sentimentScore
{
  return (double)self->_bucketizedSentimentScore * 0.00787401575;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (double)initialScore
{
  return self->_initialScore;
}

- (unsigned)algorithm
{
  return self->_algorithm;
}

- (PPSource)source
{
  return self->_source;
}

- (PPLocation)location
{
  return self->_location;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uuid hash];
  unint64_t v4 = [(PPLocation *)self->_location hash] - v3 + 32 * v3;
  unint64_t v5 = [(PPSource *)self->_source hash];
  uint64_t v6 = self->_algorithm - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  *(float *)&double v7 = self->_initialScore;
  v8 = [NSNumber numberWithFloat:v7];
  uint64_t v9 = [v8 hash] - v6 + 32 * v6;

  *(float *)&double v10 = self->_decayRate;
  v11 = [NSNumber numberWithFloat:v10];
  uint64_t v12 = [v11 hash] - v9 + 32 * v9;

  uint64_t v13 = self->_bucketizedSentimentScore - v12 + 32 * v12;
  uint64_t v14 = [(NSArray *)self->_contextualNamedEntities hash] - v13 + 32 * v13;
  NSUInteger v15 = [(NSString *)self->_extractionOsBuild hash];
  return self->_extractionAssetVersion - (v15 - v14 + 32 * v14) + 32 * (v15 - v14 + 32 * v14);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PPLocationRecord *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && [(PPLocationRecord *)self isEqualToLocationRecord:v5];

  return v6;
}

- (BOOL)isEqualToLocationRecord:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (!v4) {
    goto LABEL_31;
  }
  uuid = self->_uuid;
  uint64_t v6 = *((void *)v4 + 1);
  if (uuid)
  {
    if (!v6 || !-[NSUUID isEqual:](uuid, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (v6)
  {
    goto LABEL_31;
  }
  location = self->_location;
  uint64_t v8 = *((void *)v4 + 2);
  if (location)
  {
    if (!v8 || !-[PPLocation isEqual:](location, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (v8)
  {
    goto LABEL_31;
  }
  uint64_t v9 = self->_source;
  unint64_t v10 = (unint64_t)*((id *)v4 + 3);
  if ((unint64_t)v9 | v10)
  {
    v11 = (void *)v10;
    if (!v9 || !v10) {
      goto LABEL_30;
    }
    BOOL v12 = [(PPSource *)v9 isEqualToSource:v10];

    if (!v12) {
      goto LABEL_31;
    }
  }
  if (self->_algorithm != v4[32]
    || self->_initialScore != *((float *)v4 + 9)
    || self->_decayRate != *((float *)v4 + 10)
    || self->_bucketizedSentimentScore != v4[68])
  {
    goto LABEL_31;
  }
  uint64_t v9 = self->_contextualNamedEntities;
  unint64_t v13 = (unint64_t)*((id *)v4 + 6);
  if ((unint64_t)v9 | v13)
  {
    v11 = (void *)v13;
    if (!v9 || !v13) {
      goto LABEL_30;
    }
    BOOL v17 = [(PPSource *)v9 isEqualToArray:v13];

    if (!v17) {
      goto LABEL_31;
    }
  }
  uint64_t v9 = self->_extractionOsBuild;
  unint64_t v14 = (unint64_t)*((id *)v4 + 7);
  if ((unint64_t)v9 | v14)
  {
    v11 = (void *)v14;
    if (v9 && v14)
    {
      int v15 = [(PPSource *)v9 isEqualToString:v14];

      if (v15) {
        goto LABEL_25;
      }
LABEL_31:
      BOOL v16 = 0;
      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }
LABEL_25:
  BOOL v16 = self->_extractionAssetVersion == *((_DWORD *)v4 + 16);
LABEL_32:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v7 = a3;
  [v7 encodeObject:uuid forKey:@"uuid"];
  [v7 encodeObject:self->_location forKey:@"loc"];
  [v7 encodeObject:self->_source forKey:@"src"];
  [v7 encodeInt32:self->_algorithm forKey:@"alg"];
  *(float *)&double v5 = self->_initialScore;
  [v7 encodeFloat:@"iscr" forKey:v5];
  *(float *)&double v6 = self->_decayRate;
  [v7 encodeFloat:@"dr" forKey:v6];
  [v7 encodeInt32:self->_bucketizedSentimentScore forKey:@"bss"];
  [v7 encodeObject:self->_contextualNamedEntities forKey:@"cne"];
  [v7 encodeObject:self->_extractionOsBuild forKey:@"eob"];
  [v7 encodeInt64:self->_extractionAssetVersion forKey:@"eav"];
}

- (PPLocationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PPLocationRecord;
  double v5 = [(PPLocationRecord *)&v24 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loc"];
  location = v5->_location;
  v5->_location = (PPLocation *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"src"];
  source = v5->_source;
  v5->_source = (PPSource *)v10;

  v5->_algorithm = [v4 decodeInt32ForKey:@"alg"];
  [v4 decodeFloatForKey:@"iscr"];
  v5->_double initialScore = v12;
  [v4 decodeFloatForKey:@"dr"];
  v5->_double decayRate = v13;
  v5->_bucketizedSentimentScore = [v4 decodeInt32ForKey:@"bss"];
  unint64_t v14 = (void *)MEMORY[0x192F97350]();
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  BOOL v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"cne"];
  contextualNamedEntities = v5->_contextualNamedEntities;
  v5->_contextualNamedEntities = (NSArray *)v18;

  uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eob"];
  extractionOsBuild = v5->_extractionOsBuild;
  v5->_extractionOsBuild = (NSString *)v20;

  v5->_uint64_t extractionAssetVersion = [v4 decodeInt64ForKey:@"eav"];
  if (!v5->_uuid) {
    goto LABEL_6;
  }
  if (v5->_location && v5->_source) {
LABEL_5:
  }
    double v22 = v5;
  else {
LABEL_6:
  }
    double v22 = 0;

  return v22;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v5 = [+[PPMutableLocationRecord allocWithZone:](PPMutableLocationRecord, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSUUID *)self->_uuid copyWithZone:a3];
  [(PPMutableLocationRecord *)v5 setUuid:v6];

  id v7 = [(PPLocation *)self->_location copyWithZone:a3];
  [(PPMutableLocationRecord *)v5 setLocation:v7];

  [(PPMutableLocationRecord *)v5 setSource:self->_source];
  [(PPMutableLocationRecord *)v5 setAlgorithm:self->_algorithm];
  [(PPMutableLocationRecord *)v5 setInitialScore:self->_initialScore];
  [(PPMutableLocationRecord *)v5 setDecayRate:self->_decayRate];
  uint64_t v8 = (void *)[(NSArray *)self->_contextualNamedEntities copyWithZone:a3];
  [(PPMutableLocationRecord *)v5 setContextualNamedEntities:v8];

  [(PPMutableLocationRecord *)v5 setExtractionOsBuild:self->_extractionOsBuild];
  [(PPMutableLocationRecord *)v5 setExtractionAssetVersion:self->_extractionAssetVersion];
  v5->super._bucketizedSentimentScore = self->_bucketizedSentimentScore;
  return v5;
}

+ (id)algorithmForName:(id)a3
{
  v11[12] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CoreNLP";
  v10[1] = @"Lookup Hints";
  v11[0] = &unk_1EDA6B3B0;
  v11[1] = &unk_1EDA6B3C8;
  v10[2] = @"Data Detectors";
  v10[3] = @"Custom Tagger";
  v11[2] = &unk_1EDA6B3E0;
  v11[3] = &unk_1EDA6B3F8;
  v10[4] = @"Core Routine";
  v10[5] = @"NSUA Structured Location";
  v11[4] = &unk_1EDA6B410;
  v11[5] = &unk_1EDA6B428;
  v10[6] = @"Trusted Location";
  v10[7] = @"Maps Interaction";
  v11[6] = &unk_1EDA6B440;
  v11[7] = &unk_1EDA6B458;
  v10[8] = @"EventKit Import";
  v10[9] = @"Photos Knowledge Graph";
  v11[8] = &unk_1EDA6B470;
  v11[9] = &unk_1EDA6B488;
  v10[10] = @"Augmented Gazetteer";
  v10[11] = @"Knowledge Graph";
  v11[10] = &unk_1EDA6B4A0;
  v11[11] = &unk_1EDA6B4B8;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  double v5 = [v3 dictionaryWithObjects:v11 forKeys:v10 count:12];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &unk_1EDA6B4D0;
  }
  id v8 = v7;

  return v8;
}

+ (id)describeAlgorithm:(unsigned __int16)a3
{
  if ((a3 - 1) >= 0xC)
  {
    id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"unknown (%u)", a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E550E730[(unsigned __int16)(a3 - 1)];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedAmbiguousRecord
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PPLocationRecord_sharedAmbiguousRecord__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAmbiguousRecord__pasOnceToken9 != -1) {
    dispatch_once(&sharedAmbiguousRecord__pasOnceToken9, block);
  }
  v2 = (void *)sharedAmbiguousRecord__pasExprOnceResult;
  return v2;
}

void __41__PPLocationRecord_sharedAmbiguousRecord__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F97350]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initAmbiguousRecord];
  id v4 = (void *)sharedAmbiguousRecord__pasExprOnceResult;
  sharedAmbiguousRecord__pasExprOnceResult = v3;
}

- (void)supplementFieldsWithClusterID:(id)a3 locationWithLatLong:(id)a4
{
  id v44 = a3;
  v40 = self;
  location = self->_location;
  id v7 = a4;
  id v8 = [(PPLocation *)location placemark];
  uint64_t v9 = (uint64_t)v7;
  v39 = v7;
  if (!v7)
  {
    uint64_t v9 = [v8 location];
  }
  v41 = (void *)v9;
  v38 = [v8 name];
  uint64_t v10 = v44;
  if (v38) {
    uint64_t v10 = v8;
  }
  v43 = [v10 name];
  v37 = [v8 thoroughfare];
  v11 = v44;
  if (v37) {
    v11 = v8;
  }
  v42 = [v11 thoroughfare];
  v36 = [v8 subThoroughfare];
  float v12 = v44;
  if (v36) {
    float v12 = v8;
  }
  v31 = [v12 subThoroughfare];
  v35 = [v8 locality];
  float v13 = v44;
  if (v35) {
    float v13 = v8;
  }
  v30 = [v13 locality];
  v33 = [v8 subLocality];
  unint64_t v14 = v44;
  if (v33) {
    unint64_t v14 = v8;
  }
  id v15 = [v14 subLocality];
  v32 = [v8 administrativeArea];
  uint64_t v16 = v44;
  if (v32) {
    uint64_t v16 = v8;
  }
  v29 = [v16 administrativeArea];
  v28 = [v8 subAdministrativeArea];
  BOOL v17 = [v8 postalCode];
  uint64_t v18 = [v8 ISOcountryCode];
  v19 = [v8 country];
  uint64_t v20 = [v8 inlandWater];
  v21 = [v8 ocean];
  double v22 = [v8 areasOfInterest];
  v34 = +[PPLocationStore placemarkWithLocation:v41 name:v43 thoroughfare:v42 subthoroughFare:v31 locality:v30 subLocality:v15 administrativeArea:v29 subAdministrativeArea:v28 postalCode:v17 countryCode:v18 country:v19 inlandWater:v20 ocean:v21 areasOfInterest:v22];

  if (!v39) {
  v23 = [PPLocation alloc];
  }
  uint64_t v24 = [(PPLocation *)v40->_location category];
  v25 = [(PPLocation *)v40->_location mostRelevantRecord];
  uint64_t v26 = [(PPLocation *)v23 initWithPlacemark:v34 category:v24 mostRelevantRecord:v25];
  v27 = v40->_location;
  v40->_location = (PPLocation *)v26;
}

- (id)initAmbiguousRecord
{
  v3.receiver = self;
  v3.super_class = (Class)PPLocationRecord;
  id result = [(PPLocationRecord *)&v3 init];
  if (result) {
    *((unsigned char *)result + 69) = 1;
  }
  return result;
}

- (id)init_
{
  v3.receiver = self;
  v3.super_class = (Class)PPLocationRecord;
  return [(PPLocationRecord *)&v3 init];
}

@end