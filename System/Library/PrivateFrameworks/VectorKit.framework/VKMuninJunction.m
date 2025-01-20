@interface VKMuninJunction
- (NSArray)roads;
- (NSString)name;
- (VKMuninJunction)initWithMuninJunction:(const void *)a3 localize:(BOOL)a4;
- (id)description;
@end

@implementation VKMuninJunction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_roads, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)roads
{
  return &self->_roads->super;
}

- (id)description
{
  name = self->_name;
  if (name) {
    [NSString stringWithFormat:@"%@\n", name];
  }
  else {
  v3 = [NSString stringWithFormat:@"%@\n", self->_roads];
  }
  return v3;
}

- (VKMuninJunction)initWithMuninJunction:(const void *)a3 localize:(BOOL)a4
{
  BOOL v4 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VKMuninJunction;
  v6 = [(VKMuninJunction *)&v31 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    roads = v6->_roads;
    v6->_roads = v7;

    v9 = (uint64_t ***)*((void *)a3 + 5);
    for (i = (uint64_t ***)*((void *)a3 + 6); v9 != i; ++v9)
    {
      md::MuninRoadEdge::localizedName((md::MuninRoadEdge *)&v34, *v9, v4);
      uint64_t v11 = HIBYTE(v36);
      char v12 = HIBYTE(v36);
      if (v36 < 0) {
        uint64_t v11 = v35;
      }
      if (v11)
      {
        v13 = [VKMuninRoad alloc];
        if (v36 >= 0) {
          v14 = &v34;
        }
        else {
          v14 = v34;
        }
        v15 = [(VKMuninRoad *)v13 initWithLocalizedName:v14];
        if (([(NSMutableArray *)v6->_roads containsObject:v15] & 1) == 0) {
          [(NSMutableArray *)v6->_roads addObject:v15];
        }

        char v12 = HIBYTE(v36);
      }
      if (v12 < 0) {
        (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v37 + 40))(v37, v34, v36 & 0x7FFFFFFFFFFFFFFFLL);
      }
    }
    name = v6->_name;
    v6->_name = 0;

    long long v28 = 0uLL;
    uint64_t v29 = 0;
    {
      operator new();
    }
    uint64_t v30 = mdm::Allocator::instance(void)::alloc;
    uint64_t v17 = *((void *)a3 + 1);
    if (v17 && *(void *)(v17 + 8))
    {
      v34 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      {
        operator new();
      }
      uint64_t v37 = mdm::Allocator::instance(void)::alloc;
      uint64_t v18 = *((void *)a3 + 1);
      if (v18) {
        v19 = *(uint64_t **)(v18 + 8);
      }
      else {
        v19 = 0;
      }
      md::LabelFeature::textFromFeature((unint64_t)&v32, v19, v4, (uint64_t)&v34, 0);
      long long v28 = v32;
      uint64_t v29 = v33;
      if (SHIBYTE(v36) < 0) {
        (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v37 + 40))(v37, v34, v36 & 0x7FFFFFFFFFFFFFFFLL);
      }
    }
    uint64_t v20 = HIBYTE(v29);
    char v21 = HIBYTE(v29);
    if (v29 < 0) {
      uint64_t v20 = *((void *)&v28 + 1);
    }
    if (v20)
    {
      id v22 = [NSString alloc];
      if (v29 >= 0) {
        v23 = &v28;
      }
      else {
        v23 = (long long *)v28;
      }
      uint64_t v24 = objc_msgSend(v22, "initWithUTF8String:", v23, (void)v28);
      v25 = v6->_name;
      v6->_name = (NSString *)v24;

      char v21 = HIBYTE(v29);
    }
    v26 = v6;
    if (v21 < 0) {
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)v30 + 40))(v30, v28, v29 & 0x7FFFFFFFFFFFFFFFLL);
    }
  }

  return v6;
}

@end