@interface PUSlideshowSettingsViewModel
- (BOOL)isEqual:(id)a3;
- (BOOL)isMusicOn;
- (BOOL)shouldRepeat;
- (NSDictionary)propertyDictionary;
- (OKProducerPreset)preset;
- (PUSlideshowMediaItem)mediaItem;
- (PUSlideshowSettingsViewModel)initWithPropertyDictionary:(id)a3;
- (double)stepDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentChange;
- (id)newViewModelChange;
- (unint64_t)hash;
- (void)registerChangeObserver:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setMusicOn:(BOOL)a3;
- (void)setPreset:(id)a3;
- (void)setShouldRepeat:(BOOL)a3;
- (void)setStepDuration:(double)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PUSlideshowSettingsViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_preset, 0);
}

- (BOOL)isMusicOn
{
  return self->_musicOn;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (PUSlideshowMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (OKProducerPreset)preset
{
  return self->_preset;
}

- (double)stepDuration
{
  return self->_stepDuration;
}

- (unint64_t)hash
{
  uint64_t v3 = [(OKProducerPreset *)self->_preset hash];
  unint64_t v4 = [(PUSlideshowMediaItem *)self->_mediaItem hash];
  uint64_t v6 = 1231;
  if (self->_shouldRepeat) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  uint64_t v5 = (uint64_t)self->_stepDuration - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  uint64_t v8 = v7 - v5 + 32 * v5;
  if (!self->_musicOn) {
    uint64_t v6 = 1237;
  }
  return v6 - v8 + 32 * v8 + 28629151;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(PUSlideshowSettingsViewModel);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PUSlideshowSettingsViewModel_copyWithZone___block_invoke;
  v8[3] = &unk_1E5F2ECC8;
  uint64_t v5 = v4;
  v9 = v5;
  v10 = self;
  [(PUViewModel *)v5 performChanges:v8];
  uint64_t v6 = v5;

  return v6;
}

uint64_t __45__PUSlideshowSettingsViewModel_copyWithZone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreset:*(void *)(*(void *)(a1 + 40) + 80)];
  [*(id *)(a1 + 32) setMediaItem:*(void *)(*(void *)(a1 + 40) + 88)];
  [*(id *)(a1 + 32) setShouldRepeat:*(unsigned __int8 *)(*(void *)(a1 + 40) + 64)];
  [*(id *)(a1 + 32) setStepDuration:*(double *)(*(void *)(a1 + 40) + 72)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 65);
  return [v2 setMusicOn:v3];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PUSlideshowSettingsViewModel *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(PUSlideshowSettingsViewModel *)v5 preset];
      char v7 = [(OKProducerPreset *)self->_preset isEqual:v6];
      uint64_t v8 = [(PUSlideshowSettingsViewModel *)v5 mediaItem];
      if (v7)
      {
        BOOL v9 = [(PUSlideshowMediaItem *)self->_mediaItem isEqual:v8];
        BOOL v10 = [(PUSlideshowSettingsViewModel *)v5 shouldRepeat];
        if (v9)
        {
          int v11 = v10;
          int shouldRepeat = self->_shouldRepeat;
          [(PUSlideshowSettingsViewModel *)v5 stepDuration];
          if (shouldRepeat == v11)
          {
            double v14 = v13;
            double stepDuration = self->_stepDuration;
            BOOL v16 = [(PUSlideshowSettingsViewModel *)v5 isMusicOn];
            if (stepDuration == v14)
            {
              BOOL v17 = self->_musicOn == v16;
LABEL_14:

              goto LABEL_15;
            }
LABEL_13:
            BOOL v17 = 0;
            goto LABEL_14;
          }
LABEL_12:
          [(PUSlideshowSettingsViewModel *)v5 isMusicOn];
          goto LABEL_13;
        }
      }
      else
      {
        [(PUSlideshowSettingsViewModel *)v5 shouldRepeat];
      }
      [(PUSlideshowSettingsViewModel *)v5 stepDuration];
      goto LABEL_12;
    }
    BOOL v17 = 0;
  }
LABEL_15:

  return v17;
}

- (void)setMusicOn:(BOOL)a3
{
  if (self->_musicOn != a3)
  {
    self->_musicOn = a3;
    id v3 = [(PUSlideshowSettingsViewModel *)self currentChange];
    [v3 _setMusicOnDidChange:1];
  }
}

- (void)setStepDuration:(double)a3
{
  if (self->_stepDuration != a3)
  {
    self->_double stepDuration = a3;
    id v3 = [(PUSlideshowSettingsViewModel *)self currentChange];
    [v3 _setStepDurationDidChange:1];
  }
}

- (void)setShouldRepeat:(BOOL)a3
{
  if (self->_shouldRepeat != a3)
  {
    self->_int shouldRepeat = a3;
    id v3 = [(PUSlideshowSettingsViewModel *)self currentChange];
    [v3 _setRepeatDidChange:1];
  }
}

- (void)setMediaItem:(id)a3
{
  uint64_t v5 = (PUSlideshowMediaItem *)a3;
  uint64_t v6 = v5;
  if (self->_mediaItem != v5)
  {
    BOOL v9 = v5;
    BOOL v7 = -[PUSlideshowMediaItem isEqual:](v5, "isEqual:");
    uint64_t v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_mediaItem, a3);
      uint64_t v8 = [(PUSlideshowSettingsViewModel *)self currentChange];
      [v8 _setMediaItemDidChange:1];

      uint64_t v6 = v9;
    }
  }
}

- (void)setPreset:(id)a3
{
  uint64_t v5 = (OKProducerPreset *)a3;
  uint64_t v6 = v5;
  if (self->_preset != v5)
  {
    BOOL v9 = v5;
    char v7 = -[OKProducerPreset isEqual:](v5, "isEqual:");
    uint64_t v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preset, a3);
      uint64_t v8 = [(PUSlideshowSettingsViewModel *)self currentChange];
      [v8 _setPresetDidChange:1];

      uint64_t v6 = v9;
    }
  }
}

- (NSDictionary)propertyDictionary
{
  v13[6] = *MEMORY[0x1E4F143B8];
  id v3 = [(OKProducerPreset *)self->_preset uniqueIdentifier];
  unint64_t v4 = [(PUSlideshowMediaItem *)self->_mediaItem uniqueIdentifier];
  int64_t v5 = [(PUSlideshowMediaItem *)self->_mediaItem type];
  v12[0] = @"presetUniqueIdentifier";
  v12[1] = @"mediaUniqueIdentifier";
  v13[0] = v3;
  v13[1] = v4;
  v12[2] = @"mediaType";
  uint64_t v6 = [NSNumber numberWithInteger:v5];
  v13[2] = v6;
  v12[3] = @"shouldRepeat";
  char v7 = [NSNumber numberWithBool:self->_shouldRepeat];
  v13[3] = v7;
  v12[4] = @"stepDuration";
  uint64_t v8 = [NSNumber numberWithDouble:self->_stepDuration];
  v13[4] = v8;
  v12[5] = @"musicOn";
  BOOL v9 = [NSNumber numberWithBool:self->_musicOn];
  v13[5] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  return (NSDictionary *)v10;
}

- (PUSlideshowSettingsViewModel)initWithPropertyDictionary:(id)a3
{
  id v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PUSlideshowSettingsViewModel;
  uint64_t v6 = [(PUViewModel *)&v44 init];
  if (!v6)
  {
LABEL_35:

    return v6;
  }
  char v7 = [v5 objectForKeyedSubscript:@"presetUniqueIdentifier"];
  if (v7) {
    goto LABEL_13;
  }
  uint64_t v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v9 = objc_msgSend(v8, "px_firstKeyWindow");
  objc_msgSend(v9, "px_peripheryInsets");
  double v13 = v12;
  if (v14 != *(double *)(MEMORY[0x1E4FB2848] + 8)
    || v10 != *MEMORY[0x1E4FB2848]
    || v11 != *(double *)(MEMORY[0x1E4FB2848] + 24))
  {

LABEL_12:
    char v7 = @"com.apple.mobileslideshow@phone-com.apple.opus.producer.marimba.origami-Origami";
LABEL_13:
    v18 = [getOKProducerPresetsManagerClass_86963() defaultManager];
    uint64_t v19 = [v18 presetForUniqueIdentifier:v7];
    preset = v6->_preset;
    v6->_preset = (OKProducerPreset *)v19;

    goto LABEL_14;
  }
  double v17 = *(double *)(MEMORY[0x1E4FB2848] + 16);

  if (v13 != v17) {
    goto LABEL_12;
  }
  char v7 = 0;
LABEL_14:
  if (v6->_preset)
  {
LABEL_20:
    v28 = [v5 objectForKeyedSubscript:@"mediaUniqueIdentifier"];
    if (v28)
    {
      v29 = [v5 objectForKeyedSubscript:@"mediaType"];
      uint64_t v30 = [v29 integerValue];

      v31 = v28;
    }
    else
    {
      v31 = [(OKProducerPreset *)v6->_preset uniqueIdentifier];
      uint64_t v30 = 2;
    }
    uint64_t v32 = +[PUSlideshowMediaItem mediaItemForType:v30 uniqueIdentifier:v31];
    mediaItem = v6->_mediaItem;
    v6->_mediaItem = (PUSlideshowMediaItem *)v32;

    if (!v28) {
    v34 = [v5 objectForKeyedSubscript:@"shouldRepeat"];
    }
    if (v34)
    {
      v35 = [v5 objectForKeyedSubscript:@"shouldRepeat"];
      v6->_int shouldRepeat = [v35 BOOLValue];
    }
    else
    {
      v6->_int shouldRepeat = 0;
    }

    v36 = [v5 objectForKeyedSubscript:@"stepDuration"];
    if (v36)
    {
      v37 = [v5 objectForKeyedSubscript:@"stepDuration"];
      v6->_double stepDuration = (double)[v37 integerValue];
    }
    else
    {
      v6->_double stepDuration = 6.0;
    }

    v38 = [v5 objectForKeyedSubscript:@"musicOn"];
    if (v38)
    {
      v39 = [v5 objectForKeyedSubscript:@"musicOn"];
      v6->_musicOn = [v39 BOOLValue];
    }
    else
    {
      v6->_musicOn = 0;
    }

    goto LABEL_35;
  }
  v21 = [getOKProducerPresetsManagerClass_86963() defaultManager];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v22 = (id *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_86964;
  uint64_t v53 = getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_86964;
  if (!getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_86964)
  {
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_block_invoke_86965;
    v48 = &unk_1E5F2E228;
    v49 = &v50;
    v23 = SlideshowKitLibrary_86966();
    v24 = dlsym(v23, "kOKProducerPresetsFamilyPhotosPhone");
    *(void *)(v49[1] + 24) = v24;
    getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_86964 = *(void *)(v49[1] + 24);
    v22 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (v22)
  {
    id v25 = *v22;
    uint64_t v26 = [v21 defaultPresetsForFamily:v25];
    v27 = v6->_preset;
    v6->_preset = (OKProducerPreset *)v26;

    if (!v6->_preset)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2 object:v6 file:@"PUSlideshowSettingsViewModel.m" lineNumber:88 description:@"preset is invalid"];
    }
    goto LABEL_20;
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  v43 = [NSString stringWithUTF8String:"NSString *getkOKProducerPresetsFamilyPhotosPhone(void)"];
  objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"PUSlideshowSettingsViewModel.m", 23, @"%s", dlerror());

  __break(1u);
  return result;
}

- (void)unregisterChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewModel;
  [(PUViewModel *)&v3 unregisterChangeObserver:a3];
}

- (void)registerChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewModel;
  [(PUViewModel *)&v3 registerChangeObserver:a3];
}

- (id)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewModel;
  v2 = [(PUViewModel *)&v4 currentChange];
  return v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUSlideshowSettingsViewModelChange);
}

@end