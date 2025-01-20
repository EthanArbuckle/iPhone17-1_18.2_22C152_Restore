@interface TSTTableDataFormat
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithFormat:(id *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataFormat

- (id)initObjectWithFormat:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSTTableDataFormat;
  v4 = [(TSTTableDataFormat *)&v9 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = *((void *)&a3->var1.var7 + 3);
    long long v7 = *(_OWORD *)&a3->var1.var7.var2;
    *(_OWORD *)&v4->mFormat.mFormatType = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v4->mFormat.var0.mMultipleChoiceListFormatStruct.mData = v7;
    *((void *)&v4->mFormat.var0.mMultipleChoiceListFormatStruct + 3) = v6;
    TSUFormatStructRetain();
    v5->super.mRefCount = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  return TSUFormatStructHash();
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_mFormat = &self->mFormat;
    int mFormatType = self->mFormat.mFormatType;
    long long v7 = (char *)a3 + 16;
    if (mFormatType == *((_DWORD *)a3 + 4))
    {
      LOBYTE(v8) = 1;
      double mMinimum = self->mFormat.var0.mControlFormatStruct.mMinimum;
      double mMaximum = self->mFormat.var0.mControlFormatStruct.mMaximum;
      double v11 = *((double *)a3 + 3);
      double v12 = *((double *)a3 + 4);
      unsigned __int16 v13 = LOWORD(mMaximum);
      uint64_t v14 = *((void *)v7 + 2);
      int mCurrencyCode = p_mFormat->var0.mNumberFormatStruct.mCurrencyCode;
      int v16 = *((void *)v7 + 1);
      switch(mFormatType)
      {
        case 254:
          goto LABEL_7;
        case 255:
          goto LABEL_10;
        case 256:
        case 257:
        case 258:
        case 259:
          if (*(void *)&mMinimum != *(void *)&v11)
          {
            BOOL v8 = -[NSString isEqualToString:](p_mFormat->var0.mNumberFormatStruct.mCurrencyCode, "isEqualToString:");
            if (!v8) {
              return v8;
            }
          }
          if ((((unsigned __int16)v14 ^ v13) & 0x1FFF) != 0) {
            break;
          }
LABEL_7:
          LOBYTE(v8) = 1;
          return v8;
        case 260:
        case 263:
        case 267:
          return v8;
        case 261:
          BOOL v8 = [(NSString *)p_mFormat->var0.mDateFormatStruct.mDateTimeFormat isEqualToString:*((void *)v7 + 2)];
          if (!v8) {
            return v8;
          }
          if ((v16 ^ mCurrencyCode)) {
            break;
          }
          BOOL v17 = ((v16 ^ mCurrencyCode) & 2) == 0;
LABEL_44:
          LOBYTE(v8) = v17;
          return v8;
        case 262:
          BOOL v17 = mCurrencyCode == v16;
          goto LABEL_44;
        case 264:
        case 265:
          BOOL v22 = mMinimum == v11
             && mMaximum == v12
             && p_mFormat->var0.mControlFormatStruct.mIncrement == *((double *)v7 + 3)
             && p_mFormat->var0.mControlFormatStruct.mDisplayFormatType == *((_DWORD *)v7 + 8);
          if (!v22
            || ((v7[36] ^ *((unsigned char *)&p_mFormat->var0.mMultipleChoiceListFormatStruct + 28)) & 3) != 0)
          {
            break;
          }
          BOOL v17 = ((v7[36] ^ *((unsigned char *)&p_mFormat->var0.mMultipleChoiceListFormatStruct + 28)) & 0xC) == 0;
          goto LABEL_44;
        case 266:
          BOOL v17 = LODWORD(mMinimum) == LODWORD(v11) && HIDWORD(mMinimum) == HIDWORD(v11);
          goto LABEL_44;
        case 268:
          if (HIDWORD(mMaximum) != HIDWORD(v14)
            || HIDWORD(mMinimum) != HIDWORD(v11)
            || LODWORD(mMaximum) != v14)
          {
            break;
          }
          BOOL v17 = ((v16 ^ mCurrencyCode) & 1) == 0;
          goto LABEL_44;
        case 269:
          if (LOWORD(v11) != LOWORD(mMinimum)) {
            break;
          }
          BOOL v17 = ((LODWORD(v11) ^ LODWORD(mMinimum)) & 0x10000) == 0;
          goto LABEL_44;
        case 270:
        case 271:
        case 272:
          BOOL v17 = LODWORD(mMinimum) == LODWORD(v11);
          goto LABEL_44;
        default:
          if (LODWORD(mMinimum) < 2) {
            return v8;
          }
LABEL_10:
          v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TSUEqualFormatStructs(TSUFormatStruct, TSUFormatStruct)");
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Binaries/AlderShared/install/Root/usr/local/include/TSFrameworks/TSUtility/TSUFormatUtilities.h"), 191, @"We should have dealt with any types earlier.");
          break;
      }
    }
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   mFormat: %@", self->super.mRefCount, NSStringForTSUFormatType()];
}

- (void)dealloc
{
  objc_super v3 = *(objc_super *)&self->mFormat.var0.mMultipleChoiceListFormatStruct.mData;
  v4[1] = *(objc_super *)&self->mFormat.mFormatType;
  v4[2] = v3;
  uint64_t v5 = *((void *)&self->mFormat.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease();
  v4[0].receiver = self;
  v4[0].super_class = (Class)TSTTableDataFormat;
  [(objc_super *)v4 dealloc];
}

@end