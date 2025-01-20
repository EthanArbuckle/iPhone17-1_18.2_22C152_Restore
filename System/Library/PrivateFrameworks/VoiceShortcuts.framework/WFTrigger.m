@interface WFTrigger
@end

@implementation WFTrigger

void __51__WFTrigger_PowerLog__powerLogEventKindForTrigger___block_invoke()
{
  v43[20] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v0);
  v42[0] = v41;
  v43[0] = &unk_1F22705B0;
  v1 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v1);
  v42[1] = v40;
  v43[1] = &unk_1F22705C8;
  v2 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v2);
  v42[2] = v39;
  v43[2] = &unk_1F22705E0;
  v3 = (objc_class *)objc_opt_class();
  v38 = NSStringFromClass(v3);
  v42[3] = v38;
  v43[3] = &unk_1F22705F8;
  v4 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v4);
  v42[4] = v37;
  v43[4] = &unk_1F2270610;
  v5 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v5);
  v42[5] = v36;
  v43[5] = &unk_1F2270628;
  v6 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v6);
  v42[6] = v35;
  v43[6] = &unk_1F2270640;
  v7 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v7);
  v42[7] = v34;
  v43[7] = &unk_1F2270658;
  v8 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v8);
  v42[8] = v33;
  v43[8] = &unk_1F2270670;
  v9 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v9);
  v42[9] = v32;
  v43[9] = &unk_1F2270688;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v42[10] = v11;
  v43[10] = &unk_1F22706A0;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v42[11] = v13;
  v43[11] = &unk_1F22706B8;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v42[12] = v15;
  v43[12] = &unk_1F22706D0;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v42[13] = v17;
  v43[13] = &unk_1F22706E8;
  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v42[14] = v19;
  v43[14] = &unk_1F2270700;
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v42[15] = v21;
  v43[15] = &unk_1F2270718;
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v42[16] = v23;
  v43[16] = &unk_1F2270730;
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v42[17] = v25;
  v43[17] = &unk_1F2270748;
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v42[18] = v27;
  v43[18] = &unk_1F2270760;
  v28 = (objc_class *)objc_opt_class();
  v29 = NSStringFromClass(v28);
  v42[19] = v29;
  v43[19] = &unk_1F2270778;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:20];
  v31 = (void *)powerLogEventKindForTrigger__eventKinds;
  powerLogEventKindForTrigger__eventKinds = v30;
}

@end