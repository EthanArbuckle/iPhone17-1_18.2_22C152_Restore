@interface PLBBCodes
- (NSArray)Mav5_7_Lite_LogCodes;
- (NSArray)Mav5_7_LogCodes;
- (NSArray)Mav7_LogCodes;
- (NSArray)allMav_LogCodes;
- (PLBBCodes)init;
- (id)getEventCodesForMav:(id)a3 AndType:(id)a4;
- (id)getLogCodesForMav:(id)a3 AndType:(id)a4;
- (void)setAllMav_LogCodes:(id)a3;
- (void)setMav5_7_Lite_LogCodes:(id)a3;
- (void)setMav5_7_LogCodes:(id)a3;
- (void)setMav7_LogCodes:(id)a3;
@end

@implementation PLBBCodes

- (id)getLogCodesForMav:(id)a3 AndType:(id)a4
{
  return 0;
}

- (id)getEventCodesForMav:(id)a3 AndType:(id)a4
{
  return 0;
}

- (PLBBCodes)init
{
  v30.receiver = self;
  v30.super_class = (Class)PLBBCodes;
  v2 = [(PLBBCodes *)&v30 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    v4 = [NSNumber numberWithInt:1];
    uint64_t v5 = objc_msgSend(v3, "arrayWithObjects:", v4, 0);
    allMav_LogCodes = v2->_allMav_LogCodes;
    v2->_allMav_LogCodes = (NSArray *)v5;

    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = [NSNumber numberWithInt:45452];
    uint64_t v9 = objc_msgSend(v7, "arrayWithObjects:", v8, 0);
    Mav5_7_Lite_LogCodes = v2->_Mav5_7_Lite_LogCodes;
    v2->_Mav5_7_Lite_LogCodes = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = [NSNumber numberWithInt:28978];
    v13 = [NSNumber numberWithInt:45309];
    v14 = [NSNumber numberWithInt:45310];
    v15 = [NSNumber numberWithInt:45311];
    uint64_t v16 = objc_msgSend(v11, "arrayWithObjects:", v12, v13, v14, v15, 0);
    Mav5_7_LogCodes = v2->_Mav5_7_LogCodes;
    v2->_Mav5_7_LogCodes = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1C978];
    v19 = [NSNumber numberWithInt:6144];
    v20 = [NSNumber numberWithInt:16678];
    v21 = [NSNumber numberWithInt:33];
    v22 = [NSNumber numberWithInt:34];
    v23 = [NSNumber numberWithInt:35];
    v24 = [NSNumber numberWithInt:36];
    v25 = [NSNumber numberWithInt:37];
    uint64_t v26 = objc_msgSend(v18, "arrayWithObjects:", v19, v20, v21, v22, v23, v24, v25, 0);
    Mav7_LogCodes = v2->_Mav7_LogCodes;
    v2->_Mav7_LogCodes = (NSArray *)v26;

    v28 = v2;
  }

  return v2;
}

- (NSArray)allMav_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllMav_LogCodes:(id)a3
{
}

- (NSArray)Mav5_7_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMav5_7_LogCodes:(id)a3
{
}

- (NSArray)Mav5_7_Lite_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMav5_7_Lite_LogCodes:(id)a3
{
}

- (NSArray)Mav7_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMav7_LogCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Mav7_LogCodes, 0);
  objc_storeStrong((id *)&self->_Mav5_7_Lite_LogCodes, 0);
  objc_storeStrong((id *)&self->_Mav5_7_LogCodes, 0);
  objc_storeStrong((id *)&self->_allMav_LogCodes, 0);
}

@end