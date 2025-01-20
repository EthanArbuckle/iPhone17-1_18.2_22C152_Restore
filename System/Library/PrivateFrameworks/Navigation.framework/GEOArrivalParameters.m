@interface GEOArrivalParameters
@end

@implementation GEOArrivalParameters

void __96__GEOArrivalParameters_MNExtras__regionContainmentTypeForLocation_arrivalRegionType_parameters___block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F0E35610, &unk_1F0E35628, &unk_1F0E35640, 0, &unk_1F0E355F8);
  v4[1] = &unk_1F0E35628;
  v5[0] = v0;
  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F0E35610, &unk_1F0E35640, 0);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)_MergedGlobals_48;
  _MergedGlobals_48 = v2;
}

@end