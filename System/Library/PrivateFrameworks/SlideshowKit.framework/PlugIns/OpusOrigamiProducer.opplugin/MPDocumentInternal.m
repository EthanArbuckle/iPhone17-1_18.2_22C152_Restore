@interface MPDocumentInternal
- (BOOL)alwaysLookupAbsolutePaths;
- (BOOL)assetLogging;
- (BOOL)cacheAbsolutePathOverride;
- (BOOL)isInBatchModify;
- (BOOL)needsActionConfigure;
- (BOOL)savesPathsAsAbsolute;
- (MPLayerGroup)documentLayerGroup;
- (NSLock)cachedPathLock;
- (NSMutableDictionary)cachedAbsolutePaths;
- (NSMutableDictionary)cachedAbsoluteStillPaths;
- (NSMutableDictionary)cachedActionableLayers;
- (NSMutableDictionary)orderedRandomTransitions;
- (NSRecursiveLock)propertiesLock;
- (NSString)lastRandomTransition;
- (NSString)uuid;
- (NSURL)fileURL;
- (NSUndoManager)undoManager;
- (int64_t)batchModifyCount;
- (void)dealloc;
- (void)setAlwaysLookupAbsolutePaths:(BOOL)a3;
- (void)setAssetLogging:(BOOL)a3;
- (void)setBatchModifyCount:(int64_t)a3;
- (void)setCacheAbsolutePathOverride:(BOOL)a3;
- (void)setCachedAbsolutePaths:(id)a3;
- (void)setCachedAbsoluteStillPaths:(id)a3;
- (void)setCachedActionableLayers:(id)a3;
- (void)setCachedPathLock:(id)a3;
- (void)setDocumentLayerGroup:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setIsInBatchModify:(BOOL)a3;
- (void)setLastRandomTransition:(id)a3;
- (void)setNeedsActionConfigure:(BOOL)a3;
- (void)setOrderedRandomTransitions:(id)a3;
- (void)setPropertiesLock:(id)a3;
- (void)setSavesPathsAsAbsolute:(BOOL)a3;
- (void)setUndoManager:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MPDocumentInternal

- (void)dealloc
{
  self->lastRandomTransition = 0;
  self->orderedRandomTransitions = 0;

  self->propertiesLock = 0;
  self->documentLayerGroup = 0;

  self->cachedAbsolutePaths = 0;
  self->cachedAbsoluteStillPaths = 0;

  self->cachedPathLock = 0;
  self->undoManager = 0;

  self->cachedActionableLayers = 0;
  self->fileURL = 0;

  self->uuid = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPDocumentInternal;
  [(MPDocumentInternal *)&v3 dealloc];
}

- (NSString)lastRandomTransition
{
  return self->lastRandomTransition;
}

- (void)setLastRandomTransition:(id)a3
{
}

- (NSMutableDictionary)orderedRandomTransitions
{
  return self->orderedRandomTransitions;
}

- (void)setOrderedRandomTransitions:(id)a3
{
}

- (NSRecursiveLock)propertiesLock
{
  return self->propertiesLock;
}

- (void)setPropertiesLock:(id)a3
{
}

- (MPLayerGroup)documentLayerGroup
{
  return self->documentLayerGroup;
}

- (void)setDocumentLayerGroup:(id)a3
{
}

- (BOOL)savesPathsAsAbsolute
{
  return self->savesPathsAsAbsolute;
}

- (void)setSavesPathsAsAbsolute:(BOOL)a3
{
  self->savesPathsAsAbsolute = a3;
}

- (BOOL)assetLogging
{
  return self->assetLogging;
}

- (void)setAssetLogging:(BOOL)a3
{
  self->assetLogging = a3;
}

- (NSMutableDictionary)cachedAbsolutePaths
{
  return self->cachedAbsolutePaths;
}

- (void)setCachedAbsolutePaths:(id)a3
{
}

- (NSMutableDictionary)cachedAbsoluteStillPaths
{
  return self->cachedAbsoluteStillPaths;
}

- (void)setCachedAbsoluteStillPaths:(id)a3
{
}

- (NSLock)cachedPathLock
{
  return self->cachedPathLock;
}

- (void)setCachedPathLock:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->undoManager;
}

- (void)setUndoManager:(id)a3
{
}

- (int64_t)batchModifyCount
{
  return self->batchModifyCount;
}

- (void)setBatchModifyCount:(int64_t)a3
{
  self->batchModifyCount = a3;
}

- (BOOL)needsActionConfigure
{
  return self->needsActionConfigure;
}

- (void)setNeedsActionConfigure:(BOOL)a3
{
  self->needsActionConfigure = a3;
}

- (BOOL)isInBatchModify
{
  return self->isInBatchModify;
}

- (void)setIsInBatchModify:(BOOL)a3
{
  self->isInBatchModify = a3;
}

- (NSMutableDictionary)cachedActionableLayers
{
  return self->cachedActionableLayers;
}

- (void)setCachedActionableLayers:(id)a3
{
}

- (NSURL)fileURL
{
  return self->fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)cacheAbsolutePathOverride
{
  return self->cacheAbsolutePathOverride;
}

- (void)setCacheAbsolutePathOverride:(BOOL)a3
{
  self->cacheAbsolutePathOverride = a3;
}

- (BOOL)alwaysLookupAbsolutePaths
{
  return self->alwaysLookupAbsolutePaths;
}

- (void)setAlwaysLookupAbsolutePaths:(BOOL)a3
{
  self->alwaysLookupAbsolutePaths = a3;
}

@end