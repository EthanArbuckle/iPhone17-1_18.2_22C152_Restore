@interface PersonalizedItemStyleAttributesAdornment
+ (PersonalizedItemStyleAttributesAdornment)adornmentWithStyleAttributes:(id)a3;
+ (PersonalizedItemStyleAttributesAdornment)adornmentWithStyleAttributes:(id)a3 additionalAttributes:(id)a4;
+ (id)defaultAdornment;
- (GEOFeatureStyleAttributes)styleAttributes;
- (PersonalizedItemStyleAttributesAdornment)initWithStyleAttributes:(id)a3 additionalAttributes:(id)a4;
- (id)combineAdornment:(id)a3;
@end

@implementation PersonalizedItemStyleAttributesAdornment

- (PersonalizedItemStyleAttributesAdornment)initWithStyleAttributes:(id)a3 additionalAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PersonalizedItemStyleAttributesAdornment;
  v8 = [(PersonalizedItemStyleAttributesAdornment *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [v7 count];
    if (v9)
    {
      id v24 = [v6 copy];

      uint64_t v23 = (uint64_t)&v23;
      v26 = (char *)&v23 - ((8 * v9 + 15) & 0xFFFFFFFF0);
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      id v25 = v7;
      id v10 = v7;
      id v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v28;
        v15 = v26 + 4;
        do
        {
          v16 = 0;
          v17 = &v15[8 * v13];
          do
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v10);
            }
            v18 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v16);
            v19 = [v10 objectForKeyedSubscript:v18];
            *((_DWORD *)v17 - 1) = [v18 integerValue];
            *(_DWORD *)v17 = [v19 integerValue];
            v17 += 8;

            v16 = (char *)v16 + 1;
          }
          while (v12 != v16);
          id v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
          v13 += (uint64_t)v16;
        }
        while (v12);
      }

      id v20 = [v10 count];
      id v21 = v24;
      [v24 replaceAttributes:v26 count:v20];
      id v6 = v21;
      id v7 = v25;
    }
    else
    {
      id v21 = v6;
    }
    objc_storeStrong((id *)&v8->_styleAttributes, v21);
  }

  return v8;
}

- (id)combineAdornment:(id)a3
{
  v4 = [a3 styleAttributes];
  signed int v5 = [(GEOFeatureStyleAttributes *)self->_styleAttributes poiType];
  uint64_t v6 = 1000001;
  switch(v5)
  {
    case 346:
      break;
    case 347:
      uint64_t v6 = 1000000;
      break;
    case 348:
      uint64_t v6 = 500000;
      break;
    case 349:
      uint64_t v6 = 900000;
      break;
    default:
      if (v5 == 169) {
        uint64_t v6 = 999999;
      }
      else {
        uint64_t v6 = v5;
      }
      break;
  }
  signed int v7 = [v4 poiType];
  uint64_t v8 = 1000001;
  switch(v7)
  {
    case 346:
      break;
    case 347:
      uint64_t v8 = 1000000;
      break;
    case 348:
      uint64_t v8 = 500000;
      break;
    case 349:
      uint64_t v8 = 900000;
      break;
    default:
      uint64_t v8 = 999999;
      if (v7 != 169) {
        uint64_t v8 = v7;
      }
      break;
  }
  if (v6 <= v8)
  {
    uint64_t v9 = self->_styleAttributes;
    styleAttributes = (GEOFeatureStyleAttributes *)v4;
  }
  else
  {
    uint64_t v9 = v4;
    styleAttributes = self->_styleAttributes;
  }
  id v11 = styleAttributes;
  id v12 = [(GEOFeatureStyleAttributes *)v9 copy];
  if (v4 && [v4 countAttrs])
  {
    id v13 = [(GEOFeatureStyleAttributes *)v9 copy];

    [v13 replaceAttributes:-[GEOFeatureStyleAttributes v](v11, "v") count:-[GEOFeatureStyleAttributes countAttrs](v11, "countAttrs")];
    id v12 = v13;
  }
  uint64_t v14 = [(id)objc_opt_class() adornmentWithStyleAttributes:v12];

  return v14;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

+ (PersonalizedItemStyleAttributesAdornment)adornmentWithStyleAttributes:(id)a3 additionalAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = [v8 initWithStyleAttributes:v6 additionalAttributes:v7];
  }
  else
  {
    id v11 = objc_alloc_init((Class)GEOFeatureStyleAttributes);
    id v10 = [v9 initWithStyleAttributes:v11 additionalAttributes:v7];
  }

  return (PersonalizedItemStyleAttributesAdornment *)v10;
}

+ (id)defaultAdornment
{
  id v2 = objc_alloc((Class)a1);
  id v3 = objc_alloc_init((Class)GEOFeatureStyleAttributes);
  id v4 = [v2 initWithStyleAttributes:v3 additionalAttributes:0];

  return v4;
}

+ (PersonalizedItemStyleAttributesAdornment)adornmentWithStyleAttributes:(id)a3
{
  return (PersonalizedItemStyleAttributesAdornment *)[a1 adornmentWithStyleAttributes:a3 additionalAttributes:0];
}

- (void).cxx_destruct
{
}

@end