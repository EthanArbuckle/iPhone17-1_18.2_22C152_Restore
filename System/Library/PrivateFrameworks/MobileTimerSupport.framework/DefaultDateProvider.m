@interface DefaultDateProvider
- (id)date;
@end

@implementation DefaultDateProvider

- (id)date
{
  return (id)[MEMORY[0x1E4F1C9C8] now];
}

@end