@interface NSMutableURLRequest(ICAdditions)
- (void)ic_appendHTTPCookieWithName:()ICAdditions value:;
- (void)ic_appendHTTPCookies:()ICAdditions;
@end

@implementation NSMutableURLRequest(ICAdditions)

- (void)ic_appendHTTPCookieWithName:()ICAdditions value:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = a3;
  v11[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  objc_msgSend(a1, "ic_appendHTTPCookies:", v9);
}

- (void)ic_appendHTTPCookies:()ICAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "ic_valueForHTTPHeaderField:", @"Cookie");
  id v6 = (id)[v5 mutableCopy];

  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NSMutableURLRequest_ICAdditions__ic_appendHTTPCookies___block_invoke;
  v8[3] = &unk_1E5ACC570;
  id v9 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  [a1 setValue:v7 forHTTPHeaderField:@"Cookie"];
}

@end