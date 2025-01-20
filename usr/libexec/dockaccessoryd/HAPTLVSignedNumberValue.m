@interface HAPTLVSignedNumberValue
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5;
- (id)_serialize;
- (id)description;
@end

@implementation HAPTLVSignedNumberValue

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPTLVSignedNumberValue);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPTLVNumberValueBase *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  unint64_t v5 = sub_10002495C((unsigned __int8 *)a3, a4, a5);

  return +[NSNumber numberWithLongLong:v5];
}

- (id)_serialize
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  v3 = sub_100024A58((uint64_t)[v2 longLongValue]);

  return v3;
}

- (id)description
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<HAPTLVSignedNumberValue value=%lld>", [v2 longLongValue]);

  return v3;
}

@end