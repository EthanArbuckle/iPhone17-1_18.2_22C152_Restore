@interface SBSystemNotesScreenshotter
- (id)takeScreenshotOfDisplay:(id)a3;
@end

@implementation SBSystemNotesScreenshotter

- (id)takeScreenshotOfDisplay:(id)a3
{
  v24[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isMainDisplay])
  {
    uint64_t v4 = [(id)SBApp activeInterfaceOrientation];
  }
  else
  {
    v5 = [(id)SBApp windowSceneManager];
    v6 = [v5 windowSceneForDisplayIdentity:v3];

    [v6 _referenceBounds];
    if (v7 > v8) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  v9 = [v3 UIScreen];

  uint64_t v10 = *MEMORY[0x1E4F442C8];
  v24[0] = v9;
  uint64_t v11 = *MEMORY[0x1E4F442A0];
  v23[0] = v10;
  v23[1] = v11;
  v12 = NSNumber;
  v13 = [v9 traitCollection];
  v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "displayGamut"));
  uint64_t v15 = *MEMORY[0x1E4F442A8];
  v24[1] = v14;
  v24[2] = MEMORY[0x1E4F1CC28];
  uint64_t v16 = *MEMORY[0x1E4F442B0];
  v23[2] = v15;
  v23[3] = v16;
  v17 = NSNumber;
  [v9 scale];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v24[3] = v18;
  v23[4] = *MEMORY[0x1E4F442C0];
  v19 = [NSNumber numberWithInteger:v4];
  v23[5] = *MEMORY[0x1E4F442B8];
  v24[4] = v19;
  v24[5] = MEMORY[0x1E4F1CC38];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  v21 = (void *)_UIRenderDisplay();
  return v21;
}

uint64_t __54__SBSystemNotesScreenshotter_takeScreenshotOfDisplay___block_invoke()
{
  return _UIRenderingBufferCreate();
}

@end