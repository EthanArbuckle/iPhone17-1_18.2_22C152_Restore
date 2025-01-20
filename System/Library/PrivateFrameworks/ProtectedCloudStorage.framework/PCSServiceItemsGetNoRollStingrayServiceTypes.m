@interface PCSServiceItemsGetNoRollStingrayServiceTypes
@end

@implementation PCSServiceItemsGetNoRollStingrayServiceTypes

void ___PCSServiceItemsGetNoRollStingrayServiceTypes_block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v3[0] = kPCSServiceRaw;
  v3[1] = kPCSServiceMaster;
  v3[2] = kPCSServiceEscrow;
  v3[3] = kPCSServiceFDE;
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithArray:v0];
  v2 = (void *)_PCSServiceItemsGetNoRollStingrayServiceTypes_noRoll;
  _PCSServiceItemsGetNoRollStingrayServiceTypes_noRoll = v1;
}

@end