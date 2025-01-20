@interface NSDictionary(MNExtras)
+ (id)_navigation_serverStringDictionaryForDistance:()MNExtras validDistance:destination:spoken:useDisplayName:;
+ (id)_navigation_serverStringDictionaryForDistance:()MNExtras validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:;
+ (id)_navigation_serverStringDictionaryForMapItem:()MNExtras;
+ (id)_navigation_stringTokensForDirectionsError:()MNExtras waypoints:;
+ (id)_navigation_stringTokensForGenericCombinationsToken:()MNExtras waypoints:isSpokenString:;
@end

@implementation NSDictionary(MNExtras)

+ (id)_navigation_serverStringDictionaryForDistance:()MNExtras validDistance:destination:spoken:useDisplayName:
{
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a1 >= 0.0)
  {
    v13 = [NSNumber numberWithDouble:a1];
    [v12 setObject:v13 forKey:@"{distance}"];
  }
  if (a2 >= 0.0)
  {
    v14 = [NSNumber numberWithDouble:a2];
    [v12 setObject:v14 forKey:@"{valid_distance}"];
  }
  if (a6) {
    [v11 navAnnouncementName];
  }
  else {
  v15 = [v11 navDisplayNameWithSpecialContacts:0];
  }
  if ([v15 length]) {
    [v12 setObject:v15 forKey:@"{Name}"];
  }
  if (a6)
  {
    v16 = [v11 navAnnouncementAddress];
  }
  else
  {
    if (a7) {
      [v11 navDisplayName];
    }
    else {
    v16 = [v11 navDisplayAddress];
    }
  }
  v17 = v16;
  if ([v16 length]) {
    [v12 setObject:v17 forKey:@"{Address}"];
  }

  return v12;
}

+ (id)_navigation_serverStringDictionaryForDistance:()MNExtras validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:
{
  id v14 = a5;
  id v15 = a6;
  if ([v14 count])
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v17 = [v14 firstObject];
    [v16 setObject:v17 forKeyedSubscript:@"{fromOrigin}"];

    [v16 setObject:v15 forKeyedSubscript:@"{Destination}"];
    v18 = [v14 lastObject];
    [v16 setObject:v18 forKeyedSubscript:@"{toDestination}"];

    [v16 setObject:v15 forKeyedSubscript:@"{currentDestination}"];
    v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __146__NSDictionary_MNExtras___navigation_serverStringDictionaryForDistance_validDistance_waypoints_currentDestination_legIndex_spoken_useDisplayName___block_invoke;
    v22[3] = &unk_1E60FBD08;
    double v24 = a1;
    double v25 = a2;
    char v26 = a8;
    char v27 = a9;
    id v20 = v19;
    id v23 = v20;
    [v16 enumerateKeysAndObjectsUsingBlock:v22];
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  return v20;
}

+ (id)_navigation_stringTokensForDirectionsError:()MNExtras waypoints:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = objc_msgSend(v6, "content", 0);
  v10 = [v9 formatTokens];

  id v11 = (id)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v14 type] == 18)
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v15 = objc_msgSend(a1, "_navigation_stringTokensForGenericCombinationsToken:waypoints:isSpokenString:", v11, v7, 0);
  if (v15) {
    [v8 setObject:v15 forKeyedSubscript:@"{toDestination}"];
  }
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v16 forKeyedSubscript:@"{currentDestination}"];
  v17 = +[MNVirtualGarageManager sharedManager];
  v18 = [v17 lastVehicleName];

  if ([v18 length]) {
    [v16 setObject:v18 forKeyedSubscript:@"{VehicleName}"];
  }
  if ([v8 count]) {
    v19 = v8;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  return v20;
}

+ (id)_navigation_stringTokensForGenericCombinationsToken:()MNExtras waypoints:isSpokenString:
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 type] != 18) {
    goto LABEL_7;
  }
  v9 = [v7 genericCombinations];

  if (!v9) {
    goto LABEL_8;
  }
  if (([v7 waypointIndex] & 0x80000000) != 0
    || (int v10 = [v7 waypointIndex], v10 >= (int)objc_msgSend(v8, "count")))
  {
LABEL_7:
    v9 = 0;
  }
  else
  {
    id v11 = objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v7, "waypointIndex"));
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned int v17 = 0;
    if (a5) {
      [v11 navAnnouncementNameAndSubstituteType:&v17];
    }
    else {
    v13 = [v11 navDisplayNameWithSpecialContacts:0 substituteType:&v17];
    }
    if ([v13 length])
    {
      [v9 setObject:v13 forKeyedSubscript:@"{Name}"];
      id v14 = [NSNumber numberWithInt:v17];
      [v9 setObject:v14 forKeyedSubscript:@"{Name}_source"];
    }
    if (a5) {
      [v11 navAnnouncementAddress];
    }
    else {
    id v15 = [v11 navDisplayAddress];
    }
    if ([v15 length])
    {
      [v9 setObject:v15 forKeyedSubscript:@"{Address}"];
      [v9 setObject:&unk_1F0E356A0 forKeyedSubscript:@"{Address}_source"];
    }
    v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "waypointCategory"));
    [v9 setObject:v16 forKeyedSubscript:@"{WaypointCategory}"];
  }
LABEL_8:

  return v9;
}

+ (id)_navigation_serverStringDictionaryForMapItem:()MNExtras
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 geoAddress];
  int v5 = [v4 hasStructuredAddress];

  id v6 = &stru_1F0E08010;
  id v7 = &stru_1F0E08010;
  id v8 = &stru_1F0E08010;
  if (v5)
  {
    v9 = [v3 geoAddress];
    int v10 = [v9 structuredAddress];

    if ([v10 hasFullThoroughfare])
    {
      id v8 = [v10 fullThoroughfare];
    }
    else
    {
      id v8 = &stru_1F0E08010;
    }
    if ([v10 hasThoroughfare])
    {
      id v7 = [v10 thoroughfare];
    }
    else
    {
      id v7 = &stru_1F0E08010;
    }
  }
  uint64_t v11 = navDisplayNameForMapItem(v3, 1, 0);
  if (v11) {
    id v6 = (__CFString *)v11;
  }
  v14[0] = @"{Address}";
  v14[1] = @"{StreetName}";
  v15[0] = v8;
  v15[1] = v7;
  v14[2] = @"{Name}";
  v15[2] = v6;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

@end