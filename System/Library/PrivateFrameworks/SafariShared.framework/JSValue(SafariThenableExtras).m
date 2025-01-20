@interface JSValue(SafariThenableExtras)
- (BOOL)safari_isThenable;
- (void)safari_awaitThenableResolutionWithCompletionHandler:()SafariThenableExtras;
@end

@implementation JSValue(SafariThenableExtras)

- (BOOL)safari_isThenable
{
  v2 = [a1 context];
  v3 = (const OpaqueJSContext *)[v2 JSGlobalContextRef];

  v4 = (const OpaqueJSValue *)[a1 JSValueRef];
  if (!JSValueIsObject(v3, v4)) {
    return 0;
  }
  v5 = JSValueToObject(v3, v4, 0);
  return SafariShared::JSUtilities::functionObjectByName(v3, v5, (OpaqueJSValue *)"then", v6) != 0;
}

- (void)safari_awaitThenableResolutionWithCompletionHandler:()SafariThenableExtras
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__JSValue_SafariThenableExtras__safari_awaitThenableResolutionWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5C8C6B0;
  id v5 = v4;
  id v16 = v5;
  v6 = (void *)MEMORY[0x1AD0C4F80](v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__JSValue_SafariThenableExtras__safari_awaitThenableResolutionWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5C8C6B0;
  id v7 = v5;
  id v14 = v7;
  v8 = (void *)MEMORY[0x1AD0C4F80](v13);
  v9 = (void *)MEMORY[0x1AD0C4F80](v6);
  v17[0] = v9;
  v10 = (void *)MEMORY[0x1AD0C4F80](v8);
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v12 = (id)[a1 invokeMethod:@"then" withArguments:v11];
}

@end