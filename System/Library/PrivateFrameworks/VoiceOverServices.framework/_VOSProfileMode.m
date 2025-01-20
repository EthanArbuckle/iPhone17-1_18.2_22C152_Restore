@interface _VOSProfileMode
+ (BOOL)supportsSecureCoding;
+ (_VOSProfileMode)profileModeWithStringValue:(id)a3;
+ (id)profileModeWitMode:(id)a3;
- (NSMutableSet)commands;
- (VOSScreenreaderMode)mode;
- (_VOSProfileMode)initWithCoder:(id)a3;
- (id)_initWithMode:(id)a3 commands:(id)a4;
- (id)description;
- (void)addCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCommands:(id)a3;
- (void)setMode:(id)a3;
@end

@implementation _VOSProfileMode

+ (id)profileModeWitMode:(id)a3
{
  id v3 = a3;
  id v4 = [[_VOSProfileMode alloc] _initWithMode:v3 commands:0];

  return v4;
}

+ (_VOSProfileMode)profileModeWithStringValue:(id)a3
{
  id v4 = +[VOSScreenreaderMode modeWithStringValue:a3];
  if (v4)
  {
    v5 = [a1 profileModeWitMode:v4];
  }
  else
  {
    v5 = 0;
  }

  return (_VOSProfileMode *)v5;
}

- (id)_initWithMode:(id)a3 commands:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_VOSProfileMode;
  v9 = [(_VOSProfileMode *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mode, a3);
    if (v8)
    {
      v11 = (NSMutableSet *)v8;
    }
    else
    {
      v11 = [MEMORY[0x263EFF9C0] set];
    }
    commands = v10->_commands;
    v10->_commands = v11;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "setMode:", v10, (void)v19);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v10;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_VOSProfileMode *)self mode];
  id v7 = [v6 rawValue];
  id v8 = [v3 stringWithFormat:@"%@<%p>: rawValue '%@'", v5, self, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
  v6 = +[VOSScreenreaderMode modeWithStringValue:v5];
  if (!v6)
  {
    v6 = +[VOSScreenreaderMode Invalid];
  }
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"commands"];

  v11 = [(_VOSProfileMode *)self _initWithMode:v6 commands:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  mode = self->_mode;
  id v6 = a3;
  v5 = [(VOSScreenreaderMode *)mode rawValue];
  [v6 encodeObject:v5 forKey:@"mode"];

  [v6 encodeObject:self->_commands forKey:@"commands"];
}

- (void)addCommand:(id)a3
{
  commands = self->_commands;
  id v5 = a3;
  [(NSMutableSet *)commands addObject:v5];
  [v5 setMode:self];
}

- (VOSScreenreaderMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSMutableSet)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

@end