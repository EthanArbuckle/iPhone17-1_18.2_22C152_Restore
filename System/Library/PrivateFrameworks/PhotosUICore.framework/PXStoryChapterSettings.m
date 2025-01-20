@interface PXStoryChapterSettings
+ (PXStoryChapterSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)dummyChaptersIncludeSubtitles;
- (id)parentSettings;
- (int64_t)chapterCollectionProducerKind;
- (int64_t)dummyChaptersCountInterval;
- (int64_t)dummyChaptersDayInterval;
- (void)setChapterCollectionProducerKind:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDummyChaptersCountInterval:(int64_t)a3;
- (void)setDummyChaptersDayInterval:(int64_t)a3;
- (void)setDummyChaptersIncludeSubtitles:(BOOL)a3;
@end

@implementation PXStoryChapterSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryChapterSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXStoryChapterSettings *)self setChapterCollectionProducerKind:1];
  [(PXStoryChapterSettings *)self setDummyChaptersDayInterval:1];
  [(PXStoryChapterSettings *)self setDummyChaptersCountInterval:4];
  [(PXStoryChapterSettings *)self setDummyChaptersIncludeSubtitles:0];
}

- (void)setDummyChaptersIncludeSubtitles:(BOOL)a3
{
  self->_dummyChaptersIncludeSubtitles = a3;
}

- (void)setDummyChaptersDayInterval:(int64_t)a3
{
  self->_dummyChaptersDayInterval = a3;
}

- (void)setDummyChaptersCountInterval:(int64_t)a3
{
  self->_dummyChaptersCountInterval = a3;
}

- (void)setChapterCollectionProducerKind:(int64_t)a3
{
  self->_chapterCollectionProducerKind = a3;
}

- (BOOL)dummyChaptersIncludeSubtitles
{
  return self->_dummyChaptersIncludeSubtitles;
}

- (int64_t)dummyChaptersCountInterval
{
  return self->_dummyChaptersCountInterval;
}

- (int64_t)dummyChaptersDayInterval
{
  return self->_dummyChaptersDayInterval;
}

- (int64_t)chapterCollectionProducerKind
{
  return self->_chapterCollectionProducerKind;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F94108];
  v37 = NSStringFromSelector(sel_chapterCollectionProducerKind);
  v36 = [v3 rowWithTitle:@"Kind" valueKeyPath:v37];
  v35 = [v36 possibleValues:&unk_1F02D3B38 titles:&unk_1F02D3B50];
  v38[0] = v35;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v34 = NSStringFromSelector(sel_dummyChaptersDayInterval);
  v33 = [v4 rowWithTitle:@"Day Interval" valueKeyPath:v34];
  v32 = [v33 minValue:1.0 maxValue:30.0];
  v30 = objc_msgSend(v32, "px_increment:", 1.0);
  v5 = (void *)MEMORY[0x1E4F28F60];
  v31 = NSStringFromSelector(sel_chapterCollectionProducerKind);
  v29 = objc_msgSend(v5, "predicateWithFormat:", @"%K == %li", v31, 3);
  v28 = [v30 condition:v29];
  v38[1] = v28;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v27 = NSStringFromSelector(sel_dummyChaptersCountInterval);
  v26 = [v6 rowWithTitle:@"Count Interval" valueKeyPath:v27];
  v25 = [v26 minValue:1.0 maxValue:30.0];
  v23 = objc_msgSend(v25, "px_increment:", 1.0);
  v7 = (void *)MEMORY[0x1E4F28F60];
  v24 = NSStringFromSelector(sel_chapterCollectionProducerKind);
  v22 = objc_msgSend(v7, "predicateWithFormat:", @"%K == %li", v24, 3);
  v21 = [v23 condition:v22];
  v38[2] = v21;
  v8 = (void *)MEMORY[0x1E4F941F0];
  v9 = NSStringFromSelector(sel_dummyChaptersIncludeSubtitles);
  v10 = [v8 rowWithTitle:@"Subtitles" valueKeyPath:v9];
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = NSStringFromSelector(sel_chapterCollectionProducerKind);
  v13 = objc_msgSend(v11, "predicateWithFormat:", @"%K != %li", v12, 1);
  v14 = [v10 condition:v13];
  v38[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  v16 = [v2 sectionWithRows:v15 title:@"Settings"];
  v39[0] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v39[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v19 = [v2 moduleWithTitle:@"Chapters" contents:v18];

  return v19;
}

+ (PXStoryChapterSettings)sharedInstance
{
  if (sharedInstance_onceToken_54867 != -1) {
    dispatch_once(&sharedInstance_onceToken_54867, &__block_literal_global_54868);
  }
  v2 = (void *)sharedInstance_sharedInstance_54869;
  return (PXStoryChapterSettings *)v2;
}

void __40__PXStoryChapterSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXStorySettings sharedInstance];
  uint64_t v0 = [v2 chapterSettings];
  v1 = (void *)sharedInstance_sharedInstance_54869;
  sharedInstance_sharedInstance_54869 = v0;
}

@end