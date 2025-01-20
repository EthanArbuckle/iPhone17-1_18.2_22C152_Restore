@interface EligibilityDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeAnswerFromStatusWithError:(id *)a3;
- (BOOL)hasActiveGracePeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInterestedInInput:(unint64_t)a3;
- (BOOL)shouldSaveToDisk;
- (EligibilityDomain)init;
- (EligibilityDomain)initWithCoder:(id)a3;
- (EligibilityTimer)locatedCountryTimer;
- (NSDictionary)context;
- (NSDictionary)status;
- (NSNumber)ageOfInterest;
- (NSSet)billingCountriesOfInterest;
- (NSSet)deviceClassesOfInterest;
- (NSSet)deviceLanguagesOfInterest;
- (NSSet)deviceLocalesOfInterest;
- (NSSet)deviceRegionCodesOfInterest;
- (NSSet)initialLocationsOfInterest;
- (NSSet)locatedCountriesOfInterest;
- (NSString)domainChangeNotificationName;
- (id)_interestedDataString;
- (id)_supportedInputsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serialize;
- (unint64_t)_computeInputStatusForSet:(id)a3 withObject:(id)a4 isInverted:(BOOL)a5;
- (unint64_t)answer;
- (unint64_t)answerSource;
- (unint64_t)computeAnswerFromStatus:(id)a3;
- (unint64_t)computeInputStatusForBillingCountryInput:(id)a3;
- (unint64_t)computeInputStatusForBirthdateInput:(id)a3;
- (unint64_t)computeInputStatusForChinaCellularInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceAndSiriLanguageMatch;
- (unint64_t)computeInputStatusForDeviceClassInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceLocaleInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)computeInputStatusForExternalBootDriveInput:(id)a3;
- (unint64_t)computeInputStatusForGenerativeModelSystemInput:(id)a3;
- (unint64_t)computeInputStatusForGreymatterQueueInput:(id)a3;
- (unint64_t)computeInputStatusForInitialSetupLocationInput:(id)a3;
- (unint64_t)computeInputStatusForInput:(id)a3;
- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3;
- (unint64_t)computeInputStatusForSharediPadInput:(id)a3;
- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
- (unint64_t)hash;
- (unint64_t)inversionMask;
- (unint64_t)supportedInputs;
- (void)addContextForKey:(id)a3 value:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)resetInputsOfInterest;
- (void)setAgeLimitOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setAgeOfInterest:(id)a3;
- (void)setAnswer:(unint64_t)a3;
- (void)setBillingCountriesOfInterest:(id)a3;
- (void)setBillingCountriesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setBillingCountryInterest;
- (void)setChinaCellularInterest;
- (void)setContext:(id)a3;
- (void)setDeviceAndSiriLangaugeMatchInterest;
- (void)setDeviceClassesOfInterest:(id)a3;
- (void)setDeviceClassesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setDeviceLanguageInterest;
- (void)setDeviceLanguagesOfInterest:(id)a3;
- (void)setDeviceLocalesOfInterest:(id)a3;
- (void)setDeviceLocalesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setDeviceRegionCodesOfInterest:(id)a3;
- (void)setDeviceRegionCodesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setDeviceRegionInterest;
- (void)setExternalBootInterest;
- (void)setGenerativeModelSystemVersionInterest;
- (void)setGreymatterQueueInterest;
- (void)setInitialLocationsOfInterest:(id)a3;
- (void)setInitialSetupLocationsOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setInversionMask:(unint64_t)a3;
- (void)setLocatedCountriesOfInterest:(id)a3;
- (void)setLocatedCountriesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4;
- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4 isInverted:(BOOL)a5;
- (void)setLocatedCountryInterest;
- (void)setLocatedCountryTimer:(id)a3;
- (void)setSharediPadInterest;
- (void)setSiriLanguageInterest;
- (void)setSupportedInputs:(unint64_t)a3;
- (void)updateParameters;
@end

@implementation EligibilityDomain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedCountryTimer, 0);
  objc_storeStrong((id *)&self->_ageOfInterest, 0);
  objc_storeStrong((id *)&self->_initialLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceLanguagesOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceRegionCodesOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceLocalesOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceClassesOfInterest, 0);
  objc_storeStrong((id *)&self->_billingCountriesOfInterest, 0);
  objc_storeStrong((id *)&self->_locatedCountriesOfInterest, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setLocatedCountryTimer:(id)a3
{
}

- (EligibilityTimer)locatedCountryTimer
{
  return self->_locatedCountryTimer;
}

- (void)setInversionMask:(unint64_t)a3
{
  self->_inversionMask = a3;
}

- (unint64_t)inversionMask
{
  return self->_inversionMask;
}

- (void)setAgeOfInterest:(id)a3
{
}

- (NSNumber)ageOfInterest
{
  return self->_ageOfInterest;
}

- (void)setInitialLocationsOfInterest:(id)a3
{
}

- (NSSet)initialLocationsOfInterest
{
  return self->_initialLocationsOfInterest;
}

- (NSSet)deviceLanguagesOfInterest
{
  return self->_deviceLanguagesOfInterest;
}

- (NSSet)deviceRegionCodesOfInterest
{
  return self->_deviceRegionCodesOfInterest;
}

- (NSSet)deviceLocalesOfInterest
{
  return self->_deviceLocalesOfInterest;
}

- (NSSet)deviceClassesOfInterest
{
  return self->_deviceClassesOfInterest;
}

- (NSSet)billingCountriesOfInterest
{
  return self->_billingCountriesOfInterest;
}

- (NSSet)locatedCountriesOfInterest
{
  return self->_locatedCountriesOfInterest;
}

- (void)setSupportedInputs:(unint64_t)a3
{
  self->_supportedInputs = a3;
}

- (unint64_t)supportedInputs
{
  return self->_supportedInputs;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (id)description
{
  v3 = [(EligibilityDomain *)self _supportedInputsString];
  v4 = sub_10000CF70([(EligibilityDomain *)self answer]);
  unint64_t v5 = [(EligibilityDomain *)self answerSource];
  if (v5 >= 3)
  {
    v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "eligibility_answer_source_to_str";
      __int16 v19 = 2048;
      unint64_t v20 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Unsupported answer source: %llu", buf, 0x16u);
    }

    uint64_t v6 = +[NSString stringWithFormat:@"<Unknown: %llu>", v5];
  }
  else
  {
    uint64_t v6 = +[NSString stringWithUTF8String:(&off_100038AF0)[v5]];
  }
  v8 = (void *)v6;
  v9 = [(EligibilityDomain *)self _interestedDataString];
  unint64_t v10 = [(EligibilityDomain *)self domain];
  unint64_t v11 = v10;
  if (v10 > 0x7D) {
    v12 = "<Unknown Domain>";
  }
  else {
    v12 = off_100038608[v10];
  }
  v13 = [(EligibilityDomain *)self context];
  v14 = [(EligibilityDomain *)self status];
  v15 = +[NSString stringWithFormat:@"<Domain: %s(%llu)>(%@) - <answer: %@, source: %@, context: %@, status: %@> - <%@>>", v12, v11, v3, v4, v8, v13, v14, v9];

  return v15;
}

- (id)_interestedDataString
{
  unsigned __int16 v3 = (unsigned __int16)[(EligibilityDomain *)self supportedInputs];
  unsigned __int16 v4 = v3;
  if ((v3 & 1) == 0)
  {
    unint64_t v5 = &stru_100039518;
    if ((v3 & 2) == 0) {
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v11 = [(EligibilityDomain *)self billingCountriesOfInterest];
    v12 = [v11 description];
    uint64_t v13 = [(__CFString *)v5 stringByAppendingFormat:@" billingCountries: %@", v12];

    unint64_t v5 = (__CFString *)v13;
    goto LABEL_9;
  }
  uint64_t v6 = [(EligibilityDomain *)self locatedCountryTimer];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 description];
  }
  else
  {
    v8 = @"<NULL>";
  }
  v9 = [(EligibilityDomain *)self locatedCountriesOfInterest];
  unint64_t v10 = [v9 description];
  unint64_t v5 = [&stru_100039518 stringByAppendingFormat:@" locatedCountries: %@ gracePeriod: %@", v10, v8];

  if ((v4 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_9:
  if ((v4 & 4) != 0)
  {
    v17 = [(EligibilityDomain *)self deviceClassesOfInterest];
    v18 = [v17 description];
    uint64_t v19 = [(__CFString *)v5 stringByAppendingFormat:@" deviceClasses: %@", v18];

    unint64_t v5 = (__CFString *)v19;
    if ((v4 & 8) == 0)
    {
LABEL_11:
      if ((v4 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_11;
  }
  unint64_t v20 = [(EligibilityDomain *)self deviceLocalesOfInterest];
  v21 = [v20 description];
  uint64_t v22 = [(__CFString *)v5 stringByAppendingFormat:@" deviceLocales: %@", v21];

  unint64_t v5 = (__CFString *)v22;
  if ((v4 & 0x10) == 0)
  {
LABEL_12:
    if ((v4 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v23 = [(__CFString *)v5 stringByAppendingFormat:@" chinaCellular: Y"];

  unint64_t v5 = (__CFString *)v23;
  if ((v4 & 0x20) == 0)
  {
LABEL_13:
    if ((v4 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  v24 = [(EligibilityDomain *)self deviceRegionCodesOfInterest];
  v25 = [v24 description];
  uint64_t v26 = [(__CFString *)v5 stringByAppendingFormat:@" regionCodes: %@", v25];

  unint64_t v5 = (__CFString *)v26;
  if ((v4 & 0x40) == 0)
  {
LABEL_14:
    if ((v4 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  v27 = [(EligibilityDomain *)self deviceLanguagesOfInterest];
  v28 = [v27 description];
  uint64_t v29 = [(__CFString *)v5 stringByAppendingFormat:@" deviceLanguage: %@", v28];

  unint64_t v5 = (__CFString *)v29;
  if ((v4 & 0x80) == 0)
  {
LABEL_15:
    if ((v4 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v30 = [(__CFString *)v5 stringByAppendingFormat:@" generativeModelInterest: Y"];

  unint64_t v5 = (__CFString *)v30;
  if ((v4 & 0x100) == 0)
  {
LABEL_16:
    if ((v4 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v31 = [(__CFString *)v5 stringByAppendingFormat:@" greymatterQueue: Y"];

  unint64_t v5 = (__CFString *)v31;
  if ((v4 & 0x200) == 0)
  {
LABEL_17:
    if ((v4 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v32 = [(__CFString *)v5 stringByAppendingFormat:@" siriLanguage: Y"];

  unint64_t v5 = (__CFString *)v32;
  if ((v4 & 0x400) == 0)
  {
LABEL_18:
    if ((v4 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v33 = [(__CFString *)v5 stringByAppendingFormat:@" externalBootDrive: Y"];

  unint64_t v5 = (__CFString *)v33;
  if ((v4 & 0x800) == 0)
  {
LABEL_19:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v34 = [(__CFString *)v5 stringByAppendingFormat:@" sharediPad: Y"];

  unint64_t v5 = (__CFString *)v34;
  if ((v4 & 0x1000) == 0)
  {
LABEL_20:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v35 = [(__CFString *)v5 stringByAppendingFormat:@" deviceAndSiriLangaugeMatchInterest: Y"];

  unint64_t v5 = (__CFString *)v35;
  if ((v4 & 0x2000) == 0)
  {
LABEL_21:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_37:
  v36 = [(EligibilityDomain *)self initialLocationsOfInterest];
  v37 = [v36 description];
  uint64_t v38 = [(__CFString *)v5 stringByAppendingFormat:@" initialSetupLocations: %@", v37];

  unint64_t v5 = (__CFString *)v38;
  if ((v4 & 0x4000) != 0)
  {
LABEL_22:
    v14 = [(EligibilityDomain *)self ageOfInterest];
    uint64_t v15 = [(__CFString *)v5 stringByAppendingFormat:@" age: %@", v14];

    unint64_t v5 = (__CFString *)v15;
  }
LABEL_23:

  return v5;
}

- (id)_supportedInputsString
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs];
  unint64_t v4 = [(EligibilityDomain *)self inversionMask];
  if (v3)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0;
    v7 = &stru_100039518;
    do
    {
      if (v3)
      {
        uint64_t v12 = (char)[@"LBDRCSTMQAEP=Ia" characterAtIndex:v6];
        if (v5) {
          uint64_t v8 = 33;
        }
        else {
          uint64_t v8 = 95;
        }
        uint64_t v9 = +[NSString stringWithFormat:@"%@%c%c", v7, v8, v12];

        v7 = (__CFString *)v9;
      }
      ++v6;
      v5 >>= 1;
      BOOL v10 = v3 > 1;
      v3 >>= 1;
    }
    while (v10);
  }
  else
  {
    v7 = &stru_100039518;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (EligibilityDomain *)a3;
  v45.receiver = self;
  v45.super_class = (Class)EligibilityDomain;
  if ([(EligibilityDomain *)&v45 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v42 = 1;
      goto LABEL_52;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(EligibilityDomain *)self answer];
      if (v6 == (id)[(EligibilityDomain *)v5 answer])
      {
        v7 = [(EligibilityDomain *)self status];
        uint64_t v8 = [(EligibilityDomain *)v5 status];
        char v9 = sub_100019BF8(v7, v8);

        if (v9)
        {
          BOOL v10 = [(EligibilityDomain *)self context];
          unint64_t v11 = [(EligibilityDomain *)v5 context];
          char v12 = sub_100019BF8(v10, v11);

          if (v12)
          {
            id v13 = [(EligibilityDomain *)self supportedInputs];
            if (v13 == (id)[(EligibilityDomain *)v5 supportedInputs])
            {
              v14 = [(EligibilityDomain *)self locatedCountriesOfInterest];
              uint64_t v15 = [(EligibilityDomain *)v5 locatedCountriesOfInterest];
              char v16 = sub_100019BF8(v14, v15);

              if (v16)
              {
                v17 = [(EligibilityDomain *)self billingCountriesOfInterest];
                v18 = [(EligibilityDomain *)v5 billingCountriesOfInterest];
                char v19 = sub_100019BF8(v17, v18);

                if (v19)
                {
                  unint64_t v20 = [(EligibilityDomain *)self deviceClassesOfInterest];
                  v21 = [(EligibilityDomain *)v5 deviceClassesOfInterest];
                  char v22 = sub_100019BF8(v20, v21);

                  if (v22)
                  {
                    uint64_t v23 = [(EligibilityDomain *)self deviceLocalesOfInterest];
                    v24 = [(EligibilityDomain *)v5 deviceLocalesOfInterest];
                    char v25 = sub_100019BF8(v23, v24);

                    if (v25)
                    {
                      uint64_t v26 = [(EligibilityDomain *)self deviceLanguagesOfInterest];
                      v27 = [(EligibilityDomain *)v5 deviceLanguagesOfInterest];
                      char v28 = sub_100019BF8(v26, v27);

                      if (v28)
                      {
                        uint64_t v29 = [(EligibilityDomain *)self locatedCountryTimer];
                        uint64_t v30 = [(EligibilityDomain *)v5 locatedCountryTimer];
                        char v31 = sub_100019BF8(v29, v30);

                        if (v31)
                        {
                          uint64_t v32 = [(EligibilityDomain *)self deviceRegionCodesOfInterest];
                          uint64_t v33 = [(EligibilityDomain *)v5 deviceRegionCodesOfInterest];
                          char v34 = sub_100019BF8(v32, v33);

                          if (v34)
                          {
                            uint64_t v35 = [(EligibilityDomain *)self initialLocationsOfInterest];
                            v36 = [(EligibilityDomain *)v5 initialLocationsOfInterest];
                            char v37 = sub_100019BF8(v35, v36);

                            if (v37)
                            {
                              uint64_t v38 = [(EligibilityDomain *)self ageOfInterest];
                              v39 = [(EligibilityDomain *)v5 ageOfInterest];
                              char v40 = sub_100019BF8(v38, v39);

                              if (v40)
                              {
                                id v41 = [(EligibilityDomain *)self inversionMask];
                                if (v41 == (id)[(EligibilityDomain *)v5 inversionMask])
                                {
                                  BOOL v42 = 1;
LABEL_51:

                                  goto LABEL_52;
                                }
                                v43 = sub_10000D0EC();
                                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 136315394;
                                  v47 = "-[EligibilityDomain isEqual:]";
                                  __int16 v48 = 2080;
                                  v49 = "inversionMask";
                                  goto LABEL_49;
                                }
LABEL_50:

                                BOOL v42 = 0;
                                goto LABEL_51;
                              }
                              v43 = sub_10000D0EC();
                              if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_50;
                              }
                              *(_DWORD *)buf = 136315394;
                              v47 = "-[EligibilityDomain isEqual:]";
                              __int16 v48 = 2080;
                              v49 = "ageOfInterest";
                            }
                            else
                            {
                              v43 = sub_10000D0EC();
                              if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_50;
                              }
                              *(_DWORD *)buf = 136315394;
                              v47 = "-[EligibilityDomain isEqual:]";
                              __int16 v48 = 2080;
                              v49 = "initialLocationsOfInterest";
                            }
                          }
                          else
                          {
                            v43 = sub_10000D0EC();
                            if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_50;
                            }
                            *(_DWORD *)buf = 136315394;
                            v47 = "-[EligibilityDomain isEqual:]";
                            __int16 v48 = 2080;
                            v49 = "deviceRegionCodesOfInterest";
                          }
                        }
                        else
                        {
                          v43 = sub_10000D0EC();
                          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_50;
                          }
                          *(_DWORD *)buf = 136315394;
                          v47 = "-[EligibilityDomain isEqual:]";
                          __int16 v48 = 2080;
                          v49 = "locatedCountryTimer";
                        }
                      }
                      else
                      {
                        v43 = sub_10000D0EC();
                        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_50;
                        }
                        *(_DWORD *)buf = 136315394;
                        v47 = "-[EligibilityDomain isEqual:]";
                        __int16 v48 = 2080;
                        v49 = "deviceLanguagesOfInterest";
                      }
                    }
                    else
                    {
                      v43 = sub_10000D0EC();
                      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_50;
                      }
                      *(_DWORD *)buf = 136315394;
                      v47 = "-[EligibilityDomain isEqual:]";
                      __int16 v48 = 2080;
                      v49 = "deviceLocalesOfInterest";
                    }
                  }
                  else
                  {
                    v43 = sub_10000D0EC();
                    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_50;
                    }
                    *(_DWORD *)buf = 136315394;
                    v47 = "-[EligibilityDomain isEqual:]";
                    __int16 v48 = 2080;
                    v49 = "deviceClassesOfInterest";
                  }
                }
                else
                {
                  v43 = sub_10000D0EC();
                  if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_50;
                  }
                  *(_DWORD *)buf = 136315394;
                  v47 = "-[EligibilityDomain isEqual:]";
                  __int16 v48 = 2080;
                  v49 = "billingCountriesOfInterest";
                }
              }
              else
              {
                v43 = sub_10000D0EC();
                if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_50;
                }
                *(_DWORD *)buf = 136315394;
                v47 = "-[EligibilityDomain isEqual:]";
                __int16 v48 = 2080;
                v49 = "locatedCountriesOfInterest";
              }
            }
            else
            {
              v43 = sub_10000D0EC();
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_50;
              }
              *(_DWORD *)buf = 136315394;
              v47 = "-[EligibilityDomain isEqual:]";
              __int16 v48 = 2080;
              v49 = "supportedInputs";
            }
          }
          else
          {
            v43 = sub_10000D0EC();
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_50;
            }
            *(_DWORD *)buf = 136315394;
            v47 = "-[EligibilityDomain isEqual:]";
            __int16 v48 = 2080;
            v49 = "context";
          }
        }
        else
        {
          v43 = sub_10000D0EC();
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_50;
          }
          *(_DWORD *)buf = 136315394;
          v47 = "-[EligibilityDomain isEqual:]";
          __int16 v48 = 2080;
          v49 = "status";
        }
      }
      else
      {
        v43 = sub_10000D0EC();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        v47 = "-[EligibilityDomain isEqual:]";
        __int16 v48 = 2080;
        v49 = "answer";
      }
LABEL_49:
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_50;
    }
  }
  BOOL v42 = 0;
LABEL_52:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EligibilityDomain *)self answer];
  unint64_t v4 = [(EligibilityDomain *)self status];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  id v6 = [(EligibilityDomain *)self context];
  unint64_t v7 = (unint64_t)[v6 hash];

  unint64_t v8 = v5 ^ v7 ^ [(EligibilityDomain *)self supportedInputs];
  char v9 = [(EligibilityDomain *)self locatedCountriesOfInterest];
  unint64_t v10 = (unint64_t)[v9 hash];

  unint64_t v11 = [(EligibilityDomain *)self billingCountriesOfInterest];
  unint64_t v12 = v10 ^ (unint64_t)[v11 hash];

  id v13 = [(EligibilityDomain *)self deviceClassesOfInterest];
  unint64_t v14 = v8 ^ v12 ^ (unint64_t)[v13 hash];

  uint64_t v15 = [(EligibilityDomain *)self deviceLocalesOfInterest];
  unint64_t v16 = (unint64_t)[v15 hash];

  v17 = [(EligibilityDomain *)self deviceLanguagesOfInterest];
  unint64_t v18 = v16 ^ (unint64_t)[v17 hash];

  char v19 = [(EligibilityDomain *)self locatedCountryTimer];
  unint64_t v20 = v18 ^ (unint64_t)[v19 hash];

  v21 = [(EligibilityDomain *)self deviceRegionCodesOfInterest];
  unint64_t v22 = v14 ^ v20 ^ (unint64_t)[v21 hash];

  uint64_t v23 = [(EligibilityDomain *)self initialLocationsOfInterest];
  unint64_t v24 = (unint64_t)[v23 hash];

  char v25 = [(EligibilityDomain *)self ageOfInterest];
  unint64_t v26 = v24 ^ (unint64_t)[v25 hash];

  return v22 ^ v26 ^ [(EligibilityDomain *)self inversionMask];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  [v5 setAnswer:-[EligibilityDomain answer](self, "answer")];
  id v6 = [(EligibilityDomain *)self context];
  id v7 = [v6 copyWithZone:a3];
  [v5 setContext:v7];

  [v5 setSupportedInputs:-[EligibilityDomain supportedInputs](self, "supportedInputs")];
  unint64_t v8 = [(EligibilityDomain *)self locatedCountriesOfInterest];
  id v9 = [v8 copyWithZone:a3];
  [v5 setLocatedCountriesOfInterest:v9];

  unint64_t v10 = [(EligibilityDomain *)self billingCountriesOfInterest];
  id v11 = [v10 copyWithZone:a3];
  [v5 setBillingCountriesOfInterest:v11];

  unint64_t v12 = [(EligibilityDomain *)self deviceClassesOfInterest];
  id v13 = [v12 copyWithZone:a3];
  [v5 setDeviceClassesOfInterest:v13];

  unint64_t v14 = [(EligibilityDomain *)self deviceLocalesOfInterest];
  id v15 = [v14 copyWithZone:a3];
  [v5 setDeviceLocalesOfInterest:v15];

  unint64_t v16 = [(EligibilityDomain *)self deviceRegionCodesOfInterest];
  id v17 = [v16 copyWithZone:a3];
  [v5 setDeviceRegionCodesOfInterest:v17];

  unint64_t v18 = [(EligibilityDomain *)self deviceLanguagesOfInterest];
  id v19 = [v18 copyWithZone:a3];
  [v5 setDeviceLanguagesOfInterest:v19];

  unint64_t v20 = [(EligibilityDomain *)self initialLocationsOfInterest];
  id v21 = [v20 copyWithZone:a3];
  [v5 setInitialLocationsOfInterest:v21];

  unint64_t v22 = [(EligibilityDomain *)self ageOfInterest];
  [v5 setAgeOfInterest:v22];

  [v5 setInversionMask:-[EligibilityDomain inversionMask](self, "inversionMask")];
  uint64_t v23 = [(EligibilityDomain *)self locatedCountryTimer];
  id v24 = [v23 copyWithZone:a3];
  [v5 setLocatedCountryTimer:v24];

  return v5;
}

- (void)addContextForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(EligibilityDomain *)self context];

  if (v8)
  {
    id v9 = [(EligibilityDomain *)self context];
    id v11 = [v9 mutableCopy];
  }
  else
  {
    id v11 = (id)objc_opt_new();
  }
  [v11 setObject:v6 forKeyedSubscript:v7];

  id v10 = [v11 copy];
  [(EligibilityDomain *)self setContext:v10];
}

- (BOOL)computeAnswerFromStatusWithError:(id *)a3
{
  id v5 = [(EligibilityDomain *)self status];
  if (v5)
  {
    [(EligibilityDomain *)self setAnswer:[(EligibilityDomain *)self computeAnswerFromStatus:v5]];
    id v6 = 0;
  }
  else
  {
    id v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      id v11 = "-[EligibilityDomain computeAnswerFromStatusWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s: Failed to get status for a computed domain", (uint8_t *)&v10, 0xCu);
    }

    unint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:93 userInfo:0];
    id v6 = v8;
    if (a3)
    {
      id v6 = v8;
      *a3 = v6;
    }
  }

  return v5 != 0;
}

- (unint64_t)computeAnswerFromStatus:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v4 = [a3 allValues];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5)
  {

    return [(EligibilityDomain *)self defaultAnswer];
  }
  id v6 = v5;
  char v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v14;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedLongLongValue];
      if (v11 == (id)3)
      {
        char v7 = 1;
      }
      else
      {
        if ((unint64_t)v11 < 2)
        {

          return 1;
        }
        char v8 = 1;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6) {
      continue;
    }
    break;
  }

  if (v8) {
    unint64_t result = 2;
  }
  else {
    unint64_t result = 4;
  }
  if (((v8 | v7) & 1) == 0) {
    return [(EligibilityDomain *)self defaultAnswer];
  }
  return result;
}

- (BOOL)shouldSaveToDisk
{
  v2 = [(EligibilityDomain *)self locatedCountryTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (EligibilityDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EligibilityDomain;
  id v5 = [(EligibilityDomain *)&v16 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"answer"];
    v5->_answer = (unint64_t)[v6 unsignedIntegerValue];

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    int v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locatedCountryTimer"];
    locatedCountryTimer = v5->_locatedCountryTimer;
    v5->_locatedCountryTimer = (EligibilityTimer *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedLongLong:[(EligibilityDomain *)self answer]];
  [v4 encodeObject:v5 forKey:@"answer"];

  id v6 = [(EligibilityDomain *)self context];
  [v4 encodeObject:v6 forKey:@"context"];

  id v7 = [(EligibilityDomain *)self locatedCountryTimer];
  [v4 encodeObject:v7 forKey:@"locatedCountryTimer"];
}

- (id)serialize
{
  BOOL v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithUnsignedLongLong:[(EligibilityDomain *)self answer]];
  [v3 setObject:v4 forKeyedSubscript:@"os_eligibility_answer_t"];

  id v5 = +[NSNumber numberWithUnsignedLongLong:[(EligibilityDomain *)self answerSource]];
  [v3 setObject:v5 forKeyedSubscript:@"os_eligibility_answer_source_t"];

  id v6 = [(EligibilityDomain *)self status];
  [v3 setObject:v6 forKeyedSubscript:@"status"];

  id v7 = [(EligibilityDomain *)self context];
  [v3 setObject:v7 forKeyedSubscript:@"context"];

  id v8 = [v3 copy];

  return v8;
}

- (unint64_t)computeInputStatusForBirthdateInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (unsigned __int16)[(EligibilityDomain *)self inversionMask];
  if ((v5 & 0x4000) != 0) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  if ((v5 & 0x4000) != 0) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 3;
  }
  id v8 = [v4 age];

  if (v8)
  {
    unint64_t v7 = 1;
  }
  else
  {
    uint64_t v9 = [(EligibilityDomain *)self ageOfInterest];
    if (!v9 && [0 compare:0] != (id)-1) {
      unint64_t v7 = v6;
    }
  }
  return v7;
}

- (unint64_t)computeInputStatusForInitialSetupLocationInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [v4 countryCodes];

  if (v5)
  {
    unsigned __int16 v6 = (unsigned __int16)[(EligibilityDomain *)self inversionMask];
    unint64_t v7 = [(EligibilityDomain *)self initialLocationsOfInterest];
    id v8 = [v4 countryCodes];
    unsigned int v9 = ((v6 & 0x2000) == 0) ^ [v7 intersectsSet:v8];

    if (v9) {
      unint64_t v10 = 2;
    }
    else {
      unint64_t v10 = 3;
    }
  }
  else
  {
    unint64_t v10 = 1;
  }

  return v10;
}

- (unint64_t)computeInputStatusForDeviceAndSiriLanguageMatch
{
  unint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (unint64_t)computeInputStatusForSharediPadInput:(id)a3
{
  if ([a3 isSharediPad]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)computeInputStatusForExternalBootDriveInput:(id)a3
{
  if ([a3 hasExternalBootDrive]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3
{
  id v3 = a3;
  unint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (unint64_t)computeInputStatusForGreymatterQueueInput:(id)a3
{
  if ([a3 onGreymatterQueue]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)computeInputStatusForGenerativeModelSystemInput:(id)a3
{
  if ([a3 supportsGenerativeModelSystems]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3
{
  id v4 = [a3 primaryLanguage];
  if (v4)
  {
    unsigned __int16 v5 = [(EligibilityDomain *)self deviceLanguagesOfInterest];
    unsigned int v6 = [v5 containsObject:v4];

    if (v6) {
      unint64_t v7 = 3;
    }
    else {
      unint64_t v7 = 2;
    }
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(EligibilityDomain *)self deviceRegionCodesOfInterest];
  unsigned int v6 = [v4 deviceRegionCode];

  unint64_t v7 = [(EligibilityDomain *)self _computeInputStatusForSet:v5 withObject:v6 isInverted:([(EligibilityDomain *)self inversionMask] >> 5) & 1];
  return v7;
}

- (unint64_t)computeInputStatusForChinaCellularInput:(id)a3
{
  if ([a3 chinaCellularDevice]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (unint64_t)computeInputStatusForDeviceLocaleInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(EligibilityDomain *)self deviceLocalesOfInterest];
  unsigned int v6 = [v4 deviceLocale];

  unint64_t v7 = [(EligibilityDomain *)self _computeInputStatusForSet:v5 withObject:v6 isInverted:([(EligibilityDomain *)self inversionMask] >> 3) & 1];
  return v7;
}

- (unint64_t)computeInputStatusForDeviceClassInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(EligibilityDomain *)self deviceClassesOfInterest];
  unsigned int v6 = [v4 deviceClass];

  unint64_t v7 = [(EligibilityDomain *)self _computeInputStatusForSet:v5 withObject:v6 isInverted:([(EligibilityDomain *)self inversionMask] >> 2) & 1];
  return v7;
}

- (unint64_t)computeInputStatusForBillingCountryInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(EligibilityDomain *)self billingCountriesOfInterest];
  unsigned int v6 = [v4 countryCode];

  unint64_t v7 = [(EligibilityDomain *)self _computeInputStatusForSet:v5 withObject:v6 isInverted:([(EligibilityDomain *)self inversionMask] >> 1) & 1];
  return v7;
}

- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(EligibilityDomain *)self locatedCountryTimer];
  unint64_t v6 = [(EligibilityDomain *)self inversionMask] & 1;
  unint64_t v7 = [(EligibilityDomain *)self locatedCountriesOfInterest];
  if (v7)
  {
    id v8 = [v4 countryCodes];

    if (v8)
    {
      unsigned int v9 = [v4 countryCodes];
      unsigned int v10 = [v9 intersectsSet:v7];

      if (v6 == v10)
      {
        [v5 resume];
        if (v5)
        {
          if ([v5 hasExpired]) {
            unint64_t v11 = 2;
          }
          else {
            unint64_t v11 = 3;
          }
        }
        else
        {
          unint64_t v11 = 2;
        }
      }
      else
      {
        [v5 reset];
        [v5 enable];
        unint64_t v11 = 3;
      }
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = v6 | 2;
  }

  return v11;
}

- (unint64_t)_computeInputStatusForSet:(id)a3 withObject:(id)a4 isInverted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = v8;
  if (v5) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  if (v5) {
    unint64_t v11 = 3;
  }
  else {
    unint64_t v11 = 2;
  }
  if (v7)
  {
    if (v8)
    {
      if ([v7 containsObject:v8]) {
        unint64_t v11 = v10;
      }
    }
    else
    {
      unint64_t v11 = 1;
    }
  }

  return v11;
}

- (BOOL)hasActiveGracePeriod
{
  if (([(EligibilityDomain *)self supportedInputs] & 1) == 0) {
    return 0;
  }
  id v4 = [(EligibilityDomain *)self locatedCountryTimer];
  BOOL v5 = v4;
  if (v4) {
    unsigned __int8 v3 = [v4 isActive];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)isInterestedInInput:(unint64_t)a3
{
  unint64_t v4 = [(EligibilityDomain *)self supportedInputs];
  switch(a3)
  {
    case 1uLL:
      LOBYTE(v4) = v4 & 1;
      break;
    case 2uLL:
      unint64_t v4 = (v4 >> 1) & 1;
      break;
    case 3uLL:
      unint64_t v4 = (v4 >> 2) & 1;
      break;
    case 4uLL:
      unint64_t v4 = (v4 >> 3) & 1;
      break;
    case 5uLL:
      unint64_t v4 = (v4 >> 4) & 1;
      break;
    case 6uLL:
      unint64_t v4 = (v4 >> 5) & 1;
      break;
    case 7uLL:
      unint64_t v4 = (v4 >> 6) & 1;
      break;
    case 8uLL:
      unint64_t v4 = (v4 >> 7) & 1;
      break;
    case 9uLL:
      unint64_t v4 = (v4 >> 8) & 1;
      break;
    case 0xAuLL:
      unint64_t v4 = (v4 >> 9) & 1;
      break;
    case 0xBuLL:
      unint64_t v4 = (v4 >> 10) & 1;
      break;
    case 0xCuLL:
      unint64_t v4 = (v4 >> 11) & 1;
      break;
    case 0xDuLL:
      unint64_t v4 = (v4 >> 12) & 1;
      break;
    case 0xEuLL:
      unint64_t v4 = (v4 >> 13) & 1;
      break;
    case 0xFuLL:
      unint64_t v4 = (v4 >> 14) & 1;
      break;
    default:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (unint64_t)computeInputStatusForInput:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  if ([(EligibilityDomain *)self isInterestedInInput:v5])
  {
    switch((unint64_t)v5)
    {
      case 1uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForLocatedCountryInput:v4];
        goto LABEL_22;
      case 2uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForBillingCountryInput:v4];
        goto LABEL_22;
      case 3uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForDeviceClassInput:v4];
        goto LABEL_22;
      case 4uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForDeviceLocaleInput:v4];
        goto LABEL_22;
      case 5uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForChinaCellularInput:v4];
        goto LABEL_22;
      case 6uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForDeviceRegionCodesInput:v4];
        goto LABEL_22;
      case 7uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForDeviceLanguageInput:v4];
        goto LABEL_22;
      case 8uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForGenerativeModelSystemInput:v4];
        goto LABEL_22;
      case 9uLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForGreymatterQueueInput:v4];
        goto LABEL_22;
      case 0xAuLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForSiriLanguageInput:v4];
        goto LABEL_22;
      case 0xBuLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForExternalBootDriveInput:v4];
        goto LABEL_22;
      case 0xCuLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForSharediPadInput:v4];
        goto LABEL_22;
      case 0xDuLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForDeviceAndSiriLanguageMatch];
        goto LABEL_22;
      case 0xEuLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForInitialSetupLocationInput:v4];
        goto LABEL_22;
      case 0xFuLL:
        unint64_t v6 = [(EligibilityDomain *)self computeInputStatusForBirthdateInput:v4];
LABEL_22:
        unint64_t v7 = v6;
        break;
      default:
        id v8 = sub_10000D0EC();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = sub_10000D080((unint64_t)v5);
          int v11 = 136315906;
          unint64_t v12 = "-[EligibilityDomain computeInputStatusForInput:]";
          __int16 v13 = 2112;
          long long v14 = self;
          __int16 v15 = 2112;
          objc_super v16 = v10;
          __int16 v17 = 2048;
          id v18 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Unsupported input for %@: %@(%llu)", (uint8_t *)&v11, 0x2Au);
        }
        unint64_t v7 = 5;
        break;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (NSDictionary)status
{
  unsigned __int8 v3 = objc_opt_new();
  id v4 = +[InputManager sharedInstance];
  for (unint64_t i = 1; i != 16; ++i)
  {
    if ([(EligibilityDomain *)self isInterestedInInput:i])
    {
      unint64_t v6 = [v4 objectForInputValue:i];
      unint64_t v7 = v6;
      if (v6)
      {
        unint64_t v8 = (unint64_t)[v6 status];
        if (!v8) {
          unint64_t v8 = [(EligibilityDomain *)self computeInputStatusForInput:v7];
        }
      }
      else
      {
        unint64_t v8 = 1;
      }
      unsigned int v9 = +[NSNumber numberWithUnsignedLongLong:v8];
      uint64_t v10 = sub_10000D080(i);
      [v3 setObject:v9 forKeyedSubscript:v10];
    }
  }
  id v11 = [v3 copy];

  return (NSDictionary *)v11;
}

- (unint64_t)answerSource
{
  return 1;
}

- (void)resetInputsOfInterest
{
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:0];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:0];
  [(EligibilityDomain *)self setDeviceLocalesOfInterest:0];
  [(EligibilityDomain *)self setDeviceRegionCodesOfInterest:0];
  [(EligibilityDomain *)self setDeviceLanguagesOfInterest:0];
  [(EligibilityDomain *)self setInitialSetupLocationsOfInterest:0 isInverted:0];
  [(EligibilityDomain *)self setAgeLimitOfInterest:0 isInverted:0];
  [(EligibilityDomain *)self setSupportedInputs:0];

  [(EligibilityDomain *)self setInversionMask:0];
}

- (void)setAgeLimitOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSNumber *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(v6 != 0) << 14)];
  ageOfInterest = self->_ageOfInterest;
  self->_ageOfInterest = v6;

  uint64_t v8 = 0x4000;
  if (!v4) {
    uint64_t v8 = 0;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFBFFFLL | v8;
}

- (void)setInitialSetupLocationsOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)(v6 != 0) << 13)];
  initialLocationsOfInterest = self->_initialLocationsOfInterest;
  self->_initialLocationsOfInterest = v6;

  uint64_t v8 = 0x2000;
  if (!v4) {
    uint64_t v8 = 0;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFDFFFLL | v8;
}

- (void)setDeviceAndSiriLangaugeMatchInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x1000;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setSharediPadInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x800;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setExternalBootInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x400;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setSiriLanguageInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x200;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setGreymatterQueueInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x100;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setGenerativeModelSystemVersionInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x80;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setDeviceLanguagesOfInterest:(id)a3
{
  BOOL v4 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(v4 != 0) << 6)];
  deviceLanguagesOfInterest = self->_deviceLanguagesOfInterest;
  self->_deviceLanguagesOfInterest = v4;
}

- (void)setDeviceLanguageInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x40;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setDeviceRegionCodesOfInterest:(id)a3
{
}

- (void)setDeviceRegionCodesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFFFDFLL | (32 * (v6 != 0))];
  deviceRegionCodesOfInterest = self->_deviceRegionCodesOfInterest;
  self->_deviceRegionCodesOfInterest = v6;

  uint64_t v8 = 32;
  if (!v4) {
    uint64_t v8 = 0;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFDFLL | v8;
}

- (void)setDeviceRegionInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x20;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setChinaCellularInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 0x10;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setBillingCountryInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 2;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setLocatedCountryInterest
{
  unint64_t v3 = [(EligibilityDomain *)self supportedInputs] | 1;

  [(EligibilityDomain *)self setSupportedInputs:v3];
}

- (void)setDeviceLocalesOfInterest:(id)a3
{
}

- (void)setDeviceLocalesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFFFF7 | (8 * (v6 != 0))];
  deviceLocalesOfInterest = self->_deviceLocalesOfInterest;
  self->_deviceLocalesOfInterest = v6;

  uint64_t v8 = 8;
  if (!v4) {
    uint64_t v8 = 0;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFF7 | v8;
}

- (void)setDeviceClassesOfInterest:(id)a3
{
}

- (void)setDeviceClassesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFFFFBLL | (4 * (v6 != 0))];
  deviceClassesOfInterest = self->_deviceClassesOfInterest;
  self->_deviceClassesOfInterest = v6;

  uint64_t v8 = 4;
  if (!v4) {
    uint64_t v8 = 0;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFFBLL | v8;
}

- (void)setBillingCountriesOfInterest:(id)a3
{
}

- (void)setBillingCountriesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFFFFDLL | (2 * (v6 != 0))];
  billingCountriesOfInterest = self->_billingCountriesOfInterest;
  self->_billingCountriesOfInterest = v6;

  uint64_t v8 = 2;
  if (!v4) {
    uint64_t v8 = 0;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFFDLL | v8;
}

- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4
{
}

- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4 isInverted:(BOOL)a5
{
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:a3 isInverted:a5];
  unint64_t v7 = [(EligibilityDomain *)self locatedCountryTimer];
  if (v7)
  {
    uint64_t v8 = v7;
    [(EligibilityTimer *)v7 setDurationWithSeconds:a4];
  }
  else
  {
    uint64_t v8 = [[EligibilityTimer alloc] initWithSeconds:a4];
  }
  [(EligibilityDomain *)self setLocatedCountryTimer:v8];
}

- (void)setLocatedCountriesOfInterest:(id)a3
{
}

- (void)setLocatedCountriesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (NSSet *)a3;
  [(EligibilityDomain *)self setSupportedInputs:[(EligibilityDomain *)self supportedInputs] & 0xFFFFFFFFFFFFFFFELL | (v6 != 0)];
  locatedCountriesOfInterest = self->_locatedCountriesOfInterest;
  self->_locatedCountriesOfInterest = v6;

  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFFELL | v4;
}

- (EligibilityDomain)init
{
  v6.receiver = self;
  v6.super_class = (Class)EligibilityDomain;
  v2 = [(EligibilityDomain *)&v6 init];
  unint64_t v3 = v2;
  if (v2)
  {
    context = v2->_context;
    v2->_answer = 0;
    v2->_context = 0;

    v3->_supportedInputs = 0;
  }
  return v3;
}

- (unint64_t)defaultAnswer
{
  return 2;
}

- (void)updateParameters
{
}

- (NSString)domainChangeNotificationName
{
  unint64_t result = (NSString *)_os_crash();
  __break(1u);
  return result;
}

- (unint64_t)domain
{
  unint64_t result = _os_crash();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end