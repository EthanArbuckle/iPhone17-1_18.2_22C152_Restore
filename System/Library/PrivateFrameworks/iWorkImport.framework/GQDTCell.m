@interface GQDTCell
- (id)cellStyle;
- (int)readAttributesForBaseCell:(_xmlTextReader *)a3 processor:(id)a4;
- (int)readAttributesForBaseTabularCell:(_xmlTextReader *)a3 processor:(id)a4;
- (int)readBaseAttributesForBaseCell:(_xmlTextReader *)a3 processor:(id)a4;
- (unsigned)columnIndex;
- (unsigned)columnSpan;
- (unsigned)rowIndex;
- (unsigned)rowSpan;
- (void)dealloc;
- (void)incrementColumnSpan;
- (void)setCellStyle:(id)a3;
@end

@implementation GQDTCell

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTCell;
  [(GQDTCell *)&v3 dealloc];
}

- (unsigned)columnIndex
{
  return self->mColumnIndex;
}

- (unsigned)rowIndex
{
  return self->mRowIndex;
}

- (unsigned)columnSpan
{
  return self->mColumnSpan;
}

- (unsigned)rowSpan
{
  return self->mRowSpan;
}

- (id)cellStyle
{
  return self->mStyle;
}

- (void)setCellStyle:(id)a3
{
  id v5 = a3;

  self->mStyle = (GQDSStyle *)a3;
}

- (int)readAttributesForBaseCell:(_xmlTextReader *)a3 processor:(id)a4
{
  self->mColumnIndex = sub_43034(a3, qword_A35E8, (xmlChar *)"col", 0);
  self->mRowIndex = sub_43034(a3, qword_A35E8, (xmlChar *)"row", 0);
  return [(GQDTCell *)self readBaseAttributesForBaseCell:a3 processor:a4];
}

- (int)readAttributesForBaseTabularCell:(_xmlTextReader *)a3 processor:(id)a4
{
  id v7 = [a4 documentState];
  id v8 = [v7 tableState];
  uint64_t v23 = 0;
  if (sub_42F44(a3, qword_A35E8, (xmlChar *)"ct", &v23)) {
    [v8 skipCells:v23 - 1];
  }
  self->unsigned int mRowIndex = (unsigned __int16)[v8 row];
  self->mColumnIndex = (unsigned __int16)[v8 column];
  [v8 incrementCellPosition];
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"s", *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    v10 = AttributeNs;
    id v11 = objc_msgSend(objc_msgSend(v7, "root"), "objectWithXmlUid:", AttributeNs);
    xmlFree(v10);
  }
  else if ([v8 isCounting])
  {
    id v12 = objc_msgSend(objc_msgSend(v8, "table"), "model");
    id v13 = objc_msgSend(objc_msgSend(v8, "table"), "tableStyle");
    unsigned int v14 = [v12 rowCount];
    unsigned int v15 = [v12 headerRowCount];
    unsigned int v16 = [v12 headerColumnCount];
    unsigned int v17 = [v12 footerRowCount];
    unsigned int mRowIndex = self->mRowIndex;
    if (mRowIndex >= v15)
    {
      if (self->mColumnIndex >= v16)
      {
        signed int v21 = v14 - v17;
        v19 = v13;
        if (v21 >= (int)mRowIndex) {
          uint64_t v20 = 84;
        }
        else {
          uint64_t v20 = 87;
        }
      }
      else
      {
        v19 = v13;
        uint64_t v20 = 86;
      }
    }
    else
    {
      v19 = v13;
      uint64_t v20 = 85;
    }
    id v11 = [v19 valueForObjectProperty:v20];
  }
  else
  {
    id v11 = 0;
  }
  [(GQDTCell *)self setCellStyle:v11];
  return [(GQDTCell *)self readBaseAttributesForBaseCell:a3 processor:a4];
}

- (int)readBaseAttributesForBaseCell:(_xmlTextReader *)a3 processor:(id)a4
{
  id v7 = objc_msgSend(objc_msgSend(a4, "documentState"), "tableState");
  self->mColumnSpan = sub_43034(a3, qword_A35E8, (xmlChar *)"col-span", 1);
  self->mRowSpan = sub_43034(a3, qword_A35E8, (xmlChar *)"row-span", 1);
  objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", self, a3);
  id v8 = [v7 currentOverlapCell];
  if (v8)
  {
    v9 = v8;
    self->mColumnIndex = (unsigned __int16)[v8 columnIndex];
    self->mColumnSpan += (unsigned __int16)[v9 columnSpan];
    [v7 setCurrentOverlapCell:0];
  }
  return 1;
}

- (void)incrementColumnSpan
{
}

@end