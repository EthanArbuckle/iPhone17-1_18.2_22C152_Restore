@interface MCDBrowseItemsContentManager
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4;
@end

@implementation MCDBrowseItemsContentManager

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(MCDFuseContentManager *)self contentResults];

  if (v7)
  {
    v8 = [(MCDFuseContentManager *)self contentResults];
    id v9 = [v8 numberOfItemsInSection:a4];

    int64_t v10 = [(MCDBrowseContentManager *)self maximumNumberOfItemsForDisplay];
    if ((uint64_t)v9 >= v10) {
      int64_t v11 = v10;
    }
    else {
      int64_t v11 = (int64_t)v9;
    }
  }
  else
  {
    v12 = [v6 request];
    v13 = [v12 loadAdditionalContentURL];

    if (v13)
    {
      v14 = [(MCDFuseContentManager *)self lastReceivedResponse];
      v15 = [v14 results];
      id v16 = [v15 numberOfItemsInSection:a4];

      int64_t v17 = [(MCDBrowseContentManager *)self maximumNumberOfItemsForDisplay];
      if ((uint64_t)v16 >= v17) {
        int64_t v11 = v17;
      }
      else {
        int64_t v11 = (int64_t)v16;
      }
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)MCDBrowseItemsContentManager;
      int64_t v11 = [(MCDFuseContentManager *)&v19 allowedNumberOfItemsForDisplayWithResponse:v6 inSection:a4];
    }
  }
  return v11;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self contentResults];

  if (v5)
  {
    id v6 = [(MCDFuseContentManager *)self contentResults];
    v7 = [v6 itemsInSectionAtIndex:0];
    v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 itemsInSectionAtIndex:0];
      int64_t v10 = [v9 objectAtIndexedSubscript:0];
LABEL_7:

      goto LABEL_11;
    }
    id v19 = v8;
  }
  else
  {
    int64_t v11 = [(MCDFuseContentManager *)self lastReceivedResponse];
    v8 = [v11 request];

    uint64_t v12 = [v8 loadAdditionalContentURL];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(MCDFuseContentManager *)self lastReceivedResponse];
      v15 = [v14 results];
      uint64_t v16 = (uint64_t)[v15 numberOfSections];

      if (v16 >= 1)
      {
        id v9 = [(MCDFuseContentManager *)self lastReceivedResponse];
        int64_t v17 = [v9 results];
        v18 = [v17 itemsInSectionAtIndex:0];
        int64_t v10 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

        goto LABEL_7;
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)MCDBrowseItemsContentManager;
    id v19 = [(MCDBrowseContentManager *)&v21 itemAtIndexPath:v4];
  }
  int64_t v10 = v19;
LABEL_11:

  return v10;
}

@end