@interface _SFNavigationIntentBuilder
+ (BOOL)canCreateNavigationIntentForDropSession:(id)a3;
+ (BOOL)shouldOpenBookmarkFolderAsTabs;
+ (id)builder;
+ (id)builderWithModifierFlags:(int64_t)a3;
+ (void)registerBookmarkCollectionFactory:(id)a3;
- (BOOL)_hasModifierFlag:(int64_t)a3;
- (BOOL)_modifiersEqualToModifierIgnoringCapsLock:(int64_t)a3;
- (BOOL)_shouldOrderToForeground;
- (BOOL)prefersOpenInNewTab;
- (BOOL)prefersOpenInNewTabReusingExistingBlankTabIfPossible;
- (BOOL)prefersOpenInNewWindow;
- (BOOL)prefersRelationToSourceTab;
- (id)_initWithModifierFlags:(int64_t)a3;
- (id)_initializeNavigationIntentWithType:(unint64_t)a3 value:(id)a4;
- (id)_navigationIntentForMKMapItem:(id)a3;
- (id)_navigationIntentWithItems:(id)a3;
- (id)navigationIntentWithBookmark:(id)a3;
- (id)navigationIntentWithCloudTab:(id)a3;
- (id)navigationIntentWithHighlight:(id)a3;
- (id)navigationIntentWithHistoryURL:(id)a3;
- (id)navigationIntentWithImageAttributionURL:(id)a3;
- (id)navigationIntentWithMultipleIntents:(id)a3;
- (id)navigationIntentWithOpenURLContexts:(id)a3;
- (id)navigationIntentWithRecentlyClosedTabStateData:(id)a3;
- (id)navigationIntentWithSearchText:(id)a3;
- (id)navigationIntentWithServiceWorkerOpenURL:(id)a3;
- (id)navigationIntentWithText:(id)a3;
- (id)navigationIntentWithURL:(id)a3;
- (id)navigationIntentWithWebClip:(id)a3;
- (int64_t)_navigationPolicy;
- (int64_t)_navigationPolicyForCreatingNewTabOrWindow;
- (int64_t)_navigationPolicyForNavigationEvent;
- (int64_t)_navigationPolicyForStandardEvent;
- (int64_t)modifierFlags;
- (int64_t)navigationType;
- (int64_t)preferredTabOrder;
- (unint64_t)neverPromptWhenOpeningMultipleIntents;
- (void)buildNavigationIntentForDropSession:(id)a3 completionHandler:(id)a4;
- (void)buildNavigationIntentForItemProviders:(id)a3 completionHandler:(id)a4;
- (void)setNavigationType:(int64_t)a3;
- (void)setNeverPromptWhenOpeningMultipleIntents:(unint64_t)a3;
- (void)setPreferredTabOrder:(int64_t)a3;
- (void)setPrefersOpenInNewTab:(BOOL)a3;
- (void)setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:(BOOL)a3;
- (void)setPrefersOpenInNewWindow:(BOOL)a3;
- (void)setPrefersRelationToSourceTab:(BOOL)a3;
@end

@implementation _SFNavigationIntentBuilder

+ (void)registerBookmarkCollectionFactory:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = (void *)bookmarkCollectionFactory;
  bookmarkCollectionFactory = (uint64_t)v3;
}

+ (id)builder
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v3 = objc_msgSend(v2, "sf_currentKeyboardModifierFlags");

  return +[_SFNavigationIntentBuilder builderWithModifierFlags:v3];
}

+ (id)builderWithModifierFlags:(int64_t)a3
{
  id v3 = [[_SFNavigationIntentBuilder alloc] _initWithModifierFlags:a3];

  return v3;
}

- (id)_initWithModifierFlags:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFNavigationIntentBuilder;
  v4 = [(_SFNavigationIntentBuilder *)&v8 init];
  v5 = v4;
  if (v4)
  {
    *((void *)v4 + 2) = a3;
    *(_OWORD *)(v4 + 24) = xmmword_18C70EAC0;
    v4[11] = 1;
    v6 = v4;
  }

  return v5;
}

- (id)_initializeNavigationIntentWithType:(unint64_t)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = [[_SFNavigationIntent alloc] _initWithType:a3 value:v6 policy:[(_SFNavigationIntentBuilder *)self _navigationPolicy]];

  [v7 setShouldRelateToSourceTab:self->_prefersRelationToSourceTab];

  return v7;
}

- (id)navigationIntentWithBookmark:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isFolder])
  {
    if (bookmarkCollectionFactory)
    {
      v5 = (*(void (**)(void))(bookmarkCollectionFactory + 16))();
    }
    else
    {
      v5 = 0;
    }
    id v7 = [v5 descendantsOfBookmarkFolder:v4];
    unint64_t v8 = [v7 count];
    if (v8)
    {
      if (self->_neverPromptWhenOpeningMultipleIntents)
      {
        if (v8 >= 0x64) {
          uint64_t v9 = 100;
        }
        else {
          uint64_t v9 = v8;
        }
        if (v8 <= 0x63) {
          unint64_t v10 = 0;
        }
        else {
          unint64_t v10 = v8 - 100;
        }
        uint64_t v11 = objc_msgSend(v7, "subarrayWithRange:", v10, v9);

        id v7 = (id)v11;
      }
      v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v7;
      uint64_t v13 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v7);
            }
            v17 = -[_SFNavigationIntentBuilder navigationIntentWithBookmark:](self, "navigationIntentWithBookmark:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
            [v12 addObject:v17];
          }
          uint64_t v14 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }

      id v6 = [(_SFNavigationIntentBuilder *)self navigationIntentWithMultipleIntents:v12];
      [v6 setNeverPromptWhenOpeningMultipleIntents:self->_neverPromptWhenOpeningMultipleIntents != 0];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:0 value:v4];
    [v6 setProvenance:2];
  }

  return v6;
}

- (id)navigationIntentWithCloudTab:(id)a3
{
  self->_prefersRelationToSourceTab = 0;
  return [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:1 value:a3];
}

- (id)navigationIntentWithRecentlyClosedTabStateData:(id)a3
{
  self->_prefersOpenInNewTab = 1;
  self->_preferredTabOrder = 1;
  self->_prefersRelationToSourceTab = 0;
  return [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:3 value:a3];
}

- (id)navigationIntentWithHistoryURL:(id)a3
{
  return [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:2 value:a3];
}

- (id)navigationIntentWithText:(id)a3
{
  id v4 = objc_msgSend(a3, "safari_stringByRemovingExcessWhitespace");
  v5 = [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:4 value:v4];

  return v5;
}

- (id)navigationIntentWithSearchText:(id)a3
{
  id v4 = objc_msgSend(a3, "safari_stringByRemovingExcessWhitespace");
  v5 = [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:5 value:v4];

  return v5;
}

- (id)navigationIntentWithURL:(id)a3
{
  return [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:6 value:a3];
}

- (id)navigationIntentWithWebClip:(id)a3
{
  id v3 = a3;
  id v4 = [[_SFNavigationIntent alloc] _initWithType:7 value:v3 policy:3];

  return v4;
}

- (id)navigationIntentWithServiceWorkerOpenURL:(id)a3
{
  id v3 = a3;
  id v4 = [[_SFNavigationIntent alloc] _initWithType:8 value:v3 policy:3];

  return v4;
}

- (id)navigationIntentWithImageAttributionURL:(id)a3
{
  return [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:10 value:a3];
}

- (id)navigationIntentWithHighlight:(id)a3
{
  id v4 = a3;
  v5 = WBSURLForHighlight();
  id v6 = [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:6 value:v5];

  [v6 setHighlight:v4];

  return v6;
}

- (id)navigationIntentWithMultipleIntents:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    v5 = [v4 objectAtIndexedSubscript:0];

    [v5 setIsChildIntent:1];
  }
  else
  {
    id v6 = flattenedNavigationIntents(v4);

    v5 = [(_SFNavigationIntentBuilder *)self _initializeNavigationIntentWithType:11 value:v6];
  }

  return v5;
}

- (id)navigationIntentWithOpenURLContexts:(id)a3
{
  self->_prefersRelationToSourceTab = 0;
  self->_prefersOpenInNewTab = 1;
  self->_preferredTabOrder = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___SFNavigationIntentBuilder_navigationIntentWithOpenURLContexts___block_invoke;
  v7[3] = &unk_1E54EABB0;
  v7[4] = self;
  id v4 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v7);
  v5 = [(_SFNavigationIntentBuilder *)self navigationIntentWithMultipleIntents:v4];

  return v5;
}

+ (BOOL)canCreateNavigationIntentForDropSession:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F30D90];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = allowedClasses_0();
  BOOL v7 = +[_SFDropSession dropSession:containsItemsMatching:allowedTypeIdentifiers:allowedClasses:](_SFDropSession, "dropSession:containsItemsMatching:allowedTypeIdentifiers:allowedClasses:", v4, localObjectLoader_0, v5, v6, v9, v10);

  return v7;
}

- (void)buildNavigationIntentForDropSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84___SFNavigationIntentBuilder_buildNavigationIntentForDropSession_completionHandler___block_invoke;
  v8[3] = &unk_1E54EABD8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[_SFDropSession dropSession:a3 loadObjectsUsingLocalObjectLoader:localObjectLoader_0 objectLoader:objectLoader_0 completionHandler:v8];
}

- (void)buildNavigationIntentForItemProviders:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28D78];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86___SFNavigationIntentBuilder_buildNavigationIntentForItemProviders_completionHandler___block_invoke;
  v9[3] = &unk_1E54EABD8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v7, "safari_loadObjectsFromItemProviders:usingLoader:completionHandler:", a3, objectLoader_0, v9);
}

- (id)_navigationIntentWithItems:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___SFNavigationIntentBuilder__navigationIntentWithItems___block_invoke;
  v7[3] = &unk_1E54EAC00;
  v7[4] = self;
  id v4 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v7);
  if ([v4 count])
  {
    v5 = [(_SFNavigationIntentBuilder *)self navigationIntentWithMultipleIntents:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_navigationIntentForMKMapItem:(id)a3
{
  id v4 = a3;
  if ([v4 isCurrentLocation])
  {
    v5 = 0;
    goto LABEL_8;
  }
  id v6 = [v4 url];
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "safari_originalDataAsString");
  }
  else
  {
    id v8 = [v4 name];
    if (!v8)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = [(_SFNavigationIntentBuilder *)self navigationIntentWithText:v8];
LABEL_7:

LABEL_8:

  return v5;
}

+ (BOOL)shouldOpenBookmarkFolderAsTabs
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v3 = ((unint64_t)objc_msgSend(v2, "sf_currentKeyboardModifierFlags") >> 20) & 1;

  return v3;
}

- (BOOL)_hasModifierFlag:(int64_t)a3
{
  return (self->_modifierFlags & a3) != 0;
}

- (BOOL)_modifiersEqualToModifierIgnoringCapsLock:(int64_t)a3
{
  return ((self->_modifierFlags ^ a3) & 0xFFFFFFFFFFFEFFFFLL) == 0;
}

- (BOOL)_shouldOrderToForeground
{
  int64_t preferredTabOrder = self->_preferredTabOrder;
  if (preferredTabOrder == 2)
  {
    LOBYTE(v4) = 0;
  }
  else if (preferredTabOrder)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v4 = [v3 BOOLForKey:@"OpenLinksInBackground"] ^ 1;
  }
  return v4;
}

- (int64_t)_navigationPolicy
{
  if (self->_navigationType == -1)
  {
    int64_t result = [(_SFNavigationIntentBuilder *)self _navigationPolicyForStandardEvent];
    if (result) {
      return result;
    }
  }
  else
  {
    int64_t result = [(_SFNavigationIntentBuilder *)self _navigationPolicyForNavigationEvent];
    if (result) {
      return result;
    }
  }
  if (self->_prefersOpenInNewTabReusingExistingBlankTabIfPossible) {
    return 3;
  }
  return result;
}

- (int64_t)_navigationPolicyForStandardEvent
{
  if (!self->_modifierFlags && !self->_prefersOpenInNewTab && !self->_prefersOpenInNewWindow) {
    return 0;
  }
  if ([(_SFNavigationIntentBuilder *)self _hasModifierFlag:0x100000]
    || self->_prefersOpenInNewTab
    || self->_prefersOpenInNewWindow)
  {
    return [(_SFNavigationIntentBuilder *)self _navigationPolicyForCreatingNewTabOrWindow];
  }
  else if ([(_SFNavigationIntentBuilder *)self _modifiersEqualToModifierIgnoringCapsLock:0x20000])
  {
    return 5;
  }
  else if ([(_SFNavigationIntentBuilder *)self _modifiersEqualToModifierIgnoringCapsLock:0x80000])
  {
    return 6;
  }
  else
  {
    return 0;
  }
}

- (int64_t)_navigationPolicyForNavigationEvent
{
  int64_t navigationType = self->_navigationType;
  if ((navigationType & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 0;
  }
  if ([(_SFNavigationIntentBuilder *)self _modifiersEqualToModifierIgnoringCapsLock:0x20000])
  {
    BOOL v5 = navigationType == 1 || navigationType == 4;
    if (!v5 && !self->_prefersOpenInNewTab) {
      return 5;
    }
  }
  if ([(_SFNavigationIntentBuilder *)self _hasModifierFlag:0x100000]
    || self->_prefersOpenInNewTab)
  {
    return [(_SFNavigationIntentBuilder *)self _navigationPolicyForCreatingNewTabOrWindow];
  }
  else
  {
    if (![(_SFNavigationIntentBuilder *)self _hasModifierFlag:0x80000]) {
      return 0;
    }
    int64_t result = 0;
    if (navigationType != 1 && navigationType != 4)
    {
      if ([(_SFNavigationIntentBuilder *)self _modifiersEqualToModifierIgnoringCapsLock:786432])
      {
        return 0;
      }
      else
      {
        return 6;
      }
    }
  }
  return result;
}

- (int64_t)_navigationPolicyForCreatingNewTabOrWindow
{
  if ([(_SFNavigationIntentBuilder *)self _hasModifierFlag:0x80000]
    || self->_prefersOpenInNewWindow)
  {
    return 4;
  }
  BOOL v4 = [(_SFNavigationIntentBuilder *)self _shouldOrderToForeground];
  if (v4 != [(_SFNavigationIntentBuilder *)self _hasModifierFlag:0x20000]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_int64_t navigationType = a3;
}

- (int64_t)preferredTabOrder
{
  return self->_preferredTabOrder;
}

- (void)setPreferredTabOrder:(int64_t)a3
{
  self->_int64_t preferredTabOrder = a3;
}

- (BOOL)prefersOpenInNewTab
{
  return self->_prefersOpenInNewTab;
}

- (void)setPrefersOpenInNewTab:(BOOL)a3
{
  self->_prefersOpenInNewTab = a3;
}

- (BOOL)prefersOpenInNewTabReusingExistingBlankTabIfPossible
{
  return self->_prefersOpenInNewTabReusingExistingBlankTabIfPossible;
}

- (void)setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:(BOOL)a3
{
  self->_prefersOpenInNewTabReusingExistingBlankTabIfPossible = a3;
}

- (BOOL)prefersOpenInNewWindow
{
  return self->_prefersOpenInNewWindow;
}

- (void)setPrefersOpenInNewWindow:(BOOL)a3
{
  self->_prefersOpenInNewWindow = a3;
}

- (BOOL)prefersRelationToSourceTab
{
  return self->_prefersRelationToSourceTab;
}

- (void)setPrefersRelationToSourceTab:(BOOL)a3
{
  self->_prefersRelationToSourceTab = a3;
}

- (unint64_t)neverPromptWhenOpeningMultipleIntents
{
  return self->_neverPromptWhenOpeningMultipleIntents;
}

- (void)setNeverPromptWhenOpeningMultipleIntents:(unint64_t)a3
{
  self->_neverPromptWhenOpeningMultipleIntents = a3;
}

@end