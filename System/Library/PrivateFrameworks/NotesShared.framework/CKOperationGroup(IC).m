@interface CKOperationGroup(IC)
- (id)ic_loggingValues;
@end

@implementation CKOperationGroup(IC)

- (id)ic_loggingValues
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [a1 name];
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:@"name"];
  }
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "quantity"));
  [v2 setObject:v4 forKeyedSubscript:@"quantity"];

  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1, "expectedSendSize"));
  [v2 setObject:v5 forKeyedSubscript:@"expectedSendSize"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1, "expectedReceiveSize"));
  [v2 setObject:v6 forKeyedSubscript:@"expectedReceiveSize"];

  return v2;
}

@end