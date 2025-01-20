@interface BCCFISet
+ (id)_intersectArray:(id)a3 withArray:(id)a4;
+ (id)_negateArray:(id)a3;
+ (id)_unionArray:(id)a3 withArray:(id)a4;
+ (id)cfiSet;
+ (id)cfiSetWithCFIString:(id)a3;
+ (id)cfiSetWithCFIStrings:(id)a3;
- (BCCFI)firstCFI;
- (BCCFI)lastCFI;
- (BCCFISet)init;
- (BCCFISet)initWithCFI:(id)a3;
- (BCCFISet)initWithCFIArray:(id)a3;
- (BCCFISet)initWithCFIString:(id)a3;
- (BCCFISet)initWithCFIStrings:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)firstCFIString;
- (NSString)lastCFIString;
- (id)_arrayCopyWithOnlyRangeCFIsFromCFIs:(id)a3;
- (id)_mutableArrayCopyWithOnlyRangeCFIsFromCFIs:(id)a3;
- (id)allCFIStrings;
- (id)allCFIs;
- (id)cfis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)intersectionWithCFISet:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)unionWithCFISet:(id)a3;
- (int64_t)cfiCount;
- (void)setCFIs:(id)a3;
@end

@implementation BCCFISet

- (id)cfis
{
  return self->_cfis;
}

- (void)setCFIs:(id)a3
{
}

+ (id)cfiSet
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)cfiSetWithCFIString:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCFIString:v4];

  return v5;
}

+ (id)cfiSetWithCFIStrings:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCFIStrings:v4];

  return v5;
}

- (BCCFISet)initWithCFIArray:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCCFISet;
  id v5 = [(BCCFISet *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCCFISet *)v5 _arrayCopyWithOnlyRangeCFIsFromCFIs:v4];
    cfis = v6->_cfis;
    v6->_cfis = (NSArray *)v7;
  }
  return v6;
}

- (BCCFISet)init
{
  v3 = +[NSArray array];
  id v4 = [(BCCFISet *)self initWithCFIArray:v3];

  return v4;
}

- (BCCFISet)initWithCFI:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  id v5 = [(BCCFISet *)self initWithCFIArray:v4];

  return v5;
}

- (BCCFISet)initWithCFIString:(id)a3
{
  id v5 = a3;
  id v15 = 0;
  v6 = +[BCCFI cfiWithString:v5 error:&v15];
  id v7 = v15;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      objc_super v10 = NSStringFromClass(v9);
      v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot initialize %@ with string %@.  %@ will return nil", buf, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = +[NSArray arrayWithObject:v6];
    v13 = [(BCCFISet *)self initWithCFIArray:v12];
    self = v12;
  }

  return v13;
}

- (BCCFISet)initWithCFIStrings:(id)a3
{
  aSelector = a2;
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v10);
        id v21 = 0;
        v12 = +[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v11, &v21, aSelector);
        id v13 = v21;
        if (v13)
        {
          id v15 = v13;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (objc_class *)objc_opt_class();
            v17 = NSStringFromClass(v16);
            __int16 v18 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            v27 = v17;
            __int16 v28 = 2112;
            uint64_t v29 = v11;
            __int16 v30 = 2112;
            v31 = v18;
            _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot initialize %@ with string %@.  %@ will return nil", buf, 0x20u);
          }
          goto LABEL_16;
        }
        if (v12) {
          [v5 addObject:v12];
        }

        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if ([v5 count])
  {
    v14 = [(BCCFISet *)self initWithCFIArray:v5];
  }
  else
  {
LABEL_16:

    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BCCFISet alloc];
  id v5 = [(NSArray *)self->_cfis copy];
  id v6 = [(BCCFISet *)v4 initWithCFIArray:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BCMutableCFISet alloc];
  id v5 = [(NSArray *)self->_cfis copy];
  id v6 = [(BCCFISet *)v4 initWithCFIArray:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  if ([v5 isSubclassOfClass:objc_opt_class()]) {
    unsigned __int8 v6 = [(NSArray *)self->_cfis isEqual:v4[1]];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)allCFIs
{
  id v2 = [(NSArray *)self->_cfis copy];

  return v2;
}

- (id)description
{
  v3 = +[NSMutableString stringWithString:@"{\n"];
  id v4 = [(BCCFISet *)self allCFIs];
  id v5 = (char *)[v4 count];
  if (v5)
  {
    unsigned __int8 v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      if (i) {
        CFStringRef v8 = @", ";
      }
      else {
        CFStringRef v8 = &stru_2CE418;
      }
      uint64_t v9 = [v4 objectAtIndexedSubscript:i];
      objc_super v10 = [v9 string];
      [v3 appendFormat:@"  %@%@\n", v8, v10];
    }
  }
  [v3 appendString:@"}"];

  return v3;
}

- (id)allCFIStrings
{
  v3 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_cfis;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 134218242;
    long long v16 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_super v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 string:v16, v17];
        if ([v11 length])
        {
          [v3 addObject:v11];
        }
        else
        {
          v12 = BCReadingStatisticsLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v13 = [v10 description];
            *(_DWORD *)buf = v16;
            long long v22 = v10;
            __int16 v23 = 2112;
            long long v24 = v13;
            _os_log_error_impl(&def_7D91C, v12, OS_LOG_TYPE_ERROR, "Can't generate a string for CFI %p=%@", buf, 0x16u);
          }
        }
      }
      id v7 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  id v14 = [v3 copy];

  return v14;
}

- (int64_t)cfiCount
{
  id v2 = [(BCCFISet *)self cfis];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (BCCFI)firstCFI
{
  id v2 = [(BCCFISet *)self cfis];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }

  return (BCCFI *)v3;
}

- (BCCFI)lastCFI
{
  id v2 = [(BCCFISet *)self cfis];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:[v2 count] - 1];
  }
  else
  {
    id v3 = 0;
  }

  return (BCCFI *)v3;
}

- (NSString)firstCFIString
{
  id v2 = [(BCCFISet *)self firstCFI];
  id v3 = [v2 string];

  return (NSString *)v3;
}

- (NSString)lastCFIString
{
  id v2 = [(BCCFISet *)self lastCFI];
  id v3 = [v2 string];

  return (NSString *)v3;
}

- (id)unionWithCFISet:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCFISet *)self cfis];
  long long v6 = [v4 cfis];

  id v7 = [(id)objc_opt_class() _unionArray:v5 withArray:v6];
  uint64_t v8 = [[BCCFISet alloc] initWithCFIArray:v7];

  return v8;
}

- (id)intersectionWithCFISet:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCFISet *)self cfis];
  long long v6 = [v4 cfis];

  id v7 = [(id)objc_opt_class() _intersectArray:v5 withArray:v6];
  uint64_t v8 = [[BCCFISet alloc] initWithCFIArray:v7];

  return v8;
}

+ (id)_intersectArray:(id)a3 withArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  id v8 = [v5 count];
  id v9 = [v6 count];
  if (v8 && v9)
  {
    objc_super v10 = 0;
    uint64_t v11 = 0;
    do
    {
      v12 = [v5 objectAtIndex:v10];
      id v13 = [v6 objectAtIndex:v11];
      id v14 = [v12 intersectWithCFI:v13];
      if ([v14 isRange]) {
        [v7 addObject:v14];
      }
      if ([v12 compareCFITail:v13] == (id)-1) {
        ++v10;
      }
      else {
        ++v11;
      }

      id v15 = (char *)[v5 count];
      long long v16 = (char *)[v6 count];
    }
    while (v10 != v15 && v11 != v16);
  }

  return v7;
}

+ (id)_unionArray:(id)a3 withArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  unint64_t v8 = (unint64_t)[v5 count];
  unint64_t v9 = (unint64_t)[v6 count];
  BOOL v10 = v8 != 0;
  BOOL v11 = v9 != 0;
  if (v8 | v9)
  {
    v12 = 0;
    id v13 = 0;
    do
    {
      if (v10
        && (!v11
         || ([v5 objectAtIndex:v12],
             id v14 = objc_claimAutoreleasedReturnValue(),
             [v6 objectAtIndex:v13],
             id v15 = objc_claimAutoreleasedReturnValue(),
             id v16 = [v14 compare:v15],
             v15,
             v14,
             v16 == (id)-1)))
      {
        long long v17 = [v5 objectAtIndex:v12];
        ++v12;
      }
      else
      {
        long long v17 = [v6 objectAtIndex:v13];
        ++v13;
      }
      long long v18 = [v7 lastObject];
      long long v19 = [v18 intersectWithCFI:v17];
      if (v19)
      {
        long long v20 = [v18 unionWithCFI:v17];
        [v7 replaceObjectAtIndex:[v7 count] - 1 withObject:v20];
      }
      else
      {
        [v7 addObject:v17];
      }

      id v21 = (char *)[v5 count];
      long long v22 = (char *)[v6 count];
      BOOL v11 = v13 != v22;
      BOOL v10 = v12 != v21;
    }
    while (v12 != v21 || v13 != v22);
  }

  return v7;
}

+ (id)_negateArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  id v5 = [v3 count];
  if (v5)
  {
    unint64_t v6 = (unint64_t)v5;
    id v7 = [v3 firstObject];
    unint64_t v8 = +[BCCFI minimumCFI];
    unint64_t v9 = [v8 rangeToCFI:v7];

    if ([v9 isRange]) {
      [v4 addObject:v9];
    }
    if (v6 < 2)
    {
      id v13 = 0;
    }
    else
    {
      BOOL v10 = 0;
      for (uint64_t i = 1; i != v6; ++i)
      {
        v12 = v9;
        id v13 = v7;

        id v7 = [v3 objectAtIndexedSubscript:i];

        unint64_t v9 = [v13 rangeToCFI:v7];

        if ([v9 isRange]) {
          [v4 addObject:v9];
        }
        BOOL v10 = v13;
      }
    }
    id v16 = +[BCCFI maximumCFI];
    id v14 = [v7 rangeToCFI:v16];

    if ([v14 isRange]) {
      [v4 addObject:v14];
    }
  }
  else
  {
    id v13 = +[BCCFI minimumCFI];
    id v7 = +[BCCFI maximumCFI];
    id v14 = [v13 rangeToCFI:v7];
    uint64_t v15 = +[NSMutableArray arrayWithObject:v14];

    id v4 = (void *)v15;
  }

  return v4;
}

- (id)_mutableArrayCopyWithOnlyRangeCFIsFromCFIs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isRange", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_arrayCopyWithOnlyRangeCFIsFromCFIs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(BCCFISet *)self _mutableArrayCopyWithOnlyRangeCFIsFromCFIs:v4];
    id v6 = [v5 copy];
  }
  else
  {
    id v6 = +[NSArray array];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end