@interface ICAttachmentTableModel(UI)
- (CGFloat)previewInAvailableSize:()UI shouldDraw:;
- (__CFString)attributesForSharingHTMLWithTagName:()UI textContent:;
- (id)activityItems;
- (id)htmlString;
- (uint64_t)canConvertToHTMLForSharing;
- (uint64_t)quicklookPreviewItems;
- (void)drawPreviewInRect:()UI;
- (void)redactAuthorAttributionsToCurrentUser;
@end

@implementation ICAttachmentTableModel(UI)

- (void)redactAuthorAttributionsToCurrentUser
{
  if ([a1 isMergeableDataDirty]) {
    [a1 writeMergeableData];
  }
  id v2 = objc_alloc(MEMORY[0x1E4F83518]);
  v3 = [a1 attachment];
  v4 = [v3 mergeableData];
  v5 = [a1 currentReplicaID];
  v6 = (void *)[v2 initWithData:v4 replicaID:v5];

  v7 = [v6 table];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__ICAttachmentTableModel_UI__redactAuthorAttributionsToCurrentUser__block_invoke;
  v10[3] = &unk_1E5FD99B0;
  id v11 = v6;
  id v8 = v6;
  [v7 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v10];

  v9 = [v8 serialize];
  [a1 mergeWithMergeableData:v9];

  [a1 writeMergeableData];
}

- (id)htmlString
{
  id v2 = [a1 table];
  int v3 = [v2 isRightToLeft];
  v4 = @"ltr";
  if (v3) {
    v4 = @"rtl";
  }
  v5 = v4;

  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<table cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse; direction: %@\">\n<tbody>\n",
  v6 = v5);

  v7 = [a1 table];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__ICAttachmentTableModel_UI__htmlString__block_invoke;
  v11[3] = &unk_1E5FD99D8;
  id v8 = v6;
  id v12 = v8;
  v13 = a1;
  [v7 enumerateRowsWithBlock:v11];

  [v8 appendString:@"</tbody>\n</table>"];
  id v9 = v8;

  return v9;
}

- (uint64_t)canConvertToHTMLForSharing
{
  return 1;
}

- (__CFString)attributesForSharingHTMLWithTagName:()UI textContent:
{
  id v5 = [a1 htmlString];
  *a4 = v5;

  return &stru_1F0973378;
}

- (uint64_t)quicklookPreviewItems
{
  return MEMORY[0x1E4F1CBF0];
}

- (id)activityItems
{
  id v2 = [ICTableLinkPresentationActivityItemSource alloc];
  int v3 = [a1 attachment];
  v4 = [(ICTableLinkPresentationActivityItemSource *)v2 initWithAttachment:v3];

  id v5 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v4];
  v6 = [ICAttachmentTableActivityItemSource alloc];
  v7 = [a1 attachment];
  id v8 = [(ICAttachmentActivityItemSource *)v6 initWithAttachment:v7];

  id v9 = [v5 arrayByAddingObject:v8];

  v10 = [ICAttachmentActivityItemSource alloc];
  id v11 = [a1 attachment];
  id v12 = [(ICAttachmentActivityItemSource *)v10 initWithAttachment:v11];
  v13 = [v9 arrayByAddingObject:v12];

  return v13;
}

- (void)drawPreviewInRect:()UI
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, a2, a3);
  objc_msgSend(a1, "previewInAvailableSize:shouldDraw:", 1, a4, a5);
  CGContextRestoreGState(CurrentContext);
}

- (CGFloat)previewInAvailableSize:()UI shouldDraw:
{
  id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "ic_systemGray4Color");
  v10 = objc_alloc_init(ICConstantAvailableTableWidthProvider);
  [(ICConstantAvailableTableWidthProvider *)v10 setAvailableWidth:a2];
  id v11 = [ICTableColumnWidthManager alloc];
  id v12 = [a1 table];
  v13 = [(ICTableColumnWidthManager *)v11 initWithTable:v12 delegate:v10];

  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v59 = 0;
  v60 = (CGFloat *)&v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  uint64_t v55 = 0;
  v56 = (double *)&v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  v15 = [a1 table];
  int v16 = [v15 isRightToLeft];

  v17 = [a1 table];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke;
  v41[3] = &unk_1E5FD9A28;
  v46 = &v55;
  char v52 = v16;
  CGFloat v49 = a2;
  double v50 = a3;
  id v18 = v17;
  id v42 = v18;
  v19 = v13;
  v43 = v19;
  v44 = a1;
  char v53 = a5;
  v47 = &v59;
  v48 = v54;
  v51 = CurrentContext;
  id v20 = v9;
  id v45 = v20;
  [v18 enumerateRowsWithBlock:v41];
  if (a5)
  {
    uint64_t v37 = 0;
    v38 = (CGFloat *)&v37;
    double v21 = 0.0;
    if (v16) {
      double v21 = a2;
    }
    uint64_t v39 = 0x2020000000;
    double v40 = v21;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_3;
    v29 = &unk_1E5FD9A50;
    v31 = &v37;
    v32 = &v59;
    v33 = CurrentContext;
    char v36 = v16;
    v30 = v19;
    CGFloat v34 = a2;
    double v35 = a3;
    [v18 enumerateColumnsWithBlock:&v26];
    CGContextMoveToPoint(CurrentContext, v38[3], 0.0);
    CGContextAddLineToPoint(CurrentContext, v38[3], v60[3]);
    CGFloat v22 = v60[3];
    if (v16)
    {
      CGContextMoveToPoint(CurrentContext, a2, v22);
      double v23 = a2 - v56[3];
    }
    else
    {
      CGContextMoveToPoint(CurrentContext, 0.0, v22);
      double v23 = v56[3];
    }
    CGContextAddLineToPoint(CurrentContext, v23, v60[3]);
    id v24 = v20;
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor", v26, v27, v28, v29));
    CGContextSetLineWidth(CurrentContext, 1.0);
    CGContextStrokePath(CurrentContext);

    _Block_object_dispose(&v37, 8);
  }
  if (v56[3] < a2) {
    a2 = v56[3];
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

  return a2;
}

@end