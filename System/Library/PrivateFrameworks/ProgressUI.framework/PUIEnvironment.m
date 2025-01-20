@interface PUIEnvironment
- (id)mainScreenScale;
- (int)deviceClass;
- (int)mainScreenClass;
- (int)productType;
@end

@implementation PUIEnvironment

- (int)productType
{
  return MEMORY[0x270F95FD8](self, a2);
}

- (int)deviceClass
{
  return MGGetSInt32Answer();
}

- (int)mainScreenClass
{
  return MGGetSInt32Answer();
}

- (id)mainScreenScale
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

@end