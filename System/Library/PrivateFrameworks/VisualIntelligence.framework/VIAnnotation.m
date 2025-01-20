@interface VIAnnotation
- (BOOL)isEqual:(id)a3;
- (NSArray)faceAnnotations;
- (NSArray)humanAnnotations;
- (NSArray)nsfwAnnotations;
- (VIAnnotation)initWithAnnotations:(id)a3 humanAnnotations:(id)a4 nsfwAnnotations:(id)a5 textBlockAnnotation:(id)a6;
- (VIAnnotation)initWithFaceAnnotations:(id)a3 humanAnnotations:(id)a4 nsfwAnnotations:(id)a5 textBlockAnnotation:(id)a6 scenenetAnnotation:(id)a7 barcodeAnnotation:(id)a8;
- (VIAnnotation)initWithReducePersonOverTriggerAnnotation:(id)a3 faceAnnotations:(id)a4 humanAnnotations:(id)a5 nsfwAnnotations:(id)a6 textBlockAnnotation:(id)a7 scenenetAnnotation:(id)a8 barcodeAnnotation:(id)a9;
- (VIAnnotation)initWithTextAnnotations:(id)a3;
- (VIBarcodeAnnotation)barcodeAnnotation;
- (VIReducePersonOverTriggerAnnotation)reducePersonOverTriggerAnnotation;
- (VIScenenetAnnotation)scenenetAnnotation;
- (VITextBlockAnnotation)textBlockAnnotation;
- (unint64_t)hash;
@end

@implementation VIAnnotation

- (VIAnnotation)initWithFaceAnnotations:(id)a3 humanAnnotations:(id)a4 nsfwAnnotations:(id)a5 textBlockAnnotation:(id)a6 scenenetAnnotation:(id)a7 barcodeAnnotation:(id)a8
{
  return [(VIAnnotation *)self initWithReducePersonOverTriggerAnnotation:0 faceAnnotations:a3 humanAnnotations:a4 nsfwAnnotations:a5 textBlockAnnotation:a6 scenenetAnnotation:a7 barcodeAnnotation:a8];
}

- (VIAnnotation)initWithReducePersonOverTriggerAnnotation:(id)a3 faceAnnotations:(id)a4 humanAnnotations:(id)a5 nsfwAnnotations:(id)a6 textBlockAnnotation:(id)a7 scenenetAnnotation:(id)a8 barcodeAnnotation:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)VIAnnotation;
  v22 = [(VIAnnotation *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    reducePersonOverTriggerAnnotation = v22->_reducePersonOverTriggerAnnotation;
    v22->_reducePersonOverTriggerAnnotation = (VIReducePersonOverTriggerAnnotation *)v23;

    uint64_t v25 = [v16 copy];
    faceAnnotations = v22->_faceAnnotations;
    v22->_faceAnnotations = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    humanAnnotations = v22->_humanAnnotations;
    v22->_humanAnnotations = (NSArray *)v27;

    uint64_t v29 = [v18 copy];
    nsfwAnnotations = v22->_nsfwAnnotations;
    v22->_nsfwAnnotations = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    textBlockAnnotation = v22->_textBlockAnnotation;
    v22->_textBlockAnnotation = (VITextBlockAnnotation *)v31;

    uint64_t v33 = [v20 copy];
    scenenetAnnotation = v22->_scenenetAnnotation;
    v22->_scenenetAnnotation = (VIScenenetAnnotation *)v33;

    uint64_t v35 = [v21 copy];
    barcodeAnnotation = v22->_barcodeAnnotation;
    v22->_barcodeAnnotation = (VIBarcodeAnnotation *)v35;
  }
  return v22;
}

- (VIAnnotation)initWithTextAnnotations:(id)a3
{
  return [(VIAnnotation *)self initWithReducePersonOverTriggerAnnotation:0 faceAnnotations:0 humanAnnotations:0 nsfwAnnotations:0 textBlockAnnotation:a3 scenenetAnnotation:0 barcodeAnnotation:0];
}

- (VIAnnotation)initWithAnnotations:(id)a3 humanAnnotations:(id)a4 nsfwAnnotations:(id)a5 textBlockAnnotation:(id)a6
{
  return [(VIAnnotation *)self initWithReducePersonOverTriggerAnnotation:0 faceAnnotations:a3 humanAnnotations:a4 nsfwAnnotations:a5 textBlockAnnotation:a6 scenenetAnnotation:0 barcodeAnnotation:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIAnnotation *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    faceAnnotations = self->_faceAnnotations;
    v8 = [(VIAnnotation *)v6 faceAnnotations];
    if (VIObjectIsEqual((unint64_t)faceAnnotations, (uint64_t)v8))
    {
      humanAnnotations = self->_humanAnnotations;
      v10 = [(VIAnnotation *)v6 humanAnnotations];
      if (VIObjectIsEqual((unint64_t)humanAnnotations, (uint64_t)v10))
      {
        nsfwAnnotations = self->_nsfwAnnotations;
        v12 = [(VIAnnotation *)v6 nsfwAnnotations];
        if (VIObjectIsEqual((unint64_t)nsfwAnnotations, (uint64_t)v12))
        {
          textBlockAnnotation = self->_textBlockAnnotation;
          v14 = [(VIAnnotation *)v6 textBlockAnnotation];
          if (VIObjectIsEqual((unint64_t)textBlockAnnotation, (uint64_t)v14))
          {
            scenenetAnnotation = self->_scenenetAnnotation;
            id v16 = [(VIAnnotation *)v6 scenenetAnnotation];
            if (VIObjectIsEqual((unint64_t)scenenetAnnotation, (uint64_t)v16))
            {
              barcodeAnnotation = self->_barcodeAnnotation;
              id v18 = [(VIAnnotation *)v6 barcodeAnnotation];
              if (VIObjectIsEqual((unint64_t)barcodeAnnotation, (uint64_t)v18))
              {
                reducePersonOverTriggerAnnotation = self->_reducePersonOverTriggerAnnotation;
                id v20 = [(VIAnnotation *)v6 reducePersonOverTriggerAnnotation];
                char IsEqual = VIObjectIsEqual((unint64_t)reducePersonOverTriggerAnnotation, (uint64_t)v20);
              }
              else
              {
                char IsEqual = 0;
              }
            }
            else
            {
              char IsEqual = 0;
            }
          }
          else
          {
            char IsEqual = 0;
          }
        }
        else
        {
          char IsEqual = 0;
        }
      }
      else
      {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_faceAnnotations hash];
  uint64_t v4 = [(NSArray *)self->_humanAnnotations hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_nsfwAnnotations hash];
  unint64_t v6 = v4 ^ v5 ^ [(VITextBlockAnnotation *)self->_textBlockAnnotation hash];
  unint64_t v7 = [(VIScenenetAnnotation *)self->_scenenetAnnotation hash];
  return v6 ^ v7 ^ [(VIBarcodeAnnotation *)self->_barcodeAnnotation hash];
}

- (NSArray)nsfwAnnotations
{
  return self->_nsfwAnnotations;
}

- (NSArray)faceAnnotations
{
  return self->_faceAnnotations;
}

- (NSArray)humanAnnotations
{
  return self->_humanAnnotations;
}

- (VITextBlockAnnotation)textBlockAnnotation
{
  return self->_textBlockAnnotation;
}

- (VIScenenetAnnotation)scenenetAnnotation
{
  return self->_scenenetAnnotation;
}

- (VIBarcodeAnnotation)barcodeAnnotation
{
  return self->_barcodeAnnotation;
}

- (VIReducePersonOverTriggerAnnotation)reducePersonOverTriggerAnnotation
{
  return self->_reducePersonOverTriggerAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reducePersonOverTriggerAnnotation, 0);
  objc_storeStrong((id *)&self->_barcodeAnnotation, 0);
  objc_storeStrong((id *)&self->_scenenetAnnotation, 0);
  objc_storeStrong((id *)&self->_textBlockAnnotation, 0);
  objc_storeStrong((id *)&self->_humanAnnotations, 0);
  objc_storeStrong((id *)&self->_faceAnnotations, 0);
  objc_storeStrong((id *)&self->_nsfwAnnotations, 0);
}

@end