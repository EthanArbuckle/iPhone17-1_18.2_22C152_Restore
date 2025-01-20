@interface ICMinimalDeviceInfo
- (ICMinimalDeviceInfo)init;
- (ICMinimalDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5;
- (id)description;
- (id)loggableDescription;
@end

@implementation ICMinimalDeviceInfo

- (ICMinimalDeviceInfo)init
{
  return 0;
}

- (ICMinimalDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ICMinimalDeviceInfo;
  return [(ICMigrationDeviceInfo *)&v6 initWithName:a3 upgradable:a4 upgraded:a5];
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)ICMinimalDeviceInfo;
  v3 = [(ICMinimalDeviceInfo *)&v10 description];
  v4 = NSString;
  v5 = [(ICMigrationDeviceInfo *)self name];
  if ([(ICMigrationDeviceInfo *)self upgradable]) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  if ([(ICMigrationDeviceInfo *)self upgraded]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [v4 stringWithFormat:@"%@ <name: %@, Upgradable: %@, Upgraded: %@", v3, v5, v6, v7];

  return v8;
}

- (id)loggableDescription
{
  v9.receiver = self;
  v9.super_class = (Class)ICMinimalDeviceInfo;
  v3 = [(ICMinimalDeviceInfo *)&v9 description];
  v4 = NSString;
  if ([(ICMigrationDeviceInfo *)self upgradable]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(ICMigrationDeviceInfo *)self upgraded]) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  v7 = [v4 stringWithFormat:@"%@ <Upgradable: %@, Upgraded: %@", v3, v5, v6];

  return v7;
}

@end