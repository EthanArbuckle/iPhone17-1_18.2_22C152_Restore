@interface BCMutableCFISet
- (BOOL)addCFIString:(id)a3 error:(id *)a4;
- (BOOL)removeCFIString:(id)a3 error:(id *)a4;
- (void)addCFI:(id)a3;
- (void)removeCFI:(id)a3;
- (void)subtractCFISet:(id)a3;
- (void)unionCFISet:(id)a3;
@end

@implementation BCMutableCFISet

- (void)addCFI:(id)a3
{
  id v4 = a3;
  if ([v4 isRange])
  {
    v5 = objc_opt_class();
    v6 = [(BCCFISet *)self cfis];
    id v10 = v4;
    v7 = +[NSArray arrayWithObjects:&v10 count:1];
    v8 = [v5 _unionArray:v6 withArray:v7];

    id v9 = [v8 mutableCopy];
    [(BCCFISet *)self setCFIs:v9];
  }
}

- (BOOL)addCFIString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  v7 = +[BCCFI cfiWithString:v6 error:&v11];
  id v8 = v11;
  if (v7)
  {
    [(BCMutableCFISet *)self addCFI:v7];
    if (a4) {
LABEL_3:
    }
      *a4 = v8;
  }
  else
  {
    id v10 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_DEFAULT, "Cannot initialize BCCFI with string %@.  addCFIString: will return nil. error=%@", buf, 0x16u);
    }

    if (a4) {
      goto LABEL_3;
    }
  }

  return v8 == 0;
}

- (void)unionCFISet:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(BCCFISet *)self cfis];
  v7 = [v4 cfis];

  id v9 = [v5 _unionArray:v6 withArray:v7];

  id v8 = [v9 mutableCopy];
  [(BCCFISet *)self setCFIs:v8];
}

- (void)removeCFI:(id)a3
{
  id v4 = a3;
  if ([v4 isRange])
  {
    v5 = objc_opt_class();
    id v12 = v4;
    id v6 = +[NSArray arrayWithObjects:&v12 count:1];
    v7 = [v5 _negateArray:v6];

    id v8 = objc_opt_class();
    id v9 = [(BCCFISet *)self cfis];
    id v10 = [v8 _intersectArray:v9 withArray:v7];

    id v11 = [v10 mutableCopy];
    [(BCCFISet *)self setCFIs:v11];
  }
}

- (BOOL)removeCFIString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  v7 = +[BCCFI cfiWithString:v6 error:&v11];
  id v8 = v11;
  if (v7)
  {
    [(BCMutableCFISet *)self removeCFI:v7];
    if (a4) {
LABEL_3:
    }
      *a4 = v8;
  }
  else
  {
    id v10 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ED90C((uint64_t)v6, (uint64_t)v8, v10);
    }

    if (a4) {
      goto LABEL_3;
    }
  }

  return v8 == 0;
}

- (void)subtractCFISet:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [v4 cfis];

  id v11 = [v5 _negateArray:v6];

  v7 = objc_opt_class();
  id v8 = [(BCCFISet *)self cfis];
  id v9 = [v7 _intersectArray:v8 withArray:v11];

  id v10 = [v9 mutableCopy];
  [(BCCFISet *)self setCFIs:v10];
}

@end