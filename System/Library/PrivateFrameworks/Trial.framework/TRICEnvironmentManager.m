@interface TRICEnvironmentManager
+ (BOOL)validateTrialPath:(id)a3 requireUserPath:(BOOL)a4;
+ (const)getLoginPasswd;
+ (id)envToString:(int64_t)a3;
+ (id)trialDaemonUserName;
+ (int)checkDeviceUnlocked;
+ (int)checkIfConnectedToVPN:(BOOL *)a3;
+ (int)resetDaemonProcess;
+ (int64_t)currentEnv;
@end

@implementation TRICEnvironmentManager

+ (BOOL)validateTrialPath:(id)a3 requireUserPath:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [a3 pathComponents];
  if (v6)
  {
    v7 = [a1 trialDaemonUserName];
    if (v4 && ![v6 containsObject:v7])
    {
      char v9 = 0;
    }
    else
    {
      v8 = [v6 lastObject];
      char v9 = [v8 isEqualToString:@"Trial"];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (int)resetDaemonProcess
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if (geteuid()) {
    +[TRICPrinter printNewlineAndLogErrorWithFormat:@"Warning: Running reset without root access. Please ensure you are running reset as root."];
  }
  +[TRICCommandRunner runCommand:@"/bin/launchctl" withArgs:&unk_1EEFCBD50];
  if (getuid())
  {
    int result = +[TRICCommandRunner runCommand:@"/usr/bin/killall" withArgs:&unk_1EEFCBD68];
    if (!result) {
      return result;
    }
    v3 = __error();
    +[TRICPrinter printNewlineAndLogErrorWithFormat:@"Error killing triald. Error: %s", strerror(*v3)];
  }
  else
  {
    v6[0] = @"unload";
    v6[1] = @"/System/Library/LaunchDaemons/com.apple.triald.plist";
    BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    int v5 = +[TRICCommandRunner runCommand:@"/bin/launchctl" withArgs:v4];

    if (!v5) {
      return 0;
    }
    +[TRICPrinter printNewlineAndLogErrorWithFormat:@"Error unloading triald at %@", @"/System/Library/LaunchDaemons/com.apple.triald.plist"];
  }
  return 1;
}

+ (int)checkDeviceUnlocked
{
  int result = [MEMORY[0x1E4F93B10] isClassCLocked];
  if (result)
  {
    fwrite("Error: Device has not been unlocked since reboot, please unlock to use trialcontroller\n", 0x57uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    return 3;
  }
  return result;
}

+ (int64_t)currentEnv
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"read";
  v11[1] = @"com.apple.triald";
  v11[2] = @"com.apple.triald.ck.serverEnvironment";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v9 = 0;
  id v10 = 0;
  int v3 = +[TRICCommandRunner runCommandAsTrialDaemonUserName:@"/usr/bin/defaults" withArgs:v2 output:&v10 error:&v9];
  id v4 = v10;
  id v5 = v9;

  if (v3)
  {

    id v4 = 0;
  }
  if ([v4 length])
  {
    int64_t v8 = 0;
    if (+[TRIMisc convertFromString:v4 usingBase:10 toI64:&v8])
    {
      int64_t v6 = v8;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  if (v3) {
    +[TRICPrinter printNewlineAndLogErrorWithFormat:@"Unable to read defaults. Error: %@", 0];
  }

  return v6;
}

+ (int)checkIfConnectedToVPN:(BOOL *)a3
{
  id v8 = 0;
  id v9 = 0;
  int v4 = +[TRICCommandRunner runCommand:@"/sbin/ifconfig" withArgs:&unk_1EEFCBD80 output:&v9 error:&v8];
  id v5 = v9;
  id v6 = v8;
  *a3 = [v5 rangeOfString:@"VPN: Corporate"] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (id)envToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"UNKNOWN";
  }
  else {
    return off_1E596A170[a3 - 1];
  }
}

+ (id)trialDaemonUserName
{
  return @"mobile";
}

+ (const)getLoginPasswd
{
  *__error() = 0;
  int result = getpwnam("mobile");
  if (result)
  {
    if (result->pw_uid) {
      return result;
    }
    fwrite("Warning: got pwInfo for uid=0.\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  else
  {
    int v3 = (FILE *)*MEMORY[0x1E4F143C8];
    int v4 = __error();
    id v5 = strerror(*v4);
    id v6 = __error();
    fprintf(v3, "Warning: failed to get pwInfo: %s (%d)\n", v5, *v6);
  }
  return 0;
}

@end