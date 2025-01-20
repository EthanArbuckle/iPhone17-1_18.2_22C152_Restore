@interface OADColorScheme
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (OADColorScheme)init;
- (id)colorForIndex:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)colorCount;
- (unint64_t)hash;
- (void)addColor:(id)a3 index:(int)a4;
- (void)setColor:(id)a3 index:(int)a4;
- (void)setName:(id)a3;
- (void)validateColorScheme;
@end

@implementation OADColorScheme

- (OADColorScheme)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADColorScheme;
  v2 = [(OADColorScheme *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mColors = v2->mColors;
    v2->mColors = v3;
  }
  return v2;
}

- (void)addColor:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  objc_super v6 = (void *)[objc_alloc(NSNumber) initWithInt:v4];
  [(NSMutableDictionary *)self->mColors setObject:v7 forKey:v6];
}

- (id)colorForIndex:(int)a3
{
  uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)self->mColors objectForKey:v4];

  return v5;
}

- (unint64_t)colorCount
{
  return [(NSMutableDictionary *)self->mColors count];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(OADColorScheme);
  [(NSMutableDictionary *)v4->mColors setDictionary:self->mColors];
  return v4;
}

- (void)setColor:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  mColors = self->mColors;
  id v7 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)mColors setObject:v8 forKey:v7];
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->mColors count] == 0;
}

- (void)validateColorScheme
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = (id *)objc_opt_new();
  id v4 = +[TCXmlUtilities bundlePathForXmlResource:@"DefaultColorScheme"];
  v5 = (xmlDoc *)sfaxmlParseFile([v4 fileSystemRepresentation]);
  xmlNodePtr v6 = OCXGetRootElement(v5);
  if (v6)
  {
    +[OAXColorScheme readFromXmlNode:v6 toColorScheme:v3];
    xmlFreeDoc(v5);
    id v7 = [(OADColorScheme *)self name];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      v9 = [v3 name];
      [(OADColorScheme *)self setName:v9];
    }
    id v10 = v3[2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->mColors, "objectForKeyedSubscript:", v15, (void)v19);
          BOOL v17 = v16 == 0;

          if (v17)
          {
            v18 = [v11 objectForKeyedSubscript:v15];
            [(NSMutableDictionary *)self->mColors setObject:v18 forKeyedSubscript:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    char v5 = [(NSMutableDictionary *)self->mColors isEqualToDictionary:v4[2]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->mName hash];
  return [(NSMutableDictionary *)self->mColors count] + (v3 << 8);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADColorScheme;
  v2 = [(OADColorScheme *)&v4 description];
  return v2;
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColors, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end