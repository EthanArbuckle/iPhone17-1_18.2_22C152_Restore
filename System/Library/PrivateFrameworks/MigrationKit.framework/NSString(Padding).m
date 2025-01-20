@interface NSString(Padding)
- (id)padLeftToLength:()Padding withString:;
- (id)padToLength:()Padding withString:;
- (uint64_t)padRightToLength:()Padding withString:;
@end

@implementation NSString(Padding)

- (id)padLeftToLength:()Padding withString:
{
  id v6 = a4;
  int v7 = [a1 length];
  if (a3 - v7 < 0)
  {
    id v9 = a1;
  }
  else
  {
    v8 = [&stru_26DF6A8B0 stringByPaddingToLength:(a3 - v7) withString:v6 startingAtIndex:0];
    id v9 = [NSString stringWithFormat:@"%@%@", v8, a1];
  }
  return v9;
}

- (uint64_t)padRightToLength:()Padding withString:
{
  return [a1 stringByPaddingToLength:a3 withString:a4 startingAtIndex:0];
}

- (id)padToLength:()Padding withString:
{
  id v6 = a4;
  double v7 = (double)a3 * 0.5 - (double)(unint64_t)[a1 length] * 0.5;
  if (v7 >= 0.0)
  {
    id v9 = [&stru_26DF6A8B0 stringByPaddingToLength:vcvtmd_u64_f64(v7) withString:v6 startingAtIndex:0];
    v10 = [&stru_26DF6A8B0 stringByPaddingToLength:vcvtpd_u64_f64(v7) withString:v6 startingAtIndex:0];
    id v8 = [NSString stringWithFormat:@"%@%@%@", v9, a1, v10];
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

@end