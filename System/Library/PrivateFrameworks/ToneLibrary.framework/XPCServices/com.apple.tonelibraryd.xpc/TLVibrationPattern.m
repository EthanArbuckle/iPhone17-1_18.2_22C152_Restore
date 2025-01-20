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
      if (sub_10000565C(v6, "f", v7, v8, v9, v10, v11, v12, "d", 0))
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
            id v16 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v16)
            {
              id v23 = v16;
              unsigned int v24 = 0;
              uint64_t v25 = *(void *)v46;
              while (2)
              {
                v26 = 0;
                unsigned int v44 = v24 ^ v23;
                do
                {
                  if (*(void *)v46 != v25) {
                    objc_enumerationMutation(v15);
                  }
                  v27 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v26);
                  if (v24)
                  {
                    if (!sub_10000565C(v27, "i", v17, v18, v19, v20, v21, v22, "I", (uint64_t)"q")) {
                      goto LABEL_25;
                    }
                  }
                  else if (!sub_10000565C(v27, "B", v17, v18, v19, v20, v21, v22, "c", 0))
                  {
LABEL_25:
                    char v28 = 0;
                    goto LABEL_29;
                  }
                  LOBYTE(v24) = v24 ^ 1;
                  v26 = (char *)v26 + 1;
                }
                while (v23 != v26);
                id v23 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
                unsigned int v24 = v44;
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
            char v5 = sub_10000565C(v29, "f", v31, v32, v33, v34, v35, v36, "d", 0)
              && sub_10000565C(v30, "f", v37, v38, v39, v40, v41, v42, "d", 0);
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
  if (a3 <= 2.22044605e-16 || a4 <= 2.22044605e-16)
  {
    id v13 = 0;
  }
  else
  {
    id v7 = objc_alloc((Class)a1);
    v16[0] = &off_100008818;
    v15[0] = @"Intensity";
    v15[1] = @"OnDuration";
    *(float *)&double v8 = a3;
    int v9 = +[NSNumber numberWithFloat:v8];
    v16[1] = v9;
    v15[2] = @"OffDuration";
    *(float *)&double v10 = a4;
    int v11 = +[NSNumber numberWithFloat:v10];
    v16[2] = v11;
    int v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    id v13 = [v7 initWithPropertyListRepresentation:v12];
  }

  return v13;
}

+ (id)complexVibrationPatternWithDurationsForVibrationsAndPauses:(double)a3
{
  double v3 = a3;
  if (a3 <= 2.22044605e-16)
  {
    id v13 = 0;
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if (v5)
    {
      int v6 = 0;
      id v15 = &v20;
      do
      {
        v6 ^= 1u;
        id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6 & 1, v15);
        [v5 addObject:v7];

        double v8 = +[NSNumber numberWithInt:(int)(v3 * 1000.0)];
        [v5 addObject:v8];

        int v9 = (double *)v16;
        id v15 = (uint64_t *)(v16 + 8);
        double v3 = *v9;
      }
      while (*v9 > 2.22044605e-16);
      id v10 = objc_msgSend(v5, "copy", v15);
      if (v10)
      {
        id v11 = objc_alloc((Class)a1);
        v17[0] = @"Intensity";
        v17[1] = @"VibePattern";
        v18[0] = &off_100008818;
        v18[1] = v10;
        int v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
        id v13 = [v11 initWithPropertyListRepresentation:v12];
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }

  return v13;
}

+ (id)noneVibrationPattern
{
  id v2 = objc_alloc((Class)a1);
  v6[0] = @"Intensity";
  v6[1] = @"VibePattern";
  v7[0] = &off_100008818;
  v7[1] = &off_100008850;
  double v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  id v4 = [v2 _initWithPropertyListRepresentation:v3 skipValidation:1];

  return v4;
}

- (TLVibrationPattern)init
{
  CFStringRef v6 = @"Intensity";
  id v7 = &off_100008818;
  double v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(TLVibrationPattern *)self _initWithPropertyListRepresentation:v3 skipValidation:1];

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
      double v8 = (NSDictionary *)[v6 copy];
      propertyListRepresentation = v7->_propertyListRepresentation;
      v7->_propertyListRepresentation = v8;
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
  id v4 = self->_complexPatternDescription;
  if (v4)
  {
    id v5 = [(NSDictionary *)v3 mutableCopy];
    id v6 = [(NSMutableArray *)v4 copy];
    [v5 setObject:v6 forKey:@"VibePattern"];

    uint64_t v7 = +[NSDictionary dictionaryWithDictionary:v5];

    double v3 = (NSDictionary *)v7;
  }

  return v3;
}

- (id)_artificiallyRepeatingPropertyListRepresentation
{
  double v3 = [(TLVibrationPattern *)self propertyListRepresentation];
  id v4 = [v3 objectForKey:@"Atoms"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    id v5 = [v3 mutableCopy];
    [v5 setObject:&__kCFBooleanTrue forKey:@"Looped"];
    id v6 = [v5 copy];
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
    id v13 = objc_alloc_init((Class)NSMutableArray);
    do
    {
      [v13 addObjectsFromArray:v5];
      --v12;
    }
    while (v12);
    id v14 = [v3 mutableCopy];
    [v14 setObject:v13 forKey:@"VibePattern"];
    id v6 = [v14 copy];

    double v3 = v13;
  }

  double v3 = v6;
LABEL_14:

  return v3;
}

- (double)_computedDuration
{
  id v2 = [(TLVibrationPattern *)self propertyListRepresentation];
  double v3 = [v2 objectForKey:@"Atoms"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    +[NSException raise:NSInternalInconsistencyException format:@"It is pretty much impossible to compute the duration of a modern vibration pattern that uses atoms. This is invalid."];
    double v4 = 0.0;
  }
  else
  {
    id v5 = [v2 objectForKey:@"VibePattern"];
    id v6 = v5;
    if (v5)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        id v8 = v7;
        char v9 = 0;
        uint64_t v10 = *(void *)v20;
        double v4 = 0.0;
        do
        {
          unint64_t v11 = 0;
          char v12 = v9;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v6);
            }
            if (v12) {
              double v4 = v4
            }
                 + (double)(int)[*(id *)(*((void *)&v19 + 1) + 8 * (void)v11) intValue] / 1000.0;
            v12 ^= 1u;
            unint64_t v11 = (char *)v11 + 1;
          }
          while (v8 != v11);
          v9 ^= v8;
          id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
  id v8 = self->_complexPatternDescription;
  if (!v8)
  {
    id v9 = [(NSDictionary *)self->_propertyListRepresentation mutableCopy];
    uint64_t v10 = [v9 objectForKey:@"VibePattern"];
    obj = (NSMutableArray *)[v10 mutableCopy];

    unint64_t v11 = obj;
    if (!obj) {
      unint64_t v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    }
    obja = v11;
    objc_storeStrong((id *)p_complexPatternDescription, v11);
    [v9 removeObjectForKey:@"VibePattern"];
    [v9 removeObjectForKey:@"OnDuration"];
    [v9 removeObjectForKey:@"OffDuration"];
    char v12 = (NSDictionary *)[v9 copy];
    propertyListRepresentation = self->_propertyListRepresentation;
    self->_propertyListRepresentation = v12;

    id v8 = obja;
  }
  if (a3 > 2.22044605e-16)
  {
    objb = v8;
    float v14 = +[NSNumber numberWithBool:!v4];
    [(NSMutableArray *)objb addObject:v14];

    double v15 = +[NSNumber numberWithInt:(int)(a3 * 1000.0)];
    [(NSMutableArray *)objb addObject:v15];
  }

  _objc_release_x1();
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