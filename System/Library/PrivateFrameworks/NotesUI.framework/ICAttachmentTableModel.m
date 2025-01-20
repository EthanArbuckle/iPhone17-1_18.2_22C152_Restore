@interface ICAttachmentTableModel
@end

@implementation ICAttachmentTableModel

uint64_t __67__ICAttachmentTableModel_UI__redactAuthorAttributionsToCurrentUser__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a2;
  v9 = [v7 now];
  v10 = objc_msgSend(v9, "ic_truncated");

  v11 = [v8 attributedString];

  v12 = (void *)[v11 mutableCopy];
  uint64_t v13 = *MEMORY[0x1E4F83238];
  v14 = NSNumber;
  [v10 timeIntervalSince1970];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  uint64_t v16 = objc_msgSend(v12, "ic_range");
  objc_msgSend(v12, "addAttribute:value:range:", v13, v15, v16, v17);

  v18 = [*(id *)(a1 + 32) table];
  [v18 setAttributedString:v12 columnIndex:a3 rowIndex:a4];

  return 0;
}

void __40__ICAttachmentTableModel_UI__htmlString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) appendString:@"<tr>"];
  v5 = [*(id *)(a1 + 40) table];
  v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ICAttachmentTableModel_UI__htmlString__block_invoke_2;
  v7[3] = &unk_1E5FD99B0;
  id v8 = *(id *)(a1 + 32);
  [v5 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:v6 copyItems:0 usingBlock:v7];

  [*(id *)(a1 + 32) appendString:@"</tr>\n"];
}

id __40__ICAttachmentTableModel_UI__htmlString__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) appendString:@"<td valign=\"top\" style=\"border-style: solid; border-width: 1.0px 1.0px 1.0px 1.0px; border-color: #ccc; padding: 3.0px 5.0px 3.0px 5.0px; min-width: 70px\">"];
  if ([v3 length])
  {
    v4 = [v3 attributedString];
    v5 = (void *)[v4 mutableCopy];

    uint64_t v6 = *MEMORY[0x1E4F83238];
    uint64_t v7 = objc_msgSend(v5, "ic_range");
    objc_msgSend(v5, "removeAttribute:range:", v6, v7, v8);
    v9 = [MEMORY[0x1E4F83418] htmlStringFromAttributedString:v5 attachmentConversionHandler:0];
    [*(id *)(a1 + 32) appendString:v9];
  }
  else
  {
    [*(id *)(a1 + 32) appendString:@"<br>"];
  }
  [*(id *)(a1 + 32) appendString:@"</td>"];
  return v3;
}

void __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  if (*(unsigned char *)(a1 + 112)) {
    uint64_t v7 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v7 = 0;
  }
  v26[3] = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_2;
  v15[3] = &unk_1E5FD9A00;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  char v24 = *(unsigned char *)(a1 + 112);
  id v16 = v9;
  v20 = v26;
  id v17 = *(id *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v18 = v10;
  uint64_t v19 = v11;
  char v25 = *(unsigned char *)(a1 + 113);
  long long v21 = *(_OWORD *)(a1 + 72);
  uint64_t v22 = *(void *)(a1 + 64);
  long long v23 = *(_OWORD *)(a1 + 88);
  [v8 enumerateColumnsWithBlock:v15];
  if (*(unsigned char *)(a1 + 113))
  {
    v12 = *(CGContext **)(a1 + 104);
    if (*(unsigned char *)(a1 + 112))
    {
      CGContextMoveToPoint(v12, *(CGFloat *)(a1 + 88), *(CGFloat *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      double v13 = *(double *)(a1 + 88) - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    else
    {
      CGContextMoveToPoint(v12, 0.0, *(CGFloat *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      double v13 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    CGContextAddLineToPoint(*(CGContextRef *)(a1 + 104), v13, *(CGFloat *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 104), (CGColorRef)[*(id *)(a1 + 56) CGColor]);
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 104), 1.0);
    CGContextStrokePath(*(CGContextRef *)(a1 + 104));
  }
  double v14 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v14 < 16.0) {
    double v14 = 16.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v14
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) > *(double *)(a1 + 96)) {
    *a4 = 1;
  }

  _Block_object_dispose(v26, 8);
}

void __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 widthOfColumn:v7];
  double v9 = v8;
  if (*(unsigned char *)(a1 + 112)) {
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
  }
                                                                            + 24)
                                                                - v8;
  id v10 = [*(id *)(a1 + 40) stringForColumnID:v7 rowID:*(void *)(a1 + 48)];

  uint64_t v11 = [*(id *)(a1 + 56) attachment];
  v12 = [v11 managedObjectContext];
  objc_msgSend(v10, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", v12, 0);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  if ([v30 length])
  {
    double v13 = [ICTTTextStorage alloc];
    double v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [(ICTTTextStorage *)v13 initWithData:0 replicaID:v14];

    [(ICTTTextStorage *)v15 setWantsUndoCommands:0];
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v15, "replaceCharactersInRange:withAttributedString:", 0, 0, v30);
    uint64_t v16 = *MEMORY[0x1E4F83248];
    uint64_t v17 = [(ICTTTextStorage *)v15 ic_range];
    -[ICTTTextStorage removeAttribute:range:](v15, "removeAttribute:range:", v16, v17, v18);
    uint64_t v19 = [*(id *)(a1 + 32) styler];
    [(ICTTTextStorage *)v15 setStyler:v19];

    v20 = [*(id *)(a1 + 32) styler];
    objc_msgSend(v20, "styleText:inExactRange:fixModelAttributes:", v15, 0, -[ICTTTextStorage length](v15, "length"), 1);

    -[ICTTTextStorage boundingRectWithSize:options:context:](v15, "boundingRectWithSize:options:context:", 1, 0, v9 + 5.0 * -2.0, 1.79769313e308);
    double v24 = v23;
    if (*(unsigned char *)(a1 + 113))
    {
      double v25 = v9 + 5.0 * -2.0;
      CGRect v32 = CGRectOffset(*(CGRect *)&v21, *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 5.0, *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 5.0);
      -[ICTTTextStorage drawInRect:](v15, "drawInRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    }
    uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
    double v27 = *(double *)(v26 + 24);
    if (v27 < v24 + 5.0 + 4.0) {
      double v27 = v24 + 5.0 + 4.0;
    }
    *(double *)(v26 + 24) = v27;
  }
  *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                          + 24);
  uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
  double v29 = *(double *)(v28 + 24);
  if (*(unsigned char *)(a1 + 112))
  {
    if (v29 >= 0.0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *(double *)(v28 + 24) = v9 + v29;
  if (*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) > *(double *)(a1 + 96)) {
LABEL_11:
  }
    *a4 = 1;
LABEL_12:
}

void __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(CGContext **)(a1 + 56);
  CGFloat v7 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v8 = a2;
  CGContextMoveToPoint(v6, v7, 0.0);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 56), *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  LODWORD(v6) = *(unsigned __int8 *)(a1 + 80);
  [*(id *)(a1 + 32) widthOfColumn:v8];
  double v10 = v9;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  double v12 = *(double *)(v11 + 24);
  if (v6)
  {
    *(double *)(v11 + 24) = v12 - v10;
    if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0.0) {
      return;
    }
  }
  else
  {
    *(double *)(v11 + 24) = v10 + v12;
    if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= *(double *)(a1 + 64)) {
      return;
    }
  }
  *a4 = 1;
}

@end