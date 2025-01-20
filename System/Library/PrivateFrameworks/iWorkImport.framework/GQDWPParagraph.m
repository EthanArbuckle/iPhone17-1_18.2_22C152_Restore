@interface GQDWPParagraph
- (BOOL)cont;
- (BOOL)isBlank;
- (BOOL)isHidden;
- (BOOL)restartList;
- (id)paragraphStyle;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (int64_t)listLevel;
- (void)dealloc;
@end

@implementation GQDWPParagraph

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPParagraph;
  [(GQDWPTextList *)&v3 dealloc];
}

- (id)paragraphStyle
{
  return self->mParaStyle;
}

- (int64_t)listLevel
{
  return self->mListLevel;
}

- (BOOL)restartList
{
  return self->mRestartList;
}

- (BOOL)cont
{
  return self->mContinue;
}

- (BOOL)isBlank
{
  int Count = CFArrayGetCount(self->super.super.mChildren);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    CFIndex v4 = 0;
    BOOL v5 = 0;
    CFIndex v6 = Count;
    uint64_t v7 = Count;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->super.super.mChildren, v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![ValueAtIndex isBlank]) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![ValueAtIndex isBlank]) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      BOOL v5 = ++v4 >= v6;
    }
    while (v7 != v4);
  }
  return v5;
}

- (BOOL)isHidden
{
  return self->mIsHidden;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  self->mListLevel = sub_42F04(a3, qword_A35E8, (xmlChar *)"list-level", 0);
  self->mRestartList = sub_42DCC(a3, qword_A35E8, (xmlChar *)"restart-list", 0);
  self->mContinue = sub_42DCC(a3, qword_A35E8, (xmlChar *)"cont", 0);
  self->mIsHidden = sub_42DCC(a3, qword_A35E8, (xmlChar *)"outline-hidden", 0);
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"style", *(const xmlChar **)(qword_A35E8 + 16));
  if (!AttributeNs) {
    return 1;
  }
  v8 = AttributeNs;
  id v9 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "topObjectOfClass:", objc_opt_class()), "stylesheet");
  if (!v9) {
    id v9 = objc_msgSend(objc_msgSend(a4, "documentState"), "stylesheet");
  }
  v10 = (GQDSStyle *)[v9 styleWithIdentifier:v8];
  self->mParaStyle = v10;
  if (!v10)
  {
    v10 = (GQDSStyle *)[v9 styleWithXmlUid:v8];
    self->mParaStyle = v10;
  }
  if (v10) {
    int v11 = 1;
  }
  else {
    int v11 = 3;
  }
  v12 = v10;
  xmlFree(v8);
  return v11;
}

@end