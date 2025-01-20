@interface VKARWalkingFeature
- (BOOL)isEqual:(id)a3;
- (VKARWalkingFeature)initWithType:(int64_t)a3;
- (VKARWalkingFeature)initWithType:(int64_t)a3 intraFeaturePriority:(unint64_t)a4;
- (int64_t)type;
- (unint64_t)intraFeaturePriority;
@end

@implementation VKARWalkingFeature

- (unint64_t)intraFeaturePriority
{
  return self->_intraFeaturePriority;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VKARWalkingFeature *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      int64_t type = self->_type;
      if (type == [(VKARWalkingFeature *)v7 type])
      {
        unint64_t intraFeaturePriority = self->_intraFeaturePriority;
        BOOL v6 = intraFeaturePriority == [(VKARWalkingFeature *)v7 intraFeaturePriority];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (VKARWalkingFeature)initWithType:(int64_t)a3 intraFeaturePriority:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VKARWalkingFeature;
  BOOL v6 = [(VKARWalkingFeature *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_int64_t type = a3;
    v6->_unint64_t intraFeaturePriority = a4;
    v8 = v6;
  }

  return v7;
}

- (VKARWalkingFeature)initWithType:(int64_t)a3
{
  return [(VKARWalkingFeature *)self initWithType:a3 intraFeaturePriority:-1];
}

@end