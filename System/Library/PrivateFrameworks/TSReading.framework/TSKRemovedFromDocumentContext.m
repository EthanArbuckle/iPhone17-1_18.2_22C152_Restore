@interface TSKRemovedFromDocumentContext
+ (id)hidingContext;
+ (id)movingContext;
- (BOOL)wasHidden;
- (BOOL)wasMoved;
- (id)undoContext;
@end

@implementation TSKRemovedFromDocumentContext

+ (id)movingContext
{
  {
    +[TSKRemovedFromDocumentContext movingContext]::sMovingContext = objc_alloc_init(TSKRemovedFromDocumentContext_Moving);
  }
  return (id)+[TSKRemovedFromDocumentContext movingContext]::sMovingContext;
}

+ (id)hidingContext
{
  {
    +[TSKRemovedFromDocumentContext hidingContext]::sHidingContext = objc_alloc_init(TSKRemovedFromDocumentContext_Hiding);
  }
  return (id)+[TSKRemovedFromDocumentContext hidingContext]::sHidingContext;
}

- (BOOL)wasMoved
{
  return 0;
}

- (BOOL)wasHidden
{
  return 0;
}

- (id)undoContext
{
  return 0;
}

@end