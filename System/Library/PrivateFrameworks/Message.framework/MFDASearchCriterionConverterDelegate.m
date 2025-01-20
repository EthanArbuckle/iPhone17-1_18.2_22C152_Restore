@interface MFDASearchCriterionConverterDelegate
@end

@implementation MFDASearchCriterionConverterDelegate

void __97___MFDASearchCriterionConverterDelegate_messageCriterionConverter_predicateKeysForCriterionType___block_invoke()
{
  v29[12] = *MEMORY[0x1E4F143B8];
  v28[0] = &unk_1EFF51120;
  uint64_t v27 = *MEMORY[0x1E4F5EEE8];
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v29[0] = v15;
  v28[1] = &unk_1EFF51138;
  uint64_t v26 = *MEMORY[0x1E4F5EEF8];
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v29[1] = v14;
  v28[2] = &unk_1EFF51150;
  uint64_t v25 = *MEMORY[0x1E4F5EEB0];
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v29[2] = v0;
  v28[3] = &unk_1EFF51168;
  uint64_t v24 = *MEMORY[0x1E4F5EEA8];
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v29[3] = v1;
  v28[4] = &unk_1EFF51180;
  uint64_t v23 = *MEMORY[0x1E4F5EED0];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v29[4] = v2;
  v28[5] = &unk_1EFF51198;
  uint64_t v22 = *MEMORY[0x1E4F5EEC8];
  uint64_t v3 = v22;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v29[5] = v4;
  v28[6] = &unk_1EFF511B0;
  uint64_t v21 = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v29[6] = v5;
  v28[7] = &unk_1EFF511C8;
  uint64_t v20 = *MEMORY[0x1E4F5EEB8];
  uint64_t v6 = v20;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v29[7] = v7;
  v28[8] = &unk_1EFF511E0;
  uint64_t v19 = *MEMORY[0x1E4F5EEC0];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v29[8] = v8;
  v28[9] = &unk_1EFF511F8;
  uint64_t v18 = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v29[9] = v9;
  v28[10] = &unk_1EFF51210;
  uint64_t v17 = *MEMORY[0x1E4F5EEF0];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v29[10] = v10;
  v28[11] = &unk_1EFF51228;
  uint64_t v16 = *MEMORY[0x1E4F5EED8];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v29[11] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:12];
  v13 = (void *)messageCriterionConverter_predicateKeysForCriterionType__converterKeyDictionary;
  messageCriterionConverter_predicateKeysForCriterionType__converterKeyDictionary = v12;
}

void __78___MFDASearchCriterionConverterDelegate__shouldConvertEqualsToContainsForKey___block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F5EEC8];
  v6[0] = *MEMORY[0x1E4F5EEF0];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F5EEB0];
  v6[2] = *MEMORY[0x1E4F5EEA8];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F5EEE0];
  v6[4] = *MEMORY[0x1E4F5EED0];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F5EEF8];
  v6[6] = *MEMORY[0x1E4F5EEE8];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  v5 = (void *)_shouldConvertEqualsToContainsForKey___daKeys;
  _shouldConvertEqualsToContainsForKey___daKeys = v4;
}

@end