@interface PFEIReferenceAnchor
+ (void)endCurrentReferenceAnchorWithContentState:(id)a3;
+ (void)mapReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4 stash:(BOOL)a5;
@end

@implementation PFEIReferenceAnchor

+ (void)endCurrentReferenceAnchorWithContentState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  id v5 = [a3 referenceAnchorID];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v4 storage];
    v8 = [a3 referenceAnchorStartIndex];
    v9 = [v7 length];
    if (v8 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL && v9 != v8)
    {
      v10 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v7), v8, v9 - v8);
      [a3 setStorageAnchor:v10 forAnchorId:v6];
    }
    [a3 setReferenceAnchorID:0];
    [a3 setReferenceAnchorStartIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4 stash:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [a3 xmlElementId];
  if (v9)
  {
    v10 = +[NSString stringWithXmlString:v9];
    id v11 = objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "storage");
    [a1 endCurrentReferenceAnchorWithContentState:a4];
    id v12 = [v11 length];
    if (v5)
    {
      [a4 setReferenceAnchorStartIndex:[v11 length]];
      [a4 setReferenceAnchorID:v10];
    }
    v13 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a4, "orientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v11), v12, 0);
    [a4 setStorageAnchor:v13 forAnchorId:v10];
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4
{
}

+ (void)mapReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4
{
}

@end