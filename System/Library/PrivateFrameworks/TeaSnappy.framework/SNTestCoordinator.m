@interface SNTestCoordinator
- (BOOL)requiresRotationForOrientation:(int64_t)a3;
- (NSString)launchTestName;
- (SNTestCoordinator)initWithApplication:(id)a3;
- (UIApplication)application;
- (int64_t)lengthForNumberOfScreens:(int64_t)a3 direction:(unint64_t)a4 size:(CGSize)a5;
- (unint64_t)axisForDirection:(unint64_t)a3;
- (void)failedTestWithTestName:(id)a3 failureMessage:(id)a4;
- (void)finishedTestWithTestName:(id)a3 waitForCommit:(BOOL)a4;
- (void)recapScrollTestWithTestName:(id)a3 scrollView:(id)a4;
- (void)rotateToOrientation:(int64_t)a3 beforeRotation:(id)a4 afterRotation:(id)a5;
- (void)scrollTestWithTestName:(id)a3 scrollView:(id)a4 iterations:(int64_t)a5 offset:(int64_t)a6 direction:(unint64_t)a7;
- (void)scrollTestWithTestName:(id)a3 scrollView:(id)a4 iterations:(int64_t)a5 offset:(int64_t)a6 numberOfScreens:(int64_t)a7 direction:(unint64_t)a8;
- (void)startedTestWithTestName:(id)a3;
@end

@implementation SNTestCoordinator

- (SNTestCoordinator)initWithApplication:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1DE03B000, v6, OS_LOG_TYPE_DEFAULT, "Creating SNTestCoordinator with application %@", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)SNTestCoordinator;
  v7 = [(SNTestCoordinator *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_application, a3);
  }

  return v8;
}

- (BOOL)requiresRotationForOrientation:(int64_t)a3
{
  v4 = [(SNTestCoordinator *)self application];
  LOBYTE(a3) = [v4 statusBarOrientation] != a3;

  return a3;
}

- (NSString)launchTestName
{
  v2 = [(SNTestCoordinator *)self application];
  v3 = [v2 _launchTestName];
  v4 = v3;
  if (!v3) {
    v3 = @"launch";
  }
  id v5 = v3;

  return v5;
}

- (void)finishedTestWithTestName:(id)a3 waitForCommit:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = [(SNTestCoordinator *)self application];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1DE03B000, v8, OS_LOG_TYPE_DEFAULT, "Marking test %@ as completed with waitForCommit %d on application %@", (uint8_t *)&v11, 0x1Cu);
  }
  objc_super v10 = [(SNTestCoordinator *)self application];
  [v10 finishedTest:v6 waitForCommit:v4 extraResults:0];
}

- (UIApplication)application
{
  return self->_application;
}

- (void)startedTestWithTestName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = [(SNTestCoordinator *)self application];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1DE03B000, v6, OS_LOG_TYPE_DEFAULT, "Marking test %@ started on application %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(SNTestCoordinator *)self application];
  [v8 startedTest:v4];
}

- (void).cxx_destruct
{
}

- (void)failedTestWithTestName:(id)a3 failureMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    id v10 = [(SNTestCoordinator *)self application];
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1DE03B000, v9, OS_LOG_TYPE_DEFAULT, "Marking test %@ failed on application %@ with error %@", (uint8_t *)&v12, 0x20u);
  }
  __int16 v11 = [(SNTestCoordinator *)self application];
  [v11 failedTest:v6 withFailure:v7];
}

- (void)rotateToOrientation:(int64_t)a3 beforeRotation:(id)a4 afterRotation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SNTestCoordinator *)self application];
  id v14 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke;
  v15[3] = &unk_1E6D22708;
  id v16 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke_2;
  v13[3] = &unk_1E6D22708;
  id v11 = v9;
  id v12 = v8;
  [v10 rotateIfNeeded:a3 before:v15 after:v13];
}

uint64_t __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)scrollTestWithTestName:(id)a3 scrollView:(id)a4 iterations:(int64_t)a5 offset:(int64_t)a6 direction:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  objc_msgSend(v12, "_performScrollTest:iterations:delta:scrollAxis:", v13, a5, a6, -[SNTestCoordinator axisForDirection:](self, "axisForDirection:", a7));
}

- (void)scrollTestWithTestName:(id)a3 scrollView:(id)a4 iterations:(int64_t)a5 offset:(int64_t)a6 numberOfScreens:(int64_t)a7 direction:(unint64_t)a8
{
  id v14 = a4;
  id v18 = a3;
  unint64_t v15 = [(SNTestCoordinator *)self axisForDirection:a8];
  [v14 bounds];
  objc_msgSend(v14, "_performScrollTest:iterations:delta:length:scrollAxis:", v18, a5, a6, -[SNTestCoordinator lengthForNumberOfScreens:direction:size:](self, "lengthForNumberOfScreens:direction:size:", a7, a8, v16, v17), v15);
}

- (void)recapScrollTestWithTestName:(id)a3 scrollView:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F94840];
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)[[v5 alloc] initWithTestName:v7 scrollView:v6 completionHandler:0];

  [MEMORY[0x1E4F94850] runTestWithParameters:v8];
}

- (unint64_t)axisForDirection:(unint64_t)a3
{
  if (a3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)lengthForNumberOfScreens:(int64_t)a3 direction:(unint64_t)a4 size:(CGSize)a5
{
  if (a4 == 1)
  {
    uint64_t width = (uint64_t)a5.width;
  }
  else
  {
    if (a4) {
      return self;
    }
    uint64_t width = (uint64_t)a5.height;
  }
  return width * a3;
}

@end