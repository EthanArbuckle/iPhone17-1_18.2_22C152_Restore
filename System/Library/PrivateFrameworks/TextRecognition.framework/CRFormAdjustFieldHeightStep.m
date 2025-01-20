@interface CRFormAdjustFieldHeightStep
- (CRFormAdjustFieldHeightStep)init;
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormAdjustFieldHeightStep

- (CRFormAdjustFieldHeightStep)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRFormAdjustFieldHeightStep;
  v2 = [(CRFormAdjustFieldHeightStep *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4 = [v3 objectForKey:@"com.apple.CoreRecognition.signature_field_height"];

    if (v4)
    {
      [v4 floatValue];
      double v6 = v5;
    }
    else
    {
      double v6 = 1.15;
    }
    v2->_underlinedSignatureFieldHeightScaling = v6;
  }
  return v2;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  objc_super v8 = [v7 _flattenedFields];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v13 = CRCastAsClass<CRFormTextFieldOutputRegion>(v12);
        if (v13
          && ([v12 hasBoundedHeight] & 1) == 0
          && [v12 hasBoundedWidth])
        {
          double underlinedSignatureFieldHeightScaling = 1.15;
          if ([v12 textContentType] == 50) {
            double underlinedSignatureFieldHeightScaling = self->_underlinedSignatureFieldHeightScaling;
          }
          v15 = [v12 boundingQuad];
          [v15 topLeft];
          double v17 = v16;
          double v19 = v18;
          [v15 topRight];
          double v21 = v20;
          double v38 = v22;
          double v39 = v17;
          [v15 size];
          double v24 = v23;
          v25 = [CRNormalizedQuad alloc];
          [v15 bottomRight];
          double v27 = v26;
          double v29 = v28;
          [v15 bottomLeft];
          double v31 = v30;
          double v33 = v32;
          [v15 normalizationSize];
          v36 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v25, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v39, v19 - (underlinedSignatureFieldHeightScaling + -1.0) * v24, v38, v21 - (underlinedSignatureFieldHeightScaling + -1.0) * v24, v27, v29, v31, v33, v34, v35);
          [v13 setBoundingQuad:v36];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v9);
  }

  return v7;
}

@end