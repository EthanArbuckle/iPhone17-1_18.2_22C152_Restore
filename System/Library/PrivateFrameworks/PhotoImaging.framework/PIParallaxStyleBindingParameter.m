@interface PIParallaxStyleBindingParameter
- (BOOL)isEqualToParallaxStyleParameter:(id)a3;
- (NSString)variableName;
- (PIParallaxStyleBindingParameter)init;
- (PIParallaxStyleBindingParameter)initWithVariableName:(id)a3;
- (id)description;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
- (id)type;
@end

@implementation PIParallaxStyleBindingParameter

- (void).cxx_destruct
{
}

- (NSString)variableName
{
  return self->_variableName;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PIParallaxStyleBindingParameter *)self variableName];
  v4 = [v2 stringWithFormat:@"($%@)", v3];

  return v4;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v16 = NUAssertLogger_14042();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_14042();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        __int16 v31 = 2114;
        v32 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = [v6 parameters];
  v9 = [(PIParallaxStyleBindingParameter *)self variableName];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [v10 evaluateWithContext:v7 error:a4];
  }
  else
  {
    v12 = NSString;
    v13 = [(PIParallaxStyleBindingParameter *)self variableName];
    v14 = [v12 stringWithFormat:@"Unable to find source for variable bound to '%@'", v13];

    *a4 = [MEMORY[0x1E4F7A438] missingError:v14 object:v7];

    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"binding"];

  if (v6)
  {
    id v7 = v4;
    v8 = [(PIParallaxStyleBindingParameter *)self variableName];
    v9 = [v7 variableName];

    char v10 = [v8 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)type
{
  return @"binding";
}

- (PIParallaxStyleBindingParameter)initWithVariableName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PIParallaxStyleBindingParameter;
  id v3 = a3;
  id v4 = [(PIParallaxStyleBindingParameter *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  variableName = v4->_variableName;
  v4->_variableName = (NSString *)v5;

  return v4;
}

- (PIParallaxStyleBindingParameter)init
{
  return [(PIParallaxStyleBindingParameter *)self initWithVariableName:&stru_1EFFD8610];
}

@end