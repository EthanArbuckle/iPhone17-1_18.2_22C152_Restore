@interface FBScene(PaperBoard)
- (uint64_t)pb_activate:()PaperBoard;
- (uint64_t)pb_update:()PaperBoard;
- (void)pb_update:()PaperBoard withCompletion:;
@end

@implementation FBScene(PaperBoard)

- (uint64_t)pb_activate:()PaperBoard
{
  return objc_msgSend(a1, "pb_activate:withCompletion:", a3, 0);
}

- (uint64_t)pb_update:()PaperBoard
{
  return objc_msgSend(a1, "pb_update:withCompletion:", a3, 0);
}

- (void)pb_update:()PaperBoard withCompletion:
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = v8;
    if ([a1 isActive])
    {
      [a1 performUpdate:v7 withCompletion:v9];
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__FBScene_PaperBoard__pb_update_withCompletion___block_invoke;
      v13[3] = &unk_1E62B3168;
      id v14 = v7;
      [a1 updateSettingsWithBlock:v13];
      if (v9)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __48__FBScene_PaperBoard__pb_update_withCompletion___block_invoke_2;
        block[3] = &unk_1E62B2EF0;
        id v12 = v9;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"updater != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PaperBoard) pb_update:withCompletion:](a2, (uint64_t)a1, (uint64_t)v10);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)pb_update:()PaperBoard withCompletion:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PBUIPosterSceneTypes.m";
  __int16 v16 = 1024;
  int v17 = 118;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end