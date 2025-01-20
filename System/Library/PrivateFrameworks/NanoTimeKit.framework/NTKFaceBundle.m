@interface NTKFaceBundle
+ (BOOL)supportsGalleryObserverNotifications;
+ (NSString)analyticsIdentifier;
+ (NSString)identifier;
+ (id)_localizedMarkdownStringForKey:(id)a3 table:(id)a4 suffix:(id)a5 comment:(id)a6;
+ (id)_localizedStringForKey:(id)a3 table:(id)a4 suffix:(id)a5 comment:(id)a6;
+ (id)imageWithName:(id)a3;
+ (id)localizedMarkdownStringForKey:(id)a3 comment:(id)a4;
+ (id)localizedMarkdownStringForKey:(id)a3 table:(id)a4 comment:(id)a5;
+ (id)localizedMarkdownStringForKey:(id)a3 tableSuffix:(id)a4 comment:(id)a5;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
+ (id)localizedStringForKey:(id)a3 table:(id)a4 comment:(id)a5;
+ (id)localizedStringForKey:(id)a3 tableSuffix:(id)a4 comment:(id)a5;
+ (id)logObject;
+ (unint64_t)argon_defaultNotificationAction;
- (BOOL)companionShouldDisplayDebugMenuForFace:(id)a3;
- (BOOL)isHardwareSpecific;
- (BOOL)useDynamicCollectionForDevice:(id)a3;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (NSNumber)legacyFaceStyle;
- (NSString)galleryDescriptionText;
- (NSString)galleryTitle;
- (NTKFaceBundle)init;
- (id)artistFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)faceFromData:(id)a3;
- (id)faceFromShareSheetSidecarDirectory:(id)a3;
- (id)galleryDefaultPigmentOptionsForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryFacesInDynamicCollectionForDevice:(id)a3;
- (id)heroFacesForDevice:(id)a3;
- (id)heroGloryBDefaultFacesForDevice:(id)a3;
- (id)heroGloryEDefaultFacesForDevice:(id)a3;
- (id)heroGloryFDefaultFacesForDevice:(id)a3;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroLegacyDefaultFacesForDevice:(id)a3;
- (id)heroPride2020DefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)prideFacesForDevice:(id)a3;
- (id)unityFacesForDevice:(id)a3;
- (id)viewControllerForCompanionDebugMenuWithFace:(id)a3;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)argon_generateNotificationContentWithCompletion:(id)a3;
- (void)notifyObserversGalleryFacesDidUpdate;
- (void)removeObserver:(id)a3;
@end

@implementation NTKFaceBundle

- (NSNumber)legacyFaceStyle
{
  return 0;
}

- (NTKFaceBundle)init
{
  v13.receiver = self;
  v13.super_class = (Class)NTKFaceBundle;
  v2 = [(NTKFaceBundle *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v3;

    if ([(id)objc_opt_class() supportsGalleryObserverNotifications])
    {
      v5 = NSString;
      v6 = [(id)objc_opt_class() identifier];
      v7 = [v5 stringWithFormat:@"com.apple.NanoTimeKit.FaceBundleObserverQueue.%@", v6];

      v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      id v9 = v7;
      dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], v8);
      observerQueue = v2->_observerQueue;
      v2->_observerQueue = (OS_dispatch_queue *)v10;
    }
  }
  return v2;
}

+ (BOOL)supportsGalleryObserverNotifications
{
  return 0;
}

+ (NSString)identifier
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

+ (NSString)analyticsIdentifier
{
  v2 = [(id)objc_opt_class() identifier];
  uint64_t v3 = +[NTKFace defaultAnalyticsIdentifierForBundleIdentifier:v2];

  return (NSString *)v3;
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)galleryFacesForDevice:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NTKFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    if ([v6 count])
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v18 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v14 = [(NTKFaceBundle *)self defaultFaceForDevice:v4];
            v15 = v14;
            if (v14)
            {
              [v14 selectOption:v13 forCustomEditMode:10 slot:0];
              [v7 addObject:v15];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      v16 = (void *)[v7 copy];
      v6 = v18;
    }
    else
    {
      v23 = v5;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)galleryDefaultPigmentOptionsForDevice:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NTKFaceBundle *)self defaultFaceForDevice:a3];
  if ([v4 supportsPigmentEditOption])
  {
    v5 = [(objc_class *)[(NTKFaceBundle *)self faceClass] pigmentFaceDomain];
    v6 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", -[NTKFaceBundle faceClass](self, "faceClass"));
    v7 = +[NTKPigmentEditOptionStore sharedInstance];
    id v8 = [v7 defaultGalleryColorsForDomain:v5 bundle:v6];

    if (![v8 count])
    {
      uint64_t v9 = +[NTKPigmentEditOptionStore sharedInstance];
      uint64_t v10 = [v9 pigmentSetForDomain:v5 bundle:v6];
      uint64_t v11 = [v10 pigmentsFromMostRecentAddableCollectionsForSlot:0];

      id v8 = (void *)v11;
    }
    if (![v8 count])
    {
      v12 = +[NTKPigmentEditOptionStore sharedInstance];
      uint64_t v13 = [v12 pigmentSetForDomain:v5 bundle:v6];
      v14 = [v13 collectionForSlot:0];
      v15 = [v14 defaultOption];

      if (v15)
      {
        v18[0] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

        id v8 = (void *)v16;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)galleryDescriptionText
{
  return 0;
}

- (id)heroFacesForDevice:(id)a3
{
  return 0;
}

- (id)prideFacesForDevice:(id)a3
{
  return 0;
}

- (id)unityFacesForDevice:(id)a3
{
  return 0;
}

- (id)artistFacesForDevice:(id)a3
{
  return 0;
}

- (BOOL)isHardwareSpecific
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() supportsGalleryObserverNotifications])
  {
    observerQueue = self->_observerQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__NTKFaceBundle_addObserver___block_invoke;
    v6[3] = &unk_1E62C09C0;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(observerQueue, v6);
  }
}

uint64_t __29__NTKFaceBundle_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() supportsGalleryObserverNotifications])
  {
    observerQueue = self->_observerQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__NTKFaceBundle_removeObserver___block_invoke;
    v6[3] = &unk_1E62C09C0;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(observerQueue, v6);
  }
}

uint64_t __32__NTKFaceBundle_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)notifyObserversGalleryFacesDidUpdate
{
  if ([(id)objc_opt_class() supportsGalleryObserverNotifications])
  {
    objc_initWeak(&location, self);
    observerQueue = self->_observerQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__NTKFaceBundle_Internal__notifyObserversGalleryFacesDidUpdate__block_invoke;
    v4[3] = &unk_1E62C0068;
    objc_copyWeak(&v5, &location);
    dispatch_async(observerQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __63__NTKFaceBundle_Internal__notifyObserversGalleryFacesDidUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _enumerateObserversWithBlock:&__block_literal_global_16];
    id WeakRetained = v2;
  }
}

uint64_t __63__NTKFaceBundle_Internal__notifyObserversGalleryFacesDidUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 galleryFacesDidUpdate];
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__NTKFaceBundle_Internal___enumerateObserversWithBlock___block_invoke;
  v7[3] = &unk_1E62C13F0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableSet *)observers enumerateObjectsUsingBlock:v7];
}

uint64_t __56__NTKFaceBundle_Internal___enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)argon_generateNotificationContentWithCompletion:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    v10[0] = @"description";
    v10[1] = @"faceBundleClass";
    v11[0] = @"Notification content not supported for face bundle";
    id v5 = a3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v11[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    uint64_t v9 = [v4 errorWithDomain:@"NTKFaceSupportDomain" code:100 userInfo:v8];
    (*((void (**)(id, void, void, void *))a3 + 2))(v5, 0, 0, v9);
  }
}

+ (unint64_t)argon_defaultNotificationAction
{
  return 0;
}

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  return (id)[a1 localizedStringForKey:a3 tableSuffix:0 comment:a4];
}

+ (id)localizedStringForKey:(id)a3 tableSuffix:(id)a4 comment:(id)a5
{
  return (id)[a1 _localizedStringForKey:a3 table:@"Localizable" suffix:a4 comment:a5];
}

+ (id)localizedStringForKey:(id)a3 table:(id)a4 comment:(id)a5
{
  return (id)[a1 _localizedStringForKey:a3 table:a4 suffix:0 comment:a5];
}

+ (id)_localizedStringForKey:(id)a3 table:(id)a4 suffix:(id)a5 comment:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v13 = [v10 stringByAppendingString:@"Companion"];
  if ([v11 length])
  {
    uint64_t v14 = [v13 stringByAppendingFormat:@"-%@", v11];

    uint64_t v13 = (void *)v14;
  }
  v15 = [v12 localizedStringForKey:v9 value:@"NTKFaceBundleNotFound" table:v13];
  if ([v15 isEqualToString:@"NTKFaceBundleNotFound"])
  {
    id v16 = v10;
    if ([v11 length])
    {
      uint64_t v17 = [v16 stringByAppendingFormat:@"-%@", v11];

      id v16 = (id)v17;
    }
    uint64_t v18 = [v12 localizedStringForKey:v9 value:&stru_1F1635E90 table:v16];

    v15 = (void *)v18;
  }

  return v15;
}

+ (id)imageWithName:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:a1];
  id v7 = [MEMORY[0x1E4FB1818] imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

+ (id)logObject
{
  uint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (!logObject__logConnections)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)logObject__logConnections;
    logObject__logConnections = v4;
  }
  id v6 = [a1 logCategoryName];
  id v7 = [(id)logObject__logConnections objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = v6;
    id v7 = os_log_create("NanoTimeKit", (const char *)[v8 UTF8String]);
    if (v8) {
      [(id)logObject__logConnections setObject:v7 forKey:v8];
    }
  }

  objc_sync_exit(v3);
  return v7;
}

- (id)heroPride2020DefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGloryFDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGloryEDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGloryBDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroLegacyDefaultFacesForDevice:(id)a3
{
  return 0;
}

+ (id)localizedMarkdownStringForKey:(id)a3 comment:(id)a4
{
  return (id)[a1 localizedMarkdownStringForKey:a3 tableSuffix:0 comment:a4];
}

+ (id)localizedMarkdownStringForKey:(id)a3 tableSuffix:(id)a4 comment:(id)a5
{
  return (id)[a1 _localizedMarkdownStringForKey:a3 table:@"Localizable" suffix:a4 comment:a5];
}

+ (id)localizedMarkdownStringForKey:(id)a3 table:(id)a4 comment:(id)a5
{
  return (id)[a1 _localizedMarkdownStringForKey:a3 table:a4 suffix:0 comment:a5];
}

+ (id)_localizedMarkdownStringForKey:(id)a3 table:(id)a4 suffix:(id)a5 comment:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v13 = [v10 stringByAppendingString:@"Companion"];
  if ([v11 length])
  {
    uint64_t v14 = [v13 stringByAppendingFormat:@"-%@", v11];

    uint64_t v13 = (void *)v14;
  }
  v15 = objc_msgSend(v12, "ntk_localizedMarkdownStringForKey:value:table:", v9, @"NTKFaceBundleNotFound", v13);
  if (![v15 length]
    || [v15 isEqualToString:@"NTKFaceBundleNotFound"])
  {
    id v16 = v10;
    if ([v11 length])
    {
      uint64_t v17 = [v16 stringByAppendingFormat:@"-%@", v11];

      id v16 = (id)v17;
    }
    uint64_t v18 = objc_msgSend(v12, "ntk_localizedMarkdownStringForKey:value:table:", v9, &stru_1F1635E90, v16);

    v15 = (void *)v18;
  }

  return v15;
}

- (id)faceFromShareSheetSidecarDirectory:(id)a3
{
  return 0;
}

- (BOOL)companionShouldDisplayDebugMenuForFace:(id)a3
{
  return 0;
}

- (id)viewControllerForCompanionDebugMenuWithFace:(id)a3
{
  return 0;
}

- (BOOL)useDynamicCollectionForDevice:(id)a3
{
  return 0;
}

- (id)galleryFacesInDynamicCollectionForDevice:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)faceFromData:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v25 = 0;
  id v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v25];

  id v7 = v25;
  id v8 = [v6 faceJSONRepresentation];
  if (v8)
  {
    id v24 = 0;
    id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v24];
    id v10 = v24;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      long long v20 = [v6 nrDeviceUUID];
      v12 = [MEMORY[0x1E4F19A30] deviceForNRDeviceUUID:v20];
      uint64_t v13 = [v6 resourceDirectory];
      uint64_t v14 = [(id)objc_opt_class() identifier];
      v15 = [(NTKFaceBundle *)self faceClass];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __46__NTKFaceBundle_FaceGeneration__faceFromData___block_invoke;
      v21[3] = &unk_1E62C8BA0;
      id v22 = v11;
      id v23 = v12;
      id v16 = v12;
      id v17 = v11;
      uint64_t v18 = [(objc_class *)v15 bundledFaceWithIdentifier:v14 forDevice:v16 initCustomization:v21];
      [v18 setResourceDirectory:v13];
    }
    else
    {
      NSLog(&cfstr_JsonObjectIsOf.isa, v10);
      uint64_t v18 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_JsonDataIsNilF.isa, v6);
    uint64_t v18 = 0;
  }

  return v18;
}

void __46__NTKFaceBundle_FaceGeneration__faceFromData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[NTKFaceConfiguration alloc] initWithJSONDictionary:*(void *)(a1 + 32) editModeMapping:v3 forDevice:*(void *)(a1 + 40)];
  [v3 _customizeWithJSONDescription:*(void *)(a1 + 32)];
  [v3 _applyConfiguration:v4 allowFailure:0 forMigration:0];
}

- (Class)faceClass
{
  return 0;
}

- (Class)faceViewClass
{
  return 0;
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = +[NTKFace defaultFaceOfStyle:12 forDevice:v3];

  return v4;
}

- (NSString)galleryTitle
{
  return (NSString *)&stru_1F1635E90;
}

@end