@interface CalibrationModelManager
- (BOOL)loadModel;
- (BOOL)loaded;
- (CalibrationModelManager)initWithChunkSize:(unint64_t)a3;
- (CalibrationModelManager)initWithChunkSize:(unint64_t)a3 batchSize:(unint64_t)a4;
- (calibration)model;
- (id)batchPredict:(id)a3 documentEmbeddings:(id)a4 queryID:(int64_t)a5;
- (id)convertEmbeddingToMLMultiArray:(id)a3 atIndex:(unint64_t)a4 queryID:(int64_t)a5;
- (id)predict:(id)a3 documentEmbedding:(id)a4 queryID:(int64_t)a5;
- (unint64_t)batchSize;
- (unint64_t)chunkSize;
- (void)clear;
- (void)loadModel;
- (void)performBatchInferenceWithInputs:(id)a3 documentIndices:(id)a4 results:(id)a5 queryID:(int64_t)a6;
- (void)setBatchSize:(unint64_t)a3;
- (void)setChunkSize:(unint64_t)a3;
- (void)setModel:(id)a3;
@end

@implementation CalibrationModelManager

- (CalibrationModelManager)initWithChunkSize:(unint64_t)a3 batchSize:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CalibrationModelManager;
  result = [(CalibrationModelManager *)&v7 init];
  if (result)
  {
    result->_chunkSize = a3;
    result->_batchSize = a4;
  }
  return result;
}

- (CalibrationModelManager)initWithChunkSize:(unint64_t)a3
{
  return [(CalibrationModelManager *)self initWithChunkSize:a3 batchSize:50];
}

- (BOOL)loadModel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_loaded = 0;
  v3 = SSDefaultsGetAssetPath(@"searchtool_calibration.mlmodelc");
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v11 = 0;
  v5 = [[calibration alloc] initWithContentsOfURL:v4 error:&v11];
  id v6 = v11;
  model = self->_model;
  self->_model = v5;

  v8 = SSGeneralLog();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CalibrationModelManager *)(uint64_t)v6 loadModel];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = @"searchtool_calibration.mlmodelc";
      _os_log_impl(&dword_1BDB2A000, v9, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][Calibration] Successfully loaded searchtool calibration model %@ ", buf, 0xCu);
    }

    self->_loaded = 1;
  }

  return v6 == 0;
}

- (id)predict:(id)a3 documentEmbedding:(id)a4 queryID:(int64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v15[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12 = [(CalibrationModelManager *)self batchPredict:v8 documentEmbeddings:v11 queryID:a5];

    if (v12 && [v12 count])
    {
      v13 = [v12 firstObject];
      goto LABEL_9;
    }
  }
  else
  {
    v12 = SSGeneralLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager predict:documentEmbedding:queryID:]();
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (id)batchPredict:(id)a3 documentEmbeddings:(id)a4 queryID:(int64_t)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(CalibrationModelManager *)self loaded])
  {
    v23 = SSGeneralLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager batchPredict:documentEmbeddings:queryID:]();
    }
    goto LABEL_24;
  }
  if (!v8 || !v9)
  {
    v23 = SSGeneralLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager predict:documentEmbedding:queryID:]();
    }
LABEL_24:
    v24 = 0;
    goto LABEL_29;
  }
  v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v9 count])
  {
    uint64_t v11 = 0;
    v27 = v9;
    while (1)
    {
      uint64_t v29 = v11;
      v30 = [v9 objectAtIndexedSubscript:v11];
      v12 = [v30 vectors];
      unint64_t v13 = [v12 count];

      unint64_t v14 = [(CalibrationModelManager *)self chunkSize];
      unint64_t v15 = v13 >= v14 ? v14 : v13;
      if (v15) {
        break;
      }
LABEL_16:

      uint64_t v11 = v29 + 1;
      id v9 = v27;
      if (v29 + 1 >= (unint64_t)[v27 count]) {
        goto LABEL_17;
      }
    }
    uint64_t v16 = 0;
    while (1)
    {
      v17 = [(CalibrationModelManager *)self convertEmbeddingToMLMultiArray:v8 atIndex:0 queryID:a5];
      uint64_t v18 = [(CalibrationModelManager *)self convertEmbeddingToMLMultiArray:v30 atIndex:v16 queryID:a5];
      v19 = (void *)v18;
      if (!v17 || !v18) {
        break;
      }
      v20 = [[calibrationInput alloc] initWithQuery_embedding:v17 document_embedding:v18];
      [v10 addObject:v20];
      v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v29];
      [v31 addObject:v21];

      uint64_t v22 = [v10 count];
      if (v22 == [(CalibrationModelManager *)self batchSize])
      {
        [(CalibrationModelManager *)self performBatchInferenceWithInputs:v10 documentIndices:v31 results:v28 queryID:a5];
        [v10 removeAllObjects];
        [v31 removeAllObjects];
      }

      if (v15 == ++v16) {
        goto LABEL_16;
      }
    }
    v25 = SSGeneralLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      int64_t v33 = a5;
      __int16 v34 = 2048;
      uint64_t v35 = v29;
      __int16 v36 = 2048;
      uint64_t v37 = v16;
      _os_log_error_impl(&dword_1BDB2A000, v25, OS_LOG_TYPE_ERROR, "[qid=%ld][SpotlightRanking][Calibration] Failed to convert embeddings to MLMultiArray at document index %lu, embedding index %lu", buf, 0x20u);
    }

    v24 = 0;
    id v9 = v27;
    v23 = v28;
  }
  else
  {
LABEL_17:
    v23 = v28;
    if ([v10 count]) {
      [(CalibrationModelManager *)self performBatchInferenceWithInputs:v10 documentIndices:v31 results:v28 queryID:a5];
    }
    v24 = v28;
  }

LABEL_29:
  return v24;
}

- (void)performBatchInferenceWithInputs:(id)a3 documentIndices:(id)a4 results:(id)a5 queryID:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(CalibrationModelManager *)self model];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1E9E0]);
  id v31 = 0;
  unint64_t v14 = [v12 predictionsFromInputs:v9 options:v13 error:&v31];
  id v15 = v31;

  if (v15 || !v14)
  {
    v30 = SSGeneralLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager performBatchInferenceWithInputs:documentIndices:results:queryID:]();
    }
  }
  else if ([v14 count])
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [v10 objectAtIndexedSubscript:v16];
      uint64_t v18 = [v14 objectAtIndexedSubscript:v16];
      v19 = [v18 output];
      v20 = [v19 objectAtIndexedSubscript:0];
      [v20 floatValue];
      float v22 = v21;

      unint64_t v23 = [v17 unsignedIntegerValue];
      if (v23 >= [v11 count])
      {
        *(float *)&double v24 = v22;
        uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithFloat:v24];
        [v11 addObject:v29];
      }
      else
      {
        v25 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v17, "unsignedIntegerValue"));
        [v25 floatValue];
        float v27 = v26;

        if (v27 >= v22) {
          *(float *)&double v28 = v27;
        }
        else {
          *(float *)&double v28 = v22;
        }
        uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithFloat:v28];
        objc_msgSend(v11, "setObject:atIndexedSubscript:", v29, objc_msgSend(v17, "unsignedIntegerValue"));
      }

      ++v16;
    }
    while (v16 < [v14 count]);
  }
}

- (id)convertEmbeddingToMLMultiArray:(id)a3 atIndex:(unint64_t)a4 queryID:(int64_t)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = v6;
  if (!v6)
  {
    id v11 = SSGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager convertEmbeddingToMLMultiArray:atIndex:queryID:]();
    }
    goto LABEL_13;
  }
  id v8 = [v6 vectors];
  unint64_t v9 = [v8 count];

  if (v9 <= a4)
  {
    id v11 = SSGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager convertEmbeddingToMLMultiArray:atIndex:queryID:].cold.6();
    }
LABEL_13:
    id v17 = 0;
    goto LABEL_28;
  }
  id v10 = [v7 vectors];
  id v11 = [v10 objectAtIndexedSubscript:a4];

  if (!v11)
  {
    unint64_t v16 = SSGeneralLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager convertEmbeddingToMLMultiArray:atIndex:queryID:]();
    }
    goto LABEL_18;
  }
  unsigned int v12 = [v7 dimension];
  if (v12 >= 3)
  {
    unint64_t v16 = SSGeneralLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CalibrationModelManager convertEmbeddingToMLMultiArray:atIndex:queryID:].cold.5();
    }
    goto LABEL_18;
  }
  unsigned int v13 = v12;
  uint64_t v14 = 65552;
  int v15 = [v7 format];
  if (!v15)
  {
    uint64_t v14 = 65568;
LABEL_20:
    id v18 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    v26[0] = &unk_1F1861A30;
    v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:((unint64_t)v13 << 8) + 256];
    v26[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    id v25 = 0;
    float v21 = (void *)[v18 initWithShape:v20 dataType:v14 error:&v25];
    unint64_t v16 = v25;

    if (v16 || !v21)
    {
      unint64_t v23 = SSGeneralLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CalibrationModelManager convertEmbeddingToMLMultiArray:atIndex:queryID:].cold.4();
      }

      id v17 = 0;
    }
    else
    {
      id v22 = v21;
      -[NSObject getBytes:length:](v11, "getBytes:length:", [v22 dataPointer], -[NSObject length](v11, "length"));
      id v17 = v22;
    }

    goto LABEL_27;
  }
  if (v15 == 1) {
    goto LABEL_20;
  }
  unint64_t v16 = SSGeneralLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CalibrationModelManager convertEmbeddingToMLMultiArray:atIndex:queryID:]();
  }
LABEL_18:
  id v17 = 0;
LABEL_27:

LABEL_28:
  return v17;
}

- (void)clear
{
  self->_model = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_chunkSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (calibration)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)loadModel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  v3 = @"searchtool_calibration.mlmodelc";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "[SpotlightRanking][Calibration] Failed to load searchtool calibration model %@ with err %@", (uint8_t *)&v2, 0x16u);
}

- (void)predict:documentEmbedding:queryID:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Query embedding and document embedding should not be nil", v2, v3, v4, v5, v6);
}

- (void)batchPredict:documentEmbeddings:queryID:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Calibration model is not loaded", v2, v3, v4, v5, v6);
}

- (void)performBatchInferenceWithInputs:documentIndices:results:queryID:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Searchtool calibration batch prediction failed with error %@");
}

- (void)convertEmbeddingToMLMultiArray:atIndex:queryID:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Embedding is nil", v2, v3, v4, v5, v6);
}

- (void)convertEmbeddingToMLMultiArray:atIndex:queryID:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_2_1(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Empty vector data in _CSEmbedding at index %lu", v2, v3);
}

- (void)convertEmbeddingToMLMultiArray:atIndex:queryID:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Unsupported vector format", v2, v3, v4, v5, v6);
}

- (void)convertEmbeddingToMLMultiArray:atIndex:queryID:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Failed to create MLMultiArray: %@");
}

- (void)convertEmbeddingToMLMultiArray:atIndex:queryID:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Invalid embedding dimension", v2, v3, v4, v5, v6);
}

- (void)convertEmbeddingToMLMultiArray:atIndex:queryID:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[qid=%ld][SpotlightRanking][Calibration] Index out of bounds in _CSEmbedding vectors", v2, v3, v4, v5, v6);
}

@end