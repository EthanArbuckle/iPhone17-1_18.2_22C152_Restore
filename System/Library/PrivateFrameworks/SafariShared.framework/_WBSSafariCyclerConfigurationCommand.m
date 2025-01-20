@interface _WBSSafariCyclerConfigurationCommand
- (BOOL)invokeWithParameters:(id)a3;
- (NSString)help;
- (NSString)name;
- (NSString)usage;
- (SEL)action;
- (_WBSSafariCyclerConfigurationCommand)init;
- (_WBSSafariCyclerConfigurationCommand)initWithName:(id)a3 help:(id)a4;
- (id)target;
- (unint64_t)maximumArgumentCount;
- (unint64_t)minimumArgumentCount;
- (void)setAction:(SEL)a3;
- (void)setArgumentCount:(unint64_t)a3;
- (void)setMaximumArgumentCount:(unint64_t)a3;
- (void)setMinimumArgumentCount:(unint64_t)a3;
- (void)setTarget:(id)a3;
- (void)setUsage:(id)a3;
@end

@implementation _WBSSafariCyclerConfigurationCommand

- (_WBSSafariCyclerConfigurationCommand)init
{
  return 0;
}

- (_WBSSafariCyclerConfigurationCommand)initWithName:(id)a3 help:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_WBSSafariCyclerConfigurationCommand;
  v8 = [(_WBSSafariCyclerConfigurationCommand *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    help = v8->_help;
    v8->_help = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)setArgumentCount:(unint64_t)a3
{
  self->_minimumArgumentCount = a3;
  self->_maximumArgumentCount = a3;
}

- (BOOL)invokeWithParameters:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if ([v4 count] >= self->_minimumArgumentCount
    && [v4 count] <= self->_maximumArgumentCount)
  {
    action = self->_action;
    if (action) {
      objc_msgSend(WeakRetained, action, v4);
    }
    else {
      objc_msgSend(WeakRetained, 0, v4);
    }
    BOOL v8 = 1;
  }
  else
  {
    printf("Invalid arguments to subcommand '%s'", [(NSString *)self->_name UTF8String]);
    if (self->_usage)
    {
      id v6 = [MEMORY[0x1E4F28F80] processInfo];
      id v7 = [v6 processName];
      printf("\nUSAGE: %s %s %s\n", (const char *)[v7 UTF8String], -[NSString UTF8String](self->_name, "UTF8String"), -[NSString UTF8String](self->_usage, "UTF8String"));
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)help
{
  return self->_help;
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
}

- (unint64_t)minimumArgumentCount
{
  return self->_minimumArgumentCount;
}

- (void)setMinimumArgumentCount:(unint64_t)a3
{
  self->_minimumArgumentCount = a3;
}

- (unint64_t)maximumArgumentCount
{
  return self->_maximumArgumentCount;
}

- (void)setMaximumArgumentCount:(unint64_t)a3
{
  self->_maximumArgumentCount = a3;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_help, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end