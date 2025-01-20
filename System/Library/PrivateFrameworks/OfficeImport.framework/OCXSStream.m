@interface OCXSStream
- (BOOL)hasLevels;
- (BOOL)popLevel;
- (OCXSStream)init;
- (int)currentContextChildDepth;
- (int)currentContextDepth;
- (void)pushLevel:(int)a3 name:(const char *)a4;
@end

@implementation OCXSStream

- (OCXSStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)OCXSStream;
  v2 = [(OCXSStream *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    mLevelStack = v2->mLevelStack;
    v2->mLevelStack = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)pushLevel:(int)a3 name:(const char *)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = objc_alloc_init(OCXSStreamLevel);
  [(OCXSStreamLevel *)v7 setName:a4];
  [(OCXSStreamLevel *)v7 setDepth:v5];
  [(NSMutableArray *)self->mLevelStack addObject:v7];
}

- (BOOL)hasLevels
{
  return [(NSMutableArray *)self->mLevelStack count] != 0;
}

- (int)currentContextDepth
{
  uint64_t v3 = [(NSMutableArray *)self->mLevelStack lastObject];
  v4 = v3;
  if (v3) {
    int v2 = [v3 depth];
  }

  if (v4) {
    return v2;
  }
  else {
    return -1;
  }
}

- (int)currentContextChildDepth
{
  return [(OCXSStream *)self currentContextDepth] + 1;
}

- (BOOL)popLevel
{
  BOOL v3 = [(OCXSStream *)self hasLevels];
  if (v3) {
    [(NSMutableArray *)self->mLevelStack removeLastObject];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end