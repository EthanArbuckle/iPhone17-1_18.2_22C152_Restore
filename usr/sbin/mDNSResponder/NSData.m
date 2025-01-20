@interface NSData
- (id)describeAddr;
@end

@implementation NSData

- (id)describeAddr
{
  v3 = [(NSData *)self length];
  if (v3)
  {
    v6[0] = 0;
    v6[1] = 0;
    int v7 = 0;
    int v4 = _unicast_assist_data_to_addr(self, (int *)v6);
    v3 = 0;
    if (!v4)
    {
      uint64_t v9 = 0;
      memset(v8, 0, sizeof(v8));
      mDNS_snprintf(v8);
      v3 = +[NSString stringWithFormat:@"%s", v8];
    }
  }

  return v3;
}

@end