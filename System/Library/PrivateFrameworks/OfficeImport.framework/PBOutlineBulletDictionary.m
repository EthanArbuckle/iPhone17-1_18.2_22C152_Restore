@interface PBOutlineBulletDictionary
- (id)initFromContainer:(id)a3 objectType:(unsigned int)a4;
- (id)objectForSlideId:(unsigned int)a3 textType:(int)a4 placeholderIndex:(unsigned int)a5;
@end

@implementation PBOutlineBulletDictionary

- (id)initFromContainer:(id)a3 objectType:(unsigned int)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PBOutlineBulletDictionary;
  v7 = [(PBOutlineBulletDictionary *)&v18 init];
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mDictionary = v7->mDictionary;
    v7->mDictionary = v8;

    unint64_t v10 = [v6 childCount];
    if (v10 >= 2)
    {
      unint64_t v11 = 1;
      do
      {
        v12 = [v6 childAt:v11 - 1];
        v13 = [v6 childAt:v11];
        uint64_t v14 = [v12 eshObject];
        if ((*(unsigned int (**)(uint64_t))(*(void *)v14 + 16))(v14) == 4015)
        {
          uint64_t v15 = [v13 eshObject];
          if ((*(unsigned int (**)(uint64_t))(*(void *)v15 + 16))(v15) == a4)
          {
            v16 = [[PBOutlineBulletKey alloc] initWithOutlineBullet:v12];
            if (v16) {
              [(NSMutableDictionary *)v7->mDictionary setObject:v13 forKey:v16];
            }
          }
        }

        v11 += 2;
      }
      while (v11 < v10);
    }
  }

  return v7;
}

- (id)objectForSlideId:(unsigned int)a3 textType:(int)a4 placeholderIndex:(unsigned int)a5
{
  id v6 = [[PBOutlineBulletKey alloc] initWithSlideId:*(void *)&a3 textType:*(void *)&a4 placeholderIndex:*(void *)&a5];
  v7 = [(NSMutableDictionary *)self->mDictionary objectForKey:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end