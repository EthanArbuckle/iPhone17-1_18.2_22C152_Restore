@interface MRAudioCodecComponentHandler
+ (id)sharedSingleton;
- (MRAudioCodecComponentHandler)init;
- (id)_init;
@end

@implementation MRAudioCodecComponentHandler

- (MRAudioCodecComponentHandler)init
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector("sharedSingleton");
  v7 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Use +[%@ %@] instead of -%@.", v5, v6, v7);

  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)MRAudioCodecComponentHandler;
  v2 = [(MRSystemHealthComponentHandler *)&v6 initWithComponentName:@"AudioCodec"];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"AudioCodec"];
    v4 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v4];

    [(MRBaseComponentHandler *)v3 setComponentId:9];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationTitle:@"SPEAKER_FOLLOWUP_TITLE"];
    [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"AUDIO_FOLLOWUP_INFO"];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"AUDIO_POPUP_INFO"];
    [(MRBaseComponentHandler *)v3 setUnlockCheckActivityRequired:0];
    [(MRBaseComponentHandler *)v3 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v3 setDisplayModalPopup:0];
    [(MRBaseComponentHandler *)v3 setDisplayFollowup:0];
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004FA8;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA58 != -1) {
    dispatch_once(&qword_10001EA58, block);
  }
  v2 = (void *)qword_10001EA50;

  return v2;
}

@end