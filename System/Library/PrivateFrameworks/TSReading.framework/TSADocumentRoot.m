@interface TSADocumentRoot
+ (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5;
- (BOOL)exportToPath:(id)a3 exporter:(id)a4 delegate:(id)a5 error:(id *)a6;
- (BOOL)exportToPath:(id)a3 exporter:(id)a4 error:(id *)a5;
- (BOOL)hasICloudConflict;
- (BOOL)hasPreUFFVersion;
- (BOOL)isDocumentEditedSinceLastSave;
- (BOOL)isMultiPageForQuickLook;
- (BOOL)needsMovieCompatibilityUpgrade;
- (BOOL)shouldAllowDrawableInGroups:(id)a3 forImport:(BOOL)a4;
- (BOOL)writeData:(id)a3 atDocumentCachePath:(id)a4;
- (CGImageSource)newImageSourceForDocumentCachePath:(id)a3;
- (NSSet)missingFontWarningMessages;
- (NSString)defaultDraftName;
- (NSString)name;
- (NSString)templateIdentifier;
- (TSADocumentRoot)init;
- (TSADocumentRoot)initWithContext:(id)a3;
- (TSADocumentRootDelegate)delegate;
- (TSADrawableFactory)drawableFactory;
- (id)additionalDocumentPropertiesForWrite;
- (id)commandForPropagatingPresetChangeCommand:(id)a3 alwaysPreserveAppearance:(BOOL)a4;
- (id)creationLanguage;
- (id)customFormatList;
- (id)dataFromDocumentCachePath:(id)a3;
- (id)documentCachePath;
- (id)newExporterForType:(id)a3 options:(id)a4 preferredType:(id *)a5;
- (id)p_characterStyleWithProperties:(id)a3 stylesheet:(id)a4 override:(id)a5;
- (id)p_parseNumberOutOfBasename:(id)a3 hasNumber:(BOOL *)a4 number:(unint64_t *)a5;
- (id)packageDataForWrite;
- (id)protected_defaultTextPresetOrdering;
- (id)referencedStylesOfClass:(Class)a3;
- (id)uniqueDocumentCachePathForProposedPath:(id)a3;
- (id)upgradeState;
- (id)warnings;
- (int64_t)addObserverForICloudTeardownWithBlock:(id)a3;
- (unint64_t)writingDirection;
- (void)addWarning:(id)a3;
- (void)changeDocumentCacheFileProtection:(id)a3;
- (void)dealloc;
- (void)didSaveWithEncryptionChange;
- (void)documentDidLoad;
- (void)fulfillPasteboardPromises;
- (void)initializeForImport;
- (void)insertTextPresetDisplayItemsPreservingGrouping:(id)a3 insertAtBeginningOfGroup:(BOOL)a4;
- (void)pUpgradeHyperlinks;
- (void)p_removeStyles:(id)a3;
- (void)p_replaceStyle:(id)a3 andChildrenWithVariationOfStyle:(id)a4;
- (void)p_replaceStyles:(id)a3 andChildrenWithVariationOfStyle:(id)a4;
- (void)p_updateCreationLanguage;
- (void)prepareForSavingAsTemplate;
- (void)prepareNewDocumentWithTemplateBundle:(id)a3;
- (void)removeWarning:(id)a3;
- (void)setCreationLanguage:(id)a3;
- (void)setCustomFormatList:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasPreUFFVersion:(BOOL)a3;
- (void)setNeedsMovieCompatibilityUpgrade:(BOOL)a3;
- (void)setTemplateIdentifier:(id)a3;
- (void)updateWritingDirection:(unint64_t)a3;
- (void)willClose;
@end

@implementation TSADocumentRoot

- (id)creationLanguage
{
  return self->_creationLanguage;
}

- (void)setCreationLanguage:(id)a3
{
  [(TSPObject *)self willModify];
  v5 = (NSString *)[a3 copy];

  self->_creationLanguage = v5;
  self->_creationLanguageWritingDirection = [MEMORY[0x263EFF960] characterDirectionForLanguage:v5];
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (void)setTemplateIdentifier:(id)a3
{
  [(TSPObject *)self willModify];
  v5 = (NSString *)[a3 copy];

  self->_templateIdentifier = v5;
}

- (BOOL)needsMovieCompatibilityUpgrade
{
  return self->_needsMovieCompatibilityUpgrade;
}

- (void)setNeedsMovieCompatibilityUpgrade:(BOOL)a3
{
  self->_needsMovieCompatibilityUpgrade = a3;
}

- (TSADocumentRoot)initWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSADocumentRoot;
  v4 = -[TSKDocumentRoot initWithContext:](&v7, sel_initWithContext_);
  v5 = v4;
  if (v4)
  {
    [(TSADocumentRoot *)v4 p_updateCreationLanguage];
    v5->_tablesCustomFormatList = [[TSTCustomFormatList alloc] initWithContext:a3];
  }
  return v5;
}

- (TSADocumentRoot)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSADocumentRoot init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 237, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSADocumentRoot init]"), 0 reason userInfo]);
}

- (void)prepareNewDocumentWithTemplateBundle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[TSADocumentRoot p_updateBuildVersionHistoryWithVersionOfTemplateBundle:](self, "p_updateBuildVersionHistoryWithVersionOfTemplateBundle:");
  [(TSADocumentRoot *)self p_updateCreationLanguage];
  self->super._isBeingLocalized = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(TSKDocumentRoot *)self modelEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(id)objc_opt_class() localizeModelObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++) withTemplateBundle:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  self->super._isBeingLocalized = 0;
}

- (void)p_updateCreationLanguage
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF960] preferredLanguages];
  if ([v3 count]) {
    uint64_t v4 = [v3 objectAtIndex:0];
  }
  else {
    uint64_t v4 = 0;
  }

  [(TSADocumentRoot *)self setCreationLanguage:v4];
}

- (void)updateWritingDirection:(unint64_t)a3
{
  self->_creationLanguageWritingDirection = a3;
}

- (unint64_t)writingDirection
{
  return self->_creationLanguageWritingDirection;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSADocumentRoot;
  [(TSKDocumentRoot *)&v3 dealloc];
}

- (void)documentDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)TSADocumentRoot;
  [(TSKDocumentRoot *)&v2 documentDidLoad];
}

- (id)upgradeState
{
  id result = self->_upgradeState;
  if (!result)
  {
    id result = (id)objc_opt_new();
    self->_upgradeState = (NSMutableDictionary *)result;
  }
  return result;
}

- (id)packageDataForWrite
{
  return 0;
}

- (id)additionalDocumentPropertiesForWrite
{
  objc_super v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[TSADocumentRoot isMultiPageForQuickLook](self, "isMultiPageForQuickLook")), @"isMultiPage");
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentRoot;
  id v4 = [(TSKDocumentRoot *)&v6 additionalDocumentPropertiesForWrite];
  if (v4) {
    [v3 addEntriesFromDictionary:v4];
  }
  return v3;
}

- (void)fulfillPasteboardPromises
{
  objc_super v2 = [(TSKDocumentRoot *)self pasteboardController];

  [(TSKPasteboardController *)v2 fulfillPasteboardPromises];
}

- (void)willClose
{
  self->_isClosed = 1;
  [(TSADocumentRoot *)self fulfillPasteboardPromises];
}

- (void)initializeForImport
{
  if (!self->_tablesCustomFormatList) {
    self->_tablesCustomFormatList = [[TSTCustomFormatList alloc] initWithContext:[(TSPObject *)self context]];
  }
}

- (id)customFormatList
{
  return self->_tablesCustomFormatList;
}

- (void)setCustomFormatList:(id)a3
{
  id v5 = a3;

  self->_tablesCustomFormatList = (TSTCustomFormatList *)a3;
}

+ (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5
{
  if (a4) {
    return 0;
  }
  uint64_t v15 = v6;
  uint64_t v16 = v5;
  BOOL v10 = a5;
  long long v11 = (void *)MEMORY[0x263EFFA08];
  long long v12 = (void *)TSABundle();
  if (v10) {
    long long v13 = @"Some external movies are missing because they\\U2019re no longer available.";
  }
  else {
    long long v13 = @"Some images are missing because they were deleted from the document.";
  }
  uint64_t v14 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_26D688A48, @"TSApplication", v15, v16, v7);
  return (id)[v11 setWithObject:v14];
}

- (NSSet)missingFontWarningMessages
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [(TSKDocumentRoot *)self unavailableDocumentFonts];
  uint64_t v3 = [v2 count];
  if (!v3) {
    return 0;
  }
  id v4 = (NSSet *)[MEMORY[0x263EFF9C0] setWithCapacity:v3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v2);
        }
        -[NSSet addObject:](v4, "addObject:", [NSString stringWithFormat:objc_msgSend((id)TSABundle(), "localizedStringForKey:value:table:", @"The font %@ is missing. Your text might look different.", &stru_26D688A48, @"TSApplication", *(void *)(*((void *)&v10 + 1) + 8 * i)]);
      }
      uint64_t v6 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)newExporterForType:(id)a3 options:(id)a4 preferredType:(id *)a5
{
  id v7 = a3;
  uint64_t v9 = (objc_class *)objc_msgSend((id)objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "compatibilityDelegate"), "exporterClassForType:options:", a3, a4);
  if (!v9)
  {
    long long v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSADocumentRoot newExporterForType:options:preferredType:]"];
    [v10 handleFailureInFunction:v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1165, @"Can't find exporter class for type %@", v7 file lineNumber description];
  }
  long long v12 = (void *)[[v9 alloc] initWithDocumentRoot:self];
  if (objc_opt_respondsToSelector()) {
    [v12 setOptions:a4];
  }
  long long v13 = (void *)[a4 objectForKeyedSubscript:@"TSKExportOptionsRequiresPassphrase"];
  if ([v13 isEqual:MEMORY[0x263EFFA88]])
  {
    uint64_t v14 = (void *)TSUProtocolCast();
    if (v14)
    {
      objc_msgSend(v14, "setPassphrase:hint:", objc_msgSend(a4, "objectForKeyedSubscript:", @"TSKExportOptionsPassphrase"), objc_msgSend(a4, "objectForKeyedSubscript:", @"TSKExportOptionsPassphraseHint"));
    }
    else
    {
      uint64_t v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSADocumentRoot newExporterForType:options:preferredType:]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1184, @"Attempting to set a passphrase and hint on an exporter that doesn't conform to TSKEncryptedDocumentExporter");
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v12 documentSpecificTypeUTI];
    if (v17) {
      id v7 = (id)v17;
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v12 setTypeUTI:v7];
  }
  if (a5) {
    *a5 = v7;
  }
  return v12;
}

- (BOOL)exportToPath:(id)a3 exporter:(id)a4 error:(id *)a5
{
  return [(TSADocumentRoot *)self exportToPath:a3 exporter:a4 delegate:self error:a5];
}

- (BOOL)exportToPath:(id)a3 exporter:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v7 = &v19;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__32;
  v23 = __Block_byref_object_dispose__32;
  uint64_t v24 = 0;
  if (a4)
  {
    id v12 = a4;

    self->_warnings = 0;
    long long v13 = [(TSKDocumentRoot *)self accessController];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__TSADocumentRoot_exportToPath_exporter_delegate_error___block_invoke;
    v18[3] = &unk_2646B3CD8;
    v18[4] = self;
    v18[5] = a4;
    v18[6] = a3;
    v18[7] = a5;
    v18[8] = &v25;
    v18[9] = &v19;
    [(TSKAccessController *)v13 performRead:v18];

    id v7 = v20;
    BOOL v14 = *((unsigned char *)v26 + 24) == 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if (v14) {
    *a6 = (id)v7[5];
  }
LABEL_7:
  id v15 = (id)v7[5];
  char v16 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __56__TSADocumentRoot_exportToPath_exporter_delegate_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) context];
  [v2 beginAssertOnModify];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "exportToURL:delegate:error:", objc_msgSend(NSURL, "fileURLWithPath:", *(void *)(a1 + 48)), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 72) + 8) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 40));
  return [v2 endAssertOnModify];
}

- (id)warnings
{
  return (id)[(NSMutableSet *)self->_warnings allObjects];
}

- (void)addWarning:(id)a3
{
  warnings = self->_warnings;
  if (!warnings)
  {
    warnings = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->_warnings = warnings;
  }

  [(NSMutableSet *)warnings addObject:a3];
}

- (void)removeWarning:(id)a3
{
}

- (void)prepareForSavingAsTemplate
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSADocumentRoot prepareForSavingAsTemplate]"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"];
    [v2 handleFailureInFunction:v3 file:v4 lineNumber:1287 description:@"This operation must only be performed on the main thread."];
  }
}

- (id)protected_defaultTextPresetOrdering
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (void)insertTextPresetDisplayItemsPreservingGrouping:(id)a3 insertAtBeginningOfGroup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(TSPObject *)self willModify];
  id v7 = [(TSKDocumentRoot *)self theme];
  if (objc_msgSend(-[TSSTheme presetsOfKind:](v7, "presetsOfKind:", String), "count"))
  {
    uint64_t v8 = [(TSKDocumentRoot *)self theme];
    uint64_t v9 = objc_msgSend(-[TSSTheme presetsOfKind:](v8, "presetsOfKind:", String), "mutableCopy");
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = (id)[a3 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v26)
    {
      uint64_t v10 = *(void *)v34;
      if (v4) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 2;
      }
      BOOL v25 = !v4;
      do
      {
        for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(a3);
          }
          long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          char v32 = 0;
          uint64_t v31 = 0;
          id v14 = -[TSADocumentRoot p_parseNumberOutOfBasename:hasNumber:number:](self, "p_parseNumberOutOfBasename:hasNumber:number:", [v13 name], &v32, &v31);
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke;
          v29[3] = &unk_2646B3D00;
          v29[4] = self;
          v29[5] = v14;
          char v30 = v32;
          v29[6] = v31;
          uint64_t v15 = [v9 indexOfObjectWithOptions:v11 passingTest:v29];
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v16 = v11;
            uint64_t v17 = v10;
            id v18 = a3;
            id v19 = [(TSADocumentRoot *)self protected_defaultTextPresetOrdering];
            uint64_t v20 = [v19 indexOfObject:v14];
            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v21 = [v9 count];
            }
            else
            {
              v28[0] = MEMORY[0x263EF8330];
              v28[1] = 3221225472;
              v28[2] = __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke_2;
              v28[3] = &unk_2646B3D28;
              v28[4] = self;
              v28[5] = v19;
              v28[6] = v20;
              uint64_t v22 = [v9 indexOfObjectWithOptions:2 passingTest:v28];
              if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v21 = 0;
              }
              else {
                uint64_t v21 = v22 + 1;
              }
            }
            a3 = v18;
            uint64_t v10 = v17;
            uint64_t v11 = v16;
          }
          else
          {
            uint64_t v21 = v15 + v25;
          }
          [v9 insertObject:v13 atIndex:v21];
        }
        id v26 = (id)[a3 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v26);
    }
    v23 = [(TSKDocumentRoot *)self theme];
    [(TSSTheme *)v23 setPresets:v9 ofKind:String];
  }
  else
  {
    id v27 = (id)[a3 copy];
    uint64_t v24 = [(TSKDocumentRoot *)self theme];
    [(TSSTheme *)v24 setPresets:v27 ofKind:String];
  }
}

uint64_t __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v9 = 0;
  unint64_t v8 = 0;
  int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_parseNumberOutOfBasename:hasNumber:number:", objc_msgSend(a2, "name"), &v9, &v8), "isEqualToString:", *(void *)(a1 + 40));
  uint64_t result = 0;
  if (v6)
  {
    if (*(unsigned char *)(a1 + 56) && v9 && v8 >= *(void *)(a1 + 48))
    {
      return 0;
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v9 = 0;
  uint64_t v8 = 0;
  unint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", objc_msgSend(*(id *)(a1 + 32), "p_parseNumberOutOfBasename:hasNumber:number:", objc_msgSend(a2, "name", 0), &v9, &v8));
  uint64_t result = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= *(void *)(a1 + 48))
    {
      uint64_t result = 1;
      *a4 = 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)p_parseNumberOutOfBasename:(id)a3 hasNumber:(BOOL *)a4 number:(unint64_t *)a5
{
  *a4 = 0;
  uint64_t v8 = [a3 rangeOfString:@" " options:4];
  if (v8) {
    BOOL v10 = v8 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    return a3;
  }
  uint64_t v12 = v8;
  long long v13 = (void *)[a3 substringFromIndex:v8 + v9];
  id v14 = (void *)[MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v15 = [v13 length];
  if (!v15)
  {
    *a4 = 0;
    return a3;
  }
  unint64_t v16 = v15;
  unint64_t v17 = 0;
  while (objc_msgSend(v14, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v17)))
  {
    if (v16 == ++v17)
    {
      unint64_t v17 = v16;
      break;
    }
  }
  *a4 = v16 - 1 < v17;
  if (v16 - 1 >= v17) {
    return a3;
  }
  *a5 = (int)[v13 intValue];

  return (id)[a3 substringToIndex:v12];
}

- (id)p_characterStyleWithProperties:(id)a3 stylesheet:(id)a4 override:(id)a5
{
  uint64_t v5 = 0;
  if (a3 && a4)
  {
    if ([a3 count])
    {
      if (!a5 || (uint64_t v5 = (TSWPCharacterStyle *)[a4 variationOfStyle:a5 propertyMap:a3]) == 0)
      {
        uint64_t v5 = (TSWPCharacterStyle *)[a4 firstRootlessStyleOfClass:objc_opt_class() withOverridePropertyMap:a3];
        if (!v5)
        {
          uint64_t v5 = -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPCharacterStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", [a4 context], 0, a3, 0);
          [a4 addStyle:v5];
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (void)pUpgradeHyperlinks
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = -[TSKDocumentRoot modelEnumeratorForObjectsOfClass:](self, "modelEnumeratorForObjectsOfClass:", objc_opt_class(), 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(TSADocumentRoot *)self pUpgradeHyperlinksInStorage:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)p_removeStyles:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = (void *)[MEMORY[0x263F7C878] setWithSet:a3];
  while (1)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C878] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v3);
          }
          long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v10 = (void *)[v9 children];
          if (!v10 || ![v10 count]) {
            [v4 addObject:v9];
          }
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
    if (![v4 count]) {
      break;
    }
    [v3 minusSet:v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "stylesheet"), "removeStyle:", *(void *)(*((void *)&v17 + 1) + 8 * j));
        }
        uint64_t v12 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
  if ([v3 count])
  {
    uint64_t v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSADocumentRoot p_removeStyles:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1601, @"Could not remove all requested styles.");
  }
}

- (void)p_replaceStyles:(id)a3 andChildrenWithVariationOfStyle:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)[MEMORY[0x263F7C878] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = a3;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        uint64_t v12 = objc_opt_class();
        if (v12 != objc_opt_class())
        {
          uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v14 = [NSString stringWithUTF8String:"-[TSADocumentRoot p_replaceStyles:andChildrenWithVariationOfStyle:]"];
          uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"];
          uint64_t v16 = TSUObjectReferenceDescription();
          [v13 handleFailureInFunction:v14, v15, 1617, @"Replaceable root style %@ is a different class than new parent %@", v16, TSUObjectReferenceDescription() file lineNumber description];
        }
        [v6 addObject:v11];
        uint64_t v17 = [v11 children];
        if (v17) {
          [v6 unionSet:v17];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  uint64_t v18 = [MEMORY[0x263F7C878] set];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke;
  v21[3] = &unk_2646B3D78;
  v21[4] = v6;
  v21[5] = self;
  v21[6] = a4;
  v21[7] = v18;
  [(TSKDocumentRoot *)self enumerateStyleClientsUsingBlock:v21];
  [v6 minusSet:v18];
  [(TSADocumentRoot *)self p_removeStyles:v6];
}

uint64_t __67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "referencedStyles"), "intersectsSet:", *(void *)(a1 + 32));
  if (result)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke_2;
    v6[3] = &unk_2646B3D50;
    long long v5 = *(_OWORD *)(a1 + 48);
    long long v7 = *(_OWORD *)(a1 + 32);
    long long v8 = v5;
    return [a2 replaceReferencedStylesUsingBlock:v6];
  }
  return result;
}

void *__67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stylesheet"), "variationOfStyleMatchingStyle:withNewParentStyle:", v2, *(void *)(a1 + 48));
    [*(id *)(a1 + 56) addObject:v2];
    if ([v2 parent]) {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(v2, "parent"));
    }
  }
  return v2;
}

- (void)p_replaceStyle:(id)a3 andChildrenWithVariationOfStyle:(id)a4
{
  uint64_t v6 = [MEMORY[0x263F7C8D0] setWithObject:a3];

  [(TSADocumentRoot *)self p_replaceStyles:v6 andChildrenWithVariationOfStyle:a4];
}

- (BOOL)shouldAllowDrawableInGroups:(id)a3 forImport:(BOOL)a4
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4) {
    return [v4 isAudioOnly] ^ 1;
  }
  else {
    return 1;
  }
}

- (id)referencedStylesOfClass:(Class)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v5 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(TSKDocumentRoot *)self modelEnumeratorForObjectsOfClass:objc_opt_class()];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "unionSet:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v10++), "referencedStylesOfClass:", a3));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }
  if ((Class)objc_opt_class() == a3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [(TSKDocumentRoot *)self theme];
    id v12 = [(TSSTheme *)v11 presetsOfKind:String];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * v16) defaultParagraphStyle];
          if (v17)
          {
            [v5 addObject:v17];
          }
          else
          {
            uint64_t v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v19 = [NSString stringWithUTF8String:"-[TSADocumentRoot referencedStylesOfClass:]"];
            objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2210, @"invalid nil value for '%s'", "paragraphStyle");
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }
  }
  return v5;
}

- (id)documentCachePath
{
  v12[1] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    return (id)[(TSADocumentRootDelegate *)delegate documentCachePath];
  }
  else
  {
    long long v5 = objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", @"DocumentCaches");
    id v6 = (void *)[MEMORY[0x263F08850] defaultManager];
    if (([v6 fileExistsAtPath:v5] & 1) == 0)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *MEMORY[0x263F08010];
      v12[0] = MEMORY[0x263EFFA88];
      if ((objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1), &v10) & 1) == 0)
      {
        uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v8 = [NSString stringWithUTF8String:"-[TSADocumentRoot documentCachePath]"];
        uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"];
        [v7 handleFailureInFunction:v8, v9, 2244, @"Could not create document cache directory: %@", v10 file lineNumber description];
      }
    }
    return (id)objc_msgSend(v5, "stringByAppendingPathComponent:", -[TSADocumentRoot name](self, "name"));
  }
}

- (id)dataFromDocumentCachePath:(id)a3
{
  uint64_t v4 = objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", a3);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v4)) {
    return 0;
  }
  long long v5 = [(TSPObjectContext *)[(TSPObject *)self context] decryptionKey];
  id v6 = (void *)MEMORY[0x263EFF8F8];
  if (v5)
  {
    uint64_t v7 = [NSURL fileURLWithPath:v4];
    uint64_t v8 = [(TSPObjectContext *)[(TSPObject *)self context] decryptionKey];
    return (id)[v6 dataWithContentsOfURL:v7 decryptionKey:v8];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF8F8];
    return (id)[v10 dataWithContentsOfFile:v4];
  }
}

- (void)didSaveWithEncryptionChange
{
  id v3 = (void *)[MEMORY[0x263F08850] defaultManager];
  id v4 = [(TSADocumentRoot *)self documentCachePath];

  [v3 removeItemAtPath:v4 error:0];
}

- (BOOL)writeData:(id)a3 atDocumentCachePath:(id)a4
{
  uint64_t v7 = objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", a4);
  uint64_t v8 = [v7 stringByDeletingLastPathComponent];
  if (a3)
  {
    uint64_t v9 = v8;
    uint64_t v20 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v20) & 1) == 0)
    {
      uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSADocumentRoot writeData:atDocumentCachePath:]"];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"];
      [v10 handleFailureInFunction:v11, v12, 2290, @"Unable to create cache directory: %@ with error: %@", v9, v20 file lineNumber description];
    }
    if ([(TSPObjectContext *)[(TSPObject *)self context] decryptionKey])
    {
      if ((objc_msgSend(a3, "writeToURL:encryptionKey:", objc_msgSend(NSURL, "fileURLWithPath:", v7), -[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey")) & 1) == 0)goto LABEL_14; {
    }
      }
    else if (([a3 writeToFile:v7 options:0 error:&v20] & 1) == 0)
    {
      uint64_t v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSADocumentRoot writeData:atDocumentCachePath:]"];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"];
      [v15 handleFailureInFunction:v16, v17, 2298, @"Unable to write to cache path: %@ with error: %@", v7, v20 file lineNumber description];
LABEL_14:
      uint64_t v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[TSADocumentRoot writeData:atDocumentCachePath:]"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2304, @"Failed to write cache file");
      return 0;
    }
    return 1;
  }
  if (!a4) {
    return 0;
  }
  uint64_t v13 = (void *)[MEMORY[0x263F08850] defaultManager];

  return [v13 removeItemAtPath:v7 error:0];
}

- (CGImageSource)newImageSourceForDocumentCachePath:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", a3);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = (const __CFString *)v4;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v4)) {
    return 0;
  }
  CFURLRef v6 = (const __CFURL *)[NSURL fileURLWithPath:v5];
  uint64_t v13 = *MEMORY[0x263F0F600];
  v14[0] = MEMORY[0x263EFFA88];
  CFDictionaryRef v7 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  if (![(TSPObjectContext *)[(TSPObject *)self context] decryptionKey])
  {
    CFURLRef v10 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, kCFURLPOSIXPathStyle, 0);
    if (v10)
    {
      CFURLRef v11 = v10;
      uint64_t v9 = CGImageSourceCreateWithURL(v6, v7);
      CFRelease(v11);
      return v9;
    }
    return 0;
  }
  uint64_t v8 = (void *)MEMORY[0x223CB9570]();
  uint64_t v9 = CGImageSourceCreateWithData((CFDataRef)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:decryptionKey:", v6, -[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey")), v7);
  return v9;
}

- (id)uniqueDocumentCachePathForProposedPath:(id)a3
{
  CFStringRef v5 = (void *)[a3 stringByDeletingLastPathComponent];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "tsu_stringByUniquingPathInsideDirectory:", objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", v5));

  return (id)[v5 stringByAppendingPathComponent:v6];
}

- (void)changeDocumentCacheFileProtection:(id)a3
{
  id v4 = [(TSADocumentRoot *)self documentCachePath];
  if (v4)
  {
    id v5 = v4;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v4))
    {
      uint64_t v7 = 0;
      uint64_t v6 = (void *)[MEMORY[0x263F08850] defaultManager];
      objc_msgSend(v6, "changeFileProtectionAtURL:toProtection:recursively:error:", objc_msgSend(NSURL, "fileURLWithPath:", v5), a3, 1, &v7);
    }
  }
}

- (NSString)name
{
  return (NSString *)[(TSADocumentRootDelegate *)self->_delegate name];
}

- (NSString)defaultDraftName
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    return (NSString *)[(TSADocumentRootDelegate *)delegate defaultDraftName];
  }
  else
  {
    return [(TSADocumentRoot *)self name];
  }
}

- (BOOL)isDocumentEditedSinceLastSave
{
  id v2 = [(TSKDocumentRoot *)self documentSupport];

  return [(TSKDocumentSupport *)v2 isDocumentEditedSinceLastSave];
}

- (TSADrawableFactory)drawableFactory
{
  id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSADocumentRoot drawableFactory]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2412, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSADocumentRoot drawableFactory]"), 0 reason userInfo]);
}

- (id)commandForPropagatingPresetChangeCommand:(id)a3 alwaysPreserveAppearance:(BOOL)a4
{
  return 0;
}

- (int64_t)addObserverForICloudTeardownWithBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSADocumentRoot;
  return [(TSKDocumentRoot *)&v4 addObserverForICloudTeardownWithBlock:a3];
}

- (BOOL)hasICloudConflict
{
  id v2 = [(TSADocumentRoot *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = 0;
    uint64_t v3 = (void *)[(TSADocumentRootDelegate *)v2 fileURL];
    int v4 = [v3 getResourceValue:&v6 forKey:*MEMORY[0x263EFF7B8] error:0];
    if (v4) {
      LOBYTE(v4) = [v6 BOOLValue];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isMultiPageForQuickLook
{
  id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSADocumentRoot isMultiPageForQuickLook]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2463, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSADocumentRoot isMultiPageForQuickLook]"), 0 reason userInfo]);
}

- (TSADocumentRootDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSADocumentRootDelegate *)a3;
}

- (BOOL)hasPreUFFVersion
{
  return self->_hasPreUFFVersion;
}

- (void)setHasPreUFFVersion:(BOOL)a3
{
  self->_hasPreUFFVersion = a3;
}

@end