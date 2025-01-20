@interface UIContextualAction(IC)
+ (id)contextualActionWithSystemImageNamed:()IC style:color:actionBlock:;
+ (id)ic_moveContextualActionWithBlock:()IC;
+ (id)ic_passwordProtectContextualActionWithPasswordProtected:()IC passwordProtectBlock:;
+ (id)ic_pinContextualActionWithPinned:()IC pinBlock:;
+ (id)ic_replyContextualActionWithBlock:()IC;
+ (id)ic_shareContextualActionWithShareImageName:()IC shareBlock:;
+ (uint64_t)ic_deleteContextualActionWithBlock:()IC;
+ (uint64_t)ic_removeContextualActionWithBlock:()IC;
@end

@implementation UIContextualAction(IC)

+ (uint64_t)ic_deleteContextualActionWithBlock:()IC
{
  return [a1 contextualActionWithSystemImageNamed:@"trash.fill" style:1 color:0 actionBlock:a3];
}

+ (uint64_t)ic_removeContextualActionWithBlock:()IC
{
  return [a1 contextualActionWithSystemImageNamed:@"minus.circle" style:1 color:0 actionBlock:a3];
}

+ (id)ic_moveContextualActionWithBlock:()IC
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 ICMoveActionBackgroundColor];
  v7 = [a1 contextualActionWithSystemImageNamed:@"folder.fill" style:0 color:v6 actionBlock:v5];

  return v7;
}

+ (id)ic_passwordProtectContextualActionWithPasswordProtected:()IC passwordProtectBlock:
{
  v6 = @"lock.fill";
  if (a3) {
    v6 = @"lock.slash.fill";
  }
  v7 = (void *)MEMORY[0x1E4FB1618];
  v8 = v6;
  id v9 = a4;
  v10 = [v7 ICPasswordProtectActionColor];
  v11 = [a1 contextualActionWithSystemImageNamed:v8 style:0 color:v10 actionBlock:v9];

  return v11;
}

+ (id)ic_pinContextualActionWithPinned:()IC pinBlock:
{
  v6 = @"pin.fill";
  if (a3) {
    v6 = @"pin.slash.fill";
  }
  v7 = (void *)MEMORY[0x1E4FB1618];
  v8 = v6;
  id v9 = a4;
  v10 = [v7 ICPinActionColor];
  v11 = [a1 contextualActionWithSystemImageNamed:v8 style:0 color:v10 actionBlock:v9];

  return v11;
}

+ (id)ic_shareContextualActionWithShareImageName:()IC shareBlock:
{
  v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 ICShareActionBackgroundColor];
  v10 = [a1 contextualActionWithSystemImageNamed:v8 style:0 color:v9 actionBlock:v7];

  return v10;
}

+ (id)ic_replyContextualActionWithBlock:()IC
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 ICShareActionBackgroundColor];
  id v7 = [a1 contextualActionWithSystemImageNamed:@"arrowshape.turn.up.left" style:0 color:v6 actionBlock:v5];

  return v7;
}

+ (id)contextualActionWithSystemImageNamed:()IC style:color:actionBlock:
{
  id v9 = a6;
  v10 = (void *)MEMORY[0x1E4FB1688];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke;
  v18[3] = &unk_1E5FDB510;
  id v19 = v9;
  id v11 = v9;
  id v12 = a5;
  id v13 = a3;
  v14 = [v10 contextualActionWithStyle:a4 title:0 handler:v18];
  v15 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_systemImageNamed:textStyle:scale:", v13, *MEMORY[0x1E4FB2998], 3);

  v16 = [v15 _imageThatSuppressesAccessibilityHairlineThickening];
  [v14 setImage:v16];

  [v14 setBackgroundColor:v12];
  return v14;
}

@end