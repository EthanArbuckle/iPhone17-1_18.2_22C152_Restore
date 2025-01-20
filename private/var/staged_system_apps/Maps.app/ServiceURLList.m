@interface ServiceURLList
+ (id)defaultServiceURLLists;
- ($6E15C01CA1BE37A4936191A84F7075E2)defaultsKey;
- (NSString)defaultCustomURLString;
- (NSString)serviceName;
- (ServiceURLList)initWithName:(id)a3 defaultsKey:(id)a4;
- (id)URLAtIndex:(unint64_t)a3;
- (id)callback;
- (id)infoAtIndex:(unint64_t)a3;
- (id)nameAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addURL:(id)a3 withName:(id)a4 info:(id)a5;
- (void)setCallback:(id)a3;
- (void)setDefaultCustomURLString:(id)a3;
@end

@implementation ServiceURLList

- (ServiceURLList)initWithName:(id)a3 defaultsKey:(id)a4
{
  var1 = a4.var0.var1;
  uint64_t v5 = *(void *)&a4.var0.var0;
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ServiceURLList;
  v8 = [(ServiceURLList *)&v19 init];
  if (v8)
  {
    v9 = (NSString *)[v7 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = v9;

    *(void *)&v8->_defaultsKey.key.identifier = v5;
    v8->_defaultsKey.key.metadata = var1;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    names = v8->_names;
    v8->_names = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    urls = v8->_urls;
    v8->_urls = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    infos = v8->_infos;
    v8->_infos = v15;

    v17 = v8;
  }

  return v8;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)defaultsKey
{
  metadata = self->_defaultsKey.key.metadata;
  uint64_t v3 = *(void *)&self->_defaultsKey.key.identifier;
  result.var0.var1 = metadata;
  *(void *)&result.var0.var0 = v3;
  return result;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_names count];
}

- (void)addURL:(id)a3 withName:(id)a4 info:(id)a5
{
  id v12 = a5;
  names = self->_names;
  id v9 = a3;
  [(NSMutableArray *)names addObject:a4];
  [(NSMutableArray *)self->_urls addObject:v9];

  infos = self->_infos;
  if (v12)
  {
    [(NSMutableArray *)self->_infos addObject:v12];
  }
  else
  {
    v11 = +[NSNull null];
    [(NSMutableArray *)infos addObject:v11];
  }
}

- (id)URLAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_urls count] >= a3)
  {
    uint64_t v5 = [(NSMutableArray *)self->_urls objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)nameAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_names count] >= a3)
  {
    uint64_t v5 = [(NSMutableArray *)self->_names objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)infoAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_infos count] >= a3)
  {
    v6 = [(NSMutableArray *)self->_infos objectAtIndexedSubscript:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)defaultServiceURLLists
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = 0; i != 65; ++i)
  {
    unint64_t v4 = i + 1;
    if ((unint64_t)(i - 22) < 0x2B || v4 <= 0x15 && ((1 << v4) & 0x3DDE26) != 0)
    {
      id v5 = [ServiceURLList alloc];
      if (v4 > 0x41) {
        v6 = 0;
      }
      else {
        v6 = off_101321F58[i];
      }
      uint64_t v7 = GEOURLConfigKey();
      id v9 = -[ServiceURLList initWithName:defaultsKey:](v5, "initWithName:defaultsKey:", v6, v7, v8);
      v10 = GEOURLWorldDefaultURLString();
      [(ServiceURLList *)v9 setDefaultCustomURLString:v10];

      [v2 addObject:v9];
    }
  }
  v11 = [ServiceURLList alloc];
  id v12 = [(ServiceURLList *)v11 initWithName:@"Environment Manifest Format", GeoServicesConfig_CustomEnvironmentURLFormat[0], GeoServicesConfig_CustomEnvironmentURLFormat[1] defaultsKey];
  [v2 addObject:v12];

  return v2;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSString)defaultCustomURLString
{
  return self->_defaultCustomURLString;
}

- (void)setDefaultCustomURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_defaultCustomURLString, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_names, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end