@interface _VOSProfileSecondaryCommand
+ (BOOL)supportsSecureCoding;
+ (id)profileSecondaryCommandWithCommand:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5;
+ (id)profileSecondaryCommandWithStringValue:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5;
- (VOSCommand)command;
- (_VOSProfileCommand)primaryProfileCommand;
- (_VOSProfileSecondaryCommand)initWithCoder:(id)a3;
- (id)_initWithCommand:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5;
- (id)description;
- (unint64_t)context;
- (unint64_t)pressCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setPressCount:(unint64_t)a3;
- (void)setPrimaryProfileCommand:(id)a3;
@end

@implementation _VOSProfileSecondaryCommand

+ (id)profileSecondaryCommandWithCommand:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [[_VOSProfileSecondaryCommand alloc] _initWithCommand:v7 context:a4 pressCount:a5];

  return v8;
}

+ (id)profileSecondaryCommandWithStringValue:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5
{
  id v8 = +[VOSCommand builtInCommandWithStringValue:a3];
  if (v8)
  {
    v9 = [a1 profileSecondaryCommandWithCommand:v8 context:a4 pressCount:a5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initWithCommand:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_VOSProfileSecondaryCommand;
  v10 = [(_VOSProfileSecondaryCommand *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_command, a3);
    v11->_context = a4;
    v11->_pressCount = a5;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_VOSProfileSecondaryCommand *)self command];
  id v7 = [v3 stringWithFormat:@"%@<%p>: cmd '%@' context: '%d' pressCount: '%d'", v5, self, v6, -[_VOSProfileSecondaryCommand context](self, "context"), -[_VOSProfileSecondaryCommand pressCount](self, "pressCount")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileSecondaryCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"commandType"];
  if (v5 == 1)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriShortcut"];
    uint64_t v7 = +[VOSCommand commandWithSiriShortcut:v6];
  }
  else
  {
    if (v5)
    {
LABEL_6:
      id v8 = +[VOSCommand Invalid];
      goto LABEL_7;
    }
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    uint64_t v7 = +[VOSCommand builtInCommandWithStringValue:v6];
  }
  id v8 = (void *)v7;

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:
  id v9 = -[_VOSProfileSecondaryCommand _initWithCommand:context:pressCount:](self, "_initWithCommand:context:pressCount:", v8, [v4 decodeIntegerForKey:@"context"], objc_msgSend(v4, "decodeIntegerForKey:", @"pressCount"));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[VOSCommand commandType](self->_command, "commandType"), @"commandType");
  int64_t v4 = [(VOSCommand *)self->_command commandType];
  if (v4 == 1)
  {
    uint64_t v5 = [(VOSCommand *)self->_command siriShortcut];
    v6 = @"siriShortcut";
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = [(VOSCommand *)self->_command rawValue];
    v6 = @"command";
  }
  [v7 encodeObject:v5 forKey:v6];

LABEL_6:
  objc_msgSend(v7, "encodeInteger:forKey:", -[_VOSProfileSecondaryCommand context](self, "context"), @"context");
  objc_msgSend(v7, "encodeInteger:forKey:", -[_VOSProfileSecondaryCommand pressCount](self, "pressCount"), @"pressCount");
}

- (unint64_t)pressCount
{
  if (self->_pressCount <= 1) {
    return 1;
  }
  else {
    return self->_pressCount;
  }
}

- (VOSCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (void)setPressCount:(unint64_t)a3
{
  self->_pressCount = a3;
}

- (_VOSProfileCommand)primaryProfileCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryProfileCommand);

  return (_VOSProfileCommand *)WeakRetained;
}

- (void)setPrimaryProfileCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryProfileCommand);

  objc_storeStrong((id *)&self->_command, 0);
}

@end