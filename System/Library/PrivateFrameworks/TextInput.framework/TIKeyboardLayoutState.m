@interface TIKeyboardLayoutState
+ (BOOL)supportsSecureCoding;
- (BOOL)canMultitap;
- (BOOL)diacriticForwardCompose;
- (BOOL)hasAccentKey;
- (BOOL)hasCandidateKey;
- (BOOL)isAlphabeticPlane;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKanaPlane;
- (NSString)hardwareLayout;
- (NSString)inputMode;
- (NSString)layoutTag;
- (NSString)softwareLayout;
- (TIKeyboardLayoutState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)userInterfaceIdiom;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCanMultitap:(BOOL)a3;
- (void)setDiacriticForwardCompose:(BOOL)a3;
- (void)setHasAccentKey:(BOOL)a3;
- (void)setHasCandidateKey:(BOOL)a3;
- (void)setInputMode:(id)a3;
- (void)setIsAlphabeticPlane:(BOOL)a3;
- (void)setIsKanaPlane:(BOOL)a3;
- (void)setLayoutTag:(id)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
@end

@implementation TIKeyboardLayoutState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutTag, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setLayoutTag:(id)a3
{
}

- (NSString)layoutTag
{
  return self->_layoutTag;
}

- (void)setDiacriticForwardCompose:(BOOL)a3
{
  self->_diacriticForwardCompose = a3;
}

- (BOOL)diacriticForwardCompose
{
  return self->_diacriticForwardCompose;
}

- (void)setIsKanaPlane:(BOOL)a3
{
  self->_isKanaPlane = a3;
}

- (BOOL)isKanaPlane
{
  return self->_isKanaPlane;
}

- (void)setIsAlphabeticPlane:(BOOL)a3
{
  self->_isAlphabeticPlane = a3;
}

- (BOOL)isAlphabeticPlane
{
  return self->_isAlphabeticPlane;
}

- (void)setCanMultitap:(BOOL)a3
{
  self->_canMultitap = a3;
}

- (BOOL)canMultitap
{
  return self->_canMultitap;
}

- (void)setHasAccentKey:(BOOL)a3
{
  self->_hasAccentKey = a3;
}

- (BOOL)hasAccentKey
{
  return self->_hasAccentKey;
}

- (void)setHasCandidateKey:(BOOL)a3
{
  self->_hasCandidateKey = a3;
}

- (BOOL)hasCandidateKey
{
  return self->_hasCandidateKey;
}

- (void)setInputMode:(id)a3
{
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (NSString)hardwareLayout
{
  v2 = [(TIKeyboardLayoutState *)self inputMode];
  v3 = TIInputModeGetComponentsFromIdentifier(v2);
  v4 = [v3 objectForKeyedSubscript:@"hw"];

  return (NSString *)v4;
}

- (NSString)softwareLayout
{
  v2 = [(TIKeyboardLayoutState *)self inputMode];
  v3 = TIInputModeGetComponentsFromIdentifier(v2);
  v4 = [v3 objectForKeyedSubscript:@"sw"];

  return (NSString *)v4;
}

- (unint64_t)hash
{
  if ([(TIKeyboardLayoutState *)self hasCandidateKey]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | [(TIKeyboardLayoutState *)self hasAccentKey];
  if ([(TIKeyboardLayoutState *)self canMultitap]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | (4 * v4) | [(TIKeyboardLayoutState *)self isAlphabeticPlane];
  if ([(TIKeyboardLayoutState *)self isKanaPlane]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | (4 * v6) | [(TIKeyboardLayoutState *)self diacriticForwardCompose];
  int64_t v9 = 257 * ([(TIKeyboardLayoutState *)self userInterfaceIdiom] & 3 | (4 * v8));
  v10 = [(TIKeyboardLayoutState *)self inputMode];
  int64_t v11 = v9 + [v10 hash];

  v12 = [(TIKeyboardLayoutState *)self layoutTag];
  unint64_t v13 = 257 * v11 + [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(TIKeyboardLayoutState *)self inputMode];
    uint64_t v7 = [v5 inputMode];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      int64_t v9 = [(TIKeyboardLayoutState *)self inputMode];
      v10 = [v5 inputMode];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_15;
      }
    }
    int v13 = [(TIKeyboardLayoutState *)self hasCandidateKey];
    if (v13 != [v5 hasCandidateKey]) {
      goto LABEL_15;
    }
    int v14 = [(TIKeyboardLayoutState *)self hasAccentKey];
    if (v14 != [v5 hasAccentKey]) {
      goto LABEL_15;
    }
    int v15 = [(TIKeyboardLayoutState *)self canMultitap];
    if (v15 != [v5 canMultitap]) {
      goto LABEL_15;
    }
    int v16 = [(TIKeyboardLayoutState *)self isAlphabeticPlane];
    if (v16 != [v5 isAlphabeticPlane]) {
      goto LABEL_15;
    }
    int v17 = [(TIKeyboardLayoutState *)self isKanaPlane];
    if (v17 != [v5 isKanaPlane]) {
      goto LABEL_15;
    }
    int v18 = [(TIKeyboardLayoutState *)self diacriticForwardCompose];
    if (v18 != [v5 diacriticForwardCompose]) {
      goto LABEL_15;
    }
    v19 = [(TIKeyboardLayoutState *)self layoutTag];
    uint64_t v20 = [v5 layoutTag];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(TIKeyboardLayoutState *)self layoutTag];
      v23 = [v5 layoutTag];
      int v24 = [v22 isEqualToString:v23];

      if (!v24)
      {
LABEL_15:
        BOOL v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    int64_t v26 = [(TIKeyboardLayoutState *)self userInterfaceIdiom];
    BOOL v12 = v26 == [v5 userInterfaceIdiom];
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(TIKeyboardLayoutState *)self inputMode];
  [v3 appendFormat:@"; inputMode = %@", v4];

  if ([(TIKeyboardLayoutState *)self hasCandidateKey]) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; hasCandidateKey = %s", v5);
  if ([(TIKeyboardLayoutState *)self hasAccentKey]) {
    uint64_t v6 = "YES";
  }
  else {
    uint64_t v6 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; hasAccentKey = %s", v6);
  if ([(TIKeyboardLayoutState *)self canMultitap]) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; canMultitap = %s", v7);
  if ([(TIKeyboardLayoutState *)self isAlphabeticPlane]) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; isAlphabeticPlane = %s", v8);
  if ([(TIKeyboardLayoutState *)self isKanaPlane]) {
    int64_t v9 = "YES";
  }
  else {
    int64_t v9 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; isKanaPlane = %s", v9);
  if ([(TIKeyboardLayoutState *)self diacriticForwardCompose]) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; diacriticForwardCompose = %s", v10);
  int v11 = [(TIKeyboardLayoutState *)self layoutTag];

  if (v11)
  {
    BOOL v12 = [(TIKeyboardLayoutState *)self layoutTag];
    [v3 appendFormat:@"; layoutTag = %@", v12];
  }
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  inputMode = self->_inputMode;
  id v8 = v4;
  if (inputMode)
  {
    [v4 encodeObject:inputMode forKey:@"inputMode"];
    id v4 = v8;
  }
  if (self->_hasCandidateKey)
  {
    [v8 encodeBool:1 forKey:@"hasCandidateKey"];
    id v4 = v8;
  }
  if (self->_hasAccentKey)
  {
    [v8 encodeBool:1 forKey:@"hasAccentKey"];
    id v4 = v8;
  }
  if (self->_canMultitap)
  {
    [v8 encodeBool:1 forKey:@"canMultitap"];
    id v4 = v8;
  }
  if (self->_isAlphabeticPlane)
  {
    [v8 encodeBool:1 forKey:@"isAlphabeticPlane"];
    id v4 = v8;
  }
  if (self->_isKanaPlane)
  {
    [v8 encodeBool:1 forKey:@"isKanaPlane"];
    id v4 = v8;
  }
  if (self->_diacriticForwardCompose)
  {
    [v8 encodeBool:1 forKey:@"diacriticForwardCompose"];
    id v4 = v8;
  }
  layoutTag = self->_layoutTag;
  if (layoutTag)
  {
    [v8 encodeObject:layoutTag forKey:@"layoutTag"];
    id v4 = v8;
  }
  int64_t userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom)
  {
    [v8 encodeInt:userInterfaceIdiom forKey:@"userInterfaceIdiom"];
    id v4 = v8;
  }
}

- (TIKeyboardLayoutState)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardLayoutState;
  id v5 = [(TIKeyboardLayoutState *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputMode"];
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v6;

    v5->_hasCandidateKey = [v4 decodeBoolForKey:@"hasCandidateKey"];
    v5->_hasAccentKey = [v4 decodeBoolForKey:@"hasAccentKey"];
    v5->_canMultitap = [v4 decodeBoolForKey:@"canMultitap"];
    v5->_isAlphabeticPlane = [v4 decodeBoolForKey:@"isAlphabeticPlane"];
    v5->_isKanaPlane = [v4 decodeBoolForKey:@"isKanaPlane"];
    v5->_diacriticForwardCompose = [v4 decodeBoolForKey:@"diacriticForwardCompose"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutTag"];
    layoutTag = v5->_layoutTag;
    v5->_layoutTag = (NSString *)v8;

    v5->_int64_t userInterfaceIdiom = (int)[v4 decodeIntForKey:@"userInterfaceIdiom"];
    v10 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(TIKeyboardLayoutState);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_inputMode copyWithZone:a3];
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v6;

    v5->_hasCandidateKey = self->_hasCandidateKey;
    v5->_hasAccentKey = self->_hasAccentKey;
    v5->_canMultitap = self->_canMultitap;
    v5->_isAlphabeticPlane = self->_isAlphabeticPlane;
    v5->_isKanaPlane = self->_isKanaPlane;
    v5->_diacriticForwardCompose = self->_diacriticForwardCompose;
    uint64_t v8 = [(NSString *)self->_layoutTag copyWithZone:a3];
    layoutTag = v5->_layoutTag;
    v5->_layoutTag = (NSString *)v8;

    v5->_int64_t userInterfaceIdiom = self->_userInterfaceIdiom;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end