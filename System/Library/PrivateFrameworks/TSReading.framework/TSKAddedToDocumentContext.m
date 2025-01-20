@interface TSKAddedToDocumentContext
+ (id)changeTrackingSubstorageForCopyContext;
+ (id)dragCopyContext;
+ (id)dragMoveContext;
+ (id)exportFootnoteContext;
+ (id)importingContextWithImporterID:(id)a3;
+ (id)importingMasterTemplateContextWithImporterID:(id)a3;
+ (id)insertingPrototypeContext;
+ (id)movingContext;
+ (id)pastingContext;
+ (id)pastingMatchStyleContext;
+ (id)unarchivingContext;
+ (id)undoDeleteContext;
+ (id)unhidingContext;
- (BOOL)autoUpdateSmartFields;
- (BOOL)changeTrackingSubstorage;
- (BOOL)exportingFootnotes;
- (BOOL)invokeDOLC;
- (BOOL)matchStyle;
- (BOOL)syncChanges;
- (BOOL)uniqueBookmarks;
- (BOOL)wasDragMoved;
- (BOOL)wasDragOperation;
- (BOOL)wasImported;
- (BOOL)wasImportedFromMasterTemplate;
- (BOOL)wasMoved;
- (BOOL)wasPasted;
- (BOOL)wasUnarchived;
- (BOOL)wasUndoDelete;
- (BOOL)wasUnhidden;
- (__CFDictionary)tableIDMap;
- (id)importerID;
- (id)undoContext;
- (void)setTableIDMap:(__CFDictionary *)a3;
@end

@implementation TSKAddedToDocumentContext

+ (id)unarchivingContext
{
  {
    +[TSKAddedToDocumentContext unarchivingContext]::sUnarchivingContext = objc_alloc_init(TSKAddedToDocumentContext_Unarchiving);
  }
  return (id)+[TSKAddedToDocumentContext unarchivingContext]::sUnarchivingContext;
}

+ (id)importingContextWithImporterID:(id)a3
{
  v3 = [[TSKAddedToDocumentContext_Importing alloc] initWithImporterID:a3];

  return v3;
}

+ (id)importingMasterTemplateContextWithImporterID:(id)a3
{
  v3 = [[TSKAddedToDocumentContext_ImportingMasterTemplate alloc] initWithImporterID:a3];

  return v3;
}

+ (id)pastingContext
{
  v2 = objc_alloc_init(TSKAddedToDocumentContext_Pasting);

  return v2;
}

+ (id)pastingMatchStyleContext
{
  {
    +[TSKAddedToDocumentContext pastingMatchStyleContext]::sPastingMatchStyleContext = objc_alloc_init(TSKAddedToDocumentContext_PastingMatchStyle);
  }
  return (id)+[TSKAddedToDocumentContext pastingMatchStyleContext]::sPastingMatchStyleContext;
}

+ (id)dragMoveContext
{
  {
    +[TSKAddedToDocumentContext dragMoveContext]::sPastingContext = objc_alloc_init(TSKAddedToDocumentContext_DragMove);
  }
  return (id)+[TSKAddedToDocumentContext dragMoveContext]::sPastingContext;
}

+ (id)dragCopyContext
{
  {
    +[TSKAddedToDocumentContext dragCopyContext]::sPastingContext = objc_alloc_init(TSKAddedToDocumentContext_DragCopy);
  }
  return (id)+[TSKAddedToDocumentContext dragCopyContext]::sPastingContext;
}

+ (id)insertingPrototypeContext
{
  {
    +[TSKAddedToDocumentContext insertingPrototypeContext]::sInsertingPrototypeContext = objc_alloc_init(TSKAddedToDocumentContext_InsertingPrototype);
  }
  return (id)+[TSKAddedToDocumentContext insertingPrototypeContext]::sInsertingPrototypeContext;
}

+ (id)movingContext
{
  {
    +[TSKAddedToDocumentContext movingContext]::sMovingContext = objc_alloc_init(TSKAddedToDocumentContext_Moving);
  }
  return (id)+[TSKAddedToDocumentContext movingContext]::sMovingContext;
}

+ (id)unhidingContext
{
  {
    +[TSKAddedToDocumentContext unhidingContext]::sUnhidingContext = objc_alloc_init(TSKAddedToDocumentContext_Unhiding);
  }
  return (id)+[TSKAddedToDocumentContext unhidingContext]::sUnhidingContext;
}

+ (id)undoDeleteContext
{
  {
    +[TSKAddedToDocumentContext undoDeleteContext]::sUndoDeleteContext = objc_alloc_init(TSKAddedToDocumentContext_UndoDelete);
  }
  return (id)+[TSKAddedToDocumentContext undoDeleteContext]::sUndoDeleteContext;
}

+ (id)exportFootnoteContext
{
  {
    +[TSKAddedToDocumentContext exportFootnoteContext]::sExportFootnoteContext = objc_alloc_init(TSKAddedToDocumentContext_ExportFootnotes);
  }
  return (id)+[TSKAddedToDocumentContext exportFootnoteContext]::sExportFootnoteContext;
}

+ (id)changeTrackingSubstorageForCopyContext
{
  {
    +[TSKAddedToDocumentContext changeTrackingSubstorageForCopyContext]::sChangeTrackingSubstorageContext = objc_alloc_init(TSKAddedToDocumentContext_SubstorageForChangeTrackingCopy);
  }
  return (id)+[TSKAddedToDocumentContext changeTrackingSubstorageForCopyContext]::sChangeTrackingSubstorageContext;
}

- (BOOL)wasUnarchived
{
  return 0;
}

- (id)importerID
{
  return 0;
}

- (BOOL)wasImported
{
  return [(TSKAddedToDocumentContext *)self importerID] != 0;
}

- (BOOL)wasImportedFromMasterTemplate
{
  return 0;
}

- (BOOL)wasPasted
{
  return 0;
}

- (BOOL)wasDragOperation
{
  return 0;
}

- (BOOL)wasDragMoved
{
  return 0;
}

- (BOOL)wasMoved
{
  return 0;
}

- (BOOL)wasUnhidden
{
  return 0;
}

- (BOOL)wasUndoDelete
{
  return 0;
}

- (BOOL)invokeDOLC
{
  return 1;
}

- (BOOL)autoUpdateSmartFields
{
  return 0;
}

- (BOOL)uniqueBookmarks
{
  return 0;
}

- (BOOL)syncChanges
{
  return 0;
}

- (BOOL)matchStyle
{
  return 0;
}

- (BOOL)exportingFootnotes
{
  return 0;
}

- (BOOL)changeTrackingSubstorage
{
  return 0;
}

- (id)undoContext
{
  return 0;
}

- (__CFDictionary)tableIDMap
{
  return 0;
}

- (void)setTableIDMap:(__CFDictionary *)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAddedToDocumentContext setTableIDMap:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentObjectProtocol.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:721 description:@"Only the pasting context accepts a table ID map."];
}

@end