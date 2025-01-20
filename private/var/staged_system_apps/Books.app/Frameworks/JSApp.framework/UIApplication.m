@interface UIApplication
+ (id)jsa_sharedApplicationIfNotExtension;
- (void)jsa_openExternalURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation UIApplication

- (void)jsa_openExternalURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  id v14 = a4;
  id v8 = a5;
  id v13 = v8;
  if (_UIApplicationIsExtension())
  {
    id v9 = objc_retainBlock(v8);
    v10 = v9;
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
  else
  {
    v11 = [(UIApplication *)self methodSignatureForSelector:"openURL:options:completionHandler:"];
    v12 = +[NSInvocation invocationWithMethodSignature:v11];

    [v12 setSelector:"openURL:options:completionHandler:"];
    [v12 setTarget:self];
    [v12 setArgument:&v15 atIndex:2];
    [v12 setArgument:&v14 atIndex:3];
    [v12 setArgument:&v13 atIndex:4];
    [v12 invoke];

    id v8 = v13;
  }
}

+ (id)jsa_sharedApplicationIfNotExtension
{
  v2 = (void *)_sSo13UIApplicationC5JSAppE20sharedIfNotExtensionABSgvgZ_0();

  return v2;
}

@end