@interface GQDBGBodyPlaceholder
+ (const)stateForReading;
- (BOOL)isBlank;
- (id)layoutFrame;
- (void)dealloc;
@end

@implementation GQDBGBodyPlaceholder

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9DD58;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDBGBodyPlaceholder;
  [(GQDBGPlaceholder *)&v3 dealloc];
}

- (id)layoutFrame
{
  return self->mFrame;
}

- (BOOL)isBlank
{
  mFrame = self->mFrame;
  if (mFrame) {
    return [(GQDWPLayoutFrame *)mFrame isBlank];
  }
  else {
    return 1;
  }
}

@end