@interface PFAIReferenceAnchor
+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 contentState:(id)a4;
+ (void)mapReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4 stash:(BOOL)a5;
@end

@implementation PFAIReferenceAnchor

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 contentState:(id)a4
{
  id v6 = [a4 currentReferenceAnchorForEntryOrientation:];
  if (v6)
  {
    id v7 = v6;
    id v8 = [a3 storage];
    v9 = [a4 referenceAnchorStartForEntryOrientation:a3];
    v10 = [v8 length];
    if (v9 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL && v10 != v9)
    {
      v11 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentDocOrientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v8), v9, v10 - v9);
      [a4 setStorageAnchor:v11 forAnchorId:v7];
    }
    [a4 setCurrentReferenceAnchor:0 forEntryOrientation:a3];
    [a4 setReferenceAnchorStart:0x7FFFFFFFFFFFFFFFLL forEntryOrientation:a3];
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4 stash:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [a3 xmlElementId];
  if (v9)
  {
    v10 = +[NSString stringWithXmlString:v9];
    id v11 = [a3 currentEntryOrientationState];
    id v12 = [v11 storage];
    [a1 endCurrentReferenceAnchorForEntryOrientation:v11 contentState:a4];
    id v13 = [v12 length];
    if (v5)
    {
      [a4 setReferenceAnchorStart:[v12 length] forEntryOrientation:v11];
      [a4 setCurrentReferenceAnchor:v10 forEntryOrientation:v11];
    }
    v14 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentDocOrientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v12), v13, 0);
    [a4 setStorageAnchor:v14 forAnchorId:v10];
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4
{
}

+ (void)mapReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4
{
}

@end