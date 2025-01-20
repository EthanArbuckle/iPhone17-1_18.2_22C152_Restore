@interface SHSheetMutableSceneSettings
- (NSString)sessionIdentifier;
- (SHSheetUIServiceClientContext)sessionContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sheetConfiguration;
- (int64_t)applicationState;
- (int64_t)hostProcessType;
- (int64_t)presentationStyle;
- (void)setApplicationState:(int64_t)a3;
- (void)setHostProcessType:(int64_t)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSessionContext:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSheetConfiguration:(id)a3;
@end

@implementation SHSheetMutableSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SHSheetSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (NSString)sessionIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:42897489];

  return (NSString *)v3;
}

- (void)setSessionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:42897489];
}

- (SHSheetUIServiceClientContext)sessionContext
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:42897490];

  return (SHSheetUIServiceClientContext *)v3;
}

- (void)setSessionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:42897490];
}

- (id)sheetConfiguration
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:42897491];

  return v3;
}

- (void)setSheetConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:42897491];
}

- (int64_t)presentationStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:42897492];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (void)setPresentationStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v5 setObject:v4 forSetting:42897492];
}

- (int64_t)applicationState
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:42897493];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (void)setApplicationState:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v5 setObject:v4 forSetting:42897493];
}

- (int64_t)hostProcessType
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:42897494];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (void)setHostProcessType:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v5 setObject:v4 forSetting:42897494];
}

@end