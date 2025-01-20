@interface VCUserActivityDonationFetcher
+ (id)streams;
@end

@implementation VCUserActivityDonationFetcher

+ (id)streams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end