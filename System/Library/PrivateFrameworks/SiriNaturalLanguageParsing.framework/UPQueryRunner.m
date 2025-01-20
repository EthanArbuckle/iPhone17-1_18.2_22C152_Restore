@interface UPQueryRunner
- (NSSet)domainModelBundles;
- (UPCalibration)_calibration;
- (UPContextualizer)_contextualizer;
- (UPDialogActConverter)_dialogActConverter;
- (UPParserModel)coreModel;
- (UPQueryRunner)initWithCoreModel:(id)a3 domainModelBundles:(id)a4;
- (UPQueryRunner)initWithCoreModel:(id)a3 domainModels:(id)a4;
- (id)combinedResultFromResults:(id)a3;
- (id)dialogActFromQuery:(id)a3;
- (id)multiTurnPredictionFromQuery:(id)a3 modelIdentifierToDomainResults:(id)a4 dialogAct:(id)a5 error:(id *)a6;
- (id)predictionFromProtobufQuery:(id)a3 error:(id *)a4;
- (id)predictionFromQuery:(id)a3 error:(id *)a4;
- (id)singleTurnPredictionFromDomainResults:(id)a3;
@end

@implementation UPQueryRunner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contextualizer, 0);
  objc_storeStrong((id *)&self->__dialogActConverter, 0);
  objc_storeStrong((id *)&self->__calibration, 0);
  objc_storeStrong((id *)&self->_domainModelBundles, 0);
  objc_storeStrong((id *)&self->_coreModel, 0);
}

- (UPContextualizer)_contextualizer
{
  return self->__contextualizer;
}

- (UPDialogActConverter)_dialogActConverter
{
  return self->__dialogActConverter;
}

- (UPCalibration)_calibration
{
  return self->__calibration;
}

- (NSSet)domainModelBundles
{
  return self->_domainModelBundles;
}

- (UPParserModel)coreModel
{
  return self->_coreModel;
}

- (id)multiTurnPredictionFromQuery:(id)a3 modelIdentifierToDomainResults:(id)a4 dialogAct:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v23 = a4;
  v24 = v10;
  id v25 = a5;
  v11 = [(UPParserModel *)self->_coreModel predictionFromQuery:v10 error:a6];
  v26 = v11;
  if (!v11)
  {
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  if (![v11 candidateCount])
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.uaapcustomluframework", 2, 0, v23);
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v12 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v23;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v18 = objc_msgSend(v13, "objectForKeyedSubscript:", v17, v23);
        v19 = [[UPContextualizerInput alloc] initWithDomainResult:v18 coreResult:v26 modelIdentifier:v17 query:v24 dialogAct:v25];
        v20 = [(UPContextualizer *)self->__contextualizer resultWithContextualizerInput:v19];
        [v12 addObject:v20];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  v21 = [(UPQueryRunner *)self combinedResultFromResults:v12];

LABEL_14:
  return v21;
}

- (id)singleTurnPredictionFromDomainResults:(id)a3
{
  v3 = [(UPQueryRunner *)self combinedResultFromResults:a3];
  return v3;
}

- (id)combinedResultFromResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v19 = NSStringFromSelector(sel_queryUUID);
  v20 = [v21 valueForKey:v19];
  v3 = [v20 anyObject];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v21;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v10 = [v9 candidateCount];
        if (v10 >= 1)
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            v12 = [v9 candidateAtRank:j];
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  id v13 = NSStringFromSelector(sel_probability);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:v13 ascending:0];
  v26 = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v16 = [v4 sortedArrayUsingDescriptors:v15];

  uint64_t v17 = [[UPResult alloc] initWithCandidates:v16 queryUUID:v3];
  return v17;
}

- (id)dialogActFromQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 dialogAct];

  if (v5)
  {
    dialogActConverter = self->__dialogActConverter;
    uint64_t v7 = [v4 dialogAct];
    id v15 = 0;
    v8 = [(UPDialogActConverter *)dialogActConverter convertFromDialogAct:v7 error:&v15];
    id v9 = v15;

    uint64_t v10 = SNLPOSLoggerForCategory(3);
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = [v8 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEBUG, "Converted dialog act and got: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v9 localizedDescription];
      *(_DWORD *)buf = 138739971;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_ERROR, "Could not convert query dialog act: %{sensitive}@", buf, 0xCu);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)predictionFromQuery:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v5 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v36;
    _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_DEBUG, "UPQuery from non-proto service: %@", buf, 0xCu);
  }

  v33 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = self->_domainModelBundles;
  uint64_t v6 = [(NSSet *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v35 = *(void *)v41;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v41 != v35) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v40 + 1) + 8 * v7);
      id v9 = [v8 parserModel];
      uint64_t v10 = [v9 identifier];

      v11 = [v8 preprocessor];
      id v39 = 0;
      v12 = [v11 preprocess:v36 error:&v39];
      id v13 = v39;

      if (!v12)
      {
        if (a4) {
          *a4 = v13;
        }
        int v21 = 1;
        goto LABEL_27;
      }
      uint64_t v14 = [v8 parserModel];
      id v15 = [v14 predictionFromQuery:v36 preprocessorOutput:v12 error:a4];

      if (v15)
      {
        if ([v15 candidateCount])
        {
          [v33 setObject:v15 forKey:v10];
          v16 = [v8 calibrationModel];
          uint64_t v17 = v16;
          if (v16)
          {
            id v38 = 0;
            uint64_t v18 = [v16 scoreFromQuery:v36 preprocessorOutput:v12 error:&v38];
            id v19 = v38;
            v20 = v19;
            if (v18)
            {
              [v32 setObject:v18 forKey:v10];

              int v21 = 0;
            }
            else
            {
              if (a4) {
                *a4 = v19;
              }
              int v21 = 1;
            }
          }
          else
          {
            int v21 = 0;
          }

          goto LABEL_26;
        }
        if (a4)
        {
          *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:2 userInfo:0];
        }
      }
      int v21 = 1;
LABEL_26:

LABEL_27:
      if (v21)
      {
        v26 = 0;
        goto LABEL_40;
      }
      if (v6 == ++v7)
      {
        uint64_t v6 = [(NSSet *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  calibration = self->__calibration;
  id v37 = 0;
  long long v23 = [(UPCalibration *)calibration calibrateParserResults:v33 withCalibrationScores:v32 error:&v37];
  obuint64_t j = (NSSet *)v37;
  if (v23)
  {
    uint64_t v24 = [(UPQueryRunner *)self dialogActFromQuery:v36];
    long long v25 = (void *)v24;
    if (self->_coreModel && v24)
    {
      v26 = [(UPQueryRunner *)self multiTurnPredictionFromQuery:v36 modelIdentifierToDomainResults:v23 dialogAct:v24 error:a4];
    }
    else
    {
      long long v27 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v28 = [v23 allValues];
      long long v29 = [v27 setWithArray:v28];

      v26 = [(UPQueryRunner *)self singleTurnPredictionFromDomainResults:v29];
    }
  }
  else
  {
    v26 = 0;
    if (a4) {
      *a4 = obj;
    }
  }

LABEL_40:
  return v26;
}

- (id)predictionFromProtobufQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0;
  uint64_t v7 = [[UPQuery alloc] initWithProtobufQuery:v6 error:&v14];
  id v8 = v14;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = [(UPQueryRunner *)self predictionFromQuery:v7 error:a4];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 protobufRepresentation];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v12;
}

- (UPQueryRunner)initWithCoreModel:(id)a3 domainModels:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 preprocessor];
        id v14 = [[UPModelBundle alloc] initWithPreprocessor:v13 parserModel:v12 calibrationModel:0];
        [v7 addObject:v14];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v15 = [(UPQueryRunner *)self initWithCoreModel:v5 domainModelBundles:v7];
  return v15;
}

- (UPQueryRunner)initWithCoreModel:(id)a3 domainModelBundles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UPQueryRunner;
  uint64_t v9 = [(UPQueryRunner *)&v19 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreModel, a3);
    objc_storeStrong((id *)&v10->_domainModelBundles, a4);
    v11 = objc_alloc_init(UPCalibration);
    calibration = v10->__calibration;
    v10->__calibration = v11;

    id v13 = objc_alloc_init(UPUsoSerializer);
    id v14 = [[UPDialogActConverter alloc] initWithUsoSerializer:v13];
    dialogActConverter = v10->__dialogActConverter;
    v10->__dialogActConverter = v14;

    v16 = objc_alloc_init(UPContextualizer);
    contextualizer = v10->__contextualizer;
    v10->__contextualizer = v16;
  }
  return v10;
}

@end