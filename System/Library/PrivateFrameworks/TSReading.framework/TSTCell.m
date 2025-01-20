@interface TSTCell
+ (id)cell;
- (BOOL)isCellContentsEqualToCell:(id)a3;
- (TSTCell)init;
- (TSTCell)initWithCell:(id)a3;
- (TSTCell)initWithStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)inflateFromStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4;
- (void)inflateFromStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4 suppressingFormulaInflation:(BOOL)a5;
- (void)writeToStorageRef:(TSTCellStorage *)a3;
@end

@implementation TSTCell

+ (id)cell
{
  v2 = objc_alloc_init(TSTCell);

  return v2;
}

- (TSTCell)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSTCell;
  result = [(TSTCell *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->mPrivate = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mBaseFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mMultipleChoiceListFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mControlFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCustomFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mDurationFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mDateFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mNumberFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCurrencyFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData = 0u;
    *($76458E206EE951DA8EFCFE88747349CE *)((char *)&result->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct
                                         + 24) = 0u;
    *(_OWORD *)&result->mPrivate.mCommentStorage = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType = 0u;
    *(_OWORD *)&result->mPrivate.mTextStyle = 0u;
    *(_OWORD *)&result->mPrivate.mRichTextPayload = 0u;
    *($82AF1FAED7C1313D7653AE9686A01569 *)((char *)&result->mPrivate.mValue + 8) = 0u;
    *(_OWORD *)&result->mPrivate.mCellStyle = 0u;
    result->mPrivate.mStrokePresetNumber = -1;
  }
  return result;
}

- (TSTCell)initWithCell:(id)a3
{
  v4 = [(TSTCell *)self init];
  if (v4) {
    TSTCellCopy((uint64_t)a3, (uint64_t)v4);
  }
  return v4;
}

- (TSTCell)initWithStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4
{
  v6 = [(TSTCell *)self init];
  v7 = v6;
  if (v6) {
    [(TSTCell *)v6 inflateFromStorageRef:a3 dataStore:a4];
  }
  return v7;
}

- (void)dealloc
{
  double v3 = TSTCellClear((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)TSTCell;
  [(TSTCell *)&v4 dealloc];
}

- (void)inflateFromStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4
{
}

- (void)inflateFromStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4 suppressingFormulaInflation:(BOOL)a5
{
}

- (void)writeToStorageRef:(TSTCellStorage *)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[TSTCell allocWithZone:a3];

  return [(TSTCell *)v4 initWithCell:self];
}

- (BOOL)isCellContentsEqualToCell:(id)a3
{
  if (self)
  {
    int v5 = *((unsigned __int8 *)&self->mPrivate + 1);
    if (a3)
    {
LABEL_3:
      int v6 = *((unsigned __int8 *)a3 + 9);
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  int v6 = 0;
LABEL_6:
  if (v5 != v6) {
    return 0;
  }
  if (!self)
  {
LABEL_9:
    v8 = &TSUInvalidFormat;
    p_mCurrentCellFormat = &self->mPrivate.mCellFormats.mCurrentCellFormat;
    if (!self) {
      p_mCurrentCellFormat = ($F03D4CA5AAEDD23196D77D4402B24C2D *)&TSUInvalidFormat;
    }
    long long v10 = *(_OWORD *)&p_mCurrentCellFormat->var0.mMultipleChoiceListFormatStruct.mData;
    v56[0] = *(_OWORD *)&p_mCurrentCellFormat->mFormatType;
    v56[1] = v10;
    uint64_t v57 = *((void *)&p_mCurrentCellFormat->var0.mMultipleChoiceListFormatStruct + 3);
    if (a3) {
      v8 = (long long *)((char *)a3 + 104);
    }
    long long v11 = v8[1];
    v54[0] = *v8;
    v54[1] = v11;
    uint64_t v55 = *((void *)v8 + 4);
    v12 = v56;
    v13 = v54;
    return TSUEqualFormatStructs((uint64_t)v12, (uint64_t)v13);
  }
  char isEqual = 1;
  switch(*((unsigned char *)&self->mPrivate + 1))
  {
    case 0:
      goto LABEL_9;
    case 2:
      long long v14 = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
      v74[0] = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
      v74[1] = v14;
      uint64_t v75 = *((void *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 3);
      v15 = (long long *)((char *)a3 + 104);
      if (!a3) {
        v15 = &TSUInvalidFormat;
      }
      long long v16 = v15[1];
      v72[0] = *v15;
      v72[1] = v16;
      uint64_t v73 = *((void *)v15 + 4);
      if (!TSUEqualFormatStructs((uint64_t)v74, (uint64_t)v72)) {
        return 0;
      }
      int mPrivate = (int)self->mPrivate;
      if ((mPrivate & 0xFB00) == 0x200 || (int v18 = BYTE1(mPrivate), v18 == 7))
      {
        double mDouble = self->mPrivate.mValue.mDouble;
      }
      else
      {
        double mDouble = 0.0;
        if (v18)
        {
          v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v21 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, @"can't get value from non-value cell: %p", self);
        }
      }
      if (a3)
      {
        int v33 = *((_DWORD *)a3 + 2);
        if ((v33 & 0xFB00) == 0x200 || (int v34 = BYTE1(v33), v34 == 7))
        {
          double v35 = *((double *)a3 + 2);
        }
        else
        {
          double v35 = 0.0;
          if (v34)
          {
            v36 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v37 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
            objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, @"can't get value from non-value cell: %p", a3);
          }
        }
      }
      else
      {
        v50 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v51 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
        objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 889, @"invalid nil value for '%s'", "cell");
        double v35 = 0.0;
      }
      return mDouble == v35;
    case 3:
      mString = self->mPrivate.mValue.mString.mString;
      if (a3 && (int v23 = *((unsigned __int8 *)a3 + 9), *((unsigned char *)a3 + 9)))
      {
        if (v23 == 9)
        {
          v24 = (__CFString *)[*((id *)a3 + 9) string];
        }
        else if (v23 == 3)
        {
          v24 = (__CFString *)*((void *)a3 + 3);
        }
        else
        {
          v52 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v53 = [NSString stringWithUTF8String:"NSString *TSTCellStringValue(TSTCell *)"];
          objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 972, @"can't get string from non-string cell: %p", a3);
          v24 = 0;
        }
      }
      else
      {
        v24 = &stru_26D688A48;
      }
      return [(NSString *)mString isEqualToString:v24];
    case 5:
      mDate = self->mPrivate.mValue.mDate;
      if (!a3 || !*((unsigned char *)a3 + 9)) {
        goto LABEL_58;
      }
      if (*((unsigned char *)a3 + 9) == 5)
      {
        uint64_t v26 = *((void *)a3 + 2);
      }
      else
      {
        v38 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v39 = [NSString stringWithUTF8String:"NSDate *TSTCellDateValue(TSTCell *)"];
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1021, @"can't get date value from a non-date cell: %p", a3);
LABEL_58:
        uint64_t v26 = 0;
      }
      if (![(NSDate *)mDate isEqualToDate:v26]) {
        return 0;
      }
      long long v40 = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
      v70[0] = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
      v70[1] = v40;
      uint64_t v71 = *((void *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 3);
      v41 = (long long *)((char *)a3 + 104);
      if (!a3) {
        v41 = &TSUInvalidFormat;
      }
      long long v42 = v41[1];
      v68[0] = *v41;
      v68[1] = v42;
      uint64_t v69 = *((void *)v41 + 4);
      v12 = v70;
      v13 = v68;
      return TSUEqualFormatStructs((uint64_t)v12, (uint64_t)v13);
    case 6:
      double v27 = self->mPrivate.mValue.mDouble;
      if (!a3 || !*((unsigned char *)a3 + 9)) {
        goto LABEL_64;
      }
      if (*((unsigned char *)a3 + 9) == 6)
      {
        if ((v27 != 0.0) != (*((double *)a3 + 2) != 0.0)) {
          return 0;
        }
        goto LABEL_67;
      }
      v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v44 = [NSString stringWithUTF8String:"BOOL TSTCellBoolValue(TSTCell *)"];
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 925, @"can't get BOOL value from non-BOOL cell: %p", a3);
LABEL_64:
      if (v27 == 0.0)
      {
LABEL_67:
        long long v45 = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
        v60[0] = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
        v60[1] = v45;
        uint64_t v61 = *((void *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 3);
        v46 = (long long *)((char *)a3 + 104);
        if (!a3) {
          v46 = &TSUInvalidFormat;
        }
        long long v47 = v46[1];
        v58[0] = *v46;
        v58[1] = v47;
        uint64_t v59 = *((void *)v46 + 4);
        v12 = v60;
        v13 = v58;
        return TSUEqualFormatStructs((uint64_t)v12, (uint64_t)v13);
      }
      return 0;
    case 7:
      unint64_t v28 = ((unint64_t)*MEMORY[0x263F7C938] << 32) | 4;
      mNumberFormatStruct.mCurrencyCode = (NSString *)0x1000000001;
      *((void *)&mNumberFormatStruct + 1) = v28;
      double v66 = self->mPrivate.mValue.mDouble;
      if (self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 268) {
        $A2C45A798B4E598950266309F807F0CD mNumberFormatStruct = self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mNumberFormatStruct;
      }
      double v64 = 0.0;
      long long v65 = 0uLL;
      if (!a3)
      {
        *(void *)&long long v65 = 0x1000000001;
        *((void *)&v65 + 1) = v28;
        goto LABEL_71;
      }
      int v29 = *((unsigned __int8 *)a3 + 9);
      *(void *)&long long v65 = 0x1000000001;
      *((void *)&v65 + 1) = v28;
      if (!v29)
      {
LABEL_71:
        double v64 = 0.0;
        goto LABEL_72;
      }
      if (v29 != 7)
      {
        v48 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v49 = [NSString stringWithUTF8String:"TSTDurationWrapper TSTCellDurationValue(TSTCell *)"];
        objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1064, @"can't get duration value from a non-duration cell: %p", a3);
        goto LABEL_71;
      }
      double v64 = *((double *)a3 + 2);
      if (*((_DWORD *)a3 + 26) == 268) {
        long long v65 = *((_OWORD *)a3 + 7);
      }
LABEL_72:
      TSUFormat::TSUFormat();
      TSUFormat::TSUFormat();
      if (v66 == v64) {
        char isEqual = TSUFormat::isEqual((TSUFormat *)v63, (const TSUFormat *)v62);
      }
      else {
        char isEqual = 0;
      }
      MEMORY[0x223CB8C90](v62);
      MEMORY[0x223CB8C90](v63);
      return isEqual;
    case 9:
      mRichTextPayload = self->mPrivate.mRichTextPayload;
      if (a3) {
        uint64_t v31 = *((void *)a3 + 9);
      }
      else {
        uint64_t v31 = 0;
      }
      return [(TSTRichTextPayload *)mRichTextPayload isEqual:v31];
    default:
      return isEqual;
  }
}

- (id)description
{
  double v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  if (self)
  {
    int mPrivate = (int)self->mPrivate;
    if (BYTE1(mPrivate) > 9u)
    {
LABEL_9:
      v7 = 0;
LABEL_10:
      v8 = @"<unknown cell type>";
      v9 = v7;
    }
    else
    {
      v7 = @"DEPRECATED";
      v8 = @"<empty>";
      v9 = @"No content";
      switch(BYTE1(mPrivate))
      {
        case 1:
          goto LABEL_9;
        case 2:
          long long v10 = NSString;
          if ((*(_DWORD *)&self->mPrivate & 0xFB00) == 0x200 || BYTE1(mPrivate) == 7)
          {
            mDate = self->mPrivate.mValue.mDate;
          }
          else
          {
            mDate = 0;
            if (BYTE1(mPrivate))
            {
              v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v13 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
              objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, @"can't get value from non-value cell: %p", self);
            }
          }
          v8 = (__CFString *)objc_msgSend(v10, "stringWithFormat:", @"<number: %f>", mDate);
          v9 = @"Number";
          break;
        case 3:
          v8 = (__CFString *)[NSString stringWithFormat:@"<string: '%@'>", self->mPrivate.mValue.mString.mString];
          v9 = @"String";
          break;
        case 4:
          goto LABEL_10;
        case 5:
          v8 = (__CFString *)[NSString stringWithFormat:@"<date: '%@'>", -[NSDate description](self->mPrivate.mValue.mDate, "description")];
          v9 = @"Date";
          break;
        case 6:
          long long v14 = NSString;
          if ((*(_DWORD *)&self->mPrivate & 0xFB00) == 0x200 || BYTE1(mPrivate) == 7)
          {
            v17 = @"TRUE";
            if (self->mPrivate.mValue.mDouble == 0.0) {
              v17 = @"FALSE";
            }
          }
          else
          {
            if (BYTE1(mPrivate))
            {
              v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v16 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
              objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, @"can't get value from non-value cell: %p", self);
            }
            v17 = @"FALSE";
          }
          v8 = (__CFString *)[v14 stringWithFormat:@"<BOOL: '%@'>", v17];
          v9 = @"Bool";
          break;
        case 7:
          v8 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<duration: %f>", self->mPrivate.mValue.mDate);
          v9 = @"Duration";
          break;
        case 8:
          v8 = (__CFString *)[NSString stringWithFormat:@"<error>"];
          v9 = @"FormulaError";
          break;
        case 9:
          v8 = (__CFString *)[NSString stringWithFormat:@"<rich text: '%@'>", -[TSTRichTextPayload string](self->mPrivate.mRichTextPayload, "string")];
          v9 = @"RichText";
          break;
        default:
          return (id)[v3 stringWithFormat:@"<%@:%p: value type %@ value %@>", v5, self, v9, v8];
      }
    }
  }
  else
  {
    v8 = @"<empty>";
    v9 = @"No content";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p: value type %@ value %@>", v5, self, v9, v8];
}

@end