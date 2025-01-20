@interface WBSStartPageSectionDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (WBSStartPageSectionDescriptor)initWithCoder:(id)a3;
- (WBSStartPageSectionDescriptor)initWithDictionaryRepresentation:(id)a3;
- (WBSStartPageSectionDescriptor)initWithIdentifier:(id)a3 enabled:(BOOL)a4;
- (id)description;
- (id)sectionWithEnabled:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSStartPageSectionDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (WBSStartPageSectionDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  uint64_t v6 = [v4 decodeBoolForKey:@"IsEnabled"];

  if ([v5 length])
  {
    self = [(WBSStartPageSectionDescriptor *)self initWithIdentifier:v5 enabled:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WBSStartPageSectionDescriptor)initWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WBSStartPageSectionDescriptor;
  id v5 = a3;
  uint64_t v6 = [(WBSStartPageSectionDescriptor *)&v10 init];
  uint64_t v7 = objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v7;

  v6->_enabled = a4;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSStartPageSectionDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([(NSString *)self->_identifier isEqualToString:v5->_identifier]) {
        BOOL v6 = self->_enabled == v5->_enabled;
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  BOOL enabled = self->_enabled;
  return [(NSString *)self->_identifier hash] ^ (enabled - 1);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_enabled) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = %@; BOOL enabled = %@>",
               v4,
               self,
               self->_identifier,
               v5);
}

- (id)sectionWithEnabled:(BOOL)a3
{
  if (self->_enabled == a3) {
    v3 = self;
  }
  else {
    v3 = (WBSStartPageSectionDescriptor *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier enabled:a3];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeBool:self->_enabled forKey:@"IsEnabled"];
}

- (WBSStartPageSectionDescriptor)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "safari_stringForKey:", @"Identifier");
  if ([v5 length])
  {
    self = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:](self, "initWithIdentifier:enabled:", v5, objc_msgSend(v4, "safari_BOOLForKey:", @"IsEnabled"));
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v7[2] = *MEMORY[0x1E4F143B8];
  identifier = self->_identifier;
  v6[1] = @"IsEnabled";
  v7[0] = identifier;
  v6[0] = @"Identifier";
  v3 = [NSNumber numberWithBool:self->_enabled];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return (NSDictionary *)v4;
}

- (void).cxx_destruct
{
}

@end