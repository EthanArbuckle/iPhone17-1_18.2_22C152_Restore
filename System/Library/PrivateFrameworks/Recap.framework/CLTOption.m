@interface CLTOption
- (BOOL)allowsNegativeNumbersAsArguments;
- (BOOL)consumeArgument:(id)a3;
- (CLTOption)init;
- (NSArray)consumedOrDefaultArguments;
- (NSArray)defaultArguments;
- (NSArray)longforms;
- (NSArray)shorthands;
- (NSMutableArray)consumedArguments;
- (NSNumber)numberValue;
- (NSString)argumentHelp;
- (NSString)lefthandHelp;
- (NSString)righthandHelp;
- (id)triggerAction;
- (int)maxAllowedOccurencies;
- (int)maxConsumedArguments;
- (int)minConsumedArguments;
- (int)occurencies;
- (void)addLongform:(id)a3;
- (void)addShorthand:(id)a3;
- (void)setAllowsNegativeNumbersAsArguments:(BOOL)a3;
- (void)setArgumentHelp:(id)a3;
- (void)setConsumedArguments:(id)a3;
- (void)setDefaultArguments:(id)a3;
- (void)setMaxAllowedOccurencies:(int)a3;
- (void)setMaxConsumedArguments:(int)a3;
- (void)setMinConsumedArguments:(int)a3;
- (void)setOccurencies:(int)a3;
- (void)setRighthandHelp:(id)a3;
- (void)setTriggerAction:(id)a3;
@end

@implementation CLTOption

- (CLTOption)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLTOption;
  v2 = [(CLTOption *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    shorthands = v2->_shorthands;
    v2->_shorthands = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    longforms = v2->_longforms;
    v2->_longforms = (NSArray *)v5;

    uint64_t v7 = objc_opt_new();
    consumedArguments = v2->_consumedArguments;
    v2->_consumedArguments = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)addShorthand:(id)a3
{
}

- (void)addLongform:(id)a3
{
}

- (NSString)lefthandHelp
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  lefthandHelp = self->_lefthandHelp;
  if (!lefthandHelp)
  {
    v4 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v5 = [(CLTOption *)self shorthands];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v11 = [@"-" stringByAppendingString:v10];
          if ([(CLTOption *)self maxAllowedOccurencies] >= 2)
          {
            v12 = objc_msgSend(&stru_1EFF926D0, "stringByPaddingToLength:withString:startingAtIndex:", -[CLTOption maxAllowedOccurencies](self, "maxAllowedOccurencies") - 1, v10, 0);
            uint64_t v13 = [v11 stringByAppendingFormat:@"[%@]", v12];

            v11 = (void *)v13;
          }
          [v4 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v7);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = [(CLTOption *)self longforms];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          v20 = @"--";
          if (![v4 count])
          {
            v20 = [@"    " stringByAppendingString:@"--"];
          }
          v21 = [(__CFString *)v20 stringByAppendingString:v19];
          [v4 addObject:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v16);
    }

    v22 = [v4 componentsJoinedByString:@", "];
    v23 = self->_lefthandHelp;
    self->_lefthandHelp = v22;

    if ([(NSString *)self->_argumentHelp length])
    {
      argumentHelp = self->_argumentHelp;
      v37[0] = self->_lefthandHelp;
      v37[1] = argumentHelp;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      v26 = [v25 componentsJoinedByString:@" "];
      v27 = self->_lefthandHelp;
      self->_lefthandHelp = v26;
    }
    lefthandHelp = self->_lefthandHelp;
  }
  return lefthandHelp;
}

- (BOOL)consumeArgument:(id)a3
{
  id v4 = a3;
  int v5 = [(CLTOption *)self maxConsumedArguments];
  uint64_t v6 = [(CLTOption *)self consumedArguments];
  unint64_t v7 = [v6 count];

  BOOL v8 = 0;
  if (v4 && v7 < v5)
  {
    if ([v4 hasPrefix:@"-"]
      && (!self->_allowsNegativeNumbersAsArguments
       || (unint64_t)[v4 length] < 2
       || [v4 characterAtIndex:1] < 0x30
       || [v4 characterAtIndex:1] > 0x39))
    {
      BOOL v8 = 0;
    }
    else
    {
      v9 = [(CLTOption *)self consumedArguments];
      [v9 addObject:v4];

      BOOL v8 = 1;
    }
  }

  return v8;
}

- (NSArray)consumedOrDefaultArguments
{
  if ([(NSMutableArray *)self->_consumedArguments count]) {
    uint64_t v3 = (NSArray *)[(NSMutableArray *)self->_consumedArguments copy];
  }
  else {
    uint64_t v3 = self->_defaultArguments;
  }
  return v3;
}

- (NSNumber)numberValue
{
  uint64_t v3 = [(NSMutableArray *)self->_consumedArguments count];
  uint64_t v4 = 88;
  if (v3 == 1) {
    uint64_t v4 = 80;
  }
  int v5 = [*(id *)((char *)&self->super.isa + v4) firstObject];
  if (v5)
  {
    uint64_t v6 = (void *)numberValue_formatter;
    if (!numberValue_formatter)
    {
      uint64_t v7 = objc_opt_new();
      BOOL v8 = (void *)numberValue_formatter;
      numberValue_formatter = v7;

      [(id)numberValue_formatter setNumberStyle:1];
      v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
      [(id)numberValue_formatter setLocale:v9];

      uint64_t v6 = (void *)numberValue_formatter;
    }
    uint64_t v10 = [v6 numberFromString:v5];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (NSNumber *)v10;
}

- (NSArray)shorthands
{
  return self->_shorthands;
}

- (NSArray)longforms
{
  return self->_longforms;
}

- (id)triggerAction
{
  return self->_triggerAction;
}

- (void)setTriggerAction:(id)a3
{
}

- (NSString)righthandHelp
{
  return self->_righthandHelp;
}

- (void)setRighthandHelp:(id)a3
{
}

- (NSString)argumentHelp
{
  return self->_argumentHelp;
}

- (void)setArgumentHelp:(id)a3
{
}

- (int)occurencies
{
  return self->_occurencies;
}

- (void)setOccurencies:(int)a3
{
  self->_occurencies = a3;
}

- (int)maxAllowedOccurencies
{
  return self->_maxAllowedOccurencies;
}

- (void)setMaxAllowedOccurencies:(int)a3
{
  self->_maxAllowedOccurencies = a3;
}

- (int)minConsumedArguments
{
  return self->_minConsumedArguments;
}

- (void)setMinConsumedArguments:(int)a3
{
  self->_minConsumedArguments = a3;
}

- (int)maxConsumedArguments
{
  return self->_maxConsumedArguments;
}

- (void)setMaxConsumedArguments:(int)a3
{
  self->_maxConsumedArguments = a3;
}

- (BOOL)allowsNegativeNumbersAsArguments
{
  return self->_allowsNegativeNumbersAsArguments;
}

- (void)setAllowsNegativeNumbersAsArguments:(BOOL)a3
{
  self->_allowsNegativeNumbersAsArguments = a3;
}

- (NSMutableArray)consumedArguments
{
  return self->_consumedArguments;
}

- (void)setConsumedArguments:(id)a3
{
}

- (NSArray)defaultArguments
{
  return self->_defaultArguments;
}

- (void)setDefaultArguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultArguments, 0);
  objc_storeStrong((id *)&self->_consumedArguments, 0);
  objc_storeStrong((id *)&self->_argumentHelp, 0);
  objc_storeStrong((id *)&self->_righthandHelp, 0);
  objc_storeStrong(&self->_triggerAction, 0);
  objc_storeStrong((id *)&self->_lefthandHelp, 0);
  objc_storeStrong((id *)&self->_longforms, 0);
  objc_storeStrong((id *)&self->_shorthands, 0);
}

@end