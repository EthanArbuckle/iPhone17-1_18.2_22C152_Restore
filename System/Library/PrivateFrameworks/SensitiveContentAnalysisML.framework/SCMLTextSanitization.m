@interface SCMLTextSanitization
- (BOOL)granularOutput;
- (BOOL)safe;
- (NSMutableDictionary)signals;
- (SCMLTextSanitization)initWithGranularOutput:(BOOL)a3;
- (id)description;
- (id)unsafeReason;
- (id)updateSignal:(id)a3 withSafe:(BOOL)a4;
- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withLabel:(id)a5;
- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withScore:(float)a5;
- (unsigned)adapterViolationCategory;
- (void)setAdapterViolationCategory:(unsigned int)a3;
- (void)setGranularOutput:(BOOL)a3;
- (void)setSafe:(BOOL)a3;
- (void)setSignals:(id)a3;
@end

@implementation SCMLTextSanitization

- (SCMLTextSanitization)initWithGranularOutput:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMLTextSanitization;
  v4 = [(SCMLTextSanitization *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_safe = 1;
    v4->_adapterViolationCategory = 0;
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
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = +[SCMLImageLabelCoder instance];
  v4 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_signals;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_signals objectForKeyedSubscript:v9];
        if (([v10 safe] & 1) == 0)
        {
          v11 = [v3 decodeFromP1:v9];
          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v12 = NSString;
  uint64_t v13 = [(SCMLTextSanitization *)self adapterViolationCategory];
  v14 = [v4 componentsJoinedByString:@","];
  v15 = [v12 stringWithFormat:@"%u %@", v13, v14, (void)v17];

  return v15;
}

- (id)description
{
  if ([(SCMLTextSanitization *)self safe]) {
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
  if ([(SCMLTextSanitization *)self granularOutput])
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_signals objectForKeyedSubscript:v6];
    if (!v7)
    {
      uint64_t v7 = objc_alloc_init(SCMLTextSanitizationSignal);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_signals, "setObject:forKeyedSubscript:");
    }
    [(SCMLTextSanitizationSignal *)v7 setSafe:[(SCMLTextSanitizationSignal *)v7 safe] & v4];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(SCMLTextSanitization *)self setSafe:[(SCMLTextSanitization *)self safe] & v4];

  return v7;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withLabel:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(SCMLTextSanitization *)self updateSignal:a3 withSafe:v5];
  if ([(SCMLTextSanitization *)self granularOutput]) {
    [v9 setLabel:v8];
  }

  return v9;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withScore:(float)a5
{
  uint64_t v7 = [(SCMLTextSanitization *)self updateSignal:a3 withSafe:a4];
  if ([(SCMLTextSanitization *)self granularOutput])
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

- (unsigned)adapterViolationCategory
{
  return self->_adapterViolationCategory;
}

- (void)setAdapterViolationCategory:(unsigned int)a3
{
  self->_adapterViolationCategory = a3;
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