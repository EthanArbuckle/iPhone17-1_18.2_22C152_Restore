@interface TIDescriptorParser
- (NSMutableDictionary)context;
- (TIDescriptorParser)initWithErrorCode:(int64_t)a3;
- (id)boxNilForValue:(id)a3;
- (id)errorWithDetails:(id)a3;
- (id)errorWithMessage:(id)a3;
- (id)errorWithMessage:(id)a3 andValue:(id)a4;
- (id)invalidDataTypeErrorForKey:(id)a3 withValue:(id)a4 dataType:(id)a5;
- (id)invalidValueErrorForKey:(id)a3 withValue:(id)a4;
- (id)missingValueErrorForKey:(id)a3;
- (id)parseArrayForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (id)parseBooleanForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (id)parseDictionaryForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (id)parseFloatForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (id)parseIntegerForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (id)parseNumberForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (id)parseObjectForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6 validate:(id)a7;
- (id)parseStringForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (int64_t)errorCode;
@end

@implementation TIDescriptorParser

- (void).cxx_destruct
{
}

- (NSMutableDictionary)context
{
  return self->_context;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (id)boxNilForValue:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v6 = v5;

  return v6;
}

- (id)errorWithDetails:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [(TIDescriptorParser *)self context];
  [v5 addEntriesFromDictionary:v6];

  [v5 addEntriesFromDictionary:v4];
  v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"TIDescriptorErrorDomain", -[TIDescriptorParser errorCode](self, "errorCode"), v5);

  return v7;
}

- (id)errorWithMessage:(id)a3 andValue:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(TIDescriptorParser *)self boxNilForValue:a4];
  v11[0] = @"message";
  v11[1] = @"value";
  v12[0] = v6;
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v9 = [(TIDescriptorParser *)self errorWithDetails:v8];

  return v9;
}

- (id)errorWithMessage:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"message";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [(TIDescriptorParser *)self errorWithDetails:v6];

  return v7;
}

- (id)invalidDataTypeErrorForKey:(id)a3 withValue:(id)a4 dataType:(id)a5
{
  v8 = NSString;
  id v9 = a4;
  v10 = [v8 stringWithFormat:@"Key '%@' data type must be '%@'.", a3, a5];
  v11 = [(TIDescriptorParser *)self errorWithMessage:v10 andValue:v9];

  return v11;
}

- (id)invalidValueErrorForKey:(id)a3 withValue:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  v8 = [v6 stringWithFormat:@"Key '%@' value is invalid.", a3];
  id v9 = [(TIDescriptorParser *)self errorWithMessage:v8 andValue:v7];

  return v9;
}

- (id)missingValueErrorForKey:(id)a3
{
  id v4 = [NSString stringWithFormat:@"Key '%@' is missing.", a3];
  id v5 = [(TIDescriptorParser *)self errorWithMessage:v4];

  return v5;
}

- (id)parseObjectForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6 validate:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  v14 = (void (**)(id, void *))a7;
  v15 = [a4 objectForKey:v12];
  if (v15)
  {
    uint64_t v16 = v14[2](v14, v15);
  }
  else
  {
    if (!v9)
    {
LABEL_9:
      id v18 = v15;
      v17 = 0;
      goto LABEL_10;
    }
    uint64_t v16 = [(TIDescriptorParser *)self missingValueErrorForKey:v12];
  }
  v17 = (void *)v16;
  if (!v16) {
    goto LABEL_9;
  }
  if (v13) {
    [v13 addObject:v16];
  }
  id v18 = 0;
LABEL_10:

  return v18;
}

- (id)parseDictionaryForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__TIDescriptorParser_parseDictionaryForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __71__TIDescriptorParser_parseDictionaryForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isDictionary:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"dictionary"];
  }

  return v4;
}

- (id)parseArrayForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__TIDescriptorParser_parseArrayForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __66__TIDescriptorParser_parseArrayForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isArray:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"array"];
  }

  return v4;
}

- (id)parseBooleanForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__TIDescriptorParser_parseBooleanForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __68__TIDescriptorParser_parseBooleanForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isBoolean:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"BOOLean"];
  }

  return v4;
}

- (id)parseNumberForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__TIDescriptorParser_parseNumberForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __67__TIDescriptorParser_parseNumberForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isNumber:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"number"];
  }

  return v4;
}

- (id)parseFloatForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__TIDescriptorParser_parseFloatForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __66__TIDescriptorParser_parseFloatForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isFloat:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"float"];
  }

  return v4;
}

- (id)parseIntegerForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__TIDescriptorParser_parseIntegerForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __68__TIDescriptorParser_parseIntegerForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isInteger:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"integer"];
  }

  return v4;
}

- (id)parseStringForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__TIDescriptorParser_parseStringForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1E6E29248;
  v14[4] = self;
  id v15 = v10;
  id v11 = v10;
  id v12 = [(TIDescriptorParser *)self parseObjectForKey:v11 fromConfig:a4 required:v7 errors:a6 validate:v14];

  return v12;
}

id __67__TIDescriptorParser_parseStringForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAE268] isString:v3] && objc_msgSend(v3, "length"))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) invalidDataTypeErrorForKey:*(void *)(a1 + 40) withValue:v3 dataType:@"string"];
  }

  return v4;
}

- (TIDescriptorParser)initWithErrorCode:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TIDescriptorParser;
  id v4 = [(TIDescriptorParser *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_errorCode = a3;
    uint64_t v6 = objc_opt_new();
    context = v5->_context;
    v5->_context = (NSMutableDictionary *)v6;
  }
  return v5;
}

@end