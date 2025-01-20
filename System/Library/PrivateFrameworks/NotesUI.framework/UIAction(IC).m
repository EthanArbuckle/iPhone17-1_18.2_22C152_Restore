@interface UIAction(IC)
+ (id)ic_actionWithAttributedTitle:()IC handler:;
+ (id)ic_actionWithTitle:()IC subtitle:imageName:attributes:handler:;
+ (id)ic_centerWindowActionWithAppURL:()IC activationRequestOptions:;
+ (id)ic_collaborateManageActionWithCloudSyncingObject:()IC withHandler:;
+ (id)ic_collaborateShareActionWithCloudSyncingObject:()IC withHandler:;
+ (id)ic_deleteActionWithHandler:()IC;
+ (id)ic_deleteActionWithNumberOfElements:()IC handler:;
+ (id)ic_editSmartFolderActionWithHandler:()IC;
+ (id)ic_exportArchiveActionWithHandler:()IC;
+ (id)ic_importArchiveActionWithHandler:()IC;
+ (id)ic_lockNoteActionLocked:()IC withHandler:;
+ (id)ic_moveActionWithHandler:()IC;
+ (id)ic_moveActionWithWithNumberOfElements:()IC handler:;
+ (id)ic_pinNoteActionPinned:()IC numberOfElements:withHandler:;
+ (id)ic_pinNoteActionPinned:()IC withHandler:;
+ (id)ic_removeActionWithHandler:()IC;
+ (id)ic_renameActionWithHandler:()IC;
+ (id)ic_replyActionWithHandler:()IC;
+ (id)ic_sendActionWithHandler:()IC;
+ (id)ic_showActivityStreamActionWithCloudSyncingObject:()IC withHandler:;
+ (uint64_t)ic_actionWithImage:()IC handler:;
+ (uint64_t)ic_actionWithImageName:()IC handler:;
+ (uint64_t)ic_actionWithTitle:()IC handler:;
+ (uint64_t)ic_actionWithTitle:()IC imageName:attributes:handler:;
+ (uint64_t)ic_actionWithTitle:()IC imageName:handler:;
+ (uint64_t)ic_actionWithTitle:()IC subtitle:imageName:handler:;
- (uint64_t)ic_isDisabled;
- (uint64_t)setIc_destructive:()IC;
- (uint64_t)setIc_disabled:()IC;
- (unint64_t)ic_isDestructive;
@end

@implementation UIAction(IC)

+ (uint64_t)ic_actionWithImage:()IC handler:
{
  return [MEMORY[0x1E4FB13F0] actionWithTitle:&stru_1F0973378 image:a3 identifier:0 handler:a4];
}

- (unint64_t)ic_isDestructive
{
  return ((unint64_t)[a1 attributes] >> 1) & 1;
}

- (uint64_t)setIc_destructive:()IC
{
  unint64_t v5 = [a1 attributes] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!a3) {
    uint64_t v6 = 0;
  }
  return [a1 setAttributes:v5 | v6];
}

- (uint64_t)ic_isDisabled
{
  return [a1 attributes] & 1;
}

- (uint64_t)setIc_disabled:()IC
{
  unint64_t v4 = [a1 attributes] & 0xFFFFFFFFFFFFFFFELL | a3;
  return [a1 setAttributes:v4];
}

+ (id)ic_actionWithTitle:()IC subtitle:imageName:attributes:handler:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (a5)
  {
    a5 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_systemImageNamed:textStyle:scale:", a5, *MEMORY[0x1E4FB28C8], -1);
  }
  v14 = [MEMORY[0x1E4FB13F0] actionWithTitle:v11 image:a5 identifier:0 handler:v13];
  [v14 setDiscoverabilityTitle:v12];
  [v14 setAttributes:a6];

  return v14;
}

+ (uint64_t)ic_actionWithTitle:()IC subtitle:imageName:handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:subtitle:imageName:attributes:handler:", a3, a4, a5, 0, a6);
}

+ (uint64_t)ic_actionWithTitle:()IC imageName:attributes:handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:subtitle:imageName:attributes:handler:", a3, 0, a4, a5, a6);
}

+ (uint64_t)ic_actionWithTitle:()IC imageName:handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", a3, a4, 0, a5);
}

+ (uint64_t)ic_actionWithTitle:()IC handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", a3, 0, a4);
}

+ (uint64_t)ic_actionWithImageName:()IC handler:
{
  return objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", &stru_1F0973378, a3, a4);
}

+ (id)ic_actionWithAttributedTitle:()IC handler:
{
  unint64_t v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 string];
  v9 = [v5 actionWithTitle:v8 image:0 identifier:0 handler:v6];

  [v9 setAttributedTitle:v7];
  return v9;
}

+ (id)ic_pinNoteActionPinned:()IC withHandler:
{
  id v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  if (a3)
  {
    v8 = [v6 localizedFrameworkStringForKey:@"Unpin Note" value:@"Unpin Note" table:0 allowSiri:1];
    v9 = @"pin.slash";
  }
  else
  {
    v8 = [v6 localizedFrameworkStringForKey:@"Pin Note" value:@"Pin Note" table:0 allowSiri:1];
    v9 = @"pin";
  }
  v10 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v8, v9, v7);

  return v10;
}

+ (id)ic_pinNoteActionPinned:()IC numberOfElements:withHandler:
{
  id v8 = a5;
  if (a4 == 1)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "ic_pinNoteActionPinned:withHandler:", a3, v8);
  }
  else
  {
    v10 = NSString;
    if (a3)
    {
      id v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Unpin %lu Notes" value:@"Unpin %lu Notes" table:0 allowSiri:1];
      id v12 = @"pin.slash";
    }
    else
    {
      id v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Pin %lu Notes" value:@"Pin %lu Notes" table:0 allowSiri:1];
      id v12 = @"pin";
    }
    id v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, a4);

    v9 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v13, v12, v8);
  }
  return v9;
}

+ (id)ic_lockNoteActionLocked:()IC withHandler:
{
  id v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  if (a3)
  {
    id v8 = [v6 localizedFrameworkStringForKey:@"Remove Lock" value:@"Remove Lock" table:0 allowSiri:1];
    v9 = @"lock.slash";
  }
  else
  {
    id v8 = [v6 localizedFrameworkStringForKey:@"Lock Note" value:@"Lock Note" table:0 allowSiri:1];
    v9 = @"lock";
  }
  v10 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v8, v9, v7);

  return v10;
}

+ (id)ic_collaborateManageActionWithCloudSyncingObject:()IC withHandler:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 shareViaICloudManageActionTitle];
  v9 = [v7 shareViaICloudSystemImageName];

  v10 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v8, v9, v6);

  return v10;
}

+ (id)ic_collaborateShareActionWithCloudSyncingObject:()IC withHandler:
{
  id v6 = a4;
  id v7 = [a3 shareViaICloudAddPeopleActionTitle];
  id v8 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v7, @"square.and.arrow.up", v6);

  return v8;
}

+ (id)ic_showActivityStreamActionWithCloudSyncingObject:()IC withHandler:
{
  unint64_t v5 = (void *)MEMORY[0x1E4F83770];
  id v6 = a4;
  id v7 = [v5 localizedFrameworkStringForKey:@"Show Folder Activity" value:@"Show Folder Activity" table:0 allowSiri:1];
  id v8 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v7, @"bubble.left.and.bubble.right", v6);

  return v8;
}

+ (id)ic_sendActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Send a Copy" value:@"Send a Copy" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"square.and.arrow.up", v5);

  return v7;
}

+ (id)ic_moveActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Move" value:@"Move" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"folder", v5);

  return v7;
}

+ (id)ic_moveActionWithWithNumberOfElements:()IC handler:
{
  if (a3 == 1)
  {
    id v5 = a4;
    id v6 = objc_msgSend((id)objc_opt_class(), "ic_moveActionWithHandler:", v5);
  }
  else
  {
    id v8 = NSString;
    v9 = (void *)MEMORY[0x1E4F83770];
    id v10 = a4;
    id v11 = [v9 localizedFrameworkStringForKey:@"Move %lu Notes" value:@"Move %lu Notes" table:0 allowSiri:1];
    objc_msgSend(v8, "localizedStringWithFormat:", v11, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v5, @"folder", v10);
  }
  return v6;
}

+ (id)ic_removeActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Remove" value:@"Remove" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", v6, @"minus.circle", 2, v5);

  return v7;
}

+ (id)ic_deleteActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Delete" value:@"Delete" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", v6, @"trash", 2, v5);

  return v7;
}

+ (id)ic_deleteActionWithNumberOfElements:()IC handler:
{
  if (a3 == 1)
  {
    id v5 = a4;
    id v6 = objc_msgSend((id)objc_opt_class(), "ic_deleteActionWithHandler:", v5);
  }
  else
  {
    id v8 = NSString;
    v9 = (void *)MEMORY[0x1E4F83770];
    id v10 = a4;
    id v11 = [v9 localizedFrameworkStringForKey:@"Delete %lu Notes" value:@"Delete %lu Notes" table:0 allowSiri:1];
    objc_msgSend(v8, "localizedStringWithFormat:", v11, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = objc_msgSend(a1, "ic_actionWithTitle:imageName:attributes:handler:", v5, @"trash", 2, v10);
  }
  return v6;
}

+ (id)ic_renameActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Rename" value:@"Rename" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"pencil", v5);

  return v7;
}

+ (id)ic_editSmartFolderActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Edit Smart Folder" value:@"Edit Smart Folder" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"pencil", v5);

  return v7;
}

+ (id)ic_importArchiveActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Import Archive…" value:@"Import Archive…" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"square.and.arrow.down.on.square", v5);

  return v7;
}

+ (id)ic_exportArchiveActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Export Archive…" value:@"Export Archive…" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"square.and.arrow.up.on.square", v5);

  return v7;
}

+ (id)ic_replyActionWithHandler:()IC
{
  unint64_t v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"Reply" value:@"Reply" table:0 allowSiri:1];
  id v7 = objc_msgSend(a1, "ic_actionWithTitle:imageName:handler:", v6, @"arrowshape.turn.up.left", v5);

  return v7;
}

+ (id)ic_centerWindowActionWithAppURL:()IC activationRequestOptions:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FB1F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__UIAction_IC__ic_centerWindowActionWithAppURL_activationRequestOptions___block_invoke;
  v12[3] = &unk_1E5FDAA80;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 actionWithIdentifier:0 alternateAction:0 configurationProvider:v12];

  return v10;
}

@end