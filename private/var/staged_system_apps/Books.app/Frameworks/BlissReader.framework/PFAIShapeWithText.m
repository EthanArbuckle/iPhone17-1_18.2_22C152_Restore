@interface PFAIShapeWithText
- (void)updateLineHintsWithShape:(id)a3 readerState:(id)a4;
@end

@implementation PFAIShapeWithText

- (void)updateLineHintsWithShape:(id)a3 readerState:(id)a4
{
  objc_opt_class();
  v5 = (void *)TSUDynamicCast();
  if ([v5 paginatedIsCurrent])
  {
    id v6 = objc_msgSend(objc_msgSend(v5, "currentStackEntry"), "paginatedState");
    id v7 = +[PFAIDrawablePlacement lineHintsForPropertySet:textStorage:contentState:](PFAIDrawablePlacement, "lineHintsForPropertySet:textStorage:contentState:", [v6 propertySet], objc_msgSend(v6, "storage"), v5);
    [a3 setLineHints:v7];
  }
}

@end