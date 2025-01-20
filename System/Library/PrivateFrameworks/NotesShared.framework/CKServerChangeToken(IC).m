@interface CKServerChangeToken(IC)
- (id)ic_loggingDescription;
@end

@implementation CKServerChangeToken(IC)

- (id)ic_loggingDescription
{
  v1 = NSString;
  v2 = [a1 data];
  v3 = [v2 base64EncodedStringWithOptions:0];
  v4 = [v1 stringWithFormat:@"<ServerChangeToken %@>", v3];

  return v4;
}

@end