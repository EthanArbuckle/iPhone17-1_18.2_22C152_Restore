@interface _CADeveloperHUDProperties
+ (id)instance;
- (BOOL)addGraph:(id)a3 after:(id)a4 min:(double)a5 max:(double)a6;
- (BOOL)addLabel:(id)a3 after:(id)a4;
- (BOOL)addStatistic:(id)a3 after:(id)a4 color:(unsigned int)a5 tolerance:(double)a6 graph:(id)a7;
- (BOOL)enabled;
- (BOOL)loggingEnabled;
- (CGPoint)position;
- (CGSize)size;
- (NSMutableArray)rows;
- (NSMutableDictionary)map;
- (_CADeveloperHUDProperties)init;
- (const)UTF8StringForName:(id)a3;
- (double)incrementStatistic:(id)a3 value:(double)a4;
- (double)scale;
- (id)elements;
- (unint64_t)alignment;
- (unint64_t)frameNumber;
- (unsigned)layout;
- (void)remove:(id)a3;
- (void)setAlignment:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrameNumber:(unint64_t)a3;
- (void)setLayout:(unsigned int)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setMap:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRows:(id)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setStatistic:(id)a3 value:(double)a4;
- (void)updateLabel:(id)a3 value:(id)a4;
@end

@implementation _CADeveloperHUDProperties

+ (id)instance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37___CADeveloperHUDProperties_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_CADeveloperHUDProperties instance]::dispatcher != -1) {
    dispatch_once(&+[_CADeveloperHUDProperties instance]::dispatcher, block);
  }
  v2 = (void *)+[_CADeveloperHUDProperties instance]::sharedInstance;

  return v2;
}

- (_CADeveloperHUDProperties)init
{
  v29[7] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)_CADeveloperHUDProperties;
  v2 = [(_CADeveloperHUDProperties *)&v26 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263EFF980];
    v4 = [[_HUDLabel alloc] initWithName:@"com.apple.hud-label.gpu-and-resolution"];
    v29[0] = v4;
    v5 = [[_HUDLabel alloc] initWithName:@"com.apple.hud-label.compositing-and-refresh-rate"];
    v29[1] = v5;
    v6 = [[_HUDStatistic alloc] initWithName:@"com.apple.hud-stat.fps" color:0xFFFFFFFFLL tolerance:@"com.apple.hud-graph.default" graph:0.100000001];
    v29[2] = v6;
    v7 = [[_HUDStatistic alloc] initWithName:@"com.apple.hud-stat.present-interval" color:4294612749 tolerance:@"com.apple.hud-graph.default" graph:0.100000001];
    v29[3] = v7;
    v8 = [[_HUDStatistic alloc] initWithName:@"com.apple.hud-stat.gpu-time" color:4282503769 tolerance:@"com.apple.hud-graph.default" graph:0.100000001];
    v29[4] = v8;
    v9 = [[_HUDLabel alloc] initWithName:@"com.apple.hud-label.memory"];
    v29[5] = v9;
    v10 = [[_HUDGraph alloc] initWithName:@"com.apple.hud-graph.default" min:5.0 max:45.0];
    v29[6] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:7];
    uint64_t v12 = [v3 arrayWithArray:v11];
    rows = v2->_rows;
    v2->_rows = (NSMutableArray *)v12;

    v14 = (void *)MEMORY[0x263EFF9A0];
    v27[0] = @"com.apple.hud-label.gpu-and-resolution";
    v15 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:0];
    v28[0] = v15;
    v27[1] = @"com.apple.hud-label.compositing-and-refresh-rate";
    v16 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:1];
    v28[1] = v16;
    v27[2] = @"com.apple.hud-stat.fps";
    v17 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:2];
    v28[2] = v17;
    v27[3] = @"com.apple.hud-stat.present-interval";
    v18 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:3];
    v28[3] = v18;
    v27[4] = @"com.apple.hud-stat.gpu-time";
    v19 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:4];
    v28[4] = v19;
    v27[5] = @"com.apple.hud-label.memory";
    v20 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:5];
    v28[5] = v20;
    v27[6] = @"com.apple.hud-graph.default";
    v21 = [(NSMutableArray *)v2->_rows objectAtIndexedSubscript:6];
    v28[6] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:7];
    uint64_t v23 = [v14 dictionaryWithDictionary:v22];
    map = v2->_map;
    v2->_map = (NSMutableDictionary *)v23;
  }
  return v2;
}

- (id)elements
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:-[NSMutableArray count](self->_rows, "count")];
  rows = self->_rows;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37___CADeveloperHUDProperties_elements__block_invoke;
  v7[3] = &unk_264C04178;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)rows enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)remove:(id)a3
{
  id v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v11)
  {
    id v5 = -[NSMutableDictionary objectForKeyedSubscript:](v4->_map, "objectForKeyedSubscript:");
    if (v5)
    {
      [(NSMutableArray *)v4->_rows removeObjectIdenticalTo:v5];
      [(NSMutableDictionary *)v4->_map setObject:0 forKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = [v5 graph];

        if (v6)
        {
          map = v4->_map;
          id v8 = [v5 graph];
          v9 = [(NSMutableDictionary *)map objectForKeyedSubscript:v8];

          if (v9)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v10 = [v9 statistics];
              [v10 removeObject:v5];
            }
          }
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  objc_sync_exit(v4);
}

- (const)UTF8StringForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_map objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 value];
    v6 = (const char *)[v5 UTF8String];
  }
  else
  {
    v6 = "";
  }

  return v6;
}

- (BOOL)addLabel:(id)a3 after:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  v9 = [(NSMutableDictionary *)v8->_map objectForKeyedSubscript:v6];

  if (v9) {
    goto LABEL_2;
  }
  if (v7)
  {
    id v11 = [(NSMutableDictionary *)v8->_map objectForKeyedSubscript:v7];
    if (!v11)
    {
LABEL_2:
      int v10 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = [[_HUDLabel alloc] initWithName:v6];
  if (v12)
  {
    [(NSMutableDictionary *)v8->_map setObject:v12 forKeyedSubscript:v6];
    rows = v8->_rows;
    if (v11) {
      uint64_t v14 = [(NSMutableArray *)v8->_rows indexOfObject:v11] + 1;
    }
    else {
      uint64_t v14 = 0;
    }
    [(NSMutableArray *)rows insertObject:v12 atIndex:v14];
    int v10 = 0;
  }
  else
  {
    int v10 = 1;
  }

LABEL_14:
  objc_sync_exit(v8);

  if (v10) {
    BOOL v15 = v9 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  BOOL v16 = !v15;

  return v16;
}

- (void)updateLabel:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = (__CFString *)a4;
  if (v10)
  {
    id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:");
    id v8 = v7;
    if (v7)
    {
      if (v6) {
        v9 = v6;
      }
      else {
        v9 = &stru_26E7C2008;
      }
      [v7 setValue:v9];
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (BOOL)addStatistic:(id)a3 after:(id)a4 color:(unsigned int)a5 tolerance:(double)a6 graph:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  BOOL v15 = self;
  objc_sync_enter(v15);
  if (v13)
  {
    BOOL v16 = [(NSMutableDictionary *)v15->_map objectForKeyedSubscript:v13];
    if (!v16)
    {
      int v17 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  v18 = [[_HUDStatistic alloc] initWithName:v12 color:v9 tolerance:v14 graph:a6];
  if (v18)
  {
    [(NSMutableDictionary *)v15->_map setObject:v18 forKeyedSubscript:v12];
    [(NSMutableArray *)v15->_rows insertObject:v18 atIndex:[(NSMutableArray *)v15->_rows indexOfObject:v16]];
    v19 = [(NSMutableDictionary *)v15->_map objectForKeyedSubscript:v14];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [v19 statistics];
        [v20 insertObject:v18 atIndex:[v20 count]];
      }
    }

    int v17 = 0;
  }
  else
  {
    int v17 = 1;
  }

LABEL_12:
  objc_sync_exit(v15);

  return v17 == 0;
}

- (void)setStatistic:(id)a3 value:(double)a4
{
  id v6 = a3;
  id v9 = v6;
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_map objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7) {
      [v7 setStatistic:self->_frameNumber forFrame:a4];
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (double)incrementStatistic:(id)a3 value:(double)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_map objectForKeyedSubscript:v6];
    id v9 = v8;
    if (v8)
    {
      [v8 incrementStatistic:self->_frameNumber forFrame:a4];
      double v7 = v10;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v7;
}

- (BOOL)addGraph:(id)a3 after:(id)a4 min:(double)a5 max:(double)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  objc_sync_enter(v12);
  v24 = v11;
  obj = v12;
  if (v11)
  {
    v25 = [(NSMutableDictionary *)v12->_map objectForKeyedSubscript:v11];
    if (!v25)
    {
      int v13 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    v25 = 0;
  }
  id v14 = [[_HUDGraph alloc] initWithName:v10 min:a5 max:a6];
  if (v14)
  {
    [(NSMutableDictionary *)v12->_map setObject:v14 forKeyedSubscript:v10];
    [(NSMutableArray *)v12->_rows insertObject:v14 atIndex:[(NSMutableArray *)v12->_rows indexOfObject:v25]];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v15 = v12->_rows;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = [v19 name];
            int v21 = [v20 isEqualToString:v10];

            if (v21)
            {
              v22 = [(_HUDGraph *)v14 statistics];
              [v22 addObject:v19];
            }
          }
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v16);
    }

    int v13 = 0;
  }
  else
  {
    int v13 = 1;
  }

LABEL_19:
  objc_sync_exit(obj);

  return v13 == 0;
}

- (unint64_t)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(unint64_t)a3
{
  self->_frameNumber = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unsigned)layout
{
  return self->_layout;
}

- (void)setLayout:(unsigned int)a3
{
  self->_layout = a3;
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);

  objc_storeStrong((id *)&self->_map, 0);
}

@end