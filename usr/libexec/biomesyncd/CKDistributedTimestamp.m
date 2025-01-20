@interface CKDistributedTimestamp
- (id)bm_description;
@end

@implementation CKDistributedTimestamp

- (id)bm_description
{
  v3 = [(CKDistributedTimestamp *)self siteIdentifierObject];
  v4 = [v3 identifier];

  id v5 = [v4 bytes];
  id v6 = objc_alloc((Class)NSString);
  if (v5) {
    id v7 = [[v6 initWithFormat:@"%.8s:%lu", objc_msgSend(v4, "bytes"), -[CKDistributedTimestamp clockValue](self, "clockValue")];
  }
  else {
    id v7 = [v6 initWithFormat:@"(null):%lu", -[CKDistributedTimestamp clockValue](self, "clockValue"), v10];
  }
  v8 = v7;

  return v8;
}

@end