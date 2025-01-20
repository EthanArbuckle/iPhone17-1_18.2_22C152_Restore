@interface _PASArgSubcommandHandlerParams
- (NSArray)positionalArguments;
- (NSDictionary)options;
- (_PASArgSubcommand)subcommand;
- (_PASArgSubcommandHandlerParams)initWithSubcommand:(id)a3 options:(id)a4 positionalArguments:(id)a5;
@end

@implementation _PASArgSubcommandHandlerParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionalArguments, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_subcommand, 0);
}

- (NSArray)positionalArguments
{
  return self->_positionalArguments;
}

- (NSDictionary)options
{
  return self->_options;
}

- (_PASArgSubcommand)subcommand
{
  return self->_subcommand;
}

- (_PASArgSubcommandHandlerParams)initWithSubcommand:(id)a3 options:(id)a4 positionalArguments:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PASArgSubcommandHandlerParams;
  v12 = [(_PASArgSubcommandHandlerParams *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_subcommand, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    objc_storeStrong((id *)&v13->_positionalArguments, a5);
  }

  return v13;
}

@end