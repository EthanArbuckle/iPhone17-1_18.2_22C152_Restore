@interface _VOSProfileKeyChord
+ (BOOL)supportsSecureCoding;
+ (id)profileKeyChordWithKeyChord:(id)a3;
+ (id)profileKeyChordWithStringValue:(id)a3;
- (AXSSKeyChord)keyChord;
- (_VOSProfileCommand)command;
- (_VOSProfileKeyChord)initWithCoder:(id)a3;
- (id)_initWithKeyChord:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setKeyChord:(id)a3;
@end

@implementation _VOSProfileKeyChord

+ (id)profileKeyChordWithKeyChord:(id)a3
{
  id v3 = a3;
  id v4 = [[_VOSProfileKeyChord alloc] _initWithKeyChord:v3];

  return v4;
}

+ (id)profileKeyChordWithStringValue:(id)a3
{
  id v4 = [MEMORY[0x263F220D8] keyChordWithString:a3];
  if (v4)
  {
    v5 = [a1 profileKeyChordWithKeyChord:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithKeyChord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VOSProfileKeyChord;
  v6 = [(_VOSProfileKeyChord *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyChord, a3);
  }

  return v7;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(_VOSProfileKeyChord *)self keyChord];
  v7 = [v6 displayValue];
  v8 = [v3 stringWithFormat:@"%@<%p>: keys '%@'", v5, self, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileKeyChord)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"keyChord"];

  objc_super v9 = [MEMORY[0x263F220D8] keyChordWithKeys:v8];
  v10 = [(_VOSProfileKeyChord *)self _initWithKeyChord:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  keyChord = self->_keyChord;
  id v4 = a3;
  id v5 = [(AXSSKeyChord *)keyChord keys];
  [v4 encodeObject:v5 forKey:@"keyChord"];
}

- (AXSSKeyChord)keyChord
{
  return self->_keyChord;
}

- (void)setKeyChord:(id)a3
{
}

- (_VOSProfileCommand)command
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_command);

  return (_VOSProfileCommand *)WeakRetained;
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_command);

  objc_storeStrong((id *)&self->_keyChord, 0);
}

@end