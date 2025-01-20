@interface OAXTableStyleCache
- (OAXTableStyleCache)init;
- (_xmlNode)defaultStyleNode;
- (_xmlNode)styleNodeForId:(id)a3;
- (id)defaultStyleId;
- (void)setDefaultStyleId:(id)a3;
- (void)setStyleNode:(_xmlNode *)a3 forId:(id)a4;
- (void)setStylesPart:(id)a3;
@end

@implementation OAXTableStyleCache

- (OAXTableStyleCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)OAXTableStyleCache;
  v2 = [(OAXTableStyleCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mCache = v2->mCache;
    v2->mCache = v3;
  }
  return v2;
}

- (void)setDefaultStyleId:(id)a3
{
}

- (_xmlNode)defaultStyleNode
{
  return [(OAXTableStyleCache *)self styleNodeForId:self->mDefaultStyleId];
}

- (_xmlNode)styleNodeForId:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->mCache objectForKey:v4];
  objc_super v6 = (_xmlNode *)[v5 pointerValue];

  if (!v6)
  {
    v7 = +[TCBundleResourceManager instance];
    unint64_t v8 = [v4 length];
    if (v8 < 2)
    {
      objc_super v6 = 0;
    }
    else
    {
      uint64_t v9 = objc_msgSend(v4, "substringWithRange:", 1, v8 - 2);

      v10 = (_xmlDoc *)[v7 xmlDocumentForResource:v9 ofType:@"xml" inPackage:@"DefaultTableStyles"];
      if (v10) {
        objc_super v6 = OCXGetRootElement(v10);
      }
      else {
        objc_super v6 = 0;
      }
      id v4 = (id)v9;
    }
  }
  return v6;
}

- (void)setStyleNode:(_xmlNode *)a3 forId:(id)a4
{
  id v8 = a4;
  mCache = self->mCache;
  v7 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  [(NSMutableDictionary *)mCache setObject:v7 forKey:v8];
}

- (void)setStylesPart:(id)a3
{
}

- (id)defaultStyleId
{
  return self->mDefaultStyleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCache, 0);
  objc_storeStrong((id *)&self->mDefaultStyleId, 0);
  objc_storeStrong((id *)&self->mStylesPart, 0);
}

@end