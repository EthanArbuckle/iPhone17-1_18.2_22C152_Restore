@interface UIDefaultFocusSoundPlayer
@end

@implementation UIDefaultFocusSoundPlayer

void __65___UIDefaultFocusSoundPlayer__registerForSystemSoundsIfNecessary__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[UIDevice currentDevice];
    [v1 _unregisterForSystemSounds:WeakRetained];

    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
  }
}

void __44___UIDefaultFocusSoundPlayer_sharedInstance__block_invoke()
{
  id v0 = [[_UIDefaultFocusSoundPlayer alloc] _init];
  v1 = (void *)qword_1EB260738;
  qword_1EB260738 = (uint64_t)v0;
}

void __71___UIDefaultFocusSoundPlayer__playSystemSound_behavior_withVolume_pan___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v2 = (id *)qword_1EB260768;
  v39 = (void *)qword_1EB260768;
  if (!qword_1EB260768)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkAudioServicesPlaySystemSoundOptionVolumeKeySymbolLoc_block_invoke_0;
    v45 = &unk_1E52D9900;
    v46 = &v36;
    v3 = AudioToolboxLibrary_0();
    v4 = dlsym(v3, "kAudioServicesPlaySystemSoundOptionVolumeKey");
    *(void *)(v46[1] + 24) = v4;
    qword_1EB260768 = *(void *)(v46[1] + 24);
    v2 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v2)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"NSString *getkAudioServicesPlaySystemSoundOptionVolumeKey(void)"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"_UIFocusSoundGenerator.m", 34, @"%s", dlerror());

    goto LABEL_23;
  }
  id v5 = *v2;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v6 = (id *)qword_1EB260770;
  v39 = (void *)qword_1EB260770;
  if (!qword_1EB260770)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkAudioServicesPlaySystemSoundOptionPanKeySymbolLoc_block_invoke;
    v45 = &unk_1E52D9900;
    v46 = &v36;
    v7 = AudioToolboxLibrary_0();
    v8 = dlsym(v7, "kAudioServicesPlaySystemSoundOptionPanKey");
    *(void *)(v46[1] + 24) = v8;
    qword_1EB260770 = *(void *)(v46[1] + 24);
    v6 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v6)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v31 = [NSString stringWithUTF8String:"NSString *getkAudioServicesPlaySystemSoundOptionPanKey(void)"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"_UIFocusSoundGenerator.m", 35, @"%s", dlerror());

    goto LABEL_23;
  }
  id v9 = *v6;
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    v10 = (void **)qword_1EB260778;
    v39 = (void *)qword_1EB260778;
    if (!qword_1EB260778)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkAudioServicesPlaySystemSoundOptionBehaviorKeySymbolLoc_block_invoke;
      v45 = &unk_1E52D9900;
      v46 = &v36;
      v11 = AudioToolboxLibrary_0();
      v12 = dlsym(v11, "kAudioServicesPlaySystemSoundOptionBehaviorKey");
      *(void *)(v46[1] + 24) = v12;
      qword_1EB260778 = *(void *)(v46[1] + 24);
      v10 = (void **)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v10)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = [NSString stringWithUTF8String:"NSString *getkAudioServicesPlaySystemSoundOptionBehaviorKey(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"_UIFocusSoundGenerator.m", 36, @"%s", dlerror());

LABEL_23:
      __break(1u);
    }
    v13 = *v10;
    v42[0] = v5;
    v14 = NSNumber;
    double v15 = *(double *)(a1 + 32);
    id v16 = v13;
    v17 = [v14 numberWithDouble:v15];
    v43[0] = v17;
    v42[1] = v9;
    v18 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    v43[1] = v18;
    v42[2] = v16;
    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    v43[2] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
  }
  else
  {
    v40[0] = v5;
    id v16 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    v40[1] = v9;
    v41[0] = v16;
    v17 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    v41[1] = v17;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  }

  v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260740) + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v23;
    _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "Playing focus system sound at volume: %f, pan: %f.", buf, 0x16u);
  }
  uint64_t v24 = *(unsigned int *)(a1 + 52);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v25 = (void (*)(uint64_t, void *, void))off_1EB260780;
  v39 = off_1EB260780;
  if (!off_1EB260780)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_block_invoke_1;
    v45 = &unk_1E52D9900;
    v46 = &v36;
    v26 = AudioToolboxLibrary_0();
    v27 = dlsym(v26, "AudioServicesPlaySystemSoundWithOptions");
    *(void *)(v46[1] + 24) = v27;
    off_1EB260780 = *(_UNKNOWN **)(v46[1] + 24);
    v25 = (void (*)(uint64_t, void *, void))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v25)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void __AudioServicesPlaySystemSoundWithOptions(SystemSoundID, CFDictionaryRef, __strong dispatch_block_t)");
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"_UIFocusSoundGenerator.m", 33, @"%s", dlerror());

    goto LABEL_23;
  }
  v25(v24, v20, 0);
}

@end