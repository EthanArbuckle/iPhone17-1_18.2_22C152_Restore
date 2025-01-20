@interface SBExpanseBannerAuthority
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
@end

@implementation SBExpanseBannerAuthority

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  return 0;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 requesterIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.ConversationKit"];
  if (!v8)
  {
    BOOL v23 = 1;
LABEL_9:
    int v24 = v8 ^ 1;

    goto LABEL_13;
  }
  v9 = [v5 requestIdentifier];
  int v10 = [v9 hasPrefix:@"com.apple.conversationController"];

  if (v10)
  {
    v11 = [v5 requestIdentifier];
    int v12 = [v11 hasPrefix:@"com.apple.conversationController.HUD"];

    if (v12)
    {
      v7 = [v5 viewController];
      v13 = [v7 view];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      v18 = [v5 viewController];
      v19 = [v18 parentViewController];
      v20 = [v19 view];
      [v20 bounds];
      BOOL v23 = v17 == v22 && v15 == v21;

      goto LABEL_9;
    }
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  BOOL v23 = 1;
LABEL_13:
  v25 = [v6 requesterIdentifier];
  unsigned int v26 = [v25 isEqualToString:@"com.apple.ConversationKit"];
  if (v26)
  {
    v27 = [v6 requestIdentifier];
    int v28 = [v27 hasPrefix:@"com.apple.conversationController"];

    if (!v28)
    {
      int v29 = 0;
      unsigned int v26 = 0;
      goto LABEL_19;
    }
    v25 = [v6 requestIdentifier];
    int v29 = [v25 hasPrefix:@"com.apple.conversationController.HUD"];
  }
  else
  {
    int v29 = 0;
  }

LABEL_19:
  return (uint64_t)((unint64_t)(v24 & v29 | ~(v23 | v26)) << 63) >> 63;
}

@end