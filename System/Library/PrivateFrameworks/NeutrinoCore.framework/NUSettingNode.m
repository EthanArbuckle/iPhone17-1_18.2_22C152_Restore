@interface NUSettingNode
- (NUSettingNode)initWithSetting:(id)a3;
- (id)childNodeAtIndex:(unint64_t)a3;
- (id)childNodeForKey:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (id)valueForKey:(id)a3;
@end

@implementation NUSettingNode

- (id)valueAtIndex:(unint64_t)a3
{
  v5 = [(NUSettingNode *)self setting];
  uint64_t v6 = [v5 type];

  if (v6 == 5)
  {
    v7 = [(NUControlNode *)self value];
    v8 = [v7 objectAtIndexedSubscript:a3];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NUSettingNode *)self setting];
  uint64_t v6 = [v5 type];

  if (v6 == 4)
  {
    v7 = [(NUControlNode *)self value];
    v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)childNodeAtIndex:(unint64_t)a3
{
  v5 = [(NUSettingNode *)self setting];
  uint64_t v6 = [v5 type];

  if (v6 == 5)
  {
    v7 = [(NUSettingNode *)self setting];
    v8 = [v7 content];

    v9 = [[NUSettingNode alloc] initWithSetting:v8];
  }
  else
  {
    v9 = 0;
  }
  [(NUControlNode *)v9 setParentNode:self];
  [(NUControlNode *)v9 setChildIndex:a3];

  return v9;
}

- (id)childNodeForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NUSettingNode *)self setting];
  uint64_t v6 = [v5 type];

  if (v6 == 4)
  {
    v7 = [(NUSettingNode *)self setting];
    v8 = [v7 properties];
    v9 = [v8 objectForKeyedSubscript:v4];

    if (v9) {
      v10 = [[NUSettingNode alloc] initWithSetting:v9];
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  [(NUControlNode *)v10 setParentNode:self];
  [(NUControlNode *)v10 setChildKey:v4];

  return v10;
}

- (NUSettingNode)initWithSetting:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v8 = NUAssertLogger_5149();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "setting != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_5149();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        __int16 v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSettingNode initWithSetting:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1039, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"setting != nil");
  }
  v5 = v4;
  v24.receiver = self;
  v24.super_class = (Class)NUSettingNode;
  uint64_t v6 = [(NUControlNode *)&v24 initWithModel:v4];

  return v6;
}

@end