@interface VUILocalizationManager
+ (id)sharedInstance;
- (NSDictionary)overideLocDict;
- (id)localizedStringForKey:(id)a3;
- (id)localizedStringForKey:(id)a3 fromTable:(id)a4;
- (id)localizedStringForKey:(id)a3 withCounts:(id)a4;
- (void)setOverideLocDict:(id)a3;
- (void)updateWithJSDictionary:(id)a3;
@end

@implementation VUILocalizationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [(VUILocalizationManager *)self overideLocDict];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    v6 = [v7 localizedStringForKey:v4 value:0 table:0];
  }
  return v6;
}

- (NSDictionary)overideLocDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

void __40__VUILocalizationManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUILocalizationManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (id)localizedStringForKey:(id)a3 fromTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VUILocalizationManager *)self overideLocDict];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    v9 = [v10 localizedStringForKey:v6 value:0 table:v7];
  }
  return v9;
}

- (id)localizedStringForKey:(id)a3 withCounts:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v6 count] >= 0xB)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C4A8];
    v38 = @"collection";
    v39[0] = v6;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v22 = [v19 exceptionWithName:v20 reason:@"Maximum of 10 arguments allowed" userInfo:v21];

    objc_exception_throw(v22);
  }
  [v6 arrayByAddingObjectsFromArray:&unk_1F3F3E168];
  id v7 = v37 = v6;
  v33 = NSString;
  v36 = +[VUILocalizationManager sharedInstance];
  v31 = [v36 localizedStringForKey:v5];
  v35 = [v7 objectAtIndexedSubscript:0];
  uint64_t v30 = [v35 intValue];
  v34 = [v7 objectAtIndexedSubscript:1];
  uint64_t v28 = [v34 intValue];
  v32 = [v7 objectAtIndexedSubscript:2];
  uint64_t v26 = [v32 intValue];
  v29 = [v7 objectAtIndexedSubscript:3];
  uint64_t v24 = [v29 intValue];
  v27 = [v7 objectAtIndexedSubscript:4];
  uint64_t v23 = [v27 intValue];
  v8 = [v7 objectAtIndexedSubscript:5];
  uint64_t v9 = [v8 intValue];
  v10 = [v7 objectAtIndexedSubscript:6];
  uint64_t v11 = [v10 intValue];
  v12 = [v7 objectAtIndexedSubscript:7];
  uint64_t v13 = [v12 intValue];
  v14 = [v7 objectAtIndexedSubscript:8];
  v25 = v5;
  uint64_t v15 = [v14 intValue];
  v16 = [v7 objectAtIndexedSubscript:9];
  v17 = objc_msgSend(v33, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v31, @"%d %d %d %d %d %d %d %d %d %d", 0, v30, v28, v26, v24, v23, v9, v11, v13, v15, objc_msgSend(v16, "intValue"));

  return v17;
}

- (void)updateWithJSDictionary:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VUILocalizationManager *)self setOverideLocDict:v4];
}

- (void)setOverideLocDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end