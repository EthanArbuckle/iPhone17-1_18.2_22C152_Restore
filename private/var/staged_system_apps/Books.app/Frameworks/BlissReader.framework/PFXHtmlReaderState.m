@interface PFXHtmlReaderState
+ (Class)stackEntryClass;
- (BOOL)inBody;
- (BOOL)inTable;
- (BOOL)isCancelled;
- (BOOL)isInsideWidget;
- (BOOL)isRawAttribute:(const char *)a3;
- (BOOL)isTOC;
- (BOOL)isWidgetEntry:(id)a3;
- (BOOL)wasCancelled;
- (Class)drawablePlacementClass;
- (Class)textBodyClass;
- (NSMutableDictionary)svgDefinitionCache;
- (NSMutableSet)tableAnchorsToUpdate;
- (NSString)bookGUID;
- (NSString)nodeGUID;
- (PFAIOperationLoadDelegate)loadDelegate;
- (PFXHtmlDocMediaState)currentHtmlDocMediaState;
- (PFXHtmlReaderState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 entry:(id)a5 inArchive:(id)a6;
- (PFXHtmlStackEntry)currentHtmlStackEntry;
- (THDocumentRoot)thDocumentRoot;
- (TSPObjectContext)temporaryContext;
- (TSPObjectContext)tspContext;
- (TSUColor)linkColor;
- (TSUNoCopyDictionary)anchorForCfiFrag;
- (TSUNoCopyDictionary)storageAnchorsForAnchorID;
- (TSUNoCopyDictionary)storageAnchorsForCfiFrag;
- (TSUNoCopyDictionary)textChildOffsetStorageAnchorsForCfiFrag;
- (double)applePubVersion;
- (double)pageContentWidth;
- (double)thinningScaleForImageData:(id)a3;
- (id)contentNode;
- (id)currentTableReader;
- (id)drawableReaderForCurrentMediaStateWithStackEntry:(id)a3;
- (id)frameSpecForName:(id)a3;
- (id)gutterInfosByAssociatedInfos;
- (id)hintCollectorForStorage:(id)a3;
- (id)imageDataForUri:(id)a3;
- (id)imageDataForUri:(id)a3 isSharable:(BOOL)a4;
- (id)popoversByIdentifier;
- (id)postScriptNameForFamilyName:(id)a3;
- (id)propertiesForStylesheetEntry:(id)a3;
- (id)readerForCurrentMediaStateWithStackEntry:(id)a3;
- (id)setUniqueIdForInfo:(id)a3 fromStackEntry:(id)a4;
- (id)setUniqueIdForInfo:(id)a3 nodeBody:(id)a4 withPostfix:(id)a5 fromStackEntry:(id)a6;
- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5;
- (id)targetDrawableInfoForIdentifier:(id)a3;
- (id)uniqueIdForInfo:(id)a3;
- (unint64_t)orientationCount;
- (void)addGutterInfo:(id)a3;
- (void)cacheFrameSpec:(id)a3;
- (void)dealloc;
- (void)setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 nodeBody:(id)a5 fromStackEntry:(id)a6;
- (void)setInBody:(BOOL)a3;
- (void)setInTable:(BOOL)a3;
- (void)setLoadDelegate:(id)a3;
- (void)setNodeGUID:(id)a3;
- (void)setPageContentWidth:(double)a3;
- (void)setStorageAnchor:(id)a3 forAnchorId:(id)a4;
- (void)setStylesheetProperties:(id)a3 forEntry:(id)a4;
- (void)setTargetDrawableInfo:(id)a3 withIdentifier:(id)a4;
@end

@implementation PFXHtmlReaderState

- (PFXHtmlReaderState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 entry:(id)a5 inArchive:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PFXHtmlReaderState;
  v8 = [(PFXXmlStreamReaderState *)&v11 initWithEntry:a5 inArchive:a6];
  v9 = v8;
  if (v8)
  {
    v8->_thDocumentRoot = (THDocumentRoot *)a3;
    v8->mContext = (TSPObjectContext *)[a3 context];
    v9->mContentNode = a4;
    v9->mStylesheetPropertyCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mFontNameCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mSvgDefinitionCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mFrameSpecCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_storageAnchorsForCfiFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_textChildOffsetStorageAnchorsForCfiFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_storageAnchorsForAnchorID = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_anchorForCfiFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_tableAnchorsToUpdate = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9->_wasCancelled = 0;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXHtmlReaderState;
  [(PFXXmlStreamReaderState *)&v3 dealloc];
}

- (NSString)bookGUID
{
  v2 = [(THBookDescription *)[(THDocumentRoot *)self->_thDocumentRoot bookDescription] asset];

  return [(THAsset *)v2 assetID];
}

- (double)applePubVersion
{
  v2 = [(THDocumentRoot *)self->_thDocumentRoot properties];

  [(THDocumentProperties *)v2 applePubVersion];
  return result;
}

- (TSPObjectContext)temporaryContext
{
  return (TSPObjectContext *)+[THTemporaryObjectContext context];
}

- (PFXHtmlDocMediaState)currentHtmlDocMediaState
{
  return 0;
}

- (PFXHtmlStackEntry)currentHtmlStackEntry
{
  return (PFXHtmlStackEntry *)self->super.mCurrentEntry;
}

- (TSUColor)linkColor
{
  return (TSUColor *)+[TSUColor blueColor];
}

- (BOOL)isTOC
{
  return 0;
}

- (unint64_t)orientationCount
{
  return 1;
}

- (id)propertiesForStylesheetEntry:(id)a3
{
  return [(NSMutableDictionary *)self->mStylesheetPropertyCache objectForKey:a3];
}

- (void)setStylesheetProperties:(id)a3 forEntry:(id)a4
{
}

- (id)postScriptNameForFamilyName:(id)a3
{
  v5 = (NSNull *)-[NSMutableDictionary objectForKey:](self->mFontNameCache, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  if (!v5)
  {
    v5 = (NSNull *)TSWPFontPostScriptNameForFamilyName();
    v6 = v5;
    if (!v5) {
      v6 = +[NSNull null];
    }
    [(NSMutableDictionary *)self->mFontNameCache setObject:v6 forKey:a3];
  }
  return v5;
}

- (id)imageDataForUri:(id)a3
{
  return [(PFXHtmlReaderState *)self imageDataForUri:a3 isSharable:1];
}

- (id)imageDataForUri:(id)a3 isSharable:(BOOL)a4
{
  id v6 = +[TSPData dataFromDocumentURI:a3 context:[(PFXHtmlReaderState *)self tspContext]];
  if ([(THDocumentProperties *)[(THDocumentRoot *)self->_thDocumentRoot properties] wasThinned])
  {
    id v7 = [(NSDictionary *)[(THDocumentProperties *)[(THDocumentRoot *)self->_thDocumentRoot properties] originalAssetSizes] objectForKey:a3];
    id v8 = [(NSDictionary *)[(THDocumentProperties *)[(THDocumentRoot *)self->_thDocumentRoot properties] thinnedAssetSizes] objectForKey:a3];
    if (v7 && v8 != 0)
    {
      v10 = v8;
      if (([v7 isEqualToValue:v8] & 1) == 0)
      {
        if (!self->mImageThinningScales) {
          self->mImageThinningScales = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
        }
        [v10 CGSizeValue];
        double v12 = v11;
        [v7 CGSizeValue];
        [(TSUNoCopyDictionary *)self->mImageThinningScales setObject:+[NSNumber numberWithDouble:v12 / v13] forUncopiedKey:v6];
      }
    }
  }
  return v6;
}

- (double)thinningScaleForImageData:(id)a3
{
  if (!a3) {
    return 1.0;
  }
  id v3 = -[TSUNoCopyDictionary objectForKey:](self->mImageThinningScales, "objectForKey:");
  if (!v3) {
    return 1.0;
  }

  [v3 doubleValue];
  return result;
}

- (id)frameSpecForName:(id)a3
{
  return [(NSMutableDictionary *)self->mFrameSpecCache objectForKey:a3];
}

- (void)cacheFrameSpec:(id)a3
{
  mFrameSpecCache = self->mFrameSpecCache;
  id v5 = [a3 frameName];

  [(NSMutableDictionary *)mFrameSpecCache setObject:a3 forKey:v5];
}

- (id)hintCollectorForStorage:(id)a3
{
  return 0;
}

- (id)uniqueIdForInfo:(id)a3
{
  return 0;
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  return 0;
}

- (id)setUniqueIdForInfo:(id)a3 nodeBody:(id)a4 withPostfix:(id)a5 fromStackEntry:(id)a6
{
  double v11 = [a4 nodeUniqueIDForInfo:];
  if (!v11)
  {
    id v12 = [a6 xmlElementId];
    if (!v12
      || ((id v13 = v12, (v14 = [a6 xmlValueForAttribute:"data-original-id"]) != 0)
        ? (id v15 = v14)
        : (id v15 = v13),
          (v16 = +[NSString stringWithXmlString:v15]) == 0
       || (double v11 = v16, [a5 length])
       && (double v11 = +[NSString stringWithFormat:@"%@-%@", v11, a5]) == 0))
    {
      if (xmlStrEqual((const xmlChar *)[a6 xmlElementName], (const xmlChar *)"td")) {
        return 0;
      }
      [(THDocumentProperties *)[(THDocumentRoot *)[(PFXHtmlReaderState *)self thDocumentRoot] properties] applePubVersion];
      if (fabs(v17 + -2.0) < 0.01 || v17 > 2.0) {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[PFXHtmlReaderState setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXHtmlReaderState.mm"] lineNumber:310 description:@"Registering an info %@ using a generated ID with stack entry %@", a3, [a6 description]];
      }
      double v11 = +[NSString stringWithUUID];
    }
    if ([a4 infoForNodeUniqueID:v11])
    {
      if (![a6 xmlValueForAttribute:"data-original-id"]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXHtmlReaderState setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXHtmlReaderState.mm") lineNumber:322 description:@"Expected an original ID that we are avoiding replacing."];
      }
    }
    else
    {
      [a4 setNodeUniqueID:v11 forInfo:a3];
    }
  }
  return v11;
}

- (void)setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 nodeBody:(id)a5 fromStackEntry:(id)a6
{
  id v11 = [a5 nodeUniqueIDForInfo:];
  if (![v11 length])
  {
    [(PFXHtmlReaderState *)self setUniqueIdForInfo:a3 fromStackEntry:a6];
    id v11 = [a5 nodeUniqueIDForInfo:a3];
  }
  objc_opt_class();
  id v12 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", 0, v11, [(id)TSUDynamicCast() length], 0);
  id v13 = [a6 cfiPath];
  id v14 = v13;
  if (a4)
  {
    id v14 = [v13 stringByAppendingFormat:@"/%lu" a4];
    if (a4) {
      uint64_t v15 = 200;
    }
    else {
      uint64_t v15 = 192;
    }
    v18 = *(Class *)((char *)&self->super.super.isa + v15);
    v19 = v12;
    id v17 = v14;
  }
  else
  {
    [(TSUNoCopyDictionary *)self->_storageAnchorsForCfiFrag setObject:v12 forKey:v13];
    textChildOffsetStorageAnchorsForCfiFrag = self->_textChildOffsetStorageAnchorsForCfiFrag;
    id v17 = [v14 stringByAppendingString:@"/1"];
    v18 = textChildOffsetStorageAnchorsForCfiFrag;
    v19 = v12;
  }
  [(TSUNoCopyDictionary *)v18 setObject:v19 forKey:v17];
  if ([(PFXHtmlReaderState *)self inTable]) {
    [(NSMutableSet *)self->_tableAnchorsToUpdate addObject:v12];
  }
  if ([a6 xmlElementId])
  {
    v20 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [a6 xmlElementId]);
    [(TSUNoCopyDictionary *)self->_anchorForCfiFrag setObject:v20 forKey:v14];
    [(PFXHtmlReaderState *)self setStorageAnchor:v12 forAnchorId:v20];
  }
}

- (id)setUniqueIdForInfo:(id)a3 fromStackEntry:(id)a4
{
  return [(PFXHtmlReaderState *)self setUniqueIdForInfo:a3 withPostfix:0 fromStackEntry:a4];
}

- (void)setStorageAnchor:(id)a3 forAnchorId:(id)a4
{
  if (a3) {
    [(TSUNoCopyDictionary *)self->_storageAnchorsForAnchorID setObject:a3 forKey:a4];
  }
  if ([(PFXHtmlReaderState *)self inTable])
  {
    tableAnchorsToUpdate = self->_tableAnchorsToUpdate;
    [(NSMutableSet *)tableAnchorsToUpdate addObject:a3];
  }
}

- (id)targetDrawableInfoForIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  [(NSMutableDictionary *)self->mTargetDrawableInfosWithIdentifier objectForKey:a3];

  return (id)TSUDynamicCast();
}

- (void)setTargetDrawableInfo:(id)a3 withIdentifier:(id)a4
{
  if (a3 && a4 && [a4 length])
  {
    mTargetDrawableInfosWithIdentifier = self->mTargetDrawableInfosWithIdentifier;
    if (!mTargetDrawableInfosWithIdentifier)
    {
      mTargetDrawableInfosWithIdentifier = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->mTargetDrawableInfosWithIdentifier = mTargetDrawableInfosWithIdentifier;
    }
    [(NSMutableDictionary *)mTargetDrawableInfosWithIdentifier setObject:a3 forKey:a4];
  }
}

- (void)addGutterInfo:(id)a3
{
  if (!self->mGutterInfosByAssociatedInfos) {
    self->mGutterInfosByAssociatedInfos = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  }
  if ([a3 associatedInfo])
  {
    mGutterInfosByAssociatedInfos = self->mGutterInfosByAssociatedInfos;
    id v6 = [a3 associatedInfo];
    [(TSUNoCopyDictionary *)mGutterInfosByAssociatedInfos setObject:a3 forUncopiedKey:v6];
  }
}

- (id)popoversByIdentifier
{
  return self->mTargetDrawableInfosWithIdentifier;
}

- (id)gutterInfosByAssociatedInfos
{
  return self->mGutterInfosByAssociatedInfos;
}

- (TSPObjectContext)tspContext
{
  return self->mContext;
}

- (id)contentNode
{
  return self->mContentNode;
}

- (NSMutableDictionary)svgDefinitionCache
{
  return self->mSvgDefinitionCache;
}

- (double)pageContentWidth
{
  return self->mPageContentWidth;
}

- (void)setPageContentWidth:(double)a3
{
  self->mPageContentWidth = a3;
}

- (BOOL)inTable
{
  return self->mInTable;
}

- (void)setInTable:(BOOL)a3
{
  self->mInTable = a3;
}

- (THDocumentRoot)thDocumentRoot
{
  return self->_thDocumentRoot;
}

- (PFAIOperationLoadDelegate)loadDelegate
{
  return self->_loadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->_loadDelegate = (PFAIOperationLoadDelegate *)a3;
}

- (TSUNoCopyDictionary)storageAnchorsForCfiFrag
{
  return self->_storageAnchorsForCfiFrag;
}

- (TSUNoCopyDictionary)textChildOffsetStorageAnchorsForCfiFrag
{
  return self->_textChildOffsetStorageAnchorsForCfiFrag;
}

- (TSUNoCopyDictionary)anchorForCfiFrag
{
  return self->_anchorForCfiFrag;
}

- (TSUNoCopyDictionary)storageAnchorsForAnchorID
{
  return self->_storageAnchorsForAnchorID;
}

- (NSMutableSet)tableAnchorsToUpdate
{
  return self->_tableAnchorsToUpdate;
}

- (BOOL)wasCancelled
{
  return self->_wasCancelled;
}

- (NSString)nodeGUID
{
  return self->_nodeGUID;
}

- (void)setNodeGUID:(id)a3
{
}

- (BOOL)inBody
{
  return self->_inBody;
}

- (void)setInBody:(BOOL)a3
{
  self->_inBody = a3;
}

- (BOOL)isCancelled
{
  if (self->_wasCancelled) {
    BOOL result = 1;
  }
  else {
    BOOL result = [(PFAIOperationLoadDelegate *)[(PFXHtmlReaderState *)self loadDelegate] operationShouldCancelLoad];
  }
  self->_wasCancelled = result;
  return result;
}

+ (Class)stackEntryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isRawAttribute:(const char *)a3
{
  return xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"style")
      || xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"class") != 0;
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class();
}

- (Class)textBodyClass
{
  return (Class)objc_opt_class();
}

- (id)currentTableReader
{
  [(PFXHtmlReaderState *)self drawableReaderForCurrentMediaStateWithStackEntry:[(PFXXmlStreamReaderState *)self ancestorEntryWithElementName:"table"]];
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (BOOL)isWidgetEntry:(id)a3
{
  LODWORD(v4) = xmlStrEqual((const xmlChar *)[a3 xmlElementName], (const xmlChar *)"object");
  if (v4)
  {
    v4 = (const xmlChar *)[a3 xmlValueForAttribute:"type"];
    if (v4) {
      LOBYTE(v4) = xmlStrEqual(v4, (const xmlChar *)PFXCommonApubWidgetMimeType[0]) != 0;
    }
  }
  return (char)v4;
}

- (BOOL)isInsideWidget
{
  p_mContextStack = &self->super.mContextStack;
  int64_t v3 = (char *)self->super.mContextStack.var0 - (char *)self->super.mContextStack.__begin_;
  if ((unint64_t)v3 >= 9)
  {
    for (uint64_t i = (v3 >> 3) - 2; i != -1; --i)
    {
      id v6 = p_mContextStack->__begin_[i];
      if (xmlStrEqual((const xmlChar *)[(__end_ *)v6 xmlElementName], (const xmlChar *)"p")) {
        break;
      }
      if ([(PFXHtmlReaderState *)self isWidgetEntry:v6]) {
        return 1;
      }
    }
  }
  return 0;
}

- (id)readerForCurrentMediaStateWithStackEntry:(id)a3
{
  return [a3 reader];
}

- (id)drawableReaderForCurrentMediaStateWithStackEntry:(id)a3
{
  objc_opt_class();
  [(PFXHtmlReaderState *)self readerForCurrentMediaStateWithStackEntry:a3];

  return (id)TSUDynamicCast();
}

@end