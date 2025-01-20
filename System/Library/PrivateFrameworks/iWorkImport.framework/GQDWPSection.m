@interface GQDWPSection
- (__CFArray)children;
- (id)style;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDWPSection

- (void)dealloc
{
  mChildren = self->mChildren;
  if (mChildren) {
    CFRelease(mChildren);
  }

  v4.receiver = self;
  v4.super_class = (Class)GQDWPSection;
  [(GQDWPSection *)&v4 dealloc];
}

- (__CFArray)children
{
  return self->mChildren;
}

- (id)style
{
  return self->mStyle;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"style", *(const xmlChar **)(qword_A35E8 + 16));
  if (!AttributeNs) {
    return 1;
  }
  v7 = AttributeNs;
  id v8 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "topObjectOfClass:", objc_opt_class()), "stylesheet");
  v9 = (GQDSStyle *)[v8 styleWithIdentifier:v7];
  self->mStyle = v9;
  if (!v9)
  {
    v9 = (GQDSStyle *)[v8 styleWithXmlUid:v7];
    self->mStyle = v9;
  }
  if (v9) {
    int v10 = 1;
  }
  else {
    int v10 = 3;
  }
  v11 = v9;
  xmlFree(v7);
  return v10;
}

@end