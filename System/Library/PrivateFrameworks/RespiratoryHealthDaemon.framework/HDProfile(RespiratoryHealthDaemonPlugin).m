@interface HDProfile(RespiratoryHealthDaemonPlugin)
- (id)respiratoryExtension;
@end

@implementation HDProfile(RespiratoryHealthDaemonPlugin)

- (id)respiratoryExtension
{
  v4 = [a1 profileExtensionWithIdentifier:*MEMORY[0x263F641F0]];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:a2, a1, @"HDProfile+RespiratoryHealthDaemonPlugin.m", 20, @"Unexpected class for respiratory health profile extension: %@", objc_opt_class() object file lineNumber description];
    }
  }
  return v4;
}

@end