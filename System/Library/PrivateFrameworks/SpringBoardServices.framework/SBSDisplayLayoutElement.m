@interface SBSDisplayLayoutElement
- (BOOL)isSpringBoardElement;
- (BOOL)sb_isStashedPIP;
- (BOOL)sb_isTransitioning;
- (SBSDisplayLayoutElement)initWithIdentifier:(id)a3 layoutRole:(int64_t)a4;
- (id)succinctDescriptionBuilder;
- (int64_t)layoutRole;
- (void)sb_setStashedPIP:(BOOL)a3;
- (void)sb_setTransitioning:(BOOL)a3;
- (void)setLayoutRole:(int64_t)a3;
@end

@implementation SBSDisplayLayoutElement

- (BOOL)isSpringBoardElement
{
  return 1;
}

- (void)setLayoutRole:(int64_t)a3
{
  id v5 = [(SBSDisplayLayoutElement *)self otherSettings];
  v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v5 setObject:v4 forSetting:1];
}

- (id)succinctDescriptionBuilder
{
  v9.receiver = self;
  v9.super_class = (Class)SBSDisplayLayoutElement;
  v3 = [(SBSDisplayLayoutElement *)&v9 succinctDescriptionBuilder];
  v4 = SBSDisplayLayoutRoleDescription([(SBSDisplayLayoutElement *)self layoutRole]);
  id v5 = (id)[v3 appendObject:v4 withName:@"role"];

  id v6 = (id)[v3 appendBool:-[SBSDisplayLayoutElement sb_isTransitioning](self, "sb_isTransitioning") withName:@"transitioning" ifEqualTo:1];
  id v7 = (id)[v3 appendBool:-[SBSDisplayLayoutElement sb_isStashedPIP](self, "sb_isStashedPIP") withName:@"stashedPIP" ifEqualTo:1];
  return v3;
}

- (BOOL)sb_isStashedPIP
{
  v2 = [(SBSDisplayLayoutElement *)self otherSettings];
  char v3 = [v2 BOOLForSetting:3];

  return v3;
}

- (BOOL)sb_isTransitioning
{
  v2 = [(SBSDisplayLayoutElement *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2];

  return v3;
}

- (int64_t)layoutRole
{
  v2 = [(SBSDisplayLayoutElement *)self otherSettings];
  char v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (SBSDisplayLayoutElement)initWithIdentifier:(id)a3 layoutRole:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBSDisplayLayoutElement;
  id v5 = [(SBSDisplayLayoutElement *)&v9 initWithIdentifier:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(SBSDisplayLayoutElement *)v5 otherSettings];
    [v7 setObject:@"SpringBoard" forSetting:0];

    [(SBSDisplayLayoutElement *)v6 setLayoutRole:a4];
  }
  return v6;
}

- (void)sb_setTransitioning:(BOOL)a3
{
  id v3 = [(SBSDisplayLayoutElement *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:2];
}

- (void)sb_setStashedPIP:(BOOL)a3
{
  id v3 = [(SBSDisplayLayoutElement *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:3];
}

@end