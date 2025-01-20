@interface UISearchBarFieldEditor
@end

@implementation UISearchBarFieldEditor

uint64_t __41___UISearchBarFieldEditor_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyCorrectTextContainerSize];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateTokenViews];
}

void __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 _textLayoutController];
  uint64_t v6 = [v5 characterRangeForTextRange:*(void *)(a1 + 40) clippedToDocument:1];
  uint64_t v8 = v7;

  uint64_t v9 = *(void *)off_1E52D1F50;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke_2;
  v11[3] = &unk_1E52DEB90;
  uint64_t v15 = v6;
  uint64_t v16 = v8;
  v10 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v10;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v9, v6, v8, 0, v11);
}

void __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v68 = a3 + a4;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v67 = *(void *)(a1 + 72) + v8;
  id v9 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 _viewProvider];
    if (v10
      || ([*(id *)(a1 + 32) _textLayoutController],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 ensureLayoutForRange:*(void *)(a1 + 40)],
          v11,
          [v9 _viewProvider],
          (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v12 = a3 == v8;
      id v13 = [v10 view];
      [*(id *)(a1 + 48) addObject:v13];
      id v14 = *(void **)(a1 + 32);
      [v13 selectionBounds];
      objc_msgSend(v14, "convertRect:fromView:", v13);
      uint64_t v15 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(void *)(a1 + 32));
      uint64_t v16 = +[UIKeyboardInputModeController sharedInputModeController];
      v17 = [v16 currentInputMode];
      objc_msgSend(v15, "setWritingDirection:", objc_msgSend(v17, "isDefaultRightToLeft"));

      [v15 setContainsStart:v12];
      [v15 setContainsEnd:v68 == v67];
      [v15 _setDrawsOwnHighlight:1];
      [*(id *)(a1 + 56) addObject:v15];

      goto LABEL_29;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v58 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
        goto LABEL_34;
      }
      v59 = [v9 token];
      *(_DWORD *)buf = 138412290;
      v76 = v59;
      _os_log_fault_impl(&dword_1853B0000, v58, OS_LOG_TYPE_FAULT, "UIKit problem. Missing viewProvider for search token: %@", buf, 0xCu);
    }
    else
    {
      v57 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category) + 8);
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v58 = v57;
      v59 = [v9 token];
      *(_DWORD *)buf = 138412290;
      v76 = v59;
      _os_log_impl(&dword_1853B0000, v58, OS_LOG_TYPE_ERROR, "UIKit problem. Missing viewProvider for search token: %@", buf, 0xCu);
    }

LABEL_34:
    goto LABEL_29;
  }
  id v63 = v9;
  v18 = *(void **)(a1 + 32);
  v19 = [v18 beginningOfDocument];
  uint64_t v20 = [v18 positionFromPosition:v19 offset:a3];

  v61 = [*(id *)(a1 + 32) positionFromPosition:v20 offset:a4];
  v62 = (void *)v20;
  uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v20);
  v73.receiver = *(id *)(a1 + 32);
  v73.super_class = (Class)_UISearchBarFieldEditor;
  v60 = (void *)v21;
  v22 = objc_msgSendSuper2(&v73, sel_selectionRectsForRange_);
  v65 = [MEMORY[0x1E4F1CA48] array];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v22;
  uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v70 != v25) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        [v27 rect];
        double Width = CGRectGetWidth(v78);
        if ((a3 == v8 || ![v27 containsStart] || Width != 0.0)
          && (v68 == v67 || ![v27 containsEnd] || Width != 0.0))
        {
          [v27 rect];
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;
          if ([*(id *)(a1 + 48) count])
          {
            v37 = [*(id *)(a1 + 48) firstObject];
            v38 = [*(id *)(a1 + 32) textInputView];
            [v37 bounds];
            objc_msgSend(v38, "convertRect:fromView:", v37);
            CGFloat recta = v32;
            CGFloat v39 = v34;
            CGFloat v40 = v30;
            CGFloat v42 = v41;
            CGFloat v44 = v43;
            CGFloat v46 = v45;
            CGFloat v48 = v47;

            v79.origin.x = v42;
            v79.origin.y = v44;
            v79.size.width = v46;
            v79.size.height = v48;
            double MinY = CGRectGetMinY(v79);
            v80.origin.x = v40;
            v80.origin.y = recta;
            v80.size.width = v39;
            v80.size.height = v36;
            double v50 = CGRectGetMinY(v80);
            if (MinY >= v50) {
              double v51 = v50;
            }
            else {
              double v51 = MinY;
            }
            v81.origin.x = v42;
            double v30 = v40;
            double v34 = v39;
            double v32 = v51;
            v81.origin.y = v44;
            v81.size.width = v46;
            v81.size.height = v48;
            double Height = CGRectGetHeight(v81);
            v82.origin.x = v30;
            v82.origin.y = v32;
            v82.size.width = v34;
            v82.size.height = v36;
            double v53 = CGRectGetHeight(v82);
            if (Height >= v53) {
              double v36 = Height;
            }
            else {
              double v36 = v53;
            }
          }
          v54 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(void *)(a1 + 32), v30, v32, v34, v36);
          v55 = +[UIKeyboardInputModeController sharedInputModeController];
          v56 = [v55 currentInputMode];
          objc_msgSend(v54, "setWritingDirection:", objc_msgSend(v56, "isDefaultRightToLeft"));

          objc_msgSend(v54, "setContainsStart:", objc_msgSend(v27, "containsStart"));
          objc_msgSend(v54, "setContainsEnd:", objc_msgSend(v27, "containsEnd"));
          [v65 addObject:v54];
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v24);
  }

  [*(id *)(a1 + 56) addObjectsFromArray:v65];
  id v9 = v63;
LABEL_29:
}

@end