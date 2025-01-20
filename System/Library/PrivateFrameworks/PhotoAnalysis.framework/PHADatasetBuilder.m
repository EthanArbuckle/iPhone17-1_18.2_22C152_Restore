@interface PHADatasetBuilder
+ (id)_randomIndicesWithUpperBound:(unint64_t)a3 count:(unint64_t)a4;
+ (id)labelVectorForLabelPolicy:(int64_t)a3 label:(id)a4 numberOfClasses:(unint64_t)a5;
+ (id)labelVectorsForLabelPolicy:(int64_t)a3;
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6;
- (BOOL)_isFeatureNameForAssetPredicateWithFeatureName:(id)a3;
- (NSArray)negativeLocalIdentifiers;
- (NSArray)positiveLocalIdentifiers;
- (PHACoreDuetDatasetStorage)datasetStore;
- (PHADatasetBuilder)initWithDatasetOptions:(id)a3;
- (PHAPrivateFederatedLearningRecipeOptions)options;
- (id)_assetPropertiesPredicateForKeywordFromFeatureExtractorFilters:(id)a3;
- (id)_currentFetchOptionPropertySet;
- (id)_datasetBuilderHelperForBiomeStream:(id)a3 error:(id *)a4;
- (id)_datasetBuilderHelperForLocalIdentifiers:(id)a3 positiveFingerprints:(id)a4 negativeFingerprints:(id)a5 error:(id *)a6;
- (id)_datasetForLocalIdentifiers:(id)a3 positiveFingerprints:(id)a4 negativeFingerprints:(id)a5 error:(id *)a6;
- (id)_featureProviderForFingerprintVectors:(id)a3 labelVectors:(id)a4 batchSize:(unint64_t)a5 error:(id *)a6;
- (id)_fetchObjectsForFingerprintVersion:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (id)_fetchObjectsForFingerprintVersion:(int64_t)a3 options:(id)a4 localIdentifiers:(id)a5 error:(id *)a6;
- (id)_filterDataSamples:(id)a3 filters:(id)a4 numberOfSamples:(id)a5 error:(id *)a6;
- (id)_fingerprintsForDatasetName:(id)a3 localIdentifiers:(id)a4 labelName:(id)a5 numberOfSamples:(id)a6 filters:(id)a7 error:(id *)a8;
- (id)_fingerprintsForObjects:(id)a3 fingerprintVersion:(int64_t)a4 error:(id *)a5;
- (id)_fingerprintsForPhotosStyleWithDataLabelArray:(id)a3 error:(id *)a4;
- (id)_localIdentifiersForCoreDuetDatasetName:(id)a3 subsetName:(id)a4;
- (id)_localIdentifiersToExcludeForLabel:(id)a3;
- (id)_mergeLocalIdentifiersFromPositiveLocalIdentifiers:(id)a3 negativeLocalIdentifiers:(id)a4 numberOfPositiveSamples:(id)a5 numberOfNegativeSamples:(id)a6 error:(id *)a7;
- (id)_numberOfSamplesPerClassWithError:(id *)a3;
- (id)_performAugmentationsOnLabeledSamples:(id)a3 error:(id *)a4;
- (id)_randomSamplesOfCount:(unint64_t)a3 filterPredicateForKeyword:(id)a4 labelName:(id)a5 error:(id *)a6;
- (id)_samplesOfCount:(unint64_t)a3 fromLocalIdentifiers:(id)a4 filterPredicateForKeyword:(id)a5 error:(id *)a6;
- (id)_trainingDataWithDataLabelArray:(id)a3 fingerprints:(id)a4 error:(id *)a5;
- (id)dataLabelArrayForPhotosStyleWithError:(id *)a3;
- (id)datasetBuilderHelperForBinaryTrainingWithError:(id *)a3;
- (id)datasetBuilderHelperForPhotosStyleWithError:(id *)a3;
- (id)datasetForEvaluationForLabel:(id)a3 error:(id *)a4;
- (id)datasetWithError:(id *)a3;
- (id)readLocalIdentifiersFromBiomeStream:(id)a3 subsetName:(id)a4 type:(id)a5;
- (id)trainingDataBatchWithBiomeStream:(id)a3 error:(id *)a4;
- (int64_t)_validatePHObject:(id)a3 withFeatureValidator:(id)a4 error:(id *)a5;
- (unint64_t)_minAvailableNumberOfSamples;
- (void)setDatasetStore:(id)a3;
- (void)setNegativeLocalIdentifiers:(id)a3;
- (void)setPositiveLocalIdentifiers:(id)a3;
@end

@implementation PHADatasetBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetStore, 0);
  objc_storeStrong((id *)&self->_negativeLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_positiveLocalIdentifiers, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (void)setDatasetStore:(id)a3
{
}

- (PHACoreDuetDatasetStorage)datasetStore
{
  return self->_datasetStore;
}

- (void)setNegativeLocalIdentifiers:(id)a3
{
}

- (void)setPositiveLocalIdentifiers:(id)a3
{
}

- (PHAPrivateFederatedLearningRecipeOptions)options
{
  return self->_options;
}

- (id)_featureProviderForFingerprintVectors:(id)a3 labelVectors:(id)a4 batchSize:(unint64_t)a5 error:(id *)a6
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([v11 count] && objc_msgSend(v10, "count"))
  {
    id v51 = v11;
    v12 = a6;
    unint64_t v13 = 0x1E4F1E000uLL;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1E9A8]);
    v15 = [(PHADatasetBuilder *)self options];
    v16 = [v15 labelPolicyString];
    int v17 = [v16 isEqualToString:@"one-hot"];

    if (v17)
    {
      v50 = (void *)MEMORY[0x1E4F1E9A8];
      v18 = [NSNumber numberWithUnsignedInteger:a5];
      v56[0] = v18;
      v19 = NSNumber;
      v20 = [(PHADatasetBuilder *)self options];
      v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "labelSize"));
      v56[1] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
      uint64_t v23 = [v50 doubleMultiArrayWithShape:v22 valueArray:v51 error:v12];
      v24 = v14;
      v25 = (void *)v23;

      unint64_t v13 = 0x1E4F1E000;
    }
    else
    {
      unint64_t v27 = a5;
      v28 = [(PHADatasetBuilder *)self options];
      v29 = [v28 labelPolicyString];
      int v30 = [v29 isEqualToString:@"indexed"];

      if (v30)
      {
        v31 = (void *)MEMORY[0x1E4F1E9A8];
        v32 = [NSNumber numberWithUnsignedInteger:v27];
        v55[0] = v32;
        v55[1] = &unk_1F291AB58;
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
        uint64_t v34 = [v31 doubleMultiArrayWithShape:v33 valueArray:v51 error:v12];

        v25 = (void *)v34;
      }
      else
      {

        v25 = 0;
      }
      a5 = v27;
    }
    v35 = *(void **)(v13 + 2472);
    v36 = [NSNumber numberWithUnsignedInteger:a5];
    v54[0] = v36;
    v37 = NSNumber;
    v38 = [(PHADatasetBuilder *)self options];
    v39 = objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "featureSize"));
    v54[1] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v41 = [v35 doubleMultiArrayWithShape:v40 valueArray:v10 error:v12];

    v42 = v25;
    if (v25)
    {
      if (v41)
      {
        id v43 = objc_alloc(MEMORY[0x1E4F1E930]);
        v44 = [(PHADatasetBuilder *)self options];
        v45 = [v44 modelInputName];
        v52[0] = v45;
        v53[0] = v41;
        v46 = [(PHADatasetBuilder *)self options];
        v47 = [v46 modelOutputName];
        v52[1] = v47;
        v53[1] = v42;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        v25 = (void *)[v43 initWithDictionary:v48 error:v12];
      }
      else
      {
        v44 = [NSString stringWithFormat:@"Fail to create MLMultiArray vector for feature"];
        [(PHADatasetBuilder *)self _generateError:v12 errorCode:15 errorMessage:v44 underlyingError:0];
        v25 = 0;
      }
    }
    else
    {
      v44 = [NSString stringWithFormat:@"Fail to create MLMultiArray vector for label"];
      [(PHADatasetBuilder *)self _generateError:v12 errorCode:14 errorMessage:v44 underlyingError:0];
    }

    id v11 = v51;
  }
  else
  {
    v26 = [NSString stringWithFormat:@"Empty label or feature vectors"];
    [(PHADatasetBuilder *)self _generateError:a6 errorCode:13 errorMessage:v26 underlyingError:0];

    v25 = 0;
  }

  return v25;
}

- (id)_trainingDataWithDataLabelArray:(id)a3 fingerprints:(id)a4 error:(id *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v57 = a4;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v8 = v7;
  uint64_t v62 = [v8 countByEnumeratingWithState:&v65 objects:v69 count:16];
  v63 = self;
  if (!v62)
  {
    unint64_t v59 = 0;
    goto LABEL_32;
  }
  unint64_t v59 = 0;
  uint64_t v61 = *(void *)v66;
  id v56 = v8;
  do
  {
    for (uint64_t i = 0; i != v62; ++i)
    {
      if (*(void *)v66 != v61) {
        objc_enumerationMutation(v8);
      }
      id v10 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      id v11 = (void *)MEMORY[0x1E4F391D0];
      v12 = [(PHADatasetBuilder *)self options];
      unint64_t v13 = [v12 biomeInputName];
      id v14 = [v10 objectForKey:v13];
      v15 = [v11 uuidFromLocalIdentifier:v14];

      self = v63;
      v16 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:v15];
      int v17 = [(PHADatasetBuilder *)v63 options];
      v18 = [v17 biomeLabelName];
      v19 = [v10 objectForKey:v18];

      if (v16) {
        BOOL v20 = v19 == 0;
      }
      else {
        BOOL v20 = 1;
      }
      if (!v20)
      {
        v21 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(v19, "intValue"));
        unint64_t v22 = [v21 unsignedIntegerValue];
        uint64_t v23 = [(PHADatasetBuilder *)v63 options];
        unint64_t v24 = [v23 numberOfClasses];

        if (v22 <= v24)
        {
          v25 = [v58 objectForKey:v21];
          if (!v25)
          {
            v26 = [(PHADatasetBuilder *)v63 options];
            uint64_t v27 = [v26 labelPolicy];
            v28 = [(PHADatasetBuilder *)v63 options];
            v25 = +[PHADatasetBuilder labelVectorForLabelPolicy:label:numberOfClasses:](PHADatasetBuilder, "labelVectorForLabelPolicy:label:numberOfClasses:", v27, v21, [v28 numberOfClasses]);

            id v8 = v56;
            [v58 setObject:v25 forKeyedSubscript:v21];
          }
          v29 = [v57 objectForKey:v16];
          int v30 = [v29 floatArray];
          v31 = [v30 array];

          v60 = v31;
          if ([v25 count] && objc_msgSend(v31, "count"))
          {
            v32 = [(PHADatasetBuilder *)v63 options];
            v33 = [v32 labelPolicyString];
            if ([v33 isEqualToString:@"one-hot"])
            {
              uint64_t v52 = [v25 count];
              uint64_t v34 = [(PHADatasetBuilder *)v63 options];
              uint64_t v35 = [v34 labelSize];

              id v8 = v56;
              if (v52 != v35)
              {
                v36 = NSString;
                v37 = [(PHADatasetBuilder *)v63 options];
                id v8 = v56;
                v38 = [v36 stringWithFormat:@"Wrong label size %ld, expected: %ld", objc_msgSend(v37, "labelSize"), objc_msgSend(v25, "count")];
                [(PHADatasetBuilder *)v63 _generateError:a5 errorCode:17 errorMessage:v38 underlyingError:0];

                goto LABEL_25;
              }
            }
            else
            {
            }
            [v54 addObjectsFromArray:v60];
            [v55 addObjectsFromArray:v25];
            ++v59;
          }
          v39 = [(PHADatasetBuilder *)v63 options];
          unint64_t v40 = v59 % [v39 batchSize];

          if (v40)
          {
            v41 = v60;
          }
          else
          {
            v42 = [(PHADatasetBuilder *)v63 options];
            v37 = -[PHADatasetBuilder _featureProviderForFingerprintVectors:labelVectors:batchSize:error:](v63, "_featureProviderForFingerprintVectors:labelVectors:batchSize:error:", v54, v55, [v42 batchSize], a5);

            if (v37)
            {
              [v51 addObject:v37];
              [v54 removeAllObjects];
              [v55 removeAllObjects];
            }
            id v8 = v56;
LABEL_25:
            v41 = v60;
          }
          self = v63;
        }
      }
    }
    uint64_t v62 = [v8 countByEnumeratingWithState:&v65 objects:v69 count:16];
  }
  while (v62);
LABEL_32:

  if ([v54 count])
  {
    id v43 = [(PHADatasetBuilder *)v63 options];
    unint64_t v44 = v59 % [v43 batchSize];

    id v64 = 0;
    v45 = [(PHADatasetBuilder *)v63 _featureProviderForFingerprintVectors:v54 labelVectors:v55 batchSize:v44 error:&v64];
    id v46 = v64;
    if (v46)
    {
      v47 = v46;
      v48 = [NSString stringWithFormat:@"Fail to create batch data"];
      [(PHADatasetBuilder *)v63 _generateError:a5 errorCode:18 errorMessage:v48 underlyingError:v47];

      v49 = 0;
      goto LABEL_37;
    }
    [v51 addObject:v45];
  }
  v49 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v51];
LABEL_37:

  return v49;
}

- (id)_datasetBuilderHelperForBiomeStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(PHADatasetBuilderHelper);
  int64_t v8 = +[PHABiomeUtilities biomeStreamFor:v6];

  if (v8 == 9)
  {
    uint64_t v9 = [(PHADatasetBuilder *)self datasetBuilderHelperForPhotosStyleWithError:a4];
LABEL_5:
    id v10 = (PHADatasetBuilderHelper *)v9;

    id v7 = v10;
    goto LABEL_6;
  }
  if (+[PHABiomeUtilities supportsForBinaryTrainingWithStream:v8])
  {
    uint64_t v9 = [(PHADatasetBuilder *)self datasetBuilderHelperForBinaryTrainingWithError:a4];
    goto LABEL_5;
  }
LABEL_6:
  id v11 = v7;

  return v11;
}

- (id)trainingDataBatchWithBiomeStream:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E910];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v21 = 0;
  uint64_t v9 = [(PHADatasetBuilder *)self _datasetBuilderHelperForBiomeStream:v7 error:&v21];

  id v10 = v21;
  if (v9)
  {
    id v11 = [v9 dataLabelArray];
    v12 = [v9 fingerprints];
    id v20 = 0;
    unint64_t v13 = [(PHADatasetBuilder *)self _trainingDataWithDataLabelArray:v11 fingerprints:v12 error:&v20];
    id v14 = v20;

    v15 = [v13 array];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v8 = v13;
      int v17 = v8;
    }
    else
    {
      v18 = [NSString stringWithFormat:@"Empty training data"];
      [(PHADatasetBuilder *)self _generateError:a4 errorCode:16 errorMessage:v18 underlyingError:v14];

      int v17 = 0;
      id v8 = v13;
    }
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"Empty training data"];
    [(PHADatasetBuilder *)self _generateError:a4 errorCode:16 errorMessage:v14 underlyingError:v10];
    int v17 = 0;
  }

  return v17;
}

- (id)_datasetBuilderHelperForLocalIdentifiers:(id)a3 positiveFingerprints:(id)a4 negativeFingerprints:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v8;
  uint64_t v36 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v38;
    id v31 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v11);
        }
        uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v14 = [v9 objectForKeyedSubscript:v13];

        if (v14)
        {
          v15 = [(PHADatasetBuilder *)self options];
          uint64_t v16 = [v15 biomeInputName];
          v43[0] = v16;
          v44[0] = v13;
          int v17 = [(PHADatasetBuilder *)self options];
          v18 = [v17 biomeLabelName];
          v43[1] = v18;
          v44[1] = @"1";
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

          [v10 addObject:v19];
          id v20 = v9;
        }
        else
        {
          if (!v32
            || ([v32 objectForKeyedSubscript:v13],
                id v21 = objc_claimAutoreleasedReturnValue(),
                v21,
                !v21))
          {
            [(PHADatasetBuilder *)self _generateError:a6 errorCode:1 errorMessage:@"No fingerprint for local identifier" underlyingError:0];

            v28 = 0;
            uint64_t v27 = v33;
            goto LABEL_17;
          }
          unint64_t v22 = [(PHADatasetBuilder *)self options];
          uint64_t v23 = [v22 biomeInputName];
          v41[0] = v23;
          v42[0] = v13;
          unint64_t v24 = [(PHADatasetBuilder *)self options];
          v25 = [v24 biomeLabelName];
          v41[1] = v25;
          v42[1] = @"0";
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

          [v10 addObject:v19];
          id v20 = v32;
          id v11 = v31;
        }
        v26 = [v20 objectForKeyedSubscript:v13];

        if (v26) {
          [v33 setValue:v26 forKey:v13];
        }
      }
      uint64_t v36 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

  uint64_t v27 = v33;
  v28 = [[PHADatasetBuilderHelper alloc] initWithDataLabelArray:v10 fingerprints:v33];
LABEL_17:

  return v28;
}

- (id)datasetBuilderHelperForBinaryTrainingWithError:(id *)a3
{
  v5 = -[PHADatasetBuilder _numberOfSamplesPerClassWithError:](self, "_numberOfSamplesPerClassWithError:");
  id v6 = v5;
  if (!v5)
  {
    uint64_t v34 = 0;
    goto LABEL_15;
  }
  unint64_t v44 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"positive"];
  uint64_t v46 = [v6 objectForKeyedSubscript:@"negative"];
  [MEMORY[0x1E4F8D638] resetPreCalculatedFeatures];
  id v8 = [(PHADatasetBuilder *)self options];
  id v9 = [v8 positivesDatasetName];
  id v10 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
  id v11 = [(PHADatasetBuilder *)self options];
  v12 = [v11 filtersByDatasetName];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"positive"];
  id v50 = 0;
  v45 = (void *)v7;
  id v14 = [(PHADatasetBuilder *)self _fingerprintsForDatasetName:v9 localIdentifiers:v10 labelName:@"positive" numberOfSamples:v7 filters:v13 error:&v50];
  id v15 = v50;

  uint64_t v16 = v14;
  if ([v14 count])
  {
    id v43 = v14;
    int v17 = [(PHADatasetBuilder *)self options];
    v18 = [v17 negativesDatasetName];
    v19 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
    id v20 = [(PHADatasetBuilder *)self options];
    id v21 = [v20 filtersByDatasetName];
    unint64_t v22 = [v21 objectForKeyedSubscript:@"negative"];
    id v49 = v15;
    uint64_t v23 = [(PHADatasetBuilder *)self _fingerprintsForDatasetName:v18 localIdentifiers:v19 labelName:@"negative" numberOfSamples:v46 filters:v22 error:&v49];
    id v42 = v49;

    if ([v23 count])
    {
      id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v25 = [v43 allKeys];
      v26 = (void *)[v24 initWithArray:v25];
      id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v28 = [v23 allKeys];
      v29 = (void *)[v27 initWithArray:v28];
      id v48 = v42;
      int v30 = v45;
      id v31 = [(PHADatasetBuilder *)self _mergeLocalIdentifiersFromPositiveLocalIdentifiers:v26 negativeLocalIdentifiers:v29 numberOfPositiveSamples:v45 numberOfNegativeSamples:v46 error:&v48];
      id v32 = v48;

      if ([v31 count])
      {
        id v47 = v32;
        id v33 = v23;
        uint64_t v16 = v43;
        uint64_t v34 = [(PHADatasetBuilder *)self _datasetBuilderHelperForLocalIdentifiers:v31 positiveFingerprints:v43 negativeFingerprints:v23 error:&v47];
        id v15 = v47;

        if (!v34 || v15)
        {
          [(PHADatasetBuilder *)self _generateError:v44 errorCode:1 errorMessage:@"No fingerprint for local identifier" underlyingError:v15];

          uint64_t v34 = 0;
        }
        goto LABEL_10;
      }
      [(PHADatasetBuilder *)self _generateError:v44 errorCode:2 errorMessage:@"No data after reblancing dataset" underlyingError:v32];
      uint64_t v34 = 0;
      id v15 = v32;
    }
    else
    {
      long long v38 = NSString;
      id v31 = [(PHADatasetBuilder *)self options];
      long long v39 = [v31 negativesDatasetName];
      long long v40 = [v38 stringWithFormat:@"No data for negative datasetName %@", v39];
      id v15 = v42;
      [(PHADatasetBuilder *)self _generateError:v44 errorCode:2 errorMessage:v40 underlyingError:v42];

      uint64_t v34 = 0;
      int v30 = v45;
    }
    long long v37 = (void *)v46;
    id v33 = v23;
    uint64_t v16 = v43;
    goto LABEL_14;
  }
  uint64_t v35 = NSString;
  id v33 = [(PHADatasetBuilder *)self options];
  id v31 = [v33 positivesDatasetName];
  uint64_t v36 = [v35 stringWithFormat:@"No data for positive datasetName %@", v31];
  [(PHADatasetBuilder *)self _generateError:v44 errorCode:2 errorMessage:v36 underlyingError:v15];

  uint64_t v34 = 0;
  int v30 = v45;
LABEL_10:
  long long v37 = (void *)v46;
LABEL_14:

LABEL_15:

  return v34;
}

- (id)_fingerprintsForPhotosStyleWithDataLabelArray:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v14 = [(PHADatasetBuilder *)self options];
        id v15 = [v14 biomeInputName];
        uint64_t v16 = [v13 objectForKeyedSubscript:v15];

        if (v16) {
          [v7 addObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v10);
  }

  uint64_t v17 = [v7 count];
  v18 = [(PHADatasetBuilder *)self options];
  v19 = +[PHADatasetBuilder _randomIndicesWithUpperBound:count:](PHADatasetBuilder, "_randomIndicesWithUpperBound:count:", v17, [v18 totalNumberOfSamples]);

  if (v19)
  {
    uint64_t v20 = [v7 objectsAtIndexes:v19];
    [MEMORY[0x1E4F8D638] resetPreCalculatedFeatures];
    id v21 = [(PHADatasetBuilder *)self options];
    unint64_t v22 = [v21 photoLibrary];
    uint64_t v23 = [v22 librarySpecificFetchOptions];

    id v24 = [(PHADatasetBuilder *)self options];
    id v33 = a4;
    uint64_t v34 = (void *)v20;
    v25 = -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:localIdentifiers:error:](self, "_fetchObjectsForFingerprintVersion:options:localIdentifiers:error:", [v24 fingerprintVersion], v23, v20, a4);

    v26 = [v25 fetchedObjects];
    id v27 = [(PHADatasetBuilder *)self options];
    id v36 = 0;
    v28 = -[PHADatasetBuilder _fingerprintsForObjects:fingerprintVersion:error:](self, "_fingerprintsForObjects:fingerprintVersion:error:", v26, [v27 fingerprintVersion], &v36);
    id v29 = v36;

    if (v28 && [v28 count])
    {
      id v30 = v28;
    }
    else
    {
      id v31 = [NSString stringWithFormat:@"Error extracting fingerprints for Photos Style"];
      [(PHADatasetBuilder *)self _generateError:v33 errorCode:1 errorMessage:v31 underlyingError:v29];

      id v30 = 0;
    }
  }
  else
  {
    id v30 = 0;
    v28 = v35;
  }

  return v30;
}

- (id)dataLabelArrayForPhotosStyleWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v6 = [(PHADatasetBuilder *)self options];
  id v7 = [v6 biomeInputName];
  id v8 = [(PHADatasetBuilder *)self options];
  uint64_t v9 = [v8 biomeLabelName];
  uint64_t v10 = +[PHABiomeUtilities readBiomeEventsForPhotoStyleWithInputName:v7 labelName:v9 error:a3];

  return v10;
}

- (id)datasetBuilderHelperForPhotosStyleWithError:(id *)a3
{
  id v13 = 0;
  id v5 = [(PHADatasetBuilder *)self dataLabelArrayForPhotosStyleWithError:&v13];
  id v6 = v13;
  if ([v5 count])
  {
    id v12 = v6;
    id v7 = [(PHADatasetBuilder *)self _fingerprintsForPhotosStyleWithDataLabelArray:v5 error:&v12];
    id v8 = v12;

    if ([v7 count])
    {
      uint64_t v9 = [[PHADatasetBuilderHelper alloc] initWithDataLabelArray:v5 fingerprints:v7];
    }
    else
    {
      uint64_t v10 = [NSString stringWithFormat:@"Error exatracting fingerprints"];
      [(PHADatasetBuilder *)self _generateError:a3 errorCode:1 errorMessage:v10 underlyingError:v8];

      uint64_t v9 = 0;
    }
  }
  else
  {
    [(PHADatasetBuilder *)self _generateError:a3 errorCode:12 errorMessage:@"Reading from Photos.Style returns empty data" underlyingError:v6];
    uint64_t v9 = 0;
    id v8 = v6;
  }

  return v9;
}

- (id)_localIdentifiersToExcludeForLabel:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"negative"])
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
LABEL_5:
    id v8 = (void *)v6;
    uint64_t v9 = [v5 setWithArray:v6];

    goto LABEL_7;
  }
  int v7 = [v4 isEqualToString:@"positive"];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  if (v7)
  {
    uint64_t v6 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
    goto LABEL_5;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
LABEL_7:

  return v9;
}

- (id)_currentFetchOptionPropertySet
{
  v3 = (void *)MEMORY[0x1E4F8D638];
  id v4 = [(PHADatasetBuilder *)self options];
  id v5 = objc_msgSend(v3, "fetchOptionPropertySetForFingerprintVersion:", objc_msgSend(v4, "fingerprintVersion"));

  uint64_t v6 = [(PHADatasetBuilder *)self options];
  int v7 = [v6 filtersByDatasetName];
  id v8 = [v7 objectForKeyedSubscript:@"positive"];
  if ([v8 count])
  {
  }
  else
  {
    uint64_t v9 = [(PHADatasetBuilder *)self options];
    uint64_t v10 = [v9 filtersByDatasetName];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"negative"];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      id v16 = v5;
      goto LABEL_9;
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v14 = v13;
  if (v5) {
    [v13 addObjectsFromArray:v5];
  }
  id v15 = [MEMORY[0x1E4F8D638] fetchOptionPropertySetForFingerprintVersion:3];
  if (v15) {
    [v14 addObjectsFromArray:v15];
  }
  id v16 = [v14 allObjects];

LABEL_9:

  return v16;
}

- (id)_assetPropertiesPredicateForKeywordFromFeatureExtractorFilters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "featureName", (void)v17);
        BOOL v13 = [(PHADatasetBuilder *)self _isFeatureNameForAssetPredicateWithFeatureName:v12];

        if (v13)
        {
          id v14 = [v11 predicate];
          id v15 = [v11 featureName];
          [v5 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_isFeatureNameForAssetPredicateWithFeatureName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AssetPropertiesFilter"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"AssetInternalPropertiesFilter"];
  }

  return v4;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHADatasetBuilder" code:a4 userInfo:v12];
  }
  return 0;
}

- (id)_performAugmentationsOnLabeledSamples:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v23 = self;
  id v6 = [(PHADatasetBuilder *)self options];
  uint64_t v7 = [v6 augmenters];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  id v9 = v5;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v27;
    id v9 = v5;
LABEL_3:
    uint64_t v12 = 0;
    id v13 = v9;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        break;
      }
      id v15 = v14;
      id v25 = 0;
      id v9 = [v15 labeledFloatVectorsWithLabeledFloatVectors:v5 error:&v25];
      id v16 = v25;

      if (!v9)
      {
        long long v19 = NSString;
        long long v20 = [(id)objc_opt_class() name];
        id v21 = [v19 stringWithFormat:@"Error executing augmenter %@", v20];
        [(PHADatasetBuilder *)v23 _generateError:a4 errorCode:9 errorMessage:v21 underlyingError:v16];

        id v13 = 0;
        goto LABEL_13;
      }

      ++v12;
      id v13 = v9;
      if (v10 == v12)
      {
        uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    long long v18 = NSString;
    id v15 = [(id)objc_opt_class() name];
    id v16 = [v18 stringWithFormat:@"Feature augmenter not supported: %@. Only supervised learning augmenters are currently supported.", v15];
    [(PHADatasetBuilder *)v23 _generateError:a4 errorCode:8 errorMessage:v16 underlyingError:0];
LABEL_13:

    long long v17 = 0;
    goto LABEL_14;
  }
LABEL_10:

  id v13 = v9;
  long long v17 = v13;
LABEL_14:

  return v17;
}

- (id)_fingerprintsForObjects:(id)a3 fingerprintVersion:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ([MEMORY[0x1E4F8D638] isAssetFingerprintVersion:a4])
  {
    id v9 = [(PHADatasetBuilder *)self options];
    uint64_t v10 = [v9 graphManager];
    uint64_t v11 = [(PHADatasetBuilder *)self options];
    uint64_t v12 = [v11 fingerprintVersion];
    id v13 = [(PHADatasetBuilder *)self options];
    id v14 = [v13 transformersForFeatureExtractors];
    uint64_t v15 = [v10 assetFingerprintsWithVersion:v12 forAssets:v8 withTransformers:v14 error:a5];
LABEL_6:
    long long v17 = (void *)v15;

    goto LABEL_7;
  }
  if (([MEMORY[0x1E4F8D638] isMomentFingerprintVersion:a4] & 1) != 0
    || [MEMORY[0x1E4F8D638] isMemoryFingerprintVersion:a4])
  {
    id v9 = [(PHADatasetBuilder *)self options];
    uint64_t v10 = [v9 graphManager];
    uint64_t v11 = [(PHADatasetBuilder *)self options];
    uint64_t v16 = [v11 fingerprintVersion];
    id v13 = [(PHADatasetBuilder *)self options];
    id v14 = [v13 transformersForFeatureExtractors];
    uint64_t v15 = [v10 assetCollectionFingerprintsWithVersion:v16 forAssetCollections:v8 withTransformers:v14 error:a5];
    goto LABEL_6;
  }
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported: %ld", a4);
  [(PHADatasetBuilder *)self _generateError:a5 errorCode:5 errorMessage:v9 underlyingError:0];
  long long v17 = 0;
LABEL_7:

  return v17;
}

- (id)_fetchObjectsForFingerprintVersion:(int64_t)a3 options:(id)a4 localIdentifiers:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([MEMORY[0x1E4F8D638] isAssetFingerprintVersion:a3])
  {
    if ([v11 count]) {
      [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v11 options:v10];
    }
    else {
    uint64_t v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v10];
    }
    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F8D638] isMomentFingerprintVersion:a3])
  {
    uint64_t v13 = [v11 count];
    id v14 = (void *)MEMORY[0x1E4F38EE8];
    uint64_t v15 = 3;
    if (v13)
    {
LABEL_7:
      uint64_t v12 = [v14 fetchAssetCollectionsWithType:v15 localIdentifiers:v11 options:v10];
LABEL_12:
      long long v17 = (void *)v12;
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v12 = [v14 fetchAssetCollectionsWithType:v15 subtype:0x7FFFFFFFFFFFFFFFLL options:v10];
    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F8D638] isMemoryFingerprintVersion:a3])
  {
    uint64_t v16 = [v11 count];
    id v14 = (void *)MEMORY[0x1E4F38EE8];
    uint64_t v15 = 4;
    if (v16) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported: %ld", a3);
  [(PHADatasetBuilder *)self _generateError:a6 errorCode:5 errorMessage:v19 underlyingError:0];

  long long v17 = 0;
LABEL_13:

  return v17;
}

- (id)_fetchObjectsForFingerprintVersion:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  return [(PHADatasetBuilder *)self _fetchObjectsForFingerprintVersion:a3 options:a4 localIdentifiers:MEMORY[0x1E4F1CBF0] error:a5];
}

- (id)_localIdentifiersForCoreDuetDatasetName:(id)a3 subsetName:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHADatasetBuilder *)self datasetStore];
  id v9 = [v8 samplesForDataset:v6 subset:v7];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "identifier", (void)v18);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (int64_t)_validatePHObject:(id)a3 withFeatureValidator:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  switch([v9 featureValidatorType])
  {
    case 0:
      [(PHADatasetBuilder *)self _generateError:a5 errorCode:11 errorMessage:@"Unknown feature validator type is not supported." underlyingError:0];
      a5 = 0;
      break;
    case 1:
    case 3:
    case 5:
      a5 = (id *)[v9 isValidEntity:v8 error:a5];
      break;
    case 2:
      uint64_t v13 = [(PHADatasetBuilder *)self options];
      uint64_t v14 = [v13 graphManager];
      a5 = (id *)[v14 validatePHObject:v8 graphRelationsFeatureValidator:v9 error:a5];

      break;
    case 4:
    case 6:
      id v10 = [(PHADatasetBuilder *)self options];
      id v11 = [v10 graphManager];
      uint64_t v12 = [(PHADatasetBuilder *)self _currentFetchOptionPropertySet];
      a5 = (id *)[v11 validatePHObject:v8 featureAggregationValidator:v9 assetFetchOptionPropertySet:v12 error:a5];

      break;
    default:
      break;
  }

  return (int64_t)a5;
}

- (id)_filterDataSamples:(id)a3 filters:(id)a4 numberOfSamples:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v9;
  uint64_t v35 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v35)
  {
    uint64_t v14 = *(void *)v44;
    id v33 = v11;
    id v34 = v10;
    uint64_t v31 = *(void *)v44;
    id v32 = v13;
    id v37 = v12;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(v13);
      }
      uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * v15);
      unint64_t v17 = objc_msgSend(v12, "count", v31);
      if (v17 >= [v11 integerValue]) {
        break;
      }
      uint64_t v36 = v15;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v18 = v10;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v40;
        uint64_t v22 = 1;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v40 != v21) {
              objc_enumerationMutation(v18);
            }
            id v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v25 = [v24 featureName];
            BOOL v26 = [(PHADatasetBuilder *)self _isFeatureNameForAssetPredicateWithFeatureName:v25];

            if (!v26)
            {
              int64_t v27 = [(PHADatasetBuilder *)self _validatePHObject:v16 withFeatureValidator:v24 error:a6];
              if (v27 == 2)
              {
                uint64_t v22 = 2;
              }
              else if (!v27)
              {

                id v13 = v32;
                id v29 = 0;
                id v11 = v33;
                id v10 = v34;
                id v12 = v37;
                goto LABEL_26;
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v20);

        BOOL v28 = v22 == 1;
        id v11 = v33;
        id v10 = v34;
        uint64_t v14 = v31;
        id v13 = v32;
        id v12 = v37;
        if (!v28) {
          goto LABEL_23;
        }
      }
      else
      {

        id v12 = v37;
      }
      [v12 addObject:v16];
LABEL_23:
      uint64_t v15 = v36 + 1;
      if (v36 + 1 == v35)
      {
        uint64_t v35 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v35) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v29 = v12;
LABEL_26:

  return v29;
}

- (id)_randomSamplesOfCount:(unint64_t)a3 filterPredicateForKeyword:(id)a4 labelName:(id)a5 error:(id *)a6
{
  void v41[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = [(PHADatasetBuilder *)self options];
  id v13 = [v12 photoLibrary];
  uint64_t v14 = [v13 librarySpecificFetchOptions];

  uint64_t v15 = [(PHADatasetBuilder *)self _currentFetchOptionPropertySet];
  if (v15) {
    [v14 setFetchPropertySets:v15];
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v36 = v10;
  unint64_t v17 = [(PHADatasetBuilder *)self _localIdentifiersToExcludeForLabel:v10];
  id v18 = [v16 predicateWithFormat:@"NOT (uuid IN %@)", v17];

  uint64_t v19 = [v11 objectForKeyedSubscript:@"AssetPropertiesFilter"];
  uint64_t v20 = [v11 objectForKeyedSubscript:@"AssetInternalPropertiesFilter"];

  uint64_t v35 = (void *)v20;
  if (v19)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28BA0];
    v41[0] = v18;
    v41[1] = v19;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    uint64_t v23 = [v21 andPredicateWithSubpredicates:v22];
    [v14 setPredicate:v23];
LABEL_7:

    goto LABEL_8;
  }
  if (v20)
  {
    id v24 = (void *)MEMORY[0x1E4F28BA0];
    v40[0] = v18;
    v40[1] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v23 = [v24 andPredicateWithSubpredicates:v22];
    [v14 setInternalPredicate:v23];
    goto LABEL_7;
  }
  [v14 setPredicate:v18];
LABEL_8:
  id v25 = [(PHADatasetBuilder *)self options];
  BOOL v26 = -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:error:](self, "_fetchObjectsForFingerprintVersion:options:error:", [v25 fingerprintVersion], v14, a6);

  if (v26)
  {
    uint64_t v27 = [v26 count];
    BOOL v28 = +[PHADatasetBuilder _randomIndicesWithUpperBound:v27 count:a3];
    if (v28)
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __85__PHADatasetBuilder__randomSamplesOfCount_filterPredicateForKeyword_labelName_error___block_invoke;
      v37[3] = &unk_1E6917C28;
      id v30 = v29;
      id v38 = v30;
      id v39 = v26;
      [v28 enumerateIndexesUsingBlock:v37];
      uint64_t v31 = v39;
      id v32 = v30;

      id v33 = v32;
    }
    else
    {
      id v32 = [NSString stringWithFormat:@"Not enough random samples(%lu), requested: (%lu)", v27, a3];
      [(PHADatasetBuilder *)self _generateError:a6 errorCode:3 errorMessage:v32 underlyingError:0];
      id v33 = 0;
    }
  }
  else
  {
    [(PHADatasetBuilder *)self _generateError:a6 errorCode:4 errorMessage:@"Random sample query returned nil" underlyingError:0];
    id v33 = 0;
  }

  return v33;
}

void __85__PHADatasetBuilder__randomSamplesOfCount_filterPredicateForKeyword_labelName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v2 addObject:v3];
}

- (id)_samplesOfCount:(unint64_t)a3 fromLocalIdentifiers:(id)a4 filterPredicateForKeyword:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (a3)
  {
    id v12 = +[PHADatasetBuilder _randomIndicesWithUpperBound:count:](PHADatasetBuilder, "_randomIndicesWithUpperBound:count:", [v10 count], a3);
    if (v12)
    {
      id v13 = [v10 objectsAtIndexes:v12];
      uint64_t v14 = [(PHADatasetBuilder *)self options];
      uint64_t v15 = [v14 photoLibrary];
      uint64_t v16 = [v15 librarySpecificFetchOptions];

      [v16 setIncludeHiddenAssets:1];
      [v16 setIncludeTrashedAssets:1];
      uint64_t v17 = [(PHADatasetBuilder *)self _currentFetchOptionPropertySet];
      if (v17) {
        [v16 setFetchPropertySets:v17];
      }
      id v18 = [v11 objectForKeyedSubscript:@"AssetPropertiesFilter"];
      uint64_t v19 = [v11 objectForKeyedSubscript:@"AssetInternalPropertiesFilter"];
      uint64_t v27 = (void *)v17;
      if (v18)
      {
        uint64_t v20 = (void *)v19;
        [v16 setPredicate:v18];
      }
      else
      {
        uint64_t v20 = (void *)v19;
        if (v19) {
          [v16 setInternalPredicate:v19];
        }
      }
      uint64_t v22 = [(PHADatasetBuilder *)self options];
      uint64_t v23 = -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:localIdentifiers:error:](self, "_fetchObjectsForFingerprintVersion:options:localIdentifiers:error:", [v22 fingerprintVersion], v16, v13, a6);

      id v24 = (void *)MEMORY[0x1E4F1CAD0];
      id v25 = [v23 fetchedObjects];
      uint64_t v21 = [v24 setWithArray:v25];
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    [(PHADatasetBuilder *)self _generateError:a6 errorCode:6 errorMessage:@"Request for zero samples from the database is not supported." underlyingError:0];
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)_datasetForLocalIdentifiers:(id)a3 positiveFingerprints:(id)a4 negativeFingerprints:(id)a5 error:(id *)a6
{
  uint64_t v35 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v36 = self;
  id v12 = [(PHADatasetBuilder *)self options];
  id v37 = +[PHADatasetBuilder labelVectorsForLabelPolicy:](PHADatasetBuilder, "labelVectorsForLabelPolicy:", [v12 labelPolicy]);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v10, "objectForKeyedSubscript:", v18, v35);

        if (v19)
        {
          uint64_t v20 = [v10 objectForKeyedSubscript:v18];
          uint64_t v21 = @"positive";
        }
        else
        {
          if (!v11
            || ([v11 objectForKeyedSubscript:v18],
                uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                v22,
                !v22))
          {
            [(PHADatasetBuilder *)v36 _generateError:v35 errorCode:1 errorMessage:@"No fingerprint for local identifier" underlyingError:0];
            id v33 = 0;
            uint64_t v27 = v13;
            goto LABEL_16;
          }
          uint64_t v20 = [v11 objectForKeyedSubscript:v18];
          uint64_t v21 = @"negative";
        }
        uint64_t v23 = [v37 objectForKeyedSubscript:v21];
        id v24 = objc_alloc(MEMORY[0x1E4F8D760]);
        id v25 = [v20 floatArray];
        BOOL v26 = (void *)[v24 initWithFloatVector:v25 label:v23];

        [v38 addObject:v26];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v27 = [(PHADatasetBuilder *)v36 _performAugmentationsOnLabeledSamples:v38 error:v35];
  if (v27)
  {
    BOOL v28 = [PHADataset alloc];
    id v29 = [(PHADatasetBuilder *)v36 options];
    id v30 = [v29 modelInputName];
    uint64_t v31 = [(PHADatasetBuilder *)v36 options];
    id v32 = [v31 labelName];
    id v33 = [(PHADataset *)v28 initWithLabeledFeatureVectors:v27 inputName:v30 labelName:v32];
  }
  else
  {
    id v33 = 0;
  }
LABEL_16:

  return v33;
}

- (id)_mergeLocalIdentifiersFromPositiveLocalIdentifiers:(id)a3 negativeLocalIdentifiers:(id)a4 numberOfPositiveSamples:(id)a5 numberOfNegativeSamples:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [(PHADatasetBuilder *)self options];
  uint64_t v17 = [v16 positivesDatasetName];
  if ([v17 isEqualToString:@"noneDataset"])
  {
  }
  else
  {
    [(PHADatasetBuilder *)self options];
    id v52 = v12;
    uint64_t v18 = self;
    id v19 = v13;
    id v20 = v14;
    id v21 = v15;
    uint64_t v23 = v22 = a7;
    id v24 = [v23 negativesDatasetName];
    int v25 = [v24 isEqualToString:@"noneDataset"];

    a7 = v22;
    id v15 = v21;
    id v14 = v20;
    id v13 = v19;
    self = v18;
    id v12 = v52;

    if (!v25)
    {
      char v26 = 0;
      goto LABEL_8;
    }
  }
  if (![v12 count] && !objc_msgSend(v13, "count"))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Not enough samples in positives (%lu) or negatives dataset (%lu) for single class training.", objc_msgSend(v12, "count"), objc_msgSend(v13, "count"), v50, v51);
    goto LABEL_29;
  }
  char v26 = 1;
LABEL_8:
  uint64_t v27 = [v14 integerValue];
  if (v27 == [v12 count])
  {
    uint64_t v28 = [v15 integerValue];
    if (v28 == [v13 count]) {
      goto LABEL_24;
    }
  }
  id v29 = [(PHADatasetBuilder *)self options];
  uint64_t v30 = [v29 datasetPolicy];

  if (v30 == 1)
  {
    [NSString stringWithFormat:@"Requested number of samples not met in  positives (%lu/%@) or negatives dataset (%lu/%@) for balanced strict training.", objc_msgSend(v12, "count"), v14, objc_msgSend(v13, "count"), v15];
    id v48 = LABEL_29:;
    [(PHADatasetBuilder *)self _generateError:a7 errorCode:2 errorMessage:v48 underlyingError:0];

LABEL_30:
    id v47 = 0;
    goto LABEL_31;
  }
  uint64_t v31 = [(PHADatasetBuilder *)self options];
  if ([v31 datasetPolicy] != 2 || objc_msgSend(v12, "count"))
  {

    goto LABEL_15;
  }
  id v47 = (void *)[v13 count];

  if (v47)
  {
LABEL_15:
    id v32 = [(PHADatasetBuilder *)self options];
    if ([v32 datasetPolicy]) {
      char v33 = 1;
    }
    else {
      char v33 = v26;
    }

    if ((v33 & 1) == 0)
    {
      if (![v12 count] || !objc_msgSend(v13, "count"))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Not enough samples in positives (%lu) or negatives dataset (%lu) for balanced training.", objc_msgSend(v12, "count"), objc_msgSend(v13, "count"), v50, v51);
        goto LABEL_29;
      }
      unint64_t v34 = [v12 count];
      unint64_t v35 = [v13 count];
      if (v34 >= v35) {
        unint64_t v34 = v35;
      }
      id v36 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v37 = [v12 allObjects];
      objc_msgSend(v37, "subarrayWithRange:", 0, v34);
      id v38 = v14;
      id v39 = v15;
      v41 = long long v40 = a7;
      uint64_t v42 = [v36 initWithArray:v41];

      a7 = v40;
      id v15 = v39;
      id v14 = v38;

      id v43 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v44 = [v13 allObjects];
      long long v45 = objc_msgSend(v44, "subarrayWithRange:", 0, v34);
      uint64_t v46 = [v43 initWithArray:v45];

      id v13 = (id)v46;
      id v12 = (id)v42;
    }
LABEL_24:
    if (![v12 intersectsSet:v13])
    {
      id v47 = [v12 setByAddingObjectsFromSet:v13];
      goto LABEL_31;
    }
    [(PHADatasetBuilder *)self _generateError:a7 errorCode:4 errorMessage:@"Positive samples and negative samples overlap" underlyingError:0];
    goto LABEL_30;
  }
  [(PHADatasetBuilder *)self _generateError:a7 errorCode:2 errorMessage:@"No samples for positve and negative datasets." underlyingError:0];
LABEL_31:

  return v47;
}

- (id)_fingerprintsForDatasetName:(id)a3 localIdentifiers:(id)a4 labelName:(id)a5 numberOfSamples:(id)a6 filters:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v44 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = [MEMORY[0x1E4F1CAD0] set];
  id v43 = [(PHADatasetBuilder *)self _assetPropertiesPredicateForKeywordFromFeatureExtractorFilters:v17];
  long long v41 = a8;
  uint64_t v42 = v15;
  if ([v16 integerValue] < 1)
  {
    id v27 = 0;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    id v20 = [v19 allObjects];

    int v21 = [v14 isEqualToString:@"randomDataset"];
    uint64_t v22 = [v16 integerValue];
    uint64_t v23 = [(PHADatasetBuilder *)self options];
    unint64_t v24 = [v23 oversamplingRate] * v22;

    if (v21)
    {
      uint64_t v48 = 0;
      int v25 = (id *)&v48;
      uint64_t v26 = [(PHADatasetBuilder *)self _randomSamplesOfCount:v24 filterPredicateForKeyword:v43 labelName:v44 error:&v48];
    }
    else
    {
      unint64_t v28 = [v20 count];
      if (v24 >= v28) {
        unint64_t v29 = v28;
      }
      else {
        unint64_t v29 = v24;
      }
      uint64_t v47 = 0;
      int v25 = (id *)&v47;
      uint64_t v26 = [(PHADatasetBuilder *)self _samplesOfCount:v29 fromLocalIdentifiers:v20 filterPredicateForKeyword:v43 error:&v47];
    }
    uint64_t v30 = (void *)v26;
    id v27 = *v25;

    if (!v30)
    {
      uint64_t v31 = [NSString stringWithFormat:@"Not enough samples for label %@ (%lu), requested: (%lu)", v44, objc_msgSend(v20, "count"), objc_msgSend(v16, "integerValue")];
      [(PHADatasetBuilder *)self _generateError:v41 errorCode:2 errorMessage:v31 underlyingError:v27];
      id v37 = 0;
      uint64_t v18 = v20;
      goto LABEL_19;
    }

    uint64_t v18 = v30;
  }
  id v46 = v27;
  uint64_t v31 = [(PHADatasetBuilder *)self _filterDataSamples:v18 filters:v17 numberOfSamples:v16 error:&v46];
  id v32 = v46;

  if (v31)
  {
    id v40 = v14;
    char v33 = [v31 allObjects];
    unint64_t v34 = [(PHADatasetBuilder *)self options];
    id v45 = v32;
    -[PHADatasetBuilder _fingerprintsForObjects:fingerprintVersion:error:](self, "_fingerprintsForObjects:fingerprintVersion:error:", v33, [v34 fingerprintVersion], &v45);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    id v36 = v45;

    if (v35)
    {
      id v35 = v35;
      id v32 = v36;
      id v37 = v35;
    }
    else
    {
      id v38 = [NSString stringWithFormat:@"Error extracting fingerprints for label %@", v44];
      [(PHADatasetBuilder *)self _generateError:v41 errorCode:1 errorMessage:v38 underlyingError:v36];

      id v37 = 0;
      id v32 = v36;
    }
    id v14 = v40;
  }
  else
  {
    id v35 = [NSString stringWithFormat:@"Error filtering samples for label %@", v44];
    [(PHADatasetBuilder *)self _generateError:v41 errorCode:10 errorMessage:v35 underlyingError:v32];
    id v37 = 0;
  }

  id v27 = v32;
LABEL_19:

  return v37;
}

- (unint64_t)_minAvailableNumberOfSamples
{
  id v3 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
    unint64_t v6 = [v5 count];
  }
  else
  {
    unint64_t v6 = -1;
  }
  id v7 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
  uint64_t v8 = [v7 count];

  if (!v8) {
    return v6;
  }
  id v9 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
  unint64_t v10 = [v9 count];

  if (v10 >= v6) {
    return v6;
  }
  else {
    return v10;
  }
}

- (id)_numberOfSamplesPerClassWithError:(id *)a3
{
  uint64_t v4 = self;
  v56[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(PHADatasetBuilder *)self options];
  unint64_t v6 = [v5 positivesDatasetName];
  int v7 = [v6 isEqualToString:@"noneDataset"];

  uint64_t v8 = [v4 options];
  id v9 = v8;
  if (v7)
  {
    unint64_t v10 = [v8 totalNumberOfSamples];

    id v11 = [v4 negativeLocalIdentifiers];
    unint64_t v12 = [v11 count];

    if (v10 >= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = v10;
    }
    v55[0] = @"positive";
    v55[1] = @"negative";
    v56[0] = &unk_1F291AB40;
    id v14 = [NSNumber numberWithUnsignedInteger:v13];
    v56[1] = v14;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = v56;
    id v17 = v55;
LABEL_11:
    uint64_t v4 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:2];
    goto LABEL_12;
  }
  uint64_t v18 = [v8 negativesDatasetName];
  int v19 = [v18 isEqualToString:@"noneDataset"];

  id v20 = [v4 options];
  int v21 = v20;
  if (v19)
  {
    unint64_t v22 = [v20 totalNumberOfSamples];

    uint64_t v23 = [v4 positiveLocalIdentifiers];
    unint64_t v24 = [v23 count];

    if (v22 >= v24) {
      unint64_t v25 = v24;
    }
    else {
      unint64_t v25 = v22;
    }
    v53[0] = @"positive";
    id v14 = [NSNumber numberWithUnsignedInteger:v25];
    v53[1] = @"negative";
    v54[0] = v14;
    v54[1] = &unk_1F291AB40;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = v54;
    id v17 = v53;
    goto LABEL_11;
  }
  uint64_t v27 = [v20 datasetPolicy];

  switch(v27)
  {
    case -1:
      [v4 _generateError:a3 errorCode:7 errorMessage:@"Unknown dataset builder policy is not supported" underlyingError:0];
      goto LABEL_30;
    case 0:
      unint64_t v28 = [v4 options];
      unint64_t v29 = (unint64_t)[v28 totalNumberOfSamples] >> 1;

      unint64_t v30 = [v4 _minAvailableNumberOfSamples];
      if (v29 >= v30) {
        unint64_t v31 = v30;
      }
      else {
        unint64_t v31 = v29;
      }
      if (!v31)
      {
        id v46 = objc_msgSend(NSString, "stringWithFormat:", @"Not enough samples per class (%lu)", 0);
        [v4 _generateError:a3 errorCode:2 errorMessage:v46 underlyingError:0];

LABEL_30:
        uint64_t v4 = 0;
        goto LABEL_13;
      }
      v51[0] = @"positive";
      id v14 = [NSNumber numberWithUnsignedInteger:v31];
      v51[1] = @"negative";
      v52[0] = v14;
      id v32 = [NSNumber numberWithUnsignedInteger:v31];
      v52[1] = v32;
      char v33 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v34 = v52;
      id v35 = v51;
LABEL_28:
      uint64_t v4 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:2];

      break;
    case 1:
      id v36 = [v4 options];
      unint64_t v37 = (unint64_t)[v36 totalNumberOfSamples] >> 1;

      v49[0] = @"positive";
      id v38 = [NSNumber numberWithUnsignedInteger:v37];
      v49[1] = @"negative";
      v50[0] = v38;
      id v39 = [NSNumber numberWithUnsignedInteger:v37];
      v50[1] = v39;
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

      goto LABEL_13;
    case 2:
      id v40 = [v4 options];
      unint64_t v41 = [v40 totalNumberOfSamples];

      unint64_t v42 = [v4 _minAvailableNumberOfSamples];
      if (v41 >= v42) {
        unint64_t v43 = v42;
      }
      else {
        unint64_t v43 = v41;
      }
      uint32_t v44 = arc4random_uniform(v43 + 1);
      unint64_t v45 = v43 - v44;
      v47[0] = @"positive";
      id v14 = [NSNumber numberWithUnsignedInteger:v44];
      v47[1] = @"negative";
      v48[0] = v14;
      id v32 = [NSNumber numberWithUnsignedInteger:v45];
      v48[1] = v32;
      char v33 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v34 = v48;
      id v35 = v47;
      goto LABEL_28;
    default:
      goto LABEL_13;
  }
LABEL_12:

LABEL_13:

  return v4;
}

- (id)datasetWithError:(id *)a3
{
  id v5 = -[PHADatasetBuilder _numberOfSamplesPerClassWithError:](self, "_numberOfSamplesPerClassWithError:");
  unint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"positive"];
    id v35 = v6;
    [v6 objectForKeyedSubscript:@"negative"];
    uint64_t v8 = v33 = a3;
    [MEMORY[0x1E4F8D638] resetPreCalculatedFeatures];
    id v9 = [(PHADatasetBuilder *)self options];
    unint64_t v10 = [v9 positivesDatasetName];
    id v11 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
    unint64_t v12 = [(PHADatasetBuilder *)self options];
    unint64_t v13 = [v12 filtersByDatasetName];
    id v14 = [v13 objectForKeyedSubscript:@"positive"];
    unint64_t v34 = [(PHADatasetBuilder *)self _fingerprintsForDatasetName:v10 localIdentifiers:v11 labelName:@"positive" numberOfSamples:v7 filters:v14 error:v33];

    id v15 = [(PHADatasetBuilder *)self options];
    id v16 = [v15 negativesDatasetName];
    id v17 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
    uint64_t v18 = [(PHADatasetBuilder *)self options];
    int v19 = [v18 filtersByDatasetName];
    id v20 = [v19 objectForKeyedSubscript:@"negative"];
    id v36 = (void *)v8;
    int v21 = [(PHADatasetBuilder *)self _fingerprintsForDatasetName:v16 localIdentifiers:v17 labelName:@"negative" numberOfSamples:v8 filters:v20 error:v33];

    unint64_t v22 = 0;
    if (v21)
    {
      uint64_t v23 = (void *)v7;
      unint64_t v24 = v34;
      if (v34)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v26 = [v34 allKeys];
        uint64_t v27 = (void *)[v25 initWithArray:v26];
        id v28 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        unint64_t v29 = [v21 allKeys];
        unint64_t v30 = (void *)[v28 initWithArray:v29];
        unint64_t v31 = [(PHADatasetBuilder *)self _mergeLocalIdentifiersFromPositiveLocalIdentifiers:v27 negativeLocalIdentifiers:v30 numberOfPositiveSamples:v7 numberOfNegativeSamples:v36 error:v33];

        if (v31)
        {
          unint64_t v22 = [(PHADatasetBuilder *)self _datasetForLocalIdentifiers:v31 positiveFingerprints:v34 negativeFingerprints:v21 error:v33];
        }
        else
        {
          unint64_t v22 = 0;
        }
      }
    }
    else
    {
      uint64_t v23 = (void *)v7;
      unint64_t v24 = v34;
    }

    unint64_t v6 = v35;
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (id)datasetForEvaluationForLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x1E4F8D638] resetPreCalculatedFeatures];
  id v35 = v6;
  unint64_t v34 = a4;
  if ([v6 isEqualToString:@"positive"])
  {
    char v33 = [(PHADatasetBuilder *)self options];
    uint64_t v7 = [v33 positivesDatasetName];
    uint64_t v8 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
    id v9 = NSNumber;
    unint64_t v10 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
    id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    unint64_t v12 = [(PHADatasetBuilder *)self options];
    unint64_t v13 = [v12 filtersByDatasetName];
    id v14 = [v13 objectForKeyedSubscript:@"positive"];
    id v15 = v33;
    id v16 = [(PHADatasetBuilder *)self _fingerprintsForDatasetName:v7 localIdentifiers:v8 labelName:@"positive" numberOfSamples:v11 filters:v14 error:a4];
  }
  else
  {
    id v17 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
    uint64_t v18 = [v17 count];

    int v19 = [(PHADatasetBuilder *)self options];
    id v20 = [v19 negativesDatasetName];
    int v21 = [v20 isEqualToString:@"randomDataset"];

    if (v21)
    {
      unint64_t v22 = [(PHADatasetBuilder *)self positiveLocalIdentifiers];
      uint64_t v18 = [v22 count];
    }
    id v15 = [(PHADatasetBuilder *)self options];
    uint64_t v7 = [v15 negativesDatasetName];
    uint64_t v8 = [(PHADatasetBuilder *)self negativeLocalIdentifiers];
    unint64_t v10 = [NSNumber numberWithUnsignedInteger:v18];
    id v11 = [(PHADatasetBuilder *)self options];
    unint64_t v12 = [v11 filtersByDatasetName];
    unint64_t v13 = [v12 objectForKeyedSubscript:@"negative"];
    id v16 = [(PHADatasetBuilder *)self _fingerprintsForDatasetName:v7 localIdentifiers:v8 labelName:@"negative" numberOfSamples:v10 filters:v13 error:a4];
  }

  if (v16)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    unint64_t v24 = [v16 allKeys];
    id v25 = (void *)[v23 initWithArray:v24];

    if (v25)
    {
      uint64_t v26 = v35;
      if ([v35 isEqualToString:@"positive"])
      {
        uint64_t v27 = self;
        id v28 = v25;
        unint64_t v29 = v16;
        unint64_t v30 = 0;
      }
      else
      {
        uint64_t v27 = self;
        id v28 = v25;
        unint64_t v29 = 0;
        unint64_t v30 = v16;
      }
      unint64_t v31 = [(PHADatasetBuilder *)v27 _datasetForLocalIdentifiers:v28 positiveFingerprints:v29 negativeFingerprints:v30 error:v34];
    }
    else
    {
      unint64_t v31 = 0;
      uint64_t v26 = v35;
    }
  }
  else
  {
    unint64_t v31 = 0;
    uint64_t v26 = v35;
  }

  return v31;
}

- (NSArray)negativeLocalIdentifiers
{
  if (!self->_negativeLocalIdentifiers)
  {
    id v3 = [(PHADatasetBuilder *)self options];
    uint64_t v4 = [v3 datasetSource];
    int v5 = [v4 isEqualToString:@"CoreDuet"];

    id v6 = [(PHADatasetBuilder *)self options];
    uint64_t v7 = v6;
    if (v5)
    {
      uint64_t v8 = [v6 negativesDatasetName];
      id v9 = [(PHADatasetBuilder *)self options];
      unint64_t v10 = [v9 negativesSubsetName];
      id v11 = [(PHADatasetBuilder *)self _localIdentifiersForCoreDuetDatasetName:v8 subsetName:v10];
      negativeLocalIdentifiers = self->_negativeLocalIdentifiers;
      self->_negativeLocalIdentifiers = v11;
    }
    else
    {
      unint64_t v13 = [v6 datasetSource];
      int v14 = [v13 isEqualToString:@"Biome"];

      if (!v14) {
        goto LABEL_7;
      }
      uint64_t v7 = [(PHADatasetBuilder *)self options];
      uint64_t v8 = [v7 negativesSubsetName];
      id v9 = [(PHADatasetBuilder *)self options];
      unint64_t v10 = [v9 negativesSubsetName];
      negativeLocalIdentifiers = [(PHADatasetBuilder *)self options];
      id v15 = [negativeLocalIdentifiers negativesDatasetType];
      id v16 = [(PHADatasetBuilder *)self readLocalIdentifiersFromBiomeStream:v8 subsetName:v10 type:v15];
      id v17 = self->_negativeLocalIdentifiers;
      self->_negativeLocalIdentifiers = v16;
    }
  }
LABEL_7:
  uint64_t v18 = self->_negativeLocalIdentifiers;

  return v18;
}

- (id)readLocalIdentifiersFromBiomeStream:(id)a3 subsetName:(id)a4 type:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F1C978];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  unint64_t v12 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_2624];
  int64_t v13 = +[PHABiomeUtilities biomeStreamFor:v10];

  if (v13)
  {
    int v14 = +[PHABiomeUtilities readUUIDsWithStream:v13 subsetName:v7 type:v8 progressReporter:v12 error:0];
    uint64_t v15 = [v14 allObjects];

    id v11 = (id)v15;
  }
  id v16 = v11;

  return v16;
}

- (NSArray)positiveLocalIdentifiers
{
  if (!self->_positiveLocalIdentifiers)
  {
    id v3 = [(PHADatasetBuilder *)self options];
    uint64_t v4 = [v3 datasetSource];
    int v5 = [v4 isEqualToString:@"CoreDuet"];

    id v6 = [(PHADatasetBuilder *)self options];
    id v7 = v6;
    if (v5)
    {
      id v8 = [v6 positivesDatasetName];
      id v9 = [(PHADatasetBuilder *)self options];
      id v10 = [v9 positivesSubsetName];
      id v11 = [(PHADatasetBuilder *)self _localIdentifiersForCoreDuetDatasetName:v8 subsetName:v10];
      positiveLocalIdentifiers = self->_positiveLocalIdentifiers;
      self->_positiveLocalIdentifiers = v11;
    }
    else
    {
      int64_t v13 = [v6 datasetSource];
      int v14 = [v13 isEqualToString:@"Biome"];

      if (!v14) {
        goto LABEL_7;
      }
      id v7 = [(PHADatasetBuilder *)self options];
      id v8 = [v7 positivesDatasetName];
      id v9 = [(PHADatasetBuilder *)self options];
      id v10 = [v9 positivesSubsetName];
      positiveLocalIdentifiers = [(PHADatasetBuilder *)self options];
      uint64_t v15 = [positiveLocalIdentifiers positivesDatasetType];
      id v16 = [(PHADatasetBuilder *)self readLocalIdentifiersFromBiomeStream:v8 subsetName:v10 type:v15];
      id v17 = self->_positiveLocalIdentifiers;
      self->_positiveLocalIdentifiers = v16;
    }
  }
LABEL_7:
  uint64_t v18 = self->_positiveLocalIdentifiers;

  return v18;
}

- (PHADatasetBuilder)initWithDatasetOptions:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHADatasetBuilder;
  id v6 = [(PHADatasetBuilder *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    positiveLocalIdentifiers = v7->_positiveLocalIdentifiers;
    v7->_positiveLocalIdentifiers = 0;

    negativeLocalIdentifiers = v7->_negativeLocalIdentifiers;
    v7->_negativeLocalIdentifiers = 0;

    id v10 = objc_alloc_init(PHACoreDuetDatasetStorage);
    datasetStore = v7->_datasetStore;
    v7->_datasetStore = v10;
  }
  return v7;
}

+ (id)labelVectorForLabelPolicy:(int64_t)a3 label:(id)a4 numberOfClasses:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = v7;
  if (a3 == 1)
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a5];
    unint64_t v10 = a5 - 1;
    if (a5 != 1)
    {
      uint64_t v11 = 0;
      do
      {
        unint64_t v12 = [NSNumber numberWithInt:0];
        [v9 insertObject:v12 atIndex:v11];

        ++v11;
      }
      while (v10 != v11);
    }
    objc_super v13 = [NSNumber numberWithInt:1];
    objc_msgSend(v9, "insertObject:atIndex:", v13, (int)objc_msgSend(v8, "intValue"));
  }
  else if (a3)
  {
    id v9 = 0;
  }
  else
  {
    v15[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }

  return v9;
}

+ (id)labelVectorsForLabelPolicy:(int64_t)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v10[0] = @"positive";
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F291ACF0];
    v10[1] = @"negative";
    v11[0] = v3;
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F291AD08];
    v11[1] = v4;
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = v11;
    id v7 = v10;
    goto LABEL_5;
  }
  if (!a3)
  {
    v12[0] = @"positive";
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F291ACC0];
    v12[1] = @"negative";
    v13[0] = v3;
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F291ACD8];
    v13[1] = v4;
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = v13;
    id v7 = v12;
LABEL_5:
    id v8 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:2];

    goto LABEL_7;
  }
  id v8 = (void *)MEMORY[0x1E4F1CC08];
LABEL_7:

  return v8;
}

+ (id)_randomIndicesWithUpperBound:(unint64_t)a3 count:(unint64_t)a4
{
  if (a3)
  {
    uint32_t v5 = a3;
    if (a3 <= a4)
    {
      id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, a3);
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      if (a4)
      {
        uint64_t v7 = 0;
        do
        {
          uint64_t v8 = arc4random_uniform(v5);
          if ([v6 containsIndex:v8])
          {
            do
              uint64_t v8 = arc4random_uniform(v5);
            while (([v6 containsIndex:v8] & 1) != 0);
          }
          [v6 addIndex:v8];
          ++v7;
        }
        while (v7 != a4);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end