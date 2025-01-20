@interface HAPTLVFloatNumberValue
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5;
- (id)_serialize;
- (id)description;
@end

@implementation HAPTLVFloatNumberValue

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPTLVFloatNumberValue);
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
  if (a4 == 4)
  {
    LODWORD(v5) = *(_DWORD *)a3;
    v6 = +[NSNumber numberWithFloat:v5];
  }
  else
  {
    v6 = 0;
    if (a5) {
      *a5 = -6705;
    }
  }

  return v6;
}

- (id)_serialize
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  [v2 floatValue];
  int v6 = v3;

  v4 = +[NSData dataWithBytes:&v6 length:4];

  return v4;
}

- (id)description
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  [v2 floatValue];
  v4 = +[NSString stringWithFormat:@"<HAPTLVFloatNumberValue value=%f>", v3];

  return v4;
}

@end