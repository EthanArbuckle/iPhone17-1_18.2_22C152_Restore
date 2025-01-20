@interface SHAffinityGroup
- (NSArray)mediaItems;
- (NSMutableArray)mutableMediaItems;
- (SHAffinityGroup)init;
- (SHAffinityGroup)initWithType:(int64_t)a3 cohesionLevel:(int64_t)a4;
- (int64_t)cohesionLevel;
- (int64_t)groupType;
- (void)appendMediaItem:(id)a3;
- (void)setMutableMediaItems:(id)a3;
@end

@implementation SHAffinityGroup

- (SHAffinityGroup)init
{
  return [(SHAffinityGroup *)self initWithType:1 cohesionLevel:1];
}

- (SHAffinityGroup)initWithType:(int64_t)a3 cohesionLevel:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SHAffinityGroup;
  v6 = [(SHAffinityGroup *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_groupType = a3;
    v6->_cohesionLevel = a4;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    mutableMediaItems = v7->_mutableMediaItems;
    v7->_mutableMediaItems = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)appendMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SHAffinityGroup *)self mutableMediaItems];
  [v5 addObject:v4];
}

- (NSArray)mediaItems
{
  v2 = [(SHAffinityGroup *)self mutableMediaItems];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (int64_t)cohesionLevel
{
  return self->_cohesionLevel;
}

- (NSMutableArray)mutableMediaItems
{
  return self->_mutableMediaItems;
}

- (void)setMutableMediaItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end