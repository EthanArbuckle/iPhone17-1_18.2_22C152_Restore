@interface PBFSnapshotDefinitionSupportedOrientationForDeviceClass
@end

@implementation PBFSnapshotDefinitionSupportedOrientationForDeviceClass

void ___PBFSnapshotDefinitionSupportedOrientationForDeviceClass_block_invoke()
{
  uint64_t v0 = 0;
  while (1)
  {
    v1 = [MEMORY[0x1E4F28E60] indexSet];
    id v8 = v1;
    if (v0 == 1)
    {
      [v1 addIndex:4];
      [v8 addIndex:4];
      [v8 addIndex:3];
      [v8 addIndex:1];
      uint64_t v2 = 2;
      v3 = &_PBFSnapshotDefinitionSupportedOrientationForDeviceClass_padSupportedOrientations;
LABEL_7:
      [v8 addIndex:v2];
      uint64_t v4 = [v8 copy];
      v5 = (void *)*v3;
      uint64_t *v3 = v4;

      goto LABEL_8;
    }
    [v1 addIndex:1];
    uint64_t v2 = 1;
    v3 = &_PBFSnapshotDefinitionSupportedOrientationForDeviceClass_phoneSupportedOrientations;
    if (!v0) {
      goto LABEL_7;
    }
    if (v0 == 2) {
      break;
    }
LABEL_8:

    if (++v0 == 3) {
      return;
    }
  }
  [v8 addIndex:1];
  uint64_t v6 = [v8 copy];
  v7 = (void *)_PBFSnapshotDefinitionSupportedOrientationForDeviceClass_tvSupportedOrientations;
  _PBFSnapshotDefinitionSupportedOrientationForDeviceClass_tvSupportedOrientations = v6;
}

@end