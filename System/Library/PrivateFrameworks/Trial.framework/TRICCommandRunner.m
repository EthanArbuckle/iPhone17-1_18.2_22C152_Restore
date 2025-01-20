@interface TRICCommandRunner
+ (BOOL)runWithRootPrivilegesDroppedDescription:(const char *)a3 block:(id)a4;
+ (BOOL)useTrialTool;
+ (id)convertToTrialToolArgs:(id)a3;
+ (id)convertToTrialToolCommand:(id)a3;
+ (id)runCommandAsync:(id)a3 withArgs:(id)a4 taskOutputOut:(id *)a5 error:(id *)a6;
+ (int)_withLoggingRunCommand:(id)a3 arguments:(id)a4 output:(id *)a5;
+ (int)_withoutLoggingRunCommand:(id)a3 withArgs:(id)a4 output:(id *)a5 error:(id *)a6;
+ (int)runCommand:(id)a3 withArgs:(id)a4;
+ (int)runCommandAsTrialDaemonUserName:(id)a3 withArgs:(id)a4 output:(id *)a5 error:(id *)a6;
+ (void)setUseTrialTool:(BOOL)a3;
@end

@implementation TRICCommandRunner

+ (id)convertToTrialToolCommand:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 pathComponents];

  v7 = (void *)[v5 initWithArray:v6];
  [v7 removeLastObject];
  [v7 addObject:@"trialtool"];
  v8 = [NSString pathWithComponents:v7];

  return v8;
}

+ (id)convertToTrialToolArgs:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v3];
  id v5 = [v4 firstObject];
  v6 = [&unk_1EEFCBEE8 allKeys];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    [v4 removeObjectAtIndex:0];
    v8 = [&unk_1EEFCBEE8 valueForKey:v5];
    v9 = [v8 componentsSeparatedByString:@" "];
    id v10 = [v9 arrayByAddingObjectsFromArray:v4];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

+ (void)setUseTrialTool:(BOOL)a3
{
  _useTrialTool = a3;
}

+ (BOOL)useTrialTool
{
  return _useTrialTool;
}

+ (BOOL)runWithRootPrivilegesDroppedDescription:(const char *)a3 block:(id)a4
{
  id v5 = (void (**)(void))a4;
  if (!geteuid())
  {
    int v7 = +[TRICEnvironmentManager getLoginPasswd];
    if (v7)
    {
      v8 = v7;
      *__error() = 0;
      int v9 = seteuid(v8->pw_uid);
      id v10 = (FILE **)MEMORY[0x1E4F143C8];
      v11 = (FILE *)*MEMORY[0x1E4F143C8];
      pw_name = v8->pw_name;
      if (v9)
      {
        v13 = __error();
        strerror(*v13);
        __error();
        fprintf(v11, "Warning: failed to seteuid() to account \"%s\": %s (%d)\n");
      }
      else
      {
        fprintf(v11, "trialcontroller was invoked as root; temporarily switched to account \"%s\" to carry out operation \"%s\".\n",
          pw_name,
          a3);
        v5[2](v5);
        if (!seteuid(0)) {
          goto LABEL_3;
        }
        v14 = *v10;
        v15 = __error();
        strerror(*v15);
        __error();
        fprintf(v14, "Warning: failed to seteuid() back to root: %s (%d)\n");
      }
    }
    BOOL v6 = 0;
    goto LABEL_10;
  }
  v5[2](v5);
LABEL_3:
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

+ (int)runCommand:(id)a3 withArgs:(id)a4
{
  return [a1 _withLoggingRunCommand:a3 arguments:a4 output:0];
}

+ (int)_withoutLoggingRunCommand:(id)a3 withArgs:(id)a4 output:(id *)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"TRICCommandRunner.m", 131, @"Invalid parameter not satisfying: %@", @"command" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"TRICCommandRunner.m", 132, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];

  if (a5) {
LABEL_4:
  }
    *a5 = 0;
LABEL_5:
  if (a6) {
    *a6 = 0;
  }
  id v20 = 0;
  v14 = [a1 runCommandAsync:v11 withArgs:v13 taskOutputOut:&v20 error:a6];
  if (v14)
  {
    v15 = [v20 readDataToEndOfFile];
    [v14 waitUntilExit];
    if (a5 && v15) {
      *a5 = (id)[[NSString alloc] initWithData:v15 encoding:4];
    }
    int v16 = [v14 terminationStatus];
  }
  else
  {
    int v16 = -1;
  }

  return v16;
}

+ (id)runCommandAsync:(id)a3 withArgs:(id)a4 taskOutputOut:(id *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = +[TRIStandardPaths resolveHardCodedPath:a3];
  id v11 = [MEMORY[0x1E4F28F80] processInfo];
  id v12 = [v11 environment];
  v13 = (void *)[v12 mutableCopy];

  [v13 setObject:0 forKeyedSubscript:@"OS_ACTIVITY_DT_MODE"];
  v14 = objc_opt_new();
  [v14 setEnvironment:v13];
  v15 = (void *)[v9 mutableCopy];

  [v15 insertObject:v10 atIndex:0];
  int v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/usr/local/bin/dvdo"];
  [v14 setExecutableURL:v16];

  [v14 setArguments:v15];
  v17 = [MEMORY[0x1E4F28F48] pipe];
  [v14 setStandardOutput:v17];
  [v14 setStandardError:v17];
  if (a5)
  {
    v18 = [v17 fileHandleForReading];
    id v19 = *a5;
    *a5 = v18;
  }
  id v24 = 0;
  char v20 = [v14 launchAndReturnError:&v24];
  id v21 = v24;
  v22 = v21;
  if ((v20 & 1) == 0)
  {
    if (a6) {
      *a6 = v21;
    }

    v14 = 0;
  }

  return v14;
}

+ (int)_withLoggingRunCommand:(id)a3 arguments:(id)a4 output:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v19 = 0;
  id v20 = 0;
  id v9 = a4;
  uint64_t v10 = [a1 _withoutLoggingRunCommand:v8 withArgs:v9 output:&v20 error:&v19];
  id v11 = v20;
  id v12 = v19;
  v13 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_1);

  v14 = [v13 componentsJoinedByString:@", "];

  v15 = TRILogCategory_InternalTool();
  int v16 = v15;
  if ((v10 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v22 = v8;
      *(_WORD *)&v22[8] = 2112;
      *(void *)&v22[10] = v14;
      *(_WORD *)&v22[18] = 2112;
      *(void *)&v22[20] = v12;
      _os_log_error_impl(&dword_19D909000, v16, OS_LOG_TYPE_ERROR, "Failed to spawn subprocess \"%@\" [%@]: %@", buf, 0x20u);
    }

LABEL_14:
    +[TRICPrinter printNewlineUsingStderr:1, @"Spawned subprocess: \"%@\" [%@]", v8, v14 format];
    +[TRICPrinter printNewlineUsingStderr:1, @"Subprocess \"%@\" output: %@", v8, v11 format];
    +[TRICPrinter printNewlineUsingStderr:format:](TRICPrinter, "printNewlineUsingStderr:format:", 1, @"Subprocess \"%@\" failed with status %d; error: %@",
      v8,
      v10,
      v12);
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v22 = v10;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = v8;
    *(_WORD *)&v22[14] = 2112;
    *(void *)&v22[16] = v14;
    _os_log_impl(&dword_19D909000, v16, OS_LOG_TYPE_DEFAULT, "Spawned subprocess with exit code %d: \"%@\" [%@]", buf, 0x1Cu);
  }

  v17 = TRILogCategory_InternalTool();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v22 = v8;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v11;
    _os_log_impl(&dword_19D909000, v17, OS_LOG_TYPE_DEFAULT, "Subprocess \"%@\" output: %@", buf, 0x16u);
  }

  if (v10 || v12) {
    goto LABEL_14;
  }
  if (a5) {
LABEL_9:
  }
    *a5 = v11;
LABEL_10:

  return v10;
}

id __61__TRICCommandRunner__withLoggingRunCommand_arguments_output___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithFormat:@"\"%@\"", v3];

  return v4;
}

+ (int)runCommandAsTrialDaemonUserName:(id)a3 withArgs:(id)a4 output:(id *)a5 error:(id *)a6
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"-q";
  v16[1] = @"-f";
  id v10 = a4;
  id v11 = a3;
  id v12 = +[TRICEnvironmentManager trialDaemonUserName];
  v16[2] = v12;
  v16[3] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

  v14 = [v13 arrayByAddingObjectsFromArray:v10];

  LODWORD(a6) = [a1 runCommand:@"/usr/bin/login" withArgs:v14 output:a5 error:a6];
  return (int)a6;
}

@end