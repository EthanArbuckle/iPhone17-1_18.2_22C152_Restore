@interface MusicKit_SoftLinking(MusicKit_SoftLinking_MPCPlayerPath)
+ (id)playerPathWithCustomOrigin:()MusicKit_SoftLinking_MPCPlayerPath bundleID:playerID:;
+ (id)playerPathWithUnderlyingPlayerPath:()MusicKit_SoftLinking_MPCPlayerPath;
+ (id)systemMusicPathWithRoute:()MusicKit_SoftLinking_MPCPlayerPath playerID:;
+ (uint64_t)deviceActivePlayerPath;
@end

@implementation MusicKit_SoftLinking(MusicKit_SoftLinking_MPCPlayerPath)

+ (id)playerPathWithUnderlyingPlayerPath:()MusicKit_SoftLinking_MPCPlayerPath
{
  id v3 = a3;
  return v3;
}

+ (id)systemMusicPathWithRoute:()MusicKit_SoftLinking_MPCPlayerPath playerID:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = v7;
  if (!v7)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v9 = (void *)getMPAVRoutingControllerClass_softClass;
    uint64_t v17 = getMPAVRoutingControllerClass_softClass;
    if (!getMPAVRoutingControllerClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getMPAVRoutingControllerClass_block_invoke;
      v13[3] = &unk_1E6D453B0;
      v13[4] = &v14;
      __getMPAVRoutingControllerClass_block_invoke((uint64_t)v13);
      v9 = (void *)v15[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v14, 8);
    v8 = [v10 systemRoute];
  }
  v11 = [getMPCPlayerPathClass() systemMusicPathWithRoute:v8 playerID:v6];

  return v11;
}

+ (uint64_t)deviceActivePlayerPath
{
  id MPCPlayerPathClass = getMPCPlayerPathClass();
  return [MPCPlayerPathClass deviceActivePlayerPath];
}

+ (id)playerPathWithCustomOrigin:()MusicKit_SoftLinking_MPCPlayerPath bundleID:playerID:
{
  id v7 = a5;
  id v8 = a4;
  v9 = [getMPCPlayerPathClass() pathWithCustomOrigin:a3 bundleID:v8 playerID:v7];

  return v9;
}

@end