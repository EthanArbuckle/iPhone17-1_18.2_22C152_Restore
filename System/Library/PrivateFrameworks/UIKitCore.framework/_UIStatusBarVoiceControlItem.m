@interface _UIStatusBarVoiceControlItem
+ (id)pillCombinedDisplayIdentifier;
- (double)imageOpacityForVoiceControlType:(int64_t)a3;
- (id)_overriddenStyleAttributesForVoiceControlType:(int64_t)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)imageForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarVoiceControlItem

+ (id)pillCombinedDisplayIdentifier
{
  return (id)[a1 displayItemIdentifierFromString:@"pillCombinedDisplayIdentifier"];
}

- (id)indicatorEntryKey
{
  return @"voiceControlEntry";
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  v5 = [a3 voiceControlEntry];
  uint64_t v6 = [v5 type];

  return [(_UIStatusBarVoiceControlItem *)self _overriddenStyleAttributesForVoiceControlType:v6];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVoiceControlItem;
  v8 = [(_UIStatusBarIndicatorItem *)&v13 applyUpdate:v6 toDisplayItem:v7];
  if ([v6 dataChanged])
  {
    v9 = [v6 data];
    v10 = [v9 voiceControlEntry];
    uint64_t v11 = [v10 type];

    [(_UIStatusBarVoiceControlItem *)self imageOpacityForVoiceControlType:v11];
    objc_msgSend(v7, "setViewAlpha:");
  }

  return v8;
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = [a3 data];
  v4 = [v3 voiceControlEntry];

  if ((unint64_t)([v4 type] - 1) >= 2) {
    v5 = @"mic.slash.fill";
  }
  else {
    v5 = @"mic.fill";
  }

  return v5;
}

- (id)imageForUpdate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVoiceControlItem;
  v5 = [(_UIStatusBarIndicatorItem *)&v13 imageForUpdate:v4];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v6 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v8 = _UIInternalPreference_EnableWorkaroundFor50826562;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_EnableWorkaroundFor50826562)
    {
      while (v6 >= v8)
      {
        _UIInternalPreferenceSync(v6, &_UIInternalPreference_EnableWorkaroundFor50826562, @"EnableWorkaroundFor50826562", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v8 = _UIInternalPreference_EnableWorkaroundFor50826562;
        if (v6 == _UIInternalPreference_EnableWorkaroundFor50826562) {
          goto LABEL_4;
        }
      }
      if (byte_1E8FD512C)
      {
        v9 = [v4 data];
        v10 = [v9 voiceControlEntry];
        uint64_t v11 = [v10 type];

        if (v11)
        {
          [v5 _contentInsets];
          uint64_t v12 = objc_msgSend(v5, "_imageWithContentInsets:");

          v5 = (void *)v12;
        }
      }
    }
  }
LABEL_4:

  return v5;
}

- (double)imageOpacityForVoiceControlType:(int64_t)a3
{
  double result = 0.65;
  if ((unint64_t)(a3 - 1) < 2) {
    return 1.0;
  }
  return result;
}

- (id)_overriddenStyleAttributesForVoiceControlType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    id v4 = +[UIColor whiteColor];
    [v3 setImageTintColor:v4];
  }
  return v3;
}

@end