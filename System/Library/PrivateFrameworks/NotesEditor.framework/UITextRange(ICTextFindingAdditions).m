@interface UITextRange(ICTextFindingAdditions)
- (id)_ic_textFindingResult;
- (uint64_t)ic_compare:()ICTextFindingAdditions inTextView:;
- (void)_ic_setTextFindingResult:()ICTextFindingAdditions;
@end

@implementation UITextRange(ICTextFindingAdditions)

- (id)_ic_textFindingResult
{
  return objc_getAssociatedObject(a1, &ICTextFindingResultIdentifier);
}

- (void)_ic_setTextFindingResult:()ICTextFindingAdditions
{
}

- (uint64_t)ic_compare:()ICTextFindingAdditions inTextView:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "_ic_textFindingResult");
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v6, "_ic_textFindingResult"),
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = objc_msgSend(a1, "_ic_textFindingResult");
    v12 = objc_msgSend(v6, "_ic_textFindingResult");
    uint64_t v13 = [v11 compare:v12];
  }
  else
  {
    v14 = objc_msgSend(a1, "_ic_textFindingResult");
    if (v14)
    {
      v15 = objc_msgSend(a1, "_ic_textFindingResult");
      unint64_t v16 = [v15 range];
      unint64_t v18 = v17;
    }
    else
    {
      unint64_t v16 = objc_msgSend(v7, "ic_characterRangeFromTextRange:", a1);
      unint64_t v18 = v19;
    }

    v20 = objc_msgSend(v6, "_ic_textFindingResult");
    if (v20)
    {
      v21 = objc_msgSend(v6, "_ic_textFindingResult");
      unint64_t v22 = [v21 range];
      unint64_t v24 = v23;
    }
    else
    {
      unint64_t v22 = objc_msgSend(v7, "ic_characterRangeFromTextRange:", v6);
      unint64_t v24 = v25;
    }

    if (v16 >= v22)
    {
      if (v16 != v22)
      {
        uint64_t v13 = 1;
        goto LABEL_16;
      }
      if (v18 >= v24)
      {
        uint64_t v13 = v18 != v24;
        goto LABEL_16;
      }
    }
    uint64_t v13 = -1;
  }
LABEL_16:

  return v13;
}

@end