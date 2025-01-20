@interface OCDDocument
- (BOOL)isFromBinaryFile;
- (NSMutableArray)charts;
- (OADBlipCollection)blips;
- (OADGraphicStyleCache)graphicStyleCache;
- (OADTableStyleCollection)tableStyles;
- (OADTextListStyle)defaultTextStyle;
- (OCDDocument)init;
- (OCDReader)reader;
- (OCDSummary)summary;
- (OCDWriter)writer;
- (OITSUPointerKeyDictionary)dualDrawableMap;
- (id)bulletBlips;
- (id)encryptionInfo;
- (id)theme;
- (void)setEncryptionInfo:(id)a3;
- (void)setGraphicStyleCache:(id)a3;
- (void)setReader:(id)a3;
- (void)setTheme:(id)a3;
- (void)setWriter:(id)a3;
@end

@implementation OCDDocument

- (OCDDocument)init
{
  v18.receiver = self;
  v18.super_class = (Class)OCDDocument;
  v2 = [(OCDDocument *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(OCDSummary);
    mSummary = v2->mSummary;
    v2->mSummary = v3;

    v5 = objc_alloc_init(OADBlipCollection);
    mBlips = v2->mBlips;
    v2->mBlips = v5;

    v7 = [[OADTextListStyle alloc] initWithDefaults];
    mDefaultTextStyle = v2->mDefaultTextStyle;
    v2->mDefaultTextStyle = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mCharts = v2->mCharts;
    v2->mCharts = v9;

    v11 = objc_alloc_init(OADTableStyleCollection);
    mTableStyles = v2->mTableStyles;
    v2->mTableStyles = v11;

    v13 = objc_alloc_init(OITSUPointerKeyDictionary);
    mDualDrawableMap = v2->mDualDrawableMap;
    v2->mDualDrawableMap = v13;

    v15 = objc_alloc_init(OADTheme);
    mDocumentTheme = v2->mDocumentTheme;
    v2->mDocumentTheme = v15;
  }
  return v2;
}

- (void)setGraphicStyleCache:(id)a3
{
}

- (void)setReader:(id)a3
{
}

- (OADTextListStyle)defaultTextStyle
{
  return self->mDefaultTextStyle;
}

- (OADBlipCollection)blips
{
  return self->mBlips;
}

- (OADGraphicStyleCache)graphicStyleCache
{
  return self->mGraphicStyleCache;
}

- (OCDSummary)summary
{
  return self->mSummary;
}

- (BOOL)isFromBinaryFile
{
  return [(OCDReader *)self->mReader isBinaryReader];
}

- (id)encryptionInfo
{
  return self->mEncryptionInfo;
}

- (void)setEncryptionInfo:(id)a3
{
}

- (id)theme
{
  return self->mDocumentTheme;
}

- (void)setTheme:(id)a3
{
}

- (id)bulletBlips
{
  return 0;
}

- (OCDReader)reader
{
  return self->mReader;
}

- (OCDWriter)writer
{
  return self->mWriter;
}

- (void)setWriter:(id)a3
{
}

- (NSMutableArray)charts
{
  return self->mCharts;
}

- (OADTableStyleCollection)tableStyles
{
  return self->mTableStyles;
}

- (OITSUPointerKeyDictionary)dualDrawableMap
{
  return self->mDualDrawableMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReader, 0);
  objc_storeStrong((id *)&self->mEncryptionInfo, 0);
  objc_storeStrong((id *)&self->mGraphicStyleCache, 0);
  objc_storeStrong((id *)&self->mDefaultTextStyle, 0);
  objc_storeStrong((id *)&self->mDocumentTheme, 0);
  objc_storeStrong((id *)&self->mDualDrawableMap, 0);
  objc_storeStrong((id *)&self->mTableStyles, 0);
  objc_storeStrong((id *)&self->mCharts, 0);
  objc_storeStrong((id *)&self->mBlips, 0);
  objc_storeStrong((id *)&self->mSummary, 0);
  objc_storeStrong((id *)&self->mWriter, 0);
}

@end