@interface PCTestingRig
+ (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5;
@end

@implementation PCTestingRig

+ (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(PCSupportRequester);
  [(PCSupportRequester *)v10 invokeTestingRigHandlerForMessage:v9 payload:v8 completionHandler:v7];
}

@end