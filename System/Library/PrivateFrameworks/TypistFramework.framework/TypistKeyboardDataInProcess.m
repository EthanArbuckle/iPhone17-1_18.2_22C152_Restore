@interface TypistKeyboardDataInProcess
+ (BOOL)_activeInputModesContainsInputMode:(id)a3;
+ (BOOL)dismissKeyboard;
+ (BOOL)generatePopupKeySubtrees:(id)a3 key:(id)a4 plane:(id)a5 layout:(id)a6 keyplaneKeycaps:(id)a7;
+ (BOOL)hasMarkedText;
+ (BOOL)isCandidateCellVisible:(id)a3;
+ (BOOL)isExtendedCandidateViewMode;
+ (BOOL)keyHasAccentedVariants:(id)a3 plane:(id)a4 keyplaneKeycaps:(id)a5;
+ (BOOL)shouldShowDictationKey;
+ (BOOL)shouldShowGlobeKey;
+ (BOOL)switchToKeyboard:(id)a3;
+ (BOOL)switchToPlane:(id)a3;
+ (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4;
+ (CGPoint)floatingKeyboardDraggablePoint;
+ (CGPoint)getCandidateCenter:(id)a3;
+ (CGPoint)getCandidateCenterAtIndex:(int64_t)a3;
+ (CGPoint)getExtendedCandidateViewToggleButtonCenter;
+ (CGRect)findKeyBoundsInKeyboard:(id)a3;
+ (CGRect)getCandidateBarRect;
+ (__n128)getKeyboardScaleTransform;
+ (double)getKeyboardPPM;
+ (id)_variantsByAppendingDualStringKey:(id)a3 toVariants:(id)a4;
+ (id)addKeyboardGestureKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6;
+ (id)addKeyboardPopupKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6 keyplaneKeycaps:(id)a7;
+ (id)addKeyboards:(id)a3;
+ (id)appendingSecondaryStringToVariantsTop:(id)a3 secondaryString:(id)a4 withDirection:(id)a5;
+ (id)cleanUpSwitchTableBasedOnDefaultPlane:(id)a3 defaultPlaneName:(id)a4;
+ (id)determineDefaultPlane10Key:(id)a3 basePlaneName:(id)a4;
+ (id)determineDefaultPlane:(id)a3 basePlaneName:(id)a4;
+ (id)dismissOneTimeTIActions:(id)a3;
+ (id)generateKeyplaneSwitchTable:(id)a3;
+ (id)generateKeyplaneSwitchTableFor10Key:(id)a3;
+ (id)getAllCandidates;
+ (id)getKeyboardLayout:(id)a3;
+ (id)getKeyboardPlaneKeys:(id)a3 keys:(id)a4 inPlane:(id)a5;
+ (id)getKeyboardUISettings;
+ (id)getKeyplaneDescription:(id)a3;
+ (id)getRepresentedStringFromKey:(id)a3;
+ (id)getSentenceBoundaryStrings;
+ (id)getTIPreferences;
+ (id)getVisibleCandidateList:(id)a3;
+ (id)getVisibleKeyplaneName;
+ (id)markedText;
+ (id)removeKeyboards:(id)a3;
+ (id)setKeyboardUISettings:(id)a3;
+ (id)setKeyboards:(id)a3;
+ (id)setOneHandedKeyboardHandBias:(id)a3;
+ (id)setTIPreferences:(id)a3;
+ (id)updateCachedKeyplaneKeycaps:(id)a3;
+ (int)getShuangpinEnumeration:(id)a3;
+ (int)getWubiEnumeration:(id)a3;
+ (unint64_t)downActionFlagsForKey:(id)a3 plane:(id)a4 keyplaneKeycaps:(id)a5;
+ (void)showCandidateAtIndex:(int64_t)a3;
+ (void)showPopupVariantsForKey:(id)a3 key:(id)a4 plane:(id)a5 keyplaneKeycaps:(id)a6;
@end

@implementation TypistKeyboardDataInProcess

+ (id)getKeyboardLayout:(id)a3
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__6;
  v92[4] = __Block_byref_object_dispose__6;
  id v93 = [MEMORY[0x263F1C710] activeKeyboard];
  [MEMORY[0x263F1C738] activeInstance];
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__6;
  v35 = v90[4] = __Block_byref_object_dispose__6;
  id v91 = [v35 _layout];
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__6;
  v88 = __Block_byref_object_dispose__6;
  id v89 = 0;
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke;
  v83[3] = &unk_2655599F0;
  v83[4] = &v84;
  v83[5] = v92;
  +[TypistKeyboardUtilities runOnMainThread:v83];
  if ([(id)v85[5] containsString:@"_"])
  {
    v6 = [(id)v85[5] componentsSeparatedByString:@"_"];
    v7 = [v6 lastObject];
    uint64_t v8 = [v7 lowercaseString];
    v9 = (void *)v85[5];
    v85[5] = v8;
  }
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__6;
  v81 = __Block_byref_object_dispose__6;
  id v82 = 0;
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_2;
  v70[3] = &unk_265559B88;
  v73 = v90;
  v74 = &v77;
  id v38 = v4;
  id v71 = v38;
  v75 = &v84;
  id v76 = a1;
  id v10 = v5;
  id v72 = v10;
  +[TypistKeyboardUtilities runOnMainThread:v70];
  v34 = v10;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v11 = [(id)v78[5] allKeys];
  uint64_t v19 = [v11 countByEnumeratingWithState:&v66 objects:v94 count:16];
  if (v19)
  {
    uint64_t v37 = *(void *)v67;
    uint64_t v20 = *MEMORY[0x263F1D398];
    id obj = v11;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v67 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        TYLog(@"\n------------------------------------ PREPROCESSING Plane:%@", v12, v13, v14, v15, v16, v17, v18, v22);
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__6;
        v64 = __Block_byref_object_dispose__6;
        id v65 = 0;
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x3032000000;
        v57 = __Block_byref_object_copy__6;
        v58 = __Block_byref_object_dispose__6;
        id v59 = 0;
        uint64_t v48 = 0;
        v49 = &v48;
        uint64_t v50 = 0x3032000000;
        v51 = __Block_byref_object_copy__6;
        v52 = __Block_byref_object_dispose__6;
        id v53 = 0;
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_3;
        v40[3] = &unk_265559BB0;
        v42 = v92;
        v40[4] = v22;
        v43 = v90;
        v44 = &v60;
        v46 = &v48;
        id v47 = a1;
        v45 = &v54;
        id v23 = v38;
        id v41 = v23;
        +[TypistKeyboardUtilities runOnMainThread:v40];
        v24 = [a1 getKeyboardUISettings];
        v25 = [v24 objectForKeyedSubscript:v20];
        int v26 = [v25 BOOLValue];

        if (v26)
        {
          uint64_t v27 = [a1 addKeyboardGestureKeys:v23 keys:v61[5] inPlane:v22 addTo:v49[5]];
          v28 = (void *)v49[5];
          v49[5] = v27;
        }
        if ([v23 usePopupKeys])
        {
          uint64_t v29 = [v23 addKeyboardPopupKeys:v61[5] inPlane:v22 addTo:v49[5] keyplaneKeycaps:v55[5]];
          v30 = (void *)v49[5];
          v49[5] = v29;
        }
        [v39 setObject:v49[5] forKey:v22];

        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v54, 8);

        _Block_object_dispose(&v60, 8);
      }
      v11 = obj;
      uint64_t v19 = [obj countByEnumeratingWithState:&v66 objects:v94 count:16];
    }
    while (v19);
  }

  [v34 setObject:v39 forKey:@"keyPlanes"];
  v31 = v72;
  id v32 = v34;

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v92, 8);

  return v32;
}

uint64_t __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _getCurrentKeyplaneName];
  return MEMORY[0x270F9A758]();
}

void __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  uint64_t v38 = a1;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) performSelector:sel_keyboard];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v37 = v42 = 0u;
  v3 = [v37 subtrees];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v39 + 1) + 8 * i) name];
        if ([v8 containsString:@"_"])
        {
          v9 = [v8 componentsSeparatedByString:@"_"];
          id v10 = [v9 lastObject];
          uint64_t v11 = [v10 lowercaseString];

          uint64_t v8 = (void *)v11;
        }
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v5);
  }

  uint64_t v12 = [*(id *)(v38 + 32) generateKeyplaneSwitchTable:v2];
  uint64_t v13 = *(void *)(*(void *)(v38 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  int v15 = [*(id *)(v38 + 32) isTenKey];
  uint64_t v16 = *(void **)(v38 + 72);
  uint64_t v17 = *(void *)(*(void *)(*(void *)(v38 + 56) + 8) + 40);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(v38 + 64) + 8) + 40);
  if (v15) {
    [v16 determineDefaultPlane10Key:v17 basePlaneName:v18];
  }
  else {
  uint64_t v19 = [v16 determineDefaultPlane:v17 basePlaneName:v18];
  }
  [*(id *)(v38 + 40) setObject:v19 forKey:@"defaultPlaneName"];
  TYLog(@"#####  DEFAULT PLANE: %@", v20, v21, v22, v23, v24, v25, v26, (char)v19);
  uint64_t v27 = [*(id *)(v38 + 72) cleanUpSwitchTableBasedOnDefaultPlane:*(void *)(*(void *)(*(void *)(v38 + 56) + 8) + 40) defaultPlaneName:v19];
  uint64_t v28 = *(void *)(*(void *)(v38 + 56) + 8);
  uint64_t v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

  [*(id *)(v38 + 40) setObject:*(void *)(*(void *)(*(void *)(v38 + 56) + 8) + 40) forKey:@"planeSwitchTable"];
  TYLog(@"\nplaneSwitchTable = %@", v30, v31, v32, v33, v34, v35, v36, *(void *)(*(void *)(*(void *)(v38 + 56) + 8) + 40));
}

uint64_t __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) keyplaneNamed:*(void *)(a1 + 32)];
  [v2 _changeToKeyplane:v3];

  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) keyplaneNamed:*(void *)(a1 + 32)];
  uint64_t v5 = [v4 keys];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 88) updateCachedKeyplaneKeycaps:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [*(id *)(a1 + 88) getKeyboardPlaneKeys:*(void *)(a1 + 40) keys:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) inPlane:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

+ (id)getTIPreferences
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v4 = *MEMORY[0x263F7E7C0];
  uint64_t v5 = [v3 BOOLForPreferenceKey:*MEMORY[0x263F7E7C0]];

  uint64_t v6 = [NSNumber numberWithBool:v5];
  [v2 setObject:v6 forKey:v4];

  v7 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v8 = *MEMORY[0x263F7E7C8];
  uint64_t v9 = [v7 BOOLForPreferenceKey:*MEMORY[0x263F7E7C8]];

  id v10 = [NSNumber numberWithBool:v9];
  [v2 setObject:v10 forKey:v8];

  uint64_t v11 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v12 = *MEMORY[0x263F7E7E0];
  uint64_t v13 = [v11 BOOLForPreferenceKey:*MEMORY[0x263F7E7E0]];

  uint64_t v14 = [NSNumber numberWithBool:v13];
  [v2 setObject:v14 forKey:v12];

  int v15 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v16 = *MEMORY[0x263F7E828];
  uint64_t v17 = [v15 BOOLForPreferenceKey:*MEMORY[0x263F7E828]];

  uint64_t v18 = [NSNumber numberWithBool:v17];
  [v2 setObject:v18 forKey:v16];

  uint64_t v19 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v20 = *MEMORY[0x263F7E7D8];
  uint64_t v21 = [v19 BOOLForPreferenceKey:*MEMORY[0x263F7E7D8]];

  uint64_t v22 = [NSNumber numberWithBool:v21];
  [v2 setObject:v22 forKey:v20];

  uint64_t v23 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v24 = *MEMORY[0x263F7E830];
  uint64_t v25 = [v23 BOOLForPreferenceKey:*MEMORY[0x263F7E830]];

  uint64_t v26 = [NSNumber numberWithBool:v25];
  [v2 setObject:v26 forKey:v24];

  uint64_t v27 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v28 = *MEMORY[0x263F7E740];
  uint64_t v29 = [v27 BOOLForPreferenceKey:*MEMORY[0x263F7E740]];

  uint64_t v30 = [NSNumber numberWithBool:v29];
  [v2 setObject:v30 forKey:v28];

  uint64_t v31 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v32 = *MEMORY[0x263F7E868];
  uint64_t v33 = [v31 BOOLForPreferenceKey:*MEMORY[0x263F7E868]];

  uint64_t v34 = [NSNumber numberWithBool:v33];
  [v2 setObject:v34 forKey:v32];

  uint64_t v35 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v36 = *MEMORY[0x263F7E878];
  uint64_t v37 = [v35 BOOLForPreferenceKey:*MEMORY[0x263F7E878]];

  uint64_t v38 = [NSNumber numberWithBool:v37];
  [v2 setObject:v38 forKey:v36];

  long long v39 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v40 = *MEMORY[0x263F7E7B8];
  uint64_t v41 = [v39 BOOLForPreferenceKey:*MEMORY[0x263F7E7B8]];

  long long v42 = [NSNumber numberWithBool:v41];
  [v2 setObject:v42 forKey:v40];

  v43 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v44 = *MEMORY[0x263F7E940];
  uint64_t v45 = [v43 BOOLForPreferenceKey:*MEMORY[0x263F7E940]];

  v46 = [NSNumber numberWithBool:v45];
  [v2 setObject:v46 forKey:v44];

  id v47 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v48 = *MEMORY[0x263F7E870];
  uint64_t v49 = [v47 BOOLForPreferenceKey:*MEMORY[0x263F7E870]];

  uint64_t v50 = [NSNumber numberWithBool:v49];
  [v2 setObject:v50 forKey:v48];

  v51 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v52 = *MEMORY[0x263F7E748];
  id v53 = [v51 valueForPreferenceKey:*MEMORY[0x263F7E748]];
  BOOL v54 = v53 != 0;

  v55 = [NSNumber numberWithBool:v54];
  [v2 setObject:v55 forKey:v52];

  uint64_t v56 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v57 = *MEMORY[0x263F7E950];
  v58 = [v56 valueForPreferenceKey:*MEMORY[0x263F7E950]];
  uint64_t v59 = [v58 intValue];

  uint64_t v60 = [NSNumber numberWithUnsignedInt:v59];
  [v2 setObject:v60 forKey:v57];

  v61 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v62 = *MEMORY[0x263F7E860];
  v63 = [v61 valueForPreferenceKey:*MEMORY[0x263F7E860]];
  uint64_t v64 = [v63 intValue];

  id v65 = [NSNumber numberWithInt:v64];
  [v2 setObject:v65 forKey:v62];

  return v2;
}

+ (id)getKeyboardUISettings
{
  v3 = objc_opt_new();
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __52__TypistKeyboardDataInProcess_getKeyboardUISettings__block_invoke;
  v26[3] = &unk_265559710;
  v26[4] = &v27;
  +[TypistKeyboardUtilities runOnMainThread:v26];
  uint64_t v4 = [NSNumber numberWithBool:*((unsigned __int8 *)v28 + 24)];
  [v3 setObject:v4 forKey:@"floatingKeyboard"];

  uint64_t v5 = [MEMORY[0x263F1C750] _showSmallDisplayKeyplane];
  uint64_t v6 = [NSNumber numberWithBool:v5];
  [v3 setObject:v6 forKey:@"LowerCaseKeyboard"];

  v7 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v8 = [v7 preferencesActions];
  uint64_t v9 = *MEMORY[0x263F1D398];
  uint64_t v10 = [v8 BOOLForPreferenceKey:*MEMORY[0x263F1D398]];

  uint64_t v11 = [NSNumber numberWithBool:v10];
  [v3 setObject:v11 forKey:v9];

  uint64_t v12 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v13 = [v12 dictationIsEnabled];

  uint64_t v14 = [NSNumber numberWithBool:v13];
  [v3 setObject:v14 forKey:@"dictation"];

  int v15 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v16 = *MEMORY[0x263F7E7D0];
  uint64_t v17 = [v15 valueForPreferenceKey:*MEMORY[0x263F7E7D0]];
  uint64_t v18 = (void *)v17;
  uint64_t v19 = @"Unknown";
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  uint64_t v20 = v19;

  [v3 setObject:v20 forKey:v16];
  uint64_t v21 = [a1 shouldShowDictationKey];
  uint64_t v22 = [NSNumber numberWithBool:v21];
  [v3 setObject:v22 forKey:@"shouldShowDictationKey"];

  uint64_t v23 = [a1 shouldShowGlobeKey];
  uint64_t v24 = [NSNumber numberWithBool:v23];
  [v3 setObject:v24 forKey:@"shouldShowGlobeKey"];

  _Block_object_dispose(&v27, 8);
  return v3;
}

uint64_t __52__TypistKeyboardDataInProcess_getKeyboardUISettings__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F1C738] isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)getSentenceBoundaryStrings
{
  return &unk_270C6FC38;
}

+ (id)setTIPreferences:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSDictionary dictionary];
  uint64_t v6 = [a1 getTIPreferences];
  v7 = [v4 allKeys];
  uint64_t v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v9 = *MEMORY[0x263F7E7C0];
    if ([v8 containsObject:*MEMORY[0x263F7E7C0]])
    {
      uint64_t v10 = [v6 objectForKeyedSubscript:v9];
      char v11 = [v10 BOOLValue];
      uint64_t v12 = [v4 objectForKeyedSubscript:v9];
      [v12 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing AutoCapitalization Settings: Current=%d ChangeTo=%d", v13, v14, v15, v16, v17, v18, v11);

      uint64_t v19 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      uint64_t v20 = [v4 objectForKeyedSubscript:v9];
      [v19 setValue:v20 forKey:9];
    }
    uint64_t v21 = *MEMORY[0x263F7E7C8];
    if ([v8 containsObject:*MEMORY[0x263F7E7C8]])
    {
      uint64_t v22 = [v6 objectForKeyedSubscript:v21];
      char v23 = [v22 BOOLValue];
      uint64_t v24 = [v4 objectForKeyedSubscript:v21];
      [v24 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing AutoCorrection Settings: Current=%d ChangeTo=%d", v25, v26, v27, v28, v29, v30, v23);

      uint64_t v31 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      uint64_t v32 = [v4 objectForKeyedSubscript:v21];
      [v31 setValue:v32 forKey:8];
    }
    uint64_t v33 = *MEMORY[0x263F7E7E0];
    if ([v8 containsObject:*MEMORY[0x263F7E7E0]])
    {
      uint64_t v34 = [v6 objectForKeyedSubscript:v33];
      char v35 = [v34 BOOLValue];
      uint64_t v36 = [v4 objectForKeyedSubscript:v33];
      [v36 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing CheckSpelling Settings: Current=%d ChangeTo=%d", v37, v38, v39, v40, v41, v42, v35);

      v43 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      uint64_t v44 = [v4 objectForKeyedSubscript:v33];
      [v43 setValue:v44 forKey:10];
    }
    uint64_t v45 = *MEMORY[0x263F7E828];
    if ([v8 containsObject:*MEMORY[0x263F7E828]])
    {
      v46 = [v6 objectForKeyedSubscript:v45];
      char v47 = [v46 BOOLValue];
      uint64_t v48 = [v4 objectForKeyedSubscript:v45];
      [v48 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing PeriodShortcut Settings: Current=%d ChangeTo=%d", v49, v50, v51, v52, v53, v54, v47);

      v55 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      uint64_t v56 = [v4 objectForKeyedSubscript:v45];
      [v55 setValue:v56 forKey:11];
    }
    uint64_t v57 = *MEMORY[0x263F7E7D8];
    if ([v8 containsObject:*MEMORY[0x263F7E7D8]])
    {
      v58 = [v6 objectForKeyedSubscript:v57];
      char v59 = [v58 BOOLValue];
      uint64_t v60 = [v4 objectForKeyedSubscript:v57];
      [v60 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing CapsLock Settings: Current=%d ChangeTo=%d", v61, v62, v63, v64, v65, v66, v59);

      long long v67 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      long long v68 = [v4 objectForKeyedSubscript:v57];
      [v67 setValue:v68 forKey:12];
    }
    uint64_t v69 = *MEMORY[0x263F7E830];
    if ([v8 containsObject:*MEMORY[0x263F7E830]])
    {
      v70 = [v6 objectForKeyedSubscript:v69];
      char v71 = [v70 BOOLValue];
      id v72 = [v4 objectForKeyedSubscript:v69];
      [v72 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Predictive Settings: Current=%d ChangeTo=%d", v73, v74, v75, v76, v77, v78, v71);

      uint64_t v79 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v80 = [v4 objectForKeyedSubscript:v69];
      [v79 setValue:v80 forKey:36];
    }
    uint64_t v81 = *MEMORY[0x263F7E740];
    if ([v8 containsObject:*MEMORY[0x263F7E740]])
    {
      id v82 = [v6 objectForKeyedSubscript:v81];
      char v83 = [v82 BOOLValue];
      uint64_t v84 = [v4 objectForKeyedSubscript:v81];
      [v84 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Fuzzy Settings: Current=%d ChangeTo=%d", v85, v86, v87, v88, v89, v90, v83);

      id v91 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v92 = [v4 objectForKeyedSubscript:v81];
      [v91 setValue:v92 forPreferenceKey:v81];
    }
    uint64_t v93 = *MEMORY[0x263F7E868];
    if ([v8 containsObject:*MEMORY[0x263F7E868]])
    {
      v94 = [v6 objectForKeyedSubscript:v93];
      char v95 = [v94 BOOLValue];
      v96 = [v4 objectForKeyedSubscript:v93];
      [v96 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Smart Dashes Settings: Current=%d ChangeTo=%d", v97, v98, v99, v100, v101, v102, v95);

      v103 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v104 = [v4 objectForKeyedSubscript:v93];
      [v103 setValue:v104 forPreferenceKey:v93];
    }
    uint64_t v105 = *MEMORY[0x263F7E878];
    if ([v8 containsObject:*MEMORY[0x263F7E878]])
    {
      v106 = [v6 objectForKeyedSubscript:v105];
      char v107 = [v106 BOOLValue];
      v108 = [v4 objectForKeyedSubscript:v93];
      [v108 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Smart Quotes Settings: Current=%d ChangeTo=%d", v109, v110, v111, v112, v113, v114, v107);

      v115 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v116 = [v4 objectForKeyedSubscript:v105];
      [v115 setValue:v116 forPreferenceKey:v105];
    }
    uint64_t v117 = *MEMORY[0x263F7E7B8];
    if ([v8 containsObject:*MEMORY[0x263F7E7B8]])
    {
      v118 = [v6 objectForKeyedSubscript:v117];
      char v119 = [v118 BOOLValue];
      v120 = [v4 objectForKeyedSubscript:v117];
      [v120 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing KeyPaddle Settings: Current=%d ChangeTo=%d", v121, v122, v123, v124, v125, v126, v119);

      v127 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v128 = [v4 objectForKeyedSubscript:v117];
      [v127 setValue:v128 forKey:38];
    }
    uint64_t v129 = *MEMORY[0x263F7E940];
    if ([v8 containsObject:*MEMORY[0x263F7E940]])
    {
      v130 = [v6 objectForKeyedSubscript:v129];
      char v131 = [v130 BOOLValue];
      v132 = [v4 objectForKeyedSubscript:v129];
      [v132 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Typology Settings: Current=%d ChangeTo=%d", v133, v134, v135, v136, v137, v138, v131);

      v139 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v140 = [v4 objectForKeyedSubscript:v129];
      [v139 setValue:v140 forKey:53];
    }
    uint64_t v141 = *MEMORY[0x263F7E870];
    if ([v8 containsObject:*MEMORY[0x263F7E870]])
    {
      v142 = [v6 objectForKeyedSubscript:v141];
      char v143 = [v142 BOOLValue];
      v144 = [v4 objectForKeyedSubscript:v141];
      [v144 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Smart Full-width Settings: Current=%d ChangeTo=%d", v145, v146, v147, v148, v149, v150, v143);

      v151 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v152 = [v4 objectForKeyedSubscript:v141];
      [v151 setValue:v152 forPreferenceKey:v141];
    }
    uint64_t v153 = *MEMORY[0x263F7E748];
    if ([v8 containsObject:*MEMORY[0x263F7E748]])
    {
      v154 = [v6 objectForKeyedSubscript:v153];
      char v155 = [v154 BOOLValue];
      v156 = [v4 objectForKeyedSubscript:v153];
      [v156 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Use CapsLock as Roman Switch Settings: Current=%d ChangeTo=%d", v157, v158, v159, v160, v161, v162, v155);

      v163 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v164 = [v4 objectForKeyedSubscript:v153];
      [v163 setValue:v164 forPreferenceKey:v153];
    }
    uint64_t v165 = *MEMORY[0x263F7E950];
    if ([v8 containsObject:*MEMORY[0x263F7E950]])
    {
      v166 = [v4 objectForKeyedSubscript:v165];
      uint64_t v167 = [a1 getWubiEnumeration:v166];

      v168 = [v6 objectForKeyedSubscript:v165];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Wubi Standard Settings: Current=%i, ChangeTo=%i", v169, v170, v171, v172, v173, v174, (char)v168);

      v175 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v176 = [NSNumber numberWithInt:v167];
      [v175 setValue:v176 forPreferenceKey:v165];
    }
    uint64_t v177 = *MEMORY[0x263F7E860];
    if ([v8 containsObject:*MEMORY[0x263F7E860]])
    {
      v178 = [v4 objectForKeyedSubscript:v177];
      uint64_t v179 = [a1 getShuangpinEnumeration:v178];

      v180 = [v6 objectForKeyedSubscript:v177];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing Shaungpin Settings: Current=%i, ChangeTo=%i", v181, v182, v183, v184, v185, v186, (char)v180);

      v187 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      v188 = [NSNumber numberWithInt:v179];
      [v187 setValue:v188 forPreferenceKey:v177];
    }
  }
  v189 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v189 synchronizePreferences];

  +[TypistKeyboardUtilities waitFor:0.5];
  v190 = [a1 getTIPreferences];

  return v190;
}

+ (id)setKeyboardUISettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [a1 getKeyboardUISettings];
  v7 = [v4 allKeys];
  uint64_t v8 = v7;
  unint64_t v9 = 0x263F1C000;
  unint64_t v10 = 0x265559000;
  if (!v7 || ![v7 count]) {
    goto LABEL_22;
  }
  if ([v8 containsObject:@"floatingKeyboard"])
  {
    char v11 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1)
    {
      uint64_t v13 = [v4 objectForKeyedSubscript:@"floatingKeyboard"];
      char v14 = [v13 BOOLValue];

      uint64_t v15 = [v6 objectForKeyedSubscript:@"floatingKeyboard"];
      int v16 = [v15 BOOLValue];

      if (v16) {
        uint64_t v24 = @"Floating";
      }
      else {
        uint64_t v24 = @"Not floating";
      }
      TYLog(@"Changing Floating Settings: Current=%@ ChangeTo=%@", v17, v18, v19, v20, v21, v22, v23, (char)v24);
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __53__TypistKeyboardDataInProcess_setKeyboardUISettings___block_invoke;
      v81[3] = &__block_descriptor_34_e5_v8__0l;
      char v82 = v14;
      unint64_t v9 = 0x263F1C000;
      char v83 = v16;
      +[TypistKeyboardUtilities runOnMainThread:v81];
    }
  }
  uint64_t v25 = *MEMORY[0x263F1D398];
  if ([v8 containsObject:*MEMORY[0x263F1D398]])
  {
    uint64_t v26 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v26 userInterfaceIdiom] != 1)
    {
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v27 = [v6 objectForKeyedSubscript:@"floatingKeyboard"];
    char v28 = [v27 BOOLValue];

    unint64_t v9 = 0x263F1C000;
    if ((v28 & 1) == 0)
    {
      uint64_t v29 = [v6 objectForKeyedSubscript:v25];
      char v30 = [v29 BOOLValue];
      uint64_t v31 = [v4 objectForKeyedSubscript:v25];
      [v31 BOOLValue];
      TYLogl(OS_LOG_TYPE_INFO, @"Changing GestureKey Settings: Current=%d ChangeTo=%d", v32, v33, v34, v35, v36, v37, v30);

      uint64_t v26 = [MEMORY[0x263F1C758] sharedPreferencesController];
      uint64_t v38 = [v26 preferencesActions];
      uint64_t v39 = [v4 objectForKeyedSubscript:v25];
      [v38 setValue:v39 forPreferenceKey:v25];

      unint64_t v9 = 0x263F1C000;
      goto LABEL_13;
    }
  }
LABEL_14:
  if ([v8 containsObject:@"LowerCaseKeyboard"])
  {
    uint64_t v40 = [v6 objectForKeyedSubscript:@"LowerCaseKeyboard"];
    char v41 = [v40 BOOLValue];
    uint64_t v42 = [v4 objectForKeyedSubscript:@"LowerCaseKeyboard"];
    [v42 BOOLValue];
    char v43 = v41;
    unint64_t v9 = 0x263F1C000;
    TYLogl(OS_LOG_TYPE_INFO, @"Changing SmallDisplay Settings: Current=%d ChangeTo=%d", v44, v45, v46, v47, v48, v49, v43);

    uint64_t v50 = [v4 objectForKeyedSubscript:@"LowerCaseKeyboard"];
    uint64_t v51 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
    if (!v50) {
      uint64_t v51 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
    }
    CFPreferencesSetAppValue(@"LowerCaseKeyboard", *v51, @"com.apple.Accessibility");
  }
  if ([v8 containsObject:@"dictation"])
  {
    uint64_t v52 = [v6 objectForKeyedSubscript:@"dictation"];
    char v53 = [v52 BOOLValue];
    uint64_t v54 = [v4 objectForKeyedSubscript:@"dictation"];
    [v54 BOOLValue];
    char v55 = v53;
    unint64_t v9 = 0x263F1C000;
    TYLogl(OS_LOG_TYPE_INFO, @"Changing Dictation Settings: Current=%d ChangeTo=%d", v56, v57, v58, v59, v60, v61, v55);

    uint64_t v62 = [MEMORY[0x263F285A0] sharedPreferences];
    [v62 setSuppressDictationOptIn:1];

    uint64_t v63 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v64 = [v4 objectForKeyedSubscript:@"dictation"];
    objc_msgSend(v63, "setDictationIsEnabled:", objc_msgSend(v64, "BOOLValue"));
  }
  uint64_t v65 = *MEMORY[0x263F7E7D0];
  unint64_t v10 = 0x265559000uLL;
  if ([v8 containsObject:*MEMORY[0x263F7E7D0]])
  {
    uint64_t v66 = [v6 objectForKeyedSubscript:v65];
    v80 = [v4 objectForKeyedSubscript:v65];
    TYLogl(OS_LOG_TYPE_INFO, @"Changing Dictation Settings: Current=%@ ChangeTo=%@", v67, v68, v69, v70, v71, v72, (char)v66);

    unint64_t v9 = 0x263F1C000uLL;
    uint64_t v73 = [v4 objectForKeyedSubscript:v65];
    id v74 = (id)[a1 setOneHandedKeyboardHandBias:v73];
  }
LABEL_22:
  uint64_t v75 = [*(id *)(v9 + 1880) sharedPreferencesController];
  uint64_t v76 = [v75 preferencesActions];
  [v76 synchronizePreferences];

  uint64_t v77 = [MEMORY[0x263F285A0] sharedPreferences];
  [v77 synchronize];

  [*(id *)(v10 + 1000) waitFor:0.5];
  uint64_t v78 = [a1 getKeyboardUISettings];

  return v78;
}

void __53__TypistKeyboardDataInProcess_setKeyboardUISettings___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F1C738] supportsFloating]
    && *(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a1 + 33))
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v2 = [v6 localizedStringForKey:@"Dock and Merge" value:@"Dock and Merge" table:@"Localizable"];
    v3 = [v6 localizedStringForKey:@"Floating" value:@"Floating" table:@"Localizable"];
    id v4 = (void *)[NSClassFromString(&cfstr_Uikeyboardspli.isa) performSelector:sel_sharedInstance];
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v2;
    }
    [v4 performSelector:sel_actionForItem_ withObject:v5];
  }
}

+ (id)setKeyboards:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectAtIndexedSubscript:0];
  TYLog(@"Replacing keyboards with: %@", v5, v6, v7, v8, v9, v10, v11, (char)v4);

  uint64_t v12 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v13 = [v12 valueForKey:0];
  TYLog(@"Current Keyboards are\n%@", v14, v15, v16, v17, v18, v19, v20, (char)v13);

  uint64_t v21 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v21 setValue:v3 forKey:0];

  uint64_t v22 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v22 setValue:MEMORY[0x263EFFA88] forKey:1];

  uint64_t v23 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v23 synchronizePreferences];

  uint64_t v24 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v25 = [v24 valueForKey:0];

  TYLog(@"New Keyboard is\n%@", v26, v27, v28, v29, v30, v31, v32, (char)v25);
  return v25;
}

+ (id)addKeyboards:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v5 = [v4 valueForKey:0];
  uint64_t v6 = (void *)[v5 mutableCopy];

  TYLog(@"Appending keyboards: %@\n to current list: %@", v7, v8, v9, v10, v11, v12, v13, (char)v3);
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        char v27 = [v6 containsObject:v19];
        uint64_t v28 = @"Keyboard [%@] already exists. Skipping...";
        if ((v27 & 1) == 0)
        {
          [v6 addObject:v19];
          uint64_t v28 = @"Added [%@] to list of keyboard IDs.";
        }
        TYLog(v28, v20, v21, v22, v23, v24, v25, v26, v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v16);
  }

  uint64_t v29 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v29 setValue:v6 forKey:0];

  uint64_t v30 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v30 setValue:MEMORY[0x263EFFA88] forKey:1];

  uint64_t v31 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v31 synchronizePreferences];

  uint64_t v32 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v33 = [v32 valueForKey:0];

  TYLog(@"New Keyboards are:\n%@", v34, v35, v36, v37, v38, v39, v40, (char)v33);
  return v33;
}

+ (id)removeKeyboards:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  TYLog(@"Removing keyboard: %@", v4, v5, v6, v7, v8, v9, v10, (char)v3);
  uint64_t v11 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v12 = [v11 valueForKey:0];
  uint64_t v13 = (void *)[v12 mutableCopy];

  TYLog(@"Current Keyboards are\n%@", v14, v15, v16, v17, v18, v19, v20, (char)v13);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v21 = v3;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        int v34 = [v13 containsObject:v26];
        uint64_t v35 = @"Unable to remove [%@] since the ID does not match any keyboard in the current set";
        if (v34)
        {
          if ([v13 count] == 1)
          {
            TYLog(@"[%@] cannot be removed, becuase it's the only keyboard enabled. Aborting...", v36, v37, v38, v39, v40, v41, v42, v26);
            goto LABEL_13;
          }
          [v13 removeObject:v26];
          uint64_t v35 = @"Removed [%@] from the list of keyboards.";
        }
        TYLog(v35, v27, v28, v29, v30, v31, v32, v33, v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  long long v43 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v43 setValue:v13 forKey:0];

  long long v44 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v44 synchronizePreferences];

  long long v45 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v46 = [v45 valueForKey:0];

  TYLog(@"New Keyboards are\n%@", v47, v48, v49, v50, v51, v52, v53, (char)v46);
  return v46;
}

+ (id)dismissOneTimeTIActions:(id)a3
{
  return 0;
}

+ (BOOL)switchToKeyboard:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke;
  v16[3] = &unk_265559650;
  id v4 = v3;
  id v17 = v4;
  +[TypistKeyboardUtilities runOnMainThread:v16];
  double v5 = 10.0;
  while (1)
  {
    +[TypistKeyboardUtilities waitFor:0.2];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke_2;
    v15[3] = &unk_265559710;
    v15[4] = &v18;
    +[TypistKeyboardUtilities runOnMainThread:v15];
    int v13 = [(id)v19[5] isEqualToString:v4];
    if (v13) {
      break;
    }
    double v5 = v5 + -0.2;
    if (v5 <= 0.0)
    {
      TYLogl(OS_LOG_TYPE_ERROR, @"Unable to switch to keyboard [%@] after %ld", v7, v8, v9, v10, v11, v12, (char)v4);
      goto LABEL_6;
    }
  }
  TYLog(@"Switched keyboard to %@", v6, v7, v8, v9, v10, v11, v12, (char)v4);
LABEL_6:

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1C740] keyboardInputModeWithIdentifier:*(void *)(a1 + 32)];
  v1 = [MEMORY[0x263F1C738] sharedInstance];
  [v1 setKeyboardInputMode:v2 userInitiated:1];
}

void __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x263F1C738] sharedInstance];
  uint64_t v2 = [v5 _getLocalizedInputMode];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)dismissKeyboard
{
  return 1;
}

void __46__TypistKeyboardDataInProcess_dismissKeyboard__block_invoke()
{
  id v0 = [MEMORY[0x263F1C738] activeInstance];
  [v0 dismissKeyboard];
}

+ (BOOL)switchToPlane:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F1C710] activeKeyboard];
  id v5 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v6 = [v5 _layout];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__TypistKeyboardDataInProcess_switchToPlane___block_invoke;
  v11[3] = &unk_265559BF8;
  id v12 = v4;
  id v13 = v6;
  id v14 = v3;
  id v7 = v3;
  id v8 = v6;
  id v9 = v4;
  +[TypistKeyboardUtilities runOnMainThread:v11];

  return 1;
}

void __45__TypistKeyboardDataInProcess_switchToPlane___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) keyplaneNamed:*(void *)(a1 + 48)];
  [v1 _changeToKeyplane:v2];
}

+ (id)getVisibleKeyplaneName
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__6;
  id v9 = __Block_byref_object_dispose__6;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__TypistKeyboardDataInProcess_getVisibleKeyplaneName__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__TypistKeyboardDataInProcess_getVisibleKeyplaneName__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263F1C738] activeInstance];
  id v2 = [v6 _getCurrentKeyplaneName];
  uint64_t v3 = [v2 lowercaseString];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)getKeyplaneDescription:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  id v21 = __Block_byref_object_dispose__6;
  id v22 = (id)objc_opt_new();
  uint64_t v4 = [MEMORY[0x263F1C738] activeInstance];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__6;
  v15[4] = __Block_byref_object_dispose__6;
  id v16 = [v4 _layout];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__6;
  v13[4] = __Block_byref_object_dispose__6;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__TypistKeyboardDataInProcess_getKeyplaneDescription___block_invoke;
  v8[3] = &unk_265559C20;
  id v10 = v13;
  uint64_t v11 = v15;
  id v5 = v3;
  id v9 = v5;
  id v12 = &v17;
  +[TypistKeyboardUtilities runOnMainThread:v8];
  id v6 = (id)v18[5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

uint64_t __54__TypistKeyboardDataInProcess_getKeyplaneDescription___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) keyplaneNamed:a1[4]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(a1[5] + 8) + 40) name];
  [*(id *)(*(void *)(a1[7] + 8) + 40) setName:v5];

  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "setIsLetters:", objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "isLetters"));
  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "setIsAlphabeticPlane:", objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "isAlphabeticPlane"));
  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "setIsShiftKeyplane:", objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "isShiftKeyplane"));
  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "setUsesAutoShift:", objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "usesAutoShift"));
  uint64_t v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) ignoresShiftState];
  uint64_t v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
  return [v7 setIgnoresShiftState:v6];
}

+ (id)getAllCandidates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__TypistKeyboardDataInProcess_getAllCandidates__block_invoke;
  v5[3] = &unk_265559710;
  v5[4] = &v6;
  +[TypistKeyboardUtilities runOnMainThread:v5];
  uint64_t v2 = (void *)v7[5];
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__TypistKeyboardDataInProcess_getAllCandidates__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v2 = [v5 _getAutocorrectionList];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)getVisibleCandidateList:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"typistCandidateBarTypeMecabra"])
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__6;
    id v13 = __Block_byref_object_dispose__6;
    id v14 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__TypistKeyboardDataInProcess_getVisibleCandidateList___block_invoke;
    v8[3] = &unk_265559710;
    void v8[4] = &v9;
    +[TypistKeyboardUtilities runOnMainThread:v8];
    id v5 = (void *)v10[5];
    if (!v5) {
      id v5 = (void *)MEMORY[0x263EFFA68];
    }
    id v6 = v5;
    _Block_object_dispose(&v9, 8);
  }
  else if ([v4 isEqual:@"typistCandidateBarTypeFavonious"])
  {
    id v6 = [a1 getAllCandidates];
  }
  else
  {
    id v6 = (id)MEMORY[0x263EFFA68];
  }

  return v6;
}

void __55__TypistKeyboardDataInProcess_getVisibleCandidateList___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[TypistKeyboardUtilities searchForViewInKeyboardWindow:@"TUICandidateView"];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 visibleCandidates];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = v6;
  }
}

+ (CGPoint)getCandidateCenter:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x3010000000;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = &unk_26042309E;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__TypistKeyboardDataInProcess_getCandidateCenter___block_invoke;
  v10[3] = &unk_265559C48;
  id v5 = v4;
  id v12 = &v14;
  id v13 = a1;
  id v11 = v5;
  +[TypistKeyboardUtilities runOnMainThread:v10];
  double v6 = v15[4];
  double v7 = v15[5];

  _Block_object_dispose(&v14, 8);
  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

void __50__TypistKeyboardDataInProcess_getCandidateCenter___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  double v3 = *MEMORY[0x263F001A0];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        NSClassFromString(&cfstr_Uiremotekeyboa.isa);
        if (objc_opt_isKindOfClass())
        {
          [v9 allSubViews];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v49;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v49 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                NSClassFromString(&cfstr_Tuicandidatear.isa);
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  NSClassFromString(&cfstr_Uikeyboardcand.isa);
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                }
                uint64_t v16 = [v15 superview];
                [v15 frame];
                objc_msgSend(v16, "convertRect:toView:", 0);
                double v3 = v17;

                goto LABEL_21;
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_22:
  long long v43 = v4;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    while (2)
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        NSClassFromString(&cfstr_Tuicandidatece.isa);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = [v23 performSelector:sel_textLabel];
          uint64_t v25 = [v24 text];
          if ([v25 isEqualToString:*(void *)(a1 + 32)])
          {
            char v26 = [*(id *)(a1 + 48) isCandidateCellVisible:v23];

            if (v26)
            {
              uint64_t v27 = +[TypistKeyboardUtilities getRootViewControllerViaScene];
              uint64_t v28 = [v24 superview];
              [v24 frame];
              double v30 = v29;
              double v32 = v31;
              double v34 = v33;
              double v36 = v35;
              uint64_t v37 = [v27 view];
              objc_msgSend(v28, "convertRect:toView:", v37, v30, v32, v34, v36);

              UIRectGetCenter();
              uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
              *(void *)(v40 + 32) = v38;
              *(void *)(v40 + 40) = v39;
              uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 8);
              double v42 = *(double *)(v41 + 32);
              if (v42 >= v3 + -2.0) {
                double v42 = v3 + -2.0;
              }
              *(double *)(v41 + 32) = v42;

              goto LABEL_39;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_39:
}

+ (CGPoint)getCandidateCenterAtIndex:(int64_t)a3
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = &unk_26042309E;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__TypistKeyboardDataInProcess_getCandidateCenterAtIndex___block_invoke;
  v7[3] = &unk_265559C70;
  v7[4] = &v8;
  v7[5] = a3;
  v7[6] = a1;
  +[TypistKeyboardUtilities runOnMainThread:v7];
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

void __57__TypistKeyboardDataInProcess_getCandidateCenterAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v26 = *(void *)v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        double v4 = *(void **)(*((void *)&v31 + 1) + 8 * v3);
        NSClassFromString(&cfstr_Uiremotekeyboa.isa);
        if (objc_opt_isKindOfClass())
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          double v5 = [v4 allSubViews];
          uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v28;
            do
            {
              uint64_t v8 = 0;
              do
              {
                if (*(void *)v28 != v7) {
                  objc_enumerationMutation(v5);
                }
                double v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
                NSClassFromString(&cfstr_Uimorphinglabe.isa);
                if (objc_opt_isKindOfClass())
                {
                  if (*(void *)(a1 + 40) == v2)
                  {
                    uint64_t v10 = +[TypistKeyboardUtilities getRootViewControllerViaScene];
                    uint64_t v11 = [v9 superview];
                    [v9 frame];
                    double v13 = v12;
                    double v15 = v14;
                    double v17 = v16;
                    double v19 = v18;
                    uint64_t v20 = [v10 view];
                    objc_msgSend(v11, "convertRect:toView:", v20, v13, v15, v17, v19);
                    UIRectGetCenter();
                    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
                    *(void *)(v21 + 32) = v22;
                    *(void *)(v21 + 40) = v23;

                    goto LABEL_18;
                  }
                  ++v2;
                }
                ++v8;
              }
              while (v6 != v8);
              uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v6);
          }
LABEL_18:
        }
        ++v3;
      }
      while (v3 != v1);
      uint64_t v1 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v1);
  }
}

+ (CGRect)getCandidateBarRect
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  double v14 = &unk_26042309E;
  long long v15 = 0u;
  long long v16 = 0u;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__TypistKeyboardDataInProcess_getCandidateBarRect__block_invoke;
  v10[3] = &unk_265559710;
  void v10[4] = &v11;
  +[TypistKeyboardUtilities runOnMainThread:v10];
  double v2 = v12[4];
  double v3 = v12[5];
  double v4 = v12[6];
  double v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

void __50__TypistKeyboardDataInProcess_getCandidateBarRect__block_invoke(uint64_t a1)
{
  double v2 = +[TypistKeyboardUtilities searchForViewInKeyboardWindow:@"TUICandidateView"];
  if (v2)
  {
    id v11 = v2;
    [v2 frame];
    uint64_t v4 = v3;
    [v11 frame];
    uint64_t v6 = v5;
    [v11 frame];
    uint64_t v8 = v7;
    [v11 frame];
    double v2 = v11;
    double v9 = *(void **)(*(void *)(a1 + 32) + 8);
    v9[4] = v4;
    v9[5] = v6;
    v9[6] = v8;
    v9[7] = v10;
  }
}

+ (__n128)getKeyboardScaleTransform
{
  return *(__n128 *)MEMORY[0x263EF89A8];
}

+ (double)getKeyboardPPM
{
  return 0.0;
}

+ (BOOL)isExtendedCandidateViewMode
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__TypistKeyboardDataInProcess_isExtendedCandidateViewMode__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __58__TypistKeyboardDataInProcess_isExtendedCandidateViewMode__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F1C738] activeInstance];
  char v2 = [v3 candidateList];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isExtendedList];
}

+ (CGPoint)getExtendedCandidateViewToggleButtonCenter
{
  uint64_t v7 = 0;
  char v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v10 = &unk_26042309E;
  long long v11 = *MEMORY[0x263F00148];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__TypistKeyboardDataInProcess_getExtendedCandidateViewToggleButtonCenter__block_invoke;
  v6[3] = &unk_265559710;
  v6[4] = &v7;
  +[TypistKeyboardUtilities runOnMainThread:v6];
  double v2 = v8[4];
  double v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

void __73__TypistKeyboardDataInProcess_getExtendedCandidateViewToggleButtonCenter__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    uint64_t v18 = *(void *)v25;
    uint64_t v19 = a1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "allSubViews", v18);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              NSClassFromString(&cfstr_Tuicandidatear.isa);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                NSClassFromString(&cfstr_Uikeyboardcand.isa);
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
              double v14 = [v13 superview];
              [v13 frame];
              objc_msgSend(v14, "convertRect:toView:", 0);
              UIRectGetCenter();
              uint64_t v15 = *(void *)(*(void *)(v19 + 32) + 8);
              *(void *)(v15 + 32) = v16;
              *(void *)(v15 + 40) = v17;

              goto LABEL_19;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            uint64_t v5 = v18;
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }
LABEL_19:
}

+ (BOOL)hasMarkedText
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__TypistKeyboardDataInProcess_hasMarkedText__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __44__TypistKeyboardDataInProcess_hasMarkedText__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1C738] activeInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 hasMarkedText];
}

+ (id)markedText
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__TypistKeyboardDataInProcess_markedText__block_invoke;
  v5[3] = &unk_265559710;
  v5[4] = &v6;
  +[TypistKeyboardUtilities runOnMainThread:v5];
  id v2 = (__CFString *)v7[5];
  if (!v2) {
    id v2 = &stru_270C5A038;
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__TypistKeyboardDataInProcess_markedText__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v2 = [v5 markedText];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)showCandidateAtIndex:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__TypistKeyboardDataInProcess_showCandidateAtIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  +[TypistKeyboardUtilities runOnMainThread:v3];
}

void __52__TypistKeyboardDataInProcess_showCandidateAtIndex___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v2 = [v3 candidateList];
  [v2 showCandidateAtIndex:*(void *)(a1 + 32)];
}

+ (CGRect)findKeyBoundsInKeyboard:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  long long v21 = (double *)&v20;
  uint64_t v22 = 0x4010000000;
  long long v23 = &unk_26042309E;
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v24 = *MEMORY[0x263F001A0];
  long long v25 = v4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6;
  v18[4] = __Block_byref_object_dispose__6;
  id v19 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__TypistKeyboardDataInProcess_findKeyBoundsInKeyboard___block_invoke;
  v14[3] = &unk_265559C98;
  uint64_t v16 = v18;
  id v5 = v3;
  id v15 = v5;
  uint64_t v17 = &v20;
  +[TypistKeyboardUtilities runOnMainThread:v14];
  double v6 = v21[4];
  double v7 = v21[5];
  double v8 = v21[6];
  double v9 = v21[7];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

void __55__TypistKeyboardDataInProcess_findKeyBoundsInKeyboard___block_invoke(void *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v3 = [v2 _layout];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  double v6 = [*(id *)(*(void *)(a1[5] + 8) + 40) performSelector:sel_keyboard];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v7 = objc_msgSend(v6, "subtrees", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        double v13 = [v12 firstCachedKeyWithName:a1[4]];

        if (v13)
        {
          double v14 = [v12 firstCachedKeyWithName:a1[4]];
          [v14 frame];
          id v15 = *(void **)(a1[6] + 8);
          v15[4] = v16;
          void v15[5] = v17;
          v15[6] = v18;
          v15[7] = v19;

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "convertRect:toView:", 0, *(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(*(void *)(a1[6] + 8) + 40), *(double *)(*(void *)(a1[6] + 8) + 48), *(double *)(*(void *)(a1[6] + 8) + 56));
  uint64_t v20 = *(void **)(a1[6] + 8);
  v20[4] = v21;
  v20[5] = v22;
  v20[6] = v23;
  v20[7] = v24;
}

+ (id)generateKeyplaneSwitchTable:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v66 = (id)objc_opt_new();
  uint64_t v4 = objc_opt_new();
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v3;
  uint64_t v12 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v80 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        TYLog(@"########  PLANE NAME: %@", v5, v6, v7, v8, v9, v10, v11, (char)v15);
        if ([v15 hasSuffix:@"-split"])
        {
          TYLog(@"                      ===> IGNORED", v16, v17, v18, v19, v20, v21, v22, v64);
          continue;
        }
        uint64_t v23 = objc_opt_new();
        uint64_t v73 = 0;
        id v74 = &v73;
        uint64_t v75 = 0x3032000000;
        uint64_t v76 = __Block_byref_object_copy__6;
        uint64_t v77 = __Block_byref_object_dispose__6;
        id v78 = 0;
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __59__TypistKeyboardDataInProcess_generateKeyplaneSwitchTable___block_invoke;
        v72[3] = &unk_265559CC0;
        v72[4] = v15;
        v72[5] = &v73;
        +[TypistKeyboardUtilities runOnMainThread:v72];
        char v24 = [(id)v74[5] isAlphabeticPlane];
        [(id)v74[5] isShiftKeyplane];
        [(id)v74[5] isShiftKeyPlaneChooser];
        [(id)v74[5] isLetters];
        TYLog(@"          { isAlphabet:%d, isShift:%d, isShiftChooser:%d, isLetters:%d }", v25, v26, v27, v28, v29, v30, v31, v24);
        long long v32 = [(id)v74[5] stringForProperty:@"shift-alternate"];
        long long v33 = [a1 getKeyboardUISettings];
        long long v34 = [v33 objectForKeyedSubscript:@"LowerCaseKeyboard"];
        if (([v34 BOOLValue] & 1) == 0)
        {

          goto LABEL_12;
        }
        double v35 = [(id)v74[5] stringForProperty:@"shift-alternate-small-display"];
        BOOL v36 = v35 == 0;

        if (!v36)
        {
          [(id)v74[5] stringForProperty:@"shift-alternate-small-display"];
          long long v32 = v33 = v32;
LABEL_12:
        }
        if ([v32 length] && (objc_msgSend(v32, "isEqualToString:", v15) & 1) == 0)
        {
          [v23 setObject:@"⇧" forKey:v32];
          [v4 addObject:v32];
          TYLog(@"      --> Shift --> %@", v37, v38, v39, v40, v41, v42, v43, (char)v32);
        }
        long long v44 = [(id)v74[5] stringForProperty:@"more-alternate"];

        long long v45 = [a1 getKeyboardUISettings];
        long long v46 = [v45 objectForKeyedSubscript:@"LowerCaseKeyboard"];
        if (([v46 BOOLValue] & 1) == 0)
        {

          goto LABEL_20;
        }
        long long v47 = [(id)v74[5] stringForProperty:@"more-alternate-small-display"];
        BOOL v48 = v47 == 0;

        if (!v48)
        {
          [(id)v74[5] stringForProperty:@"more-alternate-small-display"];
          long long v44 = v45 = v44;
LABEL_20:
        }
        if ([v44 length])
        {
          [v23 setObject:@"🔤" forKey:v44];
          [v4 addObject:v44];
          TYLog(@"      --> More  --> %@", v49, v50, v51, v52, v53, v54, v55, (char)v44);
        }
        if ([v23 count])
        {
          if (![(id)v74[5] isLetters]
            || (int v56 = [(id)v74[5] isShiftKeyplane], v57 = @"YES", v56))
          {
            long long v57 = @"NO";
          }
          [v23 setObject:v57 forKey:@"maybeDefaultPlane"];
          [v66 setObject:v23 forKey:v15];
        }
        _Block_object_dispose(&v73, 8);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
    }
    while (v12);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v58 = [v66 allKeys];
  uint64_t v59 = [v58 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v69 != v60) {
          objc_enumerationMutation(v58);
        }
        uint64_t v62 = *(void *)(*((void *)&v68 + 1) + 8 * j);
        if (([v4 containsObject:v62] & 1) == 0) {
          [v66 removeObjectForKey:v62];
        }
      }
      uint64_t v59 = [v58 countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v59);
  }

  return v66;
}

void __59__TypistKeyboardDataInProcess_generateKeyplaneSwitchTable___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v2 = [v6 _layout];
  uint64_t v3 = [v2 keyplaneNamed:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)generateKeyplaneSwitchTableFor10Key:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v52 = (id)objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v4)
  {
    uint64_t v12 = v4;
    uint64_t v13 = *(void *)v63;
    uint64_t v51 = *(void *)v63;
    do
    {
      uint64_t v14 = 0;
      uint64_t v53 = v12;
      do
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v62 + 1) + 8 * v14);
        TYLog(@"########  PLANE NAME: %@", v5, v6, v7, v8, v9, v10, v11, (char)v15);
        if ([v15 hasSuffix:@"-split"])
        {
          TYLog(@"                      ===> IGNORED", v16, v17, v18, v19, v20, v21, v22, v50);
        }
        else
        {
          uint64_t v57 = v14;
          uint64_t v23 = objc_opt_new();
          char v24 = [MEMORY[0x263F1C738] activeInstance];
          uint64_t v25 = [v24 _layout];
          uint64_t v26 = [v25 keyplaneNamed:v15];

          uint64_t v27 = [v26 stringForProperty:@"shift-alternate"];
          if ([v27 length])
          {
            [v23 setObject:@"⇧" forKey:v27];
            TYLog(@"      --> Shift --> %@", v28, v29, v30, v31, v32, v33, v34, (char)v27);
          }
          uint64_t v55 = v27;
          int v56 = v26;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          double v35 = [v26 keys];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v37; ++i)
              {
                if (*(void *)v59 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = [*(id *)(*((void *)&v58 + 1) + 8 * i) representedString];
                uint64_t v41 = [v40 lowercaseString];

                if ([v41 hasSuffix:@"-plane"]
                  && ([v41 isEqualToString:v15] & 1) == 0)
                {
                  [v23 setObject:v41 forKey:v41];
                  TYLog(@"      --> Switch --> %@", v42, v43, v44, v45, v46, v47, v48, (char)v41);
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
            }
            while (v37);
          }

          [v52 setObject:v23 forKey:v15];
          uint64_t v12 = v53;
          uint64_t v13 = v51;
          uint64_t v14 = v57;
        }
        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v12);
  }

  return v52;
}

+ (id)determineDefaultPlane:(id)a3 basePlaneName:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v42 = a4;
  uint64_t v47 = [MEMORY[0x263EFF9C0] set];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = [v5 allKeys];
  id v48 = v5;
  uint64_t v45 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v60;
    uint64_t v6 = @"🔤";
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v9 = [v5 objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 allKeys];

        id v50 = v10;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v46 = i;
          id v13 = 0;
          uint64_t v14 = *(void *)v56;
          do
          {
            uint64_t v15 = 0;
            uint64_t v49 = v12;
            do
            {
              uint64_t v16 = v13;
              if (*(void *)v56 != v14) {
                objc_enumerationMutation(v50);
              }
              id v13 = *(id *)(*((void *)&v55 + 1) + 8 * v15);

              uint64_t v17 = [v5 objectForKeyedSubscript:v8];
              uint64_t v18 = [v17 objectForKeyedSubscript:v13];
              if ([v18 isEqualToString:v6])
              {
                [v5 objectForKeyedSubscript:v13];
                uint64_t v19 = v14;
                uint64_t v20 = v8;
                uint64_t v22 = v21 = v6;
                uint64_t v23 = [v22 objectForKeyedSubscript:@"maybeDefaultPlane"];
                int v24 = [v23 isEqualToString:@"YES"];

                id v5 = v48;
                uint64_t v6 = v21;
                uint64_t v8 = v20;
                uint64_t v14 = v19;
                uint64_t v12 = v49;

                if (v24) {
                  [v47 addObject:v13];
                }
              }
              else
              {
              }
              ++v15;
            }
            while (v12 != v15);
            uint64_t v12 = [v50 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v12);

          uint64_t i = v46;
        }
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v45);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v25 = v47;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v63 count:16];
  uint64_t v27 = v42;
  if (v26)
  {
    uint64_t v28 = v26;
    id v29 = 0;
    uint64_t v30 = *(void *)v52;
    while (2)
    {
      uint64_t v31 = 0;
      uint64_t v32 = v29;
      do
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(id *)(*((void *)&v51 + 1) + 8 * v31);

        if ([v27 isEqualToString:v29])
        {
LABEL_35:
          id v40 = v29;

          goto LABEL_36;
        }
        uint64_t v33 = [v5 objectForKeyedSubscript:v29];
        uint64_t v34 = [v33 objectForKeyedSubscript:v27];
        if (v34)
        {
          double v35 = (void *)v34;
          uint64_t v36 = [v5 objectForKeyedSubscript:v29];
          uint64_t v37 = [v36 objectForKeyedSubscript:v27];
          char v38 = [v37 isEqualToString:@"⇧"];

          uint64_t v27 = v42;
          id v5 = v48;

          if (v38) {
            goto LABEL_35;
          }
        }
        else
        {
        }
        ++v31;
        uint64_t v32 = v29;
      }
      while (v28 != v31);
      uint64_t v28 = [v25 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }
  if ([v25 count])
  {
    uint64_t v39 = [v25 allObjects];
    id v40 = [v39 objectAtIndex:0];
  }
  else
  {
    id v40 = v27;
  }
LABEL_36:

  return v40;
}

+ (id)determineDefaultPlane10Key:(id)a3 basePlaneName:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v25 = a4;
  uint64_t v6 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v7 = [v6 _layout];
  uint64_t v8 = [v7 performSelector:sel_keyboard];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v24 = v8;
  uint64_t v9 = [v8 subtrees];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v27;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = [*(id *)(*((void *)&v26 + 1) + 8 * v14) name];

      if ([v15 containsString:@"_"])
      {
        uint64_t v16 = [v15 componentsSeparatedByString:@"_"];
        uint64_t v17 = [v16 lastObject];
        uint64_t v12 = [v17 lowercaseString];
      }
      else
      {
        uint64_t v12 = v15;
      }
      uint64_t v18 = [v5 allKeys];
      char v19 = [v18 containsObject:v12];

      if (v19) {
        break;
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  if ([v12 length])
  {
    id v20 = v12;
    uint64_t v21 = v25;
  }
  else
  {
    uint64_t v21 = v25;
    id v20 = [a1 determineDefaultPlane:v5 basePlaneName:v25];
  }

  return v20;
}

+ (id)cleanUpSwitchTableBasedOnDefaultPlane:(id)a3 defaultPlaneName:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v36 = v6;
  uint64_t v8 = [v5 objectForKeyedSubscript:v6];
  uint64_t v9 = [v8 allKeys];

  id obj = v9;
  uint64_t v39 = [v9 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v62;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v10;
        uint64_t v11 = *(void *)(*((void *)&v61 + 1) + 8 * v10);
        [v7 addObject:v11];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 allKeys];

        id v41 = v13;
        uint64_t v43 = [v13 countByEnumeratingWithState:&v57 objects:v68 count:16];
        if (v43)
        {
          uint64_t v42 = *(void *)v58;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v58 != v42) {
                objc_enumerationMutation(v41);
              }
              uint64_t v44 = v14;
              uint64_t v15 = *(void *)(*((void *)&v57 + 1) + 8 * v14);
              [v7 addObject:v15];
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              uint64_t v16 = [v5 objectForKeyedSubscript:v15];
              uint64_t v17 = [v16 allKeys];

              uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v67 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v54;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v54 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                    [v7 addObject:v22];
                    long long v51 = 0u;
                    long long v52 = 0u;
                    long long v49 = 0u;
                    long long v50 = 0u;
                    uint64_t v23 = [v5 objectForKeyedSubscript:v22];
                    int v24 = [v23 allKeys];

                    uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v66 count:16];
                    if (v25)
                    {
                      uint64_t v26 = v25;
                      uint64_t v27 = *(void *)v50;
                      do
                      {
                        for (uint64_t j = 0; j != v26; ++j)
                        {
                          if (*(void *)v50 != v27) {
                            objc_enumerationMutation(v24);
                          }
                          [v7 addObject:*(void *)(*((void *)&v49 + 1) + 8 * j)];
                        }
                        uint64_t v26 = [v24 countByEnumeratingWithState:&v49 objects:v66 count:16];
                      }
                      while (v26);
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v67 count:16];
                }
                while (v19);
              }

              uint64_t v14 = v44 + 1;
            }
            while (v44 + 1 != v43);
            uint64_t v43 = [v41 countByEnumeratingWithState:&v57 objects:v68 count:16];
          }
          while (v43);
        }

        uint64_t v10 = v40 + 1;
      }
      while (v40 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v39);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v29 = [v5 allKeys];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v65 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v45 + 1) + 8 * k);
        if (([v7 containsObject:v34] & 1) == 0) {
          [v5 removeObjectForKey:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v65 count:16];
    }
    while (v31);
  }

  return v5;
}

+ (id)getKeyboardPlaneKeys:(id)a3 keys:(id)a4 inPlane:(id)a5
{
  v94[11] = *MEMORY[0x263EF8340];
  id v76 = a3;
  id v72 = a4;
  id v70 = a5;
  uint64_t v66 = [MEMORY[0x263F1C738] activeInstance];
  int v68 = [v76 shouldShowDictationKey];
  int v67 = [v76 shouldShowGlobeKey];
  uint64_t v7 = [v66 _layout];
  char v8 = [v7 globeKeyDisplaysAsEmojiKey];

  uint64_t v9 = [v66 _layout];
  char v10 = [v9 showsDedicatedEmojiKeyAlongsideGlobeButton];

  uint64_t v11 = objc_opt_new();
  if ([v72 count])
  {
    uint64_t v12 = 0;
    char v65 = v8 ^ 1 | v10;
    while (1)
    {
      uint64_t v71 = v12;
      uint64_t v77 = objc_msgSend(v72, "objectAtIndexedSubscript:");
      uint64_t v13 = [v77 name];
      uint64_t v14 = [v76 changeKeyNameToGenericCharacter:v13];

      uint64_t v15 = [v77 name];
      uint64_t v16 = [v15 lowercaseString];
      if ([v16 hasPrefix:@"copy-"]) {
        goto LABEL_6;
      }
      uint64_t v17 = [v77 name];
      uint64_t v18 = [v17 lowercaseString];
      if ([v18 hasPrefix:@"cut-"]) {
        break;
      }
      uint64_t v21 = [v77 name];
      uint64_t v22 = [v21 lowercaseString];
      char v23 = [v22 hasPrefix:@"paste-"];

      if (v23) {
        goto LABEL_7;
      }
      uint64_t v19 = v14;
      if (v14
        || ([v77 representedString], (uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
      {
LABEL_8:
        id v73 = v70;
        id v74 = v19;
        if ([(__CFString *)v19 isEqualToString:@"Dictation"])
        {
          int v20 = v68;
        }
        else if ([(__CFString *)v19 isEqualToString:@"🌐"])
        {
          if (v65)
          {
            int v20 = v67;
          }
          else
          {

            int v20 = v67;
            id v74 = @"Emoji";
          }
        }
        else
        {
          int v20 = [v77 visible];
        }
        [v77 frame];
        UIRectGetCenter();
        objc_msgSend(a1, "centerOfKey:withOffset:");
        uint64_t v25 = v24;
        uint64_t v27 = v26;
        uint64_t v75 = [v76 convertRepresentedStringsIfNecessary:v74];
        v94[0] = v75;
        v93[0] = @"key";
        v93[1] = @"keyname";
        long long v28 = [v77 name];
        v94[1] = v28;
        v94[2] = @"tap";
        v93[2] = @"action";
        v93[3] = @"x";
        long long v29 = [NSString stringWithFormat:@"%.2f", v25];
        v94[3] = v29;
        v93[4] = @"y";
        uint64_t v30 = [NSString stringWithFormat:@"%.2f", v27];
        v94[4] = v30;
        v93[5] = @"rect";
        uint64_t v31 = (void *)MEMORY[0x263F08D40];
        [v77 frame];
        uint64_t v32 = objc_msgSend(v31, "valueWithCGRect:");
        v94[5] = v32;
        v94[6] = v73;
        v93[6] = @"plane";
        v93[7] = @"more-after";
        uint64_t v33 = [v77 cache];
        uint64_t v34 = [v33 objectForKey:@"more-after"];
        double v35 = (void *)v34;
        if (v34) {
          uint64_t v36 = (void *)v34;
        }
        else {
          uint64_t v36 = &unk_270C6F5B8;
        }
        v94[7] = v36;
        v94[8] = @"basekey";
        v93[8] = @"type";
        v93[9] = @"visible";
        uint64_t v37 = MEMORY[0x263EFFA80];
        if (v20) {
          uint64_t v37 = MEMORY[0x263EFFA88];
        }
        v94[9] = v37;
        v93[10] = @"secondaryDisplayString";
        uint64_t v38 = [v77 secondaryDisplayStrings];
        uint64_t v39 = (void *)v38;
        uint64_t v40 = &stru_270C5A038;
        if (v38) {
          uint64_t v40 = (__CFString *)v38;
        }
        v94[10] = v40;
        id v41 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:11];

        [v11 setValue:v41 forKey:v75];
        uint64_t v87 = 0;
        uint64_t v88 = &v87;
        uint64_t v89 = 0x2020000000;
        char v90 = 0;
        v86[0] = MEMORY[0x263EF8330];
        v86[1] = 3221225472;
        v86[2] = __65__TypistKeyboardDataInProcess_getKeyboardPlaneKeys_keys_inPlane___block_invoke;
        v86[3] = &unk_265559710;
        v86[4] = &v87;
        +[TypistKeyboardUtilities runOnMainThread:v86];
        uint64_t v42 = [MEMORY[0x263F1C5C0] currentDevice];
        if ([v42 userInterfaceIdiom] == 1)
        {
          uint64_t v43 = [MEMORY[0x263F1C5C0] currentDevice];
          if ([v43 userInterfaceIdiom] == 1)
          {
            BOOL v44 = *((unsigned char *)v88 + 24) == 0;

            if (v44) {
              goto LABEL_41;
            }
LABEL_31:
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            uint64_t v42 = [v77 secondaryDisplayStrings];
            uint64_t v45 = [v42 countByEnumeratingWithState:&v82 objects:v92 count:16];
            if (v45)
            {
              uint64_t v46 = *(void *)v83;
              do
              {
                for (uint64_t i = 0; i != v45; ++i)
                {
                  if (*(void *)v83 != v46) {
                    objc_enumerationMutation(v42);
                  }
                  long long v48 = [@"⊎" stringByAppendingString:*(void *)(*((void *)&v82 + 1) + 8 * i)];
                  [v11 setValue:v41 forKey:v48];
                }
                uint64_t v45 = [v42 countByEnumeratingWithState:&v82 objects:v92 count:16];
              }
              while (v45);
            }
          }
          else
          {
          }
LABEL_41:
          if ([v76 isTenKey])
          {
            [v76 setupTenKey:v11 forKey:v77 keyName:v75 planeName:v73];
          }
          else if (([v76 isTenKey] & 1) == 0 && objc_msgSend(v76, "isKanaKeyboard"))
          {
            long long v49 = [MEMORY[0x263F1C5C0] currentDevice];
            if ([v49 userInterfaceIdiom] == 1)
            {
              BOOL v50 = *((unsigned char *)v88 + 24) == 0;

              if (v50) {
                [v76 setup50OnFlick:v11 forKey:v77 keyName:v75 planeName:v73];
              }
            }
            else
            {
            }
          }
          _Block_object_dispose(&v87, 8);

          goto LABEL_50;
        }

        goto LABEL_31;
      }
LABEL_50:

      unint64_t v51 = [v72 count];
      uint64_t v12 = v71 + 1;
      if (v51 <= v71 + 1) {
        goto LABEL_51;
      }
    }

LABEL_6:
LABEL_7:
    uint64_t v19 = [v77 name];

    if (v19) {
      goto LABEL_8;
    }
    goto LABEL_50;
  }
LABEL_51:
  long long v52 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v53 = v11;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v54; ++j)
      {
        if (*(void *)v79 != v55) {
          objc_enumerationMutation(v53);
        }
        [v52 appendFormat:@"[%@]", *(void *)(*((void *)&v78 + 1) + 8 * j)];
      }
      uint64_t v54 = [v53 countByEnumeratingWithState:&v78 objects:v91 count:16];
    }
    while (v54);
  }

  TYLog(@"Plane: %@, Keys -> %@", v57, v58, v59, v60, v61, v62, v63, (char)v70);
  return v53;
}

uint64_t __65__TypistKeyboardDataInProcess_getKeyboardPlaneKeys_keys_inPlane___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F1C738] isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)updateCachedKeyplaneKeycaps:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "displayString", (void)v20);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          int v14 = [v11 interactionType];

          if (v14 != 10)
          {
            char v15 = [MEMORY[0x263F1C750] _showSmallDisplayKeyplane];
            uint64_t v16 = [v11 displayString];
            uint64_t v17 = v16;
            if ((v15 & 1) == 0)
            {
              uint64_t v18 = [v16 uppercaseStringWithLocale:v5];

              uint64_t v17 = (void *)v18;
            }
            [v4 addObject:v17];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4
{
  CGFloat v4 = a3.x + a4.x;
  CGFloat v5 = a3.y + a4.y;
  id v6 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v7 = [v6 _layout];

  uint64_t v18 = 0;
  uint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  long long v21 = &unk_26042309E;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__TypistKeyboardDataInProcess_centerOfKey_withOffset___block_invoke;
  v13[3] = &unk_265559CE8;
  char v15 = &v18;
  id v8 = v7;
  id v14 = v8;
  CGFloat v16 = v4;
  CGFloat v17 = v5;
  +[TypistKeyboardUtilities runOnMainThread:v13];
  double v9 = v19[4];
  double v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  double v11 = v9;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

void __54__TypistKeyboardDataInProcess_centerOfKey_withOffset___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v5, "convertPoint:toLayer:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
}

+ (id)addKeyboardGestureKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6
{
  v106[1] = *MEMORY[0x263EF8340];
  id v87 = a3;
  id v9 = a4;
  id v10 = a5;
  id v86 = a6;
  uint64_t v77 = v9;
  long long v79 = v10;
  if (!v9 || !v10)
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"[addKeyboardGestureKeys] - FAILURE - keys or planeName is missing!", v11, v12, v13, v14, v15, v16, v76);
    goto LABEL_50;
  }
  uint64_t v98 = 0;
  uint64_t v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 0;
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __73__TypistKeyboardDataInProcess_addKeyboardGestureKeys_keys_inPlane_addTo___block_invoke;
  v97[3] = &unk_265559710;
  v97[4] = &v98;
  +[TypistKeyboardUtilities runOnMainThread:v97];
  unint64_t v78 = 0;
LABEL_4:
  if ([v77 count] > v78)
  {
    long long v82 = objc_msgSend(v77, "objectAtIndexedSubscript:");
    CGFloat v17 = [v82 name];
    uint64_t v88 = [v87 changeKeyNameToGenericCharacter:v17];

    if (!v88)
    {
      uint64_t v88 = [v82 representedString];
    }
    uint64_t v18 = [v82 secondaryRepresentedStrings];
    if ([v18 count])
    {
      if ([v82 displayTypeHint] == 10)
      {

LABEL_10:
        uint64_t v19 = [v82 secondaryRepresentedStrings];
LABEL_20:
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id obj = v19;
        uint64_t v25 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
        if (!v25) {
          goto LABEL_36;
        }
        int v84 = 0;
        uint64_t v80 = *(void *)v94;
        while (1)
        {
          uint64_t v81 = v25;
          for (uint64_t i = 0; i != v81; ++i)
          {
            if (*(void *)v94 != v80) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v93 + 1) + 8 * i);
            uint64_t v28 = [obj count];
            if (v28 == 1)
            {
              uint64_t v37 = @"↓";
              long long v85 = @"flick-down";
LABEL_32:
              uint64_t v38 = [v86 objectForKey:v88];
              uint64_t v39 = [v38 objectForKeyedSubscript:@"x"];
              [v39 floatValue];
              float v41 = v40;
              uint64_t v42 = [v86 objectForKey:v88];
              uint64_t v43 = [v42 objectForKeyedSubscript:@"y"];
              [v43 floatValue];
              float v45 = v44;

              LODWORD(v46) = 1118175232;
              objc_msgSend(v87, "calculateCoordinatesForFlickGesture:direction:offset:", v37, v41, v45, v46);
              uint64_t v48 = v47;
              uint64_t v50 = v49;
              v103[0] = @"key";
              unint64_t v51 = [v87 convertRepresentedStringsIfNecessary:v27];
              v104[0] = v51;
              v103[1] = @"keyname";
              long long v52 = [v82 name];
              v104[1] = v52;
              v104[2] = v88;
              v103[2] = @"basekey";
              v103[3] = @"action";
              v104[3] = v85;
              v103[4] = @"x";
              id v53 = [NSString stringWithFormat:@"%.2f", v48];
              v104[4] = v53;
              v103[5] = @"y";
              uint64_t v54 = [NSString stringWithFormat:@"%.2f", v50];
              v104[5] = v54;
              v103[6] = @"rect";
              uint64_t v55 = (void *)MEMORY[0x263F08D40];
              [v82 frame];
              long long v56 = objc_msgSend(v55, "valueWithCGRect:");
              v104[6] = v56;
              v104[7] = v79;
              v103[7] = @"plane";
              v103[8] = @"type";
              v104[8] = @"gesture";
              uint64_t v57 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:9];
              uint64_t v58 = [v87 convertRepresentedStringsIfNecessary:v27];
              uint64_t v59 = [(__CFString *)v37 stringByAppendingString:v58];
              [v86 setValue:v57 forKey:v59];

              ++v84;
              continue;
            }
            if (v28 == 2)
            {
              double v35 = @"↙";
              if (v84)
              {
                uint64_t v36 = @"flick-down-left";
              }
              else
              {
                double v35 = @"↘";
                uint64_t v36 = @"flick-down-right";
              }
              uint64_t v37 = v35;
              long long v85 = v36;
              goto LABEL_32;
            }
            TYLogl(OS_LOG_TYPE_ERROR, @"Too many secondaryRepresentedStrings on key '%@'. Unable to determine gesture direction.", v29, v30, v31, v32, v33, v34, (char)v88);
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
          if (!v25)
          {
LABEL_36:

            ++v78;
            goto LABEL_4;
          }
        }
      }
      if ([v82 displayType] == 7)
      {
        uint64_t v20 = [MEMORY[0x263F1C5C0] currentDevice];
        if ([v20 userInterfaceIdiom] == 1)
        {
          BOOL v21 = *((unsigned char *)v99 + 24) == 0;

          if (v21) {
            goto LABEL_10;
          }
LABEL_17:
          uint64_t v22 = [v82 gestureKey];

          if (v22)
          {
            uint64_t v23 = [v82 gestureKey];
            uint64_t v24 = [v23 representedString];
            v106[0] = v24;
            uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:1];
          }
          else
          {
            uint64_t v19 = 0;
          }
          goto LABEL_20;
        }
      }
    }

    goto LABEL_17;
  }
  uint64_t v60 = objc_opt_new();
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v61 = v86;
  uint64_t v62 = [v61 countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v62; ++j)
      {
        if (*(void *)v90 != v63) {
          objc_enumerationMutation(v61);
        }
        char v65 = *(void **)(*((void *)&v89 + 1) + 8 * j);
        if (([v65 hasPrefix:@"↓"] & 1) != 0
          || ([v65 hasPrefix:@"↘"] & 1) != 0
          || [v65 hasPrefix:@"flick-down-left"])
        {
          uint64_t v66 = [v61 objectForKeyedSubscript:v65];
          int v67 = [v66 objectForKeyedSubscript:@"basekey"];
          [v60 appendFormat:@"[%@{%@}]", v65, v67];
        }
      }
      uint64_t v62 = [v61 countByEnumeratingWithState:&v89 objects:v102 count:16];
    }
    while (v62);
  }

  TYLog(@"Plane: %@, Gesture keys -> %@", v68, v69, v70, v71, v72, v73, v74, (char)v79);
  _Block_object_dispose(&v98, 8);
LABEL_50:

  return v86;
}

uint64_t __73__TypistKeyboardDataInProcess_addKeyboardGestureKeys_keys_inPlane_addTo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F1C738] isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)addKeyboardPopupKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6 keyplaneKeycaps:(id)a7
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v76 = a3;
  id v11 = a4;
  id v12 = a5;
  id v82 = a6;
  id v72 = a7;
  uint64_t v13 = [MEMORY[0x263F1C738] activeInstance];
  uint64_t v14 = [v13 _layout];

  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  uint64_t v110 = __Block_byref_object_copy__6;
  uint64_t v111 = __Block_byref_object_dispose__6;
  id v112 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  char v106 = 0;
  v98[0] = MEMORY[0x263EF8330];
  v98[1] = 3221225472;
  v98[2] = __87__TypistKeyboardDataInProcess_addKeyboardPopupKeys_keys_inPlane_addTo_keyplaneKeycaps___block_invoke;
  v98[3] = &unk_265559D10;
  char v101 = &v107;
  id v71 = v14;
  id v99 = v71;
  id v78 = v12;
  id v100 = v78;
  uint64_t v102 = &v103;
  +[TypistKeyboardUtilities runOnMainThread:v98];
  uint64_t v15 = [MEMORY[0x263F1C920] mainScreen];
  [v15 _referenceBounds];
  BOOL v69 = CGRectGetHeight(v120) > 1194.0 && *((unsigned char *)v104 + 24) == 0;

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v11;
  uint64_t v74 = [obj countByEnumeratingWithState:&v94 objects:v117 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v74; ++i)
      {
        if (*(void *)v95 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v81 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        int v84 = [v81 representedString];
        uint64_t v77 = [MEMORY[0x263F089D8] string];
        if (![v84 length]) {
          goto LABEL_40;
        }
        if ([v81 displayType] == 7)
        {
          uint64_t v16 = [v81 secondaryRepresentedStrings];
          if ([v16 count])
          {
            int v17 = [(id)v108[5] isShiftKeyplane];

            if (!v17) {
              goto LABEL_15;
            }
            uint64_t v16 = [v81 secondaryRepresentedStrings];
            uint64_t v18 = [v16 firstObject];

            int v84 = (void *)v18;
          }
        }
LABEL_15:
        if (![a1 generatePopupKeySubtrees:v76 key:v81 plane:v108[5] layout:v71 keyplaneKeycaps:v72])goto LABEL_40; {
        uint64_t v19 = [v82 objectForKeyedSubscript:v84];
        }
        BOOL v20 = v19 == 0;

        if (v20) {
          goto LABEL_40;
        }
        BOOL v21 = [v81 subtrees];
        if ([v21 count] == 1)
        {
          uint64_t v22 = [v81 subtrees];
          uint64_t v23 = [v22 objectAtIndexedSubscript:0];
          uint64_t v24 = [v23 secondaryDisplayStrings];
          if (v24) {
            BOOL v25 = v69;
          }
          else {
            BOOL v25 = 0;
          }

          if (v25) {
            goto LABEL_40;
          }
        }
        else
        {
        }
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        uint64_t v26 = [v81 subtrees];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v90 objects:v116 count:16];
        if (v27)
        {
          uint64_t v83 = *(void *)v91;
          id v80 = v26;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v91 != v83) {
                objc_enumerationMutation(v80);
              }
              uint64_t v29 = *(void **)(*((void *)&v90 + 1) + 8 * j);
              uint64_t v30 = [v29 representedString];
              if (([v30 isEqualToString:v84] & 1) == 0)
              {
                [v29 frame];
                UIRectGetCenter();
                objc_msgSend(a1, "centerOfKey:withOffset:");
                uint64_t v32 = v31;
                uint64_t v34 = v33;
                v115[0] = v30;
                v114[0] = @"key";
                v114[1] = @"keyname";
                double v35 = [v29 name];
                v115[1] = v35;
                v115[2] = @"drag";
                v114[2] = @"action";
                v114[3] = @"x";
                uint64_t v36 = [NSString stringWithFormat:@"%.2f", v32];
                v115[3] = v36;
                v114[4] = @"y";
                uint64_t v37 = [NSString stringWithFormat:@"%.2f", v34];
                v115[4] = v37;
                v114[5] = @"rect";
                uint64_t v38 = (void *)MEMORY[0x263F08D40];
                [v29 frame];
                uint64_t v39 = objc_msgSend(v38, "valueWithCGRect:");
                v115[5] = v39;
                v115[6] = @"popover";
                v114[6] = @"type";
                v114[7] = @"basekey";
                v115[7] = v84;
                v115[8] = v78;
                v114[8] = @"plane";
                v114[9] = @"more-after";
                float v40 = [v81 cache];
                uint64_t v41 = [v40 objectForKey:@"more-after"];
                uint64_t v42 = (void *)v41;
                uint64_t v43 = &unk_270C6F5B8;
                if (v41) {
                  uint64_t v43 = (void *)v41;
                }
                v115[9] = v43;
                float v44 = [NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:10];

                float v45 = [v82 objectForKeyedSubscript:v30];
                BOOL v46 = v45 == 0;

                if (v46)
                {
                  [v82 setValue:v44 forKey:v30];
                  [v77 appendString:v30];
                }
                else
                {
                  uint64_t v47 = [v76 keyboardID];
                  int v48 = [v47 hasPrefix:@"am"];

                  if (v48)
                  {
                    uint64_t v49 = [@"‍" stringByAppendingString:v30];
                    [v82 setValue:v44 forKey:v49];

                    uint64_t v50 = [@"‍" stringByAppendingString:v30];
                    [v77 appendString:v50];
                  }
                }
              }
            }
            uint64_t v26 = v80;
            uint64_t v27 = [v80 countByEnumeratingWithState:&v90 objects:v116 count:16];
          }
          while (v27);
        }

LABEL_40:
      }
      uint64_t v74 = [obj countByEnumeratingWithState:&v94 objects:v117 count:16];
    }
    while (v74);
  }

  long long v85 = objc_opt_new();
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v51 = v82;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v86 objects:v113 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v87;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v87 != v53) {
          objc_enumerationMutation(v51);
        }
        uint64_t v55 = *(void *)(*((void *)&v86 + 1) + 8 * k);
        long long v56 = [v51 objectForKeyedSubscript:v55];
        uint64_t v57 = [v56 objectForKeyedSubscript:@"type"];
        int v58 = [v57 isEqualToString:@"popover"];

        if (v58)
        {
          uint64_t v59 = [v51 objectForKeyedSubscript:v55];
          uint64_t v60 = [v59 objectForKeyedSubscript:@"basekey"];
          [v85 appendFormat:@"[%@{%@}]", v55, v60];
        }
      }
      uint64_t v52 = [v51 countByEnumeratingWithState:&v86 objects:v113 count:16];
    }
    while (v52);
  }

  TYLog(@"Plane: %@, Popup keys -> %@", v61, v62, v63, v64, v65, v66, v67, (char)v78);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);

  return v51;
}

uint64_t __87__TypistKeyboardDataInProcess_addKeyboardPopupKeys_keys_inPlane_addTo_keyplaneKeycaps___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyplaneNamed:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [MEMORY[0x263F1C738] isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

+ (BOOL)generatePopupKeySubtrees:(id)a3 key:(id)a4 plane:(id)a5 layout:(id)a6 keyplaneKeycaps:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v13 state];
  if (v13 && ([a1 downActionFlagsForKey:v13 plane:v14 keyplaneKeycaps:v16] & 0x1000F8000) != 0) {
    [a1 showPopupVariantsForKey:v12 key:v13 plane:v14 keyplaneKeycaps:v16];
  }
  uint64_t v18 = [v13 subtrees];
  if (v18)
  {
    int v19 = [v13 state];

    if (v19 == 16)
    {
      uint64_t v20 = [v13 selectedVariantIndex];
      uint64_t v18 = [v13 highlightedVariantsList];
      [v13 setSelectedVariantIndex:0];
      [v13 setHighlightedVariantsList:0];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __89__TypistKeyboardDataInProcess_generatePopupKeySubtrees_key_plane_layout_keyplaneKeycaps___block_invoke;
      v23[3] = &unk_265559BF8;
      id v21 = v13;
      id v24 = v21;
      id v25 = v15;
      id v26 = v14;
      +[TypistKeyboardUtilities runOnMainThread:v23];
      [v21 setSelectedVariantIndex:v20];
      [v21 setHighlightedVariantsList:v18];

      LOBYTE(v18) = 1;
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  [v13 setState:v17];

  return (char)v18;
}

void __89__TypistKeyboardDataInProcess_generatePopupKeySubtrees_key_plane_layout_keyplaneKeycaps___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) dynamicLayout];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 preparePopupVariantsForKey:v4 onKeyplane:v5];
  }
  else
  {
    id v8 = [v3 currentKeyplaneView];
    id v6 = [v8 factory];
    id v7 = (id)[v6 traitsForKey:*(void *)(a1 + 32) onKeyplane:*(void *)(a1 + 48)];
  }
}

+ (void)showPopupVariantsForKey:(id)a3 key:(id)a4 plane:(id)a5 keyplaneKeycaps:(id)a6
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v86 = a3;
  id v10 = a4;
  id v88 = a5;
  id v87 = a6;
  long long v89 = v10;
  if (!v10 || [v10 state] == 16) {
    goto LABEL_95;
  }
  uint64_t v75 = [v10 representedString];
  id v11 = [MEMORY[0x263F1C738] activeInstance];
  long long v79 = UIKeyboardGetCurrentUILanguage();
  int v84 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v85 = [a1 downActionFlagsForKey:v10 plane:v88 keyplaneKeycaps:v87];
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x2020000000;
  char v117 = 0;
  uint64_t v110 = 0;
  uint64_t v111 = &v110;
  uint64_t v112 = 0x2020000000;
  char v113 = 0;
  uint64_t v106 = 0;
  uint64_t v107 = &v106;
  uint64_t v108 = 0x2020000000;
  char v109 = 0;
  v101[0] = MEMORY[0x263EF8330];
  v101[1] = 3221225472;
  v101[2] = __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_2;
  v101[3] = &unk_265559D38;
  uint64_t v103 = &v114;
  id v72 = v11;
  id v102 = v72;
  v104 = &v110;
  uint64_t v105 = &v106;
  +[TypistKeyboardUtilities runOnMainThread:v101];
  id v12 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v80 = [v12 userInterfaceIdiom] == 1 && *((unsigned char *)v107 + 24) == 0;

  id v13 = [MEMORY[0x263F1C920] mainScreen];
  [v13 _referenceBounds];
  int v14 = CGRectGetHeight(v121) > 1194.0 && *((unsigned char *)v107 + 24) == 0;

  if ((v85 & 0x8000) != 0)
  {
    uint64_t v21 = UIKeyboardGetCurrentInputMode();

    id v23 = v75;
    id v15 = v23;
    if ((v85 & 0x80000) != 0)
    {
      id v24 = [v88 componentName];
      id v15 = [v23 stringByAppendingFormat:@"-%@", v24];
    }
    if ([v89 displayType] == 7)
    {
      id v25 = [v89 secondaryRepresentedStrings];
      BOOL v26 = [v25 count] == 0;

      if (!v26)
      {
        uint64_t v27 = [v89 secondaryRepresentedStrings];
        uint64_t v28 = [v27 firstObject];
        uint64_t v29 = [v15 stringByAppendingString:v28];

        id v15 = (void *)v29;
      }
    }
    uint64_t v30 = UIKeyboardRomanAccentVariants();
    if (v14
      && [v89 displayType] == 7
      && [v89 interactionType] == 2
      && [v89 variantType] != 3)
    {
      if (*((unsigned char *)v115 + 24) && !*((unsigned char *)v111 + 24))
      {
        uint64_t v63 = [v89 secondaryRepresentedStrings];
        uint64_t v64 = [v63 objectAtIndex:0];
        uint64_t v65 = v64;
        if (v64)
        {
          id v66 = v64;
        }
        else
        {
          uint64_t v67 = [v89 representedString];
          id v66 = [v67 substringFromIndex:1];
        }
        if ((v85 & 0x80000) != 0)
        {
          uint64_t v68 = [v88 componentName];
          uint64_t v69 = [v23 stringByAppendingFormat:@"-%@", v68];

          id v66 = (id)v69;
        }
        uint64_t v22 = UIKeyboardRomanAccentVariants();

        uint64_t v30 = v66;
      }
      else
      {
        uint64_t v22 = [a1 _variantsByAppendingDualStringKey:v89 toVariants:v30];
      }
    }
    else
    {
      uint64_t v22 = v30;
    }
    goto LABEL_38;
  }
  if ((v85 & 0x40000) != 0 && ((*((unsigned char *)v115 + 24) != 0) & ~v14) == 0)
  {
    id v15 = UIKeyboardCurrencyVariants();
    char v16 = v14 ^ 1;
    if (v15) {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      uint64_t v17 = [v10 secondaryRepresentedStrings];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v97 objects:v119 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v98;
LABEL_17:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v98 != v19) {
            objc_enumerationMutation(v17);
          }
          id v15 = UIKeyboardCurrencyVariants();
          if (v15) {
            break;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v17 countByEnumeratingWithState:&v97 objects:v119 count:16];
            if (v18) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }
      }
      else
      {
LABEL_23:
        id v15 = 0;
      }
    }
    if (v15)
    {
      uint64_t v21 = (uint64_t)v79;
      if (v14)
      {
LABEL_27:
        uint64_t v22 = [a1 _variantsByAppendingDualStringKey:v89 toVariants:v15];
LABEL_38:

LABEL_39:
        long long v79 = (void *)v21;
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v21 = UIKeyboardGetCurrentInputMode();

      id v15 = UIKeyboardCurrencyVariants();
      if (v14) {
        goto LABEL_27;
      }
    }
    uint64_t v22 = v15;
    goto LABEL_39;
  }
  uint64_t v22 = 0;
LABEL_41:
  id v76 = [v22 objectForKey:*MEMORY[0x263F1D470]];
  uint64_t v74 = [v22 objectForKey:*MEMORY[0x263F1D468]];
  uint64_t v73 = v22;
  if (v22 && [v76 count])
  {
    uint64_t v81 = [MEMORY[0x263EFF980] arrayWithArray:v76];
    uint64_t v83 = [MEMORY[0x263EFF980] arrayWithArray:v74];
    uint64_t v70 = [v22 objectForKey:*MEMORY[0x263F1D460]];
    if (v81 && v83 && v70)
    {
      uint64_t v31 = [v70 isEqualToString:*MEMORY[0x263F1D388]];
      if ((v31 & 1) != 0
        || (uint64_t v31 = [v70 isEqualToString:*MEMORY[0x263F1D390]], (v31 & 1) != 0)
        || (uint64_t v31 = [v70 isEqualToString:*MEMORY[0x263F1D380]], v31))
      {
        __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke(v31, v81);
        __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke(v32, v83);
      }
      unint64_t v33 = [v81 count];
      if (v33 <= [v83 count]) {
        uint64_t v34 = v81;
      }
      else {
        uint64_t v34 = v83;
      }
      uint64_t v78 = [v34 count];
      v95[0] = MEMORY[0x263EF8330];
      v95[1] = 3221225472;
      v95[2] = __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_3;
      v95[3] = &unk_265559650;
      id v96 = v72;
      +[TypistKeyboardUtilities runOnMainThread:v95];
      double v35 = [MEMORY[0x263EFF980] array];
      id v71 = [MEMORY[0x263EFF980] array];
      uint64_t v77 = [v89 representedString];
      if ([v89 displayType] == 7 && (unint64_t)objc_msgSend(v75, "length") >= 2)
      {
        __int16 v94 = [v75 characterAtIndex:0];
        uint64_t v36 = [NSString stringWithCharacters:&v94 length:1];

        uint64_t v77 = (void *)v36;
      }
      if (v78)
      {
        uint64_t v37 = 0;
        unint64_t v38 = 1;
        while (1)
        {
          uint64_t v39 = [v83 objectAtIndex:v37];
          if (([v88 isShiftKeyplane] & 1) != 0
            || ![MEMORY[0x263F1C750] _showSmallDisplayKeyplane])
          {
            uint64_t v40 = [v39 uppercaseStringWithLocale:v84];
          }
          else
          {
            uint64_t v40 = [v39 lowercaseStringWithLocale:v84];
          }
          uint64_t v41 = (void *)v40;
          uint64_t v42 = (v85 & 0x40000) != 0 ? v39 : (void *)v40;
          id v43 = v42;
          float v44 = [v89 displayString];
          if (([v44 isEqual:v43] & 1) != 0
            || ![v87 containsObject:v41]
            || [v89 variantType] == 9)
          {
            break;
          }
          uint64_t v57 = [v86 keyboardID];
          char v58 = [v57 hasPrefix:@"am"];

          if (v58) {
            goto LABEL_69;
          }
LABEL_78:

          if (v78 == ++v37) {
            goto LABEL_83;
          }
        }

LABEL_69:
        float v45 = [v81 objectAtIndex:v37];
        int v46 = [v45 isEqual:v77];
        uint64_t v47 = 2;
        if (!v46) {
          uint64_t v47 = v38;
        }
        unint64_t v82 = v47;
        if ((v46 & v80 & 1) == 0)
        {
          int v48 = (void *)[v89 copy];
          [v48 setRepresentedString:v45];
          [v48 setDisplayString:v39];
          [v48 setDisplayType:0];
          uint64_t v49 = NSString;
          uint64_t v50 = [v89 name];
          id v51 = [v48 representedString];
          uint64_t v52 = [v49 stringWithFormat:@"%@/%@", v50, v51];
          [v48 setName:v52];

          [v48 setOverrideDisplayString:0];
          uint64_t v53 = [v39 length];
          uint64_t v54 = v35;
          if (v53 == 1)
          {
            int v55 = [v39 characterAtIndex:0];
            uint64_t v54 = v71;
            if (v55 != 170)
            {
              int v56 = [v39 characterAtIndex:0];
              uint64_t v54 = v35;
              if (v56 == 186) {
                uint64_t v54 = v71;
              }
            }
          }
          [v54 addObject:v48];

          unint64_t v38 = v82;
        }

        goto LABEL_78;
      }
      unint64_t v38 = 1;
LABEL_83:
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v59 = v71;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v90 objects:v118 count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v91 != v61) {
              objc_enumerationMutation(v59);
            }
            [v35 addObject:*(void *)(*((void *)&v90 + 1) + 8 * i)];
          }
          uint64_t v60 = [v59 countByEnumeratingWithState:&v90 objects:v118 count:16];
        }
        while (v60);
      }

      if ([v35 count] >= v38)
      {
        [v89 updateVariantTypeForActions:v85];
        [v89 setVariantPopupBias:v70];
        [v89 setSubtrees:v35];
        [v89 setState:16];
      }
    }
  }

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);

LABEL_95:
}

void __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v2 = [v8 count];
  if (v2 >= 2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = v2 >> 1;
    unint64_t v5 = v2 - 1;
    do
    {
      id v6 = [v8 objectAtIndex:v3];
      id v7 = [v8 objectAtIndex:v5];
      [v8 replaceObjectAtIndex:v3 withObject:v7];

      [v8 replaceObjectAtIndex:v5 withObject:v6];
      ++v3;
      --v5;
    }
    while (v4 != v3);
  }
}

uint64_t __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isShifted];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) isAutoShifted];
  uint64_t result = [MEMORY[0x263F1C738] isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) autocorrectPrompt];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 removeAutocorrectPromptAndCandidateList];
  }
}

+ (unint64_t)downActionFlagsForKey:(id)a3 plane:(id)a4 keyplaneKeycaps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 visible])
  {
    int v11 = [v8 interactionType];
    int v12 = [v8 variantType];
    unint64_t v13 = 5;
    if (v11 != 15 && v11 != 13)
    {
      if (v11 == 4)
      {
        unint64_t v13 = 69;
      }
      else if ((v11 - 1) > 1)
      {
        unint64_t v13 = 5;
        switch(v11)
        {
          case 3:
            goto LABEL_24;
          case 4:
          case 5:
          case 8:
          case 13:
          case 15:
            goto LABEL_22;
          case 6:
            if ([MEMORY[0x263F1C738] rivenTranslationPreference]) {
              unint64_t v13 = 133;
            }
            else {
              unint64_t v13 = 5;
            }
            break;
          case 7:
            unint64_t v13 = 1048581;
            break;
          case 9:
            unint64_t v13 = 4229;
            break;
          case 10:
            unint64_t v13 = 536870916;
            break;
          case 11:
            unint64_t v13 = 36;
            break;
          case 12:
          case 16:
          case 17:
            break;
          case 14:
            unint64_t v13 = 20;
            break;
          default:
            if (v11 == 38)
            {
LABEL_24:
              unint64_t v13 = 128;
              break;
            }
            if (v11 == 40) {
              break;
            }
LABEL_22:
            if ((v11 & 0xFFFFFFFE) == 0x14)
            {
              unint64_t v13 = 5;
              break;
            }
            if ((v11 - 24) > 0xD) {
              goto LABEL_50;
            }
            unint64_t v13 = qword_26041A950[v11 - 24];
            break;
        }
      }
      else
      {
        int v14 = v12;
        uint64_t v25 = 0;
        BOOL v26 = &v25;
        uint64_t v27 = 0x2020000000;
        char v28 = 0;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __75__TypistKeyboardDataInProcess_downActionFlagsForKey_plane_keyplaneKeycaps___block_invoke;
        v24[3] = &unk_265559710;
        v24[4] = &v25;
        +[TypistKeyboardUtilities runOnMainThread:v24];
        id v15 = [MEMORY[0x263F1C920] mainScreen];
        [v15 _referenceBounds];
        if (CGRectGetHeight(v29) <= 1194.0
          || *((unsigned char *)v26 + 24)
          || [v8 displayType] != 7)
        {

          uint64_t v16 = 5;
        }
        else
        {

          if (v14 == 3) {
            uint64_t v16 = 5;
          }
          else {
            uint64_t v16 = 32901;
          }
        }
        unint64_t v13 = 32901;
        switch(v14)
        {
          case 1:
            goto LABEL_33;
          case 3:
            uint64_t v17 = 262272;
            goto LABEL_32;
          case 4:
            uint64_t v17 = 131200;
            goto LABEL_32;
          case 5:
          case 10:
            uint64_t v17 = 8421376;
            goto LABEL_32;
          case 7:
            uint64_t v17 = 65664;
            goto LABEL_32;
          case 8:
            unint64_t v13 = 557189;
            goto LABEL_33;
          case 9:
            uint64_t v17 = 2155872261;
            goto LABEL_32;
          default:
            if ((v14 - 11) > 1)
            {
              if ([a1 keyHasAccentedVariants:v8 plane:v9 keyplaneKeycaps:v10])
              {
                uint64_t v21 = [v8 name];
                int v22 = [v21 hasPrefix:@"Assist"];

                if (v22) {
                  unint64_t v13 = v16;
                }
                else {
                  unint64_t v13 = 32901;
                }
              }
              else
              {
                unint64_t v13 = v16;
              }
            }
            else
            {
              uint64_t v17 = 0x100000080;
LABEL_32:
              unint64_t v13 = v16 | v17;
            }
LABEL_33:
            uint64_t v18 = [v8 name];
            if ([v18 hasPrefix:@"NumberPad-"])
            {
              uint64_t v19 = [v8 name];
              int v20 = [v19 hasSuffix:@"-0-Plus"];

              if (v20) {
                v13 |= 0x80uLL;
              }
            }
            else
            {
            }
            _Block_object_dispose(&v25, 8);
            break;
        }
      }
    }
  }
  else
  {
LABEL_50:
    unint64_t v13 = 0;
  }

  return v13;
}

uint64_t __75__TypistKeyboardDataInProcess_downActionFlagsForKey_plane_keyplaneKeycaps___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F1C738] isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)_variantsByAppendingDualStringKey:(id)a3 toVariants:(id)a4
{
  v32[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 displayType] == 7)
  {
    id v8 = [v6 secondaryDisplayStrings];
    id v9 = [v8 objectAtIndex:0];
    id v10 = v9;
    if (v9)
    {
      id v30 = v9;
    }
    else
    {
      int v11 = [v6 displayString];
      id v30 = [v11 substringFromIndex:1];
    }
    int v12 = [v6 secondaryRepresentedStrings];
    unint64_t v13 = [v12 objectAtIndex:0];
    int v14 = v13;
    id v15 = a1;
    if (v13)
    {
      id v29 = v13;
    }
    else
    {
      uint64_t v16 = [v6 representedString];
      id v29 = [v16 substringFromIndex:1];
    }
    uint64_t v17 = *MEMORY[0x263F1D468];
    uint64_t v18 = [v7 objectForKey:*MEMORY[0x263F1D468]];
    uint64_t v19 = *MEMORY[0x263F1D470];
    int v20 = [v7 objectForKey:*MEMORY[0x263F1D470]];
    uint64_t v21 = *MEMORY[0x263F1D460];
    int v22 = [v7 objectForKey:*MEMORY[0x263F1D460]];
    id v23 = [v15 appendingSecondaryStringToVariantsTop:v18 secondaryString:v30 withDirection:v22];

    id v24 = [v7 objectForKey:v21];
    uint64_t v25 = [v15 appendingSecondaryStringToVariantsTop:v20 secondaryString:v29 withDirection:v24];

    v31[0] = v21;
    BOOL v26 = [v7 objectForKey:v21];
    v32[0] = v26;
    v32[1] = v23;
    v31[1] = v17;
    v31[2] = v19;
    v32[2] = v25;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

    id v7 = (id)v27;
  }

  return v7;
}

+ (id)appendingSecondaryStringToVariantsTop:(id)a3 secondaryString:(id)a4 withDirection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[a3 mutableCopy];
  uint64_t v10 = [v9 indexOfObject:v7];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v9 removeObjectAtIndex:v10];
  }
  if ([v8 isEqualToString:*MEMORY[0x263F1D388]]) {
    [v9 addObject:v7];
  }
  else {
    [v9 insertObject:v7 atIndex:0];
  }

  return v9;
}

+ (BOOL)keyHasAccentedVariants:(id)a3 plane:(id)a4 keyplaneKeycaps:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 name];
  char v11 = [v10 hasPrefix:@"NumberPad"];

  if (v11)
  {
    char v12 = 0;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v15 = [v7 representedString];
    if ([v7 variantType] == 8)
    {
      uint64_t v16 = [v8 componentName];
      uint64_t v17 = [v15 stringByAppendingFormat:@"-%@", v16];

      id v15 = (void *)v17;
    }
    if ([v7 displayType] == 7)
    {
      uint64_t v18 = [v7 secondaryRepresentedStrings];
      uint64_t v19 = [v18 count];

      if (v19)
      {
        int v20 = [v7 secondaryRepresentedStrings];
        uint64_t v21 = [v20 firstObject];
        uint64_t v22 = [v15 stringByAppendingString:v21];

        id v15 = (void *)v22;
      }
    }
    if (v15 && ([v13 containsObject:v15] & 1) == 0)
    {
      [v13 addObject:v15];
      id v23 = UIKeyboardGetCurrentInputMode();
      id v24 = UIKeyboardRomanAccentVariants();

      uint64_t v25 = [v24 objectForKey:*MEMORY[0x263F1D470]];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __76__TypistKeyboardDataInProcess_keyHasAccentedVariants_plane_keyplaneKeycaps___block_invoke;
      v29[3] = &unk_265559D60;
      id v30 = v9;
      BOOL v26 = [v25 indexesOfObjectsPassingTest:v29];
      uint64_t v27 = [v25 objectsAtIndexes:v26];

      if ([v27 count]) {
        [v14 addObject:v15];
      }
    }
    char v12 = [v14 containsObject:v15];
  }
  return v12;
}

uint64_t __76__TypistKeyboardDataInProcess_keyHasAccentedVariants_plane_keyplaneKeycaps___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (id)setOneHandedKeyboardHandBias:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 lowercaseString];
  char v5 = [v4 isEqualToString:@"left"];

  if (v5)
  {
    id v6 = @"Left";
  }
  else
  {
    id v7 = [v3 lowercaseString];
    int v8 = [v7 isEqualToString:@"right"];

    if (v8) {
      id v6 = @"Right";
    }
    else {
      id v6 = @"None";
    }
  }
  id v9 = [MEMORY[0x263F1C758] sharedPreferencesController];
  uint64_t v10 = *MEMORY[0x263F7E7D0];
  char v11 = [v9 valueForPreferenceKey:*MEMORY[0x263F7E7D0]];

  TYLog(@"Changing HandBias for One-Handed Keyboard: Current=%@ ChangeTo=%@", v12, v13, v14, v15, v16, v17, v18, (char)v11);
  if ([v11 isEqualToString:v6])
  {
    TYLog(@"HandBias for One-Handed Keyboard is already set to %@", v19, v20, v21, v22, v23, v24, v25, (char)v6);
  }
  else
  {
    BOOL v26 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
    [v26 updateKeyboardHandBias:v6];

    uint64_t v27 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
    [v27 synchronizePreferences];

    char v28 = [MEMORY[0x263F1C758] sharedPreferencesController];
    id v6 = [v28 valueForPreferenceKey:v10];

    if ([(__CFString *)v6 isEqualToString:v11])
    {
      double v36 = 0.0;
      do
      {
        uint64_t v37 = v6;
        +[TypistKeyboardUtilities waitFor:0.2];
        unint64_t v38 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
        [v38 synchronizePreferences];

        uint64_t v39 = [MEMORY[0x263F1C758] sharedPreferencesController];
        id v6 = [v39 valueForPreferenceKey:v10];

        double v36 = v36 + 0.2;
        if ([(__CFString *)v6 isEqualToString:v11]) {
          BOOL v40 = v36 < 10.0;
        }
        else {
          BOOL v40 = 0;
        }
      }
      while (v40);
    }
    TYLog(@"HandBias for One-Handed Keyboard is changed to %@  %@", v29, v30, v31, v32, v33, v34, v35, (char)v6);
  }

  return v6;
}

+ (BOOL)_activeInputModesContainsInputMode:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__6;
  uint64_t v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  double v4 = 10.0;
  do
  {
    +[TypistKeyboardUtilities waitFor:0.2];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __66__TypistKeyboardDataInProcess__activeInputModesContainsInputMode___block_invoke;
    v30[3] = &unk_265559710;
    v30[4] = &v31;
    +[TypistKeyboardUtilities runOnMainThread:v30];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = (id)v32[5];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) identifier];
          int v10 = [v9 isEqualToString:v3];

          if (v10)
          {
            TYLog(@"Active input mode list now contains %@", v11, v12, v13, v14, v15, v16, v17, (char)v3);

            BOOL v24 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    double v4 = v4 + -0.2;
  }
  while (v4 > 0.0);
  TYLogl(OS_LOG_TYPE_ERROR, @"Timed out while waiting for activeInputMode to contain %@", v18, v19, v20, v21, v22, v23, (char)v3);
  BOOL v24 = 0;
LABEL_13:
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __66__TypistKeyboardDataInProcess__activeInputModesContainsInputMode___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F1C748] sharedInputModeController];
  uint64_t v2 = [v5 activeInputModes];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (int)getWubiEnumeration:(id)a3
{
  uint64_t v3 = getWubiEnumeration__wubiOnceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&getWubiEnumeration__wubiOnceToken, &__block_literal_global_532);
  }
  id v5 = [(id)getWubiEnumeration__wubiDictionary valueForKey:v4];

  int v6 = [v5 intValue];
  return v6;
}

void __50__TypistKeyboardDataInProcess_getWubiEnumeration___block_invoke()
{
  id v0 = (void *)getWubiEnumeration__wubiDictionary;
  getWubiEnumeration__wubiDictionary = (uint64_t)&unk_270C6FC60;
}

+ (int)getShuangpinEnumeration:(id)a3
{
  uint64_t v3 = getShuangpinEnumeration__shuangpinOnceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&getShuangpinEnumeration__shuangpinOnceToken, &__block_literal_global_551);
  }
  id v5 = [(id)getShuangpinEnumeration__shuangpinSchemaDictionary valueForKey:v4];

  int v6 = [v5 intValue];
  return v6;
}

void __55__TypistKeyboardDataInProcess_getShuangpinEnumeration___block_invoke()
{
  id v0 = (void *)getShuangpinEnumeration__shuangpinSchemaDictionary;
  getShuangpinEnumeration__shuangpinSchemaDictionary = (uint64_t)&unk_270C6FC88;
}

+ (BOOL)shouldShowDictationKey
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__TypistKeyboardDataInProcess_shouldShowDictationKey__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __53__TypistKeyboardDataInProcess_shouldShowDictationKey__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1C738] activeInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 shouldShowDictationKey];
}

+ (BOOL)shouldShowGlobeKey
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__TypistKeyboardDataInProcess_shouldShowGlobeKey__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__TypistKeyboardDataInProcess_shouldShowGlobeKey__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1C738] activeInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 shouldShowInternationalKey];
}

+ (id)getRepresentedStringFromKey:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__TypistKeyboardDataInProcess_getRepresentedStringFromKey___block_invoke;
  v7[3] = &unk_265559CC0;
  id v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  +[TypistKeyboardUtilities runOnMainThread:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __59__TypistKeyboardDataInProcess_getRepresentedStringFromKey___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x263F1C738] activeInstance];
  id v2 = [v7 _layout];
  id v3 = [v2 baseKeyForString:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 representedString];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (CGPoint)floatingKeyboardDraggablePoint
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v10 = &unk_26042309E;
  long long v11 = *MEMORY[0x263F00148];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__TypistKeyboardDataInProcess_floatingKeyboardDraggablePoint__block_invoke;
  v6[3] = &unk_265559710;
  v6[4] = &v7;
  +[TypistKeyboardUtilities runOnMainThread:v6];
  double v2 = v8[4];
  double v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

void __61__TypistKeyboardDataInProcess_floatingKeyboardDraggablePoint__block_invoke(uint64_t a1)
{
  id v15 = [MEMORY[0x263F1C738] activeInstance];
  double v2 = [MEMORY[0x263F1C710] activeKeyboard];
  [v2 _floatingKeyboardDraggableRect];
  UIRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x263F1C408] sharedApplication];
  id v8 = [v7 delegate];
  uint64_t v9 = [v8 window];
  uint64_t v10 = [v9 rootViewController];
  long long v11 = [v10 view];
  objc_msgSend(v15, "convertPoint:toView:", v11, v4, v6);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v14;
}

+ (BOOL)isCandidateCellVisible:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSClassFromString(&cfstr_Uikeyboardcand_0.isa);
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(&cfstr_Uikeyboardcand_1.isa), (objc_opt_isKindOfClass() & 1) != 0)
      || (NSClassFromString(&cfstr_Tuicandidatece.isa), (objc_opt_isKindOfClass() & 1) != 0))
    {
      LODWORD(a1) = [v4 isHidden] ^ 1;
    }
    else
    {
      double v6 = [v4 superview];
      LOBYTE(a1) = [a1 isCandidateCellVisible:v6];
    }
  }
  else
  {
    LOBYTE(a1) = 0;
  }

  return (char)a1;
}

@end