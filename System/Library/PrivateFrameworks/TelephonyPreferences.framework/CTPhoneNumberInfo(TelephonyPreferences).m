@interface CTPhoneNumberInfo(TelephonyPreferences)
- (id)tps_localizedNumber;
- (id)tps_normalizedNumber;
@end

@implementation CTPhoneNumberInfo(TelephonyPreferences)

- (id)tps_localizedNumber
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [a1 number];
  active = (void *)CPPhoneNumberCopyActiveCountryCode();
  v3 = active;
  v4 = 0;
  if (v1 && active)
  {
    v4 = TPSLocalizedPhoneNumberString(v1, active);
  }
  v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    v8 = v4;
    __int16 v9 = 2112;
    v10 = v1;
    __int16 v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Telephone number was localized to %@ using digits %@ and ISO country code %@.", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

- (id)tps_normalizedNumber
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [a1 number];
  active = (void *)CPPhoneNumberCopyActiveCountryCode();
  v3 = active;
  v4 = 0;
  if (v1 && active)
  {
    v4 = TPSNormalizedPhoneNumberString(v1, active);
  }
  v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    v8 = v4;
    __int16 v9 = 2112;
    v10 = v1;
    __int16 v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Telephone number was normalized to %@ using digits %@ and ISO country code %@.", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

@end