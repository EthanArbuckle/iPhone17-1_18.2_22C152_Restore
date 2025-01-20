@interface PXGMutableComponentDataStore
- (void)mutableContents;
- (void)setContentsFrom:(id)a3;
@end

@implementation PXGMutableComponentDataStore

- (void)setContentsFrom:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(PXGComponentDataStore *)self elementSize];
  if (v6 != [v5 elementSize])
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGComponentDataStore.m", 92, @"Invalid parameter not satisfying: %@", @"self.elementSize == dataStore.elementSize" object file lineNumber description];
  }
  -[PXGComponentDataStore setCapacity:](self, "setCapacity:", [v5 capacity]);
  v7 = self;
  v8 = [(PXGMutableComponentDataStore *)v7 mutableContents];
  id v10 = v5;
  memcpy(v8, (const void *)[v10 contents], -[PXGComponentDataStore byteSize](v7, "byteSize"));
}

- (void)mutableContents
{
  v2 = self;

  return (void *)[(PXGComponentDataStore *)v2 contents];
}

@end