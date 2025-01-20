@interface PBUIImageSlotRepository
- (BOOL)hasSlotForIdentifier:(id)a3;
- (CGSize)sizeForIdentifier:(id)a3;
- (PBUIImageSlotRepository)initWithWindowScene:(id)a3;
- (id)ioSurfaceForIdentifier:(id)a3;
- (id)urlForIdentifier:(id)a3;
- (int64_t)actualStyleForIdentifier:(id)a3;
- (void)allocateImageSlotForIdentifier:(id)a3 size:(CGSize)a4 actualStyle:(int64_t)a5 url:(id)a6 lifetimeObject:(id)a7;
- (void)freeImageSlotWithIdentifier:(id)a3 lifetime:(id)a4;
- (void)setImageSlot:(id)a3 forIdentifier:(id)a4;
@end

@implementation PBUIImageSlotRepository

- (PBUIImageSlotRepository)initWithWindowScene:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PBUIImageSlotRepository;
  v3 = [(PBUIImageSlotRepository *)&v9 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    lifetimes = v3->_lifetimes;
    v3->_lifetimes = (NSMutableSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    slots = v3->_slots;
    v3->_slots = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)allocateImageSlotForIdentifier:(id)a3 size:(CGSize)a4 actualStyle:(int64_t)a5 url:(id)a6 lifetimeObject:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  lifetimes = self->_lifetimes;
  id v14 = a6;
  id v15 = a3;
  [(NSMutableSet *)lifetimes addObject:a7];
  v16 = objc_alloc_init(_PBUIImageSlotRepositoryEntry);
  [(_PBUIImageSlotRepositoryEntry *)v16 setUrl:v14];

  -[_PBUIImageSlotRepositoryEntry setSize:](v16, "setSize:", width, height);
  [(_PBUIImageSlotRepositoryEntry *)v16 setActualStyle:a5];
  [(NSMutableDictionary *)self->_slots setObject:v16 forKey:v15];
}

- (void)freeImageSlotWithIdentifier:(id)a3 lifetime:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_slots objectForKeyedSubscript:v8];
  if (v7) {
    [(NSMutableDictionary *)self->_slots removeObjectForKey:v8];
  }
  [(NSMutableSet *)self->_lifetimes removeObject:v6];
}

- (void)setImageSlot:(id)a3 forIdentifier:(id)a4
{
  slots = self->_slots;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)slots objectForKeyedSubscript:a4];
  [v7 setImage:v6];
}

- (BOOL)hasSlotForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_slots objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)urlForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_slots objectForKeyedSubscript:a3];
  BOOL v4 = [v3 url];

  return v4;
}

- (CGSize)sizeForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_slots objectForKeyedSubscript:a3];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (int64_t)actualStyleForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_slots objectForKeyedSubscript:a3];
  int64_t v4 = [v3 actualStyle];

  return v4;
}

- (id)ioSurfaceForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_slots objectForKeyedSubscript:a3];
  int64_t v4 = [v3 ioSurface];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_lifetimes, 0);
}

@end