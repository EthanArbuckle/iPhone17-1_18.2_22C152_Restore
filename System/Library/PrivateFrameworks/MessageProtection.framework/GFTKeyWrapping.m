@interface GFTKeyWrapping
+ (id)decrypt:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5;
+ (id)encrypt:(id)a3 toKey:(__SecKey *)a4 error:(id *)a5;
+ (id)unwrapSeed:(id)a3 usingKey:(__SecKey *)a4 legacy:(BOOL)a5 error:(id *)a6;
+ (id)wrapSeed:(id)a3 to:(__SecKey *)a4 legacy:(BOOL)a5 error:(id *)a6;
+ (id)wrapSeed:(id)a3 toKeys:(id)a4 error:(id *)a5;
@end

@implementation GFTKeyWrapping

+ (id)wrapSeed:(id)a3 to:(__SecKey *)a4 legacy:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  CFErrorRef error = 0;
  CFDataRef v11 = SecKeyCopyExternalRepresentation(a4, &error);
  [v10 addObject:v11];

  if (a6 && error)
  {
    v12 = 0;
    *a6 = error;
  }
  else
  {
    v12 = +[GFTKeyWrapper wrapSeed:v9 to:v10 legacy:v7 error:a6];
  }

  return v12;
}

+ (id)wrapSeed:(id)a3 toKeys:(id)a4 error:(id *)a5
{
  return +[GFTKeyWrapper wrapSeed:a3 to:a4 legacy:0 error:a5];
}

+ (id)unwrapSeed:(id)a3 usingKey:(__SecKey *)a4 legacy:(BOOL)a5 error:(id *)a6
{
  return +[GFTKeyWrapper unwrapWrappedSeed:a3 legacy:a5 using:a4 error:a6];
}

+ (id)encrypt:(id)a3 toKey:(__SecKey *)a4 error:(id *)a5
{
  return +[GFTKeyWrapper encrypt:a3 to:a4 error:a5];
}

+ (id)decrypt:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5
{
  return +[GFTKeyWrapper decrypt:a3 using:a4 error:a5];
}

@end