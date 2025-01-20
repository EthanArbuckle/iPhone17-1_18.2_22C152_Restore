@interface WBSReaderFont
+ (WBSReaderFont)fontWithFamilyName:(id)a3 displayName:(id)a4;
+ (WBSReaderFont)systemFont;
+ (WBSReaderFont)systemSerifFont;
+ (id)systemFontWithDisplayName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)familyNameForWebContent;
- (__CTFontDescriptor)_createFontDescriptorRefForFontFamilyName:(id)a3 restrictToEnabled:(BOOL)a4;
- (id)_initWithFamilyName:(id)a3 displayName:(id)a4 type:(int64_t)a5;
- (id)_localizedName;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation WBSReaderFont

+ (WBSReaderFont)systemFont
{
  return (WBSReaderFont *)[a1 systemFontWithDisplayName:@"San Francisco"];
}

+ (id)systemFontWithDisplayName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithFamilyName:@"System" displayName:v4 type:1];

  return v5;
}

+ (WBSReaderFont)systemSerifFont
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithFamilyName:@"System Serif" displayName:@"New York" type:2];
  return (WBSReaderFont *)v2;
}

+ (WBSReaderFont)fontWithFamilyName:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) _initWithFamilyName:v6 displayName:v7 type:0];

  return (WBSReaderFont *)v8;
}

- (id)_initWithFamilyName:(id)a3 displayName:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSReaderFont;
  v10 = [(WBSReaderFont *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    familyName = v10->_familyName;
    v10->_familyName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v13;

    v10->_type = a5;
    v15 = v10;
  }

  return v10;
}

- (NSString)familyNameForWebContent
{
  if (self->_type > 1uLL) {
    v2 = @"ui-serif";
  }
  else {
    v2 = self->_familyName;
  }
  return (NSString *)v2;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (displayName)
  {
    v3 = displayName;
  }
  else
  {
    v3 = [(WBSReaderFont *)self _localizedName];
  }
  return v3;
}

- (BOOL)isInstalled
{
  if ((unint64_t)(self->_type - 1) < 2) {
    return 1;
  }
  v3 = [(WBSReaderFont *)self _createFontDescriptorRefForFontFamilyName:self->_familyName restrictToEnabled:1];
  BOOL v2 = v3 != 0;

  return v2;
}

- (id)_localizedName
{
  if (self->_hasCalculatedLocalizedName)
  {
    p_localizedName = &self->_localizedName;
  }
  else
  {
    id v4 = [(WBSReaderFont *)self _createFontDescriptorRefForFontFamilyName:self->_familyName restrictToEnabled:0];
    if (v4)
    {
      v5 = v4;
      id v6 = (NSString *)CTFontDescriptorCopyLocalizedAttribute(v4, (CFStringRef)*MEMORY[0x1E4F24538], 0);
      localizedName = self->_localizedName;
      self->_localizedName = v6;

      CFRelease(v5);
    }
    p_localizedName = &self->_localizedName;
    if (![(NSString *)self->_localizedName length]) {
      objc_storeStrong((id *)&self->_localizedName, self->_familyName);
    }
    self->_hasCalculatedLocalizedName = 1;
  }
  id v8 = *p_localizedName;
  return v8;
}

- (__CTFontDescriptor)_createFontDescriptorRefForFontFamilyName:(id)a3 restrictToEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v6 setObject:self->_familyName forKeyedSubscript:*MEMORY[0x1E4F24538]];
  if (v4) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F24528]];
  }
  id v7 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v6);
  id v8 = v7;
  if (v7)
  {
    MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v7, 0);
    CFRelease(v8);
  }
  else
  {
    MatchingFontDescriptor = 0;
  }

  return MatchingFontDescriptor;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (WBSReaderFont *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(WBSReaderFont *)self familyName];
      id v7 = [(WBSReaderFont *)v5 familyName];
      if (WBSIsEqual())
      {
        id v8 = [(WBSReaderFont *)self displayName];
        id v9 = [(WBSReaderFont *)v5 displayName];
        if (WBSIsEqual()) {
          BOOL v10 = self->_type == v5->_type;
        }
        else {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WBSReaderFont *)self familyName];
  uint64_t v4 = [v3 hash];
  v5 = [(WBSReaderFont *)self displayName];
  unint64_t v6 = [v5 hash] ^ v4 ^ self->_type;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t type = self->_type;
  unint64_t v6 = @"Named";
  if (type == 1) {
    unint64_t v6 = @"System";
  }
  if (type == 2) {
    id v7 = @"System Serif";
  }
  else {
    id v7 = v6;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; familyName = \"%@\"; displayName = \"%@\"; int64_t type = \"%@\">",
    v4,
    self,
    self->_familyName,
    self->_displayName,
  id v8 = v7);
  return v8;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end