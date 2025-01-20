@interface ICTextFindingResult
- (BOOL)isAttachmentResult;
- (_NSRange)range;
- (id)framesForHighlightInTextView:(id)a3;
- (int64_t)compare:(id)a3;
- (void)scrollToVisibleInTextView:(id)a3;
- (void)selectInTextView:(id)a3;
- (void)setAttachmentResult:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation ICTextFindingResult

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICTextFindingResult *)self range];
  unint64_t v6 = [v4 range];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 != v6;
  }
}

- (id)framesForHighlightInTextView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [(ICTextFindingResult *)self range];
  uint64_t v8 = v7;
  [v4 textContainerInset];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    id v17 = [v4 textLayoutManager];
    v18 = objc_msgSend(v17, "ic_textRangeForRange:", v6, v8);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke;
    v30[3] = &unk_2640BB8F8;
    uint64_t v32 = v10;
    uint64_t v33 = v12;
    uint64_t v34 = v14;
    uint64_t v35 = v16;
    id v31 = v5;
    [v17 enumerateTextSegmentsInRange:v18 type:0 options:1 usingBlock:v30];
  }
  else
  {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICTextFindingResult framesForHighlightInTextView:]" simulateCrash:1 showAlert:0 format:@"Unsupported use of TextKit1."];
    v19 = [v4 layoutManager];
    objc_msgSend(v19, "ensureLayoutForGlyphRange:", 0, v6 + v8);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_2;
    v21[3] = &unk_2640BB948;
    uint64_t v24 = v6;
    uint64_t v25 = v8;
    v22 = v19;
    uint64_t v26 = v10;
    uint64_t v27 = v12;
    uint64_t v28 = v14;
    uint64_t v29 = v16;
    id v23 = v5;
    id v17 = v19;
    objc_msgSend(v17, "enumerateLineFragmentsForGlyphRange:usingBlock:", v6, v8, v21);

    v18 = v22;
  }

  return v5;
}

uint64_t __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke(uint64_t a1, double a2, double a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", a2 + *(double *)(a1 + 48), a3 + *(double *)(a1 + 40));
  [v3 addObject:v4];

  return 1;
}

void __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger v7 = *(void *)(a1 + 48);
  NSUInteger v8 = *(void *)(a1 + 56);
  id v9 = a2;
  v17.location = a3;
  v17.length = a4;
  v18.location = v7;
  v18.length = v8;
  NSRange v10 = NSIntersectionRange(v17, v18);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 64);
  long long v16 = v11;
  v13[2] = __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_3;
  v13[3] = &unk_2640BB920;
  uint64_t v12 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  objc_msgSend(v12, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v10.location, v10.length, v10.location, v10.length, v9, v13);
}

void __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_3(uint64_t a1, double a2, double a3)
{
  objc_msgSend(MEMORY[0x263F08D40], "ic_valueWithRect:", a2 + *(double *)(a1 + 48), a3 + *(double *)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (void)selectInTextView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ICTextFindingResult *)self range];
  objc_msgSend(v6, "setSelectedRange:", v4, v5);
}

- (void)scrollToVisibleInTextView:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ICTextFindingResult *)self isAttachmentResult])
  {
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = -[ICTextFindingResult framesForHighlightInTextView:](self, "framesForHighlightInTextView:", v4, 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "ic_rectValue");
          v28.origin.double x = v14;
          v28.origin.double y = v15;
          v28.size.double width = v16;
          v28.size.double height = v17;
          v26.origin.double x = x;
          v26.origin.double y = y;
          v26.size.double width = width;
          v26.size.double height = height;
          CGRect v27 = CGRectUnion(v26, v28);
          double x = v27.origin.x;
          double y = v27.origin.y;
          double width = v27.size.width;
          double height = v27.size.height;
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    objc_msgSend(v4, "ic_scrollRectToVisible:animated:completionHandler:", 1, 0, x, y, width, height);
  }
  else
  {
    uint64_t v18 = [(ICTextFindingResult *)self range];
    objc_msgSend(v4, "scrollRangeToVisible:", v18, v19);
  }
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (BOOL)isAttachmentResult
{
  return self->_attachmentResult;
}

- (void)setAttachmentResult:(BOOL)a3
{
  self->_attachmentResult = a3;
}

@end