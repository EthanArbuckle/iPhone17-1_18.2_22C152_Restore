@interface PXVisualDiagnosticsTableRow
@end

@implementation PXVisualDiagnosticsTableRow

void __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  v19.origin.double x = a3;
  v19.origin.double y = a4;
  v19.size.double width = a5;
  v19.size.double height = a6;
  CGRect v20 = CGRectInset(v19, 1.0, 1.0);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke_2;
  v16[3] = &unk_26545ABC8;
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  objc_msgSend(v11, "drawTextInRect:configuration:", v16, x, y, width, height);
}

void __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setText:v3];
  [v4 setFontSize:*(double *)(a1 + 40)];
  objc_msgSend(v4, "setRelativePosition:", 0.0, 0.5);
}

@end