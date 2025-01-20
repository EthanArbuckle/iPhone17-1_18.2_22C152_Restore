@interface SBSUnlockOptions
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)_aboveOtherContexts;
- (NSString)subtitle;
- (NSString)title;
- (SBSUnlockOptions)initWithBSXPCCoder:(id)a3;
- (SBSUnlockOptions)initWithXPCDictionary:(id)a3;
- (void)_setAboveOtherContexts:(BOOL)a3;
- (void)_setSubtitle:(id)a3;
- (void)_setTitle:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSUnlockOptions

- (SBSUnlockOptions)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSUnlockOptions;
  v5 = [(SBSUnlockOptions *)&v13 init];
  if (v5)
  {
    v5->_aboveOtherContexts = xpc_dictionary_get_BOOL(v4, (const char *)[@"aboveOtherContexts" UTF8String]);
    string = xpc_dictionary_get_string(v4, (const char *)[@"title" UTF8String]);
    if (string)
    {
      uint64_t v7 = [NSString stringWithUTF8String:string];
      title = v5->_title;
      v5->_title = (NSString *)v7;
    }
    v9 = xpc_dictionary_get_string(v4, (const char *)[@"subtitle" UTF8String]);
    if (v9)
    {
      uint64_t v10 = [NSString stringWithUTF8String:v9];
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v10;
    }
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"aboveOtherContexts" UTF8String], self->_aboveOtherContexts);
  id v4 = [(SBSUnlockOptions *)self title];

  if (v4)
  {
    id v5 = [(SBSUnlockOptions *)self title];
    v6 = (const char *)[v5 UTF8String];

    xpc_dictionary_set_string(xdict, (const char *)[@"title" UTF8String], v6);
  }
  uint64_t v7 = [(SBSUnlockOptions *)self subtitle];

  if (v7)
  {
    id v8 = [(SBSUnlockOptions *)self subtitle];
    v9 = (const char *)[v8 UTF8String];

    xpc_dictionary_set_string(xdict, (const char *)[@"subtitle" UTF8String], v9);
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeBool:self->_aboveOtherContexts forKey:@"aboveOtherContexts"];
  id v4 = [(SBSUnlockOptions *)self title];

  if (v4)
  {
    id v5 = [(SBSUnlockOptions *)self title];
    [v8 encodeObject:v5 forKey:@"title"];
  }
  v6 = [(SBSUnlockOptions *)self subtitle];

  if (v6)
  {
    uint64_t v7 = [(SBSUnlockOptions *)self subtitle];
    [v8 encodeObject:v7 forKey:@"subtitle"];
  }
}

- (SBSUnlockOptions)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSUnlockOptions;
  id v5 = [(SBSUnlockOptions *)&v9 init];
  if (v5)
  {
    v5->_aboveOtherContexts = [v4 decodeBoolForKey:@"aboveOtherContexts"];
    v6 = [v4 decodeStringForKey:@"title"];
    [(SBSUnlockOptions *)v5 _setTitle:v6];

    uint64_t v7 = [v4 decodeStringForKey:@"subtitle"];
    [(SBSUnlockOptions *)v5 _setSubtitle:v7];
  }
  return v5;
}

- (BOOL)_aboveOtherContexts
{
  return self->_aboveOtherContexts;
}

- (void)_setAboveOtherContexts:(BOOL)a3
{
  self->_aboveOtherContexts = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)_setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)_setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end