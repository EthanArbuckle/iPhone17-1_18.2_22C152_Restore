@interface NSObject(MusicKit_SoftLinking_MPCPlayerCommandRequest)
- (id)_musicKit_self_commandRequest;
- (uint64_t)musicKit_setSessionID:()MusicKit_SoftLinking_MPCPlayerCommandRequest;
- (void)_musicKit_setCommandOptionValue:()MusicKit_SoftLinking_MPCPlayerCommandRequest forKey:;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandRequest)

- (id)_musicKit_self_commandRequest
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPCPlayerCommandRequestClass_softClass;
  uint64_t v10 = getMPCPlayerCommandRequestClass_softClass;
  if (!getMPCPlayerCommandRequestClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerCommandRequestClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerCommandRequestClass_block_invoke((uint64_t)v6);
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

- (uint64_t)musicKit_setSessionID:()MusicKit_SoftLinking_MPCPlayerCommandRequest
{
  return objc_msgSend(a1, "_musicKit_setCommandOptionValue:forKey:", a3, *MEMORY[0x1E4F77688]);
}

- (void)_musicKit_setCommandOptionValue:()MusicKit_SoftLinking_MPCPlayerCommandRequest forKey:
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "_musicKit_self_commandRequest");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setCommandOptionValue:v7 forKey:v6];
}

@end