@interface WFFocusModesManager
+ (id)activeMode;
+ (id)availableModes;
+ (id)availableModesForAutomationsDisplay;
+ (id)defaultActivity;
+ (id)enteringSymbolForSymbolName:(id)a3;
+ (id)exitingSymbolForSymbolName:(id)a3;
+ (id)glyphToFilledGlyphMapping;
@end

@implementation WFFocusModesManager

+ (id)exitingSymbolForSymbolName:(id)a3
{
  id v3 = a3;
  if ([&unk_1F2317C40 containsObject:v3])
  {
    [NSString stringWithFormat:@"%@.circle", v3];
  }
  else
  {
    if (![&unk_1F2317C58 containsObject:v3])
    {
      if ([&unk_1F2317C70 containsObject:v3]
        || ![v3 containsString:@".fill"])
      {
        id v4 = v3;
      }
      else
      {
        id v4 = [v3 stringByReplacingOccurrencesOfString:@".fill" withString:&stru_1F229A4D8];
      }
      goto LABEL_10;
    }
    [NSString stringWithFormat:@"%@.square", v3];
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v5 = v4;

  return v5;
}

+ (id)enteringSymbolForSymbolName:(id)a3
{
  id v4 = a3;
  v5 = [a1 glyphToFilledGlyphMapping];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [a1 glyphToFilledGlyphMapping];
    v9 = [NSString stringWithFormat:@"%@.circle", v4];
    v10 = [v8 objectForKey:v9];

    if (v10)
    {
      id v7 = v10;
    }
    else
    {
      v11 = [a1 glyphToFilledGlyphMapping];
      v12 = [NSString stringWithFormat:@"%@.square", v4];
      v13 = [v11 objectForKey:v12];

      if (v13) {
        v14 = v13;
      }
      else {
        v14 = v4;
      }
      id v7 = v14;
    }
  }

  return v7;
}

+ (id)glyphToFilledGlyphMapping
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_1F2317C28 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_1F2317C28);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = [NSString stringWithFormat:@"%@.fill", v7];
        [v2 setObject:v8 forKey:v7];
      }
      uint64_t v4 = [&unk_1F2317C28 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  [v2 setObject:@"emoji.face.grinning.inverse" forKey:@"emoji.face.grinning"];
  return v2;
}

+ (id)defaultActivity
{
  id v2 = [getFCActivityManagerClass() sharedActivityManager];
  uint64_t v3 = [v2 defaultActivity];

  return v3;
}

+ (id)availableModesForAutomationsDisplay
{
  id v2 = [a1 availableModes];
  uint64_t v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_68186);

  return v3;
}

id __58__WFFocusModesManager_availableModesForAutomationsDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 activityIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.sleep.sleep-mode"];

  if (v4) {
    id v5 = 0;
  }
  else {
    id v5 = v2;
  }

  return v5;
}

+ (id)availableModes
{
  id v2 = [getFCActivityManagerClass() sharedActivityManager];
  uint64_t v3 = [v2 availableActivities];

  return v3;
}

+ (id)activeMode
{
  id v2 = [getFCActivityManagerClass() sharedActivityManager];
  uint64_t v3 = [v2 activeActivity];

  return v3;
}

@end