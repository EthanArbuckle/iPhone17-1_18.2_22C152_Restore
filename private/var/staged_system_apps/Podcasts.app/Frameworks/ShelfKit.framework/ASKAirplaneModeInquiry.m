@interface ASKAirplaneModeInquiry
+ (NSURL)settingsURL;
- (ASKAirplaneModeInquiry)init;
- (ASKAirplaneModeInquiryDelegate)delegate;
- (BOOL)isEnabled;
- (RadiosPreferences)radiosPreferences;
- (void)airplaneModeChanged;
- (void)setDelegate:(id)a3;
@end

@implementation ASKAirplaneModeInquiry

- (ASKAirplaneModeInquiry)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASKAirplaneModeInquiry;
  v2 = [(ASKAirplaneModeInquiry *)&v6 init];
  if (v2)
  {
    v3 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v3;

    [(RadiosPreferences *)v2->_radiosPreferences setDelegate:v2];
  }
  return v2;
}

+ (NSURL)settingsURL
{
  return (NSURL *)+[PSAirplaneModeSettingsDetail preferencesURL];
}

- (BOOL)isEnabled
{
  v2 = [(ASKAirplaneModeInquiry *)self radiosPreferences];
  unsigned __int8 v3 = [v2 airplaneMode];

  return v3;
}

- (void)airplaneModeChanged
{
  id v3 = [(ASKAirplaneModeInquiry *)self delegate];
  [v3 airplaneModeInquiryDidObserveChange:self];
}

- (ASKAirplaneModeInquiryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASKAirplaneModeInquiryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end