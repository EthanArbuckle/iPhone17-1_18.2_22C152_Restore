@interface ICTableTextFindingResult
- (BOOL)ignoreCase;
- (ICAttachment)attachment;
- (ICInlineTextFindingResult)inlineTextFindingResult;
- (ICTableTextFindingResult)init;
- (NSAttributedString)findableString;
- (NSString)queryString;
- (_NSRange)rangeInFindableString;
- (id)framesForHighlightInTextView:(id)a3;
- (id)tableAttachmentViewControllerForTextView:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)column;
- (unint64_t)row;
- (void)selectInTextView:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setColumn:(unint64_t)a3;
- (void)setFindableString:(id)a3;
- (void)setIgnoreCase:(BOOL)a3;
- (void)setInlineTextFindingResult:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setRangeInFindableString:(_NSRange)a3;
- (void)setRow:(unint64_t)a3;
@end

@implementation ICTableTextFindingResult

- (ICTableTextFindingResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableTextFindingResult;
  result = [(ICTableTextFindingResult *)&v3 init];
  if (result)
  {
    result->_row = 0x7FFFFFFFFFFFFFFFLL;
    result->_column = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICTableTextFindingResult;
  int64_t v5 = [(ICTextFindingResult *)&v17 compare:v4];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = [(ICTableTextFindingResult *)self row];
      if (v7 >= [v6 row])
      {
        unint64_t v8 = [(ICTableTextFindingResult *)self row];
        if (v8 > [v6 row])
        {
LABEL_5:
          int64_t v5 = 1;
LABEL_11:

          goto LABEL_12;
        }
        unint64_t v9 = [(ICTableTextFindingResult *)self column];
        if (v9 >= [v6 column])
        {
          unint64_t v10 = [(ICTableTextFindingResult *)self column];
          if (v10 > [v6 column]) {
            goto LABEL_5;
          }
          unint64_t v11 = [(ICTableTextFindingResult *)self rangeInFindableString];
          if (v11 >= [v6 rangeInFindableString])
          {
            uint64_t v13 = [(ICTableTextFindingResult *)self rangeInFindableString];
            if (v13 == [v6 rangeInFindableString])
            {
              int64_t v5 = [(ICTableTextFindingResult *)self inlineTextFindingResult];
              if (v5)
              {
                v14 = [v6 inlineTextFindingResult];

                if (v14)
                {
                  v15 = [(ICTableTextFindingResult *)self inlineTextFindingResult];
                  v16 = [v6 inlineTextFindingResult];
                  int64_t v5 = [v15 compare:v16];
                }
                else
                {
                  int64_t v5 = 0;
                }
              }
              goto LABEL_11;
            }
            goto LABEL_5;
          }
        }
      }
      int64_t v5 = -1;
      goto LABEL_11;
    }
    int64_t v5 = 0;
  }
LABEL_12:

  return v5;
}

- (id)tableAttachmentViewControllerForTextView:(id)a3
{
  id v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    int64_t v5 = [v4 textLayoutManager];

    id v6 = ICDynamicCast();

    objc_opt_class();
    unint64_t v7 = (void *)MEMORY[0x263F5B4D0];
    unint64_t v8 = [(ICTableTextFindingResult *)self attachment];
    unint64_t v9 = [v7 textAttachmentWithAttachment:v8];
    unint64_t v10 = ICDynamicCast();

    unint64_t v11 = [v6 tableViewControllerForAttachment:v10 createIfNeeded:0];
  }
  else
  {
    objc_opt_class();
    v12 = [v4 layoutManager];

    id v6 = ICDynamicCast();

    objc_opt_class();
    uint64_t v13 = (void *)MEMORY[0x263F5B4D0];
    v14 = [(ICTableTextFindingResult *)self attachment];
    v15 = [v13 textAttachmentWithAttachment:v14];
    unint64_t v10 = ICDynamicCast();

    unint64_t v11 = 0;
    if (v6 && v10)
    {
      v16 = [v6 viewControllerForTextAttachment:v10];
      objc_opt_class();
      unint64_t v11 = ICDynamicCast();
    }
  }

  if (!v11)
  {
    objc_super v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ICTableTextFindingResult tableAttachmentViewControllerForTextView:](v17);
    }
  }

  return v11;
}

- (id)framesForHighlightInTextView:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(ICTableTextFindingResult *)self tableAttachmentViewControllerForTextView:v4];
  if (v5)
  {
    uint64_t v6 = [(ICTableTextFindingResult *)self rangeInFindableString];
    uint64_t v8 = v7;
    unint64_t v9 = [(ICTableTextFindingResult *)self findableString];
    unint64_t v10 = objc_msgSend(v5, "viewForRange:inFindableString:", v6, v8, v9);
    unint64_t v11 = [(ICTableTextFindingResult *)self inlineTextFindingResult];

    if (v11)
    {
      v12 = [(ICTableTextFindingResult *)self inlineTextFindingResult];
      uint64_t v13 = [v12 framesForHighlightInTextView:v10];
    }
    else if (v6 + v8 <= (unint64_t)objc_msgSend(v9, "length", v9))
    {
      uint64_t v13 = objc_msgSend(v5, "rectsForRange:inFindableString:", v6, v8, v9);
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263EFFA68];
    }
    v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v58 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v21 = [(ICTableTextFindingResult *)self attachment];
          uint64_t v22 = [v21 rangeInNote];
          objc_msgSend(v4, "ic_rectForRange:", v22, v23);
          CGFloat v25 = v24;
          CGFloat v27 = v26;

          objc_msgSend(v20, "ic_rectValue");
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          v36 = [v5 view];
          objc_msgSend(v10, "convertRect:toCoordinateSpace:", v36, v29, v31, v33, v35);
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          CGFloat v42 = v41;
          CGFloat v44 = v43;

          v64.origin.CGFloat x = v38;
          v64.origin.CGFloat y = v40;
          v64.size.CGFloat width = v42;
          v64.size.CGFloat height = v44;
          CGRect v65 = CGRectOffset(v64, v25, v27);
          CGFloat x = v65.origin.x;
          CGFloat y = v65.origin.y;
          CGFloat width = v65.size.width;
          CGFloat height = v65.size.height;
          [v4 textContainerInset];
          CGFloat v50 = v49;
          [v4 textContainerInset];
          CGFloat v52 = v51;
          v66.origin.CGFloat x = x;
          v66.origin.CGFloat y = y;
          v66.size.CGFloat width = width;
          v66.size.CGFloat height = height;
          CGRect v67 = CGRectOffset(v66, v50, v52);
          v53 = objc_msgSend(MEMORY[0x263F08D40], "ic_valueWithRect:", v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
          [v15 addObject:v53];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v17);
    }

    v14 = (void *)[v15 copy];
  }
  else
  {
    v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (void)selectInTextView:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICTableTextFindingResult *)self tableAttachmentViewControllerForTextView:v4];
  uint64_t v6 = [v5 table];
  uint64_t v7 = objc_msgSend(v6, "identifierForColumnAtIndex:", -[ICTableTextFindingResult column](self, "column"));
  uint64_t v8 = objc_msgSend(v6, "identifierForRowAtIndex:", -[ICTableTextFindingResult row](self, "row"));
  if (v7)
  {
    unint64_t v9 = [v5 textViewManager];
    unint64_t v10 = [v9 textViewForColumn:v7];

    unint64_t v11 = [v10 columnTextStorage];
    uint64_t v12 = [v11 characterRangeForRowID:v8];

    uint64_t v13 = [(ICTableTextFindingResult *)self rangeInFindableString] + v12;
    [(ICTableTextFindingResult *)self rangeInFindableString];
    objc_msgSend(v10, "setSelectedRange:", v13, v14);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICTableTextFindingResult;
    [(ICTextFindingResult *)&v15 selectInTextView:v4];
  }
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  return (ICAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
}

- (NSAttributedString)findableString
{
  return self->_findableString;
}

- (void)setFindableString:(id)a3
{
}

- (_NSRange)rangeInFindableString
{
  p_rangeInFindableString = &self->_rangeInFindableString;
  NSUInteger location = self->_rangeInFindableString.location;
  NSUInteger length = p_rangeInFindableString->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeInFindableString:(_NSRange)a3
{
  self->_rangeInFindableString = a3;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (unint64_t)column
{
  return self->_column;
}

- (void)setColumn:(unint64_t)a3
{
  self->_column = a3;
}

- (BOOL)ignoreCase
{
  return self->_ignoreCase;
}

- (void)setIgnoreCase:(BOOL)a3
{
  self->_ignoreCase = a3;
}

- (ICInlineTextFindingResult)inlineTextFindingResult
{
  return self->_inlineTextFindingResult;
}

- (void)setInlineTextFindingResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineTextFindingResult, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_findableString, 0);

  objc_destroyWeak((id *)&self->_attachment);
}

- (void)tableAttachmentViewControllerForTextView:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Table attachment view controller not found for finding result", v1, 2u);
}

@end