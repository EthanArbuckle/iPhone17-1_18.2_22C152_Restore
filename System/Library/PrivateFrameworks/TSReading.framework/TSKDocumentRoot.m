@interface TSKDocumentRoot
+ (Class)commandControllerClass;
- (BOOL)documentCacheHasAtMostFileProtection:(id)a3;
- (BOOL)documentDisallowsHighlightsOnStorage:(id)a3;
- (BOOL)hasICloudConflict;
- (BOOL)hasICloudTeardownObserver;
- (BOOL)isBeingLocalized;
- (BOOL)isDirectionRightToLeft;
- (BOOL)isFindActive;
- (BOOL)shouldHyphenate;
- (BOOL)useLigatures;
- (BOOL)writeData:(id)a3 atDocumentCachePath:(id)a4;
- (CGImageSource)newImageSourceForDocumentCachePath:(id)a3;
- (NSDictionary)searchReferencesToHighlight;
- (NSLocale)locale;
- (NSString)creationLanguage;
- (TSKAccessController)accessController;
- (TSKAnnotationAuthorStorage)annotationAuthorStorage;
- (TSKChangeNotifier)changeNotifier;
- (TSKDocumentRoot)initWithContext:(id)a3;
- (TSKDocumentSupport)documentSupport;
- (TSKDocumentViewController)viewController;
- (TSKPasteboardController)pasteboardController;
- (TSKSearchReference)activeSearchReference;
- (TSKUndoRedoState)undoRedoState;
- (TSSStylesheet)stylesheet;
- (TSSTheme)theme;
- (__CFLocale)hyphenationLocale;
- (id)additionalDocumentPropertiesForWrite;
- (id)changeSessionManagerForModel:(id)a3;
- (id)changeVisibility;
- (id)commandForPropagatingPresetChangeCommand:(id)a3 alwaysPreserveAppearance:(BOOL)a4;
- (id)dataFromDocumentCachePath:(id)a3;
- (id)documentFonts;
- (id)modelEnumerator;
- (id)modelEnumeratorForObjectsConformingToProtocol:(id)a3;
- (id)modelEnumeratorForObjectsOfClass:(Class)a3;
- (id)modelEnumeratorForObjectsPassingTest:(id)a3;
- (id)modelEnumeratorForObjectsRespondingToSelector:(SEL)a3;
- (id)unavailableDocumentFonts;
- (id)uniqueDocumentCachePathForProposedPath:(id)a3;
- (int64_t)addObserverForICloudTeardownWithBlock:(id)a3;
- (unint64_t)applicationType;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3;
- (unint64_t)writingDirection;
- (void)changeDocumentCacheFileProtection:(id)a3;
- (void)coalesceChanges:(id)a3;
- (void)dealloc;
- (void)didSaveWithEncryptionChange;
- (void)documentDidLoad;
- (void)enumerateStyleClientsUsingBlock:(id)a3;
- (void)markAsModifiedIfLocaleIsOutOfDate;
- (void)notifyICloudTeardownObservers;
- (void)removeICloudTeardownObserver:(int64_t)a3;
- (void)setActiveSearchReference:(id)a3;
- (void)setAnnotationAuthorStorage:(id)a3;
- (void)setFindActive:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPasteboardController:(id)a3;
- (void)setSearchReferencesToHighlight:(id)a3;
- (void)setTheme:(id)a3;
- (void)setThemeForTemplateImport:(id)a3;
- (void)setUndoRedoState:(id)a3;
- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4;
@end

@implementation TSKDocumentRoot

- (TSKDocumentRoot)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSKDocumentRoot;
  v3 = [(TSPObject *)&v5 initWithContext:a3];
  if (v3) {
    v3->_annotationAuthorStorage = [(TSPObject *)[TSKAnnotationAuthorStorage alloc] initWithContext:[(TSPObject *)v3 context]];
  }
  return v3;
}

- (void)documentDidLoad
{
  self->_accessController = [[TSKAccessController alloc] initWithDelegate:self];
  self->_changeNotifier = objc_alloc_init(TSKChangeNotifier);
  self->_iCloudTeardownStackQueue = (OS_dispatch_queue *)dispatch_queue_create("TSKDocumentRoot.iCloudTeardownStack", 0);
}

+ (Class)commandControllerClass
{
  return 0;
}

- (void)dealloc
{
  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue)
  {
    dispatch_release(iCloudTeardownStackQueue);
    self->_iCloudTeardownStackQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)TSKDocumentRoot;
  [(TSKDocumentRoot *)&v4 dealloc];
}

- (unint64_t)applicationType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot applicationType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 178, @"should be overridden in app-specific document roots!");
  return 3;
}

- (id)dataFromDocumentCachePath:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot dataFromDocumentCachePath:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 186, @"should be overridden in TSADocumentRoot");
  return 0;
}

- (BOOL)writeData:(id)a3 atDocumentCachePath:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSKDocumentRoot writeData:atDocumentCachePath:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 192, @"should be overridden in TSADocumentRoot");
  return 0;
}

- (CGImageSource)newImageSourceForDocumentCachePath:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot newImageSourceForDocumentCachePath:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 198, @"should be overridden in TSADocumentRoot");
  return 0;
}

- (id)uniqueDocumentCachePathForProposedPath:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot uniqueDocumentCachePathForProposedPath:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 204, @"should be overridden in TSADocumentRoot");
  return 0;
}

- (void)changeDocumentCacheFileProtection:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot changeDocumentCacheFileProtection:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:210 description:@"should be overridden in TSADocumentRoot"];
}

- (BOOL)documentCacheHasAtMostFileProtection:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot documentCacheHasAtMostFileProtection:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 215, @"should be overridden in TSADocumentRoot");
  return 0;
}

- (void)didSaveWithEncryptionChange
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot didSaveWithEncryptionChange]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:221 description:@"should be overridden in TSADocumentRoot"];
}

- (unint64_t)writingDirection
{
  return 1;
}

- (NSString)creationLanguage
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot creationLanguage]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 250, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot creationLanguage]"), 0 reason userInfo]);
}

- (BOOL)isDirectionRightToLeft
{
  return [(TSKDocumentRoot *)self writingDirection] == 2;
}

- (BOOL)documentDisallowsHighlightsOnStorage:(id)a3
{
  return 0;
}

- (id)modelEnumerator
{
  v2 = [[TSKDocumentModelEnumerator alloc] initWithRootModelObject:self filter:0];

  return v2;
}

- (id)modelEnumeratorForObjectsPassingTest:(id)a3
{
  uint64_t v3 = [[TSKDocumentModelEnumerator alloc] initWithRootModelObject:self filter:a3];

  return v3;
}

- (id)modelEnumeratorForObjectsOfClass:(Class)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TSKDocumentRoot_modelEnumeratorForObjectsOfClass___block_invoke;
  v4[3] = &unk_2646B0810;
  v4[4] = a3;
  return [(TSKDocumentRoot *)self modelEnumeratorForObjectsPassingTest:v4];
}

uint64_t __52__TSKDocumentRoot_modelEnumeratorForObjectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)modelEnumeratorForObjectsConformingToProtocol:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__TSKDocumentRoot_modelEnumeratorForObjectsConformingToProtocol___block_invoke;
  v4[3] = &unk_2646B0810;
  v4[4] = a3;
  return [(TSKDocumentRoot *)self modelEnumeratorForObjectsPassingTest:v4];
}

uint64_t __65__TSKDocumentRoot_modelEnumeratorForObjectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

- (id)modelEnumeratorForObjectsRespondingToSelector:(SEL)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__TSKDocumentRoot_modelEnumeratorForObjectsRespondingToSelector___block_invoke;
  v4[3] = &__block_descriptor_40_e24_B24__0___TSKModel__8_B16l;
  v4[4] = a3;
  return [(TSKDocumentRoot *)self modelEnumeratorForObjectsPassingTest:v4];
}

uint64_t __65__TSKDocumentRoot_modelEnumeratorForObjectsRespondingToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)additionalDocumentPropertiesForWrite
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"locale";
  v4[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "autoupdatingCurrentLocale"), "localeIdentifier");
  return (id)[NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

- (void)coalesceChanges:(id)a3
{
  unint64_t v4 = [a3 count];
  if (v4 >= 2)
  {
    int v5 = 0;
    unint64_t v6 = v4 - 1;
    do
    {
      v7 = (void *)[a3 objectAtIndex:v6];
      if ([v7 kind] == 2)
      {
        unint64_t v8 = ((unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "details"), "objectForKey:", @"flags"), "unsignedIntegerValue") >> 3) & 1;
        if ((v8 & v5) == 1)
        {
          [a3 removeObjectAtIndex:v6];
          int v5 = 1;
        }
        else
        {
          v5 |= v8;
        }
      }
      --v6;
    }
    while (v6 != -1);
  }
}

- (void)markAsModifiedIfLocaleIsOutOfDate
{
  uint64_t v3 = [(NSLocale *)[(TSKDocumentRoot *)self locale] localeIdentifier];
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale"), "localeIdentifier")))
  {
    [(TSPObject *)self willModify];
  }
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  unint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSKDocumentRoot withRootSearchTargetAtIndex:executeBlock:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 514, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot withRootSearchTargetAtIndex:executeBlock:]"), 0 reason userInfo]);
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot rootSearchTargetCountThroughIndex:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 519, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot rootSearchTargetCountThroughIndex:]"), 0 reason userInfo]);
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  unint64_t v6 = a3;
  if (a6 == 1)
  {
    if (a3)
    {
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        return -[TSKDocumentRoot rootSearchTargetCountThroughIndex:](self, "rootSearchTargetCountThroughIndex:", 0x7FFFFFFFFFFFFFFFLL, a4, a5)- 1;
      }
      else {
        return a3 - 1;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (!a6)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else if (-[TSKDocumentRoot rootSearchTargetCountThroughIndex:](self, "rootSearchTargetCountThroughIndex:", a3, a4, a5)- 1 > a3)
    {
      ++v6;
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (id)commandForPropagatingPresetChangeCommand:(id)a3 alwaysPreserveAppearance:(BOOL)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSKDocumentRoot commandForPropagatingPresetChangeCommand:alwaysPreserveAppearance:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 567, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot commandForPropagatingPresetChangeCommand:alwaysPreserveAppearance:]"), 0 reason userInfo]);
}

- (int64_t)addObserverForICloudTeardownWithBlock:(id)a3
{
  if (self->_iCloudTeardownStackQueue
    || (uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v6 = [NSString stringWithUTF8String:"-[TSKDocumentRoot addObserverForICloudTeardownWithBlock:]"], objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 580, @"invalid nil value for '%s'", "_iCloudTeardownStackQueue"), self->_iCloudTeardownStackQueue))
  {
    v7 = [[TSKDocumentRootICloudObserver alloc] initWithBlock:a3];
    iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__TSKDocumentRoot_addObserverForICloudTeardownWithBlock___block_invoke;
    block[3] = &unk_2646B0750;
    block[4] = self;
    block[5] = v7;
    dispatch_async(iCloudTeardownStackQueue, block);
  }
  else
  {
    v7 = 0;
  }
  return [(TSKDocumentRootICloudObserver *)v7 identifer];
}

uint64_t __57__TSKDocumentRoot_addObserverForICloudTeardownWithBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 104) = objc_alloc_init(MEMORY[0x263EFF980]);
    v2 = *(void **)(*(void *)(a1 + 32) + 104);
  }
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 addObject:v3];
}

- (void)removeICloudTeardownObserver:(int64_t)a3
{
  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue
    || (uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v7 = [NSString stringWithUTF8String:"-[TSKDocumentRoot removeICloudTeardownObserver:]"], objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 599, @"invalid nil value for '%s'", "_iCloudTeardownStackQueue"), (iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue) != 0))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__TSKDocumentRoot_removeICloudTeardownObserver___block_invoke;
    block[3] = &unk_2646B0858;
    block[4] = self;
    block[5] = a3;
    dispatch_async(iCloudTeardownStackQueue, block);
  }
}

uint64_t __48__TSKDocumentRoot_removeICloudTeardownObserver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "reverseObjectEnumerator", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if ([v7 identifer] == *(void *)(a1 + 40)) {
          return [*(id *)(*(void *)(a1 + 32) + 104) removeObjectIdenticalTo:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)notifyICloudTeardownObservers
{
  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue
    || (uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSKDocumentRoot notifyICloudTeardownObservers]"], objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 620, @"invalid nil value for '%s'", "_iCloudTeardownStackQueue"), (iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue) != 0))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__TSKDocumentRoot_notifyICloudTeardownObservers__block_invoke;
    block[3] = &unk_2646AF7B8;
    block[4] = self;
    dispatch_sync(iCloudTeardownStackQueue, block);
  }
}

uint64_t __48__TSKDocumentRoot_notifyICloudTeardownObservers__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "reverseObjectEnumerator", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invokeWithDocumentRoot:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)hasICloudTeardownObserver
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue
    || (uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSKDocumentRoot hasICloudTeardownObserver]"],
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 636, @"invalid nil value for '%s'", "_iCloudTeardownStackQueue"), (iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue) != 0))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__TSKDocumentRoot_hasICloudTeardownObserver__block_invoke;
    block[3] = &unk_2646B0880;
    block[4] = self;
    void block[5] = &v9;
    dispatch_sync(iCloudTeardownStackQueue, block);
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __44__TSKDocumentRoot_hasICloudTeardownObserver__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)hasICloudConflict
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot hasICloudConflict]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 649, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot hasICloudConflict]"), 0 reason userInfo]);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (TSKAccessController)accessController
{
  return self->_accessController;
}

- (TSKChangeNotifier)changeNotifier
{
  return self->_changeNotifier;
}

- (TSKPasteboardController)pasteboardController
{
  return self->_pasteboardController;
}

- (void)setPasteboardController:(id)a3
{
}

- (BOOL)isFindActive
{
  return self->_isFindActive;
}

- (void)setFindActive:(BOOL)a3
{
  self->_isFindActive = a3;
}

- (TSKUndoRedoState)undoRedoState
{
  return self->_undoRedoState;
}

- (void)setUndoRedoState:(id)a3
{
}

- (TSKAnnotationAuthorStorage)annotationAuthorStorage
{
  return self->_annotationAuthorStorage;
}

- (void)setAnnotationAuthorStorage:(id)a3
{
}

- (BOOL)isBeingLocalized
{
  return self->_isBeingLocalized;
}

- (TSKSearchReference)activeSearchReference
{
  return self->_activeSearchReference;
}

- (void)setActiveSearchReference:(id)a3
{
}

- (NSDictionary)searchReferencesToHighlight
{
  return self->_searchReferencesToHighlight;
}

- (void)setSearchReferencesToHighlight:(id)a3
{
}

- (TSKDocumentSupport)documentSupport
{
  return self->_documentSupport;
}

- (TSKDocumentViewController)viewController
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot(iOS) viewController]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot_iOS.m"), 12, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot(iOS) viewController]"), 0 reason userInfo]);
}

- (TSSTheme)theme
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot(TSSAdditions) theme]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 20, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot(TSSAdditions) theme]"), 0 reason userInfo]);
}

- (void)setTheme:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot(TSSAdditions) setTheme:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 25, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot(TSSAdditions) setTheme:]"), 0 reason userInfo]);
}

- (void)setThemeForTemplateImport:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKDocumentRoot(TSSAdditions) setThemeForTemplateImport:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 30, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot(TSSAdditions) setThemeForTemplateImport:]"), 0 reason userInfo]);
}

- (TSSStylesheet)stylesheet
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKDocumentRoot(TSSAdditions) stylesheet]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 35, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKDocumentRoot(TSSAdditions) stylesheet]"), 0 reason userInfo]);
}

- (void)enumerateStyleClientsUsingBlock:(id)a3
{
  id v4 = [(TSKDocumentRoot *)self modelEnumerator];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__TSKDocumentRoot_TSSAdditions__enumerateStyleClientsUsingBlock___block_invoke;
  v5[3] = &unk_2646B1178;
  v5[4] = a3;
  [v4 enumerateUsingBlock:v5];
}

uint64_t __65__TSKDocumentRoot_TSSAdditions__enumerateStyleClientsUsingBlock___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = TSUClassAndProtocolCast();
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (id)changeSessionManagerForModel:(id)a3
{
  return 0;
}

- (id)changeVisibility
{
  return 0;
}

- (BOOL)shouldHyphenate
{
  return 0;
}

- (__CFLocale)hyphenationLocale
{
  return 0;
}

- (BOOL)useLigatures
{
  return 1;
}

- (id)documentFonts
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v27[0] = [(TSKDocumentRoot *)self stylesheet];
  v27[1] = [(TSSTheme *)[(TSKDocumentRoot *)self theme] stylesheet];
  id obj = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v21 + 1) + 8 * v4);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v25[0] = objc_opt_class();
        v25[1] = objc_opt_class();
        char v6 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = (void *)[v5 stylesOfClass:*(void *)(*((void *)&v17 + 1) + 8 * v10)];
              v16[0] = MEMORY[0x263EF8330];
              v16[1] = 3221225472;
              v16[2] = __47__TSKDocumentRoot_TSWPAdditions__documentFonts__block_invoke;
              v16[3] = &unk_2646B2810;
              v16[4] = v3;
              [v11 enumerateObjectsUsingBlock:v16];
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
          }
          while (v8);
        }
        ++v4;
      }
      while (v4 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v15);
  }
  return v3;
}

uint64_t __47__TSKDocumentRoot_TSWPAdditions__documentFonts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "propertyMap"), "objectForProperty:", 16);
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 addObject:v4];
  }
  return result;
}

- (id)unavailableDocumentFonts
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [(TSKDocumentRoot *)self documentFonts];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x263F03AE8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v18 = v7;
        uint64_t v19 = v9;
        uint64_t v10 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1]);
        if (v10
          && (uint64_t v11 = v10,
              CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v10, 0),
              CFRelease(v11),
              MatchingFontDescriptors))
        {
          CFRelease(MatchingFontDescriptors);
        }
        else
        {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
  return v3;
}

@end