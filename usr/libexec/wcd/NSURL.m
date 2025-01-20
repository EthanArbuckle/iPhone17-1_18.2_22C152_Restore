@interface NSURL
- (id)wc_URLWithLastPathComponentAsDirectory;
@end

@implementation NSURL

- (id)wc_URLWithLastPathComponentAsDirectory
{
  v2 = self;
  v3 = [(NSURL *)v2 absoluteString];
  if (([v3 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v4 = [v3 stringByAppendingString:@"/"];

    uint64_t v5 = +[NSURL URLWithString:v4];

    v2 = (NSURL *)v5;
    v3 = (void *)v4;
  }

  return v2;
}

@end