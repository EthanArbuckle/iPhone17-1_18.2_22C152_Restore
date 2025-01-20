@interface PPConstants
+ (id)groupIds;
@end

@implementation PPConstants

+ (id)groupIds
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.proactive.PersonalizationPortrait.HealthKitDonation";
  v4[1] = @"com.apple.proactive.PersonalizationPortrait.Maps.Collections";
  v4[2] = @"com.apple.proactive.PersonalizationPortrait.Maps.PinnedPlaces";
  v4[3] = @"com.apple.proactive.PersonalizationPortrait.Maps.Interactions";
  v4[4] = @"com.apple.proactive.PersonalizationPortrait.Notifications";
  v4[5] = @"com.apple.proactive.PersonalizationPortrait.NowPlayingDonation";
  v4[6] = @"com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation";
  v4[7] = @"com.apple.proactive.PersonalizationPortrait.PhotosOneUpDonation";
  v4[8] = @"com.apple.proactive.PersonalizationPortrait.pptool";
  v4[9] = @"com.apple.proactive.PersonalizationPortrait.SiriDonation";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  return v2;
}

@end