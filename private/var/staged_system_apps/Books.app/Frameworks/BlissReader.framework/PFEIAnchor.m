@interface PFEIAnchor
+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEIAnchor

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  objc_msgSend(objc_msgSend(v5, "parentEntry"), "reader");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(objc_msgSend(objc_msgSend(v5, "parentEntry"), "parentEntry"), "reader"),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    [a3 setCfiPathForCurrentStorage];
  }
  v7.receiver = self;
  v7.super_class = (Class)PFEIAnchor;
  return [(PFXAnchor *)&v7 mapStartElementWithState:a3];
}

- (void)mapEndElementWithState:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PFEIAnchor;
  -[PFXAnchor mapEndElementWithState:](&v11, "mapEndElementWithState:");
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v6 = [v5 originalStorage];
  objc_super v7 = [v5 startCharIndex];
  v8 = [v6 length];
  int64_t v9 = v8 - v7;
  if (v8 != v7)
  {
    objc_opt_class();
    [v6 smartFieldAtCharIndex:v7 attributeKind:6 effectiveRange:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_217F3C;
    v10[3] = &unk_457A38;
    v10[4] = TSUDynamicCast();
    [v6 enumerateAttachmentsOfClass:objc_opt_class() inTextRange:v7 usingBlock:v9, v10];
  }
  objc_msgSend(objc_msgSend(v4, "parentEntry"), "reader");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(objc_msgSend(objc_msgSend(v4, "parentEntry"), "parentEntry"), "reader");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      [v5 firstChildResultWithElementName:@"img"];
      [v5 setResult:TSUDynamicCast()];
    }
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
}

@end