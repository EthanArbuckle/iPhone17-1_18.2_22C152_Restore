@interface REHTTPFileCache
- (REHTTPFileCache)initWithRootDirectory:(id)a3;
- (id)loadFileAtPath:(id)a3;
@end

@implementation REHTTPFileCache

- (REHTTPFileCache)initWithRootDirectory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REHTTPFileCache;
  v6 = [(REHTTPFileCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directory, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v7->_cache;
    v7->_cache = v8;
  }
  return v7;
}

- (id)loadFileAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSCache *)self->_cache objectForKey:v4];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [MEMORY[0x263EFF9D0] null];
    char v8 = [v6 isEqual:v7];

    if (v8)
    {
      v9 = 0;
      v10 = v4;
      goto LABEL_14;
    }
    id v16 = v6;
    v9 = v16;
    v10 = v4;
  }
  else
  {
    objc_super v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
    cache = self->_cache;
    v13 = v11;
    if (!v11)
    {
      v13 = [MEMORY[0x263EFF9D0] null];
    }
    -[NSCache setObject:forKey:cost:](cache, "setObject:forKey:cost:", v13, v4, [v11 length]);
    v10 = v4;
    if (!v11)
    {

      v10 = [(NSString *)self->_directory stringByAppendingPathComponent:v4];

      objc_super v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v10];
      v14 = self->_cache;
      v15 = v11;
      if (!v11)
      {
        v15 = [MEMORY[0x263EFF9D0] null];
      }
      -[NSCache setObject:forKey:cost:](v14, "setObject:forKey:cost:", v15, v4, [v11 length]);
      if (!v11) {
    }
      }
    id v16 = v11;
    v9 = v16;
  }
  v6 = v16;
LABEL_14:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end