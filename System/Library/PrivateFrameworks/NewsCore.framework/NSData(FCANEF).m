@interface NSData(FCANEF)
- (id)fc_anefDecryptWithKey:()FCANEF;
- (id)fc_anefEncryptWithKey:()FCANEF;
- (uint64_t)fc_anefKeyIsValid:()FCANEF;
@end

@implementation NSData(FCANEF)

- (id)fc_anefEncryptWithKey:()FCANEF
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(a1, "fc_anefKeyIsValid:", v4))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(a1, "length") + 28);
    v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "fc_randomDataWithLength:", 12);
    id v7 = v5;
    uint64_t v8 = [v7 mutableBytes];
    id v9 = v6;
    uint64_t v10 = [v9 bytes];
    int v11 = *(_DWORD *)(v10 + 8);
    *(void *)uint64_t v8 = *(void *)v10;
    *(_DWORD *)(v8 + 8) = v11;
    id v12 = v4;
    [v12 bytes];
    [v12 length];
    id v13 = v9;
    [v13 bytes];
    id v14 = a1;
    [v14 bytes];
    uint64_t v15 = [v14 length];
    id v16 = v7;
    uint64_t v23 = [v16 mutableBytes] + 12;
    int v17 = CCCryptorGCMOneshotEncrypt();
    id v18 = v16;
    uint64_t v19 = objc_msgSend(v18, "mutableBytes", v15, v23, &v29, 16);
    uint64_t v20 = [v14 length];
    *(_OWORD *)(v19 + v20 + 12) = v29;
    if (v17)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke_2;
      v24[3] = &unk_1E5B56380;
      int v26 = v17;
      v24[4] = v14;
      id v25 = v12;
      __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke_2((uint64_t)v24);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = v18;
    }
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke;
    v27[3] = &unk_1E5B4E868;
    v27[4] = a1;
    id v28 = v4;
    __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke((uint64_t)v27);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v21;
}

- (id)fc_anefDecryptWithKey:()FCANEF
{
  id v4 = a3;
  if (objc_msgSend(a1, "fc_anefKeyIsValid:", v4))
  {
    if ((unint64_t)[a1 length] < 0x1D)
    {
      id v12 = 0;
    }
    else
    {
      id v5 = a1;
      [v5 bytes];
      id v6 = v5;
      [v6 bytes];
      [v6 length];
      id v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v6, "length") - 28);
      id v8 = v4;
      [v8 bytes];
      [v8 length];
      id v9 = v6;
      [v9 bytes];
      [v9 length];
      id v10 = v7;
      [v10 mutableBytes];
      int v11 = CCCryptorGCMOneshotDecrypt();
      if (v11)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke_2;
        v14[3] = &unk_1E5B56380;
        int v16 = v11;
        v14[4] = v9;
        id v15 = v8;
        __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke_2((uint64_t)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = v10;
      }
    }
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke;
    v17[3] = &unk_1E5B4E868;
    v17[4] = a1;
    id v18 = v4;
    __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke((uint64_t)v17);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (uint64_t)fc_anefKeyIsValid:()FCANEF
{
  unint64_t v3 = [a3 length];
  return (v3 < 0x21) & (0x101010000uLL >> v3);
}

@end