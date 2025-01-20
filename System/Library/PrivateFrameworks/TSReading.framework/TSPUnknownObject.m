@interface TSPUnknownObject
- (OS_dispatch_data)serializedData;
- (TSPUnknownObject)initWithContext:(id)a3;
- (id)packageLocator;
- (void)willModify;
- (void)willModifyForUpgrade;
@end

@implementation TSPUnknownObject

- (TSPUnknownObject)initWithContext:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F7C7F0] currentHandler];
  v5 = [NSString stringWithUTF8String:"-[TSPUnknownObject initWithContext:]"];
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPUnknownObject.mm"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:29 description:@"Do not call method"];

  v7 = (void *)MEMORY[0x263EFF940];
  v8 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPUnknownObject initWithContext:]"];
  id v9 = [v7 exceptionWithName:*MEMORY[0x263EFF498] reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (void)willModify
{
  id v4 = [MEMORY[0x263F7C7F0] currentHandler];
  v2 = [NSString stringWithUTF8String:"-[TSPUnknownObject willModify]"];
  id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPUnknownObject.mm"];
  [v4 handleFailureInFunction:v2 file:v3 lineNumber:34 description:@"Unknown objects should never be modified."];
}

- (void)willModifyForUpgrade
{
  id v4 = [MEMORY[0x263F7C7F0] currentHandler];
  v2 = [NSString stringWithUTF8String:"-[TSPUnknownObject willModifyForUpgrade]"];
  id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPUnknownObject.mm"];
  [v4 handleFailureInFunction:v2 file:v3 lineNumber:39 description:@"Unknown objects should never be modified."];
}

- (id)packageLocator
{
  return self->_packageLocator;
}

- (OS_dispatch_data)serializedData
{
  return self->_serializedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_packageLocator, 0);
}

@end