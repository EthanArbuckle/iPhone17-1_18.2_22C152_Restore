@interface DAPlatform_iOS
- (BOOL)didSetProxyServerInformation;
- (BOOL)isCheckerBoardActive;
- (BOOL)isInBoxUpdateModeActive;
- (void)dimCheckerBoardDisplay;
- (void)exitCheckerBoard;
- (void)hideSceneStatusBar;
- (void)sceneStatusBarStyle:(int64_t)a3;
- (void)showSceneStatusBar;
- (void)undimCheckerBoardDisplay;
@end

@implementation DAPlatform_iOS

- (BOOL)isCheckerBoardActive
{
  return +[CBSUtilities isCheckerBoardActive];
}

- (void)exitCheckerBoard
{
  if ([(DAPlatform_iOS *)self isCheckerBoardActive])
  {
    +[CBSUtilities exitCheckerBoard];
  }
}

- (BOOL)didSetProxyServerInformation
{
  if (![(DAPlatform_iOS *)self isCheckerBoardActive]) {
    return 0;
  }
  v2 = +[CBSUtilities proxyServer];
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSUtilities proxyServer: %@", (uint8_t *)&v16, 0xCu);
  }

  v4 = [v2 server];
  uint64_t v5 = [v2 port];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    v9 = +[ASTEnvironment currentEnvironment];
    [v9 setSOCKSProxyServer:v4];
    [v9 setSOCKSProxyPort:v6];
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = +[ASTEnvironment currentEnvironment];
      v12 = [v11 SOCKSProxyServer];
      v13 = +[ASTEnvironment currentEnvironment];
      v14 = [v13 SOCKSProxyPort];
      int v16 = 138412546;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set ASTEnvironment to %@, %@", (uint8_t *)&v16, 0x16u);
    }
  }

  return v8;
}

- (BOOL)isInBoxUpdateModeActive
{
  if (qword_1000228F8 != -1) {
    dispatch_once(&qword_1000228F8, &stru_100018948);
  }
  return byte_1000228F0;
}

- (void)showSceneStatusBar
{
  if ([(DAPlatform_iOS *)self isCheckerBoardActive])
  {
    v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CBSUtilities: showSceneStatusBar", v3, 2u);
    }

    +[CBSUtilities showSceneStatusBar];
  }
}

- (void)hideSceneStatusBar
{
  if ([(DAPlatform_iOS *)self isCheckerBoardActive])
  {
    v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CBSUtilities: hideSceneStatusBar", v3, 2u);
    }

    +[CBSUtilities hideSceneStatusBar];
  }
}

- (void)sceneStatusBarStyle:(int64_t)a3
{
  if ([(DAPlatform_iOS *)self isCheckerBoardActive])
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      int64_t v6 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBSUtilities: sceneStatusBarStyle %li", (uint8_t *)&v5, 0xCu);
    }

    +[CBSUtilities sceneStatusBarStyle:a3];
  }
}

- (void)dimCheckerBoardDisplay
{
  if ([(DAPlatform_iOS *)self isCheckerBoardActive])
  {
    v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CBSUtilities: dimCheckerBoardDisplay", v3, 2u);
    }

    +[CBSUtilities dimDisplay];
  }
}

- (void)undimCheckerBoardDisplay
{
  if ([(DAPlatform_iOS *)self isCheckerBoardActive])
  {
    v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CBSUtilities: undimCheckerBoardDisplay", v3, 2u);
    }

    +[CBSUtilities undimDisplay];
  }
}

@end