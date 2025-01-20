@interface ISVitalitySpecificSettings
+ (ISVitalitySpecificSettings)sharedInstance;
+ (id)settingsControllerModule;
- (double)endTimeOffset;
- (double)maxVitalityDelay;
- (double)maximumDelayBeforePlayback;
- (double)minimumPhotoTransitionDuration;
- (double)minimumVisibilityFactor;
- (double)playbackRate;
- (double)postDuration;
- (double)preDuration;
- (double)startSeekTolerance;
- (int64_t)behavior;
- (void)setBehavior:(int64_t)a3;
- (void)setDefaultValues;
- (void)setEndTimeOffset:(double)a3;
- (void)setMaxVitalityDelay:(double)a3;
- (void)setMaximumDelayBeforePlayback:(double)a3;
- (void)setMinimumPhotoTransitionDuration:(double)a3;
- (void)setMinimumVisibilityFactor:(double)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setPostDuration:(double)a3;
- (void)setPreDuration:(double)a3;
- (void)setStartSeekTolerance:(double)a3;
@end

@implementation ISVitalitySpecificSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)ISVitalitySpecificSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(ISVitalitySpecificSettings *)self setBehavior:4];
  [(ISVitalitySpecificSettings *)self setPreDuration:0.65];
  [(ISVitalitySpecificSettings *)self setPlaybackRate:1.0];
  [(ISVitalitySpecificSettings *)self setEndTimeOffset:-0.135];
  [(ISVitalitySpecificSettings *)self setMinimumVisibilityFactor:0.7];
  [(ISVitalitySpecificSettings *)self setMaximumDelayBeforePlayback:0.2];
  [(ISVitalitySpecificSettings *)self setPostDuration:0.0];
  [(ISVitalitySpecificSettings *)self setStartSeekTolerance:0.3];
  [(ISVitalitySpecificSettings *)self setMinimumPhotoTransitionDuration:0.25];
  [(ISVitalitySpecificSettings *)self setMaxVitalityDelay:0.1];
}

- (void)setStartSeekTolerance:(double)a3
{
  self->_startSeekTolerance = a3;
}

- (void)setPreDuration:(double)a3
{
  self->_preDuration = a3;
}

- (void)setPostDuration:(double)a3
{
  self->_postDuration = a3;
}

- (void)setPlaybackRate:(double)a3
{
  self->_playbackRate = a3;
}

- (void)setMinimumVisibilityFactor:(double)a3
{
  self->_minimumVisibilityFactor = a3;
}

- (void)setMinimumPhotoTransitionDuration:(double)a3
{
  self->_minimumPhotoTransitionDuration = a3;
}

- (void)setMaximumDelayBeforePlayback:(double)a3
{
  self->_maximumDelayBeforePlayback = a3;
}

- (void)setMaxVitalityDelay:(double)a3
{
  self->_maxVitalityDelay = a3;
}

- (void)setEndTimeOffset:(double)a3
{
  self->_endTimeOffset = a3;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (double)minimumPhotoTransitionDuration
{
  return self->_minimumPhotoTransitionDuration;
}

- (double)maxVitalityDelay
{
  return self->_maxVitalityDelay;
}

- (double)maximumDelayBeforePlayback
{
  return self->_maximumDelayBeforePlayback;
}

- (double)minimumVisibilityFactor
{
  return self->_minimumVisibilityFactor;
}

- (double)endTimeOffset
{
  return self->_endTimeOffset;
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (double)startSeekTolerance
{
  return self->_startSeekTolerance;
}

- (double)postDuration
{
  return self->_postDuration;
}

- (double)preDuration
{
  return self->_preDuration;
}

- (int64_t)behavior
{
  return self->_behavior;
}

+ (id)settingsControllerModule
{
  v51[10] = *MEMORY[0x1E4F143B8];
  v35 = (void *)MEMORY[0x1E4F94160];
  v49 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Delay" valueKeyPath:@"maxVitalityDelay"];
  v48 = [v49 minValue:0.0 maxValue:0.25];
  v47 = objc_msgSend(v48, "is_increment:", 0.05);
  v51[0] = v47;
  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min. Photo Transition Duration" valueKeyPath:@"minimumPhotoTransitionDuration"];
  v45 = [v46 minValue:0.0 maxValue:1.0];
  v44 = objc_msgSend(v45, "is_increment:", 0.05);
  v51[1] = v44;
  v43 = [MEMORY[0x1E4F94108] rowWithTitle:@"Behavior" valueKeyPath:@"behavior"];
  v42 = [v43 possibleValues:&unk_1F3554AE0 titles:&unk_1F3554AF8];
  v51[2] = v42;
  v41 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Start Seek Tolerance" valueKeyPath:@"startSeekTolerance"];
  v40 = [v41 minValue:0.0 maxValue:2.0];
  v39 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554B10);
  v38 = [v40 condition:v39];
  v51[3] = v38;
  v37 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Post Duration" valueKeyPath:@"postDuration"];
  v34 = [v37 minValue:0.0 maxValue:2.0];
  v33 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554B28);
  v32 = [v34 condition:v33];
  v51[4] = v32;
  v31 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Pre Duration" valueKeyPath:@"preDuration"];
  v30 = [v31 minValue:0.2 maxValue:1.6];
  v29 = objc_msgSend(v30, "is_increment:", 0.05);
  v28 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554B40);
  v27 = [v29 condition:v28];
  v51[5] = v27;
  v26 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Playback Rate" valueKeyPath:@"playbackRate"];
  v25 = [v26 minValue:0.5 maxValue:3.0];
  v24 = objc_msgSend(v25, "is_increment:", 0.1);
  v23 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554B58);
  v22 = [v24 condition:v23];
  v51[6] = v22;
  v21 = [MEMORY[0x1E4F941D8] rowWithTitle:@"End Time Offset" valueKeyPath:@"endTimeOffset"];
  v20 = [v21 minValue:-0.5 maxValue:0.1];
  v19 = objc_msgSend(v20, "is_increment:", 0.05);
  v18 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554B70);
  v17 = [v19 condition:v18];
  v51[7] = v17;
  v16 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Minimum Visibility" valueKeyPath:@"minimumVisibilityFactor"];
  v2 = [v16 minValue:0.0 maxValue:1.0];
  objc_super v3 = objc_msgSend(v2, "is_increment:", 0.05);
  v4 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554B88);
  v5 = [v3 condition:v4];
  v51[8] = v5;
  v6 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Maximum Delay Before Playback" valueKeyPath:@"maximumDelayBeforePlayback"];
  v7 = [v6 minValue:0.0 maxValue:1.0];
  v8 = objc_msgSend(v7, "is_increment:", 0.01);
  v9 = __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1F3554BA0);
  v10 = [v8 condition:v9];
  v51[9] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:10];
  v36 = [v35 sectionWithRows:v11 title:@"Settings"];

  v12 = (void *)MEMORY[0x1E4F94160];
  v50 = v36;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v14 = [v12 moduleWithTitle:@"Vitality Behavior" contents:v13];

  return v14;
}

id __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"behavior == %@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v2];

  return v9;
}

+ (ISVitalitySpecificSettings)sharedInstance
{
  return 0;
}

@end