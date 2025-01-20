@interface ICTK2TextController
- (void)setNote:(id)a3 firstVisibleLocation:(unint64_t)a4;
- (void)updateAttachmentsSelectionStateInTextStorage:(id)a3 forSelectedRanges:(id)a4 textView:(id)a5;
- (void)updateHighlightsInRange:(_NSRange)a3 inTextStorage:(id)a4;
@end

@implementation ICTK2TextController

- (void)updateHighlightsInRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(ICTextController *)self authorHighlightsController];
  objc_msgSend(v8, "performHighlightUpdatesForRange:inTextStorage:updates:", location, length, v7, 0);
}

- (void)setNote:(id)a3 firstVisibleLocation:(unint64_t)a4
{
  id v5 = a3;
  [(ICTextController *)self setNote:v5];
  id v6 = [v5 textStorage];

  [v6 setStyler:self];
  [v6 setWantsUndoCommands:0];
  [(ICTextController *)self refreshTextStylingForTextStorage:v6 withTextController:self];
  [v6 setWantsUndoCommands:1];
}

- (void)updateAttachmentsSelectionStateInTextStorage:(id)a3 forSelectedRanges:(id)a4 textView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FB06B8];
  id v10 = a3;
  uint64_t v11 = objc_msgSend(v10, "ic_range");
  uint64_t v13 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke;
  v16[3] = &unk_1E5FDA0A8;
  id v17 = v7;
  id v18 = v8;
  id v14 = v8;
  id v15 = v7;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, v11, v13, 0, v16);
}

void __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke_2;
    v20[3] = &__block_descriptor_48_e24_B32__0__NSValue_8Q16_B24l;
    v20[4] = a3;
    v20[5] = a4;
    uint64_t v9 = objc_msgSend(v8, "ic_containsObjectPassingTest:", v20);
    id v10 = [*(id *)(a1 + 40) textLayoutManager];
    objc_opt_class();
    uint64_t v11 = ICDynamicCast();
    uint64_t v12 = [v11 viewIdentifier];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v10 existingAttachmentViewForIdentifier:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        [v13 setSelected:v9];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_12;
    }
    if ([MEMORY[0x1E4F83738] deviceIsMac])
    {
      id v14 = [v7 fileType];
      if ([v14 isEqualToString:*MEMORY[0x1E4F83090]])
      {

LABEL_12:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [v10 existingAttachmentViewForIdentifier:v12];
        }
        else
        {
          id v18 = objc_msgSend(*(id *)(a1 + 40), "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v7, a3, 0);
          id v17 = [v18 view];
        }
        double v19 = 1.0;
        if (v9) {
          double v19 = 0.5;
        }
        objc_msgSend(v17, "ic_setAlpha:", v19);

        goto LABEL_18;
      }
      id v15 = [v7 fileType];
      int v16 = [v15 isEqualToString:*MEMORY[0x1E4F83060]];

      if (v16) {
        goto LABEL_12;
      }
    }
LABEL_18:
  }
}

BOOL __95__ICTK2TextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_textView___block_invoke_2(NSRange *a1, void *a2)
{
  v5.NSUInteger location = [a2 rangeValue];
  v5.NSUInteger length = v3;
  return NSIntersectionRange(a1[32], v5).length != 0;
}

@end