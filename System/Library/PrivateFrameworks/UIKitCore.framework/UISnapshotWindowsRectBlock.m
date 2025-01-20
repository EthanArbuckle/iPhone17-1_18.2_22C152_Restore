@interface UISnapshotWindowsRectBlock
@end

@implementation UISnapshotWindowsRectBlock

void ___UISnapshotWindowsRectBlock_block_invoke(uint64_t a1)
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F3A538];
  v20[0] = *MEMORY[0x1E4F3A550];
  uint64_t v4 = *MEMORY[0x1E4F3A4F8];
  v19[0] = v3;
  v19[1] = v4;
  v5 = [v2 _name];
  v20[1] = v5;
  v19[2] = *MEMORY[0x1E4F3A4F0];
  v6 = NSNumber;
  v7 = [*(id *)(a1 + 40) _layer];
  v8 = [v7 _slotId];
  v9 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "value"));
  v19[3] = *MEMORY[0x1E4F3A4E8];
  uint64_t v10 = *(void *)(a1 + 48);
  v20[2] = v9;
  v20[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  v12 = *(void **)(a1 + 56);
  id v13 = v11;
  id v14 = v12;
  if ([v14 count])
  {
    v15 = (void *)[v13 mutableCopy];
    [v15 addEntriesFromDictionary:v14];
    id v16 = (id)[v15 copy];
  }
  else
  {
    id v16 = v13;
  }

  v17 = -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v2, v16);

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    v18 = [*(id *)(a1 + 40) _layer];
    [v18 _setSlotId:0];
  }
}

@end