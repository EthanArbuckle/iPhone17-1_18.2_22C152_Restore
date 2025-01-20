@interface SXLinkActionURLQualifier
- (BOOL)allowCopyingOfURL:(id)a3;
- (BOOL)allowOpenInNewWindowForURL:(id)a3;
- (BOOL)allowOpenInSafariForURL:(id)a3;
@end

@implementation SXLinkActionURLQualifier

- (BOOL)allowOpenInSafariForURL:(id)a3
{
  return 1;
}

- (BOOL)allowCopyingOfURL:(id)a3
{
  return 1;
}

- (BOOL)allowOpenInNewWindowForURL:(id)a3
{
  return 0;
}

@end