@interface ICTable(NSTextTableAdditions)
- (id)attributedStringWithNSTextTablesForColumns:()NSTextTableAdditions rows:context:forPrinting:;
- (id)p_attributedStringForCell:()NSTextTableAdditions inTable:atColumn:row:shouldFilter:context:;
- (uint64_t)attributedStringWithNSTextTablesForColumns:()NSTextTableAdditions rows:context:;
@end

@implementation ICTable(NSTextTableAdditions)

- (uint64_t)attributedStringWithNSTextTablesForColumns:()NSTextTableAdditions rows:context:
{
  return [a1 attributedStringWithNSTextTablesForColumns:a3 rows:a4 context:a5 forPrinting:0];
}

- (id)attributedStringWithNSTextTablesForColumns:()NSTextTableAdditions rows:context:forPrinting:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4FB08C8]);
  if (v10) {
    uint64_t v15 = [v10 count];
  }
  else {
    uint64_t v15 = [a1 columnCount];
  }
  [v14 setNumberOfColumns:v15];
  [v14 setCollapsesBorders:1];
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "columnCount"));
  }
  v17 = v16;
  if (v11) {
    id v18 = v11;
  }
  else {
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "rowCount"));
  }
  v19 = v18;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke;
  v29 = &unk_1E5FDDE80;
  v30 = a1;
  id v31 = v17;
  id v32 = v12;
  id v33 = v13;
  id v34 = v14;
  char v35 = a6;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  id v23 = v17;
  [v19 enumerateIndexesUsingBlock:&v26];
  v24 = objc_msgSend(v21, "copy", v26, v27, v28, v29, v30);

  return v24;
}

- (id)p_attributedStringForCell:()NSTextTableAdditions inTable:atColumn:row:shouldFilter:context:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  id v14 = (objc_class *)MEMORY[0x1E4FB08D0];
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[[v14 alloc] initWithTable:v15 startingRow:a6 rowSpan:1 startingColumn:a5 columnSpan:1];

  [v17 setWidth:0 type:0 forLayer:1.0];
  id v18 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v17 setBorderColor:v18];

  [v17 setWidth:0 type:-1 forLayer:0 edge:5.0];
  [v17 setWidth:0 type:-1 forLayer:2 edge:5.0];
  [v17 setWidth:0 type:-1 forLayer:1 edge:1.0];
  [v17 setWidth:0 type:-1 forLayer:3 edge:1.0];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\r"];
  id v20 = objc_alloc_init(ICTextController);
  [(ICTTTextController *)v20 setDisableSingleLineA:1];
  [(ICTTTextController *)v20 setKeepNSTextTableAttributes:1];
  if (a7)
  {
    id v21 = +[ICTTTextStorage standardizedAttributedStringFromAttributedString:v16 withStyler:v20 fixAttachments:1 translateICTTFont:1 context:v13];

    id v22 = (void *)[v21 mutableCopy];
  }
  else
  {
    id v22 = (void *)[v16 mutableCopy];

    -[ICTTTextController styleFontInAttributedString:inRange:contentSizeCategory:](v20, "styleFontInAttributedString:inRange:contentSizeCategory:", v22, 0, [v22 length], 0);
  }
  if ((unint64_t)[v22 length] >= 2)
  {
    id v23 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v24 = [v22 string];
    int v25 = objc_msgSend(v23, "characterIsMember:", objc_msgSend(v24, "characterAtIndex:", 0));

    if (v25) {
      [v22 insertAttributedString:v19 atIndex:0];
    }
  }
  [v22 appendAttributedString:v19];
  v29[0] = v17;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  objc_msgSend(v22, "ic_addTextBlocks:range:", v26, 0, objc_msgSend(v22, "length"));

  uint64_t v27 = (void *)[v22 copy];
  return v27;
}

@end