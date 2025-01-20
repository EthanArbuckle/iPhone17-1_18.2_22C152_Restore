@interface _POJWTBodyBase
- (NSDictionary)allData;
- (NSMutableDictionary)data;
- (NSString)description;
- (_POJWTBodyBase)init;
- (_POJWTBodyBase)initWithDictionary:(id)a3;
- (_POJWTBodyBase)initWithJWTData:(id)a3;
- (id)dataRepresentation;
- (void)setData:(id)a3;
@end

@implementation _POJWTBodyBase

- (_POJWTBodyBase)init
{
  v6.receiver = self;
  v6.super_class = (Class)_POJWTBodyBase;
  v2 = [(_POJWTBodyBase *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (_POJWTBodyBase)initWithJWTData:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_POJWTBodyBase;
  v5 = [(_POJWTBodyBase *)&v17 init];
  if (v5)
  {
    id v16 = 0;
    uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:17 error:&v16];
    id v7 = v16;
    v8 = v7;
    if (!v6)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __34___POJWTBodyBase_initWithJWTData___block_invoke;
      v14[3] = &unk_265463860;
      id v15 = v7;
      id v11 = v7;
      id v12 = __34___POJWTBodyBase_initWithJWTData___block_invoke((uint64_t)v14);

      v10 = 0;
      goto LABEL_6;
    }
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (_POJWTBodyBase)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_POJWTBodyBase;
  v5 = [(_POJWTBodyBase *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (id)dataRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_data mutableCopy];
  uint64_t v5 = 0;
  uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:9 error:&v5];

  return v3;
}

- (NSDictionary)allData
{
  return (NSDictionary *)self->_data;
}

- (NSString)description
{
  v2 = (void *)[(NSMutableDictionary *)self->_data mutableCopy];
  uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:9 error:0];
  id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return (NSString *)v4;
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end