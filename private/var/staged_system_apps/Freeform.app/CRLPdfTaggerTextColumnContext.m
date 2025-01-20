@interface CRLPdfTaggerTextColumnContext
- (CRLPdfTaggerTextColumnContext)initWithStateOfTagger:(id)a3 column:(id)a4 limitSelection:(id)a5;
- (CRLPdfTaggerTextColumnOwnerContext)textColumnOwner;
- (CRLWPColumn)column;
- (CRLWPParagraphEnumerator)paragraphEnumerator;
- (CRLWPSelection)limitSelection;
- (_NSRange)range;
- (id).cxx_construct;
@end

@implementation CRLPdfTaggerTextColumnContext

- (CRLPdfTaggerTextColumnContext)initWithStateOfTagger:(id)a3 column:(id)a4 limitSelection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v63.receiver = self;
  v63.super_class = (Class)CRLPdfTaggerTextColumnContext;
  v56 = v8;
  v11 = [(CRLPdfTaggerContext *)&v63 initWithStateOfTagger:v8];
  if (!v11) {
    goto LABEL_28;
  }
  v12 = [v8 topOfContextStack];
  objc_storeWeak((id *)&v11->_textColumnOwner, v12);

  id WeakRetained = objc_loadWeakRetained((id *)&v11->_textColumnOwner);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    sub_100477860(0, (uint64_t)"The parent of a column must be a column owner", v15, v16, v17, v18, v19, v20, (uint64_t)v56);
  }
  objc_storeWeak((id *)&v11->_column, v9);
  objc_storeWeak((id *)&v11->_limitSelection, v10);
  unint64_t v21 = (unint64_t)[v9 range];
  p_NSUInteger location = &v11->_range.location;
  v11->_range.NSUInteger location = v21;
  v11->_range.NSUInteger length = v23;
  if (v10)
  {
    id v24 = [v9 range];
    NSUInteger v26 = v25;
    v64.NSUInteger location = (NSUInteger)[v10 superRange];
    NSUInteger location = v64.location;
    NSUInteger length = v64.length;
    v65.NSUInteger location = (NSUInteger)v24;
    v65.NSUInteger length = v26;
    NSRange v29 = NSIntersectionRange(v64, v65);
    if (length)
    {
      NSUInteger v30 = v29.length;
      if (!v29.length)
      {
        unint64_t v31 = 0;
        unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_25;
      }
      NSUInteger location = v29.location;
    }
    else
    {
      unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (location < (unint64_t)v24)
      {
LABEL_12:
        unint64_t v31 = 0;
        goto LABEL_25;
      }
      unint64_t v31 = 0;
      if (location - (unint64_t)v24 >= v26)
      {
LABEL_25:
        unint64_t *p_location = v21;
        v11->_range.NSUInteger length = v31;
        goto LABEL_26;
      }
      NSUInteger v30 = 0;
    }
    unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = (char *)[v9 lineCount];
      v39 = 0;
      if (v38)
      {
        while (1)
        {
          unint64_t v21 = (unint64_t)[v9 rangeOfLineFragmentAtIndex:v39];
          if (location >= v21 && location - v21 < v40) {
            break;
          }
          if (v38 == ++v39)
          {
            unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
            v39 = v38;
            break;
          }
        }
      }
      sub_100477860(v21 != 0x7FFFFFFFFFFFFFFFLL, (uint64_t)"Range start couldn't be found", v32, v33, v34, v35, v36, v37, (uint64_t)v56);
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
      if (v39 < v38)
      {
        NSUInteger v48 = location + v30;
        while (1)
        {
          id v49 = [v9 rangeOfLineFragmentAtIndex:v39];
          uint64_t v47 = (uint64_t)v49 + v50;
          if (v48 <= (unint64_t)v49 + v50) {
            break;
          }
          if (v38 == ++v39)
          {
            uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
            break;
          }
        }
      }
      sub_100477860(v47 != 0x7FFFFFFFFFFFFFFFLL, (uint64_t)"Range end couldn't be found", v41, v42, v43, v44, v45, v46, v57);
      unint64_t v31 = v47 - v21;
      goto LABEL_25;
    }
    goto LABEL_12;
  }
LABEL_26:
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v51 = [v9 storage];
    sub_100189DF8(obj, v51, 0, [v51 paragraphIndexAtCharIndex:*p_location], [v51 paragraphIndexAtCharIndex:v11->_range.length + *p_location], 1);
    objc_storeStrong((id *)&v11->_paragraphEnumerator._storage, obj[0]);
    objc_storeStrong((id *)&v11->_paragraphEnumerator._styleProvider, obj[1]);
    long long v52 = v59;
    long long v53 = v60;
    long long v54 = v61;
    v11->_paragraphEnumerator._currentTextRange.NSUInteger length = v62;
    *(_OWORD *)&v11->_paragraphEnumerator._firstParIndex = v53;
    *(_OWORD *)&v11->_paragraphEnumerator._requireHidden = v54;
    *(_OWORD *)&v11->_paragraphEnumerator._parIndex = v52;
    sub_100189C94(obj);
  }
LABEL_28:

  return v11;
}

- (CRLWPParagraphEnumerator)paragraphEnumerator
{
  return &self->_paragraphEnumerator;
}

- (CRLPdfTaggerTextColumnOwnerContext)textColumnOwner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textColumnOwner);

  return (CRLPdfTaggerTextColumnOwnerContext *)WeakRetained;
}

- (CRLWPColumn)column
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_column);

  return (CRLWPColumn *)WeakRetained;
}

- (CRLWPSelection)limitSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_limitSelection);

  return (CRLWPSelection *)WeakRetained;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_limitSelection);
  objc_destroyWeak((id *)&self->_column);
  objc_destroyWeak((id *)&self->_textColumnOwner);

  sub_100189C94((id *)&self->_paragraphEnumerator._storage);
}

- (id).cxx_construct
{
  return self;
}

@end