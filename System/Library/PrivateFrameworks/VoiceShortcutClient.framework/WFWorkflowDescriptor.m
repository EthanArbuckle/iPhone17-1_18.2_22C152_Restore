@interface WFWorkflowDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGImage)iconImage;
- (NSString)associatedAppBundleIdentifier;
- (NSString)description;
- (NSString)name;
- (WFColor)backgroundColor;
- (WFWorkflowDescriptor)initWithCoder:(id)a3;
- (WFWorkflowDescriptor)initWithIdentifier:(id)a3 name:(id)a4 color:(int64_t)a5 glyphCharacter:(unsigned __int16)a6 associatedAppBundleIdentifier:(id)a7;
- (double)iconImageScale;
- (id)externalURLForViewing;
- (int64_t)color;
- (unint64_t)hash;
- (unsigned)glyphCharacter;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIconImage:(CGImage *)a3 scale:(double)a4;
@end

@implementation WFWorkflowDescriptor

- (WFColor)backgroundColor
{
  int64_t v2 = [(WFWorkflowDescriptor *)self color];
  return +[WFColor colorWithRGBAValue:v2];
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowDescriptor;
  unint64_t v3 = [(WFDatabaseObjectDescriptor *)&v12 hash];
  v4 = [(WFWorkflowDescriptor *)self name];
  uint64_t v5 = [v4 hash];
  int64_t v6 = v5 ^ [(WFWorkflowDescriptor *)self color];
  int64_t v7 = v6 ^ [(WFWorkflowDescriptor *)self glyphCharacter];
  v8 = [(WFWorkflowDescriptor *)self associatedAppBundleIdentifier];
  v9 = v8;
  if (!v8) {
    v8 = &stru_1F0C7EBE0;
  }
  unint64_t v10 = v7 ^ [(__CFString *)v8 hash] ^ v3;

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)color
{
  return self->_color;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (WFWorkflowDescriptor)initWithIdentifier:(id)a3 name:(id)a4 color:(int64_t)a5 glyphCharacter:(unsigned __int16)a6 associatedAppBundleIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFWorkflowDescriptor.m", 25, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"WFWorkflowDescriptor.m", 26, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowDescriptor;
  v16 = [(WFDatabaseObjectDescriptor *)&v25 initWithIdentifier:v13 objectType:0];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v16->_color = a5;
    v16->_glyphCharacter = a6;
    uint64_t v19 = [v15 copy];
    associatedAppBundleIdentifier = v16->_associatedAppBundleIdentifier;
    v16->_associatedAppBundleIdentifier = (NSString *)v19;

    v21 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (double)iconImageScale
{
  return self->_iconImageScale;
}

- (CGImage)iconImage
{
  return self->_iconImage;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFWorkflowDescriptor;
  id v4 = a3;
  [(WFDatabaseObjectDescriptor *)&v9 encodeWithCoder:v4];
  uint64_t v5 = [(WFWorkflowDescriptor *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFWorkflowDescriptor color](self, "color"));
  [v4 encodeObject:v6 forKey:@"color"];

  int64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[WFWorkflowDescriptor glyphCharacter](self, "glyphCharacter"));
  [v4 encodeObject:v7 forKey:@"glyphCharacter"];

  v8 = [(WFWorkflowDescriptor *)self associatedAppBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"associatedAppBundleIdentifier"];
}

- (WFWorkflowDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowDescriptor;
  uint64_t v5 = [(WFDatabaseObjectDescriptor *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    v5->_color = [v8 integerValue];

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"glyphCharacter"];
    v5->_glyphCharacter = [v9 unsignedLongValue];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAppBundleIdentifier"];
    associatedAppBundleIdentifier = v5->_associatedAppBundleIdentifier;
    v5->_associatedAppBundleIdentifier = (NSString *)v10;

    objc_super v12 = v5;
  }

  return v5;
}

- (void)setIconImage:(CGImage *)a3 scale:(double)a4
{
  self->_iconImage = CGImageRetain(a3);
  self->_iconImageScale = a4;
}

- (void)dealloc
{
  CGImageRelease(self->_iconImage);
  v3.receiver = self;
  v3.super_class = (Class)WFWorkflowDescriptor;
  [(WFWorkflowDescriptor *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDatabaseObjectDescriptor *)self identifier];
  int64_t v7 = [(WFWorkflowDescriptor *)self name];
  v8 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, name: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFWorkflowDescriptor *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23.receiver = self;
      v23.super_class = (Class)WFWorkflowDescriptor;
      if ([(WFDatabaseObjectDescriptor *)&v23 isEqual:v4])
      {
        uint64_t v5 = [(WFWorkflowDescriptor *)self name];
        uint64_t v6 = [(WFWorkflowDescriptor *)v4 name];
        id v7 = v5;
        id v8 = v6;
        objc_super v9 = v8;
        if (v7 == v8)
        {
        }
        else
        {
          BOOL v10 = 0;
          v11 = v8;
          id v12 = v7;
          if (!v7 || !v8) {
            goto LABEL_27;
          }
          int v13 = [v7 isEqualToString:v8];

          if (!v13)
          {
LABEL_19:
            BOOL v10 = 0;
LABEL_28:

            goto LABEL_29;
          }
        }
        int64_t v14 = [(WFWorkflowDescriptor *)self color];
        if (v14 != [(WFWorkflowDescriptor *)v4 color]) {
          goto LABEL_19;
        }
        int v15 = [(WFWorkflowDescriptor *)self glyphCharacter];
        if (v15 != [(WFWorkflowDescriptor *)v4 glyphCharacter]) {
          goto LABEL_19;
        }
        v16 = [(WFWorkflowDescriptor *)self associatedAppBundleIdentifier];
        uint64_t v17 = [(WFWorkflowDescriptor *)v4 associatedAppBundleIdentifier];
        id v12 = v16;
        id v18 = v17;
        v11 = v18;
        if (v12 == v18)
        {
          BOOL v10 = 1;
          v20 = v12;
          v21 = v12;
        }
        else
        {
          if (v12 && v18)
          {
            char v19 = [v12 isEqualToString:v18];

            if (v19)
            {
              BOOL v10 = 1;
LABEL_27:

              goto LABEL_28;
            }
          }
          else
          {
          }
          v21 = [(WFWorkflowDescriptor *)self associatedAppBundleIdentifier];
          if ([v21 length])
          {
            BOOL v10 = 0;
LABEL_26:

            goto LABEL_27;
          }
          v20 = [(WFWorkflowDescriptor *)v4 associatedAppBundleIdentifier];
          BOOL v10 = [v20 length] == 0;
        }

        goto LABEL_26;
      }
    }
    BOOL v10 = 0;
  }
LABEL_29:

  return v10;
}

- (id)externalURLForViewing
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSString;
  uint64_t v5 = [(WFWorkflowDescriptor *)self name];
  uint64_t v6 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];
  id v8 = [(WFDatabaseObjectDescriptor *)self identifier];
  objc_super v9 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  BOOL v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v9];
  v11 = [v4 stringWithFormat:@"shortcuts://open-shortcut?name=%@&id=%@", v7, v10];
  id v12 = [v3 URLWithString:v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end