@interface SSQueryIntent
+ (id)intentStrengthString:(int)a3;
+ (id)intentString:(int)a3;
+ (int)intentStrength:(int)a3;
- (SSIntentBasedSectionConfiguration)sectionConfig;
- (SSIntentBasedSuggestionsConfiguration)suggestionConfig;
- (int)intentType;
- (void)setIntentType:(int)a3;
- (void)setSectionConfig:(id)a3;
- (void)setSuggestionConfig:(id)a3;
@end

@implementation SSQueryIntent

+ (id)intentString:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (intentString__onceToken != -1) {
    dispatch_once(&intentString__onceToken, &__block_literal_global_50);
  }
  v4 = (void *)intentString___queryIntentNames;
  v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  v6 = [v4 objectForKey:v5];
  v7 = v6;
  if (!v6) {
    v6 = @"Unknown";
  }
  v8 = v6;

  return v8;
}

void __30__SSQueryIntent_intentString___block_invoke()
{
  v24[21] = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  v23[0] = v22;
  v24[0] = @"Unknown";
  v21 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
  v23[1] = v21;
  v24[1] = @"Local";
  v20 = [MEMORY[0x1E4F28ED0] numberWithInt:2];
  v23[2] = v20;
  v24[2] = @"LocalCalc";
  v19 = [MEMORY[0x1E4F28ED0] numberWithInt:3];
  v23[3] = v19;
  v24[3] = @"LocalConv";
  v18 = [MEMORY[0x1E4F28ED0] numberWithInt:4];
  v23[4] = v18;
  v24[4] = @"LocalQuickAction";
  v17 = [MEMORY[0x1E4F28ED0] numberWithInt:5];
  v23[5] = v17;
  v24[5] = @"LocalApp";
  v16 = [MEMORY[0x1E4F28ED0] numberWithInt:6];
  v23[6] = v16;
  v24[6] = @"LocalSetting";
  v15 = [MEMORY[0x1E4F28ED0] numberWithInt:7];
  v23[7] = v15;
  v24[7] = @"LocalShortcut";
  v14 = [MEMORY[0x1E4F28ED0] numberWithInt:8];
  v23[8] = v14;
  v24[8] = @"LocalPhoto";
  v13 = [MEMORY[0x1E4F28ED0] numberWithInt:9];
  v23[9] = v13;
  v24[9] = @"LocalPhotoQU";
  v12 = [MEMORY[0x1E4F28ED0] numberWithInt:10];
  v23[10] = v12;
  v24[10] = @"LocalFile";
  v0 = [MEMORY[0x1E4F28ED0] numberWithInt:11];
  v23[11] = v0;
  v24[11] = @"LocalComm";
  v1 = [MEMORY[0x1E4F28ED0] numberWithInt:12];
  v23[12] = v1;
  v24[12] = @"LocalEvent";
  v2 = [MEMORY[0x1E4F28ED0] numberWithInt:14];
  v23[13] = v2;
  v24[13] = @"Server";
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:15];
  v23[14] = v3;
  v24[14] = @"ServerApp";
  v4 = [MEMORY[0x1E4F28ED0] numberWithInt:16];
  v23[15] = v4;
  v24[15] = @"ServerSports";
  v5 = [MEMORY[0x1E4F28ED0] numberWithInt:17];
  v23[16] = v5;
  v24[16] = @"ServerGeo";
  v6 = [MEMORY[0x1E4F28ED0] numberWithInt:18];
  v23[17] = v6;
  v24[17] = @"ServerInfo";
  v7 = [MEMORY[0x1E4F28ED0] numberWithInt:20];
  v23[18] = v7;
  v24[18] = @"Weather";
  v8 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
  v23[19] = v8;
  v24[19] = @"LocalWebHistory";
  v9 = [MEMORY[0x1E4F28ED0] numberWithInt:19];
  v23[20] = v9;
  v24[20] = @"ServerExactURL";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:21];
  v11 = (void *)intentString___queryIntentNames;
  intentString___queryIntentNames = v10;
}

+ (id)intentStrengthString:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (intentStrengthString__onceToken != -1) {
    dispatch_once(&intentStrengthString__onceToken, &__block_literal_global_197);
  }
  v4 = (void *)intentStrengthString___queryIntentStrengthNames;
  v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  v6 = [v4 objectForKey:v5];
  v7 = v6;
  if (!v6) {
    v6 = @"Unknown";
  }
  v8 = v6;

  return v8;
}

void __38__SSQueryIntent_intentStrengthString___block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  v7[0] = v0;
  v8[0] = @"Unknown";
  v1 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
  v7[1] = v1;
  v8[1] = @"Local";
  v2 = [MEMORY[0x1E4F28ED0] numberWithInt:2];
  v7[2] = v2;
  v8[2] = @"LocalStrong";
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:3];
  v7[3] = v3;
  v8[3] = @"Server";
  v4 = [MEMORY[0x1E4F28ED0] numberWithInt:4];
  v7[4] = v4;
  v8[4] = @"ServerStrong";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v6 = (void *)intentStrengthString___queryIntentStrengthNames;
  intentStrengthString___queryIntentStrengthNames = v5;
}

+ (int)intentStrength:(int)a3
{
  if ((a3 - 1) > 0x13) {
    return 0;
  }
  else {
    return dword_1BDC5DBC4[a3 - 1];
  }
}

- (int)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(int)a3
{
  self->_intentType = a3;
}

- (SSIntentBasedSuggestionsConfiguration)suggestionConfig
{
  return self->_suggestionConfig;
}

- (void)setSuggestionConfig:(id)a3
{
}

- (SSIntentBasedSectionConfiguration)sectionConfig
{
  return self->_sectionConfig;
}

- (void)setSectionConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionConfig, 0);
  objc_storeStrong((id *)&self->_suggestionConfig, 0);
}

@end