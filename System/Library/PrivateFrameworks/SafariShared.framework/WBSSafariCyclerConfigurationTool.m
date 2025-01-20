@interface WBSSafariCyclerConfigurationTool
- (WBSSafariCyclerConfigurationTool)init;
- (id)_commandWithName:(id)a3;
- (id)_descriptionForErrorCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3;
- (id)_supportedCommands;
- (void)_configureDevice:(id)a3;
- (void)_exitWithError:(id)a3;
- (void)_fetchLastError:(id)a3;
- (void)_fetchLogs:(id)a3;
- (void)_fetchStatus:(id)a3;
- (void)_printUsage;
- (void)_resumeCycler:(id)a3;
- (void)_runTest:(id)a3;
- (void)_sendRequestToTest:(id)a3;
- (void)_setConfigurationOption:(id)a3;
- (void)_startCycler:(id)a3;
- (void)_stopCycler:(id)a3;
- (void)_waitForCyclerToFinish:(id)a3;
- (void)run;
@end

@implementation WBSSafariCyclerConfigurationTool

- (WBSSafariCyclerConfigurationTool)init
{
  v12.receiver = self;
  v12.super_class = (Class)WBSSafariCyclerConfigurationTool;
  v2 = [(WBSSafariCyclerConfigurationTool *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBSCyclerServiceProxy);
    cyclerProxy = v2->_cyclerProxy;
    v2->_cyclerProxy = v3;

    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__WBSSafariCyclerConfigurationTool_init__block_invoke;
    v9[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v10, &location);
    [(WBSCyclerServiceProxy *)v2->_cyclerProxy setConnectionInvalidationHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__WBSSafariCyclerConfigurationTool_init__block_invoke_2;
    v7[3] = &unk_1E5C9F2F8;
    objc_copyWeak(&v8, &location);
    [(WBSCyclerServiceProxy *)v2->_cyclerProxy setErrorHandler:v7];
    v5 = v2;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __40__WBSSafariCyclerConfigurationTool_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained _errorWithCode:4];
    [v3 _exitWithError:v2];

    id WeakRetained = v3;
  }
}

void __40__WBSSafariCyclerConfigurationTool_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _exitWithError:v5];
  }
}

- (void)run
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  id v8 = [v3 arguments];

  if ((unint64_t)[v8 count] <= 1)
  {
    [(WBSSafariCyclerConfigurationTool *)self _printUsage];
    [(WBSSafariCyclerConfigurationTool *)self _exitWithError:0];
    goto LABEL_9;
  }
  v4 = [v8 objectAtIndexedSubscript:1];
  id v5 = [(WBSSafariCyclerConfigurationTool *)self _commandWithName:v4];

  if (v5)
  {
    v6 = objc_msgSend(v8, "subarrayWithRange:", 2, objc_msgSend(v8, "count") - 2);
    char v7 = [v5 invokeWithParameters:v6];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    [(WBSSafariCyclerConfigurationTool *)self _printUsage];
  }
  [(WBSSafariCyclerConfigurationTool *)self _exitWithError:0];
LABEL_8:

LABEL_9:
}

- (id)_supportedCommands
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSSafariCyclerConfigurationTool__supportedCommands__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  if (_supportedCommands_onceToken != -1) {
    dispatch_once(&_supportedCommands_onceToken, block);
  }
  return (id)_supportedCommands_commands;
}

void __54__WBSSafariCyclerConfigurationTool__supportedCommands__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)_supportedCommands_commands;
  _supportedCommands_commands = v2;

  v14 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"test" help:@"Shortcut to run either the sync or migration tests, if you don't need any special options"];
  [(_WBSSafariCyclerConfigurationCommand *)v14 setUsage:@"[sync|tab-sync|dav-sync|migration]"];
  [(_WBSSafariCyclerConfigurationCommand *)v14 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v14 setAction:sel__runTest_];
  [(_WBSSafariCyclerConfigurationCommand *)v14 setArgumentCount:1];
  [(id)_supportedCommands_commands addObject:v14];
  v13 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"start" help:@"Start the cycler, or restart it if it's already running."];
  [(_WBSSafariCyclerConfigurationCommand *)v13 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v13 setAction:sel__startCycler_];
  [(id)_supportedCommands_commands addObject:v13];
  objc_super v12 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"stop" help:@"Stop the cycler if it's running."];
  [(_WBSSafariCyclerConfigurationCommand *)v12 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v12 setAction:sel__stopCycler_];
  [(id)_supportedCommands_commands addObject:v12];
  v4 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"resume" help:@"Resume a test that has been stopped (either manually or because of a test failure)"];
  [(_WBSSafariCyclerConfigurationCommand *)v4 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v4 setAction:sel__resumeCycler_];
  [(id)_supportedCommands_commands addObject:v4];
  id v5 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"set" help:@"Set cycler configuration options."];
  [(_WBSSafariCyclerConfigurationCommand *)v5 setUsage:@"<key> <value>\nValid keys:\n    test-suite            The name of the test suite class to run\n    seed                  The seed to use for random number generation\n    maximum-iterations    The maximum iterations to run. Defaults to 0 (no maximum)"];
  [(_WBSSafariCyclerConfigurationCommand *)v5 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v5 setAction:sel__setConfigurationOption_];
  [(_WBSSafariCyclerConfigurationCommand *)v5 setArgumentCount:2];
  [(id)_supportedCommands_commands addObject:v5];
  v6 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"send-request" help:@"Send a request to an ongoing test"];
  [(_WBSSafariCyclerConfigurationCommand *)v6 setUsage:@"<request string>"];
  [(_WBSSafariCyclerConfigurationCommand *)v6 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v6 setAction:sel__sendRequestToTest_];
  [(_WBSSafariCyclerConfigurationCommand *)v6 setArgumentCount:1];
  [(id)_supportedCommands_commands addObject:v6];
  char v7 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"configure-device" help:@"Configure the device to run the cycler (must be run as root)"];
  [(_WBSSafariCyclerConfigurationCommand *)v7 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v7 setAction:sel__configureDevice_];
  [(id)_supportedCommands_commands addObject:v7];
  id v8 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"status" help:@"Display the current status of the cycler"];
  [(_WBSSafariCyclerConfigurationCommand *)v8 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v8 setAction:sel__fetchStatus_];
  [(id)_supportedCommands_commands addObject:v8];
  v9 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"logs" help:@"Display logs from the ongoing or last run test"];
  [(_WBSSafariCyclerConfigurationCommand *)v9 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v9 setAction:sel__fetchLogs_];
  [(id)_supportedCommands_commands addObject:v9];
  id v10 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"error" help:@"Display information about the last error encountered"];
  [(_WBSSafariCyclerConfigurationCommand *)v10 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v10 setAction:sel__fetchLastError_];
  [(id)_supportedCommands_commands addObject:v10];
  v11 = [[_WBSSafariCyclerConfigurationCommand alloc] initWithName:@"wait" help:@"Wait for the cycler to finish running"];
  [(_WBSSafariCyclerConfigurationCommand *)v11 setTarget:*(void *)(a1 + 32)];
  [(_WBSSafariCyclerConfigurationCommand *)v11 setAction:sel__waitForCyclerToFinish_];
  [(id)_supportedCommands_commands addObject:v11];
}

- (id)_commandWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(WBSSafariCyclerConfigurationTool *)self _supportedCommands];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 name];
        uint64_t v11 = [v10 caseInsensitiveCompare:v4];

        if (!v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_printUsage
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  puts("Usage: safaricyclerctl <subcommand>\n");
  puts("Subcommands:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(WBSSafariCyclerConfigurationTool *)self _supportedCommands];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 name];
        id v10 = (const char *)[v9 UTF8String];
        id v11 = [v8 help];
        printf("    %s\t\t%s\n", v10, (const char *)[v11 UTF8String]);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_exitWithError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 description];
    printf("Error: %s\n", (const char *)[v4 UTF8String]);

    LODWORD(v3) = 1;
  }
  exit((int)v3);
}

- (id)_errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v5 = -[WBSSafariCyclerConfigurationTool _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 errorWithDomain:@"WBSSafariCyclerConfigurationToolErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"A logging plist already exists; not overwriting it";
  }
  else {
    return off_1E5C9F750[a3 - 1];
  }
}

- (void)_runTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 lowercaseString];

  uint64_t v7 = [&unk_1EFC223B0 objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = [(WBSSafariCyclerConfigurationTool *)self _errorWithCode:3];
    [(WBSSafariCyclerConfigurationTool *)self _exitWithError:v8];
  }
  cyclerProxy = self->_cyclerProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke;
  v11[3] = &unk_1E5C9F6B8;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [(WBSCyclerServiceProxy *)cyclerProxy setValue:v7 forConfigurationKey:@"test-suite" reply:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3) {
      [WeakRetained _exitWithError:v3];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_2;
    v7[3] = &unk_1E5C8DC70;
    void v7[4] = v5;
    uint64_t v6 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v7);
    if ([*(id *)(a1 + 32) isEqualToString:@"sync"]) {
      [v5[1] setValue:@"1" forConfigurationKey:@"enable-cloudkit" reply:v6];
    }
    else {
      v6[2](v6, 0);
    }
  }
}

uint64_t __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _exitWithError:a2];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_3;
  v6[3] = &unk_1E5C8DC70;
  v6[4] = v3;
  return [v4 startCyclingFromBeginning:1 reply:v6];
}

uint64_t __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _exitWithError:a2];
}

- (void)_startCycler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WBSSafariCyclerConfigurationTool__startCycler___block_invoke;
  v6[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy startCyclingFromBeginning:1 reply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__WBSSafariCyclerConfigurationTool__startCycler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _exitWithError:v3];
}

- (void)_stopCycler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__WBSSafariCyclerConfigurationTool__stopCycler___block_invoke;
  v6[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy stopCyclingWithReply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__WBSSafariCyclerConfigurationTool__stopCycler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _exitWithError:v3];
}

- (void)_resumeCycler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__WBSSafariCyclerConfigurationTool__resumeCycler___block_invoke;
  v6[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy startCyclingFromBeginning:0 reply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__WBSSafariCyclerConfigurationTool__resumeCycler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _exitWithError:v3];
}

- (void)_setConfigurationOption:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  uint64_t v6 = [v4 lastObject];
  id v7 = [v4 firstObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__WBSSafariCyclerConfigurationTool__setConfigurationOption___block_invoke;
  v8[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v9, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy setValue:v6 forConfigurationKey:v7 reply:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__WBSSafariCyclerConfigurationTool__setConfigurationOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _exitWithError:v3];
}

- (void)_sendRequestToTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  uint64_t v6 = [v4 firstObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WBSSafariCyclerConfigurationTool__sendRequestToTest___block_invoke;
  v7[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v8, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy sendRequestToTestSuite:v6 reply:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__WBSSafariCyclerConfigurationTool__sendRequestToTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _exitWithError:v3];
}

- (void)_configureDevice:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  int v5 = [v4 fileExistsAtPath:@"/Library/Preferences/Logging/Subsystems/com.apple.SafariShared.plist"];

  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = 0;
LABEL_8:
    id v8 = [(WBSSafariCyclerConfigurationTool *)v6 _errorWithCode:v7];
    [(WBSSafariCyclerConfigurationTool *)self _exitWithError:v8];

    return;
  }
  if (([&unk_1EFC22400 writeToFile:@"/Library/Preferences/Logging/Subsystems/com.apple.SafariShared.plist" atomically:1] & 1) == 0)
  {
    uint64_t v6 = self;
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  [(WBSSafariCyclerConfigurationTool *)self _exitWithError:0];
}

- (void)_fetchStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WBSSafariCyclerConfigurationTool__fetchStatus___block_invoke;
  v6[3] = &unk_1E5C9F6E0;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy fetchStatusWithReply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__WBSSafariCyclerConfigurationTool__fetchStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = WeakRetained;
      id v8 = v5;
    }
    else
    {
      if ([v13 isConnectedToTestTarget]) {
        id v9 = "Yes";
      }
      else {
        id v9 = "No";
      }
      printf("Connected to test target: %s\n", v9);
      id v10 = [v13 activeTestSuiteName];
      printf("Active test suite: %s\n", (const char *)[v10 UTF8String]);

      printf("Seed: %lu\n", [v13 seed]);
      if ([v13 isRunning]) {
        id v11 = "Yes";
      }
      else {
        id v11 = "No";
      }
      printf("Running test: %s\n", v11);
      printf("Number of iterations: %lu\n", [v13 iterationCount]);
      [v13 executionTime];
      printf("Length of execution: %f seconds\n", v12);
      id v7 = WeakRetained;
      id v8 = 0;
    }
    [v7 _exitWithError:v8];
  }
}

- (void)_fetchLogs:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__WBSSafariCyclerConfigurationTool__fetchLogs___block_invoke;
  v6[3] = &unk_1E5C9F708;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy fetchLogsWithReply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __47__WBSSafariCyclerConfigurationTool__fetchLogs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      puts("Cycler logs:");
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(id *)(*((void *)&v16 + 1) + 8 * v14);
            puts((const char *)objc_msgSend(v15, "UTF8String", (void)v16));
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }

      id WeakRetained = v8;
      id v9 = 0;
    }
    objc_msgSend(WeakRetained, "_exitWithError:", v9, (void)v16);
  }
}

- (void)_fetchLastError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__WBSSafariCyclerConfigurationTool__fetchLastError___block_invoke;
  v6[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy fetchLastErrorWithReply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__WBSSafariCyclerConfigurationTool__fetchLastError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 description];
    puts((const char *)[v4 UTF8String]);

    [WeakRetained _exitWithError:0];
  }
}

- (void)_waitForCyclerToFinish:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke;
  v6[3] = &unk_1E5C9F6E0;
  objc_copyWeak(&v7, &location);
  [(WBSCyclerServiceProxy *)cyclerProxy fetchStatusWithReply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained _exitWithError:v6];
    }
    else
    {
      if ([v5 isRunning])
      {
        id v9 = [MEMORY[0x1E4F28C40] defaultCenter];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke_2;
        v11[3] = &unk_1E5C9F730;
        void v11[4] = v8;
        id v10 = (id)[v9 addObserverForName:@"com.apple.SafariShared.Cycler.DidFinishRunningTest" object:0 queue:0 usingBlock:v11];
      }
      else
      {
        id v9 = [v8 _errorWithCode:2];
        [v8 _exitWithError:v9];
      }
    }
  }
}

void __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke_2(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"errorDomain"];

  if (v5)
  {
    id v6 = [v3 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"errorCode"];
    uint64_t v8 = [v7 unsignedIntegerValue];

    id v9 = [v3 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"errorLocalizedDescription"];

    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v13 = [v11 errorWithDomain:v5 code:v8 userInfo:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  [*(id *)(a1 + 32) _exitWithError:v13];
}

- (void).cxx_destruct
{
}

@end