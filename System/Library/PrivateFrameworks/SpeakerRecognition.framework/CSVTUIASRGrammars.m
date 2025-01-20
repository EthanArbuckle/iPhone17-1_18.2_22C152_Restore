@interface CSVTUIASRGrammars
+ (id)sharedGrammars;
- (CSVTUIASRGrammars)init;
- (id)_getLMEWithGrammar:(id)a3 withLocale:(id)a4;
- (id)_getLeadingPatternsWithGrammars:(id)a3 withLocale:(id)a4;
- (id)_getRegexPatternsWithGrammars:(id)a3 withUtt:(int64_t)a4 withLocale:(id)a5;
- (id)_getTrailingPatternsWithGrammars:(id)a3 withLocale:(id)a4;
- (id)createGrammars;
- (id)getLMEforLocale:(id)a3;
- (id)getLeadingPatternsForUtt:(int64_t)a3 Locale:(id)a4;
- (id)getRegexPatternsForUtt:(int64_t)a3 Locale:(id)a4;
- (id)getTrailingPatternsForUtt:(int64_t)a3 Locale:(id)a4;
@end

@implementation CSVTUIASRGrammars

- (void).cxx_destruct
{
}

- (id)_getLMEWithGrammar:(id)a3 withLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = [v5 objectForKey:v6];
    v9 = [v8 objectForKey:@"lme"];

    if (v9)
    {
      v10 = [v5 objectForKey:v6];
      v7 = [v10 objectForKey:@"lme"];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)getLMEforLocale:(id)a3
{
  id v5 = 0;
  if (a3)
  {
    grammar = self->_grammar;
    if (grammar)
    {
      id v5 = [(CSVTUIASRGrammars *)self _getLMEWithGrammar:grammar withLocale:a3];
    }
    uint64_t v3 = vars8;
  }
  return v5;
}

- (id)_getRegexPatternsWithGrammars:(id)a3 withUtt:(int64_t)a4 withLocale:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 objectForKey:v8];

  if (v9
    && ([v7 objectForKey:v8],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKey:@"regex"],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = [v7 objectForKey:v8];
    v13 = [v12 objectForKey:@"regex"];

    if (v13 && [v13 count] >= a4)
    {
      v14 = [v13 objectAtIndex:a4 - 1];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)getRegexPatternsForUtt:(int64_t)a3 Locale:(id)a4
{
  id v7 = 0;
  if (a4)
  {
    grammar = self->_grammar;
    if (grammar)
    {
      id v7 = [(CSVTUIASRGrammars *)self _getRegexPatternsWithGrammars:grammar withUtt:a3 withLocale:a4];
    }
    uint64_t v4 = vars8;
  }
  return v7;
}

- (id)_getLeadingPatternsWithGrammars:(id)a3 withLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = [v5 objectForKey:v6];
    v9 = [v8 objectForKey:@"leading_garbage"];

    if (v9)
    {
      v10 = [v5 objectForKey:v6];
      id v7 = [v10 objectForKey:@"leading_garbage"];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)getLeadingPatternsForUtt:(int64_t)a3 Locale:(id)a4
{
  id v6 = 0;
  if (a4)
  {
    if (self->_grammar)
    {
      id v6 = -[CSVTUIASRGrammars _getLeadingPatternsWithGrammars:withLocale:](self, "_getLeadingPatternsWithGrammars:withLocale:");
    }
    uint64_t v4 = vars8;
  }
  return v6;
}

- (id)_getTrailingPatternsWithGrammars:(id)a3 withLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = [v5 objectForKey:v6];
    v9 = [v8 objectForKey:@"trailing_garbage"];

    if (v9)
    {
      v10 = [v5 objectForKey:v6];
      id v7 = [v10 objectForKey:@"trailing_garbage"];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)getTrailingPatternsForUtt:(int64_t)a3 Locale:(id)a4
{
  id v6 = 0;
  if (a4)
  {
    if (self->_grammar)
    {
      id v6 = -[CSVTUIASRGrammars _getTrailingPatternsWithGrammars:withLocale:](self, "_getTrailingPatternsWithGrammars:withLocale:");
    }
    uint64_t v4 = vars8;
  }
  return v6;
}

- (id)createGrammars
{
  id v2 = objc_alloc_init(NSDictionary);
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 bundlePath];

  id v6 = [v5 stringByAppendingPathComponent:@"regex.json"];
  if ([v3 fileExistsAtPath:v6])
  {
    id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
    uint64_t v11 = 0;
    uint64_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v11];
    uint64_t v9 = v11;

    if (v9) {
      NSLog(&cfstr_CannotParseToJ.isa);
    }

    id v2 = (id)v8;
  }
  else
  {
    NSLog(&cfstr_CannotFindTheF.isa);
  }

  return v2;
}

- (CSVTUIASRGrammars)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSVTUIASRGrammars;
  id v2 = [(CSVTUIASRGrammars *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(CSVTUIASRGrammars *)v2 createGrammars];
    grammar = v3->_grammar;
    v3->_grammar = (NSDictionary *)v4;
  }
  return v3;
}

+ (id)sharedGrammars
{
  if (sharedGrammars_onceToken != -1) {
    dispatch_once(&sharedGrammars_onceToken, &__block_literal_global_8964);
  }
  id v2 = (void *)sharedGrammars_sharedGammars;

  return v2;
}

uint64_t __35__CSVTUIASRGrammars_sharedGrammars__block_invoke()
{
  sharedGrammars_sharedGammars = objc_alloc_init(CSVTUIASRGrammars);

  return MEMORY[0x270F9A758]();
}

@end