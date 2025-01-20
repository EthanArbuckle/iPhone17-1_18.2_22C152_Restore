@interface SidecarMapTable
- (SidecarMapTable)initWithKeyMask:(int64_t)a3 weakObjects:(BOOL)a4;
@end

@implementation SidecarMapTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values2keys, 0);

  objc_storeStrong((id *)&self->_keys2values, 0);
}

- (SidecarMapTable)initWithKeyMask:(int64_t)a3 weakObjects:(BOOL)a4
{
  BOOL v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SidecarMapTable;
  v6 = [(SidecarMapTable *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_keyMask = a3;
    if (v4)
    {
      uint64_t v8 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      keys2values = v7->_keys2values;
      v7->_keys2values = (NSMapTable *)v8;

      [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v12 = v7->_keys2values;
      v7->_keys2values = (NSMapTable *)v11;

      [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    uint64_t v10 = };
    values2keys = v7->_values2keys;
    v7->_values2keys = (NSMapTable *)v10;
  }
  return v7;
}

@end