@interface PRPosterAmbientConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)allowedEditingContentStyleClasses;
+ (id)decodeObjectWithJSON:(id)a3;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAmbientConfiguration:(id)a3;
- (BOOL)needsAuthentication;
- (NSString)attributeType;
- (NSString)description;
- (NSString)displayNameSystemSymbolName;
- (NSString)editingSystemSymbolName;
- (PRPosterAmbientConfiguration)init;
- (PRPosterAmbientConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterAmbientConfiguration)initWithCoder:(id)a3;
- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3;
- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6;
- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 galleryDisplayBehavior:(int64_t)a7;
- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 galleryDisplayBehavior:(int64_t)a7 isHidden:(BOOL)a8 needsAuthentication:(BOOL)a9 displayOrder:(int64_t)a10;
- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 isHidden:(BOOL)a7 needsAuthentication:(BOOL)a8;
- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 isHidden:(BOOL)a7 needsAuthentication:(BOOL)a8 displayOrder:(int64_t)a9;
- (PRPosterContentStyle)editingContentStyle;
- (id)encodeJSON;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)creationBehavior;
- (int64_t)deletionBehavior;
- (int64_t)displayOrder;
- (int64_t)editingBehavior;
- (int64_t)galleryDisplayBehavior;
- (int64_t)supportedDataLayout;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationBehavior:(int64_t)a3;
- (void)setDeletionBehavior:(int64_t)a3;
- (void)setDisplayNameSystemSymbolName:(id)a3;
- (void)setDisplayOrder:(int64_t)a3;
- (void)setEditingBehavior:(int64_t)a3;
- (void)setEditingContentStyle:(id)a3;
- (void)setEditingSystemSymbolName:(id)a3;
- (void)setGalleryDisplayBehavior:(int64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setSupportedDataLayout:(int64_t)a3;
@end

@implementation PRPosterAmbientConfiguration

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3
{
  return [(PRPosterAmbientConfiguration *)self initWithSupportedDataLayout:a3 creationBehavior:0 editingBehavior:1 deletionBehavior:2];
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6
{
  return [(PRPosterAmbientConfiguration *)self initWithSupportedDataLayout:a3 creationBehavior:a4 editingBehavior:a5 deletionBehavior:a6 galleryDisplayBehavior:0];
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 galleryDisplayBehavior:(int64_t)a7
{
  LOBYTE(v8) = 0;
  return [(PRPosterAmbientConfiguration *)self initWithSupportedDataLayout:a3 creationBehavior:a4 editingBehavior:a5 deletionBehavior:a6 galleryDisplayBehavior:a7 isHidden:0 needsAuthentication:v8 displayOrder:0x7FFFFFFFLL];
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 isHidden:(BOOL)a7 needsAuthentication:(BOOL)a8
{
  return [(PRPosterAmbientConfiguration *)self initWithSupportedDataLayout:a3 creationBehavior:a4 editingBehavior:a5 deletionBehavior:a6 isHidden:0 needsAuthentication:0 displayOrder:0x7FFFFFFFLL];
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 isHidden:(BOOL)a7 needsAuthentication:(BOOL)a8 displayOrder:(int64_t)a9
{
  LOBYTE(v10) = a8;
  return [(PRPosterAmbientConfiguration *)self initWithSupportedDataLayout:a3 creationBehavior:a4 editingBehavior:a5 deletionBehavior:a6 galleryDisplayBehavior:0 isHidden:a7 needsAuthentication:v10 displayOrder:a9];
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 galleryDisplayBehavior:(int64_t)a7 isHidden:(BOOL)a8 needsAuthentication:(BOOL)a9 displayOrder:(int64_t)a10
{
  if ((unint64_t)a5 >= 2)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, @"PRAmbientEditingBehaviorIsValid(editingBehavior)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.5();
    }
LABEL_23:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1F0FC8);
  }
  if ((unint64_t)a4 >= 2)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PRAmbientCreationBehaviorIsValid(creationBehavior)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.4();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1F102CLL);
  }
  if ((unint64_t)a6 >= 3)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PRAmbientDeletionBehaviorIsValid(deletionBehavior)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1F1090);
  }
  if ((unint64_t)a7 >= 2)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PRAmbientGalleryDisplayBehaviorIsValid(galleryDisplayBehavior)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1F10F4);
  }
  if ((unint64_t)a3 >= 4)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PRPosterAmbientSupportedDataLayoutIsValid(supportedDataLayout)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:]();
    }
    goto LABEL_23;
  }
  v21.receiver = self;
  v21.super_class = (Class)PRPosterAmbientConfiguration;
  result = [(PRPosterAmbientConfiguration *)&v21 init];
  if (result)
  {
    result->_supportedDataLayout = a3;
    result->_creationBehavior = a4;
    result->_deletionBehavior = a6;
    result->_editingBehavior = a5;
    result->_galleryDisplayBehavior = a7;
    result->_needsAuthentication = a9;
    result->_hidden = a8;
    result->_displayOrder = a10;
  }
  return result;
}

- (PRPosterAmbientConfiguration)init
{
  return [(PRPosterAmbientConfiguration *)self initWithSupportedDataLayout:0];
}

- (PRPosterAmbientConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"supportedDataLayout"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"creationBehavior"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"deletionBehavior"];
  uint64_t v8 = [v4 decodeInt64ForKey:@"editingBehavior"];
  uint64_t v9 = [v4 decodeInt64ForKey:@"galleryDisplayBehavior"];
  uint64_t v10 = [v4 decodeBoolForKey:@"hidden"];
  LOBYTE(v19) = [v4 decodeBoolForKey:@"needsAuthentication"];
  v11 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", v5, v6, v8, v7, v9, v10, v19, [v4 decodeInt64ForKey:@"displayOrder"]);
  v12 = self;
  v13 = [v4 decodeObjectOfClass:v12 forKey:@"displayNameSystemSymbolName"];

  [(PRPosterAmbientConfiguration *)v11 setDisplayNameSystemSymbolName:v13];
  v14 = self;
  v15 = [v4 decodeObjectOfClass:v14 forKey:@"editingSystemSymbolName"];

  [(PRPosterAmbientConfiguration *)v11 setEditingSystemSymbolName:v15];
  v16 = +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses];
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"editingContentStyle"];

  [(PRPosterAmbientConfiguration *)v11 setEditingContentStyle:v17];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"), @"supportedDataLayout");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"), @"creationBehavior");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"), @"deletionBehavior");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"), @"editingBehavior");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"), @"galleryDisplayBehavior");
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration hidden](self, "hidden"), @"hidden");
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"), @"needsAuthentication");
  id v4 = [(PRPosterAmbientConfiguration *)self displayNameSystemSymbolName];
  [v7 encodeObject:v4 forKey:@"displayNameSystemSymbolName"];

  uint64_t v5 = [(PRPosterAmbientConfiguration *)self editingSystemSymbolName];
  [v7 encodeObject:v5 forKey:@"editingSystemSymbolName"];

  uint64_t v6 = [(PRPosterAmbientConfiguration *)self editingContentStyle];
  [v7 encodeObject:v6 forKey:@"editingContentStyle"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"), @"displayOrder");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(PRPosterAmbientConfiguration *)[PRMutablePosterAmbientConfiguration alloc] initWithSupportedDataLayout:self->_supportedDataLayout];
  [(PRPosterAmbientConfiguration *)v4 setCreationBehavior:self->_creationBehavior];
  [(PRPosterAmbientConfiguration *)v4 setDeletionBehavior:self->_deletionBehavior];
  [(PRPosterAmbientConfiguration *)v4 setEditingBehavior:self->_editingBehavior];
  [(PRPosterAmbientConfiguration *)v4 setGalleryDisplayBehavior:self->_galleryDisplayBehavior];
  [(PRPosterAmbientConfiguration *)v4 setHidden:self->_hidden];
  [(PRPosterAmbientConfiguration *)v4 setNeedsAuthentication:self->_needsAuthentication];
  [(PRPosterAmbientConfiguration *)v4 setDisplayNameSystemSymbolName:self->_displayNameSystemSymbolName];
  [(PRPosterAmbientConfiguration *)v4 setEditingSystemSymbolName:self->_editingSystemSymbolName];
  [(PRPosterAmbientConfiguration *)v4 setEditingContentStyle:self->_editingContentStyle];
  [(PRPosterAmbientConfiguration *)v4 setDisplayOrder:self->_displayOrder];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterAmbientConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PRPosterAmbientConfiguration *)self isEqualToAmbientConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToAmbientConfiguration:(id)a3
{
  id v4 = (PRPosterAmbientConfiguration *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v20 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_14;
    }
    int64_t v6 = [(PRPosterAmbientConfiguration *)self supportedDataLayout];
    if (v6 != [(PRPosterAmbientConfiguration *)v5 supportedDataLayout]) {
      goto LABEL_14;
    }
    int64_t v7 = [(PRPosterAmbientConfiguration *)self creationBehavior];
    if (v7 == [(PRPosterAmbientConfiguration *)v5 creationBehavior]
      && (int64_t v8 = [(PRPosterAmbientConfiguration *)self deletionBehavior],
          v8 == [(PRPosterAmbientConfiguration *)v5 deletionBehavior])
      && (int64_t v9 = [(PRPosterAmbientConfiguration *)self editingBehavior],
          v9 == [(PRPosterAmbientConfiguration *)v5 editingBehavior])
      && (int64_t v10 = [(PRPosterAmbientConfiguration *)self galleryDisplayBehavior],
          v10 == [(PRPosterAmbientConfiguration *)v5 galleryDisplayBehavior])
      && (BOOL v11 = [(PRPosterAmbientConfiguration *)self hidden],
          v11 == [(PRPosterAmbientConfiguration *)v5 hidden])
      && (BOOL v12 = [(PRPosterAmbientConfiguration *)self needsAuthentication],
          v12 == [(PRPosterAmbientConfiguration *)v5 needsAuthentication])
      && (int64_t v13 = [(PRPosterAmbientConfiguration *)self displayOrder],
          v13 == [(PRPosterAmbientConfiguration *)v5 displayOrder]))
    {
      v14 = [(PRPosterAmbientConfiguration *)self displayNameSystemSymbolName];
      v15 = [(PRPosterAmbientConfiguration *)v5 displayNameSystemSymbolName];
      if (BSEqualObjects())
      {
        v16 = [(PRPosterAmbientConfiguration *)self editingSystemSymbolName];
        v17 = [(PRPosterAmbientConfiguration *)v5 editingSystemSymbolName];
        if (BSEqualObjects())
        {
          v18 = [(PRPosterAmbientConfiguration *)self editingContentStyle];
          uint64_t v19 = [(PRPosterAmbientConfiguration *)v5 editingContentStyle];
          char v20 = BSEqualObjects();
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
LABEL_14:
      char v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"));
  id v5 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"));
  id v6 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"));
  id v7 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"));
  id v8 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"));
  id v9 = (id)objc_msgSend(v3, "appendBool:", -[PRPosterAmbientConfiguration hidden](self, "hidden"));
  id v10 = (id)objc_msgSend(v3, "appendBool:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"));
  BOOL v11 = [(PRPosterAmbientConfiguration *)self displayNameSystemSymbolName];
  id v12 = (id)[v3 appendString:v11];

  int64_t v13 = [(PRPosterAmbientConfiguration *)self editingSystemSymbolName];
  id v14 = (id)[v3 appendString:v13];

  v15 = [(PRPosterAmbientConfiguration *)self editingContentStyle];
  id v16 = (id)[v3 appendObject:v15];

  id v17 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"));
  unint64_t v18 = [v3 hash];

  return v18;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(PRPosterAmbientConfiguration *)self supportedDataLayout];
  if (v4 > 3) {
    id v5 = @"(unknown data layout)";
  }
  else {
    id v5 = off_1E54DB1A0[v4];
  }
  [v3 appendString:v5 withName:@"supportedDataLayout"];
  int64_t v6 = [(PRPosterAmbientConfiguration *)self creationBehavior];
  id v7 = @"(unknown creation behavior)";
  if (v6 == 1) {
    id v7 = @"Manual";
  }
  if (v6) {
    id v8 = v7;
  }
  else {
    id v8 = @"Auto";
  }
  [v3 appendString:v8 withName:@"creationBehavior"];
  unint64_t v9 = [(PRPosterAmbientConfiguration *)self deletionBehavior];
  if (v9 > 2) {
    id v10 = @"(unknown deletion behavior)";
  }
  else {
    id v10 = off_1E54DB1C0[v9];
  }
  [v3 appendString:v10 withName:@"deletionBehavior"];
  int64_t v11 = [(PRPosterAmbientConfiguration *)self editingBehavior];
  id v12 = @"(unknown editing behavior)";
  if (v11 == 1) {
    id v12 = @"NotEditable";
  }
  if (v11) {
    int64_t v13 = v12;
  }
  else {
    int64_t v13 = @"Editable";
  }
  [v3 appendString:v13 withName:@"editingBehavior"];
  int64_t v14 = [(PRPosterAmbientConfiguration *)self galleryDisplayBehavior];
  v15 = @"(unknown gallery display behavior)";
  if (v14 == 1) {
    v15 = @"Hidden";
  }
  if (v14) {
    id v16 = v15;
  }
  else {
    id v16 = @"Visible";
  }
  [v3 appendString:v16 withName:@"galleryDisplayBehavior"];
  id v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[PRPosterAmbientConfiguration hidden](self, "hidden"), @"hidden");
  id v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"), @"needsAuthentication");
  uint64_t v19 = [(PRPosterAmbientConfiguration *)self displayNameSystemSymbolName];
  [v3 appendString:v19 withName:@"displayNameSystemSymbolName" skipIfEmpty:1];

  char v20 = [(PRPosterAmbientConfiguration *)self editingSystemSymbolName];
  [v3 appendString:v20 withName:@"editingSystemSymbolName" skipIfEmpty:1];

  objc_super v21 = [(PRPosterAmbientConfiguration *)self editingContentStyle];
  id v22 = (id)[v3 appendObject:v21 withName:@"editingContentStyle" skipIfNil:1];

  id v23 = (id)objc_msgSend(v3, "appendInt64:withName:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"), @"displayOrder");
  v24 = [v3 build];

  return (NSString *)v24;
}

+ (id)allowedEditingContentStyleClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = self;
  unint64_t v4 = self;
  id v5 = self;
  int64_t v6 = self;
  id v7 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

- (void)setEditingContentStyle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v5 = v4;
    id v4 = 0;
  }

  p_editingContentStyle = &self->_editingContentStyle;
  if ((BSEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_editingContentStyle, v4);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterAmbientConfiguration)initWithBSXPCCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"supportedDataLayout"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"creationBehavior"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"deletionBehavior"];
  uint64_t v8 = [v4 decodeInt64ForKey:@"editingBehavior"];
  uint64_t v9 = [v4 decodeInt64ForKey:@"galleryDisplayBehavior"];
  uint64_t v10 = [v4 decodeBoolForKey:@"hidden"];
  LOBYTE(v22) = [v4 decodeBoolForKey:@"needsAuthentication"];
  long long v11 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", v5, v6, v8, v7, v9, v10, v22, [v4 decodeInt64ForKey:@"displayOrder"]);
  long long v12 = [v4 decodeStringForKey:@"displayNameSystemSymbolName"];
  [(PRPosterAmbientConfiguration *)v11 setDisplayNameSystemSymbolName:v12];
  long long v13 = [v4 decodeStringForKey:@"editingSystemSymbolName"];
  [(PRPosterAmbientConfiguration *)v11 setEditingSystemSymbolName:v13];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [v4 decodeObjectOfClass:*(void *)(*((void *)&v23 + 1) + 8 * i) forKey:@"editingContentStyle"];
        if (v19)
        {
          char v20 = (void *)v19;
          [(PRPosterAmbientConfiguration *)v11 setEditingContentStyle:v19];

          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"), @"supportedDataLayout");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"), @"creationBehavior");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"), @"deletionBehavior");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"), @"editingBehavior");
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"), @"galleryDisplayBehavior");
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration hidden](self, "hidden"), @"hidden");
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"), @"needsAuthentication");
  id v4 = [(PRPosterAmbientConfiguration *)self displayNameSystemSymbolName];
  [v7 encodeObject:v4 forKey:@"displayNameSystemSymbolName"];

  uint64_t v5 = [(PRPosterAmbientConfiguration *)self editingSystemSymbolName];
  [v7 encodeObject:v5 forKey:@"editingSystemSymbolName"];

  uint64_t v6 = [(PRPosterAmbientConfiguration *)self editingContentStyle];
  [v7 encodeObject:v6 forKey:@"editingContentStyle"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"), @"displayOrder");
}

- (id)encodeJSON
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"supportedDataLayout");

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"creationBehavior");

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"deletionBehavior");

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, @"editingBehavior");

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, @"galleryDisplayBehavior");

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PRPosterAmbientConfiguration hidden](self, "hidden"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, @"hidden");

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, @"needsAuthentication");

  long long v11 = [(PRPosterAmbientConfiguration *)self displayNameSystemSymbolName];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v11, @"displayNameSystemSymbolName");

  long long v12 = [(PRPosterAmbientConfiguration *)self editingSystemSymbolName];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v12, @"editingSystemSymbolName");

  long long v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v13, @"displayOrder");

  long long v14 = [(PRPosterAmbientConfiguration *)self editingContentStyle];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
    uint64_t v16 = [v15 base64EncodedStringWithOptions:0];
    objc_msgSend(v3, "bs_setSafeObject:forKey:", v16, @"editingContentStyle");
  }
  uint64_t v17 = [(PRPosterAmbientConfiguration *)self attributeType];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v17, @"attributeType");

  id v22 = 0;
  id v18 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v22];
  id v19 = v22;
  if (v19)
  {
    char v20 = PRLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      [(PRPosterMetadata *)(uint64_t)self encodeJSON];
    }
  }
  return v18;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  id v44 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v44];
  id v4 = v44;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
    {
      uint64_t v5 = [v3 objectForKey:@"supportedDataLayout"];
      uint64_t v6 = v5;
      if (!v5) {
        uint64_t v5 = &unk_1ED9EEC20;
      }
      uint64_t v7 = [v5 integerValue];

      uint64_t v8 = [v3 objectForKey:@"creationBehavior"];
      uint64_t v9 = v8;
      if (!v8) {
        uint64_t v8 = &unk_1ED9EEC20;
      }
      uint64_t v10 = [v8 integerValue];

      long long v11 = [v3 objectForKey:@"deletionBehavior"];
      long long v12 = v11;
      if (!v11) {
        long long v11 = &unk_1ED9EEC38;
      }
      uint64_t v13 = [v11 integerValue];

      long long v14 = [v3 objectForKey:@"editingBehavior"];
      uint64_t v15 = v14;
      if (!v14) {
        long long v14 = &unk_1ED9EEC50;
      }
      uint64_t v16 = [v14 integerValue];

      uint64_t v17 = [v3 objectForKey:@"galleryDisplayBehavior"];
      id v18 = v17;
      if (!v17) {
        uint64_t v17 = &unk_1ED9EEC20;
      }
      uint64_t v19 = [v17 integerValue];

      char v20 = [v3 objectForKey:@"hidden"];
      if (v20)
      {
        objc_super v21 = [v3 objectForKey:@"hidden"];
        unsigned int v43 = [v21 BOOLValue];
      }
      else
      {
        unsigned int v43 = 0;
      }

      long long v24 = [v3 objectForKey:@"needsAuthentication"];
      if (v24)
      {
        long long v25 = [v3 objectForKey:@"needsAuthentication"];
        char v42 = [v25 BOOLValue];
      }
      else
      {
        char v42 = 0;
      }

      long long v26 = [v3 objectForKey:@"displayOrder"];
      if (v26)
      {
        [v3 objectForKey:@"displayOrder"];
        uint64_t v27 = v16;
        uint64_t v28 = v13;
        uint64_t v29 = v10;
        v31 = uint64_t v30 = v7;
        uint64_t v32 = [v31 integerValue];

        uint64_t v7 = v30;
        uint64_t v10 = v29;
        uint64_t v13 = v28;
        uint64_t v16 = v27;
      }
      else
      {
        uint64_t v32 = 0x7FFFFFFFLL;
      }

      LOBYTE(v41) = v42;
      long long v23 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSupportedDataLayout:v7 creationBehavior:v10 editingBehavior:v16 deletionBehavior:v13 galleryDisplayBehavior:v19 isHidden:v43 needsAuthentication:v41 displayOrder:v32];
      id v22 = [v3 objectForKey:@"displayNameSystemSymbolName"];
      [v23 setDisplayNameSystemSymbolName:v22];
      v33 = [v3 objectForKey:@"editingSystemSymbolName"];
      [v23 setEditingSystemSymbolName:v33];
      v34 = [v3 objectForKey:@"editingContentStyle"];
      v35 = self;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v36 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v34 options:0];

        if (!v36)
        {
LABEL_30:

          goto LABEL_31;
        }
        v37 = (void *)MEMORY[0x1E4F28DC0];
        v38 = +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses];
        v39 = [v37 unarchivedObjectOfClasses:v38 fromData:v36 error:0];

        [v23 setEditingContentStyle:v39];
        v35 = (void *)v36;
      }

      goto LABEL_30;
    }
  }
  id v22 = PRLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    +[PRPosterMetadata decodeObjectWithJSON:]((uint64_t)v4, v22);
  }
  long long v23 = 0;
LABEL_31:

  return v23;
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeAmbientConfiguration";
}

- (int64_t)supportedDataLayout
{
  return self->_supportedDataLayout;
}

- (void)setSupportedDataLayout:(int64_t)a3
{
  self->_supportedDataLayout = a3;
}

- (int64_t)creationBehavior
{
  return self->_creationBehavior;
}

- (void)setCreationBehavior:(int64_t)a3
{
  self->_creationBehavior = a3;
}

- (int64_t)deletionBehavior
{
  return self->_deletionBehavior;
}

- (void)setDeletionBehavior:(int64_t)a3
{
  self->_deletionBehavior = a3;
}

- (int64_t)editingBehavior
{
  return self->_editingBehavior;
}

- (void)setEditingBehavior:(int64_t)a3
{
  self->_editingBehavior = a3;
}

- (int64_t)galleryDisplayBehavior
{
  return self->_galleryDisplayBehavior;
}

- (void)setGalleryDisplayBehavior:(int64_t)a3
{
  self->_galleryDisplayBehavior = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (NSString)displayNameSystemSymbolName
{
  return self->_displayNameSystemSymbolName;
}

- (void)setDisplayNameSystemSymbolName:(id)a3
{
}

- (NSString)editingSystemSymbolName
{
  return self->_editingSystemSymbolName;
}

- (void)setEditingSystemSymbolName:(id)a3
{
}

- (PRPosterContentStyle)editingContentStyle
{
  return self->_editingContentStyle;
}

- (int64_t)displayOrder
{
  return self->_displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  self->_displayOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingContentStyle, 0);
  objc_storeStrong((id *)&self->_editingSystemSymbolName, 0);
  objc_storeStrong((id *)&self->_displayNameSystemSymbolName, 0);
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end