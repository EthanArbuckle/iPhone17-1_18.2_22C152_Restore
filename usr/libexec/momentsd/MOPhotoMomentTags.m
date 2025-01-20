@interface MOPhotoMomentTags
+ (id)getCoarseInferenceTag:(id)a3;
+ (id)getInferenceTagMap;
@end

@implementation MOPhotoMomentTags

+ (id)getInferenceTagMap
{
  v4[0] = &off_1002F5B70;
  v4[1] = &off_1002F5B88;
  v5[0] = @"baby";
  v5[1] = @"pet";
  v4[2] = &off_1002F5BA0;
  v4[3] = &off_1002F5BB8;
  v5[2] = @"trip";
  v5[3] = @"nature";
  v4[4] = &off_1002F5BD0;
  v4[5] = &off_1002F5BE8;
  v5[4] = @"mountain";
  v5[5] = @"beach";
  v4[6] = &off_1002F5C00;
  v4[7] = &off_1002F5C18;
  v5[6] = @"home";
  v5[7] = @"work";
  v4[8] = &off_1002F5C30;
  v4[9] = &off_1002F5C48;
  v5[8] = @"frequentLocation";
  v5[9] = @"Activity";
  v4[10] = &off_1002F5C60;
  v4[11] = &off_1002F5C78;
  v5[10] = @"Hiking";
  v5[11] = @"Climbing";
  v4[12] = &off_1002F5C90;
  v4[13] = &off_1002F5CA8;
  v5[12] = @"Beaching";
  v5[13] = @"Diving";
  v4[14] = &off_1002F5CC0;
  v4[15] = &off_1002F5CD8;
  v5[14] = @"WinterSport";
  v5[15] = @"Entertainment";
  v4[16] = &off_1002F5CF0;
  v4[17] = &off_1002F5D08;
  v5[16] = @"AmusementPark";
  v5[17] = @"Performance";
  v4[18] = &off_1002F5D20;
  v4[19] = &off_1002F5D38;
  v5[18] = @"Concert";
  v5[19] = @"Festival";
  v4[20] = &off_1002F5D50;
  v4[21] = &off_1002F5D68;
  v5[20] = @"Theater";
  v5[21] = @"Dance";
  v4[22] = &off_1002F5D80;
  v4[23] = &off_1002F5D98;
  v5[22] = @"SportEvent";
  v5[23] = @"NightOut";
  v4[24] = &off_1002F5DB0;
  v4[25] = &off_1002F5DC8;
  v5[24] = @"Museum";
  v5[25] = @"Celebration";
  v4[26] = &off_1002F5DE0;
  v4[27] = &off_1002F5DF8;
  v5[26] = @"Birthday";
  v5[27] = @"Anniversary";
  v4[28] = &off_1002F5E10;
  v4[29] = &off_1002F5E28;
  v5[28] = @"Wedding";
  v5[29] = @"HolidayEvent";
  v4[30] = &off_1002F5E40;
  v5[30] = @"Gathering";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:31];

  return v2;
}

+ (id)getCoarseInferenceTag:(id)a3
{
  v7[0] = &off_1002F5C00;
  v7[1] = &off_1002F5C18;
  v8[0] = &off_1002F5E58;
  v8[1] = &off_1002F5E58;
  v7[2] = &off_1002F5C30;
  v7[3] = &off_1002F5D68;
  v8[2] = &off_1002F5E58;
  v8[3] = &off_1002F5E70;
  v7[4] = &off_1002F5D98;
  v7[5] = &off_1002F5E28;
  v8[4] = &off_1002F5E70;
  v8[5] = &off_1002F5E70;
  v7[6] = &off_1002F5E40;
  v7[7] = &off_1002F5CF0;
  v8[6] = &off_1002F5E70;
  v8[7] = &off_1002F5E88;
  v7[8] = &off_1002F5DB0;
  v7[9] = &off_1002F5D08;
  v8[8] = &off_1002F5E88;
  v8[9] = &off_1002F5E88;
  v7[10] = &off_1002F5D20;
  v7[11] = &off_1002F5D38;
  v8[10] = &off_1002F5E88;
  v8[11] = &off_1002F5E88;
  v7[12] = &off_1002F5D50;
  v7[13] = &off_1002F5BB8;
  v8[12] = &off_1002F5E88;
  v8[13] = &off_1002F5EA0;
  v7[14] = &off_1002F5BD0;
  v7[15] = &off_1002F5BE8;
  v8[14] = &off_1002F5EA0;
  v8[15] = &off_1002F5EA0;
  v7[16] = &off_1002F5DC8;
  v7[17] = &off_1002F5DE0;
  v8[16] = &off_1002F5EB8;
  v8[17] = &off_1002F5EB8;
  v7[18] = &off_1002F5DF8;
  v7[19] = &off_1002F5E10;
  v8[18] = &off_1002F5EB8;
  v8[19] = &off_1002F5EB8;
  v7[20] = &off_1002F5C48;
  v7[21] = &off_1002F5C60;
  v8[20] = &off_1002F5ED0;
  v8[21] = &off_1002F5ED0;
  v7[22] = &off_1002F5C78;
  v7[23] = &off_1002F5C90;
  v8[22] = &off_1002F5ED0;
  v8[23] = &off_1002F5ED0;
  v7[24] = &off_1002F5CA8;
  v7[25] = &off_1002F5CC0;
  v8[24] = &off_1002F5ED0;
  v8[25] = &off_1002F5ED0;
  v7[26] = &off_1002F5D80;
  v7[27] = &off_1002F5B70;
  v8[26] = &off_1002F5ED0;
  v8[27] = &off_1002F5EE8;
  v7[28] = &off_1002F5B88;
  v7[29] = &off_1002F5BA0;
  v8[28] = &off_1002F5EE8;
  v8[29] = &off_1002F5F00;
  v7[30] = &off_1002F5CD8;
  v8[30] = &off_1002F5F00;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:31];
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

@end