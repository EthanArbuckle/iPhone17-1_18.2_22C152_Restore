@interface EvaluationDataSourceEspressoWrapper
- (EvaluationDataSourceEspressoWrapper)initWithEvaluatorDataSource:(id)a3;
- (EvaluatorDataSource)dataSource;
- (id)dataPointAtIndex:(int)a3;
- (id)dataProcessAtIndex:(int)a3;
- (id)featureProviderAtIndex:(int)a3;
- (int)numberOfDataPoints;
- (void)setDataSource:(id)a3;
@end

@implementation EvaluationDataSourceEspressoWrapper

- (EvaluationDataSourceEspressoWrapper)initWithEvaluatorDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EvaluationDataSourceEspressoWrapper;
  v6 = [(EvaluationDataSourceEspressoWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = v7;
  }

  return v7;
}

- (id)dataProcessAtIndex:(int)a3
{
  v79[2] = *MEMORY[0x263EF8340];
  v4 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
  uint64_t v5 = [v4 batchSize];

  v6 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
  v7 = [v6 modelFeatures];

  v56 = v7;
  v57 = [v7 componentsSeparatedByString:@","];
  uint64_t v61 = [v57 count];
  id v8 = objc_alloc(MEMORY[0x263F00DA8]);
  v9 = [NSNumber numberWithInt:v5];
  v79[0] = v9;
  objc_super v10 = [NSNumber numberWithInt:v61];
  v79[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  id v71 = 0;
  v68 = (void *)[v8 initWithShape:v11 dataType:65600 error:&v71];
  id v12 = v71;

  id v13 = objc_alloc(MEMORY[0x263F00DA8]);
  v14 = [NSNumber numberWithInt:v5];
  v78[0] = v14;
  v78[1] = &unk_26F09F950;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
  id v70 = v12;
  v62 = (void *)[v13 initWithShape:v15 dataType:65600 error:&v70];
  id v60 = v70;

  id v63 = objc_alloc_init(MEMORY[0x263F3B760]);
  v16 = v60;
  if ((int)v5 >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v58 = v5;
    uint64_t v59 = (int)v5 * a3;
    do
    {
      v18 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
      uint64_t v19 = v17 + v59;
      id v65 = [v18 dataForRecord:v17 + v59];

      v20 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
      v21 = [v20 modelFeatures];
      BOOL v22 = [v21 length] == 0;

      if (v22)
      {
        v25 = v65;
      }
      else
      {
        v23 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
        uint64_t v24 = [v23 extractFeatureDataForRecord:v19];

        v25 = (void *)v24;
      }
      id v66 = v25;
      unint64_t v26 = [v25 length];
      id v67 = v66;
      objc_msgSend(v63, "setData:size:forKey:freeWhenDone:", objc_msgSend(v67, "bytes"), v26 >> 2, @"data", 0);
      uint64_t v27 = [v63 bufferWithKey:@"data"];
      if ((int)v61 >= 1)
      {
        uint64_t v29 = v27;
        uint64_t v30 = 0;
        do
        {
          LODWORD(v28) = *(_DWORD *)(v29 + 4 * v30);
          v31 = [NSNumber numberWithFloat:v28];
          v32 = [NSNumber numberWithInt:v17];
          v77[0] = v32;
          v33 = [NSNumber numberWithInt:v30];
          v77[1] = v33;
          v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
          [v68 setObject:v31 forKeyedSubscript:v34];

          ++v30;
        }
        while (v61 != v30);
      }
      v35 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
      uint64_t v36 = [v35 classificationForRecord:v19];

      v37 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
      v38 = [v37 vectorForClassification:v36];

      for (uint64_t i = 0; i < (int)[v38 count]; ++i)
      {
        v40 = [v38 objectAtIndex:i];
        [v40 doubleValue];
        BOOL v42 = v41 == 0.9999;

        if (v42)
        {
          LODWORD(v36) = i;
          break;
        }
      }
      v43 = (float *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
      float *v43 = (float)(int)v36;
      [v63 setData:v43 size:1 forKey:@"label" freeWhenDone:0];
      *(float *)&double v44 = *v43;
      v45 = [NSNumber numberWithFloat:v44];
      v46 = [NSNumber numberWithInt:v17];
      v76[0] = v46;
      v76[1] = &unk_26F09F968;
      v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
      [v62 setObject:v45 forKeyedSubscript:v47];

      ++v17;
      v16 = v60;
    }
    while (v17 != v58);
  }
  v48 = [(EvaluatorDataSource *)self->_dataSource modelInputSchemaInputName];
  v49 = [(EvaluatorDataSource *)self->_dataSource modelInputSchemaLabelName];
  id v50 = objc_alloc(MEMORY[0x263F00D38]);
  v74[0] = v48;
  v74[1] = v49;
  v75[0] = v68;
  v75[1] = v62;
  v51 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
  id v69 = v16;
  v52 = (void *)[v50 initWithDictionary:v51 error:&v69];
  id v53 = v69;

  v72[0] = @"ETDataPoint";
  v72[1] = @"MLDictionaryFeatureProvider";
  v73[0] = v63;
  v73[1] = v52;
  v54 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];

  return v54;
}

- (id)dataPointAtIndex:(int)a3
{
  v3 = [(EvaluationDataSourceEspressoWrapper *)self dataProcessAtIndex:*(void *)&a3];
  v4 = [v3 objectForKeyedSubscript:@"ETDataPoint"];

  return v4;
}

- (id)featureProviderAtIndex:(int)a3
{
  v3 = [(EvaluationDataSourceEspressoWrapper *)self dataProcessAtIndex:*(void *)&a3];
  v4 = [v3 objectForKeyedSubscript:@"MLDictionaryFeatureProvider"];

  return v4;
}

- (int)numberOfDataPoints
{
  v2 = [(EvaluationDataSourceEspressoWrapper *)self dataSource];
  int v3 = [v2 recordCount];

  return v3;
}

- (EvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end