@interface CRFormTextBasedDetector
+ (BOOL)_isTextRegion:(id)a3 aboveField:(id)a4 withTolerance:(double)a5;
+ (BOOL)_isTextRegion:(id)a3 onLeftOfField:(id)a4 withTolerance:(double)a5;
+ (id)bestFieldCandidate:(id)a3 secondCandidate:(id)a4;
- (CRFormAnalyzerConfiguration)configuration;
- (CRFormTextBasedDetector)initWithConfiguration:(id)a3 error:(id *)a4;
- (id)detectFormFieldsInImage:(id)a3 document:(id)a4 candidateFields:(id)a5;
@end

@implementation CRFormTextBasedDetector

- (CRFormTextBasedDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRFormTextBasedDetector;
  v7 = [(CRFormTextBasedDetector *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_configuration, a3);
  }

  return v8;
}

+ (BOOL)_isTextRegion:(id)a3 aboveField:(id)a4 withTolerance:(double)a5
{
  id v7 = a4;
  v8 = [a3 boundingQuad];
  v9 = [v7 boundingQuad];
  [v8 size];
  double v11 = v10;
  [v9 topRight];
  double v13 = v12;
  [v8 bottomRight];
  double v15 = v14;
  [v8 size];
  double v17 = v16;
  [v8 topLeft];
  double v19 = v18;
  [v9 topLeft];
  double v21 = v20;
  [v8 topRight];
  double v23 = v22;
  [v9 topRight];
  BOOL v24 = vabdd_f64(v19, v21) < v17 / 5.0;
  double v25 = v13 - v15;
  if (vabdd_f64(v23, v26) < v17 / 5.0) {
    BOOL v24 = 1;
  }
  BOOL v27 = v25 < v11 * a5;
  if (v25 <= v11 * -0.5) {
    BOOL v27 = 0;
  }
  BOOL v28 = v27 && v24;

  return v28;
}

+ (BOOL)_isTextRegion:(id)a3 onLeftOfField:(id)a4 withTolerance:(double)a5
{
  id v7 = a4;
  v8 = [a3 boundingQuad];
  v9 = [v7 boundingQuad];
  [v8 size];
  double v11 = v10;
  [v9 topLeft];
  double v13 = v12;
  [v8 topRight];
  double v15 = v14;
  [v8 topRight];
  double v17 = v16;
  [v9 topRight];
  double v19 = v18;
  [v8 bottomRight];
  double v21 = v20;
  [v9 bottomRight];
  BOOL v22 = vabdd_f64(v17, v19) < v11 * 0.5;
  char v24 = vabdd_f64(v21, v23) < v11 * 0.5 || v22;
  [v9 topRight];
  double v26 = v25;
  [v8 topRight];
  double v27 = v13 - v15;
  if (v26 > v28) {
    char v29 = v24;
  }
  else {
    char v29 = 0;
  }
  if (v27 >= v11 * a5) {
    char v29 = 0;
  }
  if (v27 > -(a5 * v11)) {
    BOOL v30 = v29;
  }
  else {
    BOOL v30 = 0;
  }

  return v30;
}

+ (id)bestFieldCandidate:(id)a3 secondCandidate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      v8 = [v5 boundingQuad];
      [v8 boundingBox];
      double v10 = v9;
      double v11 = [v7 boundingQuad];
      [v11 boundingBox];
      if (v10 <= v12) {
        double v13 = v7;
      }
      else {
        double v13 = v5;
      }
      id v14 = v13;

      goto LABEL_10;
    }
    id v15 = v6;
  }
  else
  {
    id v15 = v5;
  }
  id v14 = v15;
LABEL_10:

  return v14;
}

- (id)detectFormFieldsInImage:(id)a3 document:(id)a4 candidateFields:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v33 = a4;
  id v7 = a5;
  id v34 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  [v33 contentsWithTypes:8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v14 = [v13 text];
        BOOL v15 = +[CRFormUtilities stringEndsWithColon:v14];

        if (v15) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }

  for (unint64_t j = 0; j < [v8 count]; ++j)
  {
    double v17 = [v8 objectAtIndexedSubscript:j];
    for (unint64_t k = 0; k < [v7 count]; ++k)
    {
      double v19 = [v7 objectAtIndexedSubscript:k];
      if ([v19 fieldType] == 1)
      {
        double v20 = [v17 boundingQuad];
        double v21 = [v19 boundingQuad];
        [v20 boundingBoxIOUWithQuad:v21];
        double v23 = v22;

        if (v23 <= 0.2)
        {
          char v24 = [v19 boundingQuad];
          [v24 size];
          double v26 = v25;
          double v27 = [v17 boundingQuad];
          [v27 size];
          BOOL v29 = v26 < v28 * 3.0;

          if (!v29)
          {
            BOOL v30 = +[CRFormTextBasedDetector _isTextRegion:v17 onLeftOfField:v19 withTolerance:1.0];
            if ((v30 | +[CRFormTextBasedDetector _isTextRegion:v17 aboveField:v19 withTolerance:2.0]) == 1)
            {
              [v19 setFieldType:1];
              [v19 setFieldSource:3];
              [v34 addObject:v19];
            }
          }
        }
      }
    }
  }

  return v34;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return (CRFormAnalyzerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end