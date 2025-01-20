@interface SUdYIiwa8PrJA4HA
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation SUdYIiwa8PrJA4HA

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v10 = (id)qword_1006AD1B0;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "mc", "enableTelemetry=YES", buf, 2u);
  }
  uint64_t v12 = 166000;

  if ((uint64_t)+[CNContactStore authorizationStatusForEntityType:0] < CNAuthorizationStatusAuthorized)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_24;
  }
  id v15 = objc_alloc_init((Class)CNContactStore);
  v36[0] = CNContactNamePrefixKey;
  v36[1] = CNContactGivenNameKey;
  v36[2] = CNContactMiddleNameKey;
  v36[3] = CNContactFamilyNameKey;
  v36[4] = CNContactPreviousFamilyNameKey;
  v36[5] = CNContactNameSuffixKey;
  v36[6] = CNContactNicknameKey;
  v36[7] = CNContactOrganizationNameKey;
  v36[8] = CNContactDepartmentNameKey;
  v36[9] = CNContactJobTitleKey;
  v36[10] = CNContactPhoneticGivenNameKey;
  v36[11] = CNContactPhoneticMiddleNameKey;
  v36[12] = CNContactPhoneticFamilyNameKey;
  v36[13] = CNContactPhoneticOrganizationNameKey;
  v36[14] = CNContactBirthdayKey;
  v36[15] = CNContactNonGregorianBirthdayKey;
  v36[16] = CNContactNoteKey;
  v36[17] = CNContactImageDataAvailableKey;
  v36[18] = CNContactTypeKey;
  v36[19] = CNContactPhoneNumbersKey;
  v36[20] = CNContactEmailAddressesKey;
  v36[21] = CNContactPostalAddressesKey;
  v36[22] = CNContactDatesKey;
  v36[23] = CNContactUrlAddressesKey;
  v36[24] = CNContactRelationsKey;
  v36[25] = CNContactSocialProfilesKey;
  v36[26] = CNContactInstantMessageAddressesKey;
  v16 = &objc_autorelease_ptr;
  v17 = +[NSArray arrayWithObjects:v36 count:27];
  id v30 = 0;
  v14 = [v15 _crossPlatformUnifiedMeContactWithKeysToFetch:v17 error:&v30];
  id v18 = v30;
  v19 = v18;
  if (!v18)
  {
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  v20 = a4;
  v21 = [v18 domain];
  unsigned int v22 = [v21 isEqualToString:@"CNErrorDomain"];

  if (!v22)
  {
    uint64_t v12 = 0;
    a4 = v20;
    v16 = &objc_autorelease_ptr;
    goto LABEL_20;
  }
  uint64_t v23 = (uint64_t)[v19 code];
  if (v23 > 99)
  {
    a4 = v20;
    v16 = &objc_autorelease_ptr;
    if (v23 == 100)
    {
      uint64_t v12 = 166003;
      goto LABEL_20;
    }
    if (v23 == 200)
    {
      uint64_t v12 = 166004;
      goto LABEL_20;
    }
LABEL_17:
    uint64_t v12 = 166005;
    goto LABEL_20;
  }
  a4 = v20;
  v16 = &objc_autorelease_ptr;
  if (v23 == 1)
  {
    uint64_t v12 = 166001;
    goto LABEL_20;
  }
  if (v23 != 2) {
    goto LABEL_17;
  }
  uint64_t v12 = 166002;
LABEL_20:
  if (v14)
  {
    v35 = v14;
    v13 = [v16[485] arrayWithObjects:&v35 count:1];
  }
  else
  {
    v13 = 0;
  }

LABEL_24:
  v24 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v13 qfSDGTGvqd3Hruzg:v12];
  v25 = (id)qword_1006AD1B0;
  v26 = v25;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v32 = var0;
    __int16 v33 = 1026;
    unsigned int v34 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v9, "mc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v24;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0xE41739AED8186A8ELL forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

@end