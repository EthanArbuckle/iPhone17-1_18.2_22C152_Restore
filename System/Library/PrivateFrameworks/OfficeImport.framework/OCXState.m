@interface OCXState
- (CXNamespace)OCXDrawingNamespace;
- (CXNamespace)OCXRelationshipsNamespace;
- (OCXState)init;
- (id)OCXCommentAuthorsRelationshipType;
- (id)OCXCommentsExtendedRelationshipType;
- (id)OCXCommentsRelationshipType;
- (id)OCXCustomXmlRelationshipType;
- (id)OCXDrawingRelationshipType;
- (id)OCXEndnotesRelationshipType;
- (id)OCXFontTableRelationshipType;
- (id)OCXFootnotesRelationshipType;
- (id)OCXLegacyDocTextInfoRelationshipType;
- (id)OCXNotesMasterRelationshipType;
- (id)OCXNotesSlideRelationshipType;
- (id)OCXNumberingRelationshipType;
- (id)OCXPackagePresPropsRelationshipType;
- (id)OCXPackageViewPropsRelationshipType;
- (id)OCXPivotTableRelationshipType;
- (id)OCXSettingsRelationshipType;
- (id)OCXSharedStringsRelationshipType;
- (id)OCXSlideLayoutRelationshipType;
- (id)OCXSlideMasterRelationshipType;
- (id)OCXSlideRelationshipType;
- (id)OCXStylesRelationshipType;
- (id)OCXTableRelationshipType;
- (id)OCXTableStylesRelationshipType;
- (id)OCXThemeOverrideRelationshipType;
- (id)OCXThemeRelationshipType;
- (id)OCXVmlDrawingRelationshipType;
- (int)xmlFormat;
- (void)setOCXDrawingNamespace:(id)a3;
- (void)setOCXRelationshipsNamespace:(id)a3;
- (void)setXmlFormat:(int)a3;
- (void)setupNSForXMLFormat:(int)a3;
@end

@implementation OCXState

- (OCXState)init
{
  v5.receiver = self;
  v5.super_class = (Class)OCXState;
  v2 = [(OCXState *)&v5 init];
  v3 = v2;
  if (v2) {
    [(OCXState *)v2 setupNSForXMLFormat:0];
  }
  return v3;
}

- (void)setupNSForXMLFormat:(int)a3
{
  if (a3)
  {
    self->mXMLFormat = 1;
    v4 = [CXNamespace alloc];
    objc_super v5 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    v6 = [(CXNamespace *)v4 initWithUri:"http://purl.oclc.org/ooxml/officeDocument/relationships" fallbackNamespace:v5];
    [(OCXState *)self setOCXRelationshipsNamespace:v6];
  }
  else
  {
    self->mXMLFormat = 0;
    objc_super v5 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    [(OCXState *)self setOCXRelationshipsNamespace:v5];
  }

  uint64_t v7 = OCXDrawingNamespace;
  [(OCXState *)self setOCXDrawingNamespace:v7];
}

- (id)OCXStylesRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipStyles;
  }
  else {
    v2 = (id *)&OCXRelationshipStyles;
  }
  return *v2;
}

- (id)OCXSharedStringsRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipSharedStrings;
  }
  else {
    v2 = (id *)&OCXRelationshipSharedStrings;
  }
  return *v2;
}

- (id)OCXDrawingRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipDrawing;
  }
  else {
    v2 = (id *)&OCXRelationshipDrawing;
  }
  return *v2;
}

- (id)OCXEndnotesRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipEndnotes;
  }
  else {
    v2 = (id *)&OCXRelationshipEndnotes;
  }
  return *v2;
}

- (id)OCXFontTableRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipFontTable;
  }
  else {
    v2 = (id *)&OCXRelationshipFontTable;
  }
  return *v2;
}

- (id)OCXFootnotesRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipFootnotes;
  }
  else {
    v2 = (id *)&OCXRelationshipFootnotes;
  }
  return *v2;
}

- (id)OCXCommentsRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipComments;
  }
  else {
    v2 = (id *)&OCXRelationshipComments;
  }
  return *v2;
}

- (id)OCXCommentsExtendedRelationshipType
{
  return @"http://schemas.microsoft.com/office/2011/relationships/commentsExtended";
}

- (id)OCXPivotTableRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipPivotTable;
  }
  else {
    v2 = (id *)&OCXRelationshipPivotTable;
  }
  return *v2;
}

- (id)OCXTableRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipTable;
  }
  else {
    v2 = (id *)&OCXRelationshipTable;
  }
  return *v2;
}

- (id)OCXSlideMasterRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipSlideMaster;
  }
  else {
    v2 = (id *)&OCXRelationshipSlideMaster;
  }
  return *v2;
}

- (id)OCXSlideLayoutRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipSlideLayout;
  }
  else {
    v2 = (id *)&OCXRelationshipSlideLayout;
  }
  return *v2;
}

- (id)OCXSlideRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipSlide;
  }
  else {
    v2 = (id *)&OCXRelationshipSlide;
  }
  return *v2;
}

- (id)OCXNotesSlideRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipNotesSlide;
  }
  else {
    v2 = (id *)&OCXRelationshipNotesSlide;
  }
  return *v2;
}

- (id)OCXCommentAuthorsRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipCommentAuthors;
  }
  else {
    v2 = (id *)&OCXRelationshipCommentAuthors;
  }
  return *v2;
}

- (id)OCXCustomXmlRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipCustomXML;
  }
  else {
    v2 = (id *)&OCXRelationshipCustomXML;
  }
  return *v2;
}

- (id)OCXLegacyDocTextInfoRelationshipType
{
  return @"http://schemas.microsoft.com/office/2006/relationships/legacyDocTextInfo";
}

- (id)OCXThemeRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipTheme;
  }
  else {
    v2 = (id *)&OCXRelationshipTheme;
  }
  return *v2;
}

- (id)OCXThemeOverrideRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipThemeOverride;
  }
  else {
    v2 = (id *)&OCXRelationshipThemeOverride;
  }
  return *v2;
}

- (id)OCXVmlDrawingRelationshipType
{
  return @"http://schemas.openxmlformats.org/officeDocument/2006/relationships/vmlDrawing";
}

- (id)OCXNotesMasterRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipNotesMaster;
  }
  else {
    v2 = (id *)&OCXRelationshipNotesMaster;
  }
  return *v2;
}

- (id)OCXNumberingRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipNumbering;
  }
  else {
    v2 = (id *)&OCXRelationshipNumbering;
  }
  return *v2;
}

- (id)OCXPackagePresPropsRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipPackagePresProps;
  }
  else {
    v2 = (id *)&OCXRelationshipPackagePresProps;
  }
  return *v2;
}

- (id)OCXPackageViewPropsRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipPackageViewProps;
  }
  else {
    v2 = (id *)&OCXRelationshipPackageViewProps;
  }
  return *v2;
}

- (id)OCXTableStylesRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipTableStyles;
  }
  else {
    v2 = (id *)&OCXRelationshipTableStyles;
  }
  return *v2;
}

- (id)OCXSettingsRelationshipType
{
  if (self->mXMLFormat == 1) {
    v2 = (id *)&OCXStrictRelationshipSettings;
  }
  else {
    v2 = (id *)&OCXRelationshipSettings;
  }
  return *v2;
}

- (int)xmlFormat
{
  return self->mXMLFormat;
}

- (CXNamespace)OCXRelationshipsNamespace
{
  return self->mOCXRelationshipsNamespace;
}

- (void)setOCXRelationshipsNamespace:(id)a3
{
}

- (CXNamespace)OCXDrawingNamespace
{
  return self->mOCXDrawingNamespace;
}

- (void)setOCXDrawingNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOCXDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mOCXRelationshipsNamespace, 0);
}

- (void)setXmlFormat:(int)a3
{
  self->mXMLFormat = a3;
}

@end