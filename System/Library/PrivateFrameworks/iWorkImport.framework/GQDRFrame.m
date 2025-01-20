@interface GQDRFrame
+ (const)stateForReading;
- (GQDRFrame)init;
@end

@implementation GQDRFrame

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9EEC8;
}

- (GQDRFrame)init
{
  v5.receiver = self;
  v5.super_class = (Class)GQDRFrame;
  v2 = [(GQDRFrame *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->super.mMiterLimit = 4.0;
    v2->super.mWidth = 2.0;
    v2->super.mCap = 0;
    v2->super.mJoin = 0;
    v2->super.mColor = (GQDColor *)+[GQDColor blackColor];
    v3->super.mPattern = (GQDRStrokePattern *)+[GQDRStrokePattern solidPattern];
  }
  return v3;
}

@end