@interface FedStatsCohortQueryInstalledAppsMedia
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
@end

@implementation FedStatsCohortQueryInstalledAppsMedia

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  if ([(FedStatsCohortQueryInstalledApps *)self numOfMediaApps] <= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", -[FedStatsCohortQueryInstalledApps numOfMediaApps](self, "numOfMediaApps"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = @"at_least_10";
  }
  return v5;
}

@end