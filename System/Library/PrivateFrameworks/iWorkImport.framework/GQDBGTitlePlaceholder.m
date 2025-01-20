@interface GQDBGTitlePlaceholder
+ (const)stateForReading;
- (BOOL)isBlank;
- (id)layoutFrame;
- (void)dealloc;
@end

@implementation GQDBGTitlePlaceholder

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9E220;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDBGTitlePlaceholder;
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