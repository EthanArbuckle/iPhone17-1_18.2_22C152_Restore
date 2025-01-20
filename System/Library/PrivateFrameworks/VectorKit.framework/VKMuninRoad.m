@interface VKMuninRoad
- (BOOL)isEqual:(id)a3;
- (NSString)roadName;
- (VKMuninRoad)initWithLocalizedName:(const char *)a3;
- (VKMuninRoad)initWithMuninRoadEdge:(const void *)a3 localize:(BOOL)a4;
- (id)description;
@end

@implementation VKMuninRoad

- (void).cxx_destruct
{
}

- (NSString)roadName
{
  return self->_roadName;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VKMuninRoad *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = [(VKMuninRoad *)v4 roadName];
      char v6 = [v7 isEqualToString:self->_roadName];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@\n", self->_roadName];
}

- (VKMuninRoad)initWithLocalizedName:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKMuninRoad;
  v4 = [(VKMuninRoad *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [[NSString alloc] initWithUTF8String:a3];
    roadName = v4->_roadName;
    v4->_roadName = (NSString *)v5;

    v7 = v4;
  }

  return v4;
}

- (VKMuninRoad)initWithMuninRoadEdge:(const void *)a3 localize:(BOOL)a4
{
  md::MuninRoadEdge::localizedName((md::MuninRoadEdge *)v8, (uint64_t **)a3, a4);
  if (v9 >= 0) {
    uint64_t v5 = v8;
  }
  else {
    uint64_t v5 = (void *)v8[0];
  }
  char v6 = [(VKMuninRoad *)self initWithLocalizedName:v5];
  if (SHIBYTE(v9) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v10 + 40))(v10, v8[0], v9 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return v6;
}

@end