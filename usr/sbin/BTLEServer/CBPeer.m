@interface CBPeer
- (id)msgIdentifier;
@end

@implementation CBPeer

- (id)msgIdentifier
{
  v2 = [(CBPeer *)self identifier];
  v3 = [v2 UUIDString];
  CFUUIDRef v4 = CFUUIDCreateFromString(kCFAllocatorDefault, v3);

  return (id)CFAutorelease(v4);
}

@end