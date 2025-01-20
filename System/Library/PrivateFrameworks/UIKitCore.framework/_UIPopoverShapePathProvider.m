@interface _UIPopoverShapePathProvider
+ (id)defaultProviderForIdiom:(int64_t)a3;
- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3;
@end

@implementation _UIPopoverShapePathProvider

+ (id)defaultProviderForIdiom:(int64_t)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIPopoverShapePathProvider.m" lineNumber:32 description:@"Calling -generatePopoverPathForParameters: on instance abstract class _UIPopoverShapePathProvider."];

  return 0;
}

@end