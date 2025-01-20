@interface GQPStyleReader
+ (void)initialize;
- (BOOL)beginProperty:(const char *)a3;
- (GQPStyleReader)initWithStyleType:(int)a3;
- (id)createStyle;
- (int)beginReadingFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (int)doneReading:(id)a3;
- (void)dealloc;
- (void)doneProperty;
- (void)handleBoolValue:(BOOL)a3;
- (void)handleDoubleValue:(double)a3;
- (void)handleFloatValue:(float)a3;
- (void)handleIntValue:(int)a3;
- (void)handleObject:(id)a3;
@end

@implementation GQPStyleReader

+ (void)initialize
{
}

- (GQPStyleReader)initWithStyleType:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GQPStyleReader;
  v4 = [(GQPStyleReader *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mStyleType = a3;
    v4->mEntries = CFArrayCreateMutable(0, 0, (const CFArrayCallBacks *)&unk_84B68);
    v5->mCurrentProperty = 0;
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->mEntries);

  mIdentifier = self->mIdentifier;
  if (mIdentifier) {
    xmlFree(mIdentifier);
  }
  mUid = self->mUid;
  if (mUid) {
    xmlFree(mUid);
  }
  mParentIdentifier = self->mParentIdentifier;
  if (mParentIdentifier) {
    xmlFree(mParentIdentifier);
  }
  v6.receiver = self;
  v6.super_class = (Class)GQPStyleReader;
  [(GQPStyleReader *)&v6 dealloc];
}

- (int)beginReadingFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  objc_super v7 = (GQDSStylesheet *)objc_msgSend(objc_msgSend(a4, "documentState"), "topObjectOfClass:", objc_opt_class());
  self->mStylesheet = v7;
  v8 = v7;
  AttributeNs = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)off_9D308, *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs) {
    self->mIdentifier = AttributeNs;
  }
  self->mParentIdentifier = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)off_9D310, *(const xmlChar **)(qword_A35E8 + 16));
  self->mUid = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16));
  if (!objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "root"), "includeStyleWithIdentifier:parentIdentifier:uid:", self->mIdentifier, self->mParentIdentifier, self->mUid))
  {
    sub_381F4((uint64_t)qword_A2A18, a3, a4);
  }
  objc_msgSend(objc_msgSend(a4, "documentState"), "pushObject:", self);
  v10 = objc_alloc_init(GQDSStyle);
  self->mStyle = v10;
  mIdentifier = self->mIdentifier;
  if (mIdentifier)
  {
    self->mStyleIsIdentified = 1;
    mParentIdentifier = self->mParentIdentifier;
    if (mParentIdentifier)
    {
      self->mStyleIdentiferEqualsParentIdentifier = xmlStrEqual((const xmlChar *)mIdentifier, (const xmlChar *)mParentIdentifier) != 0;
      mStyle = self->mStyle;
      mIdentifier = self->mIdentifier;
    }
    else
    {
      mStyle = v10;
    }
    [(GQDSStylesheet *)self->mStylesheet addStyle:mStyle withOwnedIdentifier:mIdentifier];
    self->mIdentifier = 0;
  }
  if (self->mUid)
  {
    if (-[GQDSStylesheet addStyle:withOwnedXmlUid:](self->mStylesheet, "addStyle:withOwnedXmlUid:", self->mStyle)) {
      int result = 1;
    }
    else {
      int result = 3;
    }
  }
  else
  {
    int result = 1;
  }
  self->mUid = 0;
  return result;
}

- (int)doneReading:(id)a3
{
  id v4 = [(GQPStyleReader *)self createStyle];

  objc_msgSend(objc_msgSend(a3, "documentState"), "pushObject:", v4);
  return 1;
}

- (void)handleObject:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = 0;
  }
  else {
    id v5 = a3;
  }
  objc_super v6 = sub_FF1C(self->mCurrentProperty, v5);
  CFArrayAppendValue(self->mEntries, v6);
  self->mCurrentProperty = 0;
}

- (id)createStyle
{
  if (self->mParentIdentifier && !self->mStyleIdentiferEqualsParentIdentifier) {
    id v3 = -[GQDSStylesheet styleWithIdentifier:](self->mStylesheet, "styleWithIdentifier:");
  }
  else {
    id v3 = 0;
  }
  id v4 = sub_10014(self->mEntries);
  [(GQDSStyle *)self->mStyle setParent:v3];
  [(GQDSStyle *)self->mStyle setPropertyMap:v4];
  if (!v3)
  {
    mParentIdentifier = self->mParentIdentifier;
    if (mParentIdentifier) {
      [(GQDSStylesheet *)self->mStylesheet addStyle:self->mStyle needingParentResolution:mParentIdentifier resolveInParent:self->mStyleIdentiferEqualsParentIdentifier];
    }
  }
  return self->mStyle;
}

- (BOOL)beginProperty:(const char *)a3
{
  int v4 = +[GQDSStyleProperties propertyFromString:a3];
  if (v4) {
    self->mCurrentProperty = v4;
  }
  return v4 != 0;
}

- (void)doneProperty
{
  if (self->mCurrentProperty)
  {
    id v3 = +[GQDSStyle defaultMapForStyleType:self->mStyleType];
    if (v3)
    {
      int v4 = sub_10684((uint64_t)v3, self->mCurrentProperty);
      if (v4) {
        CFArrayAppendValue(self->mEntries, v4);
      }
    }
    self->mCurrentProperty = 0;
  }
}

- (void)handleBoolValue:(BOOL)a3
{
  int v4 = sub_FE0C(self->mCurrentProperty, a3);
  CFArrayAppendValue(self->mEntries, v4);
  self->mCurrentProperty = 0;
}

- (void)handleIntValue:(int)a3
{
  int v4 = sub_FE0C(self->mCurrentProperty, a3);
  CFArrayAppendValue(self->mEntries, v4);
  self->mCurrentProperty = 0;
}

- (void)handleFloatValue:(float)a3
{
  int v4 = sub_FE68(self->mCurrentProperty, a3);
  CFArrayAppendValue(self->mEntries, v4);
  self->mCurrentProperty = 0;
}

- (void)handleDoubleValue:(double)a3
{
  int v4 = sub_FEC0(self->mCurrentProperty, a3);
  CFArrayAppendValue(self->mEntries, v4);
  self->mCurrentProperty = 0;
}

@end