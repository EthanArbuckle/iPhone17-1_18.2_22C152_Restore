@interface COSSOSController
+ (BOOL)controllerNeedsToRun;
- (BOOL)finishedLoadingNewton;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)isTinker;
- (BOOL)shouldShowBacktrack;
- (BOOL)shouldShowKappa;
- (BOOL)shouldShowMandrake;
- (BOOL)shouldShowNewtonForEligibility:(unint64_t)a3;
- (COSSOSController)init;
- (NRDevice)device;
- (UIActivityIndicatorView)spinner;
- (double)waitScreenPushGracePeriod;
- (id)assetNameForSafetyFeatureRow:(int64_t)a3;
- (id)backtrackSubtitle;
- (id)detailString;
- (id)emergencySOSSubtitle;
- (id)fallDetectionSubtitle;
- (id)fallDetectionTitle;
- (id)getSafetyFeatureRows;
- (id)imageWithAssetName:(id)a3;
- (id)kappaSubtitle;
- (id)localizedWaitScreenDescription;
- (id)mandrakeSubtitle;
- (id)privacyBundles;
- (id)safetyFeaturesFromRows:(id)a3;
- (id)subtitleForSafetyFeatureRow:(int64_t)a3;
- (id)suggestedButtonTitle;
- (id)titleForSafetyFeatureRow:(int64_t)a3;
- (id)titleString;
- (unint64_t)newtonEligibility;
- (void)_fetchNewtonEligibility:(id)a3;
- (void)_startLoading;
- (void)_stopLoading;
- (void)didEstablishHold;
- (void)setFinishedLoadingNewton:(BOOL)a3;
- (void)setNewtonEligibility:(unint64_t)a3;
- (void)setNewtonSettingBasedOnEligibility;
- (void)setSpinner:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateAvailableSafetyFeatures;
- (void)viewDidLoad;
@end

@implementation COSSOSController

- (COSSOSController)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSSOSController;
  v2 = [(COSOptinViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(COSSOSController *)v2 setStyle:2];
    v3->_newtonEligibility = 2;
    uint64_t v4 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    device = v3->_device;
    v3->_device = (NRDevice *)v4;

    v6 = [(NRDevice *)v3->_device valueForProperty:NRDevicePropertyIsAltAccount];
    v3->_isTinker = [v6 BOOLValue];
  }
  return v3;
}

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)COSSOSController;
  [(COSSOSController *)&v14 viewDidLoad];
  [(COSSOSController *)self setFinishedLoadingNewton:0];
  v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v3;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  v5 = [(COSSOSController *)self view];
  [v5 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v7 = [(COSSOSController *)self buttonTray];
  objc_super v8 = [v7 centerXAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
  v11 = [(COSSOSController *)self buttonTray];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  [(COSSOSController *)self setNewtonSettingBasedOnEligibility];
}

- (void)_startLoading
{
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  id v3 = [(COSSOSController *)self suggestedChoiceButton];
  [v3 setEnabled:0];
}

- (void)_stopLoading
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  id v3 = [(COSSOSController *)self suggestedChoiceButton];
  [v3 setEnabled:1];
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SAFETY_TITLE" value:&stru_100249230 table:@"SOSSettings"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SAFETY_SUBTITLE" value:&stru_100249230 table:@"SOSSettings"];

  return v3;
}

- (id)privacyBundles
{
  return &off_10025BBF0;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SAFETY_CONTINUE" value:&stru_100249230 table:@"SOSSettings"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(COSSOSController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (BOOL)shouldShowNewtonForEligibility:(unint64_t)a3
{
  return a3 - 3 < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)shouldShowKappa
{
  unsigned int v2 = [sub_100017DC0() isKappaDetectionSupportedOnActiveWatch];
  if (v2)
  {
    id v3 = sub_100017DC0();
    LOBYTE(v2) = _[v3 isKappaVisible];
  }
  return v2;
}

- (BOOL)shouldShowMandrake
{
  id v2 = sub_100017DC0();

  return _[v2 activeDeviceSupportsMandrake];
}

- (BOOL)shouldShowBacktrack
{
  device = self->_device;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AF61239-2126-4FD6-8E7A-CDA2D7A0BFE9"];
  if ([(NRDevice *)device supportsCapability:v4]) {
    unsigned int v5 = ![(COSSOSController *)self isTinker];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)updateAvailableSafetyFeatures
{
  v13 = [(COSSOSController *)self getSafetyFeatureRows];
  -[COSSOSController safetyFeaturesFromRows:](self, "safetyFeaturesFromRows:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v8 = [v7 title];
        v9 = [v7 subtitle];
        v10 = [v7 assetName];
        v11 = [(COSSOSController *)self imageWithAssetName:v10];
        v12 = +[UIColor systemRedColor];
        [(COSSOSController *)self addBulletedListItemWithTitle:v8 description:v9 image:v11 tintColor:v12];
      }
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (id)imageWithAssetName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = +[UIImage imageNamed:v3 inBundle:v4];

  if (!v5)
  {
    v6 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:22.0];
    v7 = +[UIImage systemImageNamed:v3 withConfiguration:v6];
    objc_super v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[UIImage _systemImageNamed:v3 withConfiguration:v6];
    }
    uint64_t v5 = v9;
  }

  return v5;
}

- (id)getSafetyFeatureRows
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:&off_10025BDD0];
  if ([(COSSOSController *)self shouldShowNewtonForEligibility:[(COSSOSController *)self newtonEligibility]])
  {
    [v3 addObject:&off_10025BDE8];
  }
  if ([(COSSOSController *)self shouldShowKappa]) {
    [v3 addObject:&off_10025BE00];
  }
  if ([(COSSOSController *)self shouldShowMandrake]) {
    [v3 addObject:&off_10025BE18];
  }
  if ([(COSSOSController *)self shouldShowBacktrack]) {
    [v3 addObject:&off_10025BE30];
  }

  return v3;
}

- (id)safetyFeaturesFromRows:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue];
        v11 = [(COSSOSController *)self titleForSafetyFeatureRow:v10];
        v12 = [(COSSOSController *)self subtitleForSafetyFeatureRow:v10];
        v13 = [(COSSOSController *)self assetNameForSafetyFeatureRow:v10];
        objc_super v14 = [[COSSOSSafetyFeature alloc] initWithTitle:v11 subtitle:v12 assetName:v13];
        [v5 addObject:v14];
      }
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)titleForSafetyFeatureRow:(int64_t)a3
{
  id v3 = (__CFString *)self;
  switch(a3)
  {
    case 0:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = v4;
      CFStringRef v6 = @"SOS_EMERGENCY_SOS_TITLE";
      CFStringRef v7 = @"SOSSettings";
      goto LABEL_8;
    case 1:
      id v3 = [(COSSOSController *)self fallDetectionTitle];
      goto LABEL_9;
    case 2:
      if ([sub_100017DC0() isKappaUnmasked])
      {
        id v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"SOS_KAPPA_TITLE";
        CFStringRef v7 = @"Localizable-Kappa";
LABEL_8:
        id v3 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:v7];
      }
      else
      {
        id v3 = @"Kappa";
      }
LABEL_9:
      return v3;
    case 3:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = v4;
      CFStringRef v6 = @"SOS_MANDRAKE_TITLE";
      CFStringRef v7 = @"Localizable-Mandrake";
      goto LABEL_8;
    case 4:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = v4;
      CFStringRef v6 = @"SOS_FOOTPRINT_TITLE";
      CFStringRef v7 = @"Localizable-Footprint";
      goto LABEL_8;
    default:
      goto LABEL_9;
  }
}

- (id)subtitleForSafetyFeatureRow:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      self = [(COSSOSController *)self emergencySOSSubtitle];
      goto LABEL_10;
    case 1:
      self = [(COSSOSController *)self fallDetectionSubtitle];
      goto LABEL_10;
    case 2:
      self = [(COSSOSController *)self kappaSubtitle];
      goto LABEL_10;
    case 3:
      self = [(COSSOSController *)self mandrakeSubtitle];
      goto LABEL_10;
    case 4:
      self = [(COSSOSController *)self backtrackSubtitle];
LABEL_10:
      break;
    default:
      break;
  }
  return self;
}

- (id)assetNameForSafetyFeatureRow:(int64_t)a3
{
  device = self->_device;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"622B6312-95FA-4F09-9148-69E286A9C31F"];
  unsigned int v6 = [(NRDevice *)device supportsCapability:v5];

  CFStringRef v7 = @"SOS";
  switch(a3)
  {
    case 1:
      CFStringRef v7 = @"fall_detection";
      break;
    case 2:
      unsigned int v8 = [sub_100017DC0() isKappaUnmasked];
      id v9 = @"CrDetect_Icon_45";
      if (!v8) {
        id v9 = @"SOS";
      }
      goto LABEL_9;
    case 3:
      CFStringRef v7 = @"Mandrake_Icon_40";
      break;
    case 4:
      id v9 = @"Backtrack_Icon_40";
      if (v6) {
        id v9 = @"BacktrackWorkout_Icon_40";
      }
LABEL_9:
      CFStringRef v7 = v9;
      break;
    default:
      break;
  }

  return v7;
}

- (id)emergencySOSSubtitle
{
  if ([(COSSOSController *)self isTinker])
  {
    id v2 = [UIApp setupController];
    uint64_t v3 = [v2 tinkerUserName];
    uint64_t v4 = [v3 localizedCapitalizedString];
    id v5 = (void *)v4;
    if (v4) {
      unsigned int v6 = (__CFString *)v4;
    }
    else {
      unsigned int v6 = &stru_100249230;
    }
    CFStringRef v7 = v6;

    unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"SOS_EMERGENCY_SOS_SUBTITLE_TINKER" value:&stru_100249230 table:@"SOSSettings"];

    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
  }
  else
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"SOS_EMERGENCY_SOS_SUBTITLE" value:&stru_100249230 table:@"SOSSettings"];
  }

  return v10;
}

- (id)fallDetectionTitle
{
  if ([(COSSOSController *)self finishedLoadingNewton]
    && (id)[(COSSOSController *)self newtonEligibility] == (id)4)
  {
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    CFStringRef v5 = @"SOS_NEWTON_WOMODE_TITLE";
  }
  else
  {
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    CFStringRef v5 = @"SOS_NEWTON_TITLE";
  }
  unsigned int v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"SOSSettings"];

  return v6;
}

- (id)fallDetectionSubtitle
{
  unsigned int v2 = [(COSSOSController *)self isTinker];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"SOS_NEWTON_SUBTITLE_TINKER";
  }
  else {
    CFStringRef v5 = @"SOS_NEWTON_SUBTITLE";
  }
  unsigned int v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"SOSSettings"];

  return v6;
}

- (id)kappaSubtitle
{
  unsigned int v2 = [(COSSOSController *)self isTinker];
  unsigned int v3 = [sub_100017DC0() isKappaUnmasked];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v5 = v4;
  CFStringRef v6 = @"SOS_KAPPA_SUBTITLE_TINKER_MASKED";
  if (v3) {
    CFStringRef v6 = @"SOS_KAPPA_SUBTITLE_TINKER";
  }
  CFStringRef v7 = @"SOS_KAPPA_SUBTITLE";
  if (!v3) {
    CFStringRef v7 = @"SOS_KAPPA_SUBTITLE_MASKED";
  }
  if (v2) {
    CFStringRef v8 = v6;
  }
  else {
    CFStringRef v8 = v7;
  }
  id v9 = [v4 localizedStringForKey:v8 value:&stru_100249230 table:@"Localizable-Kappa"];

  return v9;
}

- (id)mandrakeSubtitle
{
  unsigned int v2 = [(COSSOSController *)self isTinker];
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"SOS_MANDRAKE_SUBTITLE_TINKER";
  }
  else {
    CFStringRef v5 = @"SOS_MANDRAKE_SUBTITLE";
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable-Mandrake"];

  return v6;
}

- (id)backtrackSubtitle
{
  unsigned int v2 = [(COSSOSController *)self isTinker];
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"SOS_FOOTPRINT_SUBTITLE_TINKER";
  }
  else {
    CFStringRef v5 = @"SOS_FOOTPRINT_SUBTITLE";
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable-Footprint"];

  return v6;
}

- (void)setNewtonSettingBasedOnEligibility
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018E4C;
  v10[3] = &unk_100243708;
  v10[4] = self;
  unsigned int v3 = objc_retainBlock(v10);
  uint64_t v4 = [sub_100017DC0() newtonTriggersEmergencySOSNumber];
  CFStringRef v5 = v4;
  if (v4)
  {
    if ([v4 BOOLValue])
    {
      if ([sub_100017DC0() newtonTriggersEmergencySOSWorkouts]) {
        uint64_t v6 = 4;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
    CFStringRef v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(COSSOSController) newton previously set, using newtonEligibility:%lu", buf, 0xCu);
    }

    ((void (*)(void *, uint64_t))v3[2])(v3, v6);
  }
  else
  {
    [(COSSOSController *)self _startLoading];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018FA8;
    v8[3] = &unk_100243758;
    v8[4] = self;
    id v9 = v3;
    [(COSSOSController *)self _fetchNewtonEligibility:v8];
  }
}

- (void)_fetchNewtonEligibility:(id)a3
{
  id v4 = a3;
  if ([(COSSOSController *)self isTinker])
  {
    CFStringRef v5 = [(COSSOSController *)self device];
    uint64_t v6 = [v5 pairingID];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100019234;
    v13[3] = &unk_1002437A8;
    CFStringRef v7 = &v14;
    id v14 = v4;
    id v8 = v4;
    sub_100033958(v6, &_dispatch_main_q, v13);
  }
  else
  {
    id v9 = sub_10001937C();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100019524;
    v11[3] = &unk_100243780;
    CFStringRef v7 = &v12;
    id v12 = v4;
    id v10 = v4;
    [v9 newtonEligibilityWithCompletion:v11];
  }
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 0;
}

- (double)waitScreenPushGracePeriod
{
  return 2147483650.0;
}

- (id)localizedWaitScreenDescription
{
  return 0;
}

- (void)didEstablishHold
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100019678;
  v2[3] = &unk_100243708;
  v2[4] = self;
  [(COSSOSController *)self _fetchNewtonEligibility:v2];
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)finishedLoadingNewton
{
  return self->_finishedLoadingNewton;
}

- (void)setFinishedLoadingNewton:(BOOL)a3
{
  self->_finishedLoadingNewton = a3;
}

- (unint64_t)newtonEligibility
{
  return self->_newtonEligibility;
}

- (void)setNewtonEligibility:(unint64_t)a3
{
  self->_newtonEligibility = a3;
}

- (BOOL)isTinker
{
  return self->_isTinker;
}

- (NRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end