@interface RDSoundInputImpl_iOS_Shared
+ (BOOL)_isCarPlayConnected;
+ (BOOL)isCarPlayActive;
+ (BOOL)isSystemSleeping;
@end

@implementation RDSoundInputImpl_iOS_Shared

+ (BOOL)_isCarPlayConnected
{
  if (qword_1000FEAC8 != -1) {
    dispatch_once(&qword_1000FEAC8, &stru_1000EE1B0);
  }
  return [(id)qword_1000FEAC0 currentSession] != 0;
}

+ (BOOL)isCarPlayActive
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    LOBYTE(v3) = _[a1 _isCarPlayConnected];
  }
  return v3;
}

+ (BOOL)isSystemSleeping
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_10000A868;
  v11 = sub_10000A878;
  int v3 = (void *)qword_1000FEAD0;
  uint64_t v12 = qword_1000FEAD0;
  if (!qword_1000FEAD0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A884;
    v6[3] = &unk_1000EE1D8;
    v6[4] = &v7;
    sub_10000A884((uint64_t)v6);
    int v3 = (void *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  unsigned int v4 = objc_msgSend(objc_msgSend(v3, "server"), "isSystemSleeping");
  if (v4) {
    LOBYTE(v4) = [a1 isCarPlayActive] ^ 1;
  }
  return v4;
}

@end