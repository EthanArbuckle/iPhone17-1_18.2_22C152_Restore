@interface UISwipeActionVisualStyleProvider
+ (id)idiomToVisualStyleClassMap;
+ (id)visualStyleForIdiom:(int64_t)a3;
+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4;
@end

@implementation UISwipeActionVisualStyleProvider

+ (id)visualStyleForIdiom:(int64_t)a3
{
  v4 = +[UISwipeActionVisualStyleProvider idiomToVisualStyleClassMap]();
  v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKey:v5];

  if (!v6) {
    objc_opt_class();
  }
  v7 = objc_opt_new();
  return v7;
}

+ (id)idiomToVisualStyleClassMap
{
  self;
  if (_MergedGlobals_1012 != -1) {
    dispatch_once(&_MergedGlobals_1012, &__block_literal_global_144);
  }
  v0 = (void *)qword_1EB260180;
  return v0;
}

void __62__UISwipeActionVisualStyleProvider_idiomToVisualStyleClassMap__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = &unk_1ED3F3AB0;
  v4[0] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)qword_1EB260180;
  qword_1EB260180 = v1;
}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1ED51D5D0] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = NSStringFromClass(a3);
    [v9 handleFailureInMethod:a2, a1, @"UISwipeActionVisualStyle.m", 134, @"visualStyle of type %@ does not conform to UISwipeActionVisualStyle.", v10 object file lineNumber description];
  }
  +[UISwipeActionVisualStyleProvider idiomToVisualStyleClassMap]();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [NSNumber numberWithInteger:a4];
  [v11 setObject:a3 forKey:v8];
}

@end