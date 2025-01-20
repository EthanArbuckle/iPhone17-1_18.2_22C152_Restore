@interface Ace3UpdateController
- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5;
@end

@implementation Ace3UpdateController

- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  v9 = [(UARPSoCUpdaterInstance *)[Ace3UpdaterInstance alloc] initWithLogicUnitNumber:v6 helper:v8 options:v7];

  return v9;
}

@end