@interface AEBookInfoSnapshot
+ (id)aeBookInfoSnapshotFromBookInfo:(id)a3 ordinal:(unint64_t)a4;
- (BEProtocolCacheItem)cacheItem;
- (BOOL)hasBuiltInFonts;
- (BOOL)isFixedLayout;
- (BOOL)obeyPageBreaks;
- (BOOL)respectImageSizeClassIsPrefix;
- (BOOL)shouldAllowRemoteInspection;
- (BOOL)shouldDisableOptimizeSpeed;
- (CGSize)fixedLayoutSize;
- (NSNumber)fixedLayoutHeight;
- (NSNumber)fixedLayoutWidth;
- (NSNumber)spineIndexInPackage;
- (NSString)assetID;
- (NSString)bookLanguage;
- (NSString)manifestId;
- (NSString)respectImageSizeClass;
- (NSURL)url;
- (int)bkPageProgressionDirection;
- (void)setAssetID:(id)a3;
- (void)setBkPageProgressionDirection:(int)a3;
- (void)setBookLanguage:(id)a3;
- (void)setCacheItem:(id)a3;
- (void)setFixedLayoutHeight:(id)a3;
- (void)setFixedLayoutWidth:(id)a3;
- (void)setHasBuiltInFonts:(BOOL)a3;
- (void)setIsFixedLayout:(BOOL)a3;
- (void)setManifestId:(id)a3;
- (void)setObeyPageBreaks:(BOOL)a3;
- (void)setRespectImageSizeClass:(id)a3;
- (void)setRespectImageSizeClassIsPrefix:(BOOL)a3;
- (void)setShouldAllowRemoteInspection:(BOOL)a3;
- (void)setShouldDisableOptimizeSpeed:(BOOL)a3;
- (void)setSpineIndexInPackage:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation AEBookInfoSnapshot

+ (id)aeBookInfoSnapshotFromBookInfo:(id)a3 ordinal:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [v5 cacheItem];
  [v6 setCacheItem:v7];

  [v6 setBkPageProgressionDirection:[v5 bkPageProgressionDirection]];
  [v6 setIsFixedLayout:[v5 isFixedLayout]];
  [v6 setObeyPageBreaks:[v5 obeyPageBreaks]];
  objc_msgSend(v6, "setShouldAllowRemoteInspection:", objc_msgSend(v5, "shouldAllowRemoteInspection"));
  v8 = [v5 respectImageSizeClass];
  [v6 setRespectImageSizeClass:v8];

  [v6 setRespectImageSizeClassIsPrefix:[v5 respectImageSizeClassIsPrefix]];
  [v6 setHasBuiltInFonts:[v5 hasBuiltInFonts]];
  [v6 setShouldDisableOptimizeSpeed:[v5 shouldDisableOptimizeSpeed]];
  v9 = [v5 bookLanguage];
  [v6 setBookLanguage:v9];

  v10 = [v5 assetID];
  [v6 setAssetID:v10];

  v11 = [v5 spineIndexInPackage];
  [v6 setSpineIndexInPackage:v11];

  v12 = [v5 documentWithOrdinal:a4];
  if (!v12)
  {
    v12 = [v5 documentWithOrdinal:0];
  }
  v13 = [v12 manifestId];
  [v6 setManifestId:v13];

  v14 = [v5 urlForDocument:v12];
  [v6 setUrl:v14];

  v15 = [v12 fixedLayoutWidth];
  [v6 setFixedLayoutWidth:v15];

  v16 = [v12 fixedLayoutHeight];
  [v6 setFixedLayoutHeight:v16];

  return v6;
}

- (CGSize)fixedLayoutSize
{
  v3 = [(AEBookInfoSnapshot *)self fixedLayoutWidth];
  [v3 doubleValue];
  double v5 = v4;
  v6 = [(AEBookInfoSnapshot *)self fixedLayoutHeight];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
}

- (int)bkPageProgressionDirection
{
  return self->_bkPageProgressionDirection;
}

- (void)setBkPageProgressionDirection:(int)a3
{
  self->_bkPageProgressionDirection = a3;
}

- (BOOL)isFixedLayout
{
  return self->_isFixedLayout;
}

- (void)setIsFixedLayout:(BOOL)a3
{
  self->_isFixedLayout = a3;
}

- (NSNumber)fixedLayoutWidth
{
  return self->_fixedLayoutWidth;
}

- (void)setFixedLayoutWidth:(id)a3
{
}

- (NSNumber)fixedLayoutHeight
{
  return self->_fixedLayoutHeight;
}

- (void)setFixedLayoutHeight:(id)a3
{
}

- (BOOL)obeyPageBreaks
{
  return self->_obeyPageBreaks;
}

- (void)setObeyPageBreaks:(BOOL)a3
{
  self->_obeyPageBreaks = a3;
}

- (BOOL)shouldAllowRemoteInspection
{
  return self->_shouldAllowRemoteInspection;
}

- (void)setShouldAllowRemoteInspection:(BOOL)a3
{
  self->_shouldAllowRemoteInspection = a3;
}

- (BOOL)respectImageSizeClassIsPrefix
{
  return self->_respectImageSizeClassIsPrefix;
}

- (void)setRespectImageSizeClassIsPrefix:(BOOL)a3
{
  self->_respectImageSizeClassIsPrefix = a3;
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->_shouldDisableOptimizeSpeed;
}

- (void)setShouldDisableOptimizeSpeed:(BOOL)a3
{
  self->_shouldDisableOptimizeSpeed = a3;
}

- (NSString)respectImageSizeClass
{
  return self->_respectImageSizeClass;
}

- (void)setRespectImageSizeClass:(id)a3
{
}

- (BOOL)hasBuiltInFonts
{
  return self->_hasBuiltInFonts;
}

- (void)setHasBuiltInFonts:(BOOL)a3
{
  self->_hasBuiltInFonts = a3;
}

- (NSString)bookLanguage
{
  return self->_bookLanguage;
}

- (void)setBookLanguage:(id)a3
{
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)manifestId
{
  return self->_manifestId;
}

- (void)setManifestId:(id)a3
{
}

- (NSNumber)spineIndexInPackage
{
  return self->_spineIndexInPackage;
}

- (void)setSpineIndexInPackage:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_spineIndexInPackage, 0);
  objc_storeStrong((id *)&self->_manifestId, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_bookLanguage, 0);
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);
  objc_storeStrong((id *)&self->_fixedLayoutHeight, 0);
  objc_storeStrong((id *)&self->_fixedLayoutWidth, 0);

  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end