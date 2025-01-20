@interface ICHelp
+ (NSURL)lockedNotesSupportURL;
+ (NSURL)smartFoldersSupportURL;
+ (void)presentWithTopic:(id)a3 presentingViewController:(id)a4;
@end

@implementation ICHelp

+ (NSURL)smartFoldersSupportURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT212507"];
}

+ (NSURL)lockedNotesSupportURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/guide/security/secure-features-in-the-notes-app-sec1782bcab1"];
}

+ (void)presentWithTopic:(id)a3 presentingViewController:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  id v7 = a3;
  if (([v5 isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"+[ICHelp presentWithTopic:presentingViewController:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v9 = [MEMORY[0x1E4F67E68] helpViewController];
  [v9 setShowTopicViewOnLoad:1];
  [v9 setDisplayHelpTopicsOnly:1];
  [v9 setSelectedHelpTopicID:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  [v8 setModalPresentationStyle:2];
  [v6 presentViewController:v8 animated:1 completion:0];
}

@end