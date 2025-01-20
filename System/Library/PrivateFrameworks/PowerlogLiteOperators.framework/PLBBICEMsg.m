@interface PLBBICEMsg
+ (id)msgMetricTableSchema;
+ (id)msgTriggerTableSchema;
@end

@implementation PLBBICEMsg

+ (id)msgTriggerTableSchema
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F29F0C80;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = *MEMORY[0x1E4F92B00];
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v17[0] = v13;
  v16[1] = *MEMORY[0x1E4F92B10];
  v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v17[1] = v3;
  v16[2] = *MEMORY[0x1E4F92B08];
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v17[2] = v5;
  v16[3] = *MEMORY[0x1E4F92B18];
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v17[3] = v7;
  v16[4] = *MEMORY[0x1E4F92AD8];
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)msgMetricTableSchema
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F29F0C90;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = *MEMORY[0x1E4F92AE0];
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v17[0] = v13;
  v16[1] = *MEMORY[0x1E4F92AE8];
  v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v17[1] = v3;
  v16[2] = *MEMORY[0x1E4F92AF8];
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v17[2] = v5;
  v16[3] = *MEMORY[0x1E4F92AF0];
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v17[3] = v7;
  v16[4] = *MEMORY[0x1E4F92AD8];
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

@end