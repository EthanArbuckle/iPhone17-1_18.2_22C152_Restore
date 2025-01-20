@interface OITSUFormatObject
+ (id)defaultDateFormat:(id)a3;
+ (id)defaultDurationFormat;
- ($37D1E9AA147035CEEFF2BA7CE0E7535D)formatStruct;
- (BOOL)isEqual:(id)a3;
- (BOOL)useExpandedContents;
- (OITSUFormatObject)init;
- (OITSUFormatObject)initWithTSUFormatFormatStruct:(id *)a3;
- (OITSUFormatObject)initWithTSUFormatFormatStruct:(id *)a3 useExpandedContents:(BOOL)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)p_setFormatStruct:(id *)a3;
@end

@implementation OITSUFormatObject

+ (id)defaultDateFormat:(id)a3
{
  if (!a3)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"TSUFormatStructDate TSUDefaultFormatStructDate(OITSULocale *)"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatStructUtilities.h"], 89, 0, "A locale is required.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v6[0] = 261;
  v6[1] = 0;
  v6[2] = TSUDefaultDateTimeFormat(a3);
  v6[3] = 0;
  v6[4] = 0;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithTSUFormatFormatStruct:v6];
}

+ (id)defaultDurationFormat
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v3 = 268;
  long long v4 = xmmword_238EDB020;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithTSUFormatFormatStruct:&v3];
}

- (OITSUFormatObject)init
{
  v7.receiver = self;
  v7.super_class = (Class)OITSUFormatObject;
  v2 = [(OITSUFormatObject *)&v7 init];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = [NSString stringWithUTF8String:"-[OITSUFormatObject init]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatObject.m"], 48, 0, "don't call this. call initWithFormatStruct");
    +[OITSUAssertionHandler logBacktraceThrottled];
    uint64_t v5 = v3;
  }
  return 0;
}

- (OITSUFormatObject)initWithTSUFormatFormatStruct:(id *)a3 useExpandedContents:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)OITSUFormatObject;
  uint64_t v6 = [(OITSUFormatObject *)&v13 init];
  if (v6)
  {
    long long v7 = *(_OWORD *)&a3->var1.var7.var2;
    v11[0] = *(_OWORD *)&a3->var0;
    v11[1] = v7;
    uint64_t v12 = *((void *)&a3->var1.var7 + 3);
    TSUFormatStructRetain((id *)v11);
    long long v8 = *(_OWORD *)&a3->var0;
    long long v9 = *(_OWORD *)&a3->var1.var7.var2;
    *((void *)v6 + 5) = *((void *)&a3->var1.var7 + 3);
    *(_OWORD *)(v6 + 24) = v9;
    *(_OWORD *)(v6 + 8) = v8;
    v6[48] = a4;
  }
  return (OITSUFormatObject *)v6;
}

- (OITSUFormatObject)initWithTSUFormatFormatStruct:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var1.var7.var2;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v3;
  uint64_t v6 = *((void *)&a3->var1.var7 + 3);
  return [(OITSUFormatObject *)self initWithTSUFormatFormatStruct:v5 useExpandedContents:0];
}

- (void)dealloc
{
  long long v3 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  v5[0] = *(_OWORD *)&self->mFormatStruct.mFormatType;
  v5[1] = v3;
  uint64_t v6 = *((void *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease((id *)v5);
  v4.receiver = self;
  v4.super_class = (Class)OITSUFormatObject;
  [(OITSUFormatObject *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [OITSUMutableFormatObject alloc];
  if (self)
  {
    [(OITSUFormatObject *)self formatStruct];
  }
  else
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  return [(OITSUFormatObject *)v4 initWithTSUFormatFormatStruct:v6 useExpandedContents:self->mUseExpandedContents];
}

- ($37D1E9AA147035CEEFF2BA7CE0E7535D)formatStruct
{
  long long v3 = *((_OWORD *)&self->var1.var7 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var1.var7.var2 = v3;
  *((void *)&retstr->var1.var7 + 3) = *(void *)&self[1].var0;
  return self;
}

- (void)p_setFormatStruct:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var1.var7.var2;
  long long v9 = *(_OWORD *)&a3->var0;
  long long v10 = v5;
  uint64_t v11 = *((void *)&a3->var1.var7 + 3);
  TSUFormatStructRetain((id *)&v9);
  long long v6 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  long long v9 = *(_OWORD *)&self->mFormatStruct.mFormatType;
  long long v10 = v6;
  uint64_t v11 = *((void *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease((id *)&v9);
  long long v7 = *(_OWORD *)&a3->var0;
  long long v8 = *(_OWORD *)&a3->var1.var7.var2;
  *((void *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3) = *((void *)&a3->var1.var7 + 3);
  *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData = v8;
  *(_OWORD *)&self->mFormatStruct.mFormatType = v7;
}

- (unint64_t)hash
{
  if (self->mUseExpandedContents && (self->mFormatStruct.mFormatType - 270) <= 2)
  {
    mDateTimeFormat = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
    if (mDateTimeFormat) {
      return [(NSString *)mDateTimeFormat hash] ^ self->mFormatStruct.var0.mCustomFormatStruct.mAppliedConditionKey;
    }
  }
  long long v5 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  v6[0] = *(_OWORD *)&self->mFormatStruct.mFormatType;
  v6[1] = v5;
  uint64_t v7 = *((void *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  return TSUFormatStructHash((unsigned int *)v6);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  long long v6 = TSUSpecificCast(v5, a3);
  if (v6 || (v7 = objc_opt_class(), v8 = TSUSpecificCast(v7, a3), (long long v6 = v8) != 0))
  {
    int mUseExpandedContents = self->mUseExpandedContents;
    if (mUseExpandedContents == [v6 useExpandedContents])
    {
      if (self->mUseExpandedContents
        && (self->mFormatStruct.mFormatType - 270) <= 2
        && self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat
        && ([v6 formatStruct], (v31 - 270) <= 2)
        && ([v6 formatStruct], v30))
      {
        [v6 formatStruct];
        long long v28 = v26;
        uint64_t v29 = v27;
        long long v34 = *(_OWORD *)&self->mFormatStruct.var0.mNumberFormatStruct;
        double mIncrement = self->mFormatStruct.var0.mControlFormatStruct.mIncrement;
        LODWORD(v8) = TSUFormatStructCustomEqualKeys((void **)&v34, (void **)&v28);
        if (!v8) {
          return (char)v8;
        }
        int mAppliedConditionKey = self->mFormatStruct.var0.mCustomFormatStruct.mAppliedConditionKey;
        [v6 formatStruct];
        if (mAppliedConditionKey == v25)
        {
          mDateTimeFormat = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
          [v6 formatStruct];
          BOOL v12 = mDateTimeFormat == v24;
LABEL_39:
          LOBYTE(v8) = v12;
          return (char)v8;
        }
      }
      else
      {
        [v6 formatStruct];
        int mFormatType = self->mFormatStruct.mFormatType;
        if (mFormatType == v19)
        {
          LOBYTE(v8) = 1;
          mCustomFormatKey = self->mFormatStruct.var0.mCustomFormatStruct.mCustomFormatKey;
          v15 = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
          double v17 = self->mFormatStruct.var0.mControlFormatStruct.mIncrement;
          switch(mFormatType)
          {
            case 256:
            case 257:
            case 258:
            case 259:
              if (((v20 ^ mCustomFormatKey) & 0x1FFFFFFF) != 0) {
                goto LABEL_36;
              }
              return (char)v8;
            case 261:
              LODWORD(v8) = -[NSString isEqualToString:](self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat, "isEqualToString:", *((void *)&v20 + 1), v17);
              if (!v8) {
                return (char)v8;
              }
              if ((v20 ^ mCustomFormatKey)) {
                goto LABEL_36;
              }
              BOOL v12 = ((v20 ^ mCustomFormatKey) & 2) == 0;
              break;
            case 262:
              BOOL v12 = v20 == mCustomFormatKey;
              goto LABEL_39;
            case 264:
            case 265:
              LOBYTE(v8) = 0;
              if (*(double *)&mCustomFormatKey == *(double *)&v20
                && *(double *)&v15 == *((double *)&v20 + 1)
                && v17 == v21
                && self->mFormatStruct.var0.mControlFormatStruct.mDisplayFormatType == v22)
              {
                LOBYTE(v8) = ((v23 ^ *((unsigned char *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 28)) & 3) == 0
                          && ((v23 ^ *((unsigned char *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 28)) & 0xC) == 0;
              }
              return (char)v8;
            case 266:
              if ((NSUUID *)v20 != mCustomFormatKey) {
                goto LABEL_36;
              }
              if (HIDWORD(mCustomFormatKey)) {
                return (char)v8;
              }
              BOOL v12 = *((void *)&v20 + 1) == (void)v15;
              goto LABEL_39;
            case 268:
              if (HIDWORD(v20) != HIDWORD(v15)) {
                goto LABEL_36;
              }
              LOBYTE(v8) = 0;
              if (*(void *)((char *)&v20 + 4) != __PAIR64__(v15, HIDWORD(mCustomFormatKey))) {
                return (char)v8;
              }
              BOOL v12 = ((v20 ^ mCustomFormatKey) & 1) == 0;
              goto LABEL_39;
            case 269:
              if ((unsigned __int16)v20 != (unsigned __int16)mCustomFormatKey) {
                goto LABEL_36;
              }
              BOOL v12 = ((((unsigned __int16)v20 | (BYTE2(v20) << 16)) ^ mCustomFormatKey) & 0x10000) == 0;
              goto LABEL_39;
            case 270:
            case 271:
            case 272:
              *(void *)&long long v34 = self->mFormatStruct.var0.mCustomFormatStruct.mCustomFormatKey;
              *((void *)&v34 + 1) = v15;
              double mIncrement = v17;
              long long v32 = v20;
              double v33 = v21;
              LOBYTE(v8) = TSUFormatStructCustomEqualKeys((void **)&v34, (void **)&v32);
              return (char)v8;
            default:
              return (char)v8;
          }
          goto LABEL_39;
        }
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"-[OITSUFormatObject isEqual:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatObject.m"], 112, 0, "The useExpandedContents flag depends on external context, and should be the same for all formats compared in that context.");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
LABEL_36:
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)useExpandedContents
{
  return self->mUseExpandedContents;
}

@end