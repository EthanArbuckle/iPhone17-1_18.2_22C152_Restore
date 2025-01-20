@interface UIWindowScene
- (int64_t)_maps_interfaceStyle;
- (int64_t)_maps_lightLevelPriority;
- (int64_t)carSceneType;
@end

@implementation UIWindowScene

- (int64_t)carSceneType
{
  v3 = [(UIWindowScene *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v4 = [(UIWindowScene *)self delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return 0;
    }
  }
  v6 = [(UIWindowScene *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 sceneType];
  }
  else
  {
    v10 = sub_10008FEAC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "carSceneType: failed to get scene delegate for scene: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = 0;
  }

  return (int64_t)v9;
}

- (int64_t)_maps_lightLevelPriority
{
  int64_t v2 = [(UIWindowScene *)self carSceneType];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_100F6F070[v2 - 1];
  }
}

- (int64_t)_maps_interfaceStyle
{
  int64_t v2 = [(UIWindowScene *)self windows];
  v3 = [v2 firstObject];
  v4 = [v3 traitCollection];
  id v5 = [v4 _car_userInterfaceStyle];

  return (int64_t)v5;
}

@end