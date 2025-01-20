@interface UISnapshotLayerIdRectBlock
@end

@implementation UISnapshotLayerIdRectBlock

void ___UISnapshotLayerIdRectBlock_block_invoke(uint64_t a1)
{
  v24[8] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F3A538];
  v24[0] = *MEMORY[0x1E4F3A558];
  uint64_t v4 = *MEMORY[0x1E4F3A4F8];
  v23[0] = v3;
  v23[1] = v4;
  v5 = [v2 _name];
  v24[1] = v5;
  v23[2] = *MEMORY[0x1E4F3A4E0];
  v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 184)];
  v24[2] = v6;
  v23[3] = *MEMORY[0x1E4F3A530];
  v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v24[3] = v7;
  v23[4] = *MEMORY[0x1E4F3A4F0];
  v8 = NSNumber;
  v9 = [*(id *)(a1 + 40) _layer];
  v10 = [v9 _slotId];
  v11 = objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v10, "value"));
  v24[4] = v11;
  v23[5] = *MEMORY[0x1E4F3A588];
  long long v12 = *(_OWORD *)(a1 + 136);
  v22[4] = *(_OWORD *)(a1 + 120);
  v22[5] = v12;
  long long v13 = *(_OWORD *)(a1 + 168);
  v22[6] = *(_OWORD *)(a1 + 152);
  v22[7] = v13;
  long long v14 = *(_OWORD *)(a1 + 72);
  v22[0] = *(_OWORD *)(a1 + 56);
  v22[1] = v14;
  long long v15 = *(_OWORD *)(a1 + 104);
  v22[2] = *(_OWORD *)(a1 + 88);
  v22[3] = v15;
  v16 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v22];
  uint64_t v17 = *MEMORY[0x1E4F3A528];
  v24[5] = v16;
  v24[6] = MEMORY[0x1E4F1CC38];
  uint64_t v18 = *MEMORY[0x1E4F3A520];
  v23[6] = v17;
  v23[7] = v18;
  v24[7] = MEMORY[0x1E4F1CC38];
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v20 = -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v2, v19);

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    v21 = [*(id *)(a1 + 40) _layer];
    [v21 _setSlotId:0];
  }
}

@end