@interface UIViewConfigurationState
+ (BOOL)supportsSecureCoding;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFocused;
- (BOOL)isHighlighted;
- (BOOL)isPinned;
- (BOOL)isSelected;
- (NSString)description;
- (UITraitCollection)traitCollection;
- (UIViewConfigurationState)initWithCoder:(NSCoder *)coder;
- (UIViewConfigurationState)initWithTraitCollection:(UITraitCollection *)traitCollection;
- (id)_customStatesForSwiftBridging;
- (id)_initWithState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customStateForKey:(id)a3;
- (int64_t)_contextMenuGroupLocation;
- (unint64_t)_mutations;
- (unint64_t)_viewConfigurationState;
- (unint64_t)hash;
- (void)_appendPropertiesForDescription:(id)a3;
- (void)_configureWithViewConfigurationState:(unint64_t)a3;
- (void)_setContextMenuGroupLocation:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomState:(id)a3 forKey:(id)a4;
- (void)setDisabled:(BOOL)disabled;
- (void)setFocused:(BOOL)focused;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setPinned:(BOOL)pinned;
- (void)setSelected:(BOOL)selected;
- (void)setTraitCollection:(UITraitCollection *)traitCollection;
@end

@implementation UIViewConfigurationState

- (unint64_t)_mutations
{
  return self->_mutations;
}

- (BOOL)isFocused
{
  return (*(unsigned char *)&self->_stateFlags >> 3) & 1;
}

- (BOOL)isSelected
{
  return (*(unsigned char *)&self->_stateFlags >> 2) & 1;
}

- (BOOL)isDisabled
{
  return *(unsigned char *)&self->_stateFlags & 1;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)isPinned
{
  return (*(unsigned char *)&self->_stateFlags >> 4) & 1;
}

- (id)_customStatesForSwiftBridging
{
  return self->_customStates;
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self) {
    ++self->_mutations;
  }
  customStates = self->_customStates;
  if (!customStates)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_customStates;
    self->_customStates = v8;

    customStates = self->_customStates;
  }
  [(NSMutableDictionary *)customStates setObject:v10 forKeyedSubscript:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_customStates, 0);
}

- (UIViewConfigurationState)initWithTraitCollection:(UITraitCollection *)traitCollection
{
  id v6 = traitCollection;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIViewConfigurationState.m", 26, @"Invalid parameter not satisfying: %@", @"traitCollection != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIViewConfigurationState;
  v7 = [(UIViewConfigurationState *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_traitCollection, traitCollection);
  }

  return v8;
}

- (void)setFocused:(BOOL)focused
{
  char stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 8) == 0) ^ focused) & 1) == 0)
  {
    ++self->_mutations;
    if (focused) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char stateFlags = stateFlags & 0xF7 | v4;
  }
}

- (void)setDisabled:(BOOL)disabled
{
  char stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 1) == 0) ^ disabled) & 1) == 0)
  {
    ++self->_mutations;
    *(unsigned char *)&self->_char stateFlags = stateFlags & 0xFE | disabled;
  }
}

- (void)setSelected:(BOOL)selected
{
  char stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 4) == 0) ^ selected) & 1) == 0)
  {
    ++self->_mutations;
    if (selected) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char stateFlags = stateFlags & 0xFB | v4;
  }
}

- (void)setHighlighted:(BOOL)highlighted
{
  char stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 2) == 0) ^ highlighted) & 1) == 0)
  {
    ++self->_mutations;
    if (highlighted) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char stateFlags = stateFlags & 0xFD | v4;
  }
}

- (void)_setContextMenuGroupLocation:(int64_t)a3
{
  if (a3 || self->_customStates)
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIViewConfigurationState *)self setCustomState:v4 forKey:@"_UICompactContextMenuGroupLocation"];
  }
}

- (void)setPinned:(BOOL)pinned
{
  char stateFlags = (char)self->_stateFlags;
  if (((((stateFlags & 0x10) == 0) ^ pinned) & 1) == 0)
  {
    ++self->_mutations;
    if (pinned) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char stateFlags = stateFlags & 0xEF | v4;
  }
}

- (unint64_t)_viewConfigurationState
{
  unint64_t v3 = (*(unsigned char *)&self->_stateFlags & 0xC | (__rbit32(*(unsigned char *)&self->_stateFlags) >> 30)) & 0xFFFFFFFFFFFFF7FFLL | ((((unint64_t)(*(unsigned char *)&self->_stateFlags & 0x10) >> 4) & 1) << 11);
  if ([(UIViewConfigurationState *)self _contextMenuGroupLocation]) {
    return v3 & 0xFFFFFFFFFFFF8FFFLL | (([(UIViewConfigurationState *)self _contextMenuGroupLocation] & 7) << 12);
  }
  return v3;
}

- (int64_t)_contextMenuGroupLocation
{
  v2 = [(UIViewConfigurationState *)self customStateForKey:@"_UICompactContextMenuGroupLocation"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)customStateForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_customStates objectForKeyedSubscript:a3];
}

- (BOOL)isHighlighted
{
  return (*(unsigned char *)&self->_stateFlags >> 1) & 1;
}

- (void)_configureWithViewConfigurationState:(unint64_t)a3
{
  [(UIViewConfigurationState *)self setHighlighted:a3 & 1];
  [(UIViewConfigurationState *)self setDisabled:(a3 >> 1) & 1];
  [(UIViewConfigurationState *)self setSelected:(a3 >> 2) & 1];
  [(UIViewConfigurationState *)self setFocused:(a3 >> 3) & 1];
  [(UIViewConfigurationState *)self setPinned:(a3 >> 11) & 1];
  [(UIViewConfigurationState *)self _setContextMenuGroupLocation:(a3 >> 12) & 7];
}

- (id)_initWithState:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIViewConfigurationState.m", 35, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];
  }
  id v6 = [(UIViewConfigurationState *)self initWithTraitCollection:*((void *)v5 + 4)];
  v7 = v6;
  if (v6)
  {
    v6->_char stateFlags = ($B4C1D8677C6CF89FC39FD309BCEF1DC7)*((_DWORD *)v5 + 6);
    uint64_t v8 = [*((id *)v5 + 2) mutableCopy];
    customStates = v7->_customStates;
    v7->_customStates = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithState:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIViewConfigurationState)initWithCoder:(NSCoder *)coder
{
  char v4 = coder;
  id v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"traitCollection"];
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)UIViewConfigurationState;
    id v6 = [(UIViewConfigurationState *)&v15 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_traitCollection, v5);
      *(unsigned char *)&v7->_char stateFlags = *(unsigned char *)&v7->_stateFlags & 0xFE | [(NSCoder *)v4 decodeBoolForKey:@"disabled"];
      if ([(NSCoder *)v4 decodeBoolForKey:@"highlighted"]) {
        char v8 = 2;
      }
      else {
        char v8 = 0;
      }
      *(unsigned char *)&v7->_char stateFlags = *(unsigned char *)&v7->_stateFlags & 0xFD | v8;
      if ([(NSCoder *)v4 decodeBoolForKey:@"selected"]) {
        char v9 = 4;
      }
      else {
        char v9 = 0;
      }
      *(unsigned char *)&v7->_char stateFlags = *(unsigned char *)&v7->_stateFlags & 0xFB | v9;
      if ([(NSCoder *)v4 decodeBoolForKey:@"focused"]) {
        char v10 = 8;
      }
      else {
        char v10 = 0;
      }
      *(unsigned char *)&v7->_char stateFlags = *(unsigned char *)&v7->_stateFlags & 0xF7 | v10;
      if ([(NSCoder *)v4 decodeBoolForKey:@"pinned"]) {
        char v11 = 16;
      }
      else {
        char v11 = 0;
      }
      *(unsigned char *)&v7->_char stateFlags = *(unsigned char *)&v7->_stateFlags & 0xEF | v11;
      if (![(NSCoder *)v4 requiresSecureCoding])
      {
        uint64_t v12 = [(NSCoder *)v4 decodeObjectForKey:@"customStates"];
        customStates = v7->_customStates;
        v7->_customStates = (NSMutableDictionary *)v12;
      }
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_traitCollection forKey:@"traitCollection"];
  [v4 encodeBool:*(unsigned char *)&self->_stateFlags & 1 forKey:@"disabled"];
  [v4 encodeBool:(*(unsigned char *)&self->_stateFlags >> 1) & 1 forKey:@"highlighted"];
  [v4 encodeBool:(*(unsigned char *)&self->_stateFlags >> 2) & 1 forKey:@"selected"];
  [v4 encodeBool:(*(unsigned char *)&self->_stateFlags >> 3) & 1 forKey:@"focused"];
  [v4 encodeBool:(*(unsigned char *)&self->_stateFlags >> 4) & 1 forKey:@"pinned"];
  if (([v4 requiresSecureCoding] & 1) == 0) {
    [v4 encodeObject:self->_customStates forKey:@"customStates"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIViewConfigurationState *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        v7 = v6;
        if (((*(unsigned char *)&v6->_stateFlags ^ *(unsigned char *)&self->_stateFlags) & 0x1F) != 0)
        {
          LOBYTE(v8) = 0;
LABEL_20:

          goto LABEL_21;
        }
        traitCollection = v6->_traitCollection;
        char v10 = self->_traitCollection;
        char v11 = traitCollection;
        if (v10 == v11)
        {
        }
        else
        {
          uint64_t v12 = v11;
          LOBYTE(v8) = 0;
          if (!v10 || !v11)
          {
LABEL_19:

            goto LABEL_20;
          }
          BOOL v8 = [(UITraitCollection *)v10 isEqual:v11];

          if (!v8) {
            goto LABEL_20;
          }
        }
        customStates = self->_customStates;
        v14 = v7->_customStates;
        char v10 = customStates;
        objc_super v15 = v14;
        uint64_t v12 = v15;
        if (v10 == v15)
        {
          LOBYTE(v8) = 1;
        }
        else
        {
          LOBYTE(v8) = 0;
          if (v10 && v15) {
            LOBYTE(v8) = [(UITraitCollection *)v10 isEqual:v15];
          }
        }
        goto LABEL_19;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = *(unsigned char *)&self->_stateFlags & 0x1F;
  unint64_t v4 = [(UITraitCollection *)self->_traitCollection hash] ^ v3;
  return v4 ^ [(NSMutableDictionary *)self->_customStates hash];
}

- (void)_appendPropertiesForDescription:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [NSString stringWithFormat:@"traitCollection = %@", self->_traitCollection];
  [v6 addObject:v4];

  char stateFlags = (char)self->_stateFlags;
  if (stateFlags)
  {
    [v6 addObject:@"Disabled"];
    char stateFlags = (char)self->_stateFlags;
    if ((stateFlags & 2) == 0)
    {
LABEL_3:
      if ((stateFlags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_stateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  [v6 addObject:@"Highlighted"];
  char stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 4) == 0)
  {
LABEL_4:
    if ((stateFlags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v6 addObject:@"Selected"];
  char stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 8) == 0)
  {
LABEL_5:
    if ((stateFlags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v6 addObject:@"Focused"];
  if ((*(unsigned char *)&self->_stateFlags & 0x10) != 0) {
LABEL_6:
  }
    [v6 addObject:@"Pinned"];
LABEL_7:
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(UIViewConfigurationState *)self _appendPropertiesForDescription:v3];
  if (self->_customStates)
  {
    unint64_t v4 = [NSString stringWithFormat:@"Custom = %@", self->_customStates];
    [v3 addObject:v4];
  }
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  BOOL v8 = [v3 componentsJoinedByString:@"; "];
  char v9 = [v5 stringWithFormat:@"<%@: %p; %@>", v7, self, v8];

  return (NSString *)v9;
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  id v6 = traitCollection;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIViewConfigurationState.m", 185, @"Invalid parameter not satisfying: %@", @"traitCollection != nil" object file lineNumber description];

    id v6 = 0;
  }
  if (self->_traitCollection != v6)
  {
    ++self->_mutations;
    BOOL v8 = v6;
    objc_storeStrong((id *)&self->_traitCollection, traitCollection);
    id v6 = v8;
  }
}

@end