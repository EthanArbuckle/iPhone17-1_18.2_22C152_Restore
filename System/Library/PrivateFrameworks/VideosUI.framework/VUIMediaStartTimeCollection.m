@interface VUIMediaStartTimeCollection
+ (void)initialize;
- (NSMutableArray)startTimeInfos;
- (VUIMediaStartTimeInfo)preferredStartTimeInfo;
- (void)addStartTimeInfo:(id)a3;
- (void)removeAllStartTimeInfos;
- (void)setStartTimeInfos:(id)a3;
@end

@implementation VUIMediaStartTimeCollection

+ (void)initialize
{
  if (initialize_onceToken_6 != -1) {
    dispatch_once(&initialize_onceToken_6, &__block_literal_global_87);
  }
}

void __41__VUIMediaStartTimeCollection_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIMediaStartTimeCollection");
  v1 = (void *)sLogObject_12;
  sLogObject_12 = (uint64_t)v0;
}

- (void)addStartTimeInfo:(id)a3
{
  id v5 = a3;
  id v4 = [(VUIMediaStartTimeCollection *)self startTimeInfos];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VUIMediaStartTimeCollection *)self setStartTimeInfos:v4];
  }
  if (v5) {
    [v4 addObject:v5];
  }
}

- (void)removeAllStartTimeInfos
{
  id v2 = [(VUIMediaStartTimeCollection *)self startTimeInfos];
  [v2 removeAllObjects];
}

- (VUIMediaStartTimeInfo)preferredStartTimeInfo
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v2 = [(VUIMediaStartTimeCollection *)self startTimeInfos];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_24;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v28 != v6) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (!v5)
      {
        id v5 = v8;
        continue;
      }
      uint64_t v9 = [(VUIMediaStartTimeInfo *)v5 timestamp];
      uint64_t v10 = [v8 timestamp];
      v11 = (void *)v10;
      if (v9 && v10)
      {
        v12 = [(id)v10 laterDate:v9];

        if (v12 != v11)
        {
          if (![v11 isEqualToDate:v9]) {
            goto LABEL_19;
          }
LABEL_14:
          uint64_t v13 = [v8 type];
          if (v13 == -[VUIMediaStartTimeInfo type](v5, "type") || [v8 type] != 1) {
            goto LABEL_19;
          }
        }
LABEL_18:
        v14 = v8;

        id v5 = v14;
        goto LABEL_19;
      }
      if (!(v9 | v10)) {
        goto LABEL_14;
      }
      if (v10) {
        goto LABEL_18;
      }
LABEL_19:
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v27 objects:v33 count:16];
  }
  while (v4);
LABEL_24:

  v15 = [(VUIMediaStartTimeInfo *)v5 startTime];
  [v15 doubleValue];
  if (v16 != 0.0)
  {

LABEL_30:
    v24 = v5;
    goto LABEL_31;
  }
  uint64_t v17 = [(VUIMediaStartTimeInfo *)v5 type];

  if (v17 != 1) {
    goto LABEL_30;
  }
  v18 = +[VUIFeaturesConfiguration sharedInstance];
  v19 = [v18 nowPlayingConfig];
  int v20 = [v19 convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero];

  if (!v20) {
    goto LABEL_30;
  }
  v21 = [VUIMediaStartTimeInfo alloc];
  v22 = [(VUIMediaStartTimeInfo *)v5 timestamp];
  v23 = [(VUIMediaStartTimeInfo *)v5 source];
  v24 = [(VUIMediaStartTimeInfo *)v21 initWithStartTime:&unk_1F3F3D118 timestamp:v22 type:0 source:v23];

  v25 = sLogObject_12;
  if (os_log_type_enabled((os_log_t)sLogObject_12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v24;
    _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "By policy, converting relative start time of 0 to absolute start time of 0: %@", buf, 0xCu);
  }
LABEL_31:
  return v24;
}

- (NSMutableArray)startTimeInfos
{
  return self->_startTimeInfos;
}

- (void)setStartTimeInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end