@interface WFAVSystemController
- (BOOL)setSilentMode:(BOOL)a3 reason:(id)a4 client:(int64_t)a5;
- (BOOL)silentModeActive;
- (BOOL)toggleSilentModeWithReason:(id)a3 client:(int64_t)a4;
- (id)avSystemController;
@end

@implementation WFAVSystemController

- (BOOL)toggleSilentModeWithReason:(id)a3 client:(int64_t)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(WFAVSystemController *)self setSilentMode:[(WFAVSystemController *)self silentModeActive] ^ 1 reason:v6 client:a4];

  return a4;
}

- (BOOL)setSilentMode:(BOOL)a3 reason:(id)a4 client:(int64_t)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = [(WFAVSystemController *)self avSystemController];
  v10 = v9;
  if (a5 == 3) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = 6;
  }
  if (a5 == 2) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = v11;
  }
  char v13 = [v9 setSilentMode:v6 untilTime:0 reason:v8 clientType:v12];

  return v13;
}

- (BOOL)silentModeActive
{
  v2 = [(WFAVSystemController *)self avSystemController];
  char v3 = [v2 getSilentMode];

  return v3;
}

- (id)avSystemController
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getAVSystemControllerClass_softClass;
  uint64_t v10 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAVSystemControllerClass_block_invoke;
    v6[3] = &unk_1E6079C28;
    v6[4] = &v7;
    __getAVSystemControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 sharedAVSystemController];
  return v4;
}

@end