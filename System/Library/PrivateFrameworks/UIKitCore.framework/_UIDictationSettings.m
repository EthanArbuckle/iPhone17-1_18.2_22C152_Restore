@interface _UIDictationSettings
+ (id)compositingFilters;
+ (id)frameRates;
+ (id)frameRatesTitles;
+ (id)impactStyles;
+ (id)impactStylesTitles;
+ (id)settingsControllerModule;
- (BOOL)commandHapticFeedbackEnabled;
- (BOOL)glowEffectEnabled;
- (BOOL)pulseAnimationEnabled;
- (BOOL)soundReactiveCursorEnabled;
- (BOOL)trailAnimationEnabled;
- (BOOL)voiceCommandsInIWorkEnabled;
- (NSString)darkModeCompositingFiler;
- (NSString)lightModeCompositingFiler;
- (double)audioHeightMaxBump;
- (double)audioPollingRate;
- (double)audioScaleAnimationDampingRatio;
- (double)audioScaleAnimationResponse;
- (double)audioWidthMaxBump;
- (double)cursorGlowAlphaMax;
- (double)cursorGlowAlphaMin;
- (double)cursorGlowBlurRadius;
- (double)cursorGlowBorderPadding;
- (double)headHeight;
- (double)impactIntensity;
- (double)minimumRadius;
- (double)pulseDuration;
- (double)pulseFrameRate;
- (double)pulseHeightMaxBump;
- (double)pulseWidthMaxBump;
- (double)revealFadeTime;
- (double)tailHeight;
- (double)trailFrameRate;
- (double)trailingGlowAlpha;
- (double)trailingGlowBlurRadius;
- (double)trailingGlowDuration;
- (double)typewriterEffectFramesPerSecond;
- (double)typewriterEffectMinDurationBetweenHypotheses;
- (double)typewriterEffectStreamingCharacterInsertionRate;
- (int64_t)impactStyle;
- (void)setAudioHeightMaxBump:(double)a3;
- (void)setAudioPollingRate:(double)a3;
- (void)setAudioScaleAnimationDampingRatio:(double)a3;
- (void)setAudioScaleAnimationResponse:(double)a3;
- (void)setAudioWidthMaxBump:(double)a3;
- (void)setCommandHapticFeedbackEnabled:(BOOL)a3;
- (void)setCursorGlowAlphaMax:(double)a3;
- (void)setCursorGlowAlphaMin:(double)a3;
- (void)setCursorGlowBlurRadius:(double)a3;
- (void)setCursorGlowBorderPadding:(double)a3;
- (void)setDarkModeCompositingFiler:(id)a3;
- (void)setDefaultValues;
- (void)setGlowEffectEnabled:(BOOL)a3;
- (void)setHeadHeight:(double)a3;
- (void)setImpactIntensity:(double)a3;
- (void)setImpactStyle:(int64_t)a3;
- (void)setLightModeCompositingFiler:(id)a3;
- (void)setMinimumRadius:(double)a3;
- (void)setPulseAnimationEnabled:(BOOL)a3;
- (void)setPulseDuration:(double)a3;
- (void)setPulseFrameRate:(double)a3;
- (void)setPulseHeightMaxBump:(double)a3;
- (void)setPulseWidthMaxBump:(double)a3;
- (void)setRevealFadeTime:(double)a3;
- (void)setSoundReactiveCursorEnabled:(BOOL)a3;
- (void)setTailHeight:(double)a3;
- (void)setTrailAnimationEnabled:(BOOL)a3;
- (void)setTrailFrameRate:(double)a3;
- (void)setTrailingGlowAlpha:(double)a3;
- (void)setTrailingGlowBlurRadius:(double)a3;
- (void)setTrailingGlowDuration:(double)a3;
- (void)setTypewriterEffectFramesPerSecond:(double)a3;
- (void)setTypewriterEffectMinDurationBetweenHypotheses:(double)a3;
- (void)setTypewriterEffectStreamingCharacterInsertionRate:(double)a3;
- (void)setVoiceCommandsInIWorkEnabled:(BOOL)a3;
@end

@implementation _UIDictationSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDictationSettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(_UIDictationSettings *)self setMinimumRadius:0.5];
  [(_UIDictationSettings *)self setTrailingGlowBlurRadius:10.0];
  [(_UIDictationSettings *)self setLightModeCompositingFiler:*MEMORY[0x1E4F3A2E0]];
  [(_UIDictationSettings *)self setDarkModeCompositingFiler:*MEMORY[0x1E4F3A2E8]];
  [(_UIDictationSettings *)self setTrailingGlowDuration:1.4];
  [(_UIDictationSettings *)self setTailHeight:0.0];
  [(_UIDictationSettings *)self setHeadHeight:1.0];
  [(_UIDictationSettings *)self setTrailingGlowAlpha:0.32];
  [(_UIDictationSettings *)self setRevealFadeTime:0.14];
  [(_UIDictationSettings *)self setTypewriterEffectFramesPerSecond:24.0];
  [(_UIDictationSettings *)self setTypewriterEffectStreamingCharacterInsertionRate:70.0];
  [(_UIDictationSettings *)self setTypewriterEffectMinDurationBetweenHypotheses:0.3];
  [(_UIDictationSettings *)self setGlowEffectEnabled:1];
  [(_UIDictationSettings *)self setPulseAnimationEnabled:1];
  [(_UIDictationSettings *)self setTrailAnimationEnabled:1];
  v3 = +[UIScreen mainScreen];
  -[_UIDictationSettings setPulseFrameRate:](self, "setPulseFrameRate:", (double)[v3 maximumFramesPerSecond]);

  v4 = +[UIScreen mainScreen];
  -[_UIDictationSettings setTrailFrameRate:](self, "setTrailFrameRate:", (double)[v4 maximumFramesPerSecond]);

  [(_UIDictationSettings *)self setSoundReactiveCursorEnabled:1];
  [(_UIDictationSettings *)self setAudioPollingRate:60.0];
  [(_UIDictationSettings *)self setAudioWidthMaxBump:2.0];
  [(_UIDictationSettings *)self setAudioScaleAnimationDampingRatio:1.0];
  [(_UIDictationSettings *)self setAudioScaleAnimationResponse:0.2];
  [(_UIDictationSettings *)self setCommandHapticFeedbackEnabled:1];
  [(_UIDictationSettings *)self setImpactStyle:3];
  [(_UIDictationSettings *)self setImpactIntensity:0.8];
  [(_UIDictationSettings *)self setPulseDuration:0.9];
  [(_UIDictationSettings *)self setCursorGlowBorderPadding:0.0];
  [(_UIDictationSettings *)self setPulseHeightMaxBump:2.0];
  [(_UIDictationSettings *)self setAudioHeightMaxBump:7.0];
  [(_UIDictationSettings *)self setPulseWidthMaxBump:1.5];
  [(_UIDictationSettings *)self setCursorGlowAlphaMax:0.6];
  [(_UIDictationSettings *)self setCursorGlowAlphaMin:0.24];
  [(_UIDictationSettings *)self setCursorGlowBlurRadius:6.0];
  [(_UIDictationSettings *)self setVoiceCommandsInIWorkEnabled:0];
}

- (void)setVoiceCommandsInIWorkEnabled:(BOOL)a3
{
  self->_voiceCommandsInIWorkEnabled = a3;
}

- (void)setTypewriterEffectStreamingCharacterInsertionRate:(double)a3
{
  self->_typewriterEffectStreamingCharacterInsertionRate = a3;
}

- (void)setTypewriterEffectMinDurationBetweenHypotheses:(double)a3
{
  self->_typewriterEffectMinDurationBetweenHypotheses = a3;
}

- (void)setTypewriterEffectFramesPerSecond:(double)a3
{
  self->_typewriterEffectFramesPerSecond = a3;
}

- (void)setTrailingGlowDuration:(double)a3
{
  self->_trailingGlowDuration = a3;
}

- (void)setTrailingGlowBlurRadius:(double)a3
{
  self->_trailingGlowBlurRadius = a3;
}

- (void)setTrailingGlowAlpha:(double)a3
{
  self->_trailingGlowAlpha = a3;
}

- (void)setTrailFrameRate:(double)a3
{
  self->_trailFrameRate = a3;
}

- (void)setTrailAnimationEnabled:(BOOL)a3
{
  self->_trailAnimationEnabled = a3;
}

- (void)setTailHeight:(double)a3
{
  self->_tailHeight = a3;
}

- (void)setSoundReactiveCursorEnabled:(BOOL)a3
{
  self->_soundReactiveCursorEnabled = a3;
}

- (void)setRevealFadeTime:(double)a3
{
  self->_revealFadeTime = a3;
}

- (void)setPulseWidthMaxBump:(double)a3
{
  self->_pulseWidthMaxBump = a3;
}

- (void)setPulseHeightMaxBump:(double)a3
{
  self->_pulseHeightMaxBump = a3;
}

- (void)setPulseFrameRate:(double)a3
{
  self->_pulseFrameRate = a3;
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
}

- (void)setPulseAnimationEnabled:(BOOL)a3
{
  self->_pulseAnimationEnabled = a3;
}

- (void)setMinimumRadius:(double)a3
{
  self->_minimumRadius = a3;
}

- (void)setLightModeCompositingFiler:(id)a3
{
}

- (void)setImpactStyle:(int64_t)a3
{
  self->_impactStyle = a3;
}

- (void)setImpactIntensity:(double)a3
{
  self->_impactIntensity = a3;
}

- (void)setHeadHeight:(double)a3
{
  self->_headHeight = a3;
}

- (void)setGlowEffectEnabled:(BOOL)a3
{
  self->_glowEffectEnabled = a3;
}

- (void)setDarkModeCompositingFiler:(id)a3
{
}

- (void)setCursorGlowBorderPadding:(double)a3
{
  self->_cursorGlowBorderPadding = a3;
}

- (void)setCursorGlowBlurRadius:(double)a3
{
  self->_cursorGlowBlurRadius = a3;
}

- (void)setCursorGlowAlphaMin:(double)a3
{
  self->_cursorGlowAlphaMin = a3;
}

- (void)setCursorGlowAlphaMax:(double)a3
{
  self->_cursorGlowAlphaMax = a3;
}

- (void)setCommandHapticFeedbackEnabled:(BOOL)a3
{
  self->_commandHapticFeedbackEnabled = a3;
}

- (void)setAudioWidthMaxBump:(double)a3
{
  self->_audioWidthMaxBump = a3;
}

- (void)setAudioScaleAnimationResponse:(double)a3
{
  self->_audioScaleAnimationResponse = a3;
}

- (void)setAudioScaleAnimationDampingRatio:(double)a3
{
  self->_audioScaleAnimationDampingRatio = a3;
}

- (void)setAudioPollingRate:(double)a3
{
  self->_audioPollingRate = a3;
}

- (void)setAudioHeightMaxBump:(double)a3
{
  self->_audioHeightMaxBump = a3;
}

- (int64_t)impactStyle
{
  return self->_impactStyle;
}

- (BOOL)commandHapticFeedbackEnabled
{
  return self->_commandHapticFeedbackEnabled;
}

+ (id)settingsControllerModule
{
  v117[5] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F94160];
  id v51 = (id)MEMORY[0x1E4F94160];
  v111 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Sound Reactive Cursor" valueKeyPath:@"soundReactiveCursorEnabled"];
  v116[0] = v111;
  v110 = [MEMORY[0x1E4F94108] rowWithTitle:@"Audio Polling Rate" valueKeyPath:@"audioPollingRate"];
  v109 = [a1 frameRates];
  v108 = [a1 frameRatesTitles];
  v107 = [v110 possibleValues:v109 titles:v108];
  v116[1] = v107;
  v106 = [MEMORY[0x1E4F94148] rowWithTitle:@"Audio Width Bump" valueKeyPath:@"audioWidthMaxBump"];
  v105 = [v106 between:0.0 and:10.0];
  v104 = [v105 precision:3];
  v116[2] = v104;
  v103 = [MEMORY[0x1E4F94148] rowWithTitle:@"Audio Height Bump" valueKeyPath:@"audioHeightMaxBump"];
  v102 = [v103 between:0.0 and:10.0];
  v101 = [v102 precision:3];
  v116[3] = v101;
  v100 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pulse Width Bump" valueKeyPath:@"pulseWidthMaxBump"];
  v99 = [v100 between:0.0 and:10.0];
  v98 = [v99 precision:3];
  v116[4] = v98;
  v97 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pulse Height Bump" valueKeyPath:@"pulseHeightMaxBump"];
  v96 = [v97 between:0.0 and:10.0];
  v95 = [v96 precision:3];
  v116[5] = v95;
  v94 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pulse Duration" valueKeyPath:@"pulseDuration"];
  v93 = [v94 between:0.0 and:10.0];
  v92 = [v93 precision:3];
  v116[6] = v92;
  v91 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping Ratio" valueKeyPath:@"audioScaleAnimationDampingRatio"];
  v90 = [v91 between:0.0 and:1.0];
  v89 = [v90 precision:3];
  v116[7] = v89;
  v88 = [MEMORY[0x1E4F94148] rowWithTitle:@"Response" valueKeyPath:@"audioScaleAnimationResponse"];
  v87 = [v88 between:0.0 and:10.0];
  v86 = [v87 precision:3];
  v116[8] = v86;
  v85 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Command Haptic Fedeback" valueKeyPath:@"commandHapticFeedbackEnabled"];
  v116[9] = v85;
  v84 = [MEMORY[0x1E4F94108] rowWithTitle:@"Impact Style" valueKeyPath:@"impactStyle"];
  v83 = [a1 impactStyles];
  v82 = [a1 impactStylesTitles];
  v81 = [v84 possibleValues:v83 titles:v82];
  v116[10] = v81;
  v80 = [MEMORY[0x1E4F94148] rowWithTitle:@"Impact Intensity" valueKeyPath:@"impactIntensity"];
  v79 = [v80 between:0.0 and:1.0];
  v78 = [v79 precision:3];
  v116[11] = v78;
  v77 = [MEMORY[0x1E4F941F0] rowWithTitle:@"iWork Command UI" valueKeyPath:@"voiceCommandsInIWorkEnabled"];
  v116[12] = v77;
  v76 = [MEMORY[0x1E4F94148] rowWithTitle:@"cursorGlowBorderPadding" valueKeyPath:@"cursorGlowBorderPadding"];
  v75 = [v76 between:0.0 and:20.0];
  v74 = [v75 precision:3];
  v116[13] = v74;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:14];
  v72 = [v3 sectionWithRows:v73 title:@"Crystal Dictation UI"];
  v117[0] = v72;
  v4 = (void *)MEMORY[0x1E4F94160];
  v71 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minimum Glow Radius" valueKeyPath:@"minimumRadius"];
  v70 = [v71 between:0.0 and:30.0];
  v69 = [v70 precision:2];
  v115[0] = v69;
  v68 = [MEMORY[0x1E4F94148] rowWithTitle:@"Cursor Glow Blur Radius" valueKeyPath:@"cursorGlowBlurRadius"];
  v67 = [v68 between:0.0 and:30.0];
  v66 = [v67 precision:2];
  v115[1] = v66;
  v65 = [MEMORY[0x1E4F94148] rowWithTitle:@"Trailing Glow Blur Radius" valueKeyPath:@"trailingGlowBlurRadius"];
  v64 = [v65 between:0.0 and:30.0];
  v63 = [v64 precision:2];
  v115[2] = v63;
  v62 = [MEMORY[0x1E4F94108] rowWithTitle:@"lightMode compositingFiler" valueKeyPath:@"lightModeCompositingFiler"];
  v61 = [a1 compositingFilters];
  v60 = [a1 compositingFilters];
  v59 = [v62 possibleValues:v61 titles:v60];
  v115[3] = v59;
  v58 = [MEMORY[0x1E4F94108] rowWithTitle:@"darkMode compositingFiler" valueKeyPath:@"darkModeCompositingFiler"];
  v57 = [a1 compositingFilters];
  v56 = [a1 compositingFilters];
  v55 = [v58 possibleValues:v57 titles:v56];
  v115[4] = v55;
  v54 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Trailing Glow Duration" valueKeyPath:@"trailingGlowDuration"];
  v53 = [v54 minValue:0.01 maxValue:2.0];
  v115[5] = v53;
  v50 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Tail Height" valueKeyPath:@"tailHeight"];
  v49 = [v50 minValue:0.0 maxValue:1.0];
  v115[6] = v49;
  v48 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Head Height" valueKeyPath:@"headHeight"];
  v47 = [v48 minValue:0.0 maxValue:1.0];
  v115[7] = v47;
  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"cursorGAlphaMin" valueKeyPath:@"cursorGlowAlphaMin"];
  v45 = [v46 minValue:0.0 maxValue:1.0];
  v115[8] = v45;
  v44 = [MEMORY[0x1E4F941D8] rowWithTitle:@"cursorGAlphaMax" valueKeyPath:@"cursorGlowAlphaMax"];
  v43 = [v44 minValue:0.0 maxValue:1.0];
  v115[9] = v43;
  v42 = [MEMORY[0x1E4F941D8] rowWithTitle:@"trailingGAlpha" valueKeyPath:@"trailingGlowAlpha"];
  v41 = [v42 minValue:0.0 maxValue:1.0];
  v115[10] = v41;
  v40 = [MEMORY[0x1E4F941D8] rowWithTitle:@"revealFadeTime" valueKeyPath:@"revealFadeTime"];
  v39 = [v40 minValue:0.0 maxValue:2.0];
  v115[11] = v39;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:12];
  v37 = [v4 sectionWithRows:v38 title:@"Dawn Dictation UI"];
  v117[1] = v37;
  objc_super v5 = (void *)MEMORY[0x1E4F94160];
  v35 = [MEMORY[0x1E4F941D8] rowWithTitle:@"framesPerSecond" valueKeyPath:@"typewriterEffectFramesPerSecond"];
  v36 = +[UIScreen mainScreen];
  v34 = objc_msgSend(v35, "minValue:maxValue:", 0.0, (double)objc_msgSend(v36, "maximumFramesPerSecond"));
  v114[0] = v34;
  v33 = [MEMORY[0x1E4F941D8] rowWithTitle:@"charInsertionRate" valueKeyPath:@"typewriterEffectStreamingCharacterInsertionRate"];
  v32 = [v33 minValue:0.0 maxValue:100.0];
  v114[1] = v32;
  v31 = [MEMORY[0x1E4F941D8] rowWithTitle:@"minDuration" valueKeyPath:@"typewriterEffectMinDurationBetweenHypotheses"];
  v30 = [v31 minValue:0.0 maxValue:0.4];
  v114[2] = v30;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:3];
  v28 = [v5 sectionWithRows:v29 title:@"Typewriter animation"];
  v117[2] = v28;
  v6 = (void *)MEMORY[0x1E4F94160];
  v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Glow Effect" valueKeyPath:@"glowEffectEnabled"];
  v113[0] = v27;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Pulse Animation" valueKeyPath:@"pulseAnimationEnabled"];
  v113[1] = v26;
  v25 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Trail Animation" valueKeyPath:@"trailAnimationEnabled"];
  v113[2] = v25;
  v24 = [MEMORY[0x1E4F94108] rowWithTitle:@"PulseFrameRate" valueKeyPath:@"pulseFrameRate"];
  v23 = [a1 frameRates];
  v22 = [a1 frameRatesTitles];
  v21 = [v24 possibleValues:v23 titles:v22];
  v113[3] = v21;
  v20 = [MEMORY[0x1E4F94108] rowWithTitle:@"TrailFrameRate" valueKeyPath:@"trailFrameRate"];
  v7 = [a1 frameRates];
  v8 = [a1 frameRatesTitles];
  v9 = [v20 possibleValues:v7 titles:v8];
  v113[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:5];
  v11 = [v6 sectionWithRows:v10 title:@"Power Evaluation"];
  v117[3] = v11;
  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = (void *)MEMORY[0x1E4F940F8];
  v14 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];
  v112 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
  v17 = [v12 sectionWithRows:v16];
  v117[4] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:5];
  id v52 = [v51 moduleWithTitle:0 contents:v18];

  return v52;
}

+ (id)frameRates
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v2 = +[UIScreen mainScreen];
  uint64_t v3 = [v2 maximumFramesPerSecond];

  if (v3 < 61)
  {
    v7 = &unk_1ED3F0700;
  }
  else
  {
    v9[0] = &unk_1ED3F5010;
    v9[1] = &unk_1ED3F5028;
    v9[2] = &unk_1ED3F5040;
    v4 = NSNumber;
    objc_super v5 = +[UIScreen mainScreen];
    v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "maximumFramesPerSecond"));
    v9[3] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  }
  return v7;
}

+ (id)frameRatesTitles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(a1, "frameRates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) stringValue];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)impactStyles
{
  return &unk_1ED3F0718;
}

+ (id)impactStylesTitles
{
  return &unk_1ED3F0730;
}

+ (id)compositingFilters
{
  v26[44] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F39FE8];
  v26[0] = *MEMORY[0x1E4F3A320];
  v26[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F3A310];
  v26[2] = *MEMORY[0x1E4F3A060];
  v26[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F3A308];
  v26[4] = *MEMORY[0x1E4F3A318];
  v26[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F3A0A0];
  v26[6] = *MEMORY[0x1E4F3A080];
  v26[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F3A098];
  v26[8] = *MEMORY[0x1E4F3A090];
  v26[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3A370];
  v26[10] = *MEMORY[0x1E4F3A088];
  v26[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3A2E0];
  v26[12] = *MEMORY[0x1E4F3A2E8];
  v26[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3A330];
  v26[14] = *MEMORY[0x1E4F3A338];
  v26[15] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3A290];
  v26[16] = *MEMORY[0x1E4F3A298];
  v26[17] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3A2B8];
  v26[18] = *MEMORY[0x1E4F3A280];
  v26[19] = v11;
  uint64_t v12 = *MEMORY[0x1E4F3A2F8];
  v26[20] = *MEMORY[0x1E4F3A2A0];
  v26[21] = v12;
  uint64_t v13 = *MEMORY[0x1E4F3A070];
  v26[22] = *MEMORY[0x1E4F3A2C8];
  v26[23] = v13;
  uint64_t v14 = *MEMORY[0x1E4F3A018];
  v26[24] = *MEMORY[0x1E4F3A220];
  v26[25] = v14;
  uint64_t v15 = *MEMORY[0x1E4F3A300];
  v26[26] = *MEMORY[0x1E4F3A008];
  v26[27] = v15;
  uint64_t v16 = *MEMORY[0x1E4F3A0A8];
  v26[28] = *MEMORY[0x1E4F3A0D8];
  v26[29] = v16;
  uint64_t v17 = *MEMORY[0x1E4F3A328];
  v26[30] = *MEMORY[0x1E4F3A0C8];
  v26[31] = v17;
  uint64_t v18 = *MEMORY[0x1E4F3A240];
  v26[32] = *MEMORY[0x1E4F3A0B0];
  v26[33] = v18;
  uint64_t v19 = *MEMORY[0x1E4F3A250];
  v26[34] = *MEMORY[0x1E4F3A248];
  v26[35] = v19;
  uint64_t v20 = *MEMORY[0x1E4F3A078];
  v26[36] = *MEMORY[0x1E4F3A2D8];
  v26[37] = v20;
  uint64_t v21 = *MEMORY[0x1E4F3A0E0];
  v26[38] = *MEMORY[0x1E4F3A228];
  v26[39] = v21;
  uint64_t v22 = *MEMORY[0x1E4F39FF8];
  v26[40] = *MEMORY[0x1E4F3A2F0];
  v26[41] = v22;
  uint64_t v23 = *MEMORY[0x1E4F3A358];
  v26[42] = *MEMORY[0x1E4F3A270];
  v26[43] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:44];
  return v24;
}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (double)cursorGlowBlurRadius
{
  return self->_cursorGlowBlurRadius;
}

- (double)trailingGlowBlurRadius
{
  return self->_trailingGlowBlurRadius;
}

- (NSString)lightModeCompositingFiler
{
  return self->_lightModeCompositingFiler;
}

- (NSString)darkModeCompositingFiler
{
  return self->_darkModeCompositingFiler;
}

- (double)trailingGlowDuration
{
  return self->_trailingGlowDuration;
}

- (double)tailHeight
{
  return self->_tailHeight;
}

- (double)headHeight
{
  return self->_headHeight;
}

- (double)trailingGlowAlpha
{
  return self->_trailingGlowAlpha;
}

- (double)cursorGlowAlphaMin
{
  return self->_cursorGlowAlphaMin;
}

- (double)cursorGlowAlphaMax
{
  return self->_cursorGlowAlphaMax;
}

- (double)revealFadeTime
{
  return self->_revealFadeTime;
}

- (double)typewriterEffectFramesPerSecond
{
  return self->_typewriterEffectFramesPerSecond;
}

- (double)typewriterEffectStreamingCharacterInsertionRate
{
  return self->_typewriterEffectStreamingCharacterInsertionRate;
}

- (double)typewriterEffectMinDurationBetweenHypotheses
{
  return self->_typewriterEffectMinDurationBetweenHypotheses;
}

- (BOOL)glowEffectEnabled
{
  return self->_glowEffectEnabled;
}

- (BOOL)pulseAnimationEnabled
{
  return self->_pulseAnimationEnabled;
}

- (BOOL)trailAnimationEnabled
{
  return self->_trailAnimationEnabled;
}

- (double)pulseFrameRate
{
  return self->_pulseFrameRate;
}

- (double)trailFrameRate
{
  return self->_trailFrameRate;
}

- (BOOL)soundReactiveCursorEnabled
{
  return self->_soundReactiveCursorEnabled;
}

- (double)audioPollingRate
{
  return self->_audioPollingRate;
}

- (double)audioWidthMaxBump
{
  return self->_audioWidthMaxBump;
}

- (double)audioHeightMaxBump
{
  return self->_audioHeightMaxBump;
}

- (double)audioScaleAnimationDampingRatio
{
  return self->_audioScaleAnimationDampingRatio;
}

- (double)audioScaleAnimationResponse
{
  return self->_audioScaleAnimationResponse;
}

- (double)impactIntensity
{
  return self->_impactIntensity;
}

- (double)pulseWidthMaxBump
{
  return self->_pulseWidthMaxBump;
}

- (double)pulseHeightMaxBump
{
  return self->_pulseHeightMaxBump;
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (BOOL)voiceCommandsInIWorkEnabled
{
  return self->_voiceCommandsInIWorkEnabled;
}

- (double)cursorGlowBorderPadding
{
  return self->_cursorGlowBorderPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeCompositingFiler, 0);
  objc_storeStrong((id *)&self->_lightModeCompositingFiler, 0);
}

@end