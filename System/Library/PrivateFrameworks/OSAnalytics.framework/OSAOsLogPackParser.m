@interface OSAOsLogPackParser
- (BOOL)formatStringIsImmutable;
- (NSString)formatString;
- (NSString)formatStringOriginatingModulePath;
- (id)compose:(id)a3;
- (id)extractArguments:(id)a3;
- (id)filterOutSensitiveStrings:(id)a3;
- (id)modulePathForImmutableMemoryPointer;
- (id)parse:(id)a3;
- (id)pointerPointsToImmutableMemory;
- (id)readCStringFromTarget;
- (void)setFormatString:(id)a3;
- (void)setFormatStringIsImmutable:(BOOL)a3;
- (void)setFormatStringOriginatingModulePath:(id)a3;
- (void)setModulePathForImmutableMemoryPointer:(id)a3;
- (void)setPointerPointsToImmutableMemory:(id)a3;
- (void)setReadCStringFromTarget:(id)a3;
@end

@implementation OSAOsLogPackParser

- (id)parse:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  __int16 v8 = *(unsigned __int8 *)(v7 + 69);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  (*((void (**)(void))self->_readCStringFromTarget + 2))();
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v56[5];
  if (!v9 || ![v9 length] || (unint64_t)objc_msgSend((id)v56[5], "length") >= 0x401)
  {
    id v10 = v5;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_formatString, (id)v56[5]);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __28__OSAOsLogPackParser_parse___block_invoke;
  v54[3] = &unk_1E5D1FA18;
  v54[4] = &v55;
  v12 = (void (**)(void, void))MEMORY[0x1AD0D8280](v54);
  char v13 = (*((uint64_t (**)(void))self->_pointerPointsToImmutableMemory + 2))();
  self->_formatStringIsImmutable = v13;
  if ((v13 & 1) == 0)
  {
    v51 = [[OSAParsedOsLogPart alloc] initWithLiteral:@"%s" isImmutable:1];
    [v5 addObject:v51];

    id v50 = v5;
    goto LABEL_79;
  }
  (*((void (**)(void))self->_modulePathForImmutableMemoryPointer + 2))();
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = (unsigned __int8 *)(v7 + 70);
  formatStringOriginatingModulePath = self->_formatStringOriginatingModulePath;
  self->_formatStringOriginatingModulePath = v14;

  int v17 = 0;
  do
  {
    if (![(id)v56[5] length] || v17 > 7) {
      break;
    }
    unint64_t v19 = [(id)v56[5] rangeOfString:@"%"];
    if (!v20) {
      break;
    }
    unint64_t v21 = v19;
    if ([(id)v56[5] length] < v19) {
      break;
    }
    if ([(id)v56[5] characterAtIndex:v21 + 1] != 37)
    {
      if (!v8) {
        break;
      }
      int v53 = v17;
      uint64_t v52 = v15[1];
      v27 = [OSAParsedOsLogPart alloc];
      v28 = [(id)v56[5] substringToIndex:v21];
      v29 = [(OSAParsedOsLogPart *)v27 initWithLiteral:v28 isImmutable:self->_formatStringIsImmutable];
      [v5 addObject:v29];

      [(id)v56[5] substringFromIndex:v21 + 1];
      v30 = int v17 = v53;
      v12[2](v12, v21);
      v12[2](v12, 1);
      if ([v30 hasPrefix:@"s"])
      {
        v12[2](v12, 1);
        if ((*v15 & 0xF0) == 0x20 && v15[1] == 8)
        {
          __memcpy_chk();
          v31 = [OSAParsedOsLogPart alloc];
          v32 = (*((void (**)(void))self->_readCStringFromTarget + 2))();
          v33 = [(OSAParsedOsLogPart *)v31 initWithStringArgument:v32 isImmutable:(*((uint64_t (**)(void))self->_pointerPointsToImmutableMemory + 2))()];
          [v5 addObject:v33];

          int v17 = v53 + 1;
          int v26 = 2;
          goto LABEL_72;
        }
LABEL_71:
        int v26 = 3;
LABEL_72:
        uint64_t v46 = v52;
LABEL_73:
        --v8;
        v15 += v46 + 2;

        continue;
      }
      if ([v30 hasPrefix:@"d"])
      {
        v12[2](v12, [@"d" length]);
        if (*v15 > 0xFu || v15[1] != 4) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v34 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
        v36 = [(OSAParsedOsLogPart *)v34 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"ld"])
      {
        v12[2](v12, [@"ld" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v37 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0);
        v36 = [(OSAParsedOsLogPart *)v37 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"lld"])
      {
        v12[2](v12, [@"lld" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v38 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", 0);
        v36 = [(OSAParsedOsLogPart *)v38 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"u"])
      {
        v12[2](v12, [@"u" length]);
        if (*v15 > 0xFu || v15[1] != 4) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v39 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%u", 0);
        v36 = [(OSAParsedOsLogPart *)v39 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"lu"])
      {
        v12[2](v12, [@"lu" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v40 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 0);
        v36 = [(OSAParsedOsLogPart *)v40 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"llu"])
      {
        v12[2](v12, [@"llu" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v41 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", 0);
        v36 = [(OSAParsedOsLogPart *)v41 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"x"])
      {
        v12[2](v12, [@"x" length]);
        if (*v15 > 0xFu || v15[1] != 4) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v42 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%x", 0);
        v36 = [(OSAParsedOsLogPart *)v42 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"lx"])
      {
        v12[2](v12, [@"lx" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v43 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%lx", 0);
        v36 = [(OSAParsedOsLogPart *)v43 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"llx"])
      {
        v12[2](v12, [@"llx" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_71;
        }
        __memcpy_chk();
        v44 = [OSAParsedOsLogPart alloc];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%llx", 0);
        v36 = [(OSAParsedOsLogPart *)v44 initWithIntegerArgumentStringValue:v35];
        [v5 addObject:v36];
        goto LABEL_68;
      }
      if ([v30 hasPrefix:@"p"])
      {
        v12[2](v12, [@"p" length]);
        if (*v15 > 0xFu) {
          goto LABEL_71;
        }
        if (v15[1] == 8)
        {
LABEL_67:
          __memcpy_chk();
          v45 = [OSAParsedOsLogPart alloc];
          v35 = objc_msgSend(NSString, "stringWithFormat:", @"%p", 0);
          v36 = [(OSAParsedOsLogPart *)v45 initWithIntegerArgumentStringValue:v35];
          [v5 addObject:v36];
LABEL_68:

          uint64_t v46 = v52;
          int v26 = 0;
          int v17 = v53 + 1;
          goto LABEL_73;
        }
      }
      else
      {
        if (![v30 hasPrefix:@"@"])
        {
          v47 = [[OSAParsedOsLogPart alloc] initWithLiteral:@"%" isImmutable:self->_formatStringIsImmutable];
          [v5 addObject:v47];

          goto LABEL_71;
        }
        v12[2](v12, [@"p" length]);
        if ((*v15 & 0xF0) == 0x40 && v15[1] == 8) {
          goto LABEL_67;
        }
      }
      int v26 = 3;
      int v17 = v53;
      goto LABEL_72;
    }
    v22 = [OSAParsedOsLogPart alloc];
    v23 = [(id)v56[5] substringToIndex:v21];
    v24 = [(OSAParsedOsLogPart *)v22 initWithLiteral:v23 isImmutable:self->_formatStringIsImmutable];
    [v5 addObject:v24];

    v25 = [[OSAParsedOsLogPart alloc] initWithLiteral:@"%" isImmutable:self->_formatStringIsImmutable];
    [v5 addObject:v25];

    v12[2](v12, v21 + 2);
    int v26 = 2;
  }
  while (v26 != 3);
  if ([(id)v56[5] length])
  {
    v48 = [OSAParsedOsLogPart alloc];
    v49 = [(OSAParsedOsLogPart *)v48 initWithLiteral:v56[5] isImmutable:self->_formatStringIsImmutable];
    [v5 addObject:v49];
  }
  id v50 = (id)[v5 copy];
LABEL_79:
  id v10 = v50;

LABEL_5:
  _Block_object_dispose(&v55, 8);

  return v10;
}

uint64_t __28__OSAOsLogPackParser_parse___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) substringFromIndex:a2];
  return MEMORY[0x1F41817F8]();
}

- (id)filterOutSensitiveStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isImmutable", (void)v14))
        {
          [v4 addObject:v10];
        }
        else
        {
          v11 = [[OSAParsedOsLogPart alloc] initWithStringArgument:@"%s" isImmutable:1];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)compose:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "stringValue", (void)v13);
        [v4 appendString:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

- (id)extractArguments:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isArgument", (void)v14))
        {
          v11 = [v10 stringValue];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)pointerPointsToImmutableMemory
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPointerPointsToImmutableMemory:(id)a3
{
}

- (id)modulePathForImmutableMemoryPointer
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setModulePathForImmutableMemoryPointer:(id)a3
{
}

- (id)readCStringFromTarget
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setReadCStringFromTarget:(id)a3
{
}

- (NSString)formatString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFormatString:(id)a3
{
}

- (BOOL)formatStringIsImmutable
{
  return self->_formatStringIsImmutable;
}

- (void)setFormatStringIsImmutable:(BOOL)a3
{
  self->_formatStringIsImmutable = a3;
}

- (NSString)formatStringOriginatingModulePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFormatStringOriginatingModulePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStringOriginatingModulePath, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong(&self->_readCStringFromTarget, 0);
  objc_storeStrong(&self->_modulePathForImmutableMemoryPointer, 0);
  objc_storeStrong(&self->_pointerPointsToImmutableMemory, 0);
}

@end