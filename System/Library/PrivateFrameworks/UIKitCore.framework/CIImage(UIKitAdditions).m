@interface CIImage(UIKitAdditions)
- (uint64_t)initWithImage:()UIKitAdditions;
- (uint64_t)initWithImage:()UIKitAdditions options:;
@end

@implementation CIImage(UIKitAdditions)

- (uint64_t)initWithImage:()UIKitAdditions
{
  uint64_t v4 = [a3 CGImage];
  if (v4)
  {
    return [a1 initWithCGImage:v4];
  }
  else
  {

    return 0;
  }
}

- (uint64_t)initWithImage:()UIKitAdditions options:
{
  id v6 = a4;
  uint64_t v7 = [a3 CGImage];
  if (v7)
  {
    uint64_t v8 = [a1 initWithCGImage:v7 options:v6];
  }
  else
  {

    uint64_t v8 = 0;
  }

  return v8;
}

@end