@interface TVRCKeyboardState
+ (BOOL)supportsSecureCoding;
+ (id)keyboardStateFromDevice:(id)a3;
- (BOOL)isEditing;
- (NSString)text;
- (TVRCKeyboardAttributes)attributes;
- (TVRCKeyboardState)initWithCoder:(id)a3;
- (TVRCKeyboardState)initWithDevice:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation TVRCKeyboardState

+ (id)keyboardStateFromDevice:(id)a3
{
  id v3 = a3;
  v4 = [[TVRCKeyboardState alloc] initWithDevice:v3];

  return v4;
}

- (TVRCKeyboardState)initWithDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TVRCKeyboardState;
  v5 = [(TVRCKeyboardState *)&v12 init];
  if (v5)
  {
    v6 = [v4 keyboardController];
    v5->_isEditing = [v6 isEditing];
    uint64_t v7 = [v6 text];
    text = v5->_text;
    v5->_text = (NSString *)v7;

    uint64_t v9 = [v6 attributes];
    attributes = v5->_attributes;
    v5->_attributes = (TVRCKeyboardAttributes *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCKeyboardState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCKeyboardState;
  v5 = [(TVRCKeyboardState *)&v11 init];
  if (v5)
  {
    v5->_isEditing = [v4 decodeBoolForKey:@"isEditing"];
    uint64_t v6 = [v4 decodeObjectForKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (TVRCKeyboardAttributes *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isEditing = self->_isEditing;
  id v5 = a3;
  [v5 encodeBool:isEditing forKey:@"isEditing"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeObject:self->_attributes forKey:@"attributes"];
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; BOOL isEditing = %d", self->_isEditing);
  [v3 appendFormat:@"; text = %@", self->_text];
  [v3 appendString:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_BOOL isEditing = a3;
}

- (TVRCKeyboardAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end