@interface CLIOptionSet
- (CLIOptionSet)init;
- (CLIOptionSet)initWithOptions:(id)a3;
- (id)_copiedSet;
- (id)description;
- (void)_registerOption:(id)a3;
@end

@implementation CLIOptionSet

- (CLIOptionSet)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLIOptionSet;
  v2 = [(CLIOptionSet *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    options = v2->_options;
    v2->_options = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    shortAliasToOptionDict = v2->_shortAliasToOptionDict;
    v2->_shortAliasToOptionDict = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    longAliasToOptionDict = v2->_longAliasToOptionDict;
    v2->_longAliasToOptionDict = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (CLIOptionSet)initWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLIOptionSet *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    options = v5->_options;
    v5->_options = (NSMutableSet *)v6;

    uint64_t v8 = objc_opt_new();
    shortAliasToOptionDict = v5->_shortAliasToOptionDict;
    v5->_shortAliasToOptionDict = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    longAliasToOptionDict = v5->_longAliasToOptionDict;
    v5->_longAliasToOptionDict = (NSMutableDictionary *)v10;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[CLIOptionSet _registerOption:](v5, "_registerOption:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v16), (void)v18);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  return v5;
}

- (void)_registerOption:(id)a3
{
  id v12 = a3;
  [v12 _finalize];
  if ([(NSMutableSet *)self->_options containsObject:v12])
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CLIOptionParsing.m" lineNumber:296 description:@"Option was registered twice."];
  }
  [(NSMutableSet *)self->_options addObject:v12];
  uint64_t v5 = [v12 shortName];
  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_shortAliasToOptionDict objectForKeyedSubscript:v5];

    if (v6)
    {
      uint64_t v10 = +[NSAssertionHandler currentHandler];
      [v10 handleFailureInMethod:a2, self, @"CLIOptionParsing.m", 302, @"Short option '-%@' is duplicated", v5 object file lineNumber description];
    }
    [(NSMutableDictionary *)self->_shortAliasToOptionDict setObject:v12 forKeyedSubscript:v5];
  }
  uint64_t v7 = [v12 longName];
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_longAliasToOptionDict objectForKeyedSubscript:v7];

    if (v8)
    {
      v11 = +[NSAssertionHandler currentHandler];
      [v11 handleFailureInMethod:a2, self, @"CLIOptionParsing.m", 309, @"Long option '--%@' is duplicated", v7 object file lineNumber description];
    }
    [(NSMutableDictionary *)self->_longAliasToOptionDict setObject:v12 forKeyedSubscript:v7];
  }
}

- (id)_copiedSet
{
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_options;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "copy", (void)v11);
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  return [(NSMutableSet *)self->_options description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longAliasToOptionDict, 0);
  objc_storeStrong((id *)&self->_shortAliasToOptionDict, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end