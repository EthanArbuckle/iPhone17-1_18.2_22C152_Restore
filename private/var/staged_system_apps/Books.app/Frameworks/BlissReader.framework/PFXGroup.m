@interface PFXGroup
+ (void)addChildInfo:(id)a3 toGroupInfo:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXGroup

- (BOOL)mapStartElementWithState:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFXGroup;
  -[PFXDrawable mapStartElementWithState:](&v9, "mapStartElementWithState:");
  id v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  v6 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_46D7E8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
  [v5 setOverriddenStorage:v6];

  v7 = -[THGroupInfo initWithContext:geometry:]([THGroupInfo alloc], "initWithContext:geometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"));
  [v5 setResult:v7];

  return 1;
}

+ (void)addChildInfo:(id)a3 toGroupInfo:(id)a4
{
  if ([a3 conformsToProtocol:&OBJC_PROTOCOL___TSDInfo])
  {
    [a4 addChildInfo:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(a3);
            }
            [a1 addChildInfo:*(void *)(*((void *)&v11 + 1) + 8 * i) toGroupInfo:a4];
          }
          id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  id v6 = [v5 result];
  id v7 = (char *)[v5 childResultCount];
  if (v7)
  {
    id v8 = v7;
    for (i = 0; i != v8; ++i)
      +[PFXGroup addChildInfo:toGroupInfo:](PFXGroup, "addChildInfo:toGroupInfo:", [v5 childResultAtIndex:i], v6);
    [v6 ensureGeometryFitsChildren];
  }
  else
  {
    [v5 setResult:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)PFXGroup;
  [(PFXDrawable *)&v10 mapEndElementWithState:a3];
}

@end