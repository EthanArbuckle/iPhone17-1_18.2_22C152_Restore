@interface _UICursorAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractive;
- (BOOL)isLarge;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (_UICursorAccessory)initWithCoder:(id)a3;
- (double)preferredWidth;
- (id)_deleteCursorAccessory;
- (id)_dictationCursorAccessory;
- (id)_inputModeCursorAccessory;
- (id)_modifierKeyCursorAccessory;
- (id)description;
- (id)descriptionBuilder;
- (unint64_t)hash;
- (unint64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setLarge:(BOOL)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation _UICursorAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"style"];
  [v5 encodeBool:self->_interactive forKey:@"interactive"];
  [v5 encodeBool:self->_large forKey:@"large"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeDouble:@"preferredWidth" forKey:self->_preferredWidth];
  [v5 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
}

- (unint64_t)hash
{
  unint64_t preferredWidth = (unint64_t)self->_preferredWidth;
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  return v4 ^ [(NSString *)self->_groupIdentifier hash] ^ preferredWidth;
}

- (_UICursorAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICursorAccessory *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"preferredWidth"];
    v5->_unint64_t preferredWidth = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

    v5->_interactive = [v4 decodeBoolForKey:@"interactive"];
    v5->_large = [v4 decodeBoolForKey:@"large"];
    v5->_unint64_t style = [v4 decodeIntegerForKey:@"style"];
  }

  return v5;
}

- (id)descriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendFloat:@"preferredWidth" withName:self->_preferredWidth];
  identifier = self->_identifier;
  if (identifier) {
    [v3 appendString:identifier withName:@"identifier"];
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v3 appendString:groupIdentifier withName:@"groupIdentifier"];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UICursorAccessory *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(_UICursorAccessory *)v5 style];
      if (v6 == [(_UICursorAccessory *)self style])
      {
        unint64_t v7 = [(_UICursorAccessory *)self hash];
        BOOL v8 = v7 == [(_UICursorAccessory *)v5 hash];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v2 = [(_UICursorAccessory *)self descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)_inputModeCursorAccessory
{
  return 0;
}

- (id)_dictationCursorAccessory
{
  return 0;
}

- (id)_modifierKeyCursorAccessory
{
  return 0;
}

- (id)_deleteCursorAccessory
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_unint64_t preferredWidth = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)isLarge
{
  return self->_large;
}

- (void)setLarge:(BOOL)a3
{
  self->_large = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end