@interface DIIOMedia
- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4;
- (NSString)BSDName;
- (id)copyBlockDeviceWithError:(id *)a3;
@end

@implementation DIIOMedia

- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 lastPathComponent];
  CFDictionaryRef v8 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v7 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v8);

  if (MatchingService)
  {
    v13.receiver = self;
    v13.super_class = (Class)DIIOMedia;
    self = [(DIIOObject *)&v13 initWithIOObject:MatchingService];
    v10 = self;
  }
  else
  {
    v11 = +[NSString stringWithFormat:@"Failed to find IO media entry for %@", v6];
    v10 = +[DIError nilWithEnumValue:153 verboseInfo:v11 error:a4];
  }
  return v10;
}

- (NSString)BSDName
{
  id v2 = [(DIIOObject *)self copyPropertyWithClass:objc_opt_class() key:@"BSD Name"];

  return (NSString *)v2;
}

- (id)copyBlockDeviceWithError:(id *)a3
{
  v3 = [(DIIOObject *)self ioObjectWithClassName:@"IOBlockStorageDevice" iterateParent:1 error:a3];
  v4 = [(DIIOObject *)[DIBlockDevice alloc] initWithDIIOObject:v3];

  return v4;
}

@end