@interface UIMenuSystem
+ (UIMenuSystem)contextSystem;
+ (UIMenuSystem)mainSystem;
- (BOOL)_buildMenuWithBuilder:(id)a3 fromResponderChain:(id)a4 atLocation:(CGPoint)a5 inCoordinateSpace:(id)a6;
- (UIMenuSystem)initWithRootMenuChildren:(id)a3;
- (id)_newBuilderFromResponderChain:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (void)_setInitialBuildingResponder:(id)a3;
- (void)setNeedsRebuild;
- (void)setNeedsRevalidate;
@end

@implementation UIMenuSystem

- (UIMenuSystem)initWithRootMenuChildren:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIMenuSystem;
  v5 = [(UIMenuSystem *)&v10 init];
  if (v5)
  {
    v6 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.root" children:v4];
    v7 = [[_UIMenuBuilder alloc] initWithRootMenu:v6];
    defaultBuilder = v5->_defaultBuilder;
    v5->_defaultBuilder = v7;

    [(_UIMenuBuilder *)v5->_defaultBuilder setSystem:v5];
  }

  return v5;
}

+ (UIMenuSystem)mainSystem
{
  return (UIMenuSystem *)+[_UIMainMenuSystem _sharedSystem];
}

- (void)setNeedsRevalidate
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EC0] defaultQueue];
  id v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"_UIMenuSystemShouldRevalidateNotification" object:self];
  v6[0] = *MEMORY[0x1E4F1C4B0];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 enqueueNotification:v4 postingStyle:2 coalesceMask:3 forModes:v5];
}

- (void)setNeedsRebuild
{
  id v4 = [MEMORY[0x1E4F28EC0] defaultQueue];
  v3 = [MEMORY[0x1E4F28EA0] notificationWithName:@"_UIMenuSystemShouldRebuildNotification" object:self];
  [v4 enqueueNotification:v3 postingStyle:1 coalesceMask:3 forModes:0];
}

+ (UIMenuSystem)contextSystem
{
  return (UIMenuSystem *)+[_UIContextMenuSystem _sharedSystem];
}

- (id)_newBuilderFromResponderChain:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  defaultBuilder = self->_defaultBuilder;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[(_UIMenuBuilder *)defaultBuilder copy];
  -[UIMenuSystem _buildMenuWithBuilder:fromResponderChain:atLocation:inCoordinateSpace:](self, "_buildMenuWithBuilder:fromResponderChain:atLocation:inCoordinateSpace:", v12, v11, v10, x, y);

  v13 = [v12 menuForIdentifier:@"com.apple.menu.root"];
  v14 = [v13 _immutableCopy];
  [v12 replaceMenuForIdentifier:@"com.apple.menu.root" withMenu:v14];

  return v12;
}

- (BOOL)_buildMenuWithBuilder:(id)a3 fromResponderChain:(id)a4 atLocation:(CGPoint)a5 inCoordinateSpace:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = v9;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    while (1)
    {
      unint64_t v14 = [v8 _changeCount];
      [v13 buildMenuWithBuilder:v8];
      if ([v8 _changeCount] > v14) {
        break;
      }
      uint64_t v15 = [v13 nextResponder];

      v13 = (void *)v15;
      if (!v15) {
        goto LABEL_8;
      }
    }

    LOBYTE(v13) = 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }
LABEL_8:

  return (char)v13;
}

- (void)_setInitialBuildingResponder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIMenuSystem.m" lineNumber:86 description:@"_setInitialBuildingResponder should only be called on the main menu system."];
}

- (void).cxx_destruct
{
}

@end