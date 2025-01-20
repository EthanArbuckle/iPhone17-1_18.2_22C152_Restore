@interface MapsExternalDeviceState
+ (id)allKeys;
- (BOOL)disableSoftwareKeyboard;
- (BOOL)hasLimitedUI;
- (BOOL)isNavigationAidedDrivingEnabled;
- (BOOL)limitLongLists;
- (BOOL)lowLightLevel;
- (BOOL)ownsScreen;
- (BOOL)rightHandDrive;
- (BOOL)supportsNavigationAidedDriving;
- (MapsExternalDeviceState)initWithExternalDevice:(id)a3;
- (id)descriptionForKey:(id)a3;
- (int64_t)connectionType;
@end

@implementation MapsExternalDeviceState

+ (id)allKeys
{
  if (qword_10160F418 != -1) {
    dispatch_once(&qword_10160F418, &stru_1012F3B20);
  }
  v2 = (void *)qword_10160F410;

  return v2;
}

- (id)descriptionForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"connectionType"])
  {
    v10.receiver = self;
    v10.super_class = (Class)MapsExternalDeviceState;
    v5 = [(MapsExternalState *)&v10 descriptionForKey:v4];
  }
  else
  {
    v6 = [(MapsExternalDeviceState *)self valueForKey:v4];

    unsigned int v7 = [v6 BOOLValue];
    v8 = @"NO";
    if (v7) {
      v8 = @"YES";
    }
    v5 = v8;
  }

  return v5;
}

- (MapsExternalDeviceState)initWithExternalDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    if ([v4 transportType] || !GEOConfigGetBOOL())
    {
      v19.receiver = self;
      v19.super_class = (Class)MapsExternalDeviceState;
      v12 = [(MapsExternalDeviceState *)&v19 init];
      if (v12)
      {
        v12->_lowLightLevel = [v5 nightMode];
        v12->_rightHandDrive = [v5 rightHandDrive];
        unsigned __int8 v13 = [v5 limitedUI];
        v12->_hasLimitedUI = v13;
        if (v13)
        {
          v14 = [v5 limitedUIElements];
          v12->_limitLongLists = [v14 containsObject:AVExternalDeviceLimitedUIElementNonMusicLists];
        }
        else
        {
          v12->_limitLongLists = 0;
        }
        if (v12->_hasLimitedUI)
        {
          v16 = [v5 limitedUIElements];
          v12->_disableSoftwareKeyboard = [v16 containsObject:AVExternalDeviceLimitedUIElementSoftKeyboard];
        }
        else
        {
          v12->_disableSoftwareKeyboard = 0;
        }
        v12->_ownsScreen = [v5 ownsScreen];
        v12->_supportsNavigationAidedDriving = ((unint64_t)[v5 navigationAidedDriving] & 0xFFFFFFFFFFFFFFFELL) == 2;
        v12->_navigationAidedDrivingEnabled = [v5 navigationAidedDriving] == (id)2;
        unint64_t v17 = (unint64_t)[v5 transportType];
        if (v17 <= 3) {
          v12->_connectionType = qword_100F70220[v17];
        }
      }
      self = v12;
      v15 = self;
    }
    else
    {
      v6 = sub_1006734AC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = v5;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = objc_opt_class();
          v9 = [v7 ID];
          objc_super v10 = [v7 name];
          v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p> (ID: %@, name: %@, transportType: %ld)", v8, v7, v9, v10, [v7 transportType]);
        }
        else
        {
          v11 = [v7 description];
        }

        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Trying to create state for AVExternalDevice with bad transport type, treating as nil: %{public}@", buf, 0xCu);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)lowLightLevel
{
  return self->_lowLightLevel;
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (BOOL)hasLimitedUI
{
  return self->_hasLimitedUI;
}

- (BOOL)limitLongLists
{
  return self->_limitLongLists;
}

- (BOOL)disableSoftwareKeyboard
{
  return self->_disableSoftwareKeyboard;
}

- (BOOL)ownsScreen
{
  return self->_ownsScreen;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (BOOL)supportsNavigationAidedDriving
{
  return self->_supportsNavigationAidedDriving;
}

- (BOOL)isNavigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

@end