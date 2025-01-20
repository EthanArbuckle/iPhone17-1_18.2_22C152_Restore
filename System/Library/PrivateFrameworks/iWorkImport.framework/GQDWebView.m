@interface GQDWebView
+ (const)stateForReading;
- (id)imageBinary;
- (void)dealloc;
@end

@implementation GQDWebView

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A0DD8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWebView;
  [(GQDGraphic *)&v3 dealloc];
}

- (id)imageBinary
{
  return self->mImageBinary;
}

@end