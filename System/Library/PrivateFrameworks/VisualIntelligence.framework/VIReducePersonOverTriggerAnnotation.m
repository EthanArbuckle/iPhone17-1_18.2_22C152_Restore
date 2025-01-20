@interface VIReducePersonOverTriggerAnnotation
- (BOOL)isEqual:(id)a3;
- (NSArray)regions;
- (VIReducePersonOverTriggerAnnotation)initWithRegionsItems:(id)a3;
@end

@implementation VIReducePersonOverTriggerAnnotation

- (VIReducePersonOverTriggerAnnotation)initWithRegionsItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIReducePersonOverTriggerAnnotation;
  v5 = [(VIReducePersonOverTriggerAnnotation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    regions = v5->_regions;
    v5->_regions = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  regions = self->_regions;
  v13 = objc_msgSend(v11, "regions", v6, v15, v4, v16, v7, v8);
  LOBYTE(regions) = VIObjectIsEqual((unint64_t)regions, (uint64_t)v13);

  return (char)regions;
}

- (NSArray)regions
{
  return self->_regions;
}

- (void).cxx_destruct
{
}

@end