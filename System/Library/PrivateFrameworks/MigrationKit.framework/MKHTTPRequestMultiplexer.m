@interface MKHTTPRequestMultiplexer
- (MKHTTPRequestMultiplexer)init;
- (id)method:(unint64_t)a3;
- (id)routerForMethod:(id)a3 path:(id)a4;
- (void)addRouter:(id)a3 method:(unint64_t)a4 path:(id)a5;
@end

@implementation MKHTTPRequestMultiplexer

- (MKHTTPRequestMultiplexer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKHTTPRequestMultiplexer;
  v2 = [(MKHTTPRequestMultiplexer *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    routers = v2->_routers;
    v2->_routers = v3;
  }
  return v2;
}

- (id)method:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return &stru_26DF6A8B0;
  }
  else {
    return off_264906078[a3 - 1];
  }
}

- (void)addRouter:(id)a3 method:(unint64_t)a4 path:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  v9 = [(MKHTTPRequestMultiplexer *)self method:a4];
  if (objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v8, "length") - 1) != 47)
  {
    uint64_t v10 = [v8 stringByAppendingString:@"/"];

    id v8 = (id)v10;
  }
  id v11 = [(NSMutableDictionary *)self->_routers objectForKey:v9];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(NSMutableDictionary *)self->_routers setObject:v11 forKey:v9];
  }
  [v11 setObject:v12 forKey:v8];
}

- (id)routerForMethod:(id)a3 path:(id)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1) != 47)
  {
    uint64_t v8 = [v7 stringByAppendingString:@"/"];

    id v7 = (id)v8;
  }
  v9 = [v7 pathComponents];
  if ((unint64_t)[v9 count] < 2)
  {
    v13 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];
    id v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", 1, v10);
    v18[1] = v11;
    v18[2] = @"/";
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
    v13 = [v12 componentsJoinedByString:&stru_26DF6A8B0];
  }
  v14 = [(NSMutableDictionary *)self->_routers objectForKey:v6];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 objectForKey:v7];
    if (!v16 && v13)
    {
      v16 = [v15 objectForKey:v13];
    }
    if (!v16)
    {
      v16 = [v15 objectForKey:@"/"];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end