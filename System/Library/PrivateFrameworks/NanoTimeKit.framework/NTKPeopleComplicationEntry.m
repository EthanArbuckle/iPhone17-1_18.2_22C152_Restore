@interface NTKPeopleComplicationEntry
+ (id)lockedEntry;
- (NSString)abbreviation;
- (NSString)fullName;
- (NTKPeopleComplicationEntry)initWithFullName:(id)a3 abbreviation:(id)a4 profileImage:(id)a5;
- (UIImage)profileImage;
- (id)templateForComplicationFamily:(int64_t)a3;
@end

@implementation NTKPeopleComplicationEntry

+ (id)lockedEntry
{
  v2 = NTKClockFaceLocalizedString(@"PEOPLE_LOCKED_FULL_NAME", @"------");
  v3 = NTKClockFaceLocalizedString(@"PEOPLE_LOCKED_ABBREVIATION", @"‒‒");
  v4 = [[NTKPeopleComplicationEntry alloc] initWithFullName:v2 abbreviation:v3 profileImage:0];

  return v4;
}

- (NTKPeopleComplicationEntry)initWithFullName:(id)a3 abbreviation:(id)a4 profileImage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NTKPeopleComplicationEntry;
  v12 = [(NTKPeopleComplicationEntry *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullName, a3);
    objc_storeStrong((id *)&v13->_abbreviation, a4);
    objc_storeStrong((id *)&v13->_profileImage, a5);
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [(NTKTimelineEntryModel *)v13 setEntryDate:v14];
  }
  return v13;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(NTKPeopleComplicationImageProvider);
  [(NTKPeopleComplicationImageProvider *)v5 setProfileImage:self->_profileImage];
  [(NTKPeopleComplicationImageProvider *)v5 setFullName:self->_fullName];
  [(NTKPeopleComplicationImageProvider *)v5 setNameAbbreviation:self->_abbreviation];
  if (*MEMORY[0x1E4F19648] == a3)
  {
    [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:2.0];
    [(NTKPeopleComplicationImageProvider *)v5 setFontSize:20.0];
    v6 = (void *)MEMORY[0x1E4F196F0];
LABEL_3:
    v7 = [v6 templateWithImageProvider:v5];
  }
  else
  {
    v7 = 0;
    switch(a3)
    {
      case 0:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:1.5];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:15.0];
        v6 = (void *)MEMORY[0x1E4F199B8];
        goto LABEL_3;
      case 2:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:1.0];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:10.5];
        v6 = (void *)MEMORY[0x1E4F19A08];
        goto LABEL_3;
      case 4:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:1.5];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:15.0];
        v6 = (void *)MEMORY[0x1E4F19720];
        goto LABEL_3;
      case 7:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:5.0];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:55.0];
        v6 = (void *)MEMORY[0x1E4F19798];
        goto LABEL_3;
      case 8:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:1.5];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:15.0];
        v8 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
        v33 = @"NTKPeopleComplicationImageProviderMetadataKey";
        v34[0] = v5;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        [v8 setMetadata:v9];

        id v10 = (void *)MEMORY[0x1E4F19840];
        goto LABEL_18;
      case 9:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:2.0];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:20.0];
        v8 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
        v27 = @"NTKPeopleComplicationImageProviderMetadataKey";
        v28 = v5;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        [v8 setMetadata:v11];

        v12 = [MEMORY[0x1E4F197E0] templateWithImageProvider:v8];
        v7 = [MEMORY[0x1E4F197B8] templateWithCircularTemplate:v12];

        goto LABEL_19;
      case 10:
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:2.0];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:20.0];
        v8 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
        v31 = @"NTKPeopleComplicationImageProviderMetadataKey";
        v32 = v5;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        [v8 setMetadata:v13];

        id v10 = (void *)MEMORY[0x1E4F197E0];
        goto LABEL_18;
      case 12:
        os_unfair_lock_lock((os_unfair_lock_t)&templateForComplicationFamily____lock);
        id WeakRetained = objc_loadWeakRetained(&templateForComplicationFamily____cachedDevice);
        if (!WeakRetained) {
          goto LABEL_16;
        }
        v15 = WeakRetained;
        id v16 = [MEMORY[0x1E4F19A30] currentDevice];
        id v17 = objc_loadWeakRetained(&templateForComplicationFamily____cachedDevice);
        if (v16 == v17)
        {
          v18 = [MEMORY[0x1E4F19A30] currentDevice];
          uint64_t v19 = [v18 version];
          uint64_t v20 = templateForComplicationFamily____previousCLKDeviceVersion;

          if (v19 == v20) {
            goto LABEL_17;
          }
        }
        else
        {
        }
LABEL_16:
        v21 = [MEMORY[0x1E4F19A30] currentDevice];
        objc_storeWeak(&templateForComplicationFamily____cachedDevice, v21);

        id v22 = objc_loadWeakRetained(&templateForComplicationFamily____cachedDevice);
        templateForComplicationFamily____previousCLKDeviceVersion = [v22 version];

        v23 = [MEMORY[0x1E4F19A30] currentDevice];
        CLKComplicationGraphicExtraLargeCircularScalingFactor();
        *(double *)&templateForComplicationFamily__graphicXLargeBorderWidth = v24 + v24;
        *(double *)&templateForComplicationFamily__graphicXLargeFontSize = v24 * 20.0;

LABEL_17:
        os_unfair_lock_unlock((os_unfair_lock_t)&templateForComplicationFamily____lock);
        [(NTKPeopleComplicationImageProvider *)v5 setBorderWidth:*(double *)&templateForComplicationFamily__graphicXLargeBorderWidth];
        [(NTKPeopleComplicationImageProvider *)v5 setFontSize:*(double *)&templateForComplicationFamily__graphicXLargeFontSize];
        v8 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
        v29 = @"NTKPeopleComplicationImageProviderMetadataKey";
        v30 = v5;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [v8 setMetadata:v25];

        id v10 = (void *)MEMORY[0x1E4F198B0];
LABEL_18:
        v7 = [v10 templateWithImageProvider:v8];
LABEL_19:

        break;
      default:
        break;
    }
  }

  return v7;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (UIImage)profileImage
{
  return self->_profileImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImage, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

@end