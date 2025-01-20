@interface COSPaymentSetupAssistantController
+ (BOOL)passkitFlowNeedsToRun:(unint64_t *)a3;
+ (id)passLibraryDataProvider;
+ (id)paymentSetupControllerContext;
- (COSPaymentSetupAssistantController)initWithDelegate:(id)a3;
@end

@implementation COSPaymentSetupAssistantController

- (COSPaymentSetupAssistantController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[COSPaymentSetupAssistantController paymentSetupControllerContext];
  [v5 setPeerPaymentDelegate:v4];
  [v5 setDelegate:v4];

  v6 = [[COSPaymentSetupAssistantController alloc] initWithSetupAssistantContext:v5];
  return v6;
}

+ (id)paymentSetupControllerContext
{
  id v2 = [objc_alloc((Class)PKBridgeSetupAssistantContext) initWithSetupAssistant:2];
  v3 = [UIApp bridgeController];
  unsigned int v4 = [v3 isTinkerPairing];

  if (v4)
  {
    v5 = [UIApp setupController];
    v6 = [v5 tinkerFamilyMember];
    v7 = [v5 pairingParentFamilyMember];
    if (!v7)
    {
      v8 = pbb_bridge_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PK Setup Assistant found no pairing member. Falling back to organizer family member.", v11, 2u);
      }

      v7 = [v5 organizerFamilyMember];
    }
    [v2 setPairingFamilyMember:v6];
    [v2 setParentFamilyMember:v7];
  }
  v9 = +[COSPaymentSetupAssistantController passLibraryDataProvider];
  [v2 setDataProvider:v9];

  return v2;
}

+ (BOOL)passkitFlowNeedsToRun:(unint64_t *)a3
{
  unsigned int v4 = +[COSPaymentSetupAssistantController paymentSetupControllerContext];
  v5 = [[COSPaymentSetupAssistantController alloc] initWithSetupAssistantContext:v4];
  unint64_t v9 = 0;
  unsigned int v6 = [(COSPaymentSetupAssistantController *)v5 setupAssistantNeedsToRunReturningRequirements:&v9];
  *a3 = v9;
  v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PK Setup Assistant advises Passkit Flow needs to run: %{BOOL}d", buf, 8u);
  }

  return v6;
}

+ (id)passLibraryDataProvider
{
  id v2 = [@"/System/Library/NanoPreferenceBundles/Applications/" stringByAppendingPathComponent:@"NanoPassbookBridgeSettings"];
  v3 = [v2 stringByAppendingPathExtension:@"bundle"];

  unsigned int v4 = +[NSBundle bundleWithPath:v3];
  if (([v4 isLoaded] & 1) == 0) {
    [v4 load];
  }
  id v5 = [v4 classNamed:@"NPKPassbookPaymentSetupDelegate"];
  SEL v6 = NSSelectorFromString(@"sharedSetupDelegate");
  if (objc_opt_respondsToSelector())
  {
    v7 = ((void (*)(id, SEL))[v5 methodForSelector:v6])(v5, v6);
  }
  else
  {
    v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to invoke +[NPKPassbookPaymentSetupDelegate sharedSetupDelegate]!", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

@end