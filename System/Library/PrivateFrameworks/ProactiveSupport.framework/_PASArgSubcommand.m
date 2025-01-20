@interface _PASArgSubcommand
+ (_PASArgSubcommand)subcommandWithName:(id)a3 help:(id)a4 handler:(id)a5;
+ (id)simpleSubcommandWithHelpGenerator:(id)a3 name:(id)a4 help:(id)a5 handler:(id)a6;
- (NSMutableArray)registeredOptions;
- (NSMutableSet)requiredOptions;
- (NSString)helpDescription;
- (NSString)name;
- (_PASArgSubcommand)initWithName:(id)a3 help:(id)a4 handler:(id)a5;
- (id)customUsageHelpWithUsageOverride:(id)a3 positionalArgString:(id)a4 optionHelpOverride:(id)a5 additionalHelpText:(id)a6;
- (id)description;
- (id)handler;
- (id)naiveUsageHelpWithPositionalArgString:(id)a3;
- (id)optionLongHelp;
- (id)optionShortHelp;
- (void)registerOption:(id)a3;
- (void)setRegisteredOptions:(id)a3;
- (void)setRequiredOptions:(id)a3;
@end

@implementation _PASArgSubcommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredOptions, 0);
  objc_storeStrong((id *)&self->_registeredOptions, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_helpDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setRequiredOptions:(id)a3
{
}

- (NSMutableSet)requiredOptions
{
  return self->_requiredOptions;
}

- (void)setRegisteredOptions:(id)a3
{
}

- (NSMutableArray)registeredOptions
{
  return self->_registeredOptions;
}

- (id)handler
{
  return self->_handler;
}

- (NSString)helpDescription
{
  return self->_helpDescription;
}

- (NSString)name
{
  return self->_name;
}

- (id)customUsageHelpWithUsageOverride:(id)a3 positionalArgString:(id)a4 optionHelpOverride:(id)a5 additionalHelpText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ -- %@\n\n", self->_name, self->_helpDescription];
  v15 = v14;
  if (v10)
  {
    [v14 appendString:v10];
    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v23 = [NSString alloc];
  v17 = [MEMORY[0x1E4F28F80] processInfo];
  v18 = [v17 processName];
  name = self->_name;
  v20 = [(_PASArgSubcommand *)self optionShortHelp];
  v21 = (void *)[v23 initWithFormat:@"Usage:\n%@ %@%@", v18, name, v20];
  [v15 appendString:v21];

  if (v11)
  {
LABEL_3:
    [v15 appendString:v11];
    [v15 appendString:@"\n"];
  }
LABEL_4:
  if (v12)
  {
    [v15 appendString:v12];
    if (!v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v22 = [(_PASArgSubcommand *)self optionLongHelp];
  [v15 appendString:v22];

  if (v13) {
LABEL_6:
  }
    [v15 appendString:v13];
LABEL_7:

  return v15;
}

- (id)naiveUsageHelpWithPositionalArgString:(id)a3
{
  return [(_PASArgSubcommand *)self customUsageHelpWithUsageOverride:0 positionalArgString:a3 optionHelpOverride:0 additionalHelpText:0];
}

- (id)optionLongHelp
{
  return makeOptionLongHelp(self->_registeredOptions);
}

- (id)optionShortHelp
{
  return makeOptionShortHelp(self->_registeredOptions);
}

- (void)registerOption:(id)a3
{
  id v6 = a3;
  [(NSMutableArray *)self->_registeredOptions addObject:v6];
  if ([v6 required])
  {
    requiredOptions = self->_requiredOptions;
    v5 = [v6 name];
    [(NSMutableSet *)requiredOptions addObject:v5];
  }
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"_PASSubcommand. name:%@ help:%@", self->_name, self->_helpDescription];
  if ([(NSMutableArray *)self->_registeredOptions count])
  {
    [v3 appendFormat:@" Options:\n"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = self->_registeredOptions;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }

  return v3;
}

- (_PASArgSubcommand)initWithName:(id)a3 help:(id)a4 handler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 length])
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_PASArgParser.m", 158, @"Invalid parameter not satisfying: %@", @"helpDescription" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"_PASArgParser.m", 157, @"Invalid parameter not satisfying: %@", @"name.length > 0" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_PASArgParser.m", 159, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)_PASArgSubcommand;
  long long v13 = [(_PASArgSubcommand *)&v25 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_helpDescription, a4);
    uint64_t v15 = MEMORY[0x1A6245320](v12);
    id handler = v14->_handler;
    v14->_id handler = (id)v15;

    uint64_t v17 = objc_opt_new();
    registeredOptions = v14->_registeredOptions;
    v14->_registeredOptions = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    requiredOptions = v14->_requiredOptions;
    v14->_requiredOptions = (NSMutableSet *)v19;
  }
  return v14;
}

+ (id)simpleSubcommandWithHelpGenerator:(id)a3 name:(id)a4 help:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"_PASArgParser.m", 183, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73___PASArgSubcommand_simpleSubcommandWithHelpGenerator_name_help_handler___block_invoke;
  v21[3] = &unk_1E5AEAD88;
  id v22 = v11;
  id v23 = v14;
  id v15 = v14;
  id v16 = v11;
  uint64_t v17 = +[_PASArgSubcommand subcommandWithName:v12 help:v13 handler:v21];
  v18 = +[_PASArgOption optionWithName:@"help" shortName:@"h" help:@"Display a help page."];
  [v17 registerOption:v18];

  return v17;
}

+ (_PASArgSubcommand)subcommandWithName:(id)a3 help:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 help:v9 handler:v8];

  return (_PASArgSubcommand *)v11;
}

@end