@interface TMLTypeRegistry
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)classNameForType:(unint64_t)a3;
+ (id)encodedTypeForType:(unint64_t)a3;
+ (id)typeNameForType:(unint64_t)a3;
+ (unint64_t)typeForEncodedType:(id)a3;
+ (unint64_t)typeForTypeName:(id)a3;
@end

@implementation TMLTypeRegistry

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (unint64_t)typeForTypeName:(id)a3
{
  id v4 = a3;
  if (qword_268A05978 != -1) {
    dispatch_once(&qword_268A05978, &unk_26ECEE4E8);
  }
  if (!objc_msgSend_length(v4, v3, v5)) {
    goto LABEL_8;
  }
  unsigned int v8 = objc_msgSend_characterAtIndex_(v4, v6, v7, 0);
  if (v8 > 0x7F)
  {
    if (__maskrune(v8, 0x8000uLL)) {
      goto LABEL_6;
    }
LABEL_8:
    v10 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05970, v6, v7, v4);
    unint64_t v9 = objc_msgSend_unsignedIntegerValue(v10, v11, v12);

    goto LABEL_9;
  }
  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v8 + 60) & 0x8000) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v9 = 16;
LABEL_9:

  return v9;
}

+ (id)typeNameForType:(unint64_t)a3
{
  if (a3 - 1 > 0x1D) {
    return @"unknown";
  }
  else {
    return off_264DAF818[a3 - 1];
  }
}

+ (id)classNameForType:(unint64_t)a3
{
  if (a3 == 18) {
    return @"NSAttributedString";
  }
  else {
    return &stru_26ECF02A8;
  }
}

+ (unint64_t)typeForEncodedType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_hasPrefix_(v3, v4, v5, @"r"))
  {
    uint64_t v8 = objc_msgSend_substringFromIndex_(v3, v6, v7, 1);

    id v3 = (id)v8;
  }
  if (qword_268A05988 != -1) {
    dispatch_once(&qword_268A05988, &unk_26ECEE508);
  }
  unint64_t v9 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05980, v6, v7, v3);
  unint64_t v12 = objc_msgSend_unsignedIntegerValue(v9, v10, v11);

  if (!v12)
  {
    if (objc_msgSend_rangeOfString_options_(v3, v13, v14, @"directionalEdgeInsets", 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend_hasPrefix_(v3, v15, v16, @"@"))
      {
        unint64_t v12 = 16;
      }
      else if (objc_msgSend_hasPrefix_(v3, v17, v18, @"{"))
      {
        unint64_t v12 = 27;
      }
      else if (objc_msgSend_rangeOfString_(v3, v20, v21, @"^") != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v12 = 26;
      }
    }
    else
    {
      unint64_t v12 = 30;
    }
  }

  return v12;
}

+ (id)encodedTypeForType:(unint64_t)a3
{
  if (qword_268A05998 != -1) {
    dispatch_once(&qword_268A05998, &unk_26ECEE528);
  }
  double v5 = (void *)qword_268A05990;
  v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, v3, a3);
  unint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v7, v8, v6);

  return v9;
}

@end