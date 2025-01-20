@interface _PSFeaturePreprocessor
+ (id)encodeFeatureVectors:(id)a3;
+ (id)getNumberFromVirtualFeatureValue:(id)a3;
+ (id)oneHotEncodedFeatureNameForFeatureName:(id)a3 featureValue:(id)a4;
+ (id)rawDataToCandidateFeatureDict:(id)a3;
@end

@implementation _PSFeaturePreprocessor

+ (id)rawDataToCandidateFeatureDict:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke;
  v7[3] = &unk_1E5AE0708;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

+ (id)oneHotEncodedFeatureNameForFeatureName:(id)a3 featureValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 stringValue];
  if (v7)
  {
  }
  else if ([v6 timeBucketValue])
  {
    [v6 timeBucketValue];
    uint64_t v9 = BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketAsString();
    goto LABEL_7;
  }
  id v8 = [v6 stringValue];

  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = [v6 stringValue];
LABEL_7:
  v10 = (void *)v9;
  id v8 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", v5, v9];

LABEL_8:
  v11 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[_PSFeaturePreprocessor oneHotEncodedFeatureNameForFeatureName:featureValue:]((uint64_t)v5, (uint64_t)v8, v11);
  }

  return v8;
}

+ (id)getNumberFromVirtualFeatureValue:(id)a3
{
  id v3 = a3;
  if ([v3 hasIntValue])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "intValue"));
LABEL_7:
    id v6 = (void *)v4;
    goto LABEL_8;
  }
  if ([v3 hasDoubleValue])
  {
    id v5 = NSNumber;
    [v3 doubleValue];
    uint64_t v4 = objc_msgSend(v5, "numberWithDouble:");
    goto LABEL_7;
  }
  if ([v3 hasBoolValue])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

+ (id)encodeFeatureVectors:(id)a3
{
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "Encoding feature dictionary", buf, 2u);
  }

  id v6 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke;
  v13 = &unk_1E5AE0758;
  id v15 = a1;
  id v7 = v6;
  id v14 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];

  id v8 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "Finished encoding feature dictionary", buf, 2u);
  }

  return v7;
}

+ (void)oneHotEncodedFeatureNameForFeatureName:(os_log_t)log featureValue:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Feature name %@ produced one-hot feature name %@", (uint8_t *)&v3, 0x16u);
}

@end