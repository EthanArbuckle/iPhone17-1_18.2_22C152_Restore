@interface OADColorMap
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (OADColorMap)init;
- (id)description;
- (int)mappingForIndex:(int)a3;
- (unint64_t)hash;
- (void)addDefaultMappings:(BOOL)a3;
- (void)addMapping:(int)a3 index:(int)a4;
@end

@implementation OADColorMap

- (OADColorMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADColorMap;
  v2 = [(OADColorMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mMappings = v2->mMappings;
    v2->mMappings = v3;
  }
  return v2;
}

- (void)addDefaultMappings:(BOOL)a3
{
  BOOL v4 = !a3;
  if (a3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  if (a3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  -[OADColorMap addMapping:index:](self, "addMapping:index:");
  [(OADColorMap *)self addMapping:v4 index:1];
  [(OADColorMap *)self addMapping:v5 index:2];
  [(OADColorMap *)self addMapping:v6 index:3];
  [(OADColorMap *)self addMapping:4 index:4];
  [(OADColorMap *)self addMapping:5 index:5];
  [(OADColorMap *)self addMapping:6 index:6];
  [(OADColorMap *)self addMapping:7 index:7];
  [(OADColorMap *)self addMapping:8 index:8];
  [(OADColorMap *)self addMapping:9 index:9];
  [(OADColorMap *)self addMapping:10 index:10];
  [(OADColorMap *)self addMapping:11 index:11];
}

- (void)addMapping:(int)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  mMappings = self->mMappings;
  id v7 = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v6 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)mMappings setObject:v7 forKey:v6];
}

- (int)mappingForIndex:(int)a3
{
  mMappings = self->mMappings;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v5 = [(NSMutableDictionary *)mMappings objectForKey:v4];

  LODWORD(v4) = [v5 intValue];
  return (int)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    char v5 = [(NSMutableDictionary *)self->mMappings isEqualToDictionary:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->mMappings count];
  v5.receiver = self;
  v5.super_class = (Class)OADColorMap;
  return [(OADColorMap *)&v5 hash] ^ v3;
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->mMappings count] == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADColorMap;
  v2 = [(OADColorMap *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end