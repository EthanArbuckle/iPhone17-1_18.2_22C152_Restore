@interface NSURL
- (id)URLByReplacingHost:(id)a3;
@end

@implementation NSURL

- (id)URLByReplacingHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSURL *)self host];
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = [(NSURL *)self absoluteString];
    id v10 = [v8 rangeOfString:v6];
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      v11 = [v8 stringByReplacingCharactersInRange:v10 withString:v9];
      v7 = +[NSURL URLWithString:v11];
    }
  }

  return v7;
}

@end