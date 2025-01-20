@interface MSError
+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7;
+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8;
+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6;
@end

@implementation MSError

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6
{
  v6 = +[MSError MSErrorWithDomain:a3 code:a4 errorLevel:5 underlyingError:a5 description:a6 arguments:&v9];

  return v6;
}

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17 = v16;
  if (v14) {
    [v16 setObject:v14 forKey:*MEMORY[0x263F08608]];
  }
  if (v15)
  {
    v18 = (void *)[[NSString alloc] initWithFormat:v15 arguments:a8];
    [v17 setObject:v18 forKey:*MEMORY[0x263F08320]];
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v18 = 0;
  if (a5) {
LABEL_5:
  }
    _MSLog(a5, v18);
LABEL_6:
  v19 = [MEMORY[0x263F087E8] errorWithDomain:v13 code:a4 userInfo:v17];

  return v19;
}

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7
{
  v7 = +[MSError MSErrorWithDomain:a3 code:a4 errorLevel:a5 underlyingError:a6 description:a7 arguments:&v10];

  return v7;
}

@end