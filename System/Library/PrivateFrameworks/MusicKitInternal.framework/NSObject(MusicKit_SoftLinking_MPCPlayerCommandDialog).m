@interface NSObject(MusicKit_SoftLinking_MPCPlayerCommandDialog)
- (id)_musicKit_self_commandDialog;
- (id)musicKit_commandDialog_actions;
- (id)musicKit_commandDialog_localizedMessage;
- (id)musicKit_commandDialog_localizedTitle;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandDialog)

- (id)_musicKit_self_commandDialog
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPCPlayerCommandDialogClass_softClass;
  uint64_t v10 = getMPCPlayerCommandDialogClass_softClass;
  if (!getMPCPlayerCommandDialogClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerCommandDialogClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerCommandDialogClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (objc_opt_isKindOfClass()) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

- (id)musicKit_commandDialog_localizedTitle
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandDialog");
  v2 = [v1 localizedTitle];

  return v2;
}

- (id)musicKit_commandDialog_localizedMessage
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandDialog");
  v2 = [v1 localizedMessage];

  return v2;
}

- (id)musicKit_commandDialog_actions
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandDialog");
  v2 = [v1 actions];

  return v2;
}

@end