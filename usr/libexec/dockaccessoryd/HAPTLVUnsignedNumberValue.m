@interface HAPTLVUnsignedNumberValue
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5;
- (id)_serialize;
- (id)description;
@end

@implementation HAPTLVUnsignedNumberValue

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPTLVUnsignedNumberValue);
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
  uint64_t v5 = sub_100024C8C((unsigned __int8 *)a3, a4, a5);

  return +[NSNumber numberWithUnsignedLongLong:v5];
}

- (id)_serialize
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  v3 = sub_100024D78((unint64_t)[v2 unsignedLongLongValue]);

  return v3;
}

- (id)description
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<HAPTLVUnsignedNumberValue value=%llu>", [v2 unsignedLongLongValue]);

  return v3;
}

@end