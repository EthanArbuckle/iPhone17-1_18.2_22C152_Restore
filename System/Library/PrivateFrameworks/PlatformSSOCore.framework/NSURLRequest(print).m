@interface NSURLRequest(print)
- (id)psso_DisplayRequest;
@end

@implementation NSURLRequest(print)

- (id)psso_DisplayRequest
{
  v2 = [a1 URL];

  if (v2)
  {
    v3 = (void *)MEMORY[0x263F08BA0];
    v4 = [a1 URL];
    v5 = [v4 absoluteString];
    v6 = [v3 componentsWithString:v5];

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__4;
    v28 = __Block_byref_object_dispose__4;
    v7 = NSString;
    v8 = [a1 HTTPMethod];
    v9 = [v6 path];
    id v29 = [v7 stringWithFormat:@"%@ %@ %@\n", v8, v9, @"HTTP/1.1"];

    v10 = (void *)v25[5];
    v11 = [v6 host];
    uint64_t v12 = [v10 stringByAppendingFormat:@"%@ %@\n", @"Host:", v11];
    v13 = (void *)v25[5];
    v25[5] = v12;

    v14 = [a1 allHTTPHeaderFields];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__NSURLRequest_print__psso_DisplayRequest__block_invoke;
    v23[3] = &unk_2654643A8;
    v23[4] = &v24;
    [v14 enumerateKeysAndObjectsUsingBlock:v23];

    v15 = (void *)v25[5];
    id v16 = [NSString alloc];
    v17 = [a1 HTTPBody];
    v18 = (void *)[v16 initWithData:v17 encoding:4];
    uint64_t v19 = [v15 stringByAppendingFormat:@"\n%@\n", v18];
    v20 = (void *)v25[5];
    v25[5] = v19;

    id v21 = (id)v25[5];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v21 = 0;
  }
  return v21;
}

@end