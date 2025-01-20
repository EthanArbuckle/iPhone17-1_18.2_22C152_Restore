@interface ICMinimalDeviceInfo
- (ICMinimalDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5;
- (id)debugDescription;
- (id)description;
@end

@implementation ICMinimalDeviceInfo

- (ICMinimalDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ICMinimalDeviceInfo;
  return [(ICMigrationDeviceInfo *)&v6 initWithName:a3 upgradable:a4 upgraded:a5];
}

- (id)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)ICMinimalDeviceInfo;
  v3 = [(ICMinimalDeviceInfo *)&v9 description];
  v4 = [(ICMigrationDeviceInfo *)self name];
  if ([(ICMigrationDeviceInfo *)self upgradable]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  if ([(ICMigrationDeviceInfo *)self upgraded]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = +[NSString stringWithFormat:@"%@ <name: %@, Upgradable: %@, Upgraded: %@", v3, v4, v5, v6];

  return v7;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)ICMinimalDeviceInfo;
  v3 = [(ICMinimalDeviceInfo *)&v8 description];
  if ([(ICMigrationDeviceInfo *)self upgradable]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  if ([(ICMigrationDeviceInfo *)self upgraded]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  CFStringRef v6 = +[NSString stringWithFormat:@"%@ <Upgradable: %@, Upgraded: %@", v3, v4, v5];

  return v6;
}

@end