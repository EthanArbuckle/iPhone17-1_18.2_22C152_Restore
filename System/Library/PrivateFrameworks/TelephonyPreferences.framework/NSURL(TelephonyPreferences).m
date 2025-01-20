@interface NSURL(TelephonyPreferences)
+ (id)tps_telephonyTapToRadarURLForError:()TelephonyPreferences;
@end

@implementation NSURL(TelephonyPreferences)

+ (id)tps_telephonyTapToRadarURLForError:()TelephonyPreferences
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];

  v6 = [v3 localizedFailureReason];

  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Other Bug"];
    [v8 addObject:v9];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"230851"];

    [v8 addObject:v10];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"Telephony"];

    [v8 addObject:v11];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"iOS"];

    [v8 addObject:v12];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"DeviceClasses" value:@"iPhone"];

    [v8 addObject:v13];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"Always"];

    [v8 addObject:v14];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v6];

    [v8 addObject:v15];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Description" value:v5];

    [v8 addObject:v16];
    [v7 setScheme:@"tap-to-radar"];
    [v7 setHost:@"new"];
    [v7 setQueryItems:v8];
    v17 = [v7 URL];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end