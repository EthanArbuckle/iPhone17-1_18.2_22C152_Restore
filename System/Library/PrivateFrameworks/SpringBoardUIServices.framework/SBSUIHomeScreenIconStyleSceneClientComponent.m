@interface SBSUIHomeScreenIconStyleSceneClientComponent
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)setScene:(id)a3;
- (void)updateStyleTraitForSettings:(id)a3 inScene:(id)a4;
@end

@implementation SBSUIHomeScreenIconStyleSceneClientComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [v6 settingsDiff];
  int v8 = [v7 containsProperty:sel_iconStyleConfiguration];

  if (v8)
  {
    v9 = [v6 settings];
    [(SBSUIHomeScreenIconStyleSceneClientComponent *)self updateStyleTraitForSettings:v9 inScene:v10];
  }
}

- (void)setScene:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBSUIHomeScreenIconStyleSceneClientComponent;
  [(FBSSceneComponent *)&v6 setScene:v4];
  v5 = [v4 settings];
  if ([v5 conformsToProtocol:&unk_1EFD5AC00]) {
    [(SBSUIHomeScreenIconStyleSceneClientComponent *)self updateStyleTraitForSettings:v5 inScene:v4];
  }
}

- (void)updateStyleTraitForSettings:(id)a3 inScene:(id)a4
{
  id v5 = a4;
  id v9 = [a3 iconStyleConfiguration];
  objc_super v6 = [MEMORY[0x1E4F43060] _sceneForFBSScene:v5];

  v7 = [v6 traitOverrides];
  int v8 = self;
  if (v9) {
    [v7 setObject:v9 forTrait:v8];
  }
  else {
    [v7 removeTrait:v8];
  }
}

@end