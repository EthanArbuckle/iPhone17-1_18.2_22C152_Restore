@interface NRFConfig
- (NRFConfig)initWithDefaults:(id)a3;
- (void)dealloc;
@end

@implementation NRFConfig

- (NRFConfig)initWithDefaults:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NRFConfig;
  v5 = [(NRFConfig *)&v27 init];
  v6 = v5;
  if (v5)
  {
    int v7 = 1;
    *((_DWORD *)v5 + 7) = 1;
    *((_DWORD *)v5 + 5) = 2;
    *((void *)v5 + 1) = 0;
    v5[16] = 1;
    *(_WORD *)(v5 + 33) = 256;
    *((_DWORD *)v5 + 9) = 2;
    *((_WORD *)v5 + 20) = 257;
    v5[42] = 0;
    *((_DWORD *)v5 + 11) = -1;
    v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7A0]];
    v9 = v8;
    if (v8) {
      int v7 = [v8 integerValue];
    }
    *((_DWORD *)v6 + 12) = v7;
    v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F798]];

    if (v10) {
      int v11 = [v10 integerValue];
    }
    else {
      int v11 = 2;
    }
    *((_DWORD *)v6 + 13) = v11;
    v12 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F1F0]];

    if (v12) {
      int v13 = [v12 integerValue];
    }
    else {
      int v13 = 1;
    }
    *((_DWORD *)v6 + 14) = v13;
    v14 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7A8]];

    if (v14) {
      char v15 = [v14 BOOLValue];
    }
    else {
      char v15 = 0;
    }
    v6[60] = v15;
    v6[61] = 1;
    v16 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7D0]];
    v6[62] = [v16 BOOLValue];

    v17 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7C0]];
    v18 = [v17 objectForKeyedSubscript:&unk_270E983F8];
    v6[63] = v18 != 0;

    v19 = [v17 objectForKeyedSubscript:&unk_270E98410];
    v6[65] = v19 != 0;

    *(_WORD *)(v6 + 73) = 1;
    *((_DWORD *)v6 + 20) = 0;
    int v20 = FigCapturePlatformIdentifier();
    int v21 = FigCapturePlatformChipRevisionIdentifier();
    BOOL v23 = v20 == 9 && v21 == 0;
    v6[84] = v23;
    v6[85] = 0;
    *((_DWORD *)v6 + 22) = 1065353216;
    v6[92] = 0;
    *((_DWORD *)v6 + 24) = 4;
    v6[100] = 0;
    v6[32] = 1;
    v6[106] = 0;
    v24 = [v17 objectForKeyedSubscript:&unk_270E98428];
    v6[104] = v24 != 0;

    v25 = [v17 objectForKeyedSubscript:&unk_270E98440];
    v6[101] = v25 != 0;
  }
  return (NRFConfig *)v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NRFConfig;
  [(NRFConfig *)&v2 dealloc];
}

@end