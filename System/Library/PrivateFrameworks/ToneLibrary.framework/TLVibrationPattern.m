@interface TLVibrationPattern
+ (BOOL)isValidVibrationPatternPropertyListRepresentation:(id)a3;
+ (id)complexVibrationPatternWithDurationsForVibrationsAndPauses:(double)a3;
+ (id)noneVibrationPattern;
+ (id)simpleVibrationPatternWithVibrationDuration:(double)a3 pauseDuration:(double)a4;
- (TLVibrationPattern)init;
- (TLVibrationPattern)initWithPropertyListRepresentation:(id)a3;
- (double)_computedDuration;
- (id)_artificiallyRepeatingPropertyListRepresentation;
- (id)_initWithPropertyListRepresentation:(id)a3 skipValidation:(BOOL)a4;
- (id)contextObject;
- (id)propertyListRepresentation;
- (void)appendVibrationComponentWithDuration:(double)a3 isPause:(BOOL)a4;
- (void)setContextObject:(id)a3;
@end

@implementation TLVibrationPattern

+ (BOOL)isValidVibrationPatternPropertyListRepresentation:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKey:@"Atoms"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
    {
      char v5 = 1;
    }
    else
    {
      v6 = [v3 objectForKey:@"Intensity"];
      if (_TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v6, "f", v7, v8, v9, v10, v11, v12, "d", 0))
      {
        [v6 floatValue];
        char v5 = 0;
        if (v13 > 0.00000011921 && v13 < 1.0)
        {
          v14 = [v3 objectForKey:@"VibePattern"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v16)
            {
              uint64_t v23 = v16;
              int v24 = 0;
              uint64_t v25 = *(void *)v46;
              while (2)
              {
                uint64_t v26 = 0;
                int v44 = v24 ^ v23;
                do
                {
                  if (*(void *)v46 != v25) {
                    objc_enumerationMutation(v15);
                  }
                  v27 = *(void **)(*((void *)&v45 + 1) + 8 * v26);
                  if (v24)
                  {
                    if (!_TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v27, "i", v17, v18, v19, v20, v21, v22, "I", (uint64_t)"q"))goto LABEL_25; {
                  }
                    }
                  else if (!_TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v27, "B", v17, v18, v19, v20, v21, v22, "c", 0))
                  {
LABEL_25:
                    char v28 = 0;
                    goto LABEL_29;
                  }
                  LOBYTE(v24) = v24 ^ 1;
                  ++v26;
                }
                while (v23 != v26);
                uint64_t v23 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
                int v24 = v44;
                if (v23) {
                  continue;
                }
                break;
              }
              char v28 = 1;
            }
            else
            {
              LOBYTE(v24) = 0;
              char v28 = 1;
            }
LABEL_29:

            char v5 = v28 & (v24 ^ 1);
          }
          else
          {
            v29 = [v3 objectForKey:@"OnDuration"];
            v30 = [v3 objectForKey:@"OffDuration"];
            char v5 = _TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v29, "f", v31, v32, v33, v34, v35, v36, "d", 0)&& _TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v30, "f", v37, v38, v39, v40, v41, v42,
                   "d",
                   0);
          }
        }
      }
      else
      {
        char v5 = 0;
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)simpleVibrationPatternWithVibrationDuration:(double)a3 pauseDuration:(double)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (a3 <= 2.22044605e-16 || a4 <= 2.22044605e-16)
  {
    float v13 = 0;
  }
  else
  {
    id v7 = objc_alloc((Class)a1);
    v16[0] = &unk_1F35FF748;
    v15[0] = @"Intensity";
    v15[1] = @"OnDuration";
    *(float *)&double v8 = a3;
    int v9 = [NSNumber numberWithFloat:v8];
    v16[1] = v9;
    v15[2] = @"OffDuration";
    *(float *)&double v10 = a4;
    int v11 = [NSNumber numberWithFloat:v10];
    v16[2] = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    float v13 = (void *)[v7 initWithPropertyListRepresentation:v12];
  }

  return v13;
}

+ (id)complexVibrationPatternWithDurationsForVibrationsAndPauses:(double)a3
{
  double v3 = a3;
  v18[2] = *MEMORY[0x1E4F143B8];
  if (a3 <= 2.22044605e-16)
  {
    float v13 = 0;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v5)
    {
      int v6 = 0;
      id v15 = &v20;
      do
      {
        v6 ^= 1u;
        id v7 = objc_msgSend(NSNumber, "numberWithBool:", v6 & 1, v15);
        [v5 addObject:v7];

        double v8 = [NSNumber numberWithInt:(int)(v3 * 1000.0)];
        [v5 addObject:v8];

        int v9 = (double *)v16;
        id v15 = (uint64_t *)(v16 + 8);
        double v3 = *v9;
      }
      while (*v9 > 2.22044605e-16);
      double v10 = objc_msgSend(v5, "copy", v15);
      if (v10)
      {
        id v11 = objc_alloc((Class)a1);
        v17[0] = @"Intensity";
        v17[1] = @"VibePattern";
        v18[0] = &unk_1F35FF748;
        v18[1] = v10;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
        float v13 = (void *)[v11 initWithPropertyListRepresentation:v12];
      }
      else
      {
        float v13 = 0;
      }
    }
    else
    {
      float v13 = 0;
    }
  }

  return v13;
}

+ (id)noneVibrationPattern
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  v6[0] = @"Intensity";
  v6[1] = @"VibePattern";
  v7[0] = &unk_1F35FF748;
  v7[1] = &unk_1F35FF6E8;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = (void *)[v2 _initWithPropertyListRepresentation:v3 skipValidation:1];

  return v4;
}

- (TLVibrationPattern)init
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int v6 = @"Intensity";
  v7[0] = &unk_1F35FF748;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [(TLVibrationPattern *)self _initWithPropertyListRepresentation:v3 skipValidation:1];

  return v4;
}

- (TLVibrationPattern)initWithPropertyListRepresentation:(id)a3
{
  return (TLVibrationPattern *)[(TLVibrationPattern *)self _initWithPropertyListRepresentation:a3 skipValidation:0];
}

- (id)_initWithPropertyListRepresentation:(id)a3 skipValidation:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TLVibrationPattern;
  id v7 = [(TLVibrationPattern *)&v11 init];
  if (v7)
  {
    if (a4
      || [(id)objc_opt_class() isValidVibrationPatternPropertyListRepresentation:v6])
    {
      uint64_t v8 = [v6 copy];
      propertyListRepresentation = v7->_propertyListRepresentation;
      v7->_propertyListRepresentation = (NSDictionary *)v8;
    }
    else
    {
      propertyListRepresentation = v7;
      id v7 = 0;
    }
  }
  return v7;
}

- (id)propertyListRepresentation
{
  double v3 = self->_propertyListRepresentation;
  v4 = self->_complexPatternDescription;
  if (v4)
  {
    id v5 = (void *)[(NSDictionary *)v3 mutableCopy];
    id v6 = (void *)[(NSMutableArray *)v4 copy];
    [v5 setObject:v6 forKey:@"VibePattern"];

    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];

    double v3 = (NSDictionary *)v7;
  }

  return v3;
}

- (id)_artificiallyRepeatingPropertyListRepresentation
{
  double v3 = [(TLVibrationPattern *)self propertyListRepresentation];
  v4 = [v3 objectForKey:@"Atoms"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    id v5 = (void *)[v3 mutableCopy];
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"Looped"];
    uint64_t v6 = [v5 copy];
  }
  else
  {
    id v5 = [v3 objectForKey:@"VibePattern"];
    if (!v5) {
      goto LABEL_14;
    }
    [(TLVibrationPattern *)self _computedDuration];
    double v8 = 180.0 / v7;
    BOOL v9 = v7 > 0.0;
    double v10 = 18.0;
    if (v9) {
      double v10 = v8;
    }
    unint64_t v11 = llround(floor(v10));
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    do
    {
      [v13 addObjectsFromArray:v5];
      --v12;
    }
    while (v12);
    v14 = (void *)[v3 mutableCopy];
    [v14 setObject:v13 forKey:@"VibePattern"];
    uint64_t v6 = [v14 copy];

    double v3 = v13;
  }

  double v3 = (void *)v6;
LABEL_14:

  return v3;
}

- (double)_computedDuration
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [(TLVibrationPattern *)self propertyListRepresentation];
  double v3 = [v2 objectForKey:@"Atoms"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It is pretty much impossible to compute the duration of a modern vibration pattern that uses atoms. This is invalid."];
    double v4 = 0.0;
  }
  else
  {
    id v5 = [v2 objectForKey:@"VibePattern"];
    uint64_t v6 = v5;
    if (v5)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        char v9 = 0;
        uint64_t v10 = *(void *)v20;
        double v4 = 0.0;
        do
        {
          uint64_t v11 = 0;
          char v12 = v9;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v6);
            }
            if (v12) {
              double v4 = v4 + (double)(int)[*(id *)(*((void *)&v19 + 1) + 8 * v11) intValue] / 1000.0;
            }
            v12 ^= 1u;
            ++v11;
          }
          while (v8 != v11);
          v9 ^= v8;
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }
      else
      {
        double v4 = 0.0;
      }
    }
    else
    {
      id v13 = [v2 objectForKey:@"OnDuration"];
      [v13 floatValue];
      double v15 = v14 + 0.0;

      uint64_t v16 = [v2 objectForKey:@"OffDuration"];
      [v16 floatValue];
      double v4 = v15 + v17;
    }
  }

  return v4;
}

- (void)appendVibrationComponentWithDuration:(double)a3 isPause:(BOOL)a4
{
  BOOL v4 = a4;
  p_complexPatternDescription = &self->_complexPatternDescription;
  uint64_t v8 = self->_complexPatternDescription;
  if (!v8)
  {
    char v9 = (void *)[(NSDictionary *)self->_propertyListRepresentation mutableCopy];
    uint64_t v10 = [v9 objectForKey:@"VibePattern"];
    obj = (NSMutableArray *)[v10 mutableCopy];

    uint64_t v11 = obj;
    if (!obj) {
      uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    obja = v11;
    objc_storeStrong((id *)p_complexPatternDescription, v11);
    [v9 removeObjectForKey:@"VibePattern"];
    [v9 removeObjectForKey:@"OnDuration"];
    [v9 removeObjectForKey:@"OffDuration"];
    char v12 = (NSDictionary *)[v9 copy];
    propertyListRepresentation = self->_propertyListRepresentation;
    self->_propertyListRepresentation = v12;

    uint64_t v8 = obja;
  }
  if (a3 > 2.22044605e-16)
  {
    objb = v8;
    float v14 = [NSNumber numberWithBool:!v4];
    [(NSMutableArray *)objb addObject:v14];

    double v15 = [NSNumber numberWithInt:(int)(a3 * 1000.0)];
    [(NSMutableArray *)objb addObject:v15];
  }

  MEMORY[0x1F41817F8]();
}

- (id)contextObject
{
  return self->_contextObject;
}

- (void)setContextObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextObject, 0);
  objc_storeStrong((id *)&self->_complexPatternDescription, 0);

  objc_storeStrong((id *)&self->_propertyListRepresentation, 0);
}

@end