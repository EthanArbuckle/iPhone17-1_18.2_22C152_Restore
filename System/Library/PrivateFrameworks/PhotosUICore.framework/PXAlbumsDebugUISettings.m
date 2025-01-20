@interface PXAlbumsDebugUISettings
+ (PXAlbumsDebugUISettings)sharedInstance;
+ (id)_predicateValidatorUsingInternalPredicate:(BOOL)a3;
+ (id)settingsControllerModule;
- (BOOL)showBestKeyFrameDebugAlbum;
- (BOOL)showCustomDebugAlbum;
- (BOOL)showDreamyDebugAlbum;
- (BOOL)showGazeDebugAlbum;
- (BOOL)showUtilitiesDebugAlbum;
- (NSString)customDebugAlbumTitle;
- (NSString)customDebugInternalPredicate;
- (NSString)customDebugPredicate;
- (id)parentSettings;
- (void)setCustomDebugAlbumTitle:(id)a3;
- (void)setCustomDebugInternalPredicate:(id)a3;
- (void)setCustomDebugPredicate:(id)a3;
- (void)setDefaultValues;
- (void)setShowBestKeyFrameDebugAlbum:(BOOL)a3;
- (void)setShowCustomDebugAlbum:(BOOL)a3;
- (void)setShowDreamyDebugAlbum:(BOOL)a3;
- (void)setShowGazeDebugAlbum:(BOOL)a3;
- (void)setShowUtilitiesDebugAlbum:(BOOL)a3;
@end

@implementation PXAlbumsDebugUISettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXAlbumsDebugUISettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXAlbumsDebugUISettings *)self setShowBestKeyFrameDebugAlbum:0];
  [(PXAlbumsDebugUISettings *)self setShowUtilitiesDebugAlbum:0];
  [(PXAlbumsDebugUISettings *)self setShowDreamyDebugAlbum:0];
  [(PXAlbumsDebugUISettings *)self setShowGazeDebugAlbum:0];
  [(PXAlbumsDebugUISettings *)self setShowCustomDebugAlbum:0];
  [(PXAlbumsDebugUISettings *)self setCustomDebugAlbumTitle:@"Custom"];
  [(PXAlbumsDebugUISettings *)self setCustomDebugInternalPredicate:0];
  [(PXAlbumsDebugUISettings *)self setCustomDebugPredicate:0];
}

- (void)setShowUtilitiesDebugAlbum:(BOOL)a3
{
  self->_showUtilitiesDebugAlbum = a3;
}

- (void)setShowGazeDebugAlbum:(BOOL)a3
{
  self->_showGazeDebugAlbum = a3;
}

- (void)setShowDreamyDebugAlbum:(BOOL)a3
{
  self->_showDreamyDebugAlbum = a3;
}

- (void)setShowCustomDebugAlbum:(BOOL)a3
{
  self->_showCustomDebugAlbum = a3;
}

- (void)setShowBestKeyFrameDebugAlbum:(BOOL)a3
{
  self->_showBestKeyFrameDebugAlbum = a3;
}

- (void)setCustomDebugPredicate:(id)a3
{
}

- (void)setCustomDebugInternalPredicate:(id)a3
{
}

- (void)setCustomDebugAlbumTitle:(id)a3
{
}

+ (id)_predicateValidatorUsingInternalPredicate:(BOOL)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PXAlbumsDebugUISettings_UI___predicateValidatorUsingInternalPredicate___block_invoke;
  aBlock[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
  BOOL v7 = a3;
  objc_super v3 = _Block_copy(aBlock);
  v4 = _Block_copy(v3);

  return v4;
}

id __73__PXAlbumsDebugUISettings_UI___predicateValidatorUsingInternalPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F390A0];
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v6 = [v4 fetchOptionsWithPhotoLibrary:v5 orObject:0];

  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:v3];
    [v6 setInternalPredicate:v7];
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:v3];
    [v6 setPredicate:v7];
  }

  id v8 = (id)[MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
  id v9 = v3;

  return v9;
}

+ (id)settingsControllerModule
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F94160];
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Utilities Album" valueKeyPath:@"showUtilitiesDebugAlbum"];
  v30[0] = v4;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Best Key Frame Album" valueKeyPath:@"showBestKeyFrameDebugAlbum"];
  v30[1] = v5;
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Dreamy Album" valueKeyPath:@"showDreamyDebugAlbum"];
  v30[2] = v6;
  BOOL v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Gaze Album" valueKeyPath:@"showGazeDebugAlbum"];
  v30[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v27 = [v3 sectionWithRows:v8 title:@"Internal Albums"];

  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showCustomDebugAlbum == YES"];
  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Custom Album" valueKeyPath:@"showCustomDebugAlbum"];
  v29[0] = v11;
  v12 = [MEMORY[0x1E4F94158] rowWithTitle:@"Title" valueKeyPath:@"customDebugAlbumTitle"];
  v13 = [v12 condition:v9];
  v29[1] = v13;
  v14 = (void *)MEMORY[0x1E4F94158];
  v15 = [a1 _predicateValidatorUsingInternalPredicate:0];
  v16 = objc_msgSend(v14, "px_rowWithTitle:valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:", @"Predicate", @"customDebugPredicate", @"Custom Album", @"Enter a predicate for this album.", @"Predicate", v15, v9);
  v29[2] = v16;
  v17 = (void *)MEMORY[0x1E4F94158];
  v18 = [a1 _predicateValidatorUsingInternalPredicate:1];
  v19 = objc_msgSend(v17, "px_rowWithTitle:valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:", @"Internal Predicate", @"customDebugInternalPredicate", @"Custom Album", @"Enter an internal predicate for this album.", @"Internal Predicate", v18, v9);
  v29[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  v21 = [v10 sectionWithRows:v20 title:@"Custom Internal Album"];

  v22 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v23 = (void *)MEMORY[0x1E4F94160];
  v28[0] = v27;
  v28[1] = v21;
  v28[2] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v25 = [v23 moduleWithTitle:@"Albums Debug UI" contents:v24];

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDebugPredicate, 0);
  objc_storeStrong((id *)&self->_customDebugInternalPredicate, 0);
  objc_storeStrong((id *)&self->_customDebugAlbumTitle, 0);
}

- (NSString)customDebugPredicate
{
  return self->_customDebugPredicate;
}

- (NSString)customDebugInternalPredicate
{
  return self->_customDebugInternalPredicate;
}

- (NSString)customDebugAlbumTitle
{
  return self->_customDebugAlbumTitle;
}

- (BOOL)showCustomDebugAlbum
{
  return self->_showCustomDebugAlbum;
}

- (BOOL)showGazeDebugAlbum
{
  return self->_showGazeDebugAlbum;
}

- (BOOL)showDreamyDebugAlbum
{
  return self->_showDreamyDebugAlbum;
}

- (BOOL)showUtilitiesDebugAlbum
{
  return self->_showUtilitiesDebugAlbum;
}

- (BOOL)showBestKeyFrameDebugAlbum
{
  return self->_showBestKeyFrameDebugAlbum;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXAlbumsDebugUISettings)sharedInstance
{
  if (sharedInstance_onceToken_171264 != -1) {
    dispatch_once(&sharedInstance_onceToken_171264, &__block_literal_global_171265);
  }
  v2 = (void *)sharedInstance_sharedInstance_171266;
  return (PXAlbumsDebugUISettings *)v2;
}

void __41__PXAlbumsDebugUISettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 albumsDebugUISettings];
  v1 = (void *)sharedInstance_sharedInstance_171266;
  sharedInstance_sharedInstance_171266 = v0;
}

@end