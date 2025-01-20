@interface SXActionEngine
- (NSMutableDictionary)additionFactories;
- (NSMutableDictionary)hostNameFactories;
- (SXActionEngine)init;
- (id)actionForAddition:(id)a3;
- (id)actionForURL:(id)a3;
- (void)registerFactory:(id)a3 URLHost:(id)a4;
- (void)registerFactory:(id)a3 additionType:(Class)a4;
@end

@implementation SXActionEngine

- (SXActionEngine)init
{
  v8.receiver = self;
  v8.super_class = (Class)SXActionEngine;
  v2 = [(SXActionEngine *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    additionFactories = v2->_additionFactories;
    v2->_additionFactories = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    hostNameFactories = v2->_hostNameFactories;
    v2->_hostNameFactories = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)actionForAddition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  objc_super v8 = 0;
  if (v4 && v6)
  {
    v9 = [(SXActionEngine *)self additionFactories];
    v10 = [v9 objectForKey:v7];

    objc_super v8 = [v10 actionForAddition:v4];
  }
  return v8;
}

- (id)actionForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 host];
  if (v5
    && ([v4 scheme],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"action"],
        v6,
        v7))
  {
    objc_super v8 = [(SXActionEngine *)self hostNameFactories];
    v9 = [v8 objectForKey:v5];

    v10 = [v9 actionForURL:v4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)registerFactory:(id)a3 additionType:(Class)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    id v8 = [(SXActionEngine *)self additionFactories];
    int v7 = NSStringFromClass(a4);
    [v8 setObject:v6 forKey:v7];
  }
}

- (void)registerFactory:(id)a3 URLHost:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(SXActionEngine *)self hostNameFactories];
    [v8 setObject:v7 forKey:v6];
  }
}

- (NSMutableDictionary)additionFactories
{
  return self->_additionFactories;
}

- (NSMutableDictionary)hostNameFactories
{
  return self->_hostNameFactories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostNameFactories, 0);
  objc_storeStrong((id *)&self->_additionFactories, 0);
}

@end