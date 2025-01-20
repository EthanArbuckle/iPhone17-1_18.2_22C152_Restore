@interface MIUIDisplayConfiguration
+ (id)lockScreenConfiguration;
+ (id)standardConfiguration;
- (BOOL)isDeletionAvailable;
- (BOOL)isEditingAvailable;
- (BOOL)isHomeIndicatorHidden;
- (BOOL)isHostingView;
- (BOOL)isLockScreen;
- (BOOL)isShareDuringEmergencyCallVisible;
- (BOOL)isShowWhenLockedVisible;
- (BOOL)shouldSaveDataToHealthDetails;
- (BOOL)shouldShowDonateLifeRegistrationIfAvailable;
- (BOOL)shouldShowDoneButton;
- (BOOL)suggestHealthData;
- (MIUIDisplayConfiguration)init;
- (MIUIDisplayConfiguration)initWithEntryPoint:(int64_t)a3 isEditingAvailable:(BOOL)a4 isDeletionAvailable:(BOOL)a5 shouldShowDonateLifeRegistrationIfAvailable:(BOOL)a6 isShowWhenLockedVisible:(BOOL)a7 isShareDuringEmergencyCallVisible:(BOOL)a8 accessPoint:(int64_t)a9;
- (int64_t)accessPoint;
- (int64_t)entryPoint;
- (void)setAccessPoint:(int64_t)a3;
- (void)setEntryPoint:(int64_t)a3;
- (void)setIsDeletionAvailable:(BOOL)a3;
- (void)setIsEditingAvailable:(BOOL)a3;
- (void)setIsHomeIndicatorHidden:(BOOL)a3;
- (void)setIsHostingView:(BOOL)a3;
- (void)setIsLockScreen:(BOOL)a3;
- (void)setIsShareDuringEmergencyCallVisible:(BOOL)a3;
- (void)setIsShowWhenLockedVisible:(BOOL)a3;
- (void)setShouldSaveDataToHealthDetails:(BOOL)a3;
- (void)setShouldShowDonateLifeRegistrationIfAvailable:(BOOL)a3;
- (void)setShouldShowDoneButton:(BOOL)a3;
- (void)setSuggestHealthData:(BOOL)a3;
@end

@implementation MIUIDisplayConfiguration

+ (id)lockScreenConfiguration
{
  v2 = objc_alloc_init(MIUIDisplayConfiguration);
  [(MIUIDisplayConfiguration *)v2 setIsLockScreen:1];
  [(MIUIDisplayConfiguration *)v2 setIsEditingAvailable:0];
  [(MIUIDisplayConfiguration *)v2 setIsShowWhenLockedVisible:0];
  [(MIUIDisplayConfiguration *)v2 setIsShareDuringEmergencyCallVisible:0];
  [(MIUIDisplayConfiguration *)v2 setAccessPoint:0];
  return v2;
}

+ (id)standardConfiguration
{
  v2 = objc_alloc_init(MIUIDisplayConfiguration);
  return v2;
}

- (MIUIDisplayConfiguration)initWithEntryPoint:(int64_t)a3 isEditingAvailable:(BOOL)a4 isDeletionAvailable:(BOOL)a5 shouldShowDonateLifeRegistrationIfAvailable:(BOOL)a6 isShowWhenLockedVisible:(BOOL)a7 isShareDuringEmergencyCallVisible:(BOOL)a8 accessPoint:(int64_t)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MIUIDisplayConfiguration;
  v15 = [(MIUIDisplayConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(MIUIDisplayConfiguration *)v15 setEntryPoint:a3];
    [(MIUIDisplayConfiguration *)v16 setIsEditingAvailable:v13];
    [(MIUIDisplayConfiguration *)v16 setIsDeletionAvailable:v12];
    [(MIUIDisplayConfiguration *)v16 setShouldShowDonateLifeRegistrationIfAvailable:v11];
    [(MIUIDisplayConfiguration *)v16 setIsShowWhenLockedVisible:v10];
    [(MIUIDisplayConfiguration *)v16 setIsShareDuringEmergencyCallVisible:v9];
    [(MIUIDisplayConfiguration *)v16 setAccessPoint:a9];
  }
  return v16;
}

- (MIUIDisplayConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIUIDisplayConfiguration;
  v2 = [(MIUIDisplayConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIUIDisplayConfiguration *)v2 setEntryPoint:0];
    [(MIUIDisplayConfiguration *)v3 setIsEditingAvailable:1];
    [(MIUIDisplayConfiguration *)v3 setIsDeletionAvailable:0];
    [(MIUIDisplayConfiguration *)v3 setShouldShowDonateLifeRegistrationIfAvailable:0];
    [(MIUIDisplayConfiguration *)v3 setIsShowWhenLockedVisible:1];
    [(MIUIDisplayConfiguration *)v3 setIsShareDuringEmergencyCallVisible:1];
    [(MIUIDisplayConfiguration *)v3 setAccessPoint:0];
    [(MIUIDisplayConfiguration *)v3 setIsHomeIndicatorHidden:0];
    [(MIUIDisplayConfiguration *)v3 setSuggestHealthData:0];
    [(MIUIDisplayConfiguration *)v3 setShouldSaveDataToHealthDetails:0];
    [(MIUIDisplayConfiguration *)v3 setIsLockScreen:0];
    [(MIUIDisplayConfiguration *)v3 setIsHostingView:0];
    [(MIUIDisplayConfiguration *)v3 setShouldShowDoneButton:0];
  }
  return v3;
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (BOOL)isEditingAvailable
{
  return self->_isEditingAvailable;
}

- (void)setIsEditingAvailable:(BOOL)a3
{
  self->_isEditingAvailable = a3;
}

- (BOOL)isDeletionAvailable
{
  return self->_isDeletionAvailable;
}

- (void)setIsDeletionAvailable:(BOOL)a3
{
  self->_isDeletionAvailable = a3;
}

- (BOOL)shouldShowDonateLifeRegistrationIfAvailable
{
  return self->_shouldShowDonateLifeRegistrationIfAvailable;
}

- (void)setShouldShowDonateLifeRegistrationIfAvailable:(BOOL)a3
{
  self->_shouldShowDonateLifeRegistrationIfAvailable = a3;
}

- (BOOL)isShowWhenLockedVisible
{
  return self->_isShowWhenLockedVisible;
}

- (void)setIsShowWhenLockedVisible:(BOOL)a3
{
  self->_isShowWhenLockedVisible = a3;
}

- (BOOL)isShareDuringEmergencyCallVisible
{
  return self->_isShareDuringEmergencyCallVisible;
}

- (void)setIsShareDuringEmergencyCallVisible:(BOOL)a3
{
  self->_isShareDuringEmergencyCallVisible = a3;
}

- (BOOL)suggestHealthData
{
  return self->_suggestHealthData;
}

- (void)setSuggestHealthData:(BOOL)a3
{
  self->_suggestHealthData = a3;
}

- (BOOL)isHomeIndicatorHidden
{
  return self->_isHomeIndicatorHidden;
}

- (void)setIsHomeIndicatorHidden:(BOOL)a3
{
  self->_isHomeIndicatorHidden = a3;
}

- (int64_t)accessPoint
{
  return self->_accessPoint;
}

- (void)setAccessPoint:(int64_t)a3
{
  self->_accessPoint = a3;
}

- (BOOL)shouldSaveDataToHealthDetails
{
  return self->_shouldSaveDataToHealthDetails;
}

- (void)setShouldSaveDataToHealthDetails:(BOOL)a3
{
  self->_shouldSaveDataToHealthDetails = a3;
}

- (BOOL)isLockScreen
{
  return self->_isLockScreen;
}

- (void)setIsLockScreen:(BOOL)a3
{
  self->_isLockScreen = a3;
}

- (BOOL)isHostingView
{
  return self->_isHostingView;
}

- (void)setIsHostingView:(BOOL)a3
{
  self->_isHostingView = a3;
}

- (BOOL)shouldShowDoneButton
{
  return self->_shouldShowDoneButton;
}

- (void)setShouldShowDoneButton:(BOOL)a3
{
  self->_shouldShowDoneButton = a3;
}

@end