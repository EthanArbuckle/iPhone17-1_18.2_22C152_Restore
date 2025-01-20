@interface TSUFormatReferenceObject
- ($83865FB3BCBFFDCA764A1525C84CB712)getFormatStruct;
- (BOOL)isEqual:(id)a3;
- (TSUFormatReferenceObject)init;
- (TSUFormatReferenceObject)initWithTSUFormatFormatStruct:(id *)a3;
- (void)dealloc;
@end

@implementation TSUFormatReferenceObject

- (TSUFormatReferenceObject)init
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUFormatReferenceObject init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatReferenceObject.m"), 16, @"don't call this. call initWithFormatStruct");
  return 0;
}

- (TSUFormatReferenceObject)initWithTSUFormatFormatStruct:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var1.var7.var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  uint64_t v10 = *((void *)&a3->var1.var7 + 3);
  TSUFormatStructRetain(v9);
  long long v6 = *(_OWORD *)&a3->var0;
  long long v7 = *(_OWORD *)&a3->var1.var7.var2;
  *((void *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3) = *((void *)&a3->var1.var7 + 3);
  *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData = v7;
  *(_OWORD *)&self->mFormatStruct.mFormatType = v6;
  return self;
}

- ($83865FB3BCBFFDCA764A1525C84CB712)getFormatStruct
{
  long long v3 = *((_OWORD *)&self->var1.var7 + 1);
  *($198B42951312A1A759C730ED33D6A885 *)&retstr->var0 = self->var1.var0;
  *(_OWORD *)&retstr->var1.var7.var2 = v3;
  *((void *)&retstr->var1.var7 + 3) = *(void *)&self[1].var0;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    [a3 getFormatStruct];
    int v4 = v18[0];
  }
  else
  {
    int v4 = 0;
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  if (self->mFormatStruct.mFormatType == v4)
  {
    LOBYTE(v5) = 1;
    int v6 = v4 - 254;
    mCurrencyCode = self->mFormatStruct.var0.mNumberFormatStruct.mCurrencyCode;
    mDateTimeFormat = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
    unsigned __int8 v9 = mCurrencyCode;
    switch(v6)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_12;
      case 2:
      case 3:
      case 4:
      case 5:
        if (*((NSString **)&v18[0] + 1) != mCurrencyCode)
        {
          BOOL v5 = -[NSString isEqualToString:](self->mFormatStruct.var0.mNumberFormatStruct.mCurrencyCode, "isEqualToString:");
          if (!v5) {
            return v5;
          }
        }
        if (((LOWORD(v18[1]) ^ (unsigned __int16)mDateTimeFormat) & 0x1FFF) != 0) {
          break;
        }
LABEL_9:
        LOBYTE(v5) = 1;
        return v5;
      case 6:
      case 9:
      case 13:
        return v5;
      case 7:
        BOOL v5 = [(NSString *)self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat isEqualToString:*(void *)&v18[1]];
        if (!v5) {
          return v5;
        }
        if ((BYTE8(v18[0]) ^ v9)) {
          break;
        }
        BOOL v10 = ((BYTE8(v18[0]) ^ v9) & 2) == 0;
LABEL_40:
        LOBYTE(v5) = v10;
        return v5;
      case 8:
        BOOL v10 = BYTE8(v18[0]) == mCurrencyCode;
        goto LABEL_40;
      case 10:
      case 11:
        if (self->mFormatStruct.var0.mControlFormatStruct.mMinimum != *((double *)v18 + 1)
          || self->mFormatStruct.var0.mControlFormatStruct.mMaximum != *(double *)&v18[1]
          || self->mFormatStruct.var0.mControlFormatStruct.mIncrement != *((double *)&v18[1] + 1)
          || self->mFormatStruct.var0.mControlFormatStruct.mDisplayFormatType != v19)
        {
          break;
        }
        LOBYTE(v5) = ((BYTE4(v19) ^ *((unsigned char *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 28)) & 3) == 0
                  && ((BYTE4(v19) ^ *((unsigned char *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 28)) & 0xC) == 0;
        return v5;
      case 12:
        if (DWORD2(v18[0]) != mCurrencyCode) {
          break;
        }
        BOOL v10 = HIDWORD(v18[0]) == HIDWORD(mCurrencyCode);
        goto LABEL_40;
      case 14:
        LOBYTE(v5) = 0;
        if (DWORD1(v18[1]) != HIDWORD(mDateTimeFormat)
          || *(void *)((char *)v18 + 12) != __PAIR64__(mDateTimeFormat, HIDWORD(mCurrencyCode)))
        {
          return v5;
        }
        BOOL v10 = ((BYTE8(v18[0]) ^ mCurrencyCode) & 1) == 0;
        goto LABEL_40;
      case 15:
        unsigned int v16 = (WORD4(v18[0]) | (BYTE10(v18[0]) << 16)) ^ mCurrencyCode & 0xFFFFFF;
        if ((_WORD)v16) {
          break;
        }
        BOOL v10 = (v16 & 0x10000) == 0;
        goto LABEL_40;
      case 16:
      case 17:
      case 18:
        BOOL v10 = DWORD2(v18[0]) == mCurrencyCode;
        goto LABEL_40;
      default:
        if (mCurrencyCode < 2) {
          return v5;
        }
LABEL_12:
        id v11 = +[TSUAssertionHandler currentHandler];
        uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TSUEqualFormatStructs(TSUFormatStruct, TSUFormatStruct)");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatUtilities.h"), 191, @"We should have dealt with any types earlier.");
        break;
    }
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (void)dealloc
{
  long long v3 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  v5[0] = *(_OWORD *)&self->mFormatStruct.mFormatType;
  v5[1] = v3;
  uint64_t v6 = *((void *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease(v5);
  v4.receiver = self;
  v4.super_class = (Class)TSUFormatReferenceObject;
  [(TSUFormatReferenceObject *)&v4 dealloc];
}

@end