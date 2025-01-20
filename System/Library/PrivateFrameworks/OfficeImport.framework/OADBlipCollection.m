@interface OADBlipCollection
- (NSMutableArray)blips;
- (OADBlipCollection)init;
- (id)blipAtIndex:(int)a3;
- (unsigned)addBlip:(id)a3;
- (unsigned)blipCount;
- (void)setBlips:(id)a3;
@end

@implementation OADBlipCollection

- (OADBlipCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADBlipCollection;
  v2 = [(OADBlipCollection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mBlips = v2->mBlips;
    v2->mBlips = v3;
  }
  return v2;
}

- (unsigned)addBlip:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->mBlips addObject:v4];
  LODWORD(self) = [(NSMutableArray *)self->mBlips count];

  return self;
}

- (id)blipAtIndex:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (a3 >= 1 && (int)[(NSMutableArray *)self->mBlips count] >= a3)
  {
    v5 = [(NSMutableArray *)self->mBlips objectAtIndex:v3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSMutableArray)blips
{
  return self->mBlips;
}

- (unsigned)blipCount
{
  return [(NSMutableArray *)self->mBlips count];
}

- (void)setBlips:(id)a3
{
}

- (void).cxx_destruct
{
}

@end