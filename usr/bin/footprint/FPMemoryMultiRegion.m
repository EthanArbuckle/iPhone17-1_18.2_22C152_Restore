@interface FPMemoryMultiRegion
- (NSString)auxDataName;
- (id)auxData;
- (unint64_t)regionSize;
- (unsigned)totalRegions;
- (void)setAuxDataName:(id)a3;
- (void)setRegionSize:(unint64_t)a3;
- (void)setTotalRegions:(unsigned int)a3;
@end

@implementation FPMemoryMultiRegion

- (id)auxData
{
  CFStringRef v5 = @"element_size";
  v2 = [[FPAuxData alloc] initWithValue:self->_regionSize shouldAggregate:0];
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (NSString)auxDataName
{
  auxDataName = self->_auxDataName;
  if (auxDataName)
  {
    v3 = auxDataName;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)FPMemoryMultiRegion;
    v3 = [(FPMemoryRegion *)&v5 auxDataName];
  }

  return v3;
}

- (void)setAuxDataName:(id)a3
{
}

- (unsigned)totalRegions
{
  return self->_totalRegions;
}

- (void)setTotalRegions:(unsigned int)a3
{
  self->_totalRegions = a3;
}

- (unint64_t)regionSize
{
  return self->_regionSize;
}

- (void)setRegionSize:(unint64_t)a3
{
  self->_regionSize = a3;
}

- (void).cxx_destruct
{
}

@end