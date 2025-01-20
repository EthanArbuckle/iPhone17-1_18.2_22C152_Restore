@interface PK_ipp_value_t
+ (BOOL)supportsSecureCoding;
+ (id)valueWithBoolean:(int)a3;
+ (id)valueWithInteger:(int)a3;
+ (id)valueWithString:(id)a3;
- (BOOL)BOOLean;
- (NSData)unknown;
- (PK_ipp_collection_t)collection;
- (PK_ipp_value_t)init;
- (PK_ipp_value_t)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)loggingValue:(int)a3;
- (int)integer;
- (ipp_value_date_t)date;
- (ipp_value_range_t)range;
- (ipp_value_resolution_t)resolution;
- (ipp_value_string_t)string;
- (void)encodeWithCoder:(id)a3;
- (void)setBoolean:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setDate:(ipp_value_date_t)a3;
- (void)setInteger:(int)a3;
- (void)setRange:(ipp_value_range_t)a3;
- (void)setResolution:(ipp_value_resolution_t)a3;
- (void)setString:(ipp_value_string_t)a3;
- (void)setUnknown:(id)a3;
@end

@implementation PK_ipp_value_t

- (PK_ipp_value_t)init
{
  v3.receiver = self;
  v3.super_class = (Class)PK_ipp_value_t;
  return [(PK_ipp_value_t *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->x_payload);
  return v4;
}

- (PK_ipp_value_t)initWithCoder:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PK_ipp_value_t;
  v5 = [(PK_ipp_value_t *)&v13 init];
  if (v5)
  {
    uint64_t Class = (uint64_t)objc_getClass("PK_ipp_collection_t");
    if (!Class) {
      uint64_t Class = objc_opt_class();
    }
    v7 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = Class;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
    v9 = [v7 setWithArray:v8];

    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_payload"];
    x_payload = v5->x_payload;
    v5->x_payload = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int)integer
{
  if (objc_opt_isKindOfClass()) {
    return [self->x_payload integerValue];
  }
  else {
    return 0;
  }
}

- (void)setInteger:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  x_payload = self->x_payload;
  self->x_payload = v4;
}

- (BOOL)BOOLean
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  x_payload = self->x_payload;

  return [x_payload BOOLValue];
}

- (void)setBoolean:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  x_payload = self->x_payload;
  self->x_payload = v4;
}

- (ipp_value_date_t)date
{
  v6[2] = *MEMORY[0x263EF8340];
  memset(v6, 0, 11);
  objc_opt_class();
  isKindOfuint64_t Class = objc_opt_isKindOfClass();
  int v4 = 0;
  uint64_t v5 = 0;
  if (isKindOfClass)
  {
    -[NSObject getBytes:range:](self->x_payload, "getBytes:range:", v6, 0, 11);
    uint64_t v5 = v6[0];
    int v4 = LOWORD(v6[1]) | (BYTE2(v6[1]) << 16);
  }
  *(void *)result.var0 = v5;
  *(_WORD *)&result.var0[8] = v4;
  result.var0[10] = BYTE2(v4);
  return result;
}

- (void)setDate:(ipp_value_date_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  ipp_value_date_t v6 = a3;
  int v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v6 length:11];
  x_payload = self->x_payload;
  self->x_payload = v4;
}

- (void)setString:(ipp_value_string_t)a3
{
  id var0 = a3.var0;
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3.var1;
  ipp_value_date_t v6 = v5;
  if (var0)
  {
    uint64_t v7 = var0;
    v11[0] = v6;
    v11[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    x_payload = self->x_payload;
    self->x_payload = v8;
  }
  else
  {
    v12[0] = v5;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v7 = self->x_payload;
    self->x_payload = v10;
  }
}

- (ipp_value_string_t)string
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = self->x_payload;
    uint64_t v4 = [v3 count];
    uint64_t v5 = 0;
    if (v4 != 1)
    {
      if (v4 != 2)
      {
        ipp_value_date_t v6 = &stru_26E251B90;
        goto LABEL_8;
      }
      uint64_t v5 = [v3 objectAtIndexedSubscript:1];
    }
    ipp_value_date_t v6 = [v3 objectAtIndexedSubscript:0];
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v5 = 0;
  ipp_value_date_t v6 = &stru_26E251B90;
LABEL_9:
  uint64_t v7 = (void *)v5;
  v8 = v6;
  result.var1 = v8;
  result.id var0 = v7;
  return result;
}

- (ipp_value_resolution_t)resolution
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    int v12 = 0;
    goto LABEL_8;
  }
  objc_super v3 = self->x_payload;
  if ([v3 count] != 3)
  {
    objc_super v13 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_impl(&dword_22EA54000, v13, OS_LOG_TYPE_ERROR, "invalid resolution object", (uint8_t *)v15, 2u);
    }

    goto LABEL_7;
  }
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  unsigned int v5 = [v4 integerValue];
  ipp_value_date_t v6 = [v3 objectAtIndexedSubscript:1];
  uint64_t v7 = [v6 integerValue];
  v8 = [v3 objectAtIndexedSubscript:2];
  int v9 = [v8 integerValue];

  uint64_t v10 = v7 << 32;
  uint64_t v11 = v5;
  int v12 = v9;
LABEL_8:
  uint64_t v14 = v10 | v11;
  result.id var0 = v14;
  result.var1 = HIDWORD(v14);
  result.var2 = v12;
  return result;
}

- (void)setResolution:(ipp_value_resolution_t)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  unint64_t v4 = *(void *)&a3.var0;
  v11[3] = *MEMORY[0x263EF8340];
  ipp_value_date_t v6 = objc_msgSend(NSNumber, "numberWithInt:");
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", HIDWORD(v4), v6);
  v11[1] = v7;
  v8 = [NSNumber numberWithUnsignedInt:v3];
  void v11[2] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  x_payload = self->x_payload;
  self->x_payload = v9;
}

- (ipp_value_range_t)range
{
  uint64_t v4 = v2;
  objc_opt_class();
  isKindOfuint64_t Class = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
LABEL_9:
    *(void *)uint64_t v4 = 0;
    return (ipp_value_range_t)isKindOfClass;
  }
  uint64_t v11 = self->x_payload;
  if ([v11 count] != 2)
  {
    uint64_t v10 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22EA54000, v10, OS_LOG_TYPE_ERROR, "invalid range object", buf, 2u);
    }

    goto LABEL_9;
  }
  ipp_value_date_t v6 = [v11 objectAtIndexedSubscript:0];
  int v7 = [v6 integerValue];
  v8 = [v11 objectAtIndexedSubscript:1];
  int v9 = [v8 integerValue];
  *(_DWORD *)uint64_t v4 = v7;
  *(_DWORD *)(v4 + 4) = v9;

  return (ipp_value_range_t)isKindOfClass;
}

- (void)setRange:(ipp_value_range_t)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  unsigned int v5 = [NSNumber numberWithInt:*(unsigned int *)a3.var0];
  v9[0] = v5;
  ipp_value_date_t v6 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)&a3 + 4)];
  v9[1] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  x_payload = self->x_payload;
  self->x_payload = v7;
}

- (NSData)unknown
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self->x_payload;
  }
  else {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (void)setUnknown:(id)a3
{
}

- (PK_ipp_collection_t)collection
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_getClass("PK_ipp_collection_t"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = self->x_payload;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (PK_ipp_collection_t *)v3;
}

- (void)setCollection:(id)a3
{
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PK_ipp_value_t;
  uint64_t v4 = [(PK_ipp_value_t *)&v7 description];
  unsigned int v5 = [v3 stringWithFormat:@"%@ { %@ }", v4, self->x_payload];

  return v5;
}

- (id)loggingValue:(int)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a3 > 32)
  {
    switch(a3)
    {
      case '!':
      case '#':
        objc_msgSend(NSString, "stringWithFormat:", @"%d", -[PK_ipp_value_t integer](self, "integer"));
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '""':
        BOOL v4 = [(PK_ipp_value_t *)self BOOLean];
        x_payload = @"false";
        if (v4) {
          x_payload = @"true";
        }
        goto LABEL_46;
      case '0':
        ipp_value_date_t v6 = self->x_payload;
        objc_super v7 = objc_opt_new();
        v8 = [NSString stringWithFormat:@"%@<%p> - %lu bytes {", objc_opt_class(), v6, -[NSObject length](v6, "length")];
        [v7 addObject:v8];

        *(void *)&v52.tm_sec = MEMORY[0x263EF8330];
        *(void *)&v52.tm_hour = 3221225472;
        *(void *)&v52.tm_mon = ___ZL17pretty_data_linesP6NSData_block_invoke;
        *(void *)&v52.tm_wday = &unk_2649EC518;
        v43 = v7;
        *(void *)&v52.tm_isdst = v43;
        _visitHexLines(v6, 0, &v52);
        int v9 = [NSString stringWithFormat:@"}"];
        [(__CFString *)v43 addObject:v9];

        break;
      case '1':
        uint64_t v10 = [(PK_ipp_value_t *)self date];
        int v12 = v11;
        memset(&v52.tm_wday, 0, 32);
        v52.tm_mon = BYTE2(v10) - 1;
        v52.tm_year = (bswap32(v10) >> 16) - 1900;
        v52.tm_hour = BYTE4(v10);
        v52.tm_mday = BYTE3(v10);
        *(int8x8_t *)&v52.tm_sec = vand_s8((int8x8_t)vmovn_s64((int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v10), (uint64x2_t)xmmword_22EAA18C0)), (int8x8_t)0xFF000000FFLL);
        time_t v13 = mktime(&v52);
        uint64_t v14 = 3600;
        if (v12 != 45) {
          uint64_t v14 = -3600;
        }
        uint64_t v15 = 60;
        if (v12 != 45) {
          uint64_t v15 = -60;
        }
        v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(v15 * BYTE2(v12) + v14 * BYTE1(v12) + v13)];
        v43 = [v16 description];

        break;
      case '2':
        v17 = self->x_payload;
        v18 = NSString;
        v19 = [v17 objectAtIndexedSubscript:0];
        uint64_t v20 = [v19 integerValue];
        v21 = [v17 objectAtIndexedSubscript:1];
        uint64_t v22 = [v21 integerValue];
        v23 = [v17 objectAtIndexedSubscript:2];
        v43 = [v18 stringWithFormat:@"resolution<%d, %d, %d>", v20, v22, objc_msgSend(v23, "integerValue")];

        goto LABEL_19;
      case '3':
        v17 = self->x_payload;
        v24 = NSString;
        v19 = [v17 objectAtIndexedSubscript:0];
        uint64_t v25 = [v19 integerValue];
        v21 = [v17 objectAtIndexedSubscript:1];
        v43 = [v24 stringWithFormat:@"range<%d, %d>", v25, objc_msgSend(v21, "integerValue")];
        goto LABEL_19;
      case '4':
        v40 = self->x_payload;
        v43 = (__CFString *)objc_opt_new();
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v26 = [v40 attrs];
        obuint64_t j = v26;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v27)
        {
          uint64_t v42 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v49 != v42) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              v30 = [v29 name];
              v31 = objc_opt_new();
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              v32 = [v29 values];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v55 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v45;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v45 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    v36 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "loggingValue:", objc_msgSend(v29, "value_tag"));
                    [v31 addObject:v36];
                  }
                  uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v55 count:16];
                }
                while (v33);
              }

              v53[0] = @"col_name";
              v53[1] = @"col_vals";
              v54[0] = v30;
              v54[1] = v31;
              v37 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
              [(__CFString *)v43 addObject:v37];
            }
            v26 = obj;
            uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v27);
        }

        break;
      default:
        goto LABEL_36;
    }
    goto LABEL_47;
  }
  if (!a3 || a3 == 16 || a3 == 19)
  {
    v43 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_47;
  }
LABEL_36:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = self->x_payload;
    if (![v17 count])
    {

      v43 = @"<empty array>";
      goto LABEL_47;
    }
    v19 = [v17 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v17 count] == 1)
      {
        v43 = v19;
LABEL_20:

        goto LABEL_47;
      }
      if ([v17 count] == 2)
      {
        v38 = NSString;
        v21 = [v17 objectAtIndexedSubscript:1];
        v43 = [v38 stringWithFormat:@"%@ (%@)", v19, v21];
LABEL_19:

        goto LABEL_20;
      }
    }
  }
  x_payload = (__CFString *)self->x_payload;
LABEL_46:
  v43 = x_payload;
LABEL_47:

  return v43;
}

+ (id)valueWithInteger:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = objc_opt_new();
  [v4 setInteger:v3];

  return v4;
}

+ (id)valueWithBoolean:(int)a3
{
  BOOL v4 = objc_opt_new();
  [v4 setBoolean:a3 != 0];

  return v4;
}

+ (id)valueWithString:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  id v5 = v3;
  ipp_value_date_t v6 = v5;
  if (v4) {
    objc_msgSend(v4, "setString:", 0, v5);
  }
  else {

  }
  return v4;
}

- (void).cxx_destruct
{
}

@end