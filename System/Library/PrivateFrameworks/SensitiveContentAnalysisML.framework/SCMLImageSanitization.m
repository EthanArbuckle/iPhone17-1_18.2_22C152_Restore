@interface SCMLImageSanitization
- (BOOL)granularOutput;
- (BOOL)safe;
- (NSMutableDictionary)signals;
- (SCMLImageSanitization)initWithGranularOutput:(BOOL)a3;
- (id)description;
- (id)unsafeReason;
- (id)updateSignal:(id)a3 withSafe:(BOOL)a4;
- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withScore:(float)a5;
- (void)setGranularOutput:(BOOL)a3;
- (void)setSafe:(BOOL)a3;
- (void)setSignals:(id)a3;
@end

@implementation SCMLImageSanitization

- (SCMLImageSanitization)initWithGranularOutput:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMLImageSanitization;
  v4 = [(SCMLImageSanitization *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_safe = 1;
    if (v3)
    {
      uint64_t v6 = [MEMORY[0x263EFFA78] mutableCopy];
      signals = v5->_signals;
      v5->_signals = (NSMutableDictionary *)v6;
    }
    else
    {
      signals = v4->_signals;
      v4->_signals = 0;
    }

    v5->_granularOutput = v3;
  }
  return v5;
}

- (id)unsafeReason
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = +[SCMLImageLabelCoder instance];
  v4 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_signals;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_signals, "objectForKeyedSubscript:", v9, (void)v14);
        if (([v10 safe] & 1) == 0)
        {
          v11 = [v3 decodeFromP1:v9];
          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v4 componentsJoinedByString:@","];

  return v12;
}

- (id)description
{
  if ([(SCMLImageSanitization *)self safe]) {
    v2 = @"safe";
  }
  else {
    v2 = @"unsafe";
  }

  return v2;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SCMLImageSanitization *)self granularOutput])
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_signals objectForKeyedSubscript:v6];
    if (!v7)
    {
      uint64_t v7 = objc_alloc_init(SCMLImageSanitizationSignal);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_signals, "setObject:forKeyedSubscript:");
    }
    [(SCMLImageSanitizationSignal *)v7 setSafe:[(SCMLImageSanitizationSignal *)v7 safe] & v4];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(SCMLImageSanitization *)self setSafe:[(SCMLImageSanitization *)self safe] & v4];

  return v7;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withScore:(float)a5
{
  uint64_t v7 = [(SCMLImageSanitization *)self updateSignal:a3 withSafe:a4];
  if ([(SCMLImageSanitization *)self granularOutput])
  {
    id v8 = objc_alloc(NSNumber);
    *(float *)&double v9 = a5;
    v10 = (void *)[v8 initWithFloat:v9];
    [v7 setScore:v10];
  }

  return v7;
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (BOOL)granularOutput
{
  return self->_granularOutput;
}

- (void)setGranularOutput:(BOOL)a3
{
  self->_granularOutput = a3;
}

- (NSMutableDictionary)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end