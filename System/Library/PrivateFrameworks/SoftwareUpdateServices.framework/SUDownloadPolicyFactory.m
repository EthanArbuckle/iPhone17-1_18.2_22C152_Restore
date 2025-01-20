@interface SUDownloadPolicyFactory
+ (id)_userDownloadPolicyFromCurrentPolicy:(id)a3 descriptor:(id)a4 networkMonitor:(id)a5 allowCellularOverride:(BOOL)a6;
+ (id)downloadPolicyForType:(int)a3 forDescriptor:(id)a4;
+ (id)userDownloadPolicyForDescriptor:(id)a3;
+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4;
+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4 allowCellularOverride:(BOOL)a5;
+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4 networkMonitor:(id)a5 allowCellularOverride:(BOOL)a6;
+ (int)downloadPolicyTypeForClass:(id)a3;
@end

@implementation SUDownloadPolicyFactory

+ (id)_userDownloadPolicyFromCurrentPolicy:(id)a3 descriptor:(id)a4 networkMonitor:(id)a5 allowCellularOverride:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v11)
  {
    v16 = 0;
    goto LABEL_23;
  }
  if (!v12)
  {
    v13 = +[SUNetworkMonitor sharedInstance];
  }
  int v14 = [a1 downloadPolicyTypeForClass:v10];
  if (!a6)
  {
    int v17 = v14;
    int v18 = [v13 isCellularRoaming];
    int v19 = [v13 isCellularDataRoamingEnabled];
    if (v18 && v19)
    {
      int v20 = [v13 currentNetworkType];
      if (v10) {
        BOOL v21 = v17 == 0;
      }
      else {
        BOOL v21 = 0;
      }
      char v22 = v21;
      v15 = off_26447C000;
      if (v20 != 1 || (v22 & 1) != 0) {
        goto LABEL_22;
      }
    }
    else if (v10 && !v17)
    {
      v15 = off_26447C000;
      goto LABEL_22;
    }
    v15 = off_26447C008;
    goto LABEL_22;
  }
  v15 = off_26447BFF8;
LABEL_22:
  v16 = (void *)[objc_alloc(*v15) initWithDescriptor:v11];
LABEL_23:

  return v16;
}

+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4 networkMonitor:(id)a5 allowCellularOverride:(BOOL)a6
{
  return (id)[a1 _userDownloadPolicyFromCurrentPolicy:a4 descriptor:a3 networkMonitor:a5 allowCellularOverride:a6];
}

+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4 allowCellularOverride:(BOOL)a5
{
  return (id)[a1 userDownloadPolicyForDescriptor:a3 existingPolicy:a4 networkMonitor:0 allowCellularOverride:a5];
}

+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4
{
  return (id)[a1 userDownloadPolicyForDescriptor:a3 existingPolicy:a4 networkMonitor:0 allowCellularOverride:0];
}

+ (id)userDownloadPolicyForDescriptor:(id)a3
{
  return (id)[a1 userDownloadPolicyForDescriptor:a3 existingPolicy:0];
}

+ (id)downloadPolicyForType:(int)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  if ((a3 - 1) > 3) {
    v6 = off_26447C000;
  }
  else {
    v6 = off_26447F030[a3 - 1];
  }
  v7 = (void *)[objc_alloc(*v6) initWithDescriptor:v5];

  return v7;
}

+ (int)downloadPolicyTypeForClass:(id)a3
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    return 1;
  }
  if (v3 == objc_opt_class()) {
    return 2;
  }
  if (v3 == objc_opt_class()) {
    return 3;
  }
  return 4 * (v3 == objc_opt_class());
}

@end