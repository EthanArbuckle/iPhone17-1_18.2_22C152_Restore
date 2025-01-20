@interface NSData
- (id)CNFSDeserialize;
@end

@implementation NSData

- (id)CNFSDeserialize
{
  id v2 = [objc_alloc((Class)NSInputStream) initWithData:self];
  [v2 open];
  if (sub_100006D68(v2) != 1)
  {
    NSExceptionName v89 = NSInvalidUnarchiveOperationException;
    CFStringRef v90 = @"Archive version not supported";
    goto LABEL_148;
  }
  if (sub_100006D68(v2) != 1)
  {
    NSExceptionName v89 = NSInvalidUnarchiveOperationException;
    CFStringRef v90 = @"Archive type not supported";
    goto LABEL_148;
  }
  if (sub_100006D68(v2) != 1)
  {
    NSExceptionName v89 = NSInvalidUnarchiveOperationException;
    CFStringRef v90 = @"Archive must start with identifier";
    goto LABEL_148;
  }
  id v3 = objc_alloc((Class)CNMutableContact);
  v4 = sub_100006DE8(v2);
  id v5 = [v3 initWithIdentifier:v4];

  v6 = &CC_SHA256_Final_ptr;
  v108 = objc_opt_new();
  v107 = objc_opt_new();
  v7 = objc_opt_new();
  v106 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  if ([v2 hasBytesAvailable])
  {
    uint64_t v100 = CNSocialProfileTeamIdentifierKey;
    uint64_t v99 = CNSocialProfileBundleIdentifiersKey;
    uint64_t v98 = CNSocialProfileDisplayNameKey;
    v12 = CNPostalAddressStreetKey;
    v104 = v7;
    v105 = v8;
    v109 = v9;
    v110 = v10;
    v111 = v11;
    do
    {
      int v13 = sub_100006D68(v2);
      if ((v13 - 32) > 0x1DF)
      {
        if ((unsigned __int16)(v13 + 32752) > 0xEFu)
        {
          switch(v13)
          {
            case 0:
              NSExceptionName v89 = NSInvalidUnarchiveOperationException;
              CFStringRef v90 = @"Uninitialized tag value";
              goto LABEL_148;
            case 1:
              NSExceptionName v89 = NSInvalidUnarchiveOperationException;
              CFStringRef v90 = @"Tagged identifier in wrong location.";
              goto LABEL_148;
            case 2:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setNamePrefix:v25];
              goto LABEL_76;
            case 3:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setGivenName:v25];
              goto LABEL_76;
            case 4:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setMiddleName:v25];
              goto LABEL_76;
            case 5:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setFamilyName:v25];
              goto LABEL_76;
            case 6:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPreviousFamilyName:v25];
              goto LABEL_76;
            case 7:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setNameSuffix:v25];
              goto LABEL_76;
            case 8:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setNickname:v25];
              goto LABEL_76;
            case 9:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setOrganizationName:v25];
              goto LABEL_76;
            case 10:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setDepartmentName:v25];
              goto LABEL_76;
            case 11:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setJobTitle:v25];
              goto LABEL_76;
            case 12:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setNote:v25];
              goto LABEL_76;
            case 13:
            case 14:
              goto LABEL_7;
            case 15:
              sub_1000070AC(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setBirthday:v25];
              goto LABEL_76;
            case 16:
              sub_1000070AC(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setNonGregorianBirthday:v25];
              goto LABEL_76;
            case 17:
              [v5 setContactType:(int)sub_100007294(v2)];
              continue;
            case 18:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPhoneticOrganizationName:v25];
              goto LABEL_76;
            case 19:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPhoneticFamilyName:v25];
              goto LABEL_76;
            case 20:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPhoneticGivenName:v25];
              goto LABEL_76;
            case 21:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPhoneticMiddleName:v25];
              goto LABEL_76;
            case 22:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              v26 = sub_100006DE8(v2);
              id v27 = [objc_alloc((Class)CNActivityAlert) initWithSound:v25 vibration:v26 ignoreMute:sub_100007294(v2) != 0];
              [v5 setCallAlert:v27];
              goto LABEL_39;
            case 23:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              v26 = sub_100006DE8(v2);
              id v27 = [objc_alloc((Class)CNActivityAlert) initWithSound:v25 vibration:v26 ignoreMute:sub_100007294(v2) != 0];
              [v5 setTextAlert:v27];
LABEL_39:

              v8 = v105;
              v10 = v110;
              goto LABEL_76;
            case 24:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPreferredApplePersonaIdentifier:v25];
              goto LABEL_76;
            case 25:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPreferredLikenessSource:v25];
              goto LABEL_76;
            case 26:
              id v28 = v2;
              v112[0] = 0;
              if ([v28 read:v112 maxLength:4] != (id)4)
              {
                NSExceptionName v89 = NSInvalidUnarchiveOperationException;
                CFStringRef v90 = @"Unable to read non gregorian date length";
                goto LABEL_148;
              }
              if (v112[0] != 12)
              {
                NSExceptionName v89 = NSInvalidUnarchiveOperationException;
                CFStringRef v90 = @"Wrong size for non gregorian date.";
LABEL_148:
                id v91 = +[NSException exceptionWithName:v89 reason:v90 userInfo:0];
                objc_exception_throw(v91);
              }
              v29 = sub_1000070AC(v28);
              int v30 = sub_100007294(v28);
              v31 = sub_10000748C(v30);
              v32 = +[NSNull null];

              if (v31 != v32)
              {
                v33 = +[NSCalendar calendarWithIdentifier:v31];
                [v29 setCalendar:v33];
              }
              [v5 setNonGregorianBirthday:v29];

              v7 = v104;
LABEL_116:
              v8 = v105;
              break;
            case 27:
            case 28:
            case 30:
              sub_100006DE8(v2);

              continue;
            case 29:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setPhonemeData:v25];
              goto LABEL_76;
            case 31:
              sub_100006DE8(v2);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              [v5 setDowntimeWhitelist:v25];
LABEL_76:

              v11 = v111;
              continue;
            default:
              switch(v13)
              {
                case 32769:
                  id v19 = v2;
                  sub_100007314(v19);
                  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v20 == @"<<EOB>>")
                  {
                    id v24 = 0;
                  }
                  else
                  {
                    v21 = sub_100006DE8(v19);
                    id v22 = objc_alloc((Class)CNLabeledValue);
                    id v23 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:v21];
                    id v24 = [v22 initWithLabel:v20 value:v23];

                    v9 = v109;
                    v7 = v104;
                  }

                  v82 = v108;
                  goto LABEL_115;
                case 32770:
                  id v34 = v2;
                  sub_100007314(v34);
                  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v35 == @"<<EOB>>")
                  {
                    id v24 = 0;
                  }
                  else
                  {
                    v36 = sub_100006DE8(v34);
                    id v24 = [objc_alloc((Class)CNLabeledValue) initWithLabel:v35 value:v36];

                    v7 = v104;
                  }

                  v82 = v107;
LABEL_115:
                  [v82 addObject:v24];

                  goto LABEL_116;
                case 32771:
                  id v37 = v2;
                  v38 = sub_100007314(v37);
                  id v39 = objc_alloc_init((Class)CNMutablePostalAddress);
                  sub_100007314(v37);
                  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v40 != @"<<EOB>>")
                  {
                    v41 = v40;
                    do
                    {
                      if ([(__CFString *)v41 isEqualToString:v12])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setStreet:v42];
                      }
                      else if ([(__CFString *)v41 isEqualToString:CNPostalAddressCityKey])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setCity:v42];
                      }
                      else if ([(__CFString *)v41 isEqualToString:CNPostalAddressStateKey])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setState:v42];
                      }
                      else if ([(__CFString *)v41 isEqualToString:CNPostalAddressPostalCodeKey])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setPostalCode:v42];
                      }
                      else if ([(__CFString *)v41 isEqualToString:CNPostalAddressCountryKey])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setCountry:v42];
                      }
                      else if ([(__CFString *)v41 isEqualToString:CNPostalAddressISOCountryCodeKey])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setISOCountryCode:v42];
                      }
                      else if ([(__CFString *)v41 isEqualToString:CNPostalAddressSubLocalityKey])
                      {
                        v42 = sub_100006DE8(v37);
                        [v39 setSubLocality:v42];
                      }
                      else
                      {
                        v101 = v12;
                        unsigned int v43 = [(__CFString *)v41 isEqualToString:CNPostalAddressSubAdministrativeAreaKey];
                        v42 = sub_100006DE8(v37);
                        if (v43) {
                          [v39 setSubAdministrativeArea:v42];
                        }
                        v12 = v101;
                      }

                      sub_100007314(v37);
                      CFStringRef v44 = (const __CFString *)objc_claimAutoreleasedReturnValue();

                      v41 = (__CFString *)v44;
                      BOOL v45 = v44 == @"<<EOB>>";
                      v9 = v109;
                    }
                    while (!v45);
                  }
                  id v46 = [objc_alloc((Class)CNLabeledValue) initWithLabel:v38 value:v39];

                  [v104 addObject:v46];
                  v7 = v104;
                  goto LABEL_116;
                case 32772:
                  id v47 = v2;
                  v48 = sub_100007314(v47);
                  v49 = sub_100006DE8(v47);

                  id v25 = [objc_alloc((Class)CNLabeledValue) initWithLabel:v48 value:v49];
                  v8 = v105;

                  v10 = v110;
                  v50 = v106;
                  goto LABEL_75;
                case 32773:
                  id v51 = v2;
                  v52 = sub_100007314(v51);
                  id v53 = sub_100006DE8(v51);
                  v54 = sub_100006DE8(v51);

                  id v55 = objc_alloc((Class)CNLabeledValue);
                  id v56 = [objc_alloc((Class)CNContactRelation) initWithName:v54];
                  id v25 = [v55 initWithLabel:v52 value:v56];

                  v7 = v104;
                  v8 = v105;

                  v10 = v110;
                  v50 = v105;
LABEL_75:
                  [v50 addObject:v25];
                  goto LABEL_76;
                case 32774:
                  v102 = v12;
                  id v57 = v2;
                  v93 = sub_100007314(v57);
                  sub_100007314(v57);
                  v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  id v94 = v5;
                  if (v58 == @"<<EOB>>")
                  {
                    id v64 = 0;
                    v95 = 0;
                    v96 = 0;
                    v97 = 0;
                    v103 = 0;
                    v61 = 0;
                    v60 = 0;
                  }
                  else
                  {
                    v59 = v58;
                    v60 = 0;
                    v61 = 0;
                    v103 = 0;
                    v96 = 0;
                    v97 = 0;
                    v95 = 0;
                    v62 = 0;
                    do
                    {
                      if ([(__CFString *)v59 isEqualToString:CNSocialProfileURLStringKey])
                      {
                        sub_100006DE8(v57);
                        v63 = v60;
                        v60 = id v64 = v62;
                      }
                      else if ([(__CFString *)v59 isEqualToString:CNSocialProfileUsernameKey])
                      {
                        sub_100006DE8(v57);
                        v63 = v61;
                        v61 = id v64 = v62;
                      }
                      else if ([(__CFString *)v59 isEqualToString:CNSocialProfileUserIdentifierKey])
                      {
                        sub_100006DE8(v57);
                        v63 = v103;
                        v103 = id v64 = v62;
                      }
                      else if ([(__CFString *)v59 isEqualToString:CNSocialProfileServiceKey])
                      {
                        sub_100007314(v57);
                        v63 = v97;
                        v97 = id v64 = v62;
                      }
                      else if ([(__CFString *)v59 isEqualToString:v100])
                      {
                        sub_100006DE8(v57);
                        v63 = v96;
                        v96 = id v64 = v62;
                      }
                      else if ([(__CFString *)v59 isEqualToString:v99])
                      {
                        v63 = sub_100006F4C(v57);
                        id v65 = [objc_alloc((Class)NSInputStream) initWithData:v63];
                        [v65 open];
                        id v64 = [objc_alloc((Class)NSMutableArray) initWithCapacity:20];

                        if ([v65 hasBytesAvailable])
                        {
                          do
                          {
                            v66 = sub_100006DE8(v65);
                            [v64 addObject:v66];
                          }
                          while (([v65 hasBytesAvailable] & 1) != 0);
                        }
                      }
                      else if ([(__CFString *)v59 isEqualToString:v98])
                      {
                        sub_100006DE8(v57);
                        v63 = v95;
                        v95 = id v64 = v62;
                      }
                      else
                      {
                        v63 = sub_100006F4C(v57);
                        id v64 = v62;
                      }

                      sub_100007314(v57);
                      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      v59 = v67;
                      v62 = v64;
                    }
                    while (v67 != @"<<EOB>>");
                  }
                  id v83 = [objc_alloc((Class)CNSocialProfile) initWithUrlString:v60 username:v61 userIdentifier:v103 service:v97 displayname:v95 teamIdentifier:v96 bundleIdentifiers:v64];
                  id v92 = [objc_alloc((Class)CNLabeledValue) initWithLabel:v93 value:v83];

                  id v5 = v94;
                  v9 = v109;
                  [v109 addObject:v92];

                  v7 = v104;
                  v8 = v105;
                  v10 = v110;
                  v11 = v111;
                  v6 = &CC_SHA256_Final_ptr;
                  goto LABEL_125;
                case 32775:
                  v102 = v12;
                  id v68 = v2;
                  v69 = sub_100007314(v68);
                  sub_100007314(v68);
                  v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v70 == @"<<EOB>>")
                  {
                    v73 = 0;
LABEL_120:
                    v72 = &stru_100055F00;
                    goto LABEL_121;
                  }
                  v71 = v70;
                  v72 = 0;
                  v73 = 0;
                  do
                  {
                    if ([(__CFString *)v71 isEqualToString:CNInstantMessageAddressUsernameKey])
                    {
                      uint64_t v74 = sub_100006DE8(v68);
                      v75 = v72;
                      v72 = (__CFString *)v74;
                    }
                    else if ([(__CFString *)v71 isEqualToString:CNInstantMessageAddressServiceKey])
                    {
                      uint64_t v76 = sub_100007314(v68);
                      v75 = v73;
                      v73 = (__CFString *)v76;
                    }
                    else
                    {
                      v75 = sub_100006DE8(v68);
                    }

                    sub_100007314(v68);
                    v77 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    v71 = v77;
                  }
                  while (v77 != @"<<EOB>>");
                  if (!v72) {
                    goto LABEL_120;
                  }
LABEL_121:
                  if (v73) {
                    v84 = v73;
                  }
                  else {
                    v84 = &stru_100055F00;
                  }
                  id v85 = objc_alloc((Class)CNLabeledValue);
                  id v86 = [objc_alloc((Class)CNInstantMessageAddress) initWithUsername:v72 service:v84];
                  id v87 = [v85 initWithLabel:v69 value:v86];

                  v10 = v110;
                  [v110 addObject:v87];

                  v7 = v104;
                  v8 = v105;
                  v9 = v109;
                  v11 = v111;
LABEL_125:
                  v12 = v102;
                  break;
                case 32776:
                  sub_100007314(v2);
                  v102 = v12;
                  v79 = v78 = v6;
                  v80 = sub_1000070AC(v2);
                  id v81 = [objc_alloc((Class)CNLabeledValue) initWithLabel:v79 value:v80];
                  v11 = v111;
                  [v111 addObject:v81];

                  v8 = v105;
                  v10 = v110;

                  v6 = v78;
                  goto LABEL_125;
                default:
                  NSExceptionName v89 = NSInvalidUnarchiveOperationException;
                  CFStringRef v90 = @"Unrecognized tag value";
                  goto LABEL_148;
              }
              continue;
          }
        }
        else
        {
          id v15 = v2;
          for (i = v15; ; id v15 = i)
          {
            sub_100007314(v15);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v17 == @"<<EOB>>") {
              break;
            }
            id v18 = sub_100006DE8(i);
          }
        }
        v10 = v110;
        v11 = v111;
      }
      else
      {
LABEL_7:
        id v14 = sub_100006F4C(v2);
      }
    }
    while (([v2 hasBytesAvailable] & 1) != 0);
  }
  [v2 close];
  if ([v108 count]) {
    [v5 setPhoneNumbers:v108];
  }
  if ([v107 count]) {
    [v5 setEmailAddresses:v107];
  }
  if ([v7 count]) {
    [v5 setPostalAddresses:v7];
  }
  if ([v106 count]) {
    [v5 setUrlAddresses:v106];
  }
  if ([v8 count]) {
    [v5 setContactRelations:v8];
  }
  if ([v9 count]) {
    [v5 setSocialProfiles:v9];
  }
  if ([v10 count]) {
    [v5 setInstantMessageAddresses:v10];
  }
  if ([v11 count]) {
    [v5 setDates:v11];
  }

  return v5;
}

@end