@interface PPNamedEntityRecord
+ (BOOL)supportsSecureCoding;
+ (id)algorithmForName:(id)a3;
+ (id)describeAlgorithm:(unint64_t)a3;
+ (id)describeChangeType:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedEntityRecord:(id)a3;
- (NSSet)featureNames;
- (NSString)extractionOsBuild;
- (PPNamedEntity)entity;
- (PPNamedEntityMetadata)metadata;
- (PPNamedEntityRecord)initWithCoder:(id)a3;
- (PPSource)source;
- (double)decayRate;
- (double)initialScore;
- (double)sentimentScore;
- (id)description;
- (id)featureValueForName:(id)a3;
- (id)identifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)algorithm;
- (unint64_t)hash;
- (unsigned)changeType;
- (unsigned)extractionAssetVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPNamedEntityRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_extractionOsBuild, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (NSString)extractionOsBuild
{
  return self->_extractionOsBuild;
}

- (PPSource)source
{
  return self->_source;
}

- (PPNamedEntity)entity
{
  return self->_entity;
}

- (id)identifier
{
  return [(PPNamedEntity *)self->_entity clusterIdentifier];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"algorithm"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t algorithm = self->_algorithm;
LABEL_3:
    uint64_t v7 = [v5 featureValueWithInt64:algorithm];
LABEL_10:
    v11 = (void *)v7;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"initialScore"])
  {
    v8 = (void *)MEMORY[0x1E4F1E950];
    float initialScore = self->_initialScore;
LABEL_8:
    double v10 = initialScore;
LABEL_9:
    uint64_t v7 = [v8 featureValueWithDouble:v10];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"decayRate"])
  {
    v8 = (void *)MEMORY[0x1E4F1E950];
    float initialScore = self->_decayRate;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"extractionOsBuild"])
  {
    uint64_t v7 = [MEMORY[0x1E4F1E950] featureValueWithString:self->_extractionOsBuild];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"extractionAssetVersion"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t algorithm = self->_extractionAssetVersion;
    goto LABEL_3;
  }
  if ([v4 isEqualToString:@"sentimentScore"])
  {
    v13 = (void *)MEMORY[0x1E4F1E950];
    [(PPNamedEntityRecord *)self sentimentScore];
    v8 = v13;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"changeType"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t algorithm = self->_changeType;
    goto LABEL_3;
  }
  if ([v4 hasPrefix:@"entity_"])
  {
    entity = self->_entity;
    v15 = @"entity_";
LABEL_28:
    v16 = objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v15, "length"));
    v11 = [entity featureValueForName:v16];

    goto LABEL_11;
  }
  if ([v4 hasPrefix:@"source_"])
  {
    entity = self->_source;
    v15 = @"source_";
    goto LABEL_28;
  }
  if ([v4 hasPrefix:@"meta_"])
  {
    entity = self->_metadata;
    v15 = @"meta_";
    goto LABEL_28;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSSet)featureNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PPNamedEntityRecord_featureNames__block_invoke;
  block[3] = &unk_1E550F7E0;
  block[4] = self;
  if (featureNames__pasOnceToken9 != -1) {
    dispatch_once(&featureNames__pasOnceToken9, block);
  }
  return (NSSet *)(id)featureNames__pasExprOnceResult_371;
}

void __35__PPNamedEntityRecord_featureNames__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F97350]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) featureNames];
  id v4 = [v3 allObjects];

  v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_374);

  v6 = [*(id *)(*(void *)(a1 + 32) + 16) featureNames];
  uint64_t v7 = [v6 allObjects];

  v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_376);

  v9 = [*(id *)(*(void *)(a1 + 32) + 48) featureNames];
  double v10 = [v9 allObjects];

  v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_378);

  v12 = (void *)MEMORY[0x192F97350]();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"algorithm", @"initialScore", @"decayRate", @"extractionOsBuild", @"extractionAssetVersion", @"changeType", @"sentimentScore", 0);
  v14 = [v13 setByAddingObjectsFromArray:v11];
  v15 = [v14 setByAddingObjectsFromArray:v5];
  uint64_t v16 = [v15 setByAddingObjectsFromArray:v8];

  v17 = (void *)featureNames__pasExprOnceResult_371;
  featureNames__pasExprOnceResult_371 = v16;
}

uint64_t __35__PPNamedEntityRecord_featureNames__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [@"meta_" stringByAppendingString:a2];
}

uint64_t __35__PPNamedEntityRecord_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [@"source_" stringByAppendingString:a2];
}

uint64_t __35__PPNamedEntityRecord_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [@"entity_" stringByAppendingString:a2];
}

- (BOOL)isEqualToNamedEntityRecord:(id)a3
{
  id v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_23;
  }
  entity = self->_entity;
  uint64_t v7 = (PPNamedEntity *)v4[1];
  if (entity == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = entity;
    BOOL v10 = [(PPNamedEntity *)v9 isEqual:v8];

    if (!v10) {
      goto LABEL_23;
    }
  }
  source = self->_source;
  v12 = (PPSource *)v5[2];
  if (source == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = source;
    BOOL v15 = [(PPSource *)v14 isEqual:v13];

    if (!v15) {
      goto LABEL_23;
    }
  }
  if (self->_algorithm != *((unsigned __int8 *)v5 + 44)
    || self->_initialScore != *((float *)v5 + 8)
    || self->_decayRate != *((float *)v5 + 9))
  {
    goto LABEL_23;
  }
  extractionOsBuild = self->_extractionOsBuild;
  v17 = (NSString *)v5[3];
  if (extractionOsBuild == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = extractionOsBuild;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_23;
    }
  }
  metadata = self->_metadata;
  v22 = (PPNamedEntityMetadata *)v5[6];
  if (metadata == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = metadata;
    BOOL v25 = [(PPNamedEntityMetadata *)v24 isEqual:v23];

    if (!v25) {
      goto LABEL_23;
    }
  }
  if (self->_extractionAssetVersion != *((_DWORD *)v5 + 10))
  {
LABEL_23:
    BOOL v26 = 0;
    goto LABEL_24;
  }
  BOOL v26 = self->_changeType == *((unsigned __int8 *)v5 + 45);
LABEL_24:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPNamedEntityRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && [(PPNamedEntityRecord *)self isEqualToNamedEntityRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PPNamedEntity *)self->_entity hash];
  unint64_t v4 = [(PPSource *)self->_source hash];
  uint64_t v5 = self->_algorithm - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  *(float *)&double v6 = self->_initialScore;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  uint64_t v8 = [v7 hash] - v5 + 32 * v5;

  *(float *)&double v9 = self->_decayRate;
  BOOL v10 = [NSNumber numberWithFloat:v9];
  uint64_t v11 = [v10 hash] - v8 + 32 * v8;

  NSUInteger v12 = [(NSString *)self->_extractionOsBuild hash];
  uint64_t v13 = self->_extractionAssetVersion - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  uint64_t v14 = self->_changeType - v13 + 32 * v13;
  return [(PPNamedEntityMetadata *)self->_metadata hash] - v14 + 32 * v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t v4 = [(PPSource *)self->_source bundleId];
  uint64_t v5 = +[PPNamedEntityRecord describeAlgorithm:self->_algorithm];
  double initialScore = self->_initialScore;
  uint64_t v7 = +[PPNamedEntityRecord describeChangeType:self->_changeType];
  uint64_t v8 = (void *)[v3 initWithFormat:@"<PPNamedEntityRecord src:%@ a:'%@' s:%f ct:%@ e:%@>", v4, v5, *(void *)&initialScore, v7, self->_entity];

  return v8;
}

- (PPNamedEntityMetadata)metadata
{
  return self->_metadata;
}

- (unsigned)extractionAssetVersion
{
  return self->_extractionAssetVersion;
}

- (double)sentimentScore
{
  +[PPSentimentScoreEncoder decodeSentimentScore:self->_bucketizedSentimentScore];
  return result;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (double)initialScore
{
  return self->_initialScore;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PPMutableNamedEntityRecord allocWithZone:](PPMutableNamedEntityRecord, "allocWithZone:") init];
  id v6 = [(PPNamedEntity *)self->_entity copyWithZone:a3];
  [(PPMutableNamedEntityRecord *)v5 setEntity:v6];

  [(PPMutableNamedEntityRecord *)v5 setSource:self->_source];
  [(PPMutableNamedEntityRecord *)v5 setAlgorithm:self->_algorithm];
  [(PPMutableNamedEntityRecord *)v5 setInitialScore:self->_initialScore];
  [(PPMutableNamedEntityRecord *)v5 setDecayRate:self->_decayRate];
  [(PPMutableNamedEntityRecord *)v5 setExtractionOsBuild:self->_extractionOsBuild];
  [(PPMutableNamedEntityRecord *)v5 setExtractionAssetVersion:self->_extractionAssetVersion];
  [(PPMutableNamedEntityRecord *)v5 setChangeType:self->_changeType];
  v5->super._bucketizedSentimentScore = self->_bucketizedSentimentScore;
  id v7 = [(PPNamedEntityMetadata *)self->_metadata copyWithZone:a3];
  [(PPMutableNamedEntityRecord *)v5 setMetadata:v7];

  return v5;
}

+ (id)describeChangeType:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid (%lu)", a3);
  }
  else {
    id v3 = off_1E550DB58[a3];
  }
  return v3;
}

+ (id)algorithmForName:(id)a3
{
  v11[16] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CoreNLP";
  v10[1] = @"Lookup Hints";
  v11[0] = &unk_1EDA6B098;
  v11[1] = &unk_1EDA6B080;
  v10[2] = @"Data Detectors";
  v10[3] = @"Custom Tagger";
  v11[2] = &unk_1EDA6B0C8;
  v11[3] = &unk_1EDA6B140;
  v10[4] = @"Core Routine";
  v10[5] = @"NSUA Structured Location";
  v11[4] = &unk_1EDA6B0B0;
  v11[5] = &unk_1EDA6B0E0;
  v10[6] = @"Trusted Location";
  v10[7] = @"Maps Interaction";
  v11[6] = &unk_1EDA6B0F8;
  v11[7] = &unk_1EDA6B110;
  v10[8] = @"Media Player Now Playing";
  v10[9] = @"EventKit Import";
  v11[8] = &unk_1EDA6B128;
  v11[9] = &unk_1EDA6B158;
  v10[10] = @"Photos Knowledge Graph";
  v10[11] = @"Parsec Donation";
  v11[10] = &unk_1EDA6B170;
  v11[11] = &unk_1EDA6B188;
  v10[12] = @"Podcasts Interaction";
  v10[13] = @"Contacts Import";
  v11[12] = &unk_1EDA6B1A0;
  v11[13] = &unk_1EDA6B1B8;
  v10[14] = @"Augmented Gazetteer";
  v10[15] = @"Knowledge Graph";
  v11[14] = &unk_1EDA6B1E8;
  v11[15] = &unk_1EDA6B200;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v11 forKeys:v10 count:16];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &unk_1EDA6B278;
  }
  id v8 = v7;

  return v8;
}

+ (id)describeAlgorithm:(unint64_t)a3
{
  if (a3 - 1 >= 0x11)
  {
    id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"unknown (%lu)", a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E550DAD0[a3 - 1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  entity = self->_entity;
  id v7 = a3;
  [v7 encodeObject:entity forKey:@"ent"];
  [v7 encodeObject:self->_source forKey:@"src"];
  [v7 encodeInt32:self->_algorithm forKey:@"alg"];
  *(float *)&double v5 = self->_initialScore;
  [v7 encodeFloat:@"score" forKey:v5];
  *(float *)&double v6 = self->_decayRate;
  [v7 encodeFloat:@"dec" forKey:v6];
  [v7 encodeObject:self->_extractionOsBuild forKey:@"bld"];
  [v7 encodeInt64:self->_extractionAssetVersion forKey:@"ast"];
  [v7 encodeInt32:self->_changeType forKey:@"cty"];
  [v7 encodeInt32:self->_bucketizedSentimentScore forKey:@"snt"];
  [v7 encodeObject:self->_metadata forKey:@"met"];
}

- (PPNamedEntityRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PPNamedEntityRecord;
  double v5 = [(PPNamedEntityRecord *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ent"];
    entity = v5->_entity;
    v5->_entity = (PPNamedEntity *)v7;

    double v9 = PPGetSourceInternPool();
    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"src"];
    uint64_t v11 = [v9 intern:v10];
    source = v5->_source;
    v5->_source = (PPSource *)v11;

    v5->_uint64_t algorithm = [v4 decodeInt32ForKey:@"alg"];
    [v4 decodeFloatForKey:@"score"];
    v5->_double initialScore = v13;
    [v4 decodeFloatForKey:@"dec"];
    v5->_decayRate = v14;
    BOOL v15 = PPGetStringInternPool();
    uint64_t v16 = [v4 decodeObjectOfClass:v6 forKey:@"bld"];
    uint64_t v17 = [v15 intern:v16];
    extractionOsBuild = v5->_extractionOsBuild;
    v5->_extractionOsBuild = (NSString *)v17;

    v5->_extractionAssetVersion = [v4 decodeInt64ForKey:@"ast"];
    v5->_changeType = [v4 decodeInt32ForKey:@"cty"];
    v5->_bucketizedSentimentScore = [v4 decodeInt32ForKey:@"snt"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"met"];
    metadata = v5->_metadata;
    v5->_metadata = (PPNamedEntityMetadata *)v19;
  }
  return v5;
}

@end