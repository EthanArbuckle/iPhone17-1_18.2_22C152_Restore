@interface APA9nErrorBucketObjC
+ (int64_t)findBucketForCode:(int64_t)a3 type:(int64_t)a4;
- (APA9nErrorBucketObjC)init;
@end

@implementation APA9nErrorBucketObjC

+ (int64_t)findBucketForCode:(int64_t)a3 type:(int64_t)a4
{
  return sub_10007581C(a3, a4);
}

- (APA9nErrorBucketObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for A9nErrorBucketObjC();
  return [(APA9nErrorBucketObjC *)&v3 init];
}

@end