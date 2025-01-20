@interface GQDWPLayout
- (id)layoutStyle;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDWPLayout

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPLayout;
  [(GQDWPBlockList *)&v3 dealloc];
}

- (id)layoutStyle
{
  return self->mLayoutStyle;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"style", *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    v7 = AttributeNs;
    id v8 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "topObjectOfClass:", objc_opt_class()), "stylesheet");
    v9 = (GQDSStyle *)[v8 styleWithIdentifier:v7];
    self->mLayoutStyle = v9;
    if (!v9)
    {
      v9 = (GQDSStyle *)[v8 styleWithXmlUid:v7];
      self->mLayoutStyle = v9;
    }
    v10 = v9;
    xmlFree(v7);
  }
  return 1;
}

@end