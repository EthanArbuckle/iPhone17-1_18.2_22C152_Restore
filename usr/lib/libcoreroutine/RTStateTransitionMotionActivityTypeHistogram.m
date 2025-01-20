@interface RTStateTransitionMotionActivityTypeHistogram
- (NSMutableDictionary)motionActivityTypeBins;
- (RTStateTransitionMotionActivityTypeHistogram)init;
- (unint64_t)getDominantMotionActivityType;
- (void)addMotionActivityType:(unint64_t)a3;
- (void)setMotionActivityTypeBins:(id)a3;
- (void)show;
@end

@implementation RTStateTransitionMotionActivityTypeHistogram

- (RTStateTransitionMotionActivityTypeHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTStateTransitionMotionActivityTypeHistogram;
  v2 = [(RTStateTransitionMotionActivityTypeHistogram *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    motionActivityTypeBins = v2->_motionActivityTypeBins;
    v2->_motionActivityTypeBins = v3;
  }
  return v2;
}

- (void)addMotionActivityType:(unint64_t)a3
{
  id v8 = [NSNumber numberWithInteger:a3];
  v4 = [(RTStateTransitionMotionActivityTypeHistogram *)self motionActivityTypeBins];
  v5 = [v4 objectForKey:v8];

  objc_super v6 = [(RTStateTransitionMotionActivityTypeHistogram *)self motionActivityTypeBins];
  v7 = [NSNumber numberWithInteger:[v5 integerValue] + 1];
  [v6 setObject:v7 forKey:v8];
}

- (unint64_t)getDominantMotionActivityType
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v2 = [(RTStateTransitionMotionActivityTypeHistogram *)self motionActivityTypeBins];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__RTStateTransitionMotionActivityTypeHistogram_getDominantMotionActivityType__block_invoke;
  v9[3] = &unk_1E6B9A058;
  v9[4] = v10;
  v9[5] = &v15;
  v9[6] = &v11;
  [v2 enumerateKeysAndObjectsUsingBlock:v9];

  if (*((unsigned char *)v12 + 24))
  {
    v16[3] = 0;
    v3 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_super v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:v16[3]];
      *(_DWORD *)buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%@ detected multimodal distribution, defaulting dominant motionActivityType to %@", buf, 0x16u);
    }
  }
  unint64_t v4 = v16[3];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v4;
}

void __77__RTStateTransitionMotionActivityTypeHistogram_getDominantMotionActivityType__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  if (v6 >= 2)
  {
    uint64_t v8 = *(void *)(*(void *)(a1[4] + 8) + 24);
    if (v7 <= v8)
    {
      if (v7 != v8) {
        return;
      }
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
      *(void *)(*(void *)(a1[5] + 8) + 24) = v6;
      *(void *)(*(void *)(a1[4] + 8) + 24) = v7;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
  }
}

- (void)show
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v3 = [(RTStateTransitionMotionActivityTypeHistogram *)self motionActivityTypeBins];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v5 = [(RTStateTransitionMotionActivityTypeHistogram *)self motionActivityTypeBins];
      [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_87];
    }
  }
}

void __52__RTStateTransitionMotionActivityTypeHistogram_show__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = [v4 integerValue];

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:v5];
    int v9 = 138412546;
    v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "motionActivityType, %@, frequency, %lu", (uint8_t *)&v9, 0x16u);
  }
}

- (NSMutableDictionary)motionActivityTypeBins
{
  return self->_motionActivityTypeBins;
}

- (void)setMotionActivityTypeBins:(id)a3
{
}

- (void).cxx_destruct
{
}

@end