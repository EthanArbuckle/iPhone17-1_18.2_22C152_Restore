@interface WLKMescal
+ (BOOL)signNetworkRequest:(id)a3 error:(id *)a4;
@end

@implementation WLKMescal

+ (BOOL)signNetworkRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 HTTPBody];
  v7 = (void *)MEMORY[0x1E4F4DD50];
  v8 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
  id v15 = 0;
  v9 = [v7 signatureFromData:v6 type:1 bag:v8 error:&v15];
  id v10 = v15;

  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  BOOL v12 = !v11;
  if (v11)
  {
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    v13 = [v9 base64EncodedStringWithOptions:0];
    [v5 setValue:v13 forHTTPHeaderField:*MEMORY[0x1E4F4DA68]];
  }
  return v12;
}

@end