@interface SHSheetContentReloadAction
- (NSUUID)activityUUID;
- (SHSheetContentReloadAction)initWithActivityUUID:(id)a3;
@end

@implementation SHSheetContentReloadAction

- (SHSheetContentReloadAction)initWithActivityUUID:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:1];

  v7 = [(SHSheetContentReloadAction *)self initWithInfo:v6 responder:0];
  return v7;
}

- (NSUUID)activityUUID
{
  v2 = [(SHSheetContentReloadAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSUUID *)v3;
}

@end