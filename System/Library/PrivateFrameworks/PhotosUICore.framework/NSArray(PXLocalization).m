@interface NSArray(PXLocalization)
- (__CFString)px_localizedComposedStringThatFitsWidth:()PXLocalization maxCount:useUndefinedMoreCount:withMeasuringBlock:;
- (__CFString)px_localizedComposedStringWithCount:()PXLocalization useUndefinedMoreCount:;
- (uint64_t)px_localizedComposedStringThatFitsWidth:()PXLocalization withMeasuringBlock:;
@end

@implementation NSArray(PXLocalization)

- (__CFString)px_localizedComposedStringThatFitsWidth:()PXLocalization maxCount:useUndefinedMoreCount:withMeasuringBlock:
{
  v10 = a6;
  unint64_t v11 = [a1 count];
  if (v11)
  {
    if (v11 == 1)
    {
      v12 = [a1 objectAtIndex:0];
    }
    else
    {
      if (v11 >= a4) {
        unint64_t v13 = a4;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
      if (v14 < 1)
      {
        v12 = 0;
      }
      else
      {
        v12 = 0;
        uint64_t v15 = 1;
        uint64_t v16 = 1;
        do
        {
          while (1)
          {
            v17 = v12;
            uint64_t v18 = v16 + v14;
            if (v16 + v14 < 0 != __OFADD__(v16, v14)) {
              ++v18;
            }
            uint64_t v19 = v18 >> 1;
            objc_msgSend(a1, "px_localizedComposedStringWithCount:useUndefinedMoreCount:", v18 >> 1, a5);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

            double v20 = v10[2](v10, v12);
            if (v20 >= a2 + -60.0) {
              break;
            }
            uint64_t v16 = v19 + 1;
            uint64_t v15 = v19;
            if (v14 <= v19) {
              goto LABEL_22;
            }
          }
          if (v20 <= a2) {
            goto LABEL_22;
          }
          uint64_t v14 = v19 - 1;
        }
        while (v19 > v16);
        uint64_t v21 = objc_msgSend(a1, "px_localizedComposedStringWithCount:useUndefinedMoreCount:", v15, a5);

        v12 = (__CFString *)v21;
      }
    }
  }
  else
  {
    v12 = &stru_1F00B0030;
  }
LABEL_22:

  return v12;
}

- (uint64_t)px_localizedComposedStringThatFitsWidth:()PXLocalization withMeasuringBlock:
{
  return objc_msgSend(a1, "px_localizedComposedStringThatFitsWidth:maxCount:useUndefinedMoreCount:withMeasuringBlock:", -1, 0, a3);
}

- (__CFString)px_localizedComposedStringWithCount:()PXLocalization useUndefinedMoreCount:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a1 count];
  if (v7)
  {
    unint64_t v8 = v7;
    if (v7 == 1)
    {
      v9 = [a1 objectAtIndex:0];
    }
    else
    {
      int v30 = a4;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = a1;
      uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v9 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v33;
LABEL_7:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
          uint64_t v16 = v12 + v14;
          unint64_t v17 = v12 + v14 + 1;
          if (v12 + v14)
          {
            if (v16 == 1 && v17 >= v8) {
              uint64_t v18 = @"LIST_END_SEPARATOR_FORMAT_1";
            }
            else {
              uint64_t v18 = v16 < 2 || v17 < v8 ? @"LIST_MID_SEPARATOR_FORMAT" : @"LIST_END_SEPARATOR_FORMAT_N";
            }
            uint64_t v21 = PXLocalizedStringFromTable(v18, @"PhotosUICore");
            v28 = v15;
            PXStringWithValidatedFormat();
            id v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F28E78] stringWithCapacity:20 * v8];

            id v20 = v15;
            v9 = (__CFString *)v19;
          }
          -[__CFString appendString:](v9, "appendString:", v20, v28);

          if (v17 >= a3) {
            break;
          }
          if (v11 == ++v14)
          {
            v12 += v14;
            uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v11) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
      else
      {
        v9 = 0;
      }

      unint64_t v22 = v8 - a3;
      if ((uint64_t)(v8 - a3) >= 1)
      {
        if (v30)
        {
          v23 = PXLocalizedStringFromTable(@"LIST_END_AND_MORE_FORMAT", @"PhotosUICore");
          [(__CFString *)v9 appendString:v23];
        }
        else
        {
          v24 = @"LIST_END_N_AND_MORE_FORMAT";
          if (a3 == 1) {
            v24 = @"LIST_END_1_AND_MORE_FORMAT";
          }
          v25 = v24;
          v23 = PXLocalizedStringFromTable(v25, @"PhotosUICore");
          unint64_t v29 = v22;
          v26 = PXStringWithValidatedFormat();
          -[__CFString appendString:](v9, "appendString:", v26, v29);
        }
      }
    }
  }
  else
  {
    v9 = &stru_1F00B0030;
  }
  return v9;
}

@end