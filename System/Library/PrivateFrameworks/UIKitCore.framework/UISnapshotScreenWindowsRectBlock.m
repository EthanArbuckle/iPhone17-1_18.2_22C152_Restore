@interface UISnapshotScreenWindowsRectBlock
@end

@implementation UISnapshotScreenWindowsRectBlock

void ___UISnapshotScreenWindowsRectBlock_block_invoke(uint64_t a1)
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F3A538];
  v21[0] = *MEMORY[0x1E4F3A560];
  uint64_t v4 = *MEMORY[0x1E4F3A4F8];
  v20[0] = v3;
  v20[1] = v4;
  v5 = [v2 _name];
  v21[1] = v5;
  v20[2] = *MEMORY[0x1E4F3A4F0];
  v6 = NSNumber;
  v7 = [*(id *)(a1 + 40) _layer];
  v8 = [v7 _slotId];
  v9 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "value"));
  v21[2] = v9;
  v20[3] = *MEMORY[0x1E4F3A588];
  long long v10 = *(_OWORD *)(a1 + 136);
  v19[4] = *(_OWORD *)(a1 + 120);
  v19[5] = v10;
  long long v11 = *(_OWORD *)(a1 + 168);
  v19[6] = *(_OWORD *)(a1 + 152);
  v19[7] = v11;
  long long v12 = *(_OWORD *)(a1 + 72);
  v19[0] = *(_OWORD *)(a1 + 56);
  v19[1] = v12;
  long long v13 = *(_OWORD *)(a1 + 104);
  v19[2] = *(_OWORD *)(a1 + 88);
  v19[3] = v13;
  v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v19];
  v20[4] = *MEMORY[0x1E4F3A4E8];
  uint64_t v15 = *(void *)(a1 + 48);
  v21[3] = v14;
  v21[4] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
  v17 = -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v2, v16);

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    v18 = [*(id *)(a1 + 40) _layer];
    [v18 _setSlotId:0];
  }
}

@end