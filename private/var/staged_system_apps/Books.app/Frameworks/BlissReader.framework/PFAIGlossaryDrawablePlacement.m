@interface PFAIGlossaryDrawablePlacement
- (void)addFloatingDrawable:(id)a3 withState:(id)a4;
- (void)mapNonChildPlacementModeWithState:(id)a3;
- (void)mapNonChildResults:(id)a3 withState:(id)a4;
@end

@implementation PFAIGlossaryDrawablePlacement

- (void)addFloatingDrawable:(id)a3 withState:(id)a4
{
  id v5 = [a4 entryBody];

  [v5 addFloatingInfo:a3];
}

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  if ([a3 ancestorEntryWithReaderClass:objc_opt_class()]) {
    goto LABEL_2;
  }
  self->super.mMode = 1;
  id v6 = [a3 currentHtmlStackEntry];
  if (xmlStrEqual((const xmlChar *)[v6 xmlElementName], (const xmlChar *)"table"))
  {
    id v7 = [[[v6 currentEntryMediaState] propertySet] valueForProperty:@"position"];
    if ([v7 count] == (char *)&dword_0 + 1)
    {
      objc_opt_class();
      [v7 lastObject];
      uint64_t v8 = TSUDynamicCast();
      if (v8)
      {
        if ([PFSUtilities identValueOrNilFromPair:v8] isEqualToString:@"absolute")int v5 = 1; {
        else
        }
          int v5 = 2;
        goto LABEL_3;
      }
    }
LABEL_2:
    int v5 = 2;
LABEL_3:
    self->super.mMode = v5;
  }
}

- (void)mapNonChildResults:(id)a3 withState:(id)a4
{
  if (self->super.mMode == 1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v10 conformsToProtocol:&OBJC_PROTOCOL___TSDInfo]) {
            objc_msgSend(objc_msgSend(a4, "entryBody"), "addFloatingInfo:", v10);
          }
        }
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

@end