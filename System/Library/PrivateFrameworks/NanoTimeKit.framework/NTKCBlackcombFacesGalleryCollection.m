@interface NTKCBlackcombFacesGalleryCollection
+ (id)complicationTypesBySlot;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCBlackcombFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(@"FACE_STYLE_40_IN_TITLE_CASE", @"Meridian");
}

- (id)facesForDevice:(id)a3
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = 0;
  while (2)
  {
    v5 = +[NTKFace defaultFaceOfStyle:40 forDevice:v3];
    switch(v4)
    {
      case 0:
        v6 = +[NTKCBlackcombFacesGalleryCollection complicationTypesBySlot];
        char v10 = 0;
        uint64_t v9 = 200;
        uint64_t v11 = 1;
        goto LABEL_19;
      case 1:
        v32[0] = @"subdial-left";
        v32[1] = @"subdial-right";
        v33[0] = &unk_1F16E8CF8;
        v33[1] = &unk_1F16E8D10;
        v32[2] = @"subdial-bottom";
        v33[2] = &unk_1F16E8D28;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
        [v5 _setFaceGalleryComplicationTypesForSlots:v12];
        v13 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NoiseComplications" appBundleIdentifier:@"com.apple.Noise" complicationDescriptor:0];
        v14 = v5;
        v15 = v13;
        v16 = @"subdial-top";
        goto LABEL_7;
      case 2:
        v30[0] = @"subdial-top";
        v30[1] = @"subdial-left";
        v31[0] = &unk_1F16E8D40;
        v31[1] = &unk_1F16E8D58;
        v30[2] = @"subdial-right";
        v31[2] = &unk_1F16E8D70;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
        [v5 _setFaceGalleryComplicationTypesForSlots:v12];
        v13 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.weather.precipitation.chance" appBundleIdentifier:@"com.apple.weather.watchapp" complicationDescriptor:0];
        v14 = v5;
        v15 = v13;
        v16 = @"subdial-bottom";
LABEL_7:
        [v14 setComplication:v15 forSlot:v16];

        goto LABEL_8;
      case 3:
        v17 = +[NTKComplication allComplicationsOfType:5];
        unint64_t v18 = [v17 count];

        v28[0] = @"subdial-top";
        v28[1] = @"subdial-left";
        v29[0] = &unk_1F16E8D88;
        v29[1] = &unk_1F16E8DA0;
        v28[2] = @"subdial-right";
        v28[3] = @"subdial-bottom";
        v29[2] = &unk_1F16E8DB8;
        v29[3] = &unk_1F16E8DD0;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
        v20 = (void *)[v19 mutableCopy];
        v21 = v20;
        if (v18 < 2)
        {
          char v10 = 1;
          goto LABEL_17;
        }
        if (v18 == 2)
        {
          [v20 setObject:&unk_1F16E8DE8 forKeyedSubscript:@"subdial-top"];
          v20 = v21;
          v22 = &unk_1F16E8E00;
          v23 = @"subdial-bottom";
        }
        else
        {
          if (v18 != 3) {
            goto LABEL_16;
          }
          v22 = &unk_1F16E8E18;
          v23 = @"subdial-top";
        }
        [v20 setObject:v22 forKeyedSubscript:v23];
LABEL_16:
        char v10 = 0;
LABEL_17:
        v6 = (void *)[v21 copy];

LABEL_18:
        uint64_t v11 = 0;
        uint64_t v9 = 200;
LABEL_19:
        v24 = +[NTKBlackcombDialColorEditOption optionWithBlackcombDialColor:v11 forDevice:v3];
        [v5 selectOption:v24 forCustomEditMode:15 slot:0];

        v25 = +[NTKFaceColorEditOption optionWithFaceColor:v9 forDevice:v3];
        [v5 selectOption:v25 forCustomEditMode:10 slot:0];

        if (v6) {
          [v5 _setFaceGalleryComplicationTypesForSlots:v6 canRepeat:1];
        }
        if ((v10 & 1) == 0) {
          [v27 addObject:v5];
        }

        if (++v4 != 7) {
          continue;
        }

        return v27;
      case 4:
      case 5:
      case 6:
        v6 = +[NTKCBlackcombFacesGalleryCollection complicationTypesBySlot];
        v7 = +[NTKFaceColorEditOption standardColorValuesForDevice:v3];
        v8 = [v7 objectAtIndexedSubscript:v4 - 4];
        uint64_t v9 = [v8 integerValue];

        char v10 = 0;
        uint64_t v11 = 0;
        goto LABEL_19;
      default:
LABEL_8:
        char v10 = 0;
        v6 = 0;
        goto LABEL_18;
    }
  }
}

+ (id)complicationTypesBySlot
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"subdial-top";
  v4[1] = @"subdial-left";
  v5[0] = &unk_1F16E8E30;
  v5[1] = &unk_1F16E8E48;
  v4[2] = @"subdial-right";
  v4[3] = @"subdial-bottom";
  v5[2] = &unk_1F16E8E60;
  v5[3] = &unk_1F16E8E78;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end