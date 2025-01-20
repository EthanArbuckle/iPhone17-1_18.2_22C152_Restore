@interface TSKAddedToDocumentContext_Pasting
- (BOOL)autoUpdateSmartFields;
- (BOOL)syncChanges;
- (BOOL)uniqueBookmarks;
- (BOOL)wasPasted;
- (TSKAddedToDocumentContext_Pasting)init;
- (__CFDictionary)tableIDMap;
- (id)description;
- (void)dealloc;
- (void)setTableIDMap:(__CFDictionary *)a3;
@end

@implementation TSKAddedToDocumentContext_Pasting

- (TSKAddedToDocumentContext_Pasting)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAddedToDocumentContext_Pasting;
  result = [(TSKAddedToDocumentContext_Pasting *)&v3 init];
  if (result) {
    result->mTableIDMap = 0;
  }
  return result;
}

- (void)dealloc
{
  mTableIDMap = self->mTableIDMap;
  if (mTableIDMap) {
    CFRelease(mTableIDMap);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSKAddedToDocumentContext_Pasting;
  [(TSKAddedToDocumentContext_Pasting *)&v4 dealloc];
}

- (__CFDictionary)tableIDMap
{
  return self->mTableIDMap;
}

- (void)setTableIDMap:(__CFDictionary *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  mTableIDMap = self->mTableIDMap;
  if (mTableIDMap) {
    CFRelease(mTableIDMap);
  }
  self->mTableIDMap = a3;
}

- (id)description
{
  return @"Pasted";
}

- (BOOL)wasPasted
{
  return 1;
}

- (BOOL)autoUpdateSmartFields
{
  return 1;
}

- (BOOL)uniqueBookmarks
{
  return 1;
}

- (BOOL)syncChanges
{
  return 1;
}

@end