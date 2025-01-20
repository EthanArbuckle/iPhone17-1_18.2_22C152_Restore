@interface NSObject(MusicKit_SoftLinking_MPCPlayerCommandStatus)
- (id)_musicKit_self_commandStatus;
- (id)musicKit_commandStatus_dialog;
- (id)musicKit_commandStatus_error;
- (uint64_t)musicKit_commandStatus_type;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandStatus)

- (id)_musicKit_self_commandStatus
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPCPlayerCommandStatusClass_softClass;
  uint64_t v10 = getMPCPlayerCommandStatusClass_softClass;
  if (!getMPCPlayerCommandStatusClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerCommandStatusClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerCommandStatusClass_block_invoke((uint64_t)v6);
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

- (id)musicKit_commandStatus_error
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandStatus");
  v2 = [v1 error];

  return v2;
}

- (id)musicKit_commandStatus_dialog
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandStatus");
  v2 = [v1 dialog];

  return v2;
}

- (uint64_t)musicKit_commandStatus_type
{
  v1 = objc_msgSend(a1, "_musicKit_self_commandStatus");
  uint64_t v2 = [v1 type];

  if (v2 == 999) {
    uint64_t v3 = 999;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v2 == 3) {
    uint64_t v3 = 3;
  }
  if (v2 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v2 == 1) {
    uint64_t v4 = 1;
  }
  if (v2 <= 2) {
    return v4;
  }
  else {
    return v3;
  }
}

@end