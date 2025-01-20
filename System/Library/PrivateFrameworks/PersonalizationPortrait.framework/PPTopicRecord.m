@interface PPTopicRecord
+ (BOOL)supportsSecureCoding;
+ (id)algorithmForName:(id)a3;
+ (id)describeAlgorithm:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTopicRecord:(id)a3;
- (BOOL)isLocal;
- (NSSet)featureNames;
- (NSString)extractionOsBuild;
- (PPSource)source;
- (PPTopic)topic;
- (PPTopicMetadata)metadata;
- (PPTopicRecord)initWithCoder:(id)a3;
- (double)decayRate;
- (double)initialScore;
- (double)sentimentScore;
- (id)description;
- (id)featureValueForName:(id)a3;
- (id)identifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)algorithm;
- (unint64_t)hash;
- (unsigned)extractionAssetVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPTopicRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_extractionOsBuild, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

- (PPTopicMetadata)metadata
{
  return self->_metadata;
}

- (unsigned)extractionAssetVersion
{
  return self->_extractionAssetVersion;
}

- (NSString)extractionOsBuild
{
  return self->_extractionOsBuild;
}

- (BOOL)isLocal
{
  return self->_isLocal;
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

- (PPSource)source
{
  return self->_source;
}

- (PPTopic)topic
{
  return self->_topic;
}

- (id)identifier
{
  v2 = [(PPTopic *)self->_topic clusterIdentifier];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = objc_opt_new();
    id v4 = [v5 UUIDString];
  }
  return v4;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"algorithm"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t algorithm = self->_algorithm;
LABEL_3:
    uint64_t v7 = [v5 featureValueWithInt64:algorithm];
LABEL_9:
    v10 = (void *)v7;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"initialScore"])
  {
    v8 = (void *)MEMORY[0x1E4F1E950];
    double initialScore = self->_initialScore;
LABEL_8:
    uint64_t v7 = [v8 featureValueWithDouble:initialScore];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"decayRate"])
  {
    v8 = (void *)MEMORY[0x1E4F1E950];
    double initialScore = self->_decayRate;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"isLocal"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t algorithm = self->_isLocal;
    goto LABEL_3;
  }
  if ([v4 isEqualToString:@"extractionAssetVersion"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t algorithm = self->_extractionAssetVersion;
    goto LABEL_3;
  }
  if ([v4 isEqualToString:@"extractionOsBuild"])
  {
    uint64_t v7 = [MEMORY[0x1E4F1E950] featureValueWithString:self->_extractionOsBuild];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"sentimentScore"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t algorithm = self->_bucketizedSentimentScore;
    goto LABEL_3;
  }
  if ([v4 hasPrefix:@"topic_"])
  {
    topic = self->_topic;
    v13 = @"topic_";
LABEL_27:
    v14 = objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v13, "length"));
    v10 = [topic featureValueForName:v14];

    goto LABEL_10;
  }
  if ([v4 hasPrefix:@"meta_"])
  {
    topic = self->_metadata;
    v13 = @"meta_";
    goto LABEL_27;
  }
  if ([v4 hasPrefix:@"source_"])
  {
    topic = self->_source;
    v13 = @"source_";
    goto LABEL_27;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (NSSet)featureNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PPTopicRecord_featureNames__block_invoke;
  block[3] = &unk_1E550F7E0;
  block[4] = self;
  if (featureNames__pasOnceToken9_8398 != -1) {
    dispatch_once(&featureNames__pasOnceToken9_8398, block);
  }
  return (NSSet *)(id)featureNames__pasExprOnceResult_222;
}

void __29__PPTopicRecord_featureNames__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F97350]();
  v3 = (void *)MEMORY[0x192F97350]();
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"algorithm", @"initialScore", @"decayRate", @"isLocal", @"extractionAssetVersion", @"sentimentScore", @"extractionOsBuild", 0);
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) featureNames];
  v6 = [v5 allObjects];

  uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_225);

  v8 = [*(id *)(*(void *)(a1 + 32) + 72) featureNames];
  v9 = [v8 allObjects];

  v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_227);

  v11 = [*(id *)(*(void *)(a1 + 32) + 16) featureNames];
  v12 = [v11 allObjects];

  v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_229);

  v14 = [v4 setByAddingObjectsFromArray:v7];
  v15 = [v14 setByAddingObjectsFromArray:v10];
  uint64_t v16 = [v15 setByAddingObjectsFromArray:v13];

  v17 = (void *)featureNames__pasExprOnceResult_222;
  featureNames__pasExprOnceResult_222 = v16;
}

uint64_t __29__PPTopicRecord_featureNames__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [@"source_" stringByAppendingString:a2];
}

uint64_t __29__PPTopicRecord_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [@"meta_" stringByAppendingString:a2];
}

uint64_t __29__PPTopicRecord_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [@"topic_" stringByAppendingString:a2];
}

- (double)sentimentScore
{
  +[PPSentimentScoreEncoder decodeSentimentScore:self->_bucketizedSentimentScore];
  return result;
}

- (BOOL)isEqualToTopicRecord:(id)a3
{
  id v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_22;
  }
  topic = self->_topic;
  uint64_t v7 = (PPTopic *)v4[1];
  if (topic == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = topic;
    BOOL v10 = [(PPTopic *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_22:
      char v23 = 0;
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
      goto LABEL_22;
    }
  }
  if (self->_algorithm != v5[3]
    || self->_initialScore != *((double *)v5 + 4)
    || self->_decayRate != *((double *)v5 + 5)
    || self->_isLocal != *((unsigned __int8 *)v5 + 48))
  {
    goto LABEL_22;
  }
  extractionOsBuild = self->_extractionOsBuild;
  v17 = (NSString *)v5[7];
  if (extractionOsBuild == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = extractionOsBuild;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_22;
    }
  }
  if (self->_extractionAssetVersion != *((_DWORD *)v5 + 16)
    || self->_bucketizedSentimentScore != *((unsigned __int8 *)v5 + 80))
  {
    goto LABEL_22;
  }
  v21 = self->_metadata;
  v22 = v21;
  if (v21 == v5[9]) {
    char v23 = 1;
  }
  else {
    char v23 = -[PPTopicMetadata isEqual:](v21, "isEqual:");
  }

LABEL_23:
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPTopicRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPTopicRecord *)self isEqualToTopicRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PPTopic *)self->_topic hash];
  unint64_t v4 = [(PPSource *)self->_source hash];
  unint64_t v5 = self->_algorithm - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  BOOL v6 = [NSNumber numberWithDouble:self->_initialScore];
  uint64_t v7 = [v6 hash] - v5 + 32 * v5;

  v8 = [NSNumber numberWithDouble:self->_decayRate];
  uint64_t v9 = [v8 hash] - v7 + 32 * v7;

  uint64_t v10 = self->_isLocal - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_extractionOsBuild hash];
  uint64_t v12 = self->_extractionAssetVersion - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
  return [(PPTopicMetadata *)self->_metadata hash] - v12 + 32 * v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  topic = self->_topic;
  unint64_t v5 = [(PPSource *)self->_source bundleId];
  uint64_t v6 = +[PPTopicRecord describeAlgorithm:self->_algorithm];
  uint64_t v7 = (void *)v6;
  v8 = @"true";
  if (!self->_isLocal) {
    v8 = @"false";
  }
  uint64_t v9 = (void *)[v3 initWithFormat:@"<PPTopicRecord t:%@ src:%@ a:'%@' is:%f dr:%f l:%@ eob:%@ eav:%u m:%@>", topic, v5, v6, *(void *)&self->_initialScore, *(void *)&self->_decayRate, v8, self->_extractionOsBuild, self->_extractionAssetVersion, self->_metadata];

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (unsigned char *)objc_opt_new();
  [v4 setTopic:self->_topic];
  [v4 setSource:self->_source];
  [v4 setAlgorithm:self->_algorithm];
  [v4 setInitialScore:self->_initialScore];
  [v4 setDecayRate:self->_decayRate];
  [v4 setIsLocal:self->_isLocal];
  [v4 setExtractionOsBuild:self->_extractionOsBuild];
  [v4 setExtractionAssetVersion:self->_extractionAssetVersion];
  v4[80] = self->_bucketizedSentimentScore;
  [v4 setMetadata:self->_metadata];
  return v4;
}

+ (id)algorithmForName:(id)a3
{
  v11[11] = *MEMORY[0x1E4F143B8];
  v10[0] = @"ContextKit";
  v10[1] = @"Siri Donation";
  v11[0] = &unk_1EDA6B500;
  v11[1] = &unk_1EDA6B518;
  v10[2] = @"Lookup Hints";
  v10[3] = @"Named Entity";
  v11[2] = &unk_1EDA6B530;
  v11[3] = &unk_1EDA6B548;
  v10[4] = @"Photos Knowledge Graph";
  v10[5] = @"High Level Topic Extraction";
  v11[4] = &unk_1EDA6B560;
  v11[5] = &unk_1EDA6B578;
  v10[6] = @"Parsec Donation";
  v10[7] = @"Podcasts Interaction";
  v11[6] = &unk_1EDA6B590;
  v11[7] = &unk_1EDA6B5A8;
  v10[8] = @"HealthKit Import";
  v10[9] = @"Augmented Gazetteer";
  v11[8] = &unk_1EDA6B5C0;
  v11[9] = &unk_1EDA6B5D8;
  v10[10] = @"Knowledge Graph";
  v11[10] = &unk_1EDA6B5F0;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  unint64_t v5 = [v3 dictionaryWithObjects:v11 forKeys:v10 count:11];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = &unk_1EDA6B608;
  }
  id v8 = v7;

  return v8;
}

+ (id)describeAlgorithm:(unint64_t)a3
{
  if (a3 - 1 >= 0xB)
  {
    id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"unknown (%lu)", a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E550F800[a3 - 1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  topic = self->_topic;
  id v5 = a3;
  [v5 encodeObject:topic forKey:@"top"];
  [v5 encodeObject:self->_source forKey:@"src"];
  [v5 encodeInt32:LODWORD(self->_algorithm) forKey:@"alg"];
  [v5 encodeDouble:@"score" forKey:self->_initialScore];
  [v5 encodeDouble:@"dec" forKey:self->_decayRate];
  [v5 encodeBool:self->_isLocal forKey:@"loc"];
  [v5 encodeObject:self->_extractionOsBuild forKey:@"bld"];
  [v5 encodeInt64:self->_extractionAssetVersion forKey:@"ast"];
  [v5 encodeInt32:self->_bucketizedSentimentScore forKey:@"snt"];
  [v5 encodeObject:self->_metadata forKey:@"met"];
}

- (PPTopicRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PPTopicRecord;
  id v5 = [(PPTopicRecord *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"top"];
    topic = v5->_topic;
    v5->_topic = (PPTopic *)v7;

    uint64_t v9 = PPGetSourceInternPool();
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"src"];
    uint64_t v11 = [v9 intern:v10];
    source = v5->_source;
    v5->_source = (PPSource *)v11;

    v5->_unint64_t algorithm = (int)[v4 decodeInt32ForKey:@"alg"];
    [v4 decodeDoubleForKey:@"score"];
    v5->_double initialScore = v13;
    [v4 decodeDoubleForKey:@"dec"];
    v5->_decayRate = v14;
    v5->_isLocal = [v4 decodeBoolForKey:@"loc"];
    BOOL v15 = PPGetStringInternPool();
    uint64_t v16 = [v4 decodeObjectOfClass:v6 forKey:@"bld"];
    uint64_t v17 = [v15 intern:v16];
    extractionOsBuild = v5->_extractionOsBuild;
    v5->_extractionOsBuild = (NSString *)v17;

    v5->_extractionAssetVersion = [v4 decodeInt64ForKey:@"ast"];
    v5->_bucketizedSentimentScore = [v4 decodeInt32ForKey:@"snt"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"met"];
    metadata = v5->_metadata;
    v5->_metadata = (PPTopicMetadata *)v19;
  }
  return v5;
}

@end