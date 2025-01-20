@interface SRAssetBundle
- (NSArray)contentTypes;
- (NSLocale)locale;
- (SRAssetBundle)initWithLocale:(id)a3;
- (id)assetsWithContentType:(id)a3;
- (void)loadAssetsWithContentType:(id)a3 contentName:(id)a4 contentPath:(id)a5;
@end

@implementation SRAssetBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

- (void)loadAssetsWithContentType:(id)a3 contentName:(id)a4 contentPath:(id)a5
{
  id v14 = a3;
  contents = self->_contents;
  id v9 = a5;
  id v10 = a4;
  v11 = [(NSMutableDictionary *)contents objectForKeyedSubscript:v14];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(NSMutableDictionary *)self->_contents setObject:v12 forKeyedSubscript:v14];
  }
  v13 = [(NSMutableDictionary *)self->_contents objectForKeyedSubscript:v14];
  [v13 setObject:v9 forKeyedSubscript:v10];
}

- (SRAssetBundle)initWithLocale:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRAssetBundle;
  v6 = [(SRAssetBundle *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    contents = v7->_contents;
    v7->_contents = v8;
  }
  return v7;
}

- (id)assetsWithContentType:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_contents objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_contents objectForKeyedSubscript:v4];
    v7 = [v6 allValues];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (NSArray)contentTypes
{
  return (NSArray *)[(NSMutableDictionary *)self->_contents allKeys];
}

- (NSLocale)locale
{
  return self->_locale;
}

@end