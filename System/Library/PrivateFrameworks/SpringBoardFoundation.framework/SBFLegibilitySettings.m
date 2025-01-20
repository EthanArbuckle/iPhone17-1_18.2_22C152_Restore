@interface SBFLegibilitySettings
+ (id)settingsControllerModule;
- (double)appIconGrabberDarkShadowStrength;
- (double)appIconGrabberLightShadowStrength;
- (double)appIconGrabberStrengthForStyle:(int64_t)a3;
- (double)dateDarkShadowStrength;
- (double)dateLightShadowStrength;
- (double)dateStrengthForStyle:(int64_t)a3;
- (double)folderTitleDarkShadowStrength;
- (double)folderTitleLightShadowStrength;
- (double)folderTitleStrengthForStyle:(int64_t)a3;
- (double)iconLabelDarkShadowStrength;
- (double)iconLabelLightShadowStrength;
- (double)iconLabelStrengthForStyle:(int64_t)a3;
- (double)logoutButtonGlyphDarkShadowStrength;
- (double)logoutButtonGlyphLightShadowStrength;
- (double)logoutButtonGlyphStrengthForStyle:(int64_t)a3;
- (double)logoutButtonTextDarkShadowStrength;
- (double)logoutButtonTextLightShadowStrength;
- (double)logoutButtonTextStrengthForStyle:(int64_t)a3;
- (double)slideToUnlockDarkShadowStrength;
- (double)slideToUnlockLightShadowStrength;
- (double)slideToUnlockStrengthForStyle:(int64_t)a3;
- (double)statusTextDarkShadowStrength;
- (double)statusTextLightShadowStrength;
- (double)statusTextStrengthForStyle:(int64_t)a3;
- (double)timeDarkShadowStrength;
- (double)timeLightShadowStrength;
- (double)timeStrengthForStyle:(int64_t)a3;
- (double)timerDialDarkShadowStrength;
- (double)timerDialLightShadowStrength;
- (double)timerDialStrengthForStyle:(int64_t)a3;
- (double)timerTextDarkShadowStrength;
- (double)timerTextLightShadowStrength;
- (double)timerTextStrengthForStyle:(int64_t)a3;
- (double)userPictureDarkShadowStrength;
- (double)userPictureLightShadowStrength;
- (double)userPictureStrengthForStyle:(int64_t)a3;
- (void)setAppIconGrabberDarkShadowStrength:(double)a3;
- (void)setAppIconGrabberLightShadowStrength:(double)a3;
- (void)setDateDarkShadowStrength:(double)a3;
- (void)setDateLightShadowStrength:(double)a3;
- (void)setDefaultValues;
- (void)setFolderTitleDarkShadowStrength:(double)a3;
- (void)setFolderTitleLightShadowStrength:(double)a3;
- (void)setIconLabelDarkShadowStrength:(double)a3;
- (void)setIconLabelLightShadowStrength:(double)a3;
- (void)setLogoutButtonGlyphDarkShadowStrength:(double)a3;
- (void)setLogoutButtonGlyphLightShadowStrength:(double)a3;
- (void)setLogoutButtonTextDarkShadowStrength:(double)a3;
- (void)setLogoutButtonTextLightShadowStrength:(double)a3;
- (void)setSlideToUnlockDarkShadowStrength:(double)a3;
- (void)setSlideToUnlockLightShadowStrength:(double)a3;
- (void)setStatusTextDarkShadowStrength:(double)a3;
- (void)setStatusTextLightShadowStrength:(double)a3;
- (void)setTimeDarkShadowStrength:(double)a3;
- (void)setTimeLightShadowStrength:(double)a3;
- (void)setTimerDialDarkShadowStrength:(double)a3;
- (void)setTimerDialLightShadowStrength:(double)a3;
- (void)setTimerTextDarkShadowStrength:(double)a3;
- (void)setTimerTextLightShadowStrength:(double)a3;
- (void)setUserPictureDarkShadowStrength:(double)a3;
- (void)setUserPictureLightShadowStrength:(double)a3;
@end

@implementation SBFLegibilitySettings

- (void)setDefaultValues
{
  [(SBFLegibilitySettings *)self setSlideToUnlockDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setSlideToUnlockLightShadowStrength:0.75];
  [(SBFLegibilitySettings *)self setAppIconGrabberDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setAppIconGrabberLightShadowStrength:0.75];
  [(SBFLegibilitySettings *)self setTimeDarkShadowStrength:0.25];
  [(SBFLegibilitySettings *)self setTimeLightShadowStrength:0.25];
  [(SBFLegibilitySettings *)self setDateDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setDateLightShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setStatusTextDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setStatusTextLightShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setIconLabelDarkShadowStrength:0.3];
  [(SBFLegibilitySettings *)self setIconLabelLightShadowStrength:0.0];
  [(SBFLegibilitySettings *)self setFolderTitleDarkShadowStrength:0.25];
  [(SBFLegibilitySettings *)self setFolderTitleLightShadowStrength:0.25];
  [(SBFLegibilitySettings *)self setTimerDialDarkShadowStrength:0.15];
  [(SBFLegibilitySettings *)self setTimerDialLightShadowStrength:0.15];
  [(SBFLegibilitySettings *)self setTimerTextDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setTimerTextLightShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setLogoutButtonGlyphDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setLogoutButtonGlyphLightShadowStrength:0.75];
  [(SBFLegibilitySettings *)self setLogoutButtonTextDarkShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setLogoutButtonTextLightShadowStrength:0.35];
  [(SBFLegibilitySettings *)self setUserPictureDarkShadowStrength:0.15];
  [(SBFLegibilitySettings *)self setUserPictureLightShadowStrength:0.15];
}

+ (id)settingsControllerModule
{
  v49[20] = *MEMORY[0x1E4F143B8];
  v47 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Slide To Unlock Dark Shadow Strength" valueKeyPath:@"slideToUnlockDarkShadowStrength"];
  v46 = [v47 minValue:0.0 maxValue:5.0];
  v49[0] = v46;
  v45 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Slide To Unlock Light Shadow Strength" valueKeyPath:@"slideToUnlockLightShadowStrength"];
  v44 = [v45 minValue:0.0 maxValue:5.0];
  v49[1] = v44;
  v43 = [MEMORY[0x1E4F941E0] rowWithTitle:@"App Icon Grabber Dark Shadow Strength" valueKeyPath:@"appIconGrabberDarkShadowStrength"];
  v42 = [v43 minValue:0.0 maxValue:5.0];
  v49[2] = v42;
  v41 = [MEMORY[0x1E4F941E0] rowWithTitle:@"App Icon Grabber Light Shadow Strength" valueKeyPath:@"appIconGrabberLightShadowStrength"];
  v40 = [v41 minValue:0.0 maxValue:5.0];
  v49[3] = v40;
  v39 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Time Dark Shadow Strength" valueKeyPath:@"timeDarkShadowStrength"];
  v38 = [v39 minValue:0.0 maxValue:5.0];
  v49[4] = v38;
  v37 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Time Light Shadow Strength" valueKeyPath:@"timeLightShadowStrength"];
  v36 = [v37 minValue:0.0 maxValue:5.0];
  v49[5] = v36;
  v35 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Date Dark Shadow Strength" valueKeyPath:@"dateDarkShadowStrength"];
  v34 = [v35 minValue:0.0 maxValue:5.0];
  v49[6] = v34;
  v33 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Date Light Shadow Strength" valueKeyPath:@"dateLightShadowStrength"];
  v32 = [v33 minValue:0.0 maxValue:5.0];
  v49[7] = v32;
  v31 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Icon Label Dark Shadow Strength" valueKeyPath:@"iconLabelDarkShadowStrength"];
  v30 = [v31 minValue:0.0 maxValue:5.0];
  v49[8] = v30;
  v29 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Icon Label Light Shadow Strength" valueKeyPath:@"iconLabelLightShadowStrength"];
  v28 = [v29 minValue:0.0 maxValue:5.0];
  v49[9] = v28;
  v27 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Folder Title Dark Shadow Strength" valueKeyPath:@"folderTitleDarkShadowStrength"];
  v26 = [v27 minValue:0.0 maxValue:5.0];
  v49[10] = v26;
  v25 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Folder Title Light Shadow Strength" valueKeyPath:@"folderTitleLightShadowStrength"];
  v24 = [v25 minValue:0.0 maxValue:5.0];
  v49[11] = v24;
  v23 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Logout Button Glyph Dark Shadow Strength" valueKeyPath:@"logoutButtonGlyphDarkShadowStrength"];
  v22 = [v23 minValue:0.0 maxValue:5.0];
  v49[12] = v22;
  v21 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Logout Button Glyph Light Shadow Strength" valueKeyPath:@"logoutButtonGlyphLightShadowStrength"];
  v20 = [v21 minValue:0.0 maxValue:5.0];
  v49[13] = v20;
  v18 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Logout Button Text Dark Shadow Strength" valueKeyPath:@"logoutButtonTextDarkShadowStrength"];
  v17 = [v18 minValue:0.0 maxValue:5.0];
  v49[14] = v17;
  v2 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Logout Button Text Light Shadow Strength" valueKeyPath:@"logoutButtonTextLightShadowStrength"];
  v3 = [v2 minValue:0.0 maxValue:5.0];
  v49[15] = v3;
  v4 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Status Text Dark Shadow Strength" valueKeyPath:@"statusTextDarkShadowStrength"];
  v5 = [v4 minValue:0.0 maxValue:5.0];
  v49[16] = v5;
  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Status Text Light Shadow Strength" valueKeyPath:@"statusTextLightShadowStrength"];
  v7 = [v6 minValue:0.0 maxValue:5.0];
  v49[17] = v7;
  v8 = [MEMORY[0x1E4F941E0] rowWithTitle:@"User Picture Dark Shadow Strength" valueKeyPath:@"userPictureDarkShadowStrength"];
  v9 = [v8 minValue:0.0 maxValue:5.0];
  v49[18] = v9;
  v10 = [MEMORY[0x1E4F941E0] rowWithTitle:@"User Picture Light Shadow Strength" valueKeyPath:@"userPictureLightShadowStrength"];
  v11 = [v10 minValue:0.0 maxValue:5.0];
  v49[19] = v11;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:20];

  v12 = [MEMORY[0x1E4F94168] sectionWithRows:v19 title:@"Lock Screen Settings"];
  v13 = (void *)MEMORY[0x1E4F94168];
  v48 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v15 = [v13 moduleWithTitle:@"Legibility Settings" contents:v14];

  return v15;
}

- (double)slideToUnlockStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self slideToUnlockDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self slideToUnlockLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)appIconGrabberStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self appIconGrabberDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self appIconGrabberLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)timeStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self timeDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self timeLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)dateStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self dateDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self dateLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)statusTextStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self statusTextDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self statusTextLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)iconLabelStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self iconLabelDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self iconLabelLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)folderTitleStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self folderTitleDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self folderTitleLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)timerTextStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self timerTextDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self timerTextLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)timerDialStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self timerDialDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self timerDialLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)logoutButtonGlyphStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self logoutButtonGlyphDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self logoutButtonGlyphLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)logoutButtonTextStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self logoutButtonTextDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self logoutButtonTextLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)userPictureStrengthForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBFLegibilitySettings *)self userPictureDarkShadowStrength];
  }
  else if (a3 == 2)
  {
    [(SBFLegibilitySettings *)self userPictureLightShadowStrength];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)slideToUnlockDarkShadowStrength
{
  return self->_slideToUnlockDarkShadowStrength;
}

- (void)setSlideToUnlockDarkShadowStrength:(double)a3
{
  self->_slideToUnlockDarkShadowStrength = a3;
}

- (double)slideToUnlockLightShadowStrength
{
  return self->_slideToUnlockLightShadowStrength;
}

- (void)setSlideToUnlockLightShadowStrength:(double)a3
{
  self->_slideToUnlockLightShadowStrength = a3;
}

- (double)appIconGrabberDarkShadowStrength
{
  return self->_appIconGrabberDarkShadowStrength;
}

- (void)setAppIconGrabberDarkShadowStrength:(double)a3
{
  self->_appIconGrabberDarkShadowStrength = a3;
}

- (double)appIconGrabberLightShadowStrength
{
  return self->_appIconGrabberLightShadowStrength;
}

- (void)setAppIconGrabberLightShadowStrength:(double)a3
{
  self->_appIconGrabberLightShadowStrength = a3;
}

- (double)timeDarkShadowStrength
{
  return self->_timeDarkShadowStrength;
}

- (void)setTimeDarkShadowStrength:(double)a3
{
  self->_timeDarkShadowStrength = a3;
}

- (double)timeLightShadowStrength
{
  return self->_timeLightShadowStrength;
}

- (void)setTimeLightShadowStrength:(double)a3
{
  self->_timeLightShadowStrength = a3;
}

- (double)dateDarkShadowStrength
{
  return self->_dateDarkShadowStrength;
}

- (void)setDateDarkShadowStrength:(double)a3
{
  self->_dateDarkShadowStrength = a3;
}

- (double)dateLightShadowStrength
{
  return self->_dateLightShadowStrength;
}

- (void)setDateLightShadowStrength:(double)a3
{
  self->_dateLightShadowStrength = a3;
}

- (double)statusTextDarkShadowStrength
{
  return self->_statusTextDarkShadowStrength;
}

- (void)setStatusTextDarkShadowStrength:(double)a3
{
  self->_statusTextDarkShadowStrength = a3;
}

- (double)statusTextLightShadowStrength
{
  return self->_statusTextLightShadowStrength;
}

- (void)setStatusTextLightShadowStrength:(double)a3
{
  self->_statusTextLightShadowStrength = a3;
}

- (double)iconLabelDarkShadowStrength
{
  return self->_iconLabelDarkShadowStrength;
}

- (void)setIconLabelDarkShadowStrength:(double)a3
{
  self->_iconLabelDarkShadowStrength = a3;
}

- (double)iconLabelLightShadowStrength
{
  return self->_iconLabelLightShadowStrength;
}

- (void)setIconLabelLightShadowStrength:(double)a3
{
  self->_iconLabelLightShadowStrength = a3;
}

- (double)folderTitleDarkShadowStrength
{
  return self->_folderTitleDarkShadowStrength;
}

- (void)setFolderTitleDarkShadowStrength:(double)a3
{
  self->_folderTitleDarkShadowStrength = a3;
}

- (double)folderTitleLightShadowStrength
{
  return self->_folderTitleLightShadowStrength;
}

- (void)setFolderTitleLightShadowStrength:(double)a3
{
  self->_folderTitleLightShadowStrength = a3;
}

- (double)timerTextDarkShadowStrength
{
  return self->_timerTextDarkShadowStrength;
}

- (void)setTimerTextDarkShadowStrength:(double)a3
{
  self->_timerTextDarkShadowStrength = a3;
}

- (double)timerTextLightShadowStrength
{
  return self->_timerTextLightShadowStrength;
}

- (void)setTimerTextLightShadowStrength:(double)a3
{
  self->_timerTextLightShadowStrength = a3;
}

- (double)timerDialDarkShadowStrength
{
  return self->_timerDialDarkShadowStrength;
}

- (void)setTimerDialDarkShadowStrength:(double)a3
{
  self->_timerDialDarkShadowStrength = a3;
}

- (double)timerDialLightShadowStrength
{
  return self->_timerDialLightShadowStrength;
}

- (void)setTimerDialLightShadowStrength:(double)a3
{
  self->_timerDialLightShadowStrength = a3;
}

- (double)logoutButtonGlyphDarkShadowStrength
{
  return self->_logoutButtonGlyphDarkShadowStrength;
}

- (void)setLogoutButtonGlyphDarkShadowStrength:(double)a3
{
  self->_logoutButtonGlyphDarkShadowStrength = a3;
}

- (double)logoutButtonGlyphLightShadowStrength
{
  return self->_logoutButtonGlyphLightShadowStrength;
}

- (void)setLogoutButtonGlyphLightShadowStrength:(double)a3
{
  self->_logoutButtonGlyphLightShadowStrength = a3;
}

- (double)logoutButtonTextDarkShadowStrength
{
  return self->_logoutButtonTextDarkShadowStrength;
}

- (void)setLogoutButtonTextDarkShadowStrength:(double)a3
{
  self->_logoutButtonTextDarkShadowStrength = a3;
}

- (double)logoutButtonTextLightShadowStrength
{
  return self->_logoutButtonTextLightShadowStrength;
}

- (void)setLogoutButtonTextLightShadowStrength:(double)a3
{
  self->_logoutButtonTextLightShadowStrength = a3;
}

- (double)userPictureDarkShadowStrength
{
  return self->_userPictureDarkShadowStrength;
}

- (void)setUserPictureDarkShadowStrength:(double)a3
{
  self->_userPictureDarkShadowStrength = a3;
}

- (double)userPictureLightShadowStrength
{
  return self->_userPictureLightShadowStrength;
}

- (void)setUserPictureLightShadowStrength:(double)a3
{
  self->_userPictureLightShadowStrength = a3;
}

@end