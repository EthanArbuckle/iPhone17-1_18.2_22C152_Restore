@interface ICCloudServerSupportedServiceGetNamesBidirectionalDictionary
@end

@implementation ICCloudServerSupportedServiceGetNamesBidirectionalDictionary

void ___ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F77960]);
  v4[0] = &unk_1EF640870;
  v4[1] = &unk_1EF640888;
  v5[0] = @"main";
  v5[1] = @"networkAvailability";
  v4[2] = &unk_1EF6408A0;
  v4[3] = &unk_1EF6408B8;
  v5[2] = @"cloud";
  v5[3] = @"cloudStatusMonitor";
  v4[4] = &unk_1EF6408D0;
  v4[5] = &unk_1EF6408E8;
  v5[4] = @"mediaUserStateCenterServer";
  v5[5] = @"playbackPosition";
  v4[6] = &unk_1EF640900;
  v5[6] = @"badging";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:7];
  uint64_t v2 = [v0 initWithDictionary:v1];
  v3 = (void *)_ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNames;
  _ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNames = v2;
}

@end