@interface SVXAlarmAndTimerUtilities
- (BOOL)_isEndpoint:(id)a3;
- (BOOL)getIsSpeakable:(id)a3;
- (SVXAlarmAndTimerUtilities)init;
- (id)_alarmsListTextWithFiringAlarms:(id)a3 concatenationString:(id)a4 languageCode:(id)a5 preferences:(id)a6;
- (id)_getCalendarWithLocale:(id)a3;
- (id)_getDateFormatterWithLocale:(id)a3 calendar:(id)a4;
- (id)_getLocaleWithLanguageCode:(id)a3 preferences:(id)a4;
- (id)_textFromActiveTimersAndAlarms:(id)a3 orderedFiringAlarms:(id)a4 concatenationString:(id)a5;
- (id)_textFromFiringAlarms:(id)a3 alarmsListText:(id)a4 languageCode:(id)a5 gender:(int64_t)a6;
- (id)_textFromFiringTimers:(id)a3 timersListText:(id)a4 languageCode:(id)a5 gender:(int64_t)a6;
- (id)_timersListTextWithFiringTimers:(id)a3 concatenationString:(id)a4 languageCode:(id)a5 gender:(int64_t)a6;
- (id)createSpeechSynthesisRequestWithContext:(id)a3 instanceContext:(id)a4;
- (id)siriVOXFrameworkBundle;
@end

@implementation SVXAlarmAndTimerUtilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeFactory, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);

  objc_storeStrong((id *)&self->_bundleUtils, 0);
}

- (BOOL)_isEndpoint:(id)a3
{
  if (!a3)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[SVXAlarmAndTimerUtilities _isEndpoint:]"];
    [v4 handleFailureInFunction:v5, @"SVXAlarmAndTimerUtilities.m", 277, @"Invalid parameter not satisfying: %@", @"instanceContext != nil" file lineNumber description];
  }
  return 0;
}

- (id)_getDateFormatterWithLocale:(id)a3 calendar:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F08790];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setCalendar:v6];

  [v8 setLocale:v7];
  [v8 setDateStyle:0];
  [v8 setTimeStyle:1];

  return v8;
}

- (id)_getCalendarWithLocale:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  [v5 setLocale:v4];

  return v5;
}

- (id)_getLocaleWithLanguageCode:(id)a3 preferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXNSLocaleFactory *)self->_localeFactory canonicalLocaleIdentifierFromString:v6];
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = v6;
  }
  v10 = [(SVXNSLocaleFactory *)self->_localeFactory localeWithLocaleIdentifier:v9];
  if (!v10)
  {
    v10 = [(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils getLocaleWithAllowsFallback:1 preferences:v7];
  }

  return v10;
}

- (id)siriVOXFrameworkBundle
{
  return [(SVXBundleUtils *)self->_bundleUtils getSiriVOXFramework];
}

- (id)_textFromFiringAlarms:(id)a3 alarmsListText:(id)a4 languageCode:(id)a5 gender:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ((unint64_t)[v10 count] < 2)
  {
    if ([v10 count] != 1) {
      goto LABEL_9;
    }
    v15 = [v10 firstObject];
    v17 = [v15 title];
    uint64_t v18 = [v17 length];

    bundleUtils = self->_bundleUtils;
    v16 = [(SVXAlarmAndTimerUtilities *)self siriVOXFrameworkBundle];
    if (v18) {
      v20 = @"SIRI_VOX_FIRING_TITLED_ALARM_ANNOUNCEMENT_SINGLE";
    }
    else {
      v20 = @"SIRI_VOX_FIRING_UNTITLED_ALARM_ANNOUNCEMENT_SINGLE";
    }
    v21 = [(SVXBundleUtils *)bundleUtils getLocalizedStringWithBundle:v16 table:@"Clock" key:v20 languageCode:v12 gender:a6];
    objc_msgSend(v13, "appendFormat:", v21, v11);
  }
  else
  {
    v14 = self->_bundleUtils;
    v15 = [(SVXAlarmAndTimerUtilities *)self siriVOXFrameworkBundle];
    v16 = [(SVXBundleUtils *)v14 getLocalizedStringWithBundle:v15 table:@"Clock" key:@"SIRI_VOX_FIRING_ALARM_ANNOUNCEMENT_MULTI" languageCode:v12 gender:a6];
    objc_msgSend(v13, "appendFormat:", v16, v11);
  }

LABEL_9:

  return v13;
}

- (id)_textFromActiveTimersAndAlarms:(id)a3 orderedFiringAlarms:(id)a4 concatenationString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (__CFString *)a5;
  id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v7 count] == 1 && objc_msgSend(v8, "count") == 1)
  {
    id v11 = v10;
    id v12 = v9;
  }
  else
  {
    if ((![v7 count] || (unint64_t)objc_msgSend(v8, "count") <= 1)
      && ((unint64_t)[v7 count] < 2 || !objc_msgSend(v8, "count")))
    {
      goto LABEL_10;
    }
    id v12 = @" @{tts#\x1B\\pause=500\\} ";
    id v11 = v10;
  }
  [v11 appendString:v12];
LABEL_10:

  return v10;
}

- (id)_textFromFiringTimers:(id)a3 timersListText:(id)a4 languageCode:(id)a5 gender:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ((unint64_t)[v10 count] < 2)
  {
    if ([v10 count] != 1) {
      goto LABEL_9;
    }
    v15 = [v10 firstObject];
    v17 = [v15 title];
    uint64_t v18 = [v17 length];

    bundleUtils = self->_bundleUtils;
    v16 = [(SVXAlarmAndTimerUtilities *)self siriVOXFrameworkBundle];
    if (v18) {
      v20 = @"SIRI_VOX_FIRING_TITLED_TIMER_ANNOUNCEMENT_SINGLE";
    }
    else {
      v20 = @"SIRI_VOX_FIRING_UNTITLED_TIMER_ANNOUNCEMENT_SINGLE";
    }
    v21 = [(SVXBundleUtils *)bundleUtils getLocalizedStringWithBundle:v16 table:@"Clock" key:v20 languageCode:v12 gender:a6];
    objc_msgSend(v13, "appendFormat:", v21, v11);
  }
  else
  {
    v14 = self->_bundleUtils;
    v15 = [(SVXAlarmAndTimerUtilities *)self siriVOXFrameworkBundle];
    v16 = [(SVXBundleUtils *)v14 getLocalizedStringWithBundle:v15 table:@"Clock" key:@"SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_MULTI" languageCode:v12 gender:a6];
    objc_msgSend(v13, "appendFormat:", v16, v11);
  }

LABEL_9:

  return v13;
}

- (id)_alarmsListTextWithFiringAlarms:(id)a3 concatenationString:(id)a4 languageCode:(id)a5 preferences:(id)a6
{
  id v9 = a3;
  id v21 = a4;
  id v24 = a5;
  id v23 = a6;
  id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    v25 = v10;
    do
    {
      id v12 = [v9 objectAtIndexedSubscript:v11];
      if ((unint64_t)[v9 count] >= 2 && v11 == objc_msgSend(v9, "count") - 1) {
        [v10 appendString:v21];
      }
      id v13 = [v12 title];
      if ([v13 length])
      {
        [v10 appendString:v13];
      }
      else
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
        objc_msgSend(v14, "setHour:", objc_msgSend(v12, "hour"));
        objc_msgSend(v14, "setMinute:", objc_msgSend(v12, "minute"));
        v15 = [(SVXAlarmAndTimerUtilities *)self _getLocaleWithLanguageCode:v24 preferences:v23];
        v16 = [(SVXAlarmAndTimerUtilities *)self _getCalendarWithLocale:v15];
        v17 = [v16 dateFromComponents:v14];
        uint64_t v18 = [(SVXAlarmAndTimerUtilities *)self _getDateFormatterWithLocale:v15 calendar:v16];
        v19 = [v18 stringFromDate:v17];
        [v25 appendString:v19];

        id v10 = v25;
      }
      if ((unint64_t)[v9 count] >= 3 && v11 < objc_msgSend(v9, "count") - 2) {
        [v10 appendString:@" @{tts#\x1B\\pause=150\\} "];
      }

      ++v11;
    }
    while (v11 < [v9 count]);
  }

  return v10;
}

- (id)_timersListTextWithFiringTimers:(id)a3 concatenationString:(id)a4 languageCode:(id)a5 gender:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v9 count])
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = [v9 objectAtIndexedSubscript:v13];
      if ((unint64_t)[v9 count] >= 2 && v13 == objc_msgSend(v9, "count") - 1) {
        [v12 appendString:v10];
      }
      v15 = [v14 title];
      v16 = [v14 title];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        [v12 appendString:v15];
      }
      else
      {
        uint64_t v18 = objc_msgSend(v14, "svx_speakableDurationStringWithLanguageCode:gender:", v11, a6);
        [v12 appendString:v18];
      }
      if ((unint64_t)[v9 count] >= 3 && v13 < objc_msgSend(v9, "count") - 2) {
        [v12 appendString:@" @{tts#\x1B\\pause=150\\} "];
      }

      ++v13;
    }
    while (v13 < [v9 count]);
  }

  return v12;
}

- (id)createSpeechSynthesisRequestWithContext:(id)a3 instanceContext:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(SVXAlarmAndTimerUtilities *)self getIsSpeakable:v6])
  {
    v31 = [v6 orderedFiringAlarms];
    id v8 = [v6 orderedFiringTimers];
    id v29 = v7;
    if ([(SVXAlarmAndTimerUtilities *)self _isEndpoint:v7])
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x263F285A0]) initWithInstanceContext:v7];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263F285A0] sharedPreferences];
    }
    id v11 = (void *)v9;
    if (!v9)
    {
      v27 = [MEMORY[0x263F08690] currentHandler];
      v28 = [NSString stringWithUTF8String:"-[SVXAlarmAndTimerUtilities createSpeechSynthesisRequestWithContext:instanceContext:]"];
      [v27 handleFailureInFunction:v28, @"SVXAlarmAndTimerUtilities.m", 74, @"Invalid parameter not satisfying: %@", @"preferences != nil" file lineNumber description];
    }
    id v12 = [(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:1 preferences:v11];
    unint64_t v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[SVXAlarmAndTimerUtilities createSpeechSynthesisRequestWithContext:instanceContext:]";
      __int16 v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s outputVoiceInfo = %@", buf, 0x16u);
    }
    v30 = v11;
    id v14 = [v12 languageCode];
    uint64_t v15 = [v12 gender];
    if (!v15) {
      uint64_t v15 = [MEMORY[0x263F286E0] defaultGenderForOutputVoiceLanguageCode:v14];
    }
    int64_t v16 = [(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils getGenderFromVoiceGender:v15];
    id v17 = objc_alloc_init(MEMORY[0x263F089D8]);
    bundleUtils = self->_bundleUtils;
    v19 = [(SVXAlarmAndTimerUtilities *)self siriVOXFrameworkBundle];
    v20 = [(SVXBundleUtils *)bundleUtils getLocalizedStringWithBundle:v19 table:@"Clock" key:@"SIRI_VOX_FIRING_ALARM_OR_TIMER_ANNOUNCEMENT_CONCATENATION" languageCode:v14 gender:v16];

    id v21 = [(SVXAlarmAndTimerUtilities *)self _timersListTextWithFiringTimers:v8 concatenationString:v20 languageCode:v14 gender:v16];
    v22 = [(SVXAlarmAndTimerUtilities *)self _textFromFiringTimers:v8 timersListText:v21 languageCode:v14 gender:v16];
    [v17 appendString:v22];

    id v23 = [(SVXAlarmAndTimerUtilities *)self _textFromActiveTimersAndAlarms:v8 orderedFiringAlarms:v31 concatenationString:v20];
    [v17 appendString:v23];

    id v24 = [(SVXAlarmAndTimerUtilities *)self _alarmsListTextWithFiringAlarms:v31 concatenationString:v20 languageCode:v14 preferences:v30];
    v25 = [(SVXAlarmAndTimerUtilities *)self _textFromFiringAlarms:v31 alarmsListText:v24 languageCode:v14 gender:v16];
    [v17 appendString:v25];

    if ([v17 length]) {
      id v10 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:1 speakableText:v17 speakableContext:0 localizationKey:0 presynthesizedAudio:0 streamID:0];
    }
    else {
      id v10 = 0;
    }

    id v7 = v29;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)getIsSpeakable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 orderedFiringAlarms];
  v5 = [v3 orderedFiringTimers];
  char v6 = [v3 hasOtherRunningTimers];

  if ([v4 count] || objc_msgSend(v5, "count"))
  {
    uint64_t v7 = [v4 count];
    if ([v5 count] + v7 == 1 && (objc_msgSend(v5, "count") ? (char v8 = v6) : (char v8 = 0), (v8 & 1) == 0))
    {
      id v10 = [v4 firstObject];
      id v11 = [v10 title];
      if ([v11 length])
      {
        BOOL v9 = 1;
      }
      else
      {
        id v12 = [v5 firstObject];
        unint64_t v13 = [v12 title];
        BOOL v9 = [v13 length] != 0;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (SVXAlarmAndTimerUtilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)SVXAlarmAndTimerUtilities;
  v2 = [(SVXAlarmAndTimerUtilities *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[SVXBundleUtils sharedInstance];
    bundleUtils = v2->_bundleUtils;
    v2->_bundleUtils = (SVXBundleUtils *)v3;

    v5 = objc_alloc_init(SVXSpeechSynthesisUtils);
    speechSynthesisUtils = v2->_speechSynthesisUtils;
    v2->_speechSynthesisUtils = v5;

    uint64_t v7 = objc_alloc_init(SVXNSLocaleFactory);
    localeFactory = v2->_localeFactory;
    v2->_localeFactory = v7;
  }
  return v2;
}

@end