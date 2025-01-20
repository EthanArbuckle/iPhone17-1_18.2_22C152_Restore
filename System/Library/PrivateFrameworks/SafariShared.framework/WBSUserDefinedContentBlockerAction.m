@interface WBSUserDefinedContentBlockerAction
- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets;
- (BOOL)isGlobal;
- (CGRect)bounds;
- (NSArray)allSelectorsIncludingShadowHosts;
- (NSArray)selectorsForStyleSheetRules;
- (NSSet)hostsWhereActionHasApplied;
- (NSSet)mediaAndLinkURLs;
- (NSString)imageAnalysisText;
- (NSString)renderTreeText;
- (NSString)screenReaderText;
- (NSString)searchableText;
- (NSString)selector;
- (NSString)typeString;
- (WBSUserDefinedContentBlockerAction)initWithDatabaseID:(int64_t)a3 selector:(id)a4 type:(id)a5 extraAttributesData:(id)a6 isGlobal:(BOOL)a7;
- (WBSUserDefinedContentBlockerAction)initWithSelector:(id)a3 type:(id)a4;
- (WBSUserDefinedContentBlockerAction)initWithSelector:(id)a3 type:(id)a4 isGlobal:(BOOL)a5;
- (double)viewZoomScale;
- (id)debugDescription;
- (id)extraAttributesData;
- (int64_t)databaseID;
- (int64_t)positionType;
- (unint64_t)edgeAnchors;
- (void)_readExtraAttributesWithData:(id)a3;
- (void)addHostWhereActionHasApplied:(id)a3 selectors:(id)a4;
- (void)extraAttributesData;
- (void)setAllSelectorsIncludingShadowHosts:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEdgeAnchors:(unint64_t)a3;
- (void)setEdgeInsets:(id)a3;
- (void)setImageAnalysisText:(id)a3;
- (void)setMediaAndLinkURLs:(id)a3;
- (void)setPositionType:(int64_t)a3;
- (void)setRenderTreeText:(id)a3;
- (void)setScreenReaderText:(id)a3;
- (void)setSearchableText:(id)a3;
- (void)setSelector:(id)a3;
- (void)setTypeString:(id)a3;
- (void)setViewZoomScale:(double)a3;
@end

@implementation WBSUserDefinedContentBlockerAction

- (WBSUserDefinedContentBlockerAction)initWithSelector:(id)a3 type:(id)a4
{
  return [(WBSUserDefinedContentBlockerAction *)self initWithSelector:a3 type:a4 isGlobal:0];
}

- (WBSUserDefinedContentBlockerAction)initWithSelector:(id)a3 type:(id)a4 isGlobal:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSUserDefinedContentBlockerAction;
  v11 = [(WBSUserDefinedContentBlockerAction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_databaseID = 0;
    objc_storeStrong((id *)&v11->_selector, a3);
    objc_storeStrong((id *)&v12->_typeString, a4);
    v12->_global = a5;
    v13 = v12;
  }

  return v12;
}

- (WBSUserDefinedContentBlockerAction)initWithDatabaseID:(int64_t)a3 selector:(id)a4 type:(id)a5 extraAttributesData:(id)a6 isGlobal:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  v13 = [(WBSUserDefinedContentBlockerAction *)self initWithSelector:a4 type:a5 isGlobal:v7];
  v14 = v13;
  if (v13)
  {
    v13->_databaseID = a3;
    [(WBSUserDefinedContentBlockerAction *)v13 _readExtraAttributesWithData:v12];
    objc_super v15 = v14;
  }

  return v14;
}

- (void)_readExtraAttributesWithData:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v5, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    id v56 = 0;
    v13 = [v4 unarchivedObjectOfClasses:v12 fromData:v6 error:&v56];

    id v14 = v56;
    if (v14
      && (objc_super v15 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker(),
          os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)))
    {
      -[WBSUserDefinedContentBlockerAction _readExtraAttributesWithData:](v15, v14);
      if (v13)
      {
LABEL_5:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v13, "safari_stringForKey:", @"searchableText");
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          searchableText = self->_searchableText;
          self->_searchableText = v16;

          objc_msgSend(v13, "safari_stringForKey:", @"renderTreeText");
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          renderTreeText = self->_renderTreeText;
          self->_renderTreeText = v18;

          objc_msgSend(v13, "safari_stringForKey:", @"screenReaderText");
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          screenReaderText = self->_screenReaderText;
          self->_screenReaderText = v20;

          objc_msgSend(v13, "safari_stringForKey:", @"imageAnalysisText");
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          imageAnalysisText = self->_imageAnalysisText;
          self->_imageAnalysisText = v22;

          v24 = objc_msgSend(v13, "safari_arrayForKey:", @"bounds");
          if ([v24 count] == 4)
          {
            v25 = objc_msgSend(v24, "safari_numberAtIndex:", 0);
            [v25 doubleValue];
            CGFloat v27 = v26;
            v28 = objc_msgSend(v24, "safari_numberAtIndex:", 1);
            [v28 doubleValue];
            CGFloat v30 = v29;
            v31 = objc_msgSend(v24, "safari_numberAtIndex:", 2);
            [v31 doubleValue];
            CGFloat v33 = v32;
            v34 = objc_msgSend(v24, "safari_numberAtIndex:", 3);
            [v34 doubleValue];
            self->_bounds.origin.x = v27;
            self->_bounds.origin.y = v30;
            self->_bounds.size.width = v33;
            self->_bounds.size.height = v35;
          }
          objc_msgSend(v13, "safari_setForKey:", @"mediaAndLinkURLs");
          v36 = (NSSet *)objc_claimAutoreleasedReturnValue();
          mediaAndLinkURLs = self->_mediaAndLinkURLs;
          self->_mediaAndLinkURLs = v36;

          objc_msgSend(v13, "safari_arrayForKey:", @"allSelectorsIncludingShadowHosts");
          v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
          allSelectorsIncludingShadowHosts = self->_allSelectorsIncludingShadowHosts;
          self->_allSelectorsIncludingShadowHosts = v38;

          v40 = objc_msgSend(v13, "safari_numberForKey:", @"edgeAnchors");
          self->_edgeAnchors = [v40 integerValue];

          v41 = objc_msgSend(v13, "safari_arrayForKey:", @"edgeInsets");
          v42 = v41;
          if (v41)
          {
            if ([v41 count] == 4)
            {
              v43 = objc_msgSend(v42, "safari_numberAtIndex:", 0);
              [v43 doubleValue];
              self->_edgeInsets.left = v44;

              v45 = objc_msgSend(v42, "safari_numberAtIndex:", 1);
              [v45 doubleValue];
              self->_edgeInsets.top = v46;

              v47 = objc_msgSend(v42, "safari_numberAtIndex:", 2);
              [v47 doubleValue];
              self->_edgeInsets.right = v48;

              v49 = objc_msgSend(v42, "safari_numberAtIndex:", 3);
              [v49 doubleValue];
              self->_edgeInsets.bottom = v50;
            }
          }
          v51 = objc_msgSend(v13, "safari_numberForKey:", @"viewZoomFactor");
          [v51 doubleValue];
          self->_viewZoomScale = v52;

          v53 = objc_msgSend(v13, "safari_numberForKey:", @"positionType");
          self->_positionType = (int)[v53 intValue];

          objc_msgSend(v13, "safari_setForKey:", @"hostsWhereActionHasApplied");
          v54 = (NSSet *)objc_claimAutoreleasedReturnValue();
          hostsWhereActionHasApplied = self->_hostsWhereActionHasApplied;
          self->_hostsWhereActionHasApplied = v54;
        }
      }
    }
    else if (v13)
    {
      goto LABEL_5;
    }
  }
}

- (id)extraAttributesData
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_searchableText forKeyedSubscript:@"searchableText"];
  [v3 setObject:self->_renderTreeText forKeyedSubscript:@"renderTreeText"];
  [v3 setObject:self->_screenReaderText forKeyedSubscript:@"screenReaderText"];
  [v3 setObject:self->_imageAnalysisText forKeyedSubscript:@"imageAnalysisText"];
  v4 = [NSNumber numberWithDouble:self->_bounds.origin.x];
  v29[0] = v4;
  v5 = [NSNumber numberWithDouble:self->_bounds.origin.y];
  v29[1] = v5;
  id v6 = [NSNumber numberWithDouble:self->_bounds.size.width];
  v29[2] = v6;
  uint64_t v7 = [NSNumber numberWithDouble:self->_bounds.size.height];
  v29[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v3 setObject:v8 forKeyedSubscript:@"bounds"];

  uint64_t v9 = [NSNumber numberWithDouble:self->_bounds.size.width];
  v28[0] = v9;
  uint64_t v10 = [NSNumber numberWithDouble:self->_bounds.size.height];
  v28[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v3 setObject:v11 forKeyedSubscript:@"webViewSize"];

  [v3 setObject:self->_allSelectorsIncludingShadowHosts forKeyedSubscript:@"allSelectorsIncludingShadowHosts"];
  id v12 = [NSNumber numberWithUnsignedInteger:self->_edgeAnchors];
  [v3 setObject:v12 forKeyedSubscript:@"edgeAnchors"];

  v13 = [NSNumber numberWithDouble:self->_edgeInsets.left];
  v27[0] = v13;
  id v14 = [NSNumber numberWithDouble:self->_edgeInsets.top];
  v27[1] = v14;
  objc_super v15 = [NSNumber numberWithDouble:self->_edgeInsets.right];
  v27[2] = v15;
  v16 = [NSNumber numberWithDouble:self->_edgeInsets.bottom];
  v27[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v3 setObject:v17 forKeyedSubscript:@"edgeInsets"];

  v18 = [NSNumber numberWithDouble:self->_viewZoomScale];
  [v3 setObject:v18 forKeyedSubscript:@"viewZoomFactor"];

  v19 = [NSNumber numberWithInteger:self->_positionType];
  [v3 setObject:v19 forKeyedSubscript:@"positionType"];

  mediaAndLinkURLs = self->_mediaAndLinkURLs;
  if (mediaAndLinkURLs) {
    [v3 setObject:mediaAndLinkURLs forKeyedSubscript:@"mediaAndLinkURLs"];
  }
  hostsWhereActionHasApplied = self->_hostsWhereActionHasApplied;
  if (hostsWhereActionHasApplied) {
    [v3 setObject:hostsWhereActionHasApplied forKeyedSubscript:@"hostsWhereActionHasApplied"];
  }
  if ([v3 count])
  {
    id v26 = 0;
    v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v26];
    id v23 = v26;
    if (v23)
    {
      v24 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        [(WBSUserDefinedContentBlockerAction *)(uint64_t)v23 extraAttributesData];
      }
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSArray)selectorsForStyleSheetRules
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_allSelectorsIncludingShadowHosts, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = self->_allSelectorsIncludingShadowHosts;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 count] == 1)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v10 = objc_msgSend(v9, "lastObject", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v17 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v3 addObject:*(void *)(*((void *)&v16 + 1) + 8 * j)];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addHostWhereActionHasApplied:(id)a3 selectors:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  hostsWhereActionHasApplied = self->_hostsWhereActionHasApplied;
  uint64_t v8 = hostsWhereActionHasApplied;
  if (!hostsWhereActionHasApplied)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v9 = [v8 setByAddingObject:v14];
  uint64_t v10 = self->_hostsWhereActionHasApplied;
  self->_hostsWhereActionHasApplied = v9;

  if (!hostsWhereActionHasApplied) {
  if ([v6 count])
  }
  {
    if (self->_allSelectorsIncludingShadowHosts) {
      allSelectorsIncludingShadowHosts = self->_allSelectorsIncludingShadowHosts;
    }
    else {
      allSelectorsIncludingShadowHosts = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v12 = [(NSArray *)allSelectorsIncludingShadowHosts arrayByAddingObject:v6];
    uint64_t v13 = self->_allSelectorsIncludingShadowHosts;
    self->_allSelectorsIncludingShadowHosts = v12;
  }
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_global) {
    uint64_t v5 = @"GLOBAL";
  }
  else {
    uint64_t v5 = @"PER_SITE";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p {%@} sel=%@ renderTreeText=%@ imageAnalysisText=%@ searchableText=%@ screenReaderText=%@ (%@)>", v4, self, self->_typeString, self->_selector, self->_renderTreeText, self->_imageAnalysisText, self->_searchableText, self->_screenReaderText, v5];
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)selector
{
  return self->_selector;
}

- (void)setSelector:(id)a3
{
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void)setTypeString:(id)a3
{
}

- (BOOL)isGlobal
{
  return self->_global;
}

- (NSString)renderTreeText
{
  return self->_renderTreeText;
}

- (void)setRenderTreeText:(id)a3
{
}

- (NSString)imageAnalysisText
{
  return self->_imageAnalysisText;
}

- (void)setImageAnalysisText:(id)a3
{
}

- (NSString)searchableText
{
  return self->_searchableText;
}

- (void)setSearchableText:(id)a3
{
}

- (NSString)screenReaderText
{
  return self->_screenReaderText;
}

- (void)setScreenReaderText:(id)a3
{
}

- (NSArray)allSelectorsIncludingShadowHosts
{
  return self->_allSelectorsIncludingShadowHosts;
}

- (void)setAllSelectorsIncludingShadowHosts:(id)a3
{
}

- (NSSet)mediaAndLinkURLs
{
  return self->_mediaAndLinkURLs;
}

- (void)setMediaAndLinkURLs:(id)a3
{
}

- (NSSet)hostsWhereActionHasApplied
{
  return self->_hostsWhereActionHasApplied;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (void)setPositionType:(int64_t)a3
{
  self->_positionType = a3;
}

- (unint64_t)edgeAnchors
{
  return self->_edgeAnchors;
}

- (void)setEdgeAnchors:(unint64_t)a3
{
  self->_edgeAnchors = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double left = self->_edgeInsets.left;
  double top = self->_edgeInsets.top;
  double right = self->_edgeInsets.right;
  double bottom = self->_edgeInsets.bottom;
  result.var3 = bottom;
  result.var2 = right;
  result.var1 = top;
  result.var0 = left;
  return result;
}

- (void)setEdgeInsets:(id)a3
{
  self->_edgeInsets = ($25007BB52CABD522289DA066AE13E06A)a3;
}

- (double)viewZoomScale
{
  return self->_viewZoomScale;
}

- (void)setViewZoomScale:(double)a3
{
  self->_viewZoomScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostsWhereActionHasApplied, 0);
  objc_storeStrong((id *)&self->_mediaAndLinkURLs, 0);
  objc_storeStrong((id *)&self->_allSelectorsIncludingShadowHosts, 0);
  objc_storeStrong((id *)&self->_screenReaderText, 0);
  objc_storeStrong((id *)&self->_searchableText, 0);
  objc_storeStrong((id *)&self->_imageAnalysisText, 0);
  objc_storeStrong((id *)&self->_renderTreeText, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

- (void)_readExtraAttributesWithData:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to unarchive extra data from database: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)extraAttributesData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Error when archiving extra attributes: %@", (uint8_t *)&v2, 0xCu);
}

@end