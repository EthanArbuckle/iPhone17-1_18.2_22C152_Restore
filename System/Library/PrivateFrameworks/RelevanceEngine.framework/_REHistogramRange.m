@interface _REHistogramRange
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_REHistogramRange)initWithMin:(unint64_t)a3 max:(unint64_t)a4;
- (_REHistogramRange)initWithValue:(unint64_t)a3 binningSize:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)max;
- (unint64_t)mid;
- (unint64_t)min;
- (void)dealloc;
@end

@implementation _REHistogramRange

- (_REHistogramRange)initWithValue:(unint64_t)a3 binningSize:(unint64_t)a4
{
  uint64_t v7 = REFeatureValueTypeForTaggedPointer(a3);
  if (v7 == REFeatureValueTypeForTaggedPointer(a4))
  {
    switch(REFeatureValueTypeForTaggedPointer(a3))
    {
      case 0:
        v15 = (void *)*MEMORY[0x263EFF4A0];
        v16 = @"Bool values aren't supported";
        goto LABEL_12;
      case 1:
        unint64_t v27 = REIntegerValueForTaggedPointer(a4);
        uint64_t v28 = REIntegerValueForTaggedPointer(a3) / v27 * v27;
        v26 = (const void *)RECreateIntegerFeatureValueTaggedPointer(v28);
        uint64_t v29 = RECreateIntegerFeatureValueTaggedPointer(v28 + v27);
        goto LABEL_8;
      case 2:
        REDoubleValueForTaggedPointer((void *)a4, v8);
        REDoubleValueForTaggedPointer((void *)a3, v30);
        v26 = (const void *)RECreateDoubleFeatureValueTaggedPointer();
        uint64_t v29 = RECreateDoubleFeatureValueTaggedPointer();
LABEL_8:
        v25 = (const void *)v29;
        goto LABEL_9;
      case 3:
        v15 = (void *)*MEMORY[0x263EFF4A0];
        v16 = @"String values aren't supported";
        goto LABEL_12;
      case 4:
        v15 = (void *)*MEMORY[0x263EFF4A0];
        v16 = @"Set values aren't supported";
LABEL_12:
        RERaiseInternalException(v15, v16, v9, v10, v11, v12, v13, v14, v33);
        goto LABEL_13;
      default:
        v25 = 0;
        v26 = 0;
LABEL_9:
        self = [(_REHistogramRange *)self initWithMin:v26 max:v25];
        REReleaseFeatureValueTaggedPointer(v26);
        REReleaseFeatureValueTaggedPointer(v25);
        v31 = self;
        goto LABEL_14;
    }
  }
  v17 = (void *)*MEMORY[0x263EFF4A0];
  v18 = REDescriptionForTaggedPointer(a3);
  v34 = REDescriptionForTaggedPointer(a4);
  RERaiseInternalException(v17, @"value %@ and binning value %@ must have matching types", v19, v20, v21, v22, v23, v24, (uint64_t)v18);

LABEL_13:
  v31 = 0;
LABEL_14:

  return v31;
}

- (_REHistogramRange)initWithMin:(unint64_t)a3 max:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_REHistogramRange;
  v6 = [(_REHistogramRange *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_min = a3;
    v6->_max = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
    RERetainFeatureValueTaggedPointer((CFTypeRef)v7->_max);
    if (REFeatureValueTypeForTaggedPointer(v7->_min) == 2)
    {
      REDoubleValueForTaggedPointer((void *)a3, v8);
      REDoubleValueForTaggedPointer((void *)a4, v9);
      uint64_t v10 = RECreateDoubleFeatureValueTaggedPointer();
    }
    else
    {
      uint64_t v11 = REIntegerValueForTaggedPointer(a3);
      uint64_t v12 = REIntegerValueForTaggedPointer(a4);
      uint64_t v10 = RECreateIntegerFeatureValueTaggedPointer((unint64_t)(v12 + v11) >> 1);
    }
    v7->_mid = v10;
  }
  return v7;
}

- (void)dealloc
{
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_min);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_max);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_mid);
  v3.receiver = self;
  v3.super_class = (Class)_REHistogramRange;
  [(_REHistogramRange *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = REFeatureValueHashForTaggedPointer(self->_min);
  return REFeatureValueHashForTaggedPointer(self->_max) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REHistogramRange *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t min = self->_min;
      unint64_t v7 = v5->_min;
      if (min != v7)
      {
        uint64_t v11 = REFeatureValueTypeForTaggedPointer(self->_min);
        if (v11 != REFeatureValueTypeForTaggedPointer(v7)) {
          goto LABEL_13;
        }
        uint64_t v12 = REFeatureValueForTaggedPointer(min);
        uint64_t v13 = REFeatureValueForTaggedPointer(v7);
        int v14 = [v12 isEqual:v13];

        if (!v14) {
          goto LABEL_13;
        }
      }
      unint64_t max = self->_max;
      unint64_t v9 = v5->_max;
      if (max == v9)
      {
        char v10 = 1;
      }
      else
      {
        uint64_t v15 = REFeatureValueTypeForTaggedPointer(max);
        if (v15 != REFeatureValueTypeForTaggedPointer(v9))
        {
LABEL_13:
          char v10 = 0;
          goto LABEL_14;
        }
        v16 = REFeatureValueForTaggedPointer(max);
        v17 = REFeatureValueForTaggedPointer(v9);
        char v10 = [v16 isEqual:v17];
      }
LABEL_14:

      goto LABEL_15;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = REDescriptionForTaggedPointer(self->_min);
  v6 = REDescriptionForTaggedPointer(self->_max);
  unint64_t v7 = [v3 stringWithFormat:@"<%p: %@> min=%@, max=%@", self, v4, v5, v6];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t min = self->_min;
  unint64_t max = self->_max;
  return (id)[v4 initWithMin:min max:max];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void **)v4;
    int64_t v6 = RECompareFeatureValues(self->_min, v5[1]);
    if (!v6) {
      int64_t v6 = RECompareFeatureValues(self->_max, v5[2]);
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (unint64_t)min
{
  return self->_min;
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)mid
{
  return self->_mid;
}

@end