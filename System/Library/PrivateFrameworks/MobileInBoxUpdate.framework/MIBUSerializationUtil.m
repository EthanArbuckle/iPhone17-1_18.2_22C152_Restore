@interface MIBUSerializationUtil
+ (id)maxLengthForTag:(id)a3;
+ (id)tagLengthMapping;
+ (id)tagTypeMapping;
+ (id)typeForTag:(id)a3;
+ (id)typeLengthMapping;
@end

@implementation MIBUSerializationUtil

+ (id)typeLengthMapping
{
  if (typeLengthMapping_onceToken != -1) {
    dispatch_once(&typeLengthMapping_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)typeLengthMapping_typeLengthMapping;

  return v2;
}

void __42__MIBUSerializationUtil_typeLengthMapping__block_invoke()
{
  v3[5] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E53E0D0;
  v2[1] = &unk_26E53E100;
  v3[0] = &unk_26E53E0E8;
  v3[1] = &unk_26E53E0E8;
  v2[2] = &unk_26E53E118;
  v2[3] = &unk_26E53E130;
  v3[2] = &unk_26E53E0E8;
  v3[3] = &unk_26E53E148;
  v2[4] = &unk_26E53E148;
  v3[4] = &unk_26E53E0D0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)typeLengthMapping_typeLengthMapping;
  typeLengthMapping_typeLengthMapping = v0;
}

+ (id)tagTypeMapping
{
  if (tagTypeMapping_onceToken != -1) {
    dispatch_once(&tagTypeMapping_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)tagTypeMapping_tagTypeMapping;

  return v2;
}

void __39__MIBUSerializationUtil_tagTypeMapping__block_invoke()
{
  v3[60] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E53E0D0;
  v2[1] = &unk_26E53E100;
  v3[0] = &unk_26E53E160;
  v3[1] = &unk_26E53E0D0;
  v2[2] = &unk_26E53E130;
  v2[3] = &unk_26E53E148;
  v3[2] = &unk_26E53E0D0;
  v3[3] = &unk_26E53E0D0;
  v2[4] = &unk_26E53E160;
  void v2[5] = &unk_26E53E178;
  v3[4] = &unk_26E53E0D0;
  v3[5] = &unk_26E53E178;
  v2[6] = &unk_26E53E118;
  v2[7] = &unk_26E53E0E8;
  void v3[6] = &unk_26E53E148;
  v3[7] = &unk_26E53E148;
  v2[8] = &unk_26E53E190;
  v2[9] = &unk_26E53E1A8;
  v3[8] = &unk_26E53E178;
  v3[9] = &unk_26E53E100;
  v2[10] = &unk_26E53E1C0;
  v2[11] = &unk_26E53E1D8;
  v3[10] = &unk_26E53E0D0;
  v3[11] = &unk_26E53E160;
  v2[12] = &unk_26E53E1F0;
  v2[13] = &unk_26E53E208;
  v3[12] = &unk_26E53E160;
  v3[13] = &unk_26E53E130;
  v2[14] = &unk_26E53E220;
  v2[15] = &unk_26E53E238;
  v3[14] = &unk_26E53E160;
  v3[15] = &unk_26E53E100;
  v2[16] = &unk_26E53E250;
  v2[17] = &unk_26E53E268;
  v3[16] = &unk_26E53E100;
  v3[17] = &unk_26E53E130;
  v2[18] = &unk_26E53E280;
  v2[19] = &unk_26E53E298;
  v3[18] = &unk_26E53E100;
  v3[19] = &unk_26E53E100;
  v2[20] = &unk_26E53E2B0;
  v2[21] = &unk_26E53E2C8;
  v3[20] = &unk_26E53E178;
  v3[21] = &unk_26E53E130;
  v2[22] = &unk_26E53E2E0;
  v2[23] = &unk_26E53E2F8;
  v3[22] = &unk_26E53E100;
  v3[23] = &unk_26E53E100;
  v2[24] = &unk_26E53E310;
  v2[25] = &unk_26E53E328;
  v3[24] = &unk_26E53E160;
  v3[25] = &unk_26E53E160;
  v2[26] = &unk_26E53E340;
  v2[27] = &unk_26E53E358;
  v3[26] = &unk_26E53E160;
  v3[27] = &unk_26E53E130;
  v2[28] = &unk_26E53E370;
  v2[29] = &unk_26E53E388;
  v3[28] = &unk_26E53E0D0;
  v3[29] = &unk_26E53E160;
  v2[30] = &unk_26E53E3A0;
  v2[31] = &unk_26E53E3B8;
  v3[30] = &unk_26E53E160;
  v3[31] = &unk_26E53E148;
  v2[32] = &unk_26E53E3D0;
  v2[33] = &unk_26E53E3E8;
  v3[32] = &unk_26E53E178;
  v3[33] = &unk_26E53E178;
  v2[34] = &unk_26E53E400;
  v2[35] = &unk_26E53E418;
  v3[34] = &unk_26E53E178;
  v3[35] = &unk_26E53E178;
  v2[36] = &unk_26E53E430;
  v2[37] = &unk_26E53E448;
  v3[36] = &unk_26E53E178;
  v3[37] = &unk_26E53E178;
  v2[38] = &unk_26E53E460;
  v2[39] = &unk_26E53E478;
  v3[38] = &unk_26E53E178;
  v3[39] = &unk_26E53E178;
  v2[40] = &unk_26E53E490;
  v2[41] = &unk_26E53E4A8;
  v3[40] = &unk_26E53E148;
  v3[41] = &unk_26E53E178;
  v2[42] = &unk_26E53E4C0;
  v2[43] = &unk_26E53E4D8;
  v3[42] = &unk_26E53E178;
  v3[43] = &unk_26E53E118;
  v2[44] = &unk_26E53E4F0;
  v2[45] = &unk_26E53E508;
  v3[44] = &unk_26E53E160;
  v3[45] = &unk_26E53E118;
  v2[46] = &unk_26E53E520;
  v2[47] = &unk_26E53E538;
  v3[46] = &unk_26E53E118;
  v3[47] = &unk_26E53E118;
  v2[48] = &unk_26E53E550;
  v2[49] = &unk_26E53E568;
  v3[48] = &unk_26E53E0D0;
  v3[49] = &unk_26E53E0D0;
  v2[50] = &unk_26E53E580;
  v2[51] = &unk_26E53E598;
  v3[50] = &unk_26E53E0D0;
  v3[51] = &unk_26E53E118;
  v2[52] = &unk_26E53E5B0;
  v2[53] = &unk_26E53E5C8;
  v3[52] = &unk_26E53E118;
  v3[53] = &unk_26E53E160;
  v2[54] = &unk_26E53E5E0;
  v2[55] = &unk_26E53E5F8;
  v3[54] = &unk_26E53E160;
  v3[55] = &unk_26E53E160;
  v2[56] = &unk_26E53E610;
  v2[57] = &unk_26E53E628;
  v3[56] = &unk_26E53E160;
  v3[57] = &unk_26E53E0D0;
  v2[58] = &unk_26E53E640;
  v2[59] = &unk_26E53E658;
  v3[58] = &unk_26E53E148;
  v3[59] = &unk_26E53E100;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:60];
  v1 = (void *)tagTypeMapping_tagTypeMapping;
  tagTypeMapping_tagTypeMapping = v0;
}

+ (id)tagLengthMapping
{
  if (tagLengthMapping_onceToken != -1) {
    dispatch_once(&tagLengthMapping_onceToken, &__block_literal_global_123);
  }
  v2 = (void *)tagLengthMapping_tagLengthMapping;

  return v2;
}

void __41__MIBUSerializationUtil_tagLengthMapping__block_invoke()
{
  v3[27] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E53E0D0;
  v2[1] = &unk_26E53E178;
  v3[0] = &unk_26E53E1D8;
  v3[1] = &unk_26E53E328;
  v2[2] = &unk_26E53E190;
  v2[3] = &unk_26E53E1D8;
  v3[2] = &unk_26E53E670;
  v3[3] = &unk_26E53E688;
  v2[4] = &unk_26E53E1F0;
  void v2[5] = &unk_26E53E220;
  v3[4] = &unk_26E53E6A0;
  v3[5] = &unk_26E53E238;
  v2[6] = &unk_26E53E2B0;
  v2[7] = &unk_26E53E310;
  void v3[6] = &unk_26E53E298;
  v3[7] = &unk_26E53E238;
  v2[8] = &unk_26E53E328;
  v2[9] = &unk_26E53E340;
  v3[8] = &unk_26E53E238;
  v3[9] = &unk_26E53E238;
  v2[10] = &unk_26E53E388;
  v2[11] = &unk_26E53E3A0;
  v3[10] = &unk_26E53E688;
  v3[11] = &unk_26E53E6A0;
  v2[12] = &unk_26E53E3D0;
  v2[13] = &unk_26E53E3E8;
  v3[12] = &unk_26E53E0E8;
  v3[13] = &unk_26E53E0E8;
  v2[14] = &unk_26E53E400;
  v2[15] = &unk_26E53E418;
  v3[14] = &unk_26E53E0E8;
  v3[15] = &unk_26E53E0E8;
  v2[16] = &unk_26E53E430;
  v2[17] = &unk_26E53E448;
  v3[16] = &unk_26E53E0E8;
  v3[17] = &unk_26E53E0E8;
  v2[18] = &unk_26E53E460;
  v2[19] = &unk_26E53E478;
  v3[18] = &unk_26E53E0E8;
  v3[19] = &unk_26E53E0E8;
  v2[20] = &unk_26E53E4A8;
  v2[21] = &unk_26E53E4C0;
  v3[20] = &unk_26E53E0E8;
  v3[21] = &unk_26E53E0E8;
  v2[22] = &unk_26E53E4F0;
  v2[23] = &unk_26E53E5C8;
  v3[22] = &unk_26E53E4F0;
  v3[23] = &unk_26E53E4F0;
  v2[24] = &unk_26E53E5E0;
  v2[25] = &unk_26E53E5F8;
  v3[24] = &unk_26E53E328;
  v3[25] = &unk_26E53E4F0;
  v2[26] = &unk_26E53E610;
  v3[26] = &unk_26E53E4F0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:27];
  v1 = (void *)tagLengthMapping_tagLengthMapping;
  tagLengthMapping_tagLengthMapping = v0;
}

+ (id)typeForTag:(id)a3
{
  id v4 = a3;
  v5 = [a1 tagTypeMapping];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)maxLengthForTag:(id)a3
{
  id v4 = a3;
  v5 = [a1 tagTypeMapping];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [a1 typeLengthMapping];
    v8 = [v7 objectForKey:v6];

    if (!v8)
    {
      v9 = [a1 tagLengthMapping];
      v8 = [v9 objectForKey:v4];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end