@interface UIApplication(SBSUIInCallAdditions)
- (uint64_t)SBSUI_requestInCallSceneSessionDestruction:()SBSUIInCallAdditions withReason:completion:;
- (void)SBSUI_requestInCallSceneSessionDestruction:()SBSUIInCallAdditions withReason:analyticsSource:completion:;
@end

@implementation UIApplication(SBSUIInCallAdditions)

- (uint64_t)SBSUI_requestInCallSceneSessionDestruction:()SBSUIInCallAdditions withReason:completion:
{
  return objc_msgSend(a1, "SBSUI_requestInCallSceneSessionDestruction:withReason:analyticsSource:completion:", a3, a4, 0, a5);
}

- (void)SBSUI_requestInCallSceneSessionDestruction:()SBSUIInCallAdditions withReason:analyticsSource:completion:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [v9 scene];
  v13 = [v12 _FBSScene];

  v14 = SBLogInCallPresentation();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_1A7607000, v14, OS_LOG_TYPE_DEFAULT, "Client requested destruction of %{public}@", buf, 0xCu);
  }

  if (v13)
  {
    v15 = [SBSUIInCallDestroySceneAction alloc];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __120__UIApplication_SBSUIInCallAdditions__SBSUI_requestInCallSceneSessionDestruction_withReason_analyticsSource_completion___block_invoke;
    v21 = &unk_1E5CCEB10;
    id v22 = 0;
    id v23 = v11;
    v16 = [(SBSUIInCallDestroySceneAction *)v15 initWithDestructionReason:a4 analyticsSource:v10 timeout:&v18 withResponseHandler:5.0];
    v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v16, v18, v19, v20, v21);
    [v13 sendActions:v17];

LABEL_7:
    goto LABEL_8;
  }
  if (v11)
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBSUIInCallErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, SBSUIInCallDestroySceneAction *))v11 + 2))(v11, v16);
    goto LABEL_7;
  }
LABEL_8:
}

@end