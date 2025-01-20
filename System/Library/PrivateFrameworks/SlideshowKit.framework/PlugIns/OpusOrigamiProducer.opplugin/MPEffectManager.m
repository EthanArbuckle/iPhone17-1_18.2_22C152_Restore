@interface MPEffectManager
+ (id)sharedManager;
+ (void)initialize;
+ (void)loadEffectManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (BOOL)allowTextCustomizationForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5;
- (BOOL)effectDoesAccumulate:(id)a3;
- (BOOL)effectNeedsPanoInformation:(id)a3;
- (BOOL)effectNeedsRandomSeedInformation:(id)a3;
- (BOOL)posterTimeIsStaticForEffectID:(id)a3 andPresetID:(id)a4;
- (BOOL)skipPanoramaScaleForEffectID:(id)a3;
- (BOOL)useUppercaseForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5;
- (MPEffectManager)initWithPaths:(id)a3;
- (double)defaultFullDurationForEffectID:(id)a3;
- (double)defaultMainDurationForEffectID:(id)a3;
- (double)defaultPhaseInDurationForEffectID:(id)a3;
- (double)defaultPhaseOutDurationForEffectID:(id)a3;
- (double)defaultPosterFrameTimeForEffect:(id)a3;
- (double)defaultPosterFrameTimeForEffectID:(id)a3 andPresetID:(id)a4;
- (double)durationPaddingForEffectID:(id)a3;
- (double)maxFontSizeInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5;
- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6;
- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6 imageAspectRatio:(double)a7;
- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5;
- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6;
- (double)mediaAspectRatioHintForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6;
- (double)minimumEffectDurationForEffectID:(id)a3;
- (double)panoramaScaleOffsetForEffectID:(id)a3;
- (id)allCategoryIDs;
- (id)allEffectIDs;
- (id)aspectRatioForEffectID:(id)a3;
- (id)attributesForEffectID:(id)a3 andPresetID:(id)a4;
- (id)categoryIDsForEffectID:(id)a3;
- (id)controlForAttribute:(id)a3 forEffectID:(id)a4;
- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5;
- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 needsNSConversion:(BOOL)a6;
- (id)descriptionForEffectID:(id)a3;
- (id)effectIDsForCategoryID:(id)a3;
- (id)effectsWithNumOfImages:(unint64_t)a3;
- (id)imageInputInfoForEffectID:(id)a3;
- (id)localizedCategoryNameFromCategoryID:(id)a3;
- (id)localizedEffectNameForEffectID:(id)a3;
- (id)localizedFontsForEffectID:(id)a3;
- (id)localizedSettingsUITitleForTitleKey:(id)a3 inEffect:(id)a4;
- (id)localizedString:(id)a3 forEffectID:(id)a4;
- (id)mediaAspectRatioHintsForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5;
- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4;
- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5;
- (id)orientationForEffectID:(id)a3;
- (id)presetIDsForEffectID:(id)a3;
- (id)settingsUIControlDescriptionsForEffect:(id)a3;
- (id)showTimeScriptForEffectID:(id)a3 atSlideIndex:(int64_t)a4;
- (id)sizeScriptForEffectID:(id)a3 atIndex:(int64_t)a4;
- (id)versionOfEffectID:(id)a3;
- (int64_t)numberOfSecondarySlidesForEffectID:(id)a3;
- (int64_t)numberOfSlidesForEffectID:(id)a3;
- (int64_t)panoTypeForSlideAtIndex:(int64_t)a3 inEffect:(id)a4 forPresetID:(id)a5;
- (unint64_t)maxNumOfImagesPerEffectInList:(id)a3;
- (unint64_t)minNumOfImagesPerEffectInList:(id)a3;
- (unint64_t)numOfImagesForEffectID:(id)a3;
- (unint64_t)numOfImagesForEffectPresetID:(id)a3;
- (unint64_t)numOfTextsForEffectID:(id)a3;
- (void)_loadFontsFromPath:(id)a3 requiredFonts:(id)a4;
- (void)dealloc;
- (void)defaultDurationsForEffectID:(id)a3 phaseInDuration:(double *)a4 mainDuration:(double *)a5 phaseOutDuration:(double *)a6;
@end

@implementation MPEffectManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MPEffectManager;
  objc_msgSendSuper2(&v2, "initialize");
}

+ (id)sharedManager
{
  id result = (id)qword_1F1350;
  if (!qword_1F1350)
  {
    objc_sync_enter(a1);
    if (!qword_1F1350) {
      qword_1F1350 = [[MPEffectManager alloc] initWithPaths:0];
    }
    objc_sync_exit(a1);
    return (id)qword_1F1350;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F1350)
  {
    objc_sync_enter(a1);

    qword_1F1350 = 0;
    objc_sync_exit(a1);
  }
}

- (void)dealloc
{
  v3 = self->mLock;
  [(NSLock *)v3 lock];

  self->mEffects = 0;
  self->mCategories = 0;

  self->mCachedAspectRatios = 0;
  self->mCachedBreakInfo = 0;

  self->mLock = 0;
  [(NSLock *)v3 unlock];

  CFErrorRef error = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mRegisteredFonts = self->mRegisteredFonts;
  id v5 = [(NSMutableArray *)mRegisteredFonts countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(mRegisteredFonts);
        }
        if (!CTFontManagerUnregisterFontsForURL(*(CFURLRef *)(*((void *)&v11 + 1) + 8 * i), kCTFontManagerScopeProcess, &error))
        {
          CFStringRef v9 = CFErrorCopyDescription(error);
          NSLog(@"CTFontManagerUnregisterFontsForURL failed, error '%@'\n", v9);
          CFRelease(v9);
        }
      }
      id v6 = [(NSMutableArray *)mRegisteredFonts countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  self->mRegisteredFonts = 0;
  v10.receiver = self;
  v10.super_class = (Class)MPEffectManager;
  [(MPEffectManager *)&v10 dealloc];
}

- (id)versionOfEffectID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mEffects objectForKey:a3];
  return [v3 objectForKey:@"version"];
}

- (unint64_t)numOfImagesForEffectID:(id)a3
{
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"), "objectForKey:", @"hasMultiImageInput");
  if (v5 && ([v5 BOOLValue] & 1) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"numberOfImages");
  id v8 = [(NSMutableDictionary *)self->mEffects objectForKey:a3];
  if (v7)
  {
    unint64_t result = (int)objc_msgSend(objc_msgSend(v8, "objectForKey:", @"numberOfImages"), "intValue");
    if (result) {
      return result;
    }
  }
  else if ([v8 objectForKey:@"imageInputInfo"])
  {
    unint64_t result = (unint64_t)objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"imageInputInfo"), "count");
    if (result) {
      return result;
    }
  }
  if ([a3 rangeOfString:@"/"] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v9 = objc_msgSend(a3, "substringToIndex:", objc_msgSend(a3, "rangeOfString:", @"/"));
  id v10 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v9), "objectForKey:", @"imageInputInfo");
  id v11 = [(NSMutableDictionary *)self->mEffects objectForKey:v9];
  if (v10)
  {
    id v12 = [v11 objectForKey:@"imageInputInfo"];
    return (unint64_t)[v12 count];
  }
  else
  {
    unint64_t result = (unint64_t)[v11 objectForKey:@"numberOfImages"];
    if (result) {
      return (int)objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v9), "objectForKey:", @"numberOfImages"), "intValue");
    }
  }
  return result;
}

- (unint64_t)numOfTextsForEffectID:(id)a3
{
  return (int)objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"numberOfTexts"), "intValue");
}

- (id)categoryIDsForEffectID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mEffects objectForKey:a3];
  return [v3 objectForKey:@"categories"];
}

- (id)effectIDsForCategoryID:(id)a3
{
  id v5 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mEffects = self->mEffects;
  id v7 = [(NSMutableDictionary *)mEffects countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mEffects);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(-[MPEffectManager categoryIDsForEffectID:](self, "categoryIDsForEffectID:", v11), "containsObject:", a3) & 1) != 0|| objc_msgSend(a3, "isEqualToString:", @"all"))
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableDictionary *)mEffects countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)localizedEffectNameForEffectID:(id)a3
{
  id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"), "objectForKey:", @"localizedEffectName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedCategoryNameFromCategoryID:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->mCategories, "objectForKey:");
  if (!result)
  {
    id v6 = [(MPEffectManager *)self effectIDsForCategoryID:a3];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10)), "objectForKey:", @"localizedCategoryName");
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_5;
          }
          return a3;
        }
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

- (id)localizedString:(id)a3 forEffectID:(id)a4
{
  id result = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a4), "objectForKey:", @"Localized Strings"), "objectForKey:", a3);
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedSettingsUITitleForTitleKey:(id)a3 inEffect:(id)a4
{
  id result = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a4), "objectForKey:", @"localizedSettingsUI"), "objectForKey:", a3);
  if (!result) {
    return a3;
  }
  return result;
}

- (id)controlForAttribute:(id)a3 forEffectID:(id)a4
{
  id v5 = [(MPEffectManager *)self settingsUIControlDescriptionsForEffect:a4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_msgSend(objc_msgSend(v10, "objectForKey:", kMPEffectUIControlAttributeKey[0]), "isEqualToString:", a3))return objc_msgSend(v10, "copy"); {
        uint64_t v9 = (char *)v9 + 1;
        }
      }
      while (v7 != v9);
      id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)settingsUIControlDescriptionsForEffect:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mEffects objectForKey:a3];
  return [v3 objectForKey:@"settingsUI"];
}

- (id)effectsWithNumOfImages:(unint64_t)a3
{
  id v5 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mEffects = self->mEffects;
  id v7 = [(NSMutableDictionary *)mEffects countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mEffects);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(MPEffectManager *)self numberOfSlidesForEffectID:v11] == a3) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableDictionary *)mEffects countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)allEffectIDs
{
  return [(NSMutableDictionary *)self->mEffects allKeys];
}

- (id)allCategoryIDs
{
  id v3 = +[NSMutableArray array];
  objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mCategories, "allKeys"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->mEffects;
  id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(MPEffectManager *)self categoryIDsForEffectID:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)j);
              if (([v3 containsObject:v13] & 1) == 0) {
                [v3 addObject:v13];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }
      }
      id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5
{
  return [(MPEffectManager *)self defaultStringForTextInEffectID:a3 presetID:a4 atIndex:a5 needsNSConversion:1];
}

- (double)maxFontSizeInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5
{
  if (a4) {
    CFStringRef v6 = (const __CFString *)a4;
  }
  else {
    CFStringRef v6 = @"Default";
  }
  id v7 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, v6), "objectForKey:", @"textSettings");
  if ((unint64_t)[v7 count] <= a5) {
    id v8 = 0;
  }
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"maxFontSize"];
  if (!v9) {
    return -1.0;
  }
  [v9 floatValue];
  return v10;
}

- (id)presetIDsForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"presets");
  return [v3 allKeys];
}

- (id)attributesForEffectID:(id)a3 andPresetID:(id)a4
{
  [(NSLock *)self->mLock lock];
  id v7 = (NSMutableDictionary *)objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"presets"), "objectForKey:", a4);
  if (!v7
    && (a4 = @"Default",
        (id v7 = (NSMutableDictionary *)objc_msgSend(objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"presets"), "objectForKey:", @"Default"), "copy")) == 0)|| !-[NSMutableDictionary objectForKey:](v7, "objectForKey:", @"processed"))
  {
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:v7];
    id v8 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"presets"), "mutableCopy");
    [v8 setObject:v7 forKey:a4];
    objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "setObject:forKey:", v8, @"presets");
  }
  [(NSLock *)self->mLock unlock];
  return v7;
}

- (id)descriptionForEffectID:(id)a3
{
  return [(NSMutableDictionary *)self->mEffects objectForKey:a3];
}

- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4
{
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectID:", a3);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)v8;
  }
  if (v9 >= 1)
  {
    for (int64_t i = 0; i != v9; ++i)
    {
      [(MPEffectManager *)self mediaAspectRatioForEffectID:a3 usingAttributes:[(MPEffectManager *)self attributesForEffectID:a3 andPresetID:a4] atIndex:i defaultAspectRatio:1.6];
      *(float *)&double v11 = v11;
      objc_msgSend(v7, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11), ImageKey(i));
    }
  }
  return v7;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5
{
  id v6 = [(MPEffectManager *)self mediaAspectRatiosForEffectID:a3 usingPresetID:a4];
  if (!v6) {
    return 9.22337204e18;
  }
  id v7 = v6;
  if ((unint64_t)[v6 count] <= a5) {
    return 9.22337204e18;
  }
  objc_msgSend(objc_msgSend(v7, "objectForKey:", ImageKey(a5)), "floatValue");
  return v8;
}

- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5
{
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectID:", a3);
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = (uint64_t)v10;
  }
  if (v11 >= 1)
  {
    for (int64_t i = 0; i != v11; ++i)
    {
      [(MPEffectManager *)self mediaAspectRatioForEffectID:a3 usingPresetID:a4 atIndex:i defaultAspectRatio:a5];
      *(float *)&double v13 = v13;
      objc_msgSend(v9, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), ImageKey(i));
    }
  }
  return v9;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6
{
  uint64_t v11 = +[NSString stringWithFormat:@"as/%d/%@/%@/%f", a5, a3, a4, *(void *)&a6];
  id v12 = [(NSMutableDictionary *)self->mCachedAspectRatios objectForKey:v11];
  if (v12)
  {
    [v12 floatValue];
    return v13;
  }
  else
  {
    [(MPEffectManager *)self mediaAspectRatioForEffectID:a3 usingAttributes:[(MPEffectManager *)self attributesForEffectID:a3 andPresetID:a4] atIndex:a5 defaultAspectRatio:a6];
    double v14 = v15;
    *(float *)&double v15 = v15;
    [(NSMutableDictionary *)self->mCachedAspectRatios setObject:+[NSNumber numberWithFloat:v15] forKey:v11];
  }
  return v14;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6
{
  id v10 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:");
  uint64_t v11 = (char *)[v10 count];
  if ((unint64_t)(v11 - 1) >= a5) {
    int64_t v12 = a5;
  }
  else {
    int64_t v12 = (int64_t)(v11 - 1);
  }
  id v13 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", v12), "objectForKey:", @"sizeScript");
  if (v13
    && (id v14 = v13,
        id v15 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6), @"layerWidth", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0), @"layerHeight", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectID:", a3)), @"numOfImages", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a5), @"indexOfImage", 0), v16 = +[MPUtilities executeScript:withHeader:andAttributes:](MPUtilities,
                "executeScript:withHeader:andAttributes:",
                v14,
                v15,
                a4),
        v15,
        CGSize v17 = CGSizeFromString(v16),
        v17.height > 0.0))
  {
    return v17.width / v17.height;
  }
  else
  {
    return 9.22337204e18;
  }
}

- (id)imageInputInfoForEffectID:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"imageInputInfo"), "copy");
  return v3;
}

- (double)defaultPhaseInDurationForEffectID:(id)a3
{
  double v4 = 0.0;
  [(MPEffectManager *)self defaultDurationsForEffectID:a3 phaseInDuration:&v4 mainDuration:0 phaseOutDuration:0];
  return v4;
}

- (double)defaultMainDurationForEffectID:(id)a3
{
  double v4 = 0.0;
  [(MPEffectManager *)self defaultDurationsForEffectID:a3 phaseInDuration:0 mainDuration:&v4 phaseOutDuration:0];
  return v4;
}

- (double)defaultPhaseOutDurationForEffectID:(id)a3
{
  double v4 = 0.0;
  [(MPEffectManager *)self defaultDurationsForEffectID:a3 phaseInDuration:0 mainDuration:0 phaseOutDuration:&v4];
  return v4;
}

- (void)defaultDurationsForEffectID:(id)a3 phaseInDuration:(double *)a4 mainDuration:(double *)a5 phaseOutDuration:(double *)a6
{
  if (objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3))
  {
    id v11 = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", a3, objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, @"Default"), 0, 0, 1.77777779);
    int64_t v12 = v11;
    if (a4)
    {
      [v11 phaseInDuration];
      *(void *)a4 = v13;
    }
    if (a5)
    {
      [v12 mainDuration];
      *(void *)a5 = v14;
    }
    if (a6)
    {
      [v12 phaseOutDuration];
LABEL_25:
      *(void *)a6 = v15;
    }
  }
  else
  {
    if (a4)
    {
      if ([a3 hasPrefix:@"SlidingPanels"]) {
        uint64_t v16 = 0x3FE5555C52E72DA1;
      }
      else {
        objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"phaseInDuration"), "doubleValue");
      }
      *(void *)a4 = v16;
    }
    if (a5)
    {
      objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"mainDuration"), "doubleValue");
      *(void *)a5 = v17;
      unsigned int v18 = [a3 hasPrefix:@"SlidingPanels"];
      double v19 = *a5;
      if (v18) {
        double v19 = *a5 + -1.0;
      }
      if ((v18 & 1) != 0 || v19 == 0.0)
      {
        if (v19 == 0.0) {
          double v19 = 3.0;
        }
        *a5 = v19;
      }
    }
    if (a6)
    {
      if ([a3 hasPrefix:@"SlidingPanels"]) {
        uint64_t v15 = 0x3FD555475A31A4BELL;
      }
      else {
        objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"phaseOutDuration"), "doubleValue");
      }
      goto LABEL_25;
    }
  }
}

- (double)defaultPosterFrameTimeForEffectID:(id)a3 andPresetID:(id)a4
{
  if (!a4) {
    a4 = @"Default";
  }
  id v6 = objc_msgSend(-[MPEffectManager attributesForEffectID:andPresetID:](self, "attributesForEffectID:andPresetID:", a3, a4), "objectForKey:", @"posterTime");
  if (v6
    || (id v6 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"posterTime")) != 0)
  {
    [v6 doubleValue];
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    [(MPEffectManager *)self defaultDurationsForEffectID:a3 phaseInDuration:&v9 mainDuration:&v8 phaseOutDuration:0];
    return v9 + v8 * 0.5;
  }
  return result;
}

- (double)defaultPosterFrameTimeForEffect:(id)a3
{
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"), "objectForKey:", @"posterTime");
  if (v5)
  {
    [v5 doubleValue];
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    [(MPEffectManager *)self defaultDurationsForEffectID:a3 phaseInDuration:&v8 mainDuration:&v7 phaseOutDuration:0];
    double result = v8 + v7;
    if (v8 + v7 == 0.0) {
      return v7 * 0.5;
    }
  }
  return result;
}

- (int64_t)numberOfSlidesForEffectID:(id)a3
{
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"), "objectForKey:", @"hasMultiImageInput");
  if (v5 && ([v5 BOOLValue] & 1) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"numberOfSlides");
  if (v7)
  {
    return (int64_t)[v7 integerValue];
  }
  else
  {
    id v8 = +[MPEffectManager sharedManager];
    return (int64_t)[v8 numOfImagesForEffectID:a3];
  }
}

- (int64_t)numberOfSecondarySlidesForEffectID:(id)a3
{
  int64_t result = (int64_t)objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"numberOfSecondarySlides");
  if (result)
  {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (id)orientationForEffectID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mEffects objectForKey:a3];
  return [v3 objectForKey:@"orientation"];
}

- (id)aspectRatioForEffectID:(id)a3
{
  id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"), "objectForKey:", @"aspectRatio");
  if (!result)
  {
    if ([a3 hasPrefix:@"Origami2-P"]) {
      return @"HiddenAspectRatio";
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)localizedFontsForEffectID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mEffects objectForKey:a3];
  return [v3 objectForKey:@"Localized Fonts"];
}

- (BOOL)skipPanoramaScaleForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"skipPanoramaScale");
  if (v3)
  {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 needsNSConversion:(BOOL)a6
{
  if (a4) {
    CFStringRef v9 = (const __CFString *)a4;
  }
  else {
    CFStringRef v9 = @"Default";
  }
  id v10 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, v9), "objectForKey:", @"textSettings");
  if ((unint64_t)[v10 count] <= a5) {
    id v11 = 0;
  }
  else {
    id v11 = [v10 objectAtIndex:a5];
  }
  id v12 = [v11 objectForKey:@"fontSize"];
  CFStringRef v13 = (const __CFString *)[v11 objectForKey:@"fontName"];
  if (v13) {
    CFStringRef v14 = v13;
  }
  else {
    CFStringRef v14 = @"Helvetica";
  }
  id v15 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"Localized Fonts");
  if (v15)
  {
    id v16 = [v15 objectForKey:v14];
    if (v16)
    {
      uint64_t v17 = v16;
      CFStringRef v14 = (const __CFString *)[v16 objectForKey:@"Name"];
      id v18 = [v17 objectForKey:@"Size"];
      if (!v14) {
        return 0;
      }
      id v12 = v18;
    }
  }
  CFStringRef v19 = (const __CFString *)[v11 objectForKey:@"title"];
  if (v19) {
    CFStringRef v20 = v19;
  }
  else {
    CFStringRef v20 = @"Text";
  }
  long long v21 = +[MPUtilities CGColorFromString:](MPUtilities, "CGColorFromString:", [v11 objectForKey:@"fontColor"]);
  [v12 floatValue];
  CTFontRef v23 = CTFontCreateWithName(v14, v22, 0);
  unsigned __int8 v33 = objc_msgSend(objc_msgSend(v11, "objectForKey:", @"alignment"), "intValue");
  objc_msgSend(objc_msgSend(v11, "objectForKey:", @"headIndent"), "floatValue");
  int v32 = v24;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v33;
  int v35 = 1;
  uint64_t v36 = 4;
  v37 = &v32;
  int v38 = 2;
  uint64_t v39 = 4;
  v40 = &v32;
  CTParagraphStyleRef v25 = CTParagraphStyleCreate(&settings, 3uLL);
  v26 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v21, kCTForegroundColorAttributeName, v23, kCTFontAttributeName, v25, kCTParagraphStyleAttributeName, 0);
  CFRelease(v25);
  CFRelease(v23);
  id v27 = [v11 objectForKey:@"kern"];
  if (v27) {
    [(NSMutableDictionary *)v26 setObject:v27 forKey:kCTKernAttributeName];
  }
  id v28 = objc_msgSend(objc_msgSend(v11, "objectForKey:", @"shadow"), "mutableCopy");
  if (v28)
  {
    v29 = v28;
    if ([v28 objectForKey:@"offset"])
    {
      CGSize v30 = CGSizeFromString((NSString *)[v29 objectForKey:@"offset"]);
      objc_msgSend(v29, "setObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v30.width, v30.height), @"offset");
    }
    if ([v29 objectForKey:@"color"]) {
      objc_msgSend(v29, "setObject:forKey:", +[MPUtilities CGColorFromString:](MPUtilities, "CGColorFromString:", objc_msgSend(v29, "objectForKey:", @"color")), @"color");
    }
    if ([v29 objectForKey:@"blurRadius"])
    {
      objc_msgSend(objc_msgSend(v29, "objectForKey:", @"blurRadius"), "floatValue");
      objc_msgSend(v29, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"blurRadius");
    }
    [(NSMutableDictionary *)v26 setObject:v29 forKey:@"shadow"];
  }
  return [objc_alloc((Class)NSAttributedString) initWithString:v20 attributes:v26];
}

- (BOOL)posterTimeIsStaticForEffectID:(id)a3 andPresetID:(id)a4
{
  if (a4) {
    CFStringRef v6 = (const __CFString *)a4;
  }
  else {
    CFStringRef v6 = @"Default";
  }
  id v7 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, v6), "objectForKey:", @"posterTimeIsStatic");
  if (v7
    || (id v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"posterTimeIsStatic")) != 0)
  {
    LOBYTE(v7) = [v7 BOOLValue];
  }
  return (char)v7;
}

- (id)showTimeScriptForEffectID:(id)a3 atSlideIndex:(int64_t)a4
{
  id v5 = [(MPEffectManager *)self imageInputInfoForEffectID:a3];
  if ((unint64_t)[v5 count] <= a4) {
    id v6 = [v5 lastObject];
  }
  else {
    id v6 = [v5 objectAtIndex:a4];
  }
  return [v6 objectForKey:@"showTimeScript"];
}

- (double)minimumEffectDurationForEffectID:(id)a3
{
  id v3 = a3;
  if ([a3 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL) {
    id v3 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:", @"/"));
  }
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v3), "objectForKey:", @"minimumEffectDuration");
  if (!v5) {
    return 0.0;
  }
  [v5 doubleValue];
  return result;
}

- (id)sizeScriptForEffectID:(id)a3 atIndex:(int64_t)a4
{
  id v5 = [(MPEffectManager *)self imageInputInfoForEffectID:a3];
  if ((unint64_t)[v5 count] <= a4) {
    id v6 = [v5 lastObject];
  }
  else {
    id v6 = [v5 objectAtIndex:a4];
  }
  return [v6 objectForKey:@"sizeScript"];
}

- (double)defaultFullDurationForEffectID:(id)a3
{
  id v5 = +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:");
  double v9 = 0.0;
  double v10 = 0.0;
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = a3;
  }
  double v8 = 0.0;
  [(MPEffectManager *)self defaultDurationsForEffectID:v6 phaseInDuration:&v10 mainDuration:&v9 phaseOutDuration:&v8];
  return v10 + v9 + v8;
}

- (unint64_t)numOfImagesForEffectPresetID:(id)a3
{
  id v3 = a3;
  if ([a3 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL) {
    id v3 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:", @"/"));
  }
  return [(MPEffectManager *)self numberOfSlidesForEffectID:v3];
}

- (unint64_t)maxNumOfImagesPerEffectInList:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (int64_t i = 0; i != v6; int64_t i = (char *)i + 1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      unint64_t v10 = [(MPEffectManager *)self numberOfSlidesForEffectID:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      if (v10 > v7) {
        unint64_t v7 = v10;
      }
    }
    id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
  return v7;
}

- (unint64_t)minNumOfImagesPerEffectInList:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 99;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
  unint64_t v8 = 99;
  do
  {
    for (int64_t i = 0; i != v6; int64_t i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      unint64_t v10 = [(MPEffectManager *)self numberOfSlidesForEffectID:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      if (v10 < v8) {
        unint64_t v8 = v10;
      }
    }
    id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
  return v8;
}

- (BOOL)effectNeedsRandomSeedInformation:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"needsRandomSeed");
  return [v3 BOOLValue];
}

- (BOOL)effectNeedsPanoInformation:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"needsPanoInformation");
  return [v3 BOOLValue];
}

- (BOOL)effectDoesAccumulate:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"accumulates");
  return [v3 BOOLValue];
}

- (id)mediaAspectRatioHintsForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5
{
  double v9 = +[NSString stringWithFormat:@"hint/%@/%@/%f", a3, a4, *(void *)&a5];
  id v10 = [(NSMutableDictionary *)self->mCachedAspectRatios objectForKey:v9];
  if (!v10)
  {
    id v10 = +[NSMutableDictionary dictionary];
    id v11 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectID:", a3);
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v11 = objc_msgSend(-[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:", a3), "count");
    }
    if ((uint64_t)v11 >= 1)
    {
      for (int64_t i = 0; (id)i != v11; ++i)
      {
        [(MPEffectManager *)self mediaAspectRatioHintForEffectID:a3 usingAttributes:[(MPEffectManager *)self attributesForEffectID:a3 andPresetID:a4] atIndex:i defaultAspectRatio:a5];
        *(float *)&double v13 = v13;
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), ImageKey(i));
      }
    }
    [(NSMutableDictionary *)self->mCachedAspectRatios setObject:v10 forKey:v9];
  }
  return v10;
}

- (int64_t)panoTypeForSlideAtIndex:(int64_t)a3 inEffect:(id)a4 forPresetID:(id)a5
{
  double v9 = +[NSString stringWithFormat:@"%@/%@-%ld", a4, a5, a3];
  id v10 = [(NSMutableDictionary *)self->mCachedBreakInfo objectForKey:v9];
  if (v10)
  {
    return (int64_t)[v10 integerValue];
  }
  else
  {
    id v12 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", a4);
    id v13 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a4, a5);
    id v14 = objc_msgSend(objc_msgSend(v12, "objectAtIndex:", a3), "objectForKey:", @"panoType");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v14 integerValue];
    }
    else if (v14)
    {
      v26 = self;
      id v16 = [[MUMathExpressionFloatBased alloc] initWithString:v14 error:0];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (int64_t i = 0; i != v18; int64_t i = (char *)i + 1)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v13);
            }
            uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            id v22 = [v13 objectForKey:v21];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              CTFontRef v23 = (objc_class *)objc_opt_class();
              if (![NSStringFromClass(v23) isEqualToString:@"NSCFBoolean"]) {
                continue;
              }
            }
            [v22 doubleValue];
            *(float *)&double v24 = v24;
            [(MUMathExpressionFloatBased *)v16 setValue:v21 forVariable:v24];
          }
          id v18 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v18);
      }
      [(MUMathExpressionFloatBased *)v16 evaluate];
      id v15 = (id)(uint64_t)v25;

      self = v26;
    }
    else
    {
      id v15 = 0;
    }
    [(NSMutableDictionary *)self->mCachedBreakInfo setObject:+[NSNumber numberWithInteger:v15] forKey:v9];
    return (int64_t)v15;
  }
}

- (double)mediaAspectRatioHintForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6
{
  id v11 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:");
  id v12 = (char *)[v11 count];
  if ((unint64_t)(v12 - 1) >= a5) {
    int64_t v13 = a5;
  }
  else {
    int64_t v13 = (int64_t)(v12 - 1);
  }
  id v14 = objc_msgSend(objc_msgSend(v11, "objectAtIndex:", v13), "objectForKey:", @"aspectRatioHint");
  if (v14)
  {
    id v15 = v14;
    double v16 = 1.0;
    if (([v14 isEqualToString:@"all"] & 1) == 0)
    {
      double v16 = 1.5;
      if (([v15 isEqualToString:@"landscape"] & 1) == 0)
      {
        id v17 = [[MUMathExpressionFloatBased alloc] initWithString:v15 error:0];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v18 = [a4 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v29;
          do
          {
            for (int64_t i = 0; i != v19; int64_t i = (char *)i + 1)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(a4);
              }
              uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              id v23 = [a4 objectForKey:v22];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                double v24 = (objc_class *)objc_opt_class();
                if (![NSStringFromClass(v24) isEqualToString:@"NSCFBoolean"]) {
                  continue;
                }
              }
              [v23 doubleValue];
              *(float *)&double v25 = v25;
              [(MUMathExpressionFloatBased *)v17 setValue:v22 forVariable:v25];
            }
            id v19 = [a4 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v19);
        }
        [(MUMathExpressionFloatBased *)v17 evaluate];
        double v16 = v26;
      }
    }
    return v16;
  }
  else
  {
    [(MPEffectManager *)self mediaAspectRatioForEffectID:a3 usingAttributes:a4 atIndex:a5 defaultAspectRatio:a6];
  }
  return result;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6 imageAspectRatio:(double)a7
{
  id v12 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:");
  int64_t v13 = (char *)[v12 count];
  if ((unint64_t)(v13 - 1) >= a5) {
    int64_t v14 = a5;
  }
  else {
    int64_t v14 = (int64_t)(v13 - 1);
  }
  id v15 = objc_msgSend(objc_msgSend(v12, "objectAtIndex:", v14), "objectForKey:", @"sizeScript");
  if (v15
    && (id v16 = v15,
        id v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6), @"layerWidth", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0), @"layerHeight", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectID:", a3)), @"numOfImages", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7), @"imageAspectRatio", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a5), @"indexOfImage", 0),
        id v18 = +[MPUtilities executeScript:v16 withHeader:v17 andAttributes:a4], v17, v19 = CGSizeFromString(v18), v19.height > 0.0))
  {
    return v19.width / v19.height;
  }
  else
  {
    return 9.22337204e18;
  }
}

- (double)panoramaScaleOffsetForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"panoramaScaleOffset");
  if (!v3) {
    return 0.0;
  }
  [v3 doubleValue];
  return result;
}

- (double)durationPaddingForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3), "objectForKey:", @"durationPadding");
  if (!v3) {
    return 0.0;
  }
  [v3 doubleValue];
  return result;
}

- (BOOL)useUppercaseForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5
{
  if (a4) {
    CFStringRef v6 = (const __CFString *)a4;
  }
  else {
    CFStringRef v6 = @"Default";
  }
  id v7 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, v6), "objectForKey:", @"textSettings");
  if ((unint64_t)[v7 count] <= a5) {
    id v8 = 0;
  }
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"uppercase"];
  if (v9)
  {
    LOBYTE(v9) = [v9 BOOLValue];
  }
  return (char)v9;
}

- (BOOL)allowTextCustomizationForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5
{
  if (a4) {
    CFStringRef v6 = (const __CFString *)a4;
  }
  else {
    CFStringRef v6 = @"Default";
  }
  id v7 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, v6), "objectForKey:", @"textSettings");
  if ((unint64_t)[v7 count] <= a5) {
    id v8 = 0;
  }
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"allowCustomization"];
  if (!v9) {
    return 1;
  }
  return [v9 BOOLValue];
}

+ (void)loadEffectManagerWithPaths:(id)a3
{
  if (qword_1F1350)
  {

    qword_1F1350 = 0;
  }
  qword_1F1350 = [[MPEffectManager alloc] initWithPaths:a3];
}

- (MPEffectManager)initWithPaths:(id)a3
{
  CGAffineTransform *(__cdecl **v26)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  NSDictionary *v35;
  NSDictionary *v36;
  NSData *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *k;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  NSDictionary *v53;
  id v54;
  id obj;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  NSArray *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  NSString *v67;
  NSArray *v68;
  id v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  long long v86;
  long long v87;
  long long v88;
  long long v89;
  objc_super v90;
  unsigned char v91[128];
  unsigned char v92[128];
  unsigned char v93[128];
  unsigned char v94[128];
  unsigned char v95[128];

  v90.receiver = self;
  v90.super_class = (Class)MPEffectManager;
  double v4 = [(MPEffectManager *)&v90 init];
  if (v4)
  {
    v4->mEffects = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mCategories = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mCachedAspectRatios = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mCachedBreakInfo = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mRegisteredFonts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v5 = (NSLock *)objc_alloc_init((Class)NSLock);
    v4->mLock = v5;
    [(NSLock *)v5 setName:@"MPEffectManager.lock"];
    id v6 = +[NSMutableArray array];
    id v7 = v6;
    if (a3) {
      [v6 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v6, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v7;
    v58 = [v7 countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v58)
    {
      v57 = *(void *)v87;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v87 != v57) {
            objc_enumerationMutation(obj);
          }
          v59 = v8;
          v65 = *(void **)(*((void *)&v86 + 1) + 8 * v8);
          id v9 = +[NSArray arrayWithObjects:@"EffectDescriptions.plist", @"EffectDescriptionsSynergy.plist", 0];
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v68 = v9;
          id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v82 objects:v94 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v83;
            do
            {
              for (int64_t i = 0; i != v11; int64_t i = (char *)i + 1)
              {
                if (*(void *)v83 != v12) {
                  objc_enumerationMutation(v68);
                }
                int64_t v14 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [v65 stringByAppendingPathComponent:*(void *)(*((void *)&v82 + 1) + 8 * i)]);
                if (v14)
                {
                  id v15 = +[NSPropertyListSerialization propertyListWithData:v14 options:2 format:0 error:0];
                  if (v15)
                  {
                    id v16 = v15;
                    v80 = 0u;
                    v81 = 0u;
                    v78 = 0u;
                    v79 = 0u;
                    id v17 = [v15 countByEnumeratingWithState:&v78 objects:v93 count:16];
                    if (v17)
                    {
                      id v18 = v17;
                      uint64_t v19 = *(void *)v79;
                      do
                      {
                        for (j = 0; j != v18; j = (char *)j + 1)
                        {
                          if (*(void *)v79 != v19) {
                            objc_enumerationMutation(v16);
                          }
                          uint64_t v21 = *(void *)(*((void *)&v78 + 1) + 8 * (void)j);
                          id v22 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(v16, "objectForKey:", v21));
                          [(NSMutableDictionary *)v4->mEffects setObject:v22 forKey:v21];
                        }
                        id v18 = [v16 countByEnumeratingWithState:&v78 objects:v93 count:16];
                      }
                      while (v18);
                    }
                  }
                }
              }
              id v11 = [(NSArray *)v68 countByEnumeratingWithState:&v82 objects:v94 count:16];
            }
            while (v11);
          }
          id v23 = +[NSFileManager defaultManager];
          v66 = +[NSMutableSet set];
          double v24 = -[NSFileManager contentsOfDirectoryAtPath:error:](v23, "contentsOfDirectoryAtPath:error:", [v65 stringByAppendingPathComponent:@"Effects/"], 0);
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v62 = v24;
          id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v74 objects:v92 count:16];
          float v26 = &CATransform3DGetAffineTransform_ptr;
          if (v25)
          {
            long long v27 = v25;
            long long v28 = *(void *)v75;
            v60 = *(void *)v75;
            do
            {
              long long v29 = 0;
              v61 = v27;
              do
              {
                if (*(void *)v75 != v28) {
                  objc_enumerationMutation(v62);
                }
                long long v30 = [v65 stringByAppendingFormat:@"/Effects/%@", *(void *)(*((void *)&v74 + 1) + 8 * (void)v29)];
                if (objc_msgSend(objc_msgSend(v30, "pathExtension"), "isEqualToString:", @"mrbEffect"))
                {
                  long long v31 = [objc_alloc((Class)v26[450]) initWithPath:v30];
                  if (v31)
                  {
                    int v32 = v31;
                    v63 = v29;
                    v69 = v30;
                    unsigned __int8 v33 = objc_msgSend(objc_msgSend(v30, "lastPathComponent"), "stringByDeletingPathExtension");
                    v34 = [v32 pathForResource:@"EffectDescription" ofType:@"plist"];
                    v64 = v32;
                    int v35 = (NSDictionary *)[v32 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v34)
                    {
                      uint64_t v36 = v35;
                      v37 = +[NSData dataWithContentsOfFile:v34];
                      if (v37) {
                        int v38 = +[NSPropertyListSerialization propertyListWithData:v37 options:2 format:0 error:0];
                      }
                      else {
                        int v38 = 0;
                      }
                      v67 = +[NSString stringWithFormat:@"%@/Contents/Resources", v30];
                      uint64_t v39 = objc_msgSend(objc_msgSend(v64, "infoDictionary"), "objectForKey:", @"CFBundleVersion");
                      v40 = [v38 objectForKey:@"effects"];
                      if (v40)
                      {
                        v41 = v40;
                        if (v36) {
                          uint64_t v36 = +[NSDictionary dictionaryWithContentsOfFile:v36];
                        }
                        v42 = [(NSDictionary *)v36 objectForKey:@"_LOCALIZABLE_"];
                        v43 = [(NSDictionary *)v36 objectForKey:@"effects"];
                        v70 = 0u;
                        v71 = 0u;
                        v72 = 0u;
                        v73 = 0u;
                        v44 = [v41 countByEnumeratingWithState:&v70 objects:v91 count:16];
                        if (v44)
                        {
                          v45 = v44;
                          v46 = *(void *)v71;
                          do
                          {
                            for (k = 0; k != v45; k = (char *)k + 1)
                            {
                              if (*(void *)v71 != v46) {
                                objc_enumerationMutation(v41);
                              }
                              v48 = *(void *)(*((void *)&v70 + 1) + 8 * (void)k);
                              v49 = +[NSMutableDictionary dictionary];
                              objc_msgSend(v49, "addEntriesFromDictionary:", objc_msgSend(v41, "objectForKey:", v48));
                              if (v42) {
                                [v49 addEntriesFromDictionary:v42];
                              }
                              v50 = [v43 objectForKey:v48];
                              if (v50) {
                                objc_msgSend(v49, "addEntriesFromDictionary:", objc_msgSend(v50, "objectForKey:", @"_LOCALIZABLE_"));
                              }
                              [v49 setObject:v39 forKey:@"version"];
                              v51 = [v49 objectForKey:@"Fonts"];
                              if (v51) {
                                [v66 addObjectsFromArray:v51];
                              }
                              [v49 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v69, @"Icon.tiff", @"thumbnail" forKey];
                              [v49 setObject:v67 forKey:@"resourceFolderPath"];
                              [(NSMutableDictionary *)v4->mEffects setObject:v49 forKey:v48];
                            }
                            v45 = [v41 countByEnumeratingWithState:&v70 objects:v91 count:16];
                          }
                          while (v45);
                        }
                      }
                      else
                      {
                        v52 = +[NSMutableDictionary dictionary];
                        [v52 addEntriesFromDictionary:v38];
                        if (v36)
                        {
                          v53 = +[NSDictionary dictionaryWithContentsOfFile:v36];
                          if (v53) {
                            objc_msgSend(v52, "addEntriesFromDictionary:", -[NSDictionary objectForKey:](v53, "objectForKey:", @"_LOCALIZABLE_"));
                          }
                        }
                        [v52 setObject:v39 forKey:@"version"];
                        v54 = [v52 objectForKey:@"Fonts"];
                        if (v54) {
                          [v66 addObjectsFromArray:v54];
                        }
                        [v52 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v30, @"Icon.tiff", @"thumbnail" forKey];
                        [v52 setObject:v67 forKey:@"resourceFolderPath"];
                        [(NSMutableDictionary *)v4->mEffects setObject:v52 forKey:v33];
                      }
                    }

                    float v26 = &CATransform3DGetAffineTransform_ptr;
                    long long v28 = v60;
                    long long v27 = v61;
                    long long v29 = v63;
                  }
                }
                long long v29 = (char *)v29 + 1;
              }
              while (v29 != v27);
              long long v27 = [(NSArray *)v62 countByEnumeratingWithState:&v74 objects:v92 count:16];
            }
            while (v27);
          }
          -[NSMutableDictionary addEntriesFromDictionary:](v4->mCategories, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [v65 stringByAppendingPathComponent:@"LocalizedEffectCategories.plist"]));
          -[MPEffectManager _loadFontsFromPath:requiredFonts:](v4, "_loadFontsFromPath:requiredFonts:", [v65 stringByAppendingPathComponent:@"Fonts"], v66);
          uint64_t v8 = v59 + 1;
        }
        while ((id)(v59 + 1) != v58);
        v58 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
      }
      while (v58);
    }
  }
  return v4;
}

- (void)_loadFontsFromPath:(id)a3 requiredFonts:(id)a4
{
  if ([+[NSFileManager defaultManager] fileExistsAtPath:a3])
  {
    id v6 = [+[NSFileManager defaultManager] enumeratorAtPath:a3];
    id v7 = [(NSDirectoryEnumerator *)v6 nextObject];
    if (v7)
    {
      id v8 = v7;
      do
      {
        id v9 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [a3 stringByAppendingPathComponent:v8]);
        CFErrorRef error = 0;
        if (CTFontManagerRegisterFontsForURL((CFURLRef)v9, kCTFontManagerScopeProcess, &error))
        {
          [(NSMutableArray *)self->mRegisteredFonts addObject:v9];
        }
        else
        {
          CFStringRef v10 = CFErrorCopyDescription(error);
          NSLog(@"CTFontManagerRegisterFontsForURL failed, error '%@'\n", v10);
          CFRelease(v10);
        }
        id v8 = [(NSDirectoryEnumerator *)v6 nextObject];
      }
      while (v8);
    }
  }
}

@end