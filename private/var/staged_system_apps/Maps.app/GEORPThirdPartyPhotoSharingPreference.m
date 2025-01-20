@interface GEORPThirdPartyPhotoSharingPreference
+ (id)thirdPartyPhotoSharingPreferenceFromResponse:(id)a3;
@end

@implementation GEORPThirdPartyPhotoSharingPreference

+ (id)thirdPartyPhotoSharingPreferenceFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100103D6C;
  v11 = sub_100104740;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005C475C;
  v6[3] = &unk_1012F13E0;
  v6[4] = &v7;
  [v3 enumerateFeedbackInfosUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end