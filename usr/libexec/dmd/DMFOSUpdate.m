@interface DMFOSUpdate
+ (id)productKeyFromBuild:(id)a3;
- (id)initWithDescriptor:(id)a3;
@end

@implementation DMFOSUpdate

+ (id)productKeyFromBuild:(id)a3
{
  CFStringRef v3 = &stru_1000CC390;
  if (a3) {
    CFStringRef v3 = (const __CFString *)a3;
  }
  return +[NSString stringWithFormat:@"%@%@", @"iOSUpdate", v3];
}

- (id)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 productBuildVersion];

  if (v5)
  {
    v5 = [v4 productBuildVersion];
    id v6 = [(id)objc_opt_class() productKeyFromBuild:v5];
  }
  else
  {
    id v6 = [@"iOSUpdate" copy];
  }
  id v7 = v6;
  unsigned int v8 = [v4 updateType];
  unsigned __int8 v9 = [v4 isSplatOnly];
  id v10 = [v5 copy];
  id v11 = v4;
  v22 = v7;
  if (objc_opt_respondsToSelector())
  {
    v12 = [v11 productVersionExtra];
  }
  else
  {
    unsigned int v13 = [v11 isSplatOnly];

    v14 = @"(?)";
    if (!v13) {
      v14 = 0;
    }
    v12 = v14;
  }
  BOOL v15 = v8 == 3;
  v16 = [v11 humanReadableUpdateName];
  v17 = [v11 productSystemName];
  v18 = [v11 productVersion];
  BYTE3(v21) = v9;
  *(_WORD *)((char *)&v21 + 1) = 1;
  LOBYTE(v21) = v15;
  v19 = -[DMFOSUpdate initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:](self, "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:", v22, v16, v17, v18, v5, [v11 downloadSize], objc_msgSend(v11, "installationSize"), v21, v10, v12);

  return v19;
}

@end