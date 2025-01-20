@interface ipp_value_t
+ (BOOL)supportsSecureCoding;
+ (id)valueWithBoolean:(int)a3;
+ (id)valueWithInteger:(int)a3;
+ (id)valueWithString:(id)a3;
- (BOOL)BOOLean;
- (NSData)unknown;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)loggingValue:(int)a3;
- (int)integer;
- (ipp_collection_t)collection;
- (ipp_value_date_t)date;
- (ipp_value_range_t)range;
- (ipp_value_resolution_t)resolution;
- (ipp_value_string_t)string;
- (ipp_value_t)init;
- (ipp_value_t)initWithCoder:(id)a3;
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

@implementation ipp_value_t

- (ipp_value_t)init
{
  v3.receiver = self;
  v3.super_class = (Class)ipp_value_t;
  return [(ipp_value_t *)&v3 init];
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

- (ipp_value_t)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ipp_value_t;
  v5 = [(ipp_value_t *)&v12 init];
  if (v5)
  {
    uint64_t Class = (uint64_t)objc_getClass("PK_ipp_collection_t");
    if (!Class) {
      uint64_t Class = objc_opt_class();
    }
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = Class;
    v7 = +[NSArray arrayWithObjects:v13 count:4];
    v8 = +[NSSet setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_payload"];
    x_payload = v5->x_payload;
    v5->x_payload = v9;
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
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
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
  id v4 = +[NSNumber numberWithBool:a3];
  x_payload = self->x_payload;
  self->x_payload = v4;
}

- (ipp_value_date_t)date
{
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
  ipp_value_date_t v6 = a3;
  int v4 = +[NSData dataWithBytes:&v6 length:11];
  x_payload = self->x_payload;
  self->x_payload = v4;
}

- (void)setString:(ipp_value_string_t)a3
{
  id var0 = a3.var0;
  id v5 = a3.var1;
  ipp_value_date_t v6 = v5;
  if (var0)
  {
    v7 = var0;
    v11[0] = v6;
    v11[1] = v7;
    v8 = +[NSArray arrayWithObjects:v11 count:2];
    x_payload = self->x_payload;
    self->x_payload = v8;
  }
  else
  {
    id v12 = v5;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
    v7 = self->x_payload;
    self->x_payload = v10;
  }
}

- (ipp_value_string_t)string
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = self->x_payload;
    id v4 = [v3 count];
    uint64_t v5 = 0;
    if (v4 != (id)1)
    {
      if (v4 != (id)2)
      {
        CFStringRef v6 = &stru_1000A4B68;
        goto LABEL_8;
      }
      uint64_t v5 = [v3 objectAtIndexedSubscript:1];
    }
    CFStringRef v6 = [v3 objectAtIndexedSubscript:0];
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v5 = 0;
  CFStringRef v6 = &stru_1000A4B68;
LABEL_9:
  v7 = (void *)v5;
  v8 = (__CFString *)v6;
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
  if ([v3 count] != (id)3)
  {
    v13 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "invalid resolution object", v15, 2u);
    }

    goto LABEL_7;
  }
  id v4 = [v3 objectAtIndexedSubscript:0];
  unsigned int v5 = [v4 integerValue];
  CFStringRef v6 = [v3 objectAtIndexedSubscript:1];
  id v7 = [v6 integerValue];
  v8 = [v3 objectAtIndexedSubscript:2];
  unsigned int v9 = [v8 integerValue];

  uint64_t v10 = (void)v7 << 32;
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
  CFStringRef v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v4), v6);
  v11[1] = v7;
  v8 = +[NSNumber numberWithUnsignedInt:v3];
  void v11[2] = v8;
  unsigned int v9 = +[NSArray arrayWithObjects:v11 count:3];
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
  if ([v11 count] != (id)2)
  {
    uint64_t v10 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "invalid range object", buf, 2u);
    }

    goto LABEL_9;
  }
  CFStringRef v6 = [v11 objectAtIndexedSubscript:0];
  unsigned int v7 = [v6 integerValue];
  v8 = [v11 objectAtIndexedSubscript:1];
  unsigned int v9 = [v8 integerValue];
  *(_DWORD *)uint64_t v4 = v7;
  *(_DWORD *)(v4 + 4) = v9;

  return (ipp_value_range_t)isKindOfClass;
}

- (void)setRange:(ipp_value_range_t)a3
{
  unsigned int v5 = +[NSNumber numberWithInt:*(unsigned int *)a3.var0];
  v9[0] = v5;
  CFStringRef v6 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)&a3 + 4)];
  v9[1] = v6;
  unsigned int v7 = +[NSArray arrayWithObjects:v9 count:2];
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

- (ipp_collection_t)collection
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

  return (ipp_collection_t *)v3;
}

- (void)setCollection:(id)a3
{
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)ipp_value_t;
  uint64_t v3 = [(ipp_value_t *)&v6 description];
  uint64_t v4 = +[NSString stringWithFormat:@"%@ { %@ }", v3, self->x_payload];

  return v4;
}

- (id)loggingValue:(int)a3
{
  if (a3 > 32)
  {
    switch(a3)
    {
      case '!':
      case '#':
        v40 = +[NSString stringWithFormat:@"%d", [(ipp_value_t *)self integer]];
        break;
      case '""':
        unsigned int v4 = [(ipp_value_t *)self BOOLean];
        x_payload = @"false";
        if (v4) {
          x_payload = @"true";
        }
        goto LABEL_46;
      case '0':
        objc_super v6 = self->x_payload;
        unsigned int v7 = objc_opt_new();
        v8 = +[NSString stringWithFormat:@"%@<%p> - %lu bytes {", objc_opt_class(), v6, [v6 length]];
        [v7 addObject:v8];

        *(void *)&v49.tm_sec = _NSConcreteStackBlock;
        *(void *)&v49.tm_hour = 3221225472;
        *(void *)&v49.tm_mon = sub_1000426BC;
        *(void *)&v49.tm_wday = &unk_1000A31F8;
        v40 = v7;
        *(void *)&v49.tm_isdst = v40;
        _visitHexLines(v6, 0, &v49);
        unsigned int v9 = +[NSString stringWithFormat:@"}"];
        [(__CFString *)v40 addObject:v9];

        break;
      case '1':
        id v10 = [(ipp_value_t *)self date];
        int v12 = v11;
        memset(&v49.tm_wday, 0, 32);
        v49.tm_mon = BYTE2(v10) - 1;
        v49.tm_year = (bswap32(v10) >> 16) - 1900;
        v49.tm_hour = BYTE4(v10);
        v49.tm_mday = BYTE3(v10);
        *(int8x8_t *)&v49.tm_sec = vand_s8((int8x8_t)vmovn_s64((int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64((unint64_t)v10), (uint64x2_t)xmmword_10006ED30)), (int8x8_t)0xFF000000FFLL);
        time_t v13 = mktime(&v49);
        uint64_t v14 = 3600;
        if (v12 != 45) {
          uint64_t v14 = -3600;
        }
        uint64_t v15 = 60;
        if (v12 != 45) {
          uint64_t v15 = -60;
        }
        v16 = +[NSDate dateWithTimeIntervalSince1970:(double)(v15 * BYTE2(v12) + v14 * BYTE1(v12) + v13)];
        v40 = [v16 description];

        break;
      case '2':
        v17 = self->x_payload;
        v18 = [v17 objectAtIndexedSubscript:0];
        id v19 = [v18 integerValue];
        v20 = [v17 objectAtIndexedSubscript:1];
        id v21 = [v20 integerValue];
        v22 = [v17 objectAtIndexedSubscript:2];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"resolution<%d, %d, %d>", v19, v21, [v22 integerValue]);
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      case '3':
        v17 = self->x_payload;
        v18 = [v17 objectAtIndexedSubscript:0];
        id v23 = [v18 integerValue];
        v20 = [v17 objectAtIndexedSubscript:1];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"range<%d, %d>", v23, [v20 integerValue]);
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case '4':
        v37 = self->x_payload;
        v40 = (__CFString *)objc_opt_new();
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v24 = [v37 attrs];
        id obj = v24;
        id v25 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v25)
        {
          uint64_t v39 = *(void *)v46;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v46 != v39) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v28 = [v27 name];
              v29 = objc_opt_new();
              long long v43 = 0u;
              long long v44 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              v30 = [v27 values];
              id v31 = [v30 countByEnumeratingWithState:&v41 objects:v52 count:16];
              if (v31)
              {
                uint64_t v32 = *(void *)v42;
                do
                {
                  for (j = 0; j != v31; j = (char *)j + 1)
                  {
                    if (*(void *)v42 != v32) {
                      objc_enumerationMutation(v30);
                    }
                    v34 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)j), "loggingValue:", objc_msgSend(v27, "value_tag"));
                    [v29 addObject:v34];
                  }
                  id v31 = [v30 countByEnumeratingWithState:&v41 objects:v52 count:16];
                }
                while (v31);
              }

              v50[0] = @"col_name";
              v50[1] = @"col_vals";
              v51[0] = v28;
              v51[1] = v29;
              v35 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
              [(__CFString *)v40 addObject:v35];
            }
            v24 = obj;
            id v25 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v25);
        }

        break;
      default:
        goto LABEL_36;
    }
    goto LABEL_47;
  }
  if (!a3 || a3 == 16 || a3 == 19)
  {
    v40 = +[NSNull null];
    goto LABEL_47;
  }
LABEL_36:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = self->x_payload;
    if (![v17 count])
    {

      v40 = @"<empty array>";
      goto LABEL_47;
    }
    v18 = [v17 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v17 count] == (id)1)
      {
        v40 = v18;
LABEL_20:

        goto LABEL_47;
      }
      if ([v17 count] == (id)2)
      {
        v20 = [v17 objectAtIndexedSubscript:1];
        v40 = +[NSString stringWithFormat:@"%@ (%@)", v18, v20];
LABEL_19:

        goto LABEL_20;
      }
    }
  }
  x_payload = (__CFString *)self->x_payload;
LABEL_46:
  v40 = x_payload;
LABEL_47:

  return v40;
}

+ (id)valueWithInteger:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = objc_opt_new();
  [v4 setInteger:v3];

  return v4;
}

+ (id)valueWithBoolean:(int)a3
{
  unsigned int v4 = objc_opt_new();
  [v4 setBoolean:a3 != 0];

  return v4;
}

+ (id)valueWithString:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_opt_new();
  id v5 = v3;
  objc_super v6 = v5;
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