@interface NSObject(MusicKit_SoftLinking_MPCPlayerCommandDialogAction)
- (id)_musicKit_self_commandDialogAction;
- (id)musicKit_commandDialogAction_commandRequest;
- (id)musicKit_commandDialogAction_localizedTitle;
- (uint64_t)musicKit_commandDialogAction_type;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandDialogAction)

- (id)_musicKit_self_commandDialogAction
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPCPlayerCommandDialogActionClass_softClass;
  uint64_t v10 = getMPCPlayerCommandDialogActionClass_softClass;
  if (!getMPCPlayerCommandDialogActionClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerCommandDialogActionClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerCommandDialogActionClass_block_invoke((uint64_t)v6);
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

- (id)musicKit_commandDialogAction_localizedTitle
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandDialogAction");
  v2 = [v1 localizedTitle];

  return v2;
}

- (uint64_t)musicKit_commandDialogAction_type
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandDialogAction");
  uint64_t v2 = [v1 type];

  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (id)musicKit_commandDialogAction_commandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandDialogAction");
  uint64_t v2 = [v1 commandRequest];

  return v2;
}

@end