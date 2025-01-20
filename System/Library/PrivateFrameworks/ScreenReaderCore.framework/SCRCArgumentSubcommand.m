@interface SCRCArgumentSubcommand
+ (id)subcommandWithName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)optionArray;
- (NSMutableArray)_optionMutableArray;
- (NSString)subcommandName;
- (SCRCArgumentSubcommand)init;
- (SCRCArgumentSubcommand)initWithName:(id)a3;
- (id)description;
- (id)formattedHelpFooter;
- (id)formattedHelpHeader;
- (int)run;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)addOption:(char)a3 argument:(id)a4 target:(id)a5 action:(SEL)a6 argumentDescription:(id)a7 required:(BOOL)a8;
- (void)setSubcommandName:(id)a3;
- (void)set_optionMutableArray:(id)a3;
@end

@implementation SCRCArgumentSubcommand

+ (id)subcommandWithName:(id)a3
{
  id v3 = a3;
  v4 = [[SCRCArgumentSubcommand alloc] initWithName:v3];

  return v4;
}

- (SCRCArgumentSubcommand)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCArgumentSubcommand;
  v6 = [(SCRCArgumentSubcommand *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subcommandName, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    optionMutableArray = v7->__optionMutableArray;
    v7->__optionMutableArray = v8;
  }
  return v7;
}

- (SCRCArgumentSubcommand)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCRCArgumentSubcommand;
  v2 = [(SCRCArgumentSubcommand *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    optionMutableArray = v2->__optionMutableArray;
    v2->__optionMutableArray = v3;
  }
  return v2;
}

- (NSArray)optionArray
{
  v2 = [(SCRCArgumentSubcommand *)self _optionMutableArray];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 subcommandName];

    objc_super v6 = [(SCRCArgumentSubcommand *)self subcommandName];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCRCArgumentSubcommand;
    unsigned __int8 v7 = [(SCRCArgumentSubcommand *)&v9 isEqual:v4];
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(SCRCArgumentSubcommand *)self subcommandName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(SCRCArgumentSubcommand *)self subcommandName];
  objc_super v6 = [v4 subcommandName];

  int64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (id)formattedHelpHeader
{
  return 0;
}

- (id)formattedHelpFooter
{
  return 0;
}

- (void)addOption:(char)a3 argument:(id)a4 target:(id)a5 action:(SEL)a6 argumentDescription:(id)a7 required:(BOOL)a8
{
  BOOL v8 = a8;
  int v12 = a3;
  v14 = NSString;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  objc_msgSend(v14, "stringWithFormat:", @"%c", v12);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v18 = [[SCRCArgumentHolder alloc] initWithArgument:v17 option:v23 description:v15 target:v16 action:a6 required:v8];

  v19 = [(SCRCArgumentSubcommand *)self _optionMutableArray];
  uint64_t v20 = [v19 indexOfObject:v18];

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = [(SCRCArgumentSubcommand *)self _optionMutableArray];
    [v21 removeObjectAtIndex:v20];
  }
  v22 = [(SCRCArgumentSubcommand *)self _optionMutableArray];
  [v22 addObject:v18];
}

- (int)run
{
  return 0;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SCRCArgumentSubcommand;
  unint64_t v3 = [(SCRCArgumentSubcommand *)&v18 description];
  id v4 = [MEMORY[0x263F089D8] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SCRCArgumentSubcommand *)self optionArray];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
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
        [v4 appendFormat:@" %@", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  v10 = NSString;
  objc_super v11 = [(SCRCArgumentSubcommand *)self subcommandName];
  int v12 = [v10 stringWithFormat:@"%@ { %@%@ }", v3, v11, v4];

  return v12;
}

- (NSString)subcommandName
{
  return self->_subcommandName;
}

- (void)setSubcommandName:(id)a3
{
}

- (NSMutableArray)_optionMutableArray
{
  return self->__optionMutableArray;
}

- (void)set_optionMutableArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__optionMutableArray, 0);
  objc_storeStrong((id *)&self->_subcommandName, 0);
}

@end