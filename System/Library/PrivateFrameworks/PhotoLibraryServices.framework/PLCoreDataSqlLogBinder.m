@interface PLCoreDataSqlLogBinder
+ (id)bindSelectString:(id)a3 bindValueStrings:(id)a4;
+ (id)stringFromBindVariable:(id)a3 withTypePrefix:(BOOL)a4;
- (NSString)boundSql;
- (PLCoreDataSqlLogBinder)init;
- (void)addLogLine:(id)a3;
- (void)setSelectString:(id)a3 bindValueStrings:(id)a4;
@end

@implementation PLCoreDataSqlLogBinder

+ (id)stringFromBindVariable:(id)a3 withTypePrefix:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (![v5 hasObjectValue])
  {
    uint64_t v10 = [v5 int64];

    if (v10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%qd", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = @"(int64)";
      if (v4) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
LABEL_8:
    v12 = &stru_1EEB2EB80;
    v11 = @"nil";
    if (v4) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = [v5 value];

  if (!v6) {
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = NSString;
  if (isKindOfClass)
  {
    uint64_t v18 = [v6 length];
    v9 = @"<NSData len=%tu>";
LABEL_16:
    objc_msgSend(v8, "stringWithFormat:", v9, v18);
LABEL_17:
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v12 = &stru_1EEB2EB80;
    if (v4) {
      goto LABEL_18;
    }
LABEL_14:
    v15 = v11;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [NSString stringWithFormat:@"\"%@\"", v6];
    goto LABEL_17;
  }
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();
  v8 = NSString;
  if ((v13 & 1) == 0)
  {
    uint64_t v18 = (uint64_t)v6;
    v9 = @"%@";
    goto LABEL_16;
  }
  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v8, "stringWithFormat:", @"%f", v14);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = @"(timestamp)";
  if (!v4) {
    goto LABEL_14;
  }
LABEL_18:
  v15 = [NSString stringWithFormat:@"%@%@", v12, v11];
LABEL_19:
  v16 = v15;

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindRegex, 0);
  objc_storeStrong((id *)&self->_selectRegex, 0);
  objc_storeStrong((id *)&self->_bindValues, 0);
  objc_storeStrong((id *)&self->_selectString, 0);
}

- (NSString)boundSql
{
  v2 = self;
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  if (v2)
  {
    uint64_t v4 = [(NSMutableArray *)v2->_bindValues count];
    selectString = v2->_selectString;
    if (v4)
    {
      v6 = [(NSString *)selectString componentsSeparatedByString:@"?"];
      v7 = (void *)[v6 mutableCopy];

      if ([v7 count] == v4 + 1)
      {
        v8 = [MEMORY[0x1E4F28E78] string];
        for (uint64_t i = 0; i != v4; ++i)
        {
          uint64_t v10 = [v7 objectAtIndexedSubscript:i];
          [v8 appendString:v10];

          v11 = [(NSMutableArray *)v2->_bindValues objectAtIndexedSubscript:i];
          [v8 appendString:v11];
        }
        v12 = [v7 objectAtIndexedSubscript:v4];
        [v8 appendString:v12];

        v2 = (PLCoreDataSqlLogBinder *)[v8 copy];
      }
      else
      {
        uint64_t v14 = (__CFString *)v2->_selectString;
        if (!v14) {
          uint64_t v14 = &stru_1EEB2EB80;
        }
        v2 = v14;
      }
    }
    else
    {
      char v13 = &stru_1EEB2EB80;
      if (selectString) {
        char v13 = (__CFString *)v2->_selectString;
      }
      v2 = v13;
    }
  }
  return (NSString *)v2;
}

- (void)setSelectString:(id)a3 bindValueStrings:(id)a4
{
  id v6 = a4;
  v7 = (NSString *)[a3 copy];
  selectString = self->_selectString;
  self->_selectString = v7;

  v9 = (NSMutableArray *)[v6 copy];
  bindValues = self->_bindValues;
  self->_bindValues = v9;
}

- (void)addLogLine:(id)a3
{
  id v16 = a3;
  uint64_t v4 = -[NSRegularExpression firstMatchInString:options:range:](self->_selectRegex, "firstMatchInString:options:range:", v16, 0, 0, [v16 length]);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [v4 rangeAtIndex:1];
    v8 = objc_msgSend(v16, "substringWithRange:", v6, v7);
    v9 = (NSString *)[v8 copy];
    selectString = self->_selectString;
    self->_selectString = v9;

    goto LABEL_3;
  }
  v11 = -[NSRegularExpression firstMatchInString:options:range:](self->_bindRegex, "firstMatchInString:options:range:", v16, 0, 0, [v16 length]);
  if (v11)
  {
    id v5 = v11;
    [v11 rangeAtIndex:3];
    if (!v12) {
      goto LABEL_4;
    }
    uint64_t v13 = [v5 rangeAtIndex:3];
    uint64_t v15 = objc_msgSend(v16, "substringWithRange:", v13, v14);
    if (!v15) {
      goto LABEL_4;
    }
    v8 = (void *)v15;
    [(NSMutableArray *)self->_bindValues addObject:v15];
LABEL_3:

LABEL_4:
  }
}

- (PLCoreDataSqlLogBinder)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLCoreDataSqlLogBinder;
  v2 = [(PLCoreDataSqlLogBinder *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bindValues = v2->_bindValues;
    v2->_bindValues = v3;

    uint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"sql: (SELECT.*)$" options:0 error:0];
    selectRegex = v2->_selectRegex;
    v2->_selectRegex = (NSRegularExpression *)v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(?:details: SQLite |sql:)?bind\\[(\\d+)\\] = (\\([^\\)]+\\)?(.*)$"), 0, 0);
    bindRegex = v2->_bindRegex;
    v2->_bindRegex = (NSRegularExpression *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)bindSelectString:(id)a3 bindValueStrings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
  v8 = objc_alloc_init(PLCoreDataSqlLogBinder);
  [(PLCoreDataSqlLogBinder *)v8 setSelectString:v5 bindValueStrings:v6];
  v9 = [(PLCoreDataSqlLogBinder *)v8 boundSql];

  return v9;
}

@end