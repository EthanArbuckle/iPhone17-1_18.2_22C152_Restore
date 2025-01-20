@interface UISnapshotViewRectBlock
@end

@implementation UISnapshotViewRectBlock

void ___UISnapshotViewRectBlock_block_invoke(uint64_t a1)
{
  v29[8] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) layer];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F3A538];
  v29[0] = *MEMORY[0x1E4F3A558];
  uint64_t v5 = *MEMORY[0x1E4F3A4F8];
  v28[0] = v4;
  v28[1] = v5;
  v25 = [v3 _screen];
  v24 = [v25 _name];
  v29[1] = v24;
  v28[2] = *MEMORY[0x1E4F3A4E0];
  v6 = NSNumber;
  v7 = [v2 context];
  v8 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "contextId"));
  v29[2] = v8;
  v28[3] = *MEMORY[0x1E4F3A530];
  v26 = v2;
  v9 = [NSNumber numberWithUnsignedLongLong:v2];
  v29[3] = v9;
  v28[4] = *MEMORY[0x1E4F3A4F0];
  v10 = NSNumber;
  v11 = [*(id *)(a1 + 40) _layer];
  v12 = [v11 _slotId];
  v13 = objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v12, "value"));
  v29[4] = v13;
  v28[5] = *MEMORY[0x1E4F3A588];
  long long v14 = *(_OWORD *)(a1 + 128);
  v27[4] = *(_OWORD *)(a1 + 112);
  v27[5] = v14;
  long long v15 = *(_OWORD *)(a1 + 160);
  v27[6] = *(_OWORD *)(a1 + 144);
  v27[7] = v15;
  long long v16 = *(_OWORD *)(a1 + 64);
  v27[0] = *(_OWORD *)(a1 + 48);
  v27[1] = v16;
  long long v17 = *(_OWORD *)(a1 + 96);
  v27[2] = *(_OWORD *)(a1 + 80);
  v27[3] = v17;
  v18 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v27];
  uint64_t v19 = *MEMORY[0x1E4F3A578];
  v29[5] = v18;
  v29[6] = MEMORY[0x1E4F1CC38];
  uint64_t v20 = *MEMORY[0x1E4F3A528];
  v28[6] = v19;
  v28[7] = v20;
  v29[7] = MEMORY[0x1E4F1CC38];
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];
  v22 = -[UIView _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v3, v21);

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    v23 = [*(id *)(a1 + 40) _layer];
    [v23 _setSlotId:0];
  }
  objc_msgSend(*(id *)(a1 + 40), "setAccessibilityIgnoresInvertColors:", objc_msgSend(*(id *)(a1 + 32), "accessibilityIgnoresInvertColors"));
}

@end