@interface PIParallaxColorAnalysis
+ (id)colorsFromDictionary:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)loadFromContentsDictionary:(id)a3 error:(id *)a4;
+ (int64_t)currentVersion;
- (NSArray)backgroundColors;
- (NSArray)clockAreaColors;
- (NSArray)colors;
- (NSArray)foregroundColors;
- (PIParallaxColorAnalysis)init;
- (double)backgroundLuminance;
- (double)foregroundLuminance;
- (double)luminance;
- (id)contentsDictionary;
- (int64_t)version;
- (void)setBackgroundColors:(id)a3;
- (void)setBackgroundLuminance:(double)a3;
- (void)setClockAreaColors:(id)a3;
- (void)setColors:(id)a3;
- (void)setForegroundColors:(id)a3;
- (void)setForegroundLuminance:(double)a3;
- (void)setLuminance:(double)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PIParallaxColorAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockAreaColors, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
  objc_storeStrong((id *)&self->_foregroundColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

- (void)setClockAreaColors:(id)a3
{
}

- (NSArray)clockAreaColors
{
  return self->_clockAreaColors;
}

- (void)setBackgroundColors:(id)a3
{
}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (void)setForegroundColors:(id)a3
{
}

- (NSArray)foregroundColors
{
  return self->_foregroundColors;
}

- (void)setColors:(id)a3
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setBackgroundLuminance:(double)a3
{
  self->_backgroundLuminance = a3;
}

- (double)backgroundLuminance
{
  return self->_backgroundLuminance;
}

- (void)setForegroundLuminance:(double)a3
{
  self->_foregroundLuminance = a3;
}

- (double)foregroundLuminance
{
  return self->_foregroundLuminance;
}

- (void)setLuminance:(double)a3
{
  self->_luminance = a3;
}

- (double)luminance
{
  return self->_luminance;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (id)contentsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PIParallaxColorAnalysis version](self, "version"));
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  v5 = NSNumber;
  [(PIParallaxColorAnalysis *)self luminance];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"luminance"];

  v7 = NSNumber;
  [(PIParallaxColorAnalysis *)self foregroundLuminance];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"foregroundLuminance"];

  v9 = NSNumber;
  [(PIParallaxColorAnalysis *)self backgroundLuminance];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"backgroundLuminance"];

  v11 = [(PIParallaxColorAnalysis *)self colors];
  v12 = PFMap();
  [v3 setObject:v12 forKeyedSubscript:@"colors"];

  v13 = [(PIParallaxColorAnalysis *)self foregroundColors];
  v14 = PFMap();
  [v3 setObject:v14 forKeyedSubscript:@"foregroundColors"];

  v15 = [(PIParallaxColorAnalysis *)self backgroundColors];
  v16 = PFMap();
  [v3 setObject:v16 forKeyedSubscript:@"backgroundColors"];

  v17 = [(PIParallaxColorAnalysis *)self clockAreaColors];
  v18 = PFMap();
  [v3 setObject:v18 forKeyedSubscript:@"clockAreaColors"];

  return v3;
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 RGBValues];
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 RGBValues];
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 RGBValues];
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 RGBValues];
}

- (PIParallaxColorAnalysis)init
{
  v3.receiver = self;
  v3.super_class = (Class)PIParallaxColorAnalysis;
  result = [(PIParallaxColorAnalysis *)&v3 init];
  result->_version = 3;
  return result;
}

+ (id)colorsFromDictionary:(id)a3 key:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      v18 = v6;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v19 = 0;
        v14 = [MEMORY[0x1E4F8CC78] colorWithRGBValues:v13 error:&v19];
        id v15 = v19;
        if (!v14)
        {
          *a5 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize color values" object:v13 underlyingError:v15];

          goto LABEL_15;
        }
        [v7 addObject:v14];

        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          v6 = v18;
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      *a5 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid color values" object:v13];
LABEL_15:

      id v16 = 0;
      v6 = v18;
      goto LABEL_16;
    }
LABEL_11:

    id v16 = v7;
LABEL_16:
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Invalid color array" object:v6];
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)loadFromContentsDictionary:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v24 = NUAssertLogger_4957();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      uint64_t v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v28 = NUAssertLogger_4957();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v37 = dispatch_get_specific(*v26);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v26 = [v38 callStackSymbols];
        v40 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)v37;
        __int16 v48 = 2114;
        v49 = v40;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v26;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v34 = _NUAssertFailHandler();
    goto LABEL_45;
  }
  if (!a4)
  {
    v31 = NUAssertLogger_4957();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v28 = NUAssertLogger_4957();
    int v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_47;
    }
LABEL_45:
    if (v34)
    {
      v41 = dispatch_get_specific(*v26);
      v42 = (void *)MEMORY[0x1E4F29060];
      id v43 = v41;
      v44 = [v42 callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)v41;
      __int16 v48 = 2114;
      v49 = v45;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_47:

    _NUAssertFailHandler();
  }
  v7 = v6;
  id v8 = objc_alloc_init(PIParallaxColorAnalysis);
  uint64_t v9 = [v7 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid version number" object:v9];
    goto LABEL_7;
  }
  if ([v9 integerValue] >= 4)
  {
    uint64_t v10 = [MEMORY[0x1E4F7A438] unsupportedError:@"Incompatible color analysis version" object:v9];
LABEL_7:
    uint64_t v11 = 0;
    *a4 = v10;
    goto LABEL_21;
  }
  -[PIParallaxColorAnalysis setVersion:](v8, "setVersion:", [v9 integerValue]);
  uint64_t v12 = [v7 objectForKeyedSubscript:@"foregroundLuminance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 floatValue];
    [(PIParallaxColorAnalysis *)v8 setForegroundLuminance:v13];
    v14 = [v7 objectForKeyedSubscript:@"backgroundLuminance"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      [(PIParallaxColorAnalysis *)v8 setBackgroundLuminance:v15];
      uint64_t v16 = [a1 colorsFromDictionary:v7 key:@"foregroundColors" error:a4];
      if (v16)
      {
        v17 = (void *)v16;
        [(PIParallaxColorAnalysis *)v8 setForegroundColors:v16];
        v18 = [a1 colorsFromDictionary:v7 key:@"backgroundColors" error:a4];

        if (v18)
        {
          [(PIParallaxColorAnalysis *)v8 setBackgroundColors:v18];
          if ([(PIParallaxColorAnalysis *)v8 version] < 2)
          {
            [(PIParallaxColorAnalysis *)v8 backgroundLuminance];
            -[PIParallaxColorAnalysis setLuminance:](v8, "setLuminance:");
            long long v22 = [(PIParallaxColorAnalysis *)v8 backgroundColors];
            [(PIParallaxColorAnalysis *)v8 setColors:v22];

            uint64_t v12 = v14;
          }
          else
          {
            uint64_t v12 = [v7 objectForKeyedSubscript:@"luminance"];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [MEMORY[0x1E4F7A438] invalidError:@"Invalid luminance value" object:v12];
              uint64_t v11 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            }
            [v12 floatValue];
            [(PIParallaxColorAnalysis *)v8 setLuminance:v19];
            uint64_t v20 = [a1 colorsFromDictionary:v7 key:@"colors" error:a4];

            if (!v20)
            {
LABEL_27:
              uint64_t v11 = 0;
              goto LABEL_20;
            }
            [(PIParallaxColorAnalysis *)v8 setColors:v20];
            v18 = (void *)v20;
          }
          if ([(PIParallaxColorAnalysis *)v8 version] < 3)
          {
            uint64_t v23 = MEMORY[0x1E4F1CBF0];
          }
          else
          {
            uint64_t v23 = [a1 colorsFromDictionary:v7 key:@"clockAreaColors" error:a4];

            v18 = (void *)v23;
            if (!v23) {
              goto LABEL_27;
            }
          }
          [(PIParallaxColorAnalysis *)v8 setClockAreaColors:v23];
          uint64_t v11 = v8;
LABEL_31:

          goto LABEL_20;
        }
      }
      uint64_t v11 = 0;
    }
    else
    {
      [MEMORY[0x1E4F7A438] invalidError:@"Invalid luminance value" object:v14];
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v12 = v14;
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Invalid luminance value" object:v12];
    uint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

LABEL_21:
  return v11;
}

+ (int64_t)currentVersion
{
  return 3;
}

@end