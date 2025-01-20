@interface STRPOPACKCoder
+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5;
+ (id)encodeObject:(id)a3 error:(id *)a4;
@end

@implementation STRPOPACKCoder

+ (id)encodeObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(STRPPropertyListTypeEncoder);
  v7 = [(STRPPropertyListTypeEncoder *)v6 encodeRootObject:v5];

  int v12 = 0;
  v8 = (void *)MEMORY[0x26115FCC0](v7, 0, &v12);
  if (v8) {
    BOOL v9 = v12 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  int v10 = !v9;
  if (a4 && v10)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"STRPCodingErrorDomain" code:2 userInfo:0];
  }

  return v8;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  v7 = (void *)OPACKDecodeData();
  if (v7)
  {
    v8 = objc_alloc_init(STRPPropertyListTypeDecoder);
    BOOL v9 = [(STRPPropertyListTypeDecoder *)v8 decodeRootObjectOfClass:a3 fromEncoded:v7 error:a5];
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"STRPCodingErrorDomain" code:2 userInfo:0];
    BOOL v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end