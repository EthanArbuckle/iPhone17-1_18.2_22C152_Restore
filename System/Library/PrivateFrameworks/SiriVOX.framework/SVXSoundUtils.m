@interface SVXSoundUtils
- (SVXSoundUtils)init;
- (SVXSoundUtils)initWithSpeechSynthesisUtils:(id)a3 resourceURLSupplier:(id)a4;
- (id)createAudioPlaybackRequestFromID:(int64_t)a3 preferences:(id)a4;
- (int64_t)getIDFromAudioPlaybackRequest:(id)a3;
@end

@implementation SVXSoundUtils

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURLSupplier, 0);

  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
}

- (id)createAudioPlaybackRequestFromID:(int64_t)a3 preferences:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    v28 = [NSString stringWithUTF8String:"-[SVXSoundUtils createAudioPlaybackRequestFromID:preferences:]"];
    [v27 handleFailureInFunction:v28, @"SVXSoundUtils.m", 57, @"Invalid parameter not satisfying: %@", @"preferences != nil" file lineNumber description];
  }
  switch(a3)
  {
    case 1:
    case 3:
      resourceURLSupplier = self->_resourceURLSupplier;
      v8 = @"SiriSummon-b238.wav";
      goto LABEL_7;
    case 2:
      resourceURLSupplier = self->_resourceURLSupplier;
      v8 = @"SessionInactive-b238.wav";
      goto LABEL_7;
    case 4:
    case 5:
      resourceURLSupplier = self->_resourceURLSupplier;
      v8 = @"DeviceSetup-b238.wav";
LABEL_7:
      v9 = [(__CFString *)v8 stringByDeletingPathExtension];
      v10 = [(__CFString *)v8 pathExtension];
      v11 = [(SVXResourceURLSupplier *)resourceURLSupplier URLForResource:v9 withExtension:v10];

      if (v11) {
        goto LABEL_8;
      }
      goto LABEL_15;
    case 6:
      v15 = [(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:1 preferences:v6];
      id v16 = [NSString alloc];
      v17 = [v15 languageCode];
      uint64_t v18 = [v15 gender];
      v19 = @"Female";
      if (v18 == 1) {
        v19 = @"Male";
      }
      v20 = (void *)[v16 initWithFormat:@"%@-%@-%@", @"Phatic", v17, v19];

      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
      v22 = [(SVXResourceURLSupplier *)self->_resourceURLSupplier URLsForResourcesWithExtension:@"wav" subdirectory:0];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke;
      v32[3] = &unk_264553028;
      id v33 = v20;
      id v23 = v21;
      id v34 = v23;
      id v24 = v20;
      [v22 enumerateObjectsUsingBlock:v32];

      uint64_t v25 = [v23 count];
      if (v25)
      {
        v11 = [v23 objectAtIndex:arc4random_uniform(v25)];
      }
      else
      {
        v11 = 0;
      }

      if (!v11) {
        goto LABEL_15;
      }
LABEL_8:
      id v12 = objc_alloc(MEMORY[0x263F28420]);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke_2;
      v29[3] = &unk_264553050;
      id v30 = v11;
      int64_t v31 = a3;
      id v13 = v11;
      v14 = (void *)[v12 initWithBuilder:v29];

      break;
    default:
LABEL_15:
      v14 = 0;
      break;
  }

  return v14;
}

void __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 lastPathComponent];
  int v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setItemURL:v3];
  [v4 setNumberOfLoops:0];
  LODWORD(v5) = 1.0;
  [v4 setVolume:v5];
  [v4 setFadeInDuration:0.0];
  [v4 setFadeOutDuration:0.0];
  v8 = @"_SVXSoundID";
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v9[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 setUserInfo:v7];
}

- (int64_t)getIDFromAudioPlaybackRequest:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:@"_SVXSoundID"];
  unint64_t v5 = [v4 integerValue];

  if (v5 <= 6) {
    return v5;
  }
  else {
    return 0;
  }
}

- (SVXSoundUtils)initWithSpeechSynthesisUtils:(id)a3 resourceURLSupplier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSoundUtils;
  v9 = [(SVXSoundUtils *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechSynthesisUtils, a3);
    objc_storeStrong((id *)&v10->_resourceURLSupplier, a4);
  }

  return v10;
}

- (SVXSoundUtils)init
{
  uint64_t v3 = objc_alloc_init(SVXSpeechSynthesisUtils);
  id v4 = +[SVXBundleUtils sharedInstance];
  unint64_t v5 = [v4 getSiriVOXFramework];
  id v6 = [(SVXSoundUtils *)self initWithSpeechSynthesisUtils:v3 resourceURLSupplier:v5];

  return v6;
}

@end