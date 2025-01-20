@interface SBSExternalDisplayLayoutElement
+ (id)elementWithIdentifier:(id)a3 presenting:(BOOL)a4;
- (BOOL)sb_isExternalDisplayElement;
- (BOOL)sb_isPresenting;
- (id)succinctDescriptionBuilder;
@end

@implementation SBSExternalDisplayLayoutElement

+ (id)elementWithIdentifier:(id)a3 presenting:(BOOL)a4
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"SBSExternalDisplayLayout.m", 36, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v7 = [[SBSExternalDisplayLayoutElement alloc] initWithIdentifier:v6];
  v8 = [(SBSExternalDisplayLayoutElement *)v7 otherSettings];
  [v8 setObject:@"SBExternal" forSetting:0];

  v9 = [(SBSExternalDisplayLayoutElement *)v7 otherSettings];
  [v9 setFlag:BSSettingFlagForBool() forSetting:1];

  return v7;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)SBSExternalDisplayLayoutElement;
  v3 = [(SBSExternalDisplayLayoutElement *)&v6 succinctDescriptionBuilder];
  id v4 = [v3 appendBool:-[SBSExternalDisplayLayoutElement sb_isPresenting](self, "sb_isPresenting") withName:@"presenting"];
  return v3;
}

- (BOOL)sb_isExternalDisplayElement
{
  v2 = [(SBSExternalDisplayLayoutElement *)self otherSettings];
  v3 = [v2 objectForSetting:0];
  char v4 = [v3 isEqual:@"SBExternal"];

  return v4;
}

- (BOOL)sb_isPresenting
{
  BOOL v3 = [(SBSExternalDisplayLayoutElement *)self sb_isExternalDisplayElement];
  if (v3)
  {
    char v4 = [(SBSExternalDisplayLayoutElement *)self otherSettings];
    char v5 = [v4 BOOLForSetting:1];

    LOBYTE(v3) = v5;
  }
  return v3;
}

@end