@interface AFClockTimer(SVXSpeechSynthesis)
- (SVXBundleUtils)_getBundleUtils;
- (id)svx_speakableDurationStringWithLanguageCode:()SVXSpeechSynthesis gender:;
@end

@implementation AFClockTimer(SVXSpeechSynthesis)

- (SVXBundleUtils)_getBundleUtils
{
  return +[SVXBundleUtils sharedInstance];
}

- (id)svx_speakableDurationStringWithLanguageCode:()SVXSpeechSynthesis gender:
{
  id v6 = a3;
  [a1 duration];
  unint64_t v8 = (unint64_t)v7;
  unint64_t v9 = (unint64_t)v7 / 0x3C;
  unint64_t v10 = (unint64_t)(v7 / 60.0) % 0x3C;
  unint64_t v11 = (unint64_t)(v7 / 3600.0);
  v12 = [a1 _getBundleUtils];
  uint64_t v13 = [v12 getSiriVOXFramework];
  v55 = (void *)v13;
  v56 = v12;
  if (v11)
  {
    uint64_t v14 = v13;
    unint64_t v52 = v9;
    v15 = NSString;
    [NSNumber numberWithUnsignedInteger:v11];
    v16 = unint64_t v53 = v10;
    v17 = [v15 stringWithFormat:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_UNIT_HOUR_%@", v16];

    uint64_t v18 = v14;
    v19 = v6;
    uint64_t v20 = a4;
    v21 = [v12 getLocalizedStringWithBundle:v18 table:@"Clock" key:v17 languageCode:v6 gender:a4];
    v22 = NSString;
    v23 = [NSNumber numberWithUnsignedInteger:v11];
    uint64_t v54 = objc_msgSend(v22, "stringWithFormat:", v21, v23);

    unint64_t v10 = v53;
    unint64_t v9 = v52;
  }
  else
  {
    uint64_t v20 = a4;
    v19 = v6;
    uint64_t v54 = 0;
  }
  unint64_t v24 = v8 - 60 * v9;
  if (v10)
  {
    unint64_t v25 = v10;
    v26 = NSString;
    v27 = [NSNumber numberWithUnsignedInteger:v25];
    v28 = [v26 stringWithFormat:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_UNIT_MINUTE_%@", v27];

    v29 = [v56 getLocalizedStringWithBundle:v55 table:@"Clock" key:v28 languageCode:v19 gender:v20];
    v30 = NSString;
    v31 = [NSNumber numberWithUnsignedInteger:v25];
    uint64_t v32 = objc_msgSend(v30, "stringWithFormat:", v29, v31);

    if (v24) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if (v24) {
      goto LABEL_12;
    }
  }
  BOOL v33 = v32 != 0;
  if (!(v54 | v32))
  {
LABEL_12:
    v36 = NSString;
    v37 = [NSNumber numberWithUnsignedInteger:v24];
    v38 = [v36 stringWithFormat:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_UNIT_SECOND_%@", v37];

    v39 = [v56 getLocalizedStringWithBundle:v55 table:@"Clock" key:v38 languageCode:v19 gender:v20];
    v40 = NSString;
    v41 = [NSNumber numberWithUnsignedInteger:v24];
    v35 = objc_msgSend(v40, "stringWithFormat:", v39, v41);

    v34 = (void *)v54;
    BOOL v42 = v54 != 0;
    BOOL v33 = v32 != 0;
    if (!v32) {
      BOOL v42 = 0;
    }
    if (v42 && v35)
    {
      v43 = v55;
      v44 = v56;
      v45 = [v56 getLocalizedStringWithBundle:v55 table:@"Clock" key:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_HOURS_MINUTES_SECONDS" languageCode:v19 gender:v20];
      v46 = NSString;
      v51 = v35;
LABEL_19:
      v50 = (void *)v32;
LABEL_20:
      objc_msgSend(v46, "stringWithFormat:", v45, v34, v50, v51);
      v47 = LABEL_21:;

      goto LABEL_22;
    }
    if (v42)
    {
LABEL_18:
      v43 = v55;
      v44 = v56;
      v45 = [v56 getLocalizedStringWithBundle:v55 table:@"Clock" key:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_HOURS_MINUTES" languageCode:v19 gender:v20];
      v46 = NSString;
      goto LABEL_19;
    }
    v43 = v55;
    v44 = v56;
    if (v54 && v35)
    {
      v45 = [v56 getLocalizedStringWithBundle:v55 table:@"Clock" key:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_HOURS_SECONDS" languageCode:v19 gender:v20];
      v46 = NSString;
      v50 = v35;
      goto LABEL_20;
    }
    if (v32 && v35)
    {
      v45 = [v56 getLocalizedStringWithBundle:v55 table:@"Clock" key:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_MINUTES_SECONDS" languageCode:v19 gender:v20];
      objc_msgSend(NSString, "stringWithFormat:", v45, v32, v35, v51);
      goto LABEL_21;
    }
    if (v54) {
      goto LABEL_34;
    }
LABEL_36:
    if (v33)
    {
      id v49 = (id)v32;
    }
    else
    {
      id v49 = v35;
      v35 = v49;
    }
    goto LABEL_39;
  }
  v34 = (void *)v54;
  if (v54 && v32)
  {
    v35 = 0;
    goto LABEL_18;
  }
  v35 = 0;
  if (!v54)
  {
    v43 = v55;
    v44 = v56;
    goto LABEL_36;
  }
  v43 = v55;
  v44 = v56;
LABEL_34:
  id v49 = v34;
LABEL_39:
  v47 = v49;
LABEL_22:

  return v47;
}

@end