@interface NSDictionary
@end

@implementation NSDictionary

void __146__NSDictionary_MNExtras___navigation_serverStringDictionaryForDistance_validDistance_waypoints_currentDestination_legIndex_spoken_useDisplayName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a2;
  v8 = [v6 dictionary];
  if (*(double *)(a1 + 40) >= 0.0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v8 setObject:v9 forKey:@"{distance}"];
  }
  if (*(double *)(a1 + 48) >= 0.0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v8 setObject:v10 forKey:@"{valid_distance}"];
  }
  unsigned int v16 = 0;
  if (*(unsigned char *)(a1 + 56)) {
    [v5 navAnnouncementNameAndSubstituteType:&v16];
  }
  else {
  v11 = [v5 navDisplayNameWithSpecialContacts:0 substituteType:&v16];
  }
  if ([v11 length])
  {
    [v8 setObject:v11 forKey:@"{Name}"];
    v12 = [NSNumber numberWithInt:v16];
    [v8 setObject:v12 forKey:@"{Name}_source"];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v13 = [v5 navAnnouncementAddress];
  }
  else
  {
    if (*(unsigned char *)(a1 + 57)) {
      [v5 navDisplayName];
    }
    else {
    v13 = [v5 navDisplayAddress];
    }
  }
  v14 = v13;
  if ([v13 length])
  {
    [v8 setObject:v14 forKey:@"{Address}"];
    [v8 setObject:&unk_1F0E356A0 forKey:@"{Address}_source"];
  }
  v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "waypointCategory"));
  [v8 setObject:v15 forKey:@"{WaypointCategory}"];

  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

@end