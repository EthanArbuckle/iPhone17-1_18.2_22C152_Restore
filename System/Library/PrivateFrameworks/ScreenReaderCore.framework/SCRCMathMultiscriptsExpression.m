@interface SCRCMathMultiscriptsExpression
- (NSArray)postScripts;
- (NSArray)preScripts;
- (SCRCMathExpression)base;
- (SCRCMathMultiscriptsExpression)initWithDictionary:(id)a3;
- (id)_appendString:(id)a3 toDescription:(id)a4 arePausesAllowed:(BOOL)a5;
- (id)_subSuperscriptPairFromDictionary:(id)a3;
- (id)description;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (void)_subSuperScriptsDescriptionFromArray:(id)a3 withSpeakingStyle:(int64_t)a4 arePausesAllowed:(BOOL)a5 outSubscripts:(id *)a6 outSuperscripts:(id *)a7;
- (void)setBase:(id)a3;
- (void)setPostScripts:(id)a3;
- (void)setPreScripts:(id)a3;
@end

@implementation SCRCMathMultiscriptsExpression

- (SCRCMathMultiscriptsExpression)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SCRCMathMultiscriptsExpression;
  v5 = [(SCRCMathExpression *)&v36 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMBaseObject"];
    v7 = +[SCRCMathExpression mathExpressionWithDictionary:v6];
    [(SCRCMathMultiscriptsExpression *)v5 setBase:v7];

    v8 = [v4 objectForKey:@"AXMMultiscriptPostscripts"];
    v9 = [v4 objectForKey:@"AXMMultiscriptPrescripts"];
    v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [(SCRCMathMultiscriptsExpression *)v5 _subSuperscriptPairFromDictionary:*(void *)(*((void *)&v32 + 1) + 8 * v16)];
          [(NSArray *)v10 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v14);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = -[SCRCMathMultiscriptsExpression _subSuperscriptPairFromDictionary:](v5, "_subSuperscriptPairFromDictionary:", *(void *)(*((void *)&v28 + 1) + 8 * v22), (void)v28);
          [(NSArray *)v11 addObject:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v20);
    }

    postScripts = v5->_postScripts;
    v5->_postScripts = v10;
    v25 = v10;

    preScripts = v5->_preScripts;
    v5->_preScripts = v11;
  }
  return v5;
}

- (id)_subSuperscriptPairFromDictionary:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionary];
  v6 = [v4 objectForKey:@"AXMSubscriptObject"];
  v7 = [v4 objectForKey:@"AXMSuperscriptObject"];

  if (v6)
  {
    v8 = +[SCRCMathExpression mathExpressionWithDictionary:v6];

    if (v8)
    {
      v9 = +[SCRCMathExpression mathExpressionWithDictionary:v6];
      [v5 setObject:v9 forKey:@"AXMSubscriptObject"];
    }
  }
  if (v7)
  {
    v10 = +[SCRCMathExpression mathExpressionWithDictionary:v7];

    if (v10)
    {
      v11 = +[SCRCMathExpression mathExpressionWithDictionary:v7];
      [v5 setObject:v11 forKey:@"AXMSuperscriptObject"];
    }
  }

  return v5;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathMultiscriptsExpression;
  v3 = [(SCRCMathMultiscriptsExpression *)&v9 description];
  id v4 = [(SCRCMathMultiscriptsExpression *)self base];
  v5 = [(SCRCMathMultiscriptsExpression *)self preScripts];
  v6 = [(SCRCMathMultiscriptsExpression *)self postScripts];
  v7 = [v3 stringByAppendingFormat:@" - base %@, prescripts %@, postscripts %@", v4, v5, v6];

  return v7;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(SCRCMathMultiscriptsExpression *)self base];
  v8 = [v7 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];

  if (![v8 length])
  {
    uint64_t v9 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"empty.content"];

    v8 = (void *)v9;
  }
  id v10 = v8;
  NSUInteger v11 = [(NSArray *)self->_preScripts count];
  if (v11)
  {
    preScripts = self->_preScripts;
    id v42 = 0;
    id v43 = 0;
    [(SCRCMathMultiscriptsExpression *)self _subSuperScriptsDescriptionFromArray:preScripts withSpeakingStyle:a3 arePausesAllowed:v4 outSubscripts:&v43 outSuperscripts:&v42];
    id v13 = v43;
    id v14 = v42;
  }
  else
  {
    id v13 = 0;
    id v14 = 0;
  }
  postScripts = self->_postScripts;
  id v40 = 0;
  id v41 = 0;
  [(SCRCMathMultiscriptsExpression *)self _subSuperScriptsDescriptionFromArray:postScripts withSpeakingStyle:a3 arePausesAllowed:v4 outSubscripts:&v41 outSuperscripts:&v40];
  id v16 = v41;
  id v17 = v40;
  uint64_t v39 = v10;
  if (v11)
  {
    if ([v13 length])
    {
      id v18 = v10;
      uint64_t v19 = (void *)MEMORY[0x263F086A0];
      uint64_t v20 = [(SCRCMathExpression *)self localizedStringForKey:@"left.subscript.formatter"];
      uint64_t v21 = objc_msgSend(v19, "scrcStringWithFormat:", v20, v13, v39);
      uint64_t v22 = v13;
      id v13 = (id)v21;

      id v10 = [(SCRCMathMultiscriptsExpression *)self _appendString:v13 toDescription:v18 arePausesAllowed:v4];
    }
    if ([v14 length])
    {
      v23 = (void *)MEMORY[0x263F086A0];
      v24 = [(SCRCMathExpression *)self localizedStringForKey:@"left.superscript.formatter"];
      uint64_t v25 = objc_msgSend(v23, "scrcStringWithFormat:", v24, v14);

      uint64_t v26 = [(SCRCMathMultiscriptsExpression *)self _appendString:v25 toDescription:v10 arePausesAllowed:v4];

      id v10 = (id)v26;
      id v14 = (id)v25;
    }
  }
  if ([v16 length])
  {
    v27 = (void *)MEMORY[0x263F086A0];
    if (v11) {
      long long v28 = @"right.subscript.formatter";
    }
    else {
      long long v28 = @"generic.subscript.formatter";
    }
    long long v29 = [(SCRCMathExpression *)self localizedStringForKey:v28];
    uint64_t v30 = objc_msgSend(v27, "scrcStringWithFormat:", v29, v16);

    uint64_t v31 = [(SCRCMathMultiscriptsExpression *)self _appendString:v30 toDescription:v10 arePausesAllowed:v4];

    id v10 = (id)v31;
    id v16 = (id)v30;
  }
  if ([v17 length])
  {
    long long v32 = (void *)MEMORY[0x263F086A0];
    if (v11) {
      long long v33 = @"right.superscript.formatter";
    }
    else {
      long long v33 = @"generic.superscript.formatter";
    }
    long long v34 = [(SCRCMathExpression *)self localizedStringForKey:v33];
    uint64_t v35 = objc_msgSend(v32, "scrcStringWithFormat:", v34, v17);

    uint64_t v36 = [(SCRCMathMultiscriptsExpression *)self _appendString:v35 toDescription:v10 arePausesAllowed:v4];

    id v10 = (id)v36;
    id v17 = (id)v35;
  }
  id v37 = v10;

  return v37;
}

- (id)_appendString:(id)a3 toDescription:(id)a4 arePausesAllowed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F086A0];
  id v9 = a3;
  if (v5) {
    [v8 scrcPauseString];
  }
  else {
  id v10 = [v8 scrcSpaceString];
  }
  NSUInteger v11 = [v7 scrcStringByAppendingAttributedString:v10];

  id v12 = [v11 scrcStringByAppendingAttributedString:v9];

  return v12;
}

- (void)_subSuperScriptsDescriptionFromArray:(id)a3 withSpeakingStyle:(int64_t)a4 arePausesAllowed:(BOOL)a5 outSubscripts:(id *)a6 outSuperscripts:(id *)a7
{
  BOOL v32 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = v9;
  if (v9 && [v9 count])
  {
    v27 = a6;
    NSUInteger v11 = [MEMORY[0x263F086A0] scrcString];
    id v12 = [MEMORY[0x263F086A0] scrcString];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v28 = v10;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v17 = [v16 objectForKey:@"AXMSubscriptObject"];
          id v18 = [v16 objectForKey:@"AXMSuperscriptObject"];
          if (v17)
          {
            if ([v11 length])
            {
              uint64_t v19 = [MEMORY[0x263F086A0] scrcSpaceString];
              uint64_t v20 = [v11 scrcStringByAppendingAttributedString:v19];

              NSUInteger v11 = (void *)v20;
            }
            uint64_t v21 = [v17 speakableDescriptionWithSpeakingStyle:a4 arePausesAllowed:v32];
            uint64_t v22 = [v11 scrcStringByAppendingAttributedString:v21];

            NSUInteger v11 = (void *)v22;
          }
          if (v18)
          {
            if ([v12 length])
            {
              v23 = [MEMORY[0x263F086A0] scrcSpaceString];
              uint64_t v24 = [v12 scrcStringByAppendingAttributedString:v23];

              id v12 = (void *)v24;
            }
            uint64_t v25 = [v18 speakableDescriptionWithSpeakingStyle:a4 arePausesAllowed:v32];
            uint64_t v26 = [v12 scrcStringByAppendingAttributedString:v25];

            id v12 = (void *)v26;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }

    if (v27)
    {
      id *v27 = v11;
      *a7 = v12;
    }

    id v10 = v28;
  }
}

- (SCRCMathExpression)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSArray)postScripts
{
  return self->_postScripts;
}

- (void)setPostScripts:(id)a3
{
}

- (NSArray)preScripts
{
  return self->_preScripts;
}

- (void)setPreScripts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preScripts, 0);
  objc_storeStrong((id *)&self->_postScripts, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end