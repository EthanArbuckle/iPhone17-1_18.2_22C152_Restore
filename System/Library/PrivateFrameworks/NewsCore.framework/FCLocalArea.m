@interface FCLocalArea
- (BOOL)containsLocation:(id)a3;
- (BOOL)containsPointAtLatitude:(double)a3 longitude:(double)a4;
- (BOOL)isBboxValid;
- (BOOL)isValue:(double)a3 betweenValue:(double)a4 andValue:(double)a5;
- (FCLocalArea)init;
- (FCLocalArea)initWithDictionary:(id)a3;
- (FCLocalArea)initWithIdentifier:(id)a3 bbox:(id)a4 regionIDs:(id)a5;
- (NSArray)bbox;
- (NSArray)regionIds;
- (NSString)identifier;
- (double)maxLat;
- (double)maxLon;
- (double)minLat;
- (double)minLon;
- (id)description;
- (void)setBbox:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation FCLocalArea

- (FCLocalArea)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCLocalArea alloc];
  v6 = FCAppConfigurationStringValue(v4, @"id", 0);
  v7 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"bbox", 0);
  v8 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"regionIds", 0);

  v9 = [(FCLocalArea *)v5 initWithIdentifier:v6 bbox:v7 regionIDs:v8];
  return v9;
}

- (FCLocalArea)initWithIdentifier:(id)a3 bbox:(id)a4 regionIDs:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v35 = a5;
  v36.receiver = self;
  v36.super_class = (Class)FCLocalArea;
  v11 = [(FCLocalArea *)&v36 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_bbox, a4);
    objc_storeStrong((id *)&v12->_regionIds, a5);
    id v13 = v10;
    if ([v13 count] == 4)
    {
      id v32 = v9;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v34 = *(void *)v38;
        unint64_t v16 = 0x1E4F28000uLL;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v38 != v34) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if (!v18 || (objc_opt_isKindOfClass() & 1) == 0)
            {
              id v19 = 0;
LABEL_34:

              char v30 = 0;
              goto LABEL_35;
            }
            id v19 = v18;
            if ([v19 count] != 2) {
              goto LABEL_34;
            }
            objc_opt_class();
            v20 = [v19 objectAtIndexedSubscript:0];
            if (v20)
            {
              if (objc_opt_isKindOfClass()) {
                v21 = v20;
              }
              else {
                v21 = 0;
              }
            }
            else
            {
              v21 = 0;
            }
            id v22 = v21;

            unint64_t v23 = v16;
            objc_opt_class();
            v24 = [v19 objectAtIndexedSubscript:1];
            if (v24)
            {
              if (objc_opt_isKindOfClass()) {
                v25 = v24;
              }
              else {
                v25 = 0;
              }
            }
            else
            {
              v25 = 0;
            }
            id v26 = v25;

            if (!v22 || !v26 || ([v22 doubleValue], v27 < -90.0) || v27 > 90.0)
            {

              goto LABEL_34;
            }
            [v26 doubleValue];
            double v29 = v28;

            char v30 = 0;
            if (v29 < -180.0 || v29 > 180.0) {
              goto LABEL_35;
            }
            unint64_t v16 = v23;
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          char v30 = 1;
          if (v15) {
            continue;
          }
          break;
        }
      }
      else
      {
        char v30 = 1;
      }
LABEL_35:

      id v9 = v32;
    }
    else
    {
      char v30 = 0;
    }

    v12->_isBboxValid = v30;
  }

  return v12;
}

- (FCLocalArea)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalArea init]";
    __int16 v9 = 2080;
    id v10 = "FCLocalArea.m";
    __int16 v11 = 1024;
    int v12 = 54;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCLocalArea init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)containsLocation:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  [v4 coordinate];
  double v8 = v7;

  return [(FCLocalArea *)self containsPointAtLatitude:v6 longitude:v8];
}

- (BOOL)containsPointAtLatitude:(double)a3 longitude:(double)a4
{
  if (![(FCLocalArea *)self isBboxValid]) {
    return 0;
  }
  [(FCLocalArea *)self minLat];
  double v8 = v7;
  [(FCLocalArea *)self maxLat];
  if (![(FCLocalArea *)self isValue:a3 betweenValue:v8 andValue:v9]) {
    return 0;
  }
  [(FCLocalArea *)self minLon];
  double v11 = v10;
  [(FCLocalArea *)self maxLon];
  return [(FCLocalArea *)self isValue:a4 betweenValue:v11 andValue:v12];
}

- (BOOL)isValue:(double)a3 betweenValue:(double)a4 andValue:(double)a5
{
  BOOL v5 = a3 <= a4;
  if (a3 < a5) {
    BOOL v5 = 0;
  }
  return a3 >= a4 && a3 <= a5 || v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: id: %@, regionIDs: %@", objc_opt_class(), self->_identifier, self->_regionIds];
}

- (double)minLat
{
  v2 = [(FCLocalArea *)self bbox];
  v3 = [v2 objectAtIndexedSubscript:2];
  id v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)maxLat
{
  v2 = [(FCLocalArea *)self bbox];
  v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)minLon
{
  v2 = [(FCLocalArea *)self bbox];
  v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 objectAtIndexedSubscript:1];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)maxLon
{
  v2 = [(FCLocalArea *)self bbox];
  v3 = [v2 objectAtIndexedSubscript:2];
  id v4 = [v3 objectAtIndexedSubscript:1];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (NSArray)regionIds
{
  return self->_regionIds;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)bbox
{
  return self->_bbox;
}

- (void)setBbox:(id)a3
{
}

- (BOOL)isBboxValid
{
  return self->_isBboxValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bbox, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_regionIds, 0);
}

@end