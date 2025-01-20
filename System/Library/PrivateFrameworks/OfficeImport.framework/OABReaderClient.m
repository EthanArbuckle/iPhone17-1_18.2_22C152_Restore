@interface OABReaderClient
+ (BOOL)sourceDrawableIsTopLevel:(id)a3;
@end

@implementation OABReaderClient

+ (BOOL)sourceDrawableIsTopLevel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 eshObject];
  v5 = v3;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4) == 6)
  {
    v5 = [v3 parent];
  }
  v6 = [v5 parent];
  v7 = [v6 parent];
  uint64_t v8 = [v7 eshObject];

  if (v8) {
    BOOL v9 = (*(unsigned int (**)(uint64_t))(*(void *)v8 + 16))(v8) == 61442;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

@end