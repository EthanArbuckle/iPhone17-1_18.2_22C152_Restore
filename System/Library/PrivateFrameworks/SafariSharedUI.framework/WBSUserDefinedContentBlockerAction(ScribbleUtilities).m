@interface WBSUserDefinedContentBlockerAction(ScribbleUtilities)
- (BOOL)isSimilarToAction:()ScribbleUtilities;
@end

@implementation WBSUserDefinedContentBlockerAction(ScribbleUtilities)

- (BOOL)isSimilarToAction:()ScribbleUtilities
{
  id v4 = a3;
  v5 = [a1 renderTreeText];
  v6 = [v4 renderTreeText];
  if (objc_msgSend(v5, "safari_hasSimilarText:", v6))
  {
  }
  else
  {
    v7 = [a1 imageAnalysisText];
    v8 = [v4 imageAnalysisText];
    int v9 = objc_msgSend(v7, "safari_hasSimilarText:", v8);

    if (!v9)
    {
      BOOL v22 = 0;
      goto LABEL_6;
    }
  }
  [v4 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [a1 bounds];
  BOOL v22 = targetedElementRectsAreSimilar(v11, v13, v15, v17, v18, v19, v20, v21);
LABEL_6:

  return v22;
}

@end