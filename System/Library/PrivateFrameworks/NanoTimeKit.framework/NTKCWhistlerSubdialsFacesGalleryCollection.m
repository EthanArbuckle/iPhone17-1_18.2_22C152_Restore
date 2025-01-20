@interface NTKCWhistlerSubdialsFacesGalleryCollection
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCWhistlerSubdialsFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(@"FACE_STYLE_34_IN_TITLE_CASE", @"Modular Compact");
}

- (id)facesForDevice:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(0, "count"));
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke;
    v89[3] = &unk_1E62C0188;
    v90 = v6;
    id v7 = v6;
    [&unk_1F16E97A8 enumerateObjectsUsingBlock:v89];
    v8 = (void *)[v7 copy];
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:v3];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2;
    v85[3] = &unk_1E62C2A80;
    id v86 = v3;
    id v87 = v10;
    id v11 = v9;
    id v88 = v11;
    id v12 = v10;
    [v8 enumerateObjectsUsingBlock:v85];
    v13 = v88;
    id v14 = v11;

    v15 = v90;
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
    int v17 = [v3 supportsCapability:v16];

    if (v17)
    {
      uint64_t v18 = +[NTKFace defaultFaceOfStyle:34 forDevice:v3];
      v15 = [(id)objc_opt_class() pigmentFaceDomain];
      v19 = (void *)v18;
      uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v21 = +[NTKPigmentEditOptionStore sharedInstance];
      obuint64_t j = (id)v20;
      v22 = [v21 pigmentSetForDomain:v15 bundle:v20];
      v23 = [v22 pigmentsFromMostRecentAddableCollectionsForSlot:0];

      v24 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:v3];
      v25 = [MEMORY[0x1E4F1CA48] array];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_146;
      v81[3] = &unk_1E62C2A80;
      id v26 = v3;
      id v82 = v26;
      id v83 = v24;
      id v27 = v25;
      id v84 = v27;
      id v28 = v24;
      [v23 enumerateObjectsUsingBlock:v81];
      if (NTKShowCarbonara(v26) && (unint64_t)[v27 count] >= 7)
      {
        v29 = [v27 objectAtIndexedSubscript:6];
        [v27 removeObjectAtIndex:6];
        [v27 insertObject:v29 atIndex:0];
      }
      v30 = v84;
      id v14 = v27;

      id v7 = v19;
    }
    else
    {
      if (NTKShowGossamerUI(v3))
      {
        v31 = +[NTKPigmentEditOption pigmentNamed:@"special.multicolor"];
        [v8 addObject:v31];

        uint64_t v32 = 4;
      }
      else
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        v94[0] = @"seasons.spring2015.white";
        v94[1] = @"seasons.black";
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v77 objects:v95 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v78 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = +[NTKPigmentEditOption pigmentNamed:*(void *)(*((void *)&v77 + 1) + 8 * i)];
              [v8 addObject:v38];
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v77 objects:v95 count:16];
          }
          while (v35);
        }

        uint64_t v32 = 3;
      }
      v39 = +[NTKFaceColorEditOption standardColorValuesForDevice:v3];
      v40 = objc_msgSend(v39, "subarrayWithRange:", 0, v32);

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v7 = v40;
      uint64_t v41 = [v7 countByEnumeratingWithState:&v73 objects:v93 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v74 != v43) {
              objc_enumerationMutation(v7);
            }
            v45 = +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorEditOption, "optionWithFaceColor:forDevice:", [*(id *)(*((void *)&v73 + 1) + 8 * j) integerValue], v3);
            v46 = [v45 pigmentEditOption];
            [v8 addObject:v46];
          }
          uint64_t v42 = [v7 countByEnumeratingWithState:&v73 objects:v93 count:16];
        }
        while (v42);
      }

      v15 = [MEMORY[0x1E4F1CA48] array];
      v47 = +[NTKDualTimeStyleEditOption optionWithStyle:0 forDevice:v3];
      [v15 addObject:v47];

      v48 = +[NTKDualTimeStyleEditOption optionWithStyle:1 forDevice:v3];
      [v15 addObject:v48];

      id v14 = [MEMORY[0x1E4F1CA48] array];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      obuint64_t j = v8;
      uint64_t v63 = [obj countByEnumeratingWithState:&v69 objects:v92 count:16];
      if (v63)
      {
        id v59 = v7;
        v60 = v8;
        uint64_t v62 = *(void *)v70;
        do
        {
          uint64_t v49 = 0;
          do
          {
            if (*(void *)v70 != v62) {
              objc_enumerationMutation(obj);
            }
            uint64_t v64 = v49;
            uint64_t v50 = *(void *)(*((void *)&v69 + 1) + 8 * v49);
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v51 = v15;
            uint64_t v52 = [v51 countByEnumeratingWithState:&v65 objects:v91 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              uint64_t v54 = *(void *)v66;
              do
              {
                for (uint64_t k = 0; k != v53; ++k)
                {
                  if (*(void *)v66 != v54) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v56 = *(void *)(*((void *)&v65 + 1) + 8 * k);
                  v57 = +[NTKFace defaultFaceOfStyle:34 forDevice:v3];
                  [v57 selectOption:v50 forCustomEditMode:10 slot:0];
                  [v57 selectOption:v56 forCustomEditMode:15 slot:0];
                  [v14 addObject:v57];
                }
                uint64_t v53 = [v51 countByEnumeratingWithState:&v65 objects:v91 count:16];
              }
              while (v53);
            }

            uint64_t v49 = v64 + 1;
          }
          while (v64 + 1 != v63);
          uint64_t v63 = [obj countByEnumeratingWithState:&v69 objects:v92 count:16];
        }
        while (v63);
        v15 = v51;
        id v7 = v59;
        v8 = v60;
      }
    }
  }

  return v14;
}

void __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[NTKPigmentEditOption pigmentNamed:a2];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

void __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  v109[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = +[NTKFace defaultFaceOfStyle:34 forDevice:*(void *)(a1 + 32)];
  if (v6)
  {
    id v7 = +[NTKComplication anyComplicationOfType:7];
    uint64_t v8 = +[NTKComplication anyComplicationOfType:18];
    switch(a3 & 7)
    {
      case 1:
        v106 = @"top";
        v107 = &unk_1F16E97C0;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        v24 = long long v80 = (void *)v8;
        uint64_t v50 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.altitude" appBundleIdentifier:@"com.apple.NanoCompass.watchkitapp" complicationDescriptor:0];
        id v51 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.waypoint" appBundleIdentifier:@"com.apple.NanoCompass.watchkitapp" complicationDescriptor:0];
        v104[0] = @"center";
        uint64_t v52 = _complicationOrDie(v50);
        v105[0] = v52;
        v104[1] = @"bottom";
        uint64_t v53 = _complicationOrDie(v51);
        v105[1] = v53;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];

        v19 = v80;
        goto LABEL_28;
      case 2:
        v102[0] = @"top";
        v102[1] = @"center";
        v103[0] = &unk_1F16E97D8;
        v103[1] = &unk_1F16E97F0;
        v102[2] = @"bottom";
        v103[2] = &unk_1F16E9808;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
        v24 = v19 = (void *)v8;
        uint64_t v25 = 0;
        v23 = 0;
        goto LABEL_40;
      case 3:
        uint64_t v26 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.temperature" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
        id v84 = (void *)v26;
        uint64_t v27 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.depth" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
        long long v77 = (void *)v27;
        id v81 = v5;
        id v28 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.boardwalk.watchapp.widgets" containerBundleIdentifier:@"com.apple.boardwalk.watchapp" kind:@"Tides" intent:0];
        +[NTKWidgetComplication complicationWithDescriptor:v28];
        v30 = v29 = v7;
        v100[0] = @"top";
        if ([*(id *)(a1 + 32) supportsCharon]) {
          v31 = (void *)v26;
        }
        else {
          v31 = v29;
        }
        uint64_t v32 = _complicationOrDie(v31);
        v101[0] = v32;
        v100[1] = @"center";
        if ([*(id *)(a1 + 32) supportsCharon]) {
          v33 = (void *)v27;
        }
        else {
          v33 = (void *)v8;
        }
        uint64_t v34 = _complicationOrDie(v33);
        v101[1] = v34;
        v100[2] = @"bottom";
        _complicationOrDie(v30);
        uint64_t v35 = v19 = (void *)v8;
        v101[2] = v35;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];

        id v5 = v81;
        id v7 = v29;

        uint64_t v36 = v84;
        goto LABEL_23;
      case 4:
        long long v74 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.boardwalk.watchapp.widgets" containerBundleIdentifier:@"com.apple.boardwalk.watchapp" kind:@"Swell" intent:0];
        long long v78 = (void *)v8;
        long long v70 = +[NTKWidgetComplication complicationWithDescriptor:v74];
        long long v72 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.weather.watchapp.widgets" containerBundleIdentifier:@"com.apple.weather.watchapp" kind:@"com.apple.weather.widget.humidity" intent:0];
        +[NTKWidgetComplication complicationWithDescriptor:v72];
        v37 = v85 = v7;
        v38 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.weather.watchapp.widgets" containerBundleIdentifier:@"com.apple.weather.watchapp" kind:@"com.apple.weather.widget.threeup" intent:0];
        v39 = +[NTKWidgetComplication complicationWithDescriptor:v38];
        v98[0] = @"top";
        v40 = _complicationOrDie(v70);
        v99[0] = v40;
        v98[1] = @"center";
        uint64_t v41 = _complicationOrDie(v37);
        v99[1] = v41;
        v98[2] = @"bottom";
        uint64_t v42 = _complicationOrDie(v39);
        v99[2] = v42;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:3];

        v19 = v78;
        id v7 = v85;

        uint64_t v36 = v70;
LABEL_23:

        goto LABEL_24;
      case 5:
        uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.NanoTranslate.Widget" containerBundleIdentifier:@"com.apple.NanoTranslate" kind:@"NanoTranslateStaticWidget" intent:0];
        id v51 = +[NTKWidgetComplication complicationWithDescriptor:v50];
        v96[0] = @"center";
        v96[1] = @"bottom";
        v97[0] = &unk_1F16E9820;
        v97[1] = &unk_1F16E9838;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
        v24 = v19 = (void *)v8;
        v94 = @"top";
        uint64_t v52 = _complicationOrDie(v51);
        v95 = v52;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
LABEL_28:

        uint64_t v25 = 0;
        goto LABEL_40;
      case 6:
        id v54 = +[NTKComplication anyComplicationOfType:1];
        id v82 = v5;
        if ([*(id *)(a1 + 32) supportsUrsa])
        {
          v55 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.compass" appBundleIdentifier:@"com.apple.NanoCompass.watchkitapp" complicationDescriptor:0];
          uint64_t v56 = v55;
          if (v55)
          {
            id v57 = v55;
            v58 = v54;
            id v54 = v57;
          }
        }
        id v87 = v54;
        id v59 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.temperature" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
        v60 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.depth" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
        v92[0] = @"top";
        v61 = _complicationOrDie(v54);
        v93[0] = v61;
        v92[1] = @"center";
        if ([*(id *)(a1 + 32) supportsCharon]) {
          uint64_t v62 = v59;
        }
        else {
          uint64_t v62 = v7;
        }
        uint64_t v63 = _complicationOrDie(v62);
        v93[1] = v63;
        v92[2] = @"bottom";
        if ([*(id *)(a1 + 32) supportsCharon]) {
          uint64_t v64 = v60;
        }
        else {
          uint64_t v64 = (void *)v8;
        }
        _complicationOrDie(v64);
        long long v65 = (void *)v8;
        v67 = long long v66 = v7;
        v93[2] = v67;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];

        id v7 = v66;
        v19 = v65;

        v24 = 0;
        uint64_t v25 = 1;
        id v5 = v82;
        goto LABEL_40;
      case 7:
        long long v79 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.NanoHealthBalance.NanoHealthBalanceWidgetExtension" containerBundleIdentifier:@"com.apple.NanoHealthBalance" kind:@"BalanceOneDayWidgetKind" intent:0];
        long long v73 = +[NTKWidgetComplication complicationWithDescriptor:v79];
        long long v75 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget" containerBundleIdentifier:@"com.apple.nanomusicrecognition" kind:@"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget" intent:0];
        +[NTKWidgetComplication complicationWithDescriptor:v75];
        long long v71 = v86 = v7;
        uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F19AF8]) initWithExtensionBundleIdentifier:@"com.apple.ActivityMonitorApp.ActivityComplication" containerBundleIdentifier:@"com.apple.ActivityMonitorApp" kind:@"ActivityGraphComplication" intent:0];
        v44 = +[NTKWidgetComplication complicationWithDescriptor:v43];
        v90[0] = @"top";
        _complicationOrDie(v73);
        id v45 = v5;
        v47 = v46 = (void *)v8;
        v91[0] = v47;
        v90[1] = @"center";
        v48 = _complicationOrDie(v71);
        v91[1] = v48;
        v90[2] = @"bottom";
        uint64_t v49 = _complicationOrDie(v44);
        v91[2] = v49;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];

        v19 = v46;
        id v5 = v45;

        id v7 = v86;
        uint64_t v25 = 0;
        v24 = 0;
        goto LABEL_40;
      default:
        v9 = +[NTKComplication anyComplicationOfType:1];
        if ([*(id *)(a1 + 32) supportsUrsa])
        {
          v10 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.compass" appBundleIdentifier:@"com.apple.NanoCompass.watchkitapp" complicationDescriptor:0];
          id v11 = v10;
          if (v10)
          {
            id v12 = v10;

            v9 = v12;
          }
        }
        uint64_t v13 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.temperature" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
        id v83 = (void *)v13;
        uint64_t v14 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.depth" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
        long long v76 = (void *)v14;
        v108[0] = @"top";
        v15 = _complicationOrDie(v9);
        v109[0] = v15;
        v108[1] = @"center";
        if ([*(id *)(a1 + 32) supportsCharon]) {
          v16 = (void *)v13;
        }
        else {
          v16 = v7;
        }
        int v17 = _complicationOrDie(v16);
        v109[1] = v17;
        v108[2] = @"bottom";
        if ([*(id *)(a1 + 32) supportsCharon]) {
          uint64_t v18 = (void *)v14;
        }
        else {
          uint64_t v18 = (void *)v8;
        }
        _complicationOrDie(v18);
        v19 = (void *)v8;
        v21 = uint64_t v20 = v7;
        v109[2] = v21;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:3];
        v23 = v22 = v9;

        id v7 = v20;
LABEL_24:
        v24 = 0;
        uint64_t v25 = 1;
LABEL_40:
        [v6 _setFaceGalleryComplicationTypesForSlots:v24 canRepeat:1];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_137;
        v88[3] = &unk_1E62C2A58;
        id v68 = v6;
        id v89 = v68;
        [v23 enumerateKeysAndObjectsUsingBlock:v88];
        long long v69 = +[NTKDualTimeStyleEditOption optionWithStyle:v25 forDevice:*(void *)(a1 + 32)];
        [v68 selectOption:v69 forCustomEditMode:15 slot:0];
        [v68 selectOption:v5 forCustomEditMode:10 slot:0];
        [v68 selectOption:*(void *)(a1 + 40) forCustomEditMode:17 slot:0];
        [*(id *)(a1 + 48) addObject:v68];

        break;
    }
  }
}

uint64_t __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

void __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_146(uint64_t a1, void *a2, uint64_t a3)
{
  v51[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = +[NTKFace defaultFaceOfStyle:34 forDevice:*(void *)(a1 + 32)];
  if (v6)
  {
    switch(a3)
    {
      case 0:
        v50[0] = @"top";
        v50[1] = @"center";
        v51[0] = &unk_1F16E9850;
        v51[1] = &unk_1F16E9868;
        v50[2] = @"bottom";
        v51[2] = &unk_1F16E9880;
        id v7 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v8 = v51;
        v9 = v50;
        goto LABEL_19;
      case 1:
        v48[0] = @"top";
        v48[1] = @"center";
        v49[0] = &unk_1F16E9898;
        v49[1] = &unk_1F16E98B0;
        v48[2] = @"bottom";
        v49[2] = &unk_1F16E98C8;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = v49;
        v16 = v48;
        goto LABEL_12;
      case 2:
        v46[0] = @"top";
        v46[1] = @"center";
        v47[0] = &unk_1F16E98E0;
        v47[1] = &unk_1F16E98F8;
        v46[2] = @"bottom";
        v47[2] = &unk_1F16E9910;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = v47;
        v16 = v46;
        goto LABEL_12;
      case 3:
        v44[0] = @"top";
        v44[1] = @"center";
        v45[0] = &unk_1F16E9928;
        v45[1] = &unk_1F16E9940;
        v44[2] = @"bottom";
        v45[2] = &unk_1F16E9958;
        id v7 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v8 = v45;
        v9 = v44;
        goto LABEL_19;
      case 4:
        v42[0] = @"top";
        v42[1] = @"center";
        v43[0] = &unk_1F16E9970;
        v43[1] = &unk_1F16E9988;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
        if (![*(id *)(a1 + 32) supportsUrsa]) {
          goto LABEL_13;
        }
        uint64_t v17 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.compass.bearing" appBundleIdentifier:@"com.apple.NanoCompass.watchkitapp" complicationDescriptor:0];
        uint64_t v18 = (void *)v17;
        if (v17)
        {
          v40 = @"bottom";
          uint64_t v41 = v17;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        }
        else
        {
          id v12 = 0;
        }

        id v11 = 0;
        goto LABEL_14;
      case 5:
        v38[0] = @"top";
        v38[1] = @"center";
        v39[0] = &unk_1F16E99A0;
        v39[1] = &unk_1F16E99B8;
        v38[2] = @"bottom";
        v39[2] = &unk_1F16E99D0;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = v39;
        v16 = v38;
LABEL_12:
        uint64_t v13 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:3];
LABEL_13:
        id v11 = 0;
        id v12 = 0;
LABEL_14:
        uint64_t v10 = 1;
        goto LABEL_21;
      case 6:
        if (NTKShowCarbonara(*(void **)(a1 + 32)))
        {
          id v19 = objc_alloc(MEMORY[0x1E4F19AF8]);
          uint64_t v20 = NTKCarbonaraWidgetIntent();
          v21 = (void *)[v19 initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.HomeEnergyUI.EnergyForecastComplication" intent:v20];

          v22 = +[NTKWidgetComplication complicationWithDescriptor:v21];
          uint64_t v36 = @"bottom";
          v37 = v22;
          id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          v34[0] = @"top";
          v34[1] = @"center";
          v35[0] = &unk_1F16E99E8;
          v35[1] = &unk_1F16E9A00;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

          uint64_t v10 = 0;
        }
        else
        {
          v32[0] = @"top";
          v32[1] = @"center";
          v33[0] = &unk_1F16E9A18;
          v33[1] = &unk_1F16E9A30;
          v32[2] = @"bottom";
          v33[2] = &unk_1F16E9A48;
          id v7 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v8 = v33;
          v9 = v32;
LABEL_19:
          uint64_t v13 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:3];
          uint64_t v10 = 0;
          id v11 = 0;
        }
        id v12 = 0;
LABEL_21:
        [v6 _setFaceGalleryComplicationTypesForSlots:v13 canRepeat:1];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_256;
        v28[3] = &unk_1E62C2AA8;
        id v23 = v6;
        id v29 = v23;
        [v12 enumerateKeysAndObjectsUsingBlock:v28];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_258;
        v26[3] = &unk_1E62C2AD0;
        id v24 = v23;
        id v27 = v24;
        [v11 enumerateKeysAndObjectsUsingBlock:v26];
        uint64_t v25 = +[NTKDualTimeStyleEditOption optionWithStyle:v10 forDevice:*(void *)(a1 + 32)];
        [v24 selectOption:v25 forCustomEditMode:15 slot:0];
        [v24 selectOption:v5 forCustomEditMode:10 slot:0];
        [v24 selectOption:*(void *)(a1 + 40) forCustomEditMode:17 slot:0];
        [*(id *)(a1 + 48) addObject:v24];

        break;
      case 7:
        v30[0] = @"top";
        v30[1] = @"center";
        v31[0] = &unk_1F16E9A60;
        v31[1] = &unk_1F16E9A78;
        v30[2] = @"bottom";
        v31[2] = &unk_1F16E9A90;
        id v7 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v8 = v31;
        v9 = v30;
        goto LABEL_19;
      default:
        uint64_t v10 = 0;
        id v11 = 0;
        id v12 = 0;
        uint64_t v13 = 0;
        goto LABEL_21;
    }
  }
}

uint64_t __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_256(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

uint64_t __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

@end