@interface CMNumberFormatter
+ (id)formatterForNumberFormat:(int)a3 language:(int)a4;
- (CMNumberFormatter)initWithNumberFormat:(int)a3 language:(int)a4;
- (id)stringForNumber:(unint64_t)a3;
- (void)dealloc;
@end

@implementation CMNumberFormatter

+ (id)formatterForNumberFormat:(int)a3 language:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (qword_2689BCBB0 != -1) {
    dispatch_once(&qword_2689BCBB0, &__block_literal_global_105);
  }
  unint64_t v7 = v5 | ((unint64_t)v4 << 8);
  v8 = (void *)_MergedGlobals_52;
  v9 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v10 = [v8 objectForKey:v9];

  v11 = (void *)v10;
  if (!v10)
  {
    v11 = (void *)[objc_alloc((Class)a1) initWithNumberFormat:v5 language:v4];
    v12 = (void *)_MergedGlobals_52;
    v13 = [NSNumber numberWithUnsignedInteger:v7];
    [v12 setObject:v11 forKey:v13];
  }
  return v11;
}

void __55__CMNumberFormatter_formatterForNumberFormat_language___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)_MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v0;
}

- (CMNumberFormatter)initWithNumberFormat:(int)a3 language:(int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CMNumberFormatter;
  v6 = [(CMNumberFormatter *)&v11 init];
  unint64_t v7 = v6;
  if (v6)
  {
    v6->_format = a3;
    v6->_language = a4;
    if ((a3 & 0xFFFFFFFE) == 6)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      v8 = OCDOfficeStringFromLanguage(a4);
      v9 = v8;
      if (v8)
      {
        [v8 UTF8String];
        uloc_canonicalize();
      }
      v7->_numberFormatter = (void **)unum_open();
      if (a3 == 7) {
        unum_setTextAttribute();
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  if (self->_numberFormatter) {
    unum_close();
  }
  v3.receiver = self;
  v3.super_class = (Class)CMNumberFormatter;
  [(CMNumberFormatter *)&v3 dealloc];
}

- (id)stringForNumber:(unint64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_numberFormatter)
  {
    memset(v32, 0, sizeof(v32));
    int v5 = unum_format();
    LOWORD(v32[0]) = MEMORY[0x23EC9A930](0);
    uint64_t v10 = [NSString stringWithCharacters:v32 length:v5];
LABEL_10:
    objc_super v11 = (__CFString *)v10;
    goto LABEL_11;
  }
  int format = self->_format;
  if (format == 22)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%.2lu", a3);
    goto LABEL_10;
  }
  if (!format)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
    goto LABEL_10;
  }
  if (a3)
  {
    unint64_t v7 = [MEMORY[0x263F089D8] string];
    int v8 = self->_format;
    uint64_t v9 = 1;
    switch(v8)
    {
      case 1:
      case 2:
        if (v3 >= 0x3E8)
        {
          if (v8 == 1) {
            uint64_t v13 = @"M";
          }
          else {
            uint64_t v13 = @"m";
          }
          do
          {
            objc_msgSend(v7, "appendString:", v13, v9);
            v3 -= 1000;
          }
          while (v3 > 0x3E7);
        }
        unint64_t v14 = v3 - 900;
        if (v3 >= 0x384)
        {
          if (v8 == 1) {
            v15 = @"CM";
          }
          else {
            v15 = @"cm";
          }
LABEL_54:
          objc_msgSend(v7, "appendString:", v15, v9);
          unint64_t v3 = v14;
          goto LABEL_60;
        }
        if (v3 < 0x1F4)
        {
          unint64_t v14 = v3 - 400;
          if (v3 >= 0x190)
          {
            if (v8 == 1) {
              v15 = @"CD";
            }
            else {
              v15 = @"cd";
            }
            goto LABEL_54;
          }
        }
        else
        {
          if (v8 == 1) {
            v21 = @"D";
          }
          else {
            v21 = @"d";
          }
          objc_msgSend(v7, "appendString:", v21, v9);
          v3 -= 500;
        }
        if (v3 >= 0x64)
        {
          if (v8 == 1) {
            v22 = @"C";
          }
          else {
            v22 = @"c";
          }
          do
          {
            [v7 appendString:v22];
            v3 -= 100;
          }
          while (v3 > 0x63);
        }
LABEL_60:
        unint64_t v23 = v3 - 90;
        if (v3 >= 0x5A)
        {
          if (v8 == 1) {
            v24 = @"XC";
          }
          else {
            v24 = @"xc";
          }
LABEL_64:
          [v7 appendString:v24];
          unint64_t v3 = v23;
          goto LABEL_79;
        }
        if (v3 < 0x32)
        {
          unint64_t v23 = v3 - 40;
          if (v3 >= 0x28)
          {
            if (v8 == 1) {
              v24 = @"XL";
            }
            else {
              v24 = @"xl";
            }
            goto LABEL_64;
          }
        }
        else
        {
          if (v8 == 1) {
            v25 = @"L";
          }
          else {
            v25 = @"l";
          }
          [v7 appendString:v25];
          v3 -= 50;
        }
        if (v3 >= 0xA)
        {
          if (v8 == 1) {
            v26 = @"X";
          }
          else {
            v26 = @"x";
          }
          do
          {
            [v7 appendString:v26];
            v3 -= 10;
          }
          while (v3 > 9);
        }
LABEL_79:
        if (v3 == 9)
        {
          v27 = @"ix";
          v28 = @"IX";
LABEL_88:
          if (v8 == 1) {
            v30 = v28;
          }
          else {
            v30 = v27;
          }
          [v7 appendString:v30];
          goto LABEL_92;
        }
        if (v3 < 5)
        {
          if (v3 == 4)
          {
            v27 = @"iv";
            v28 = @"IV";
            goto LABEL_88;
          }
        }
        else
        {
          if (v8 == 1) {
            v29 = @"V";
          }
          else {
            v29 = @"v";
          }
          [v7 appendString:v29];
          v3 -= 5;
        }
        if (v3)
        {
          if (v8 == 1) {
            v31 = @"I";
          }
          else {
            v31 = @"i";
          }
          do
          {
            [v7 appendString:v31];
            --v3;
          }
          while (v3);
        }
LABEL_93:
        if ([v7 length])
        {
          v20 = v7;
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%lu", v3);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
LABEL_44:
        objc_super v11 = v20;

        break;
      case 3:
      case 4:
        if (v8 == 4) {
          int v16 = 97;
        }
        else {
          int v16 = 65;
        }
        do
        {
          unint64_t v17 = (v3 - 1) % 0x1A;
          v18 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v9, (v16 + v17));
          [v7 insertString:v18 atIndex:0];

          unint64_t v19 = v3 - v17;
          unint64_t v3 = (v3 - v17) / 0x1A;
        }
        while (v19 >= 0x1A);
LABEL_92:
        unint64_t v3 = 0;
        goto LABEL_93;
      case 10:
      case 11:
      case 17:
        uint64_t v9 = 15;
        goto LABEL_43;
      case 12:
      case 20:
        uint64_t v9 = 21;
        goto LABEL_43;
      case 13:
      case 21:
        uint64_t v9 = 27;
        goto LABEL_43;
      case 16:
        uint64_t v9 = 36;
        goto LABEL_43;
      case 18:
        uint64_t v9 = 48;
        goto LABEL_43;
      case 19:
        uint64_t v9 = 49;
        goto LABEL_43;
      case 24:
      case 25:
      case 41:
      case 42:
      case 43:
        uint64_t v9 = 45;
        goto LABEL_43;
      case 27:
      case 57:
        goto LABEL_43;
      case 28:
      case 30:
      case 31:
      case 37:
      case 39:
      case 40:
        uint64_t v9 = 30;
        goto LABEL_43;
      case 29:
        uint64_t v9 = 31;
        goto LABEL_43;
      case 32:
      case 33:
      case 35:
      case 36:
      case 44:
        uint64_t v9 = 33;
        goto LABEL_43;
      case 34:
        uint64_t v9 = 42;
        goto LABEL_43;
      case 38:
        uint64_t v9 = 39;
        goto LABEL_43;
      case 45:
      case 47:
        uint64_t v9 = 62;
        goto LABEL_43;
      case 46:
        uint64_t v9 = 52;
        goto LABEL_43;
      case 48:
        uint64_t v9 = 55;
LABEL_43:
        objc_msgSend(NSString, "tswp_stringForValue:withListNumberFormat:includeFormatting:", v3, v9, 0);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      default:
        goto LABEL_93;
    }
  }
  else
  {
    objc_super v11 = @"?";
  }
LABEL_11:
  return v11;
}

@end