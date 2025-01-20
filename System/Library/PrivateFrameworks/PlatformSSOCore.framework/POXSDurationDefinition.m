@interface POXSDurationDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSDurationDefinition

- (id)valueFromString:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v3];
  int v5 = [v4 scanString:@"-" intoString:0];
  [v4 scanString:@"+" intoString:0];
  char v6 = [v4 scanString:@"P" intoString:0] ^ 1;
  double v7 = 0.0;
  if (([v4 isAtEnd] & 1) == 0 && (v6 & 1) == 0)
  {
    char v8 = 0;
    while (1)
    {
      double v16 = 0.0;
      char v6 = [v4 scanDouble:&v16] ^ 1;
      uint64_t v9 = [v4 scanLocation];
      int v10 = [v3 characterAtIndex:v9];
      if (v10 > 82) {
        break;
      }
      switch(v10)
      {
        case 'D':
          double v11 = v16;
LABEL_21:
          double v12 = v11 * 24.0;
          goto LABEL_22;
        case 'H':
          double v12 = v16;
LABEL_22:
          double v7 = v7 + v12 * 60.0 * 60.0;
          goto LABEL_25;
        case 'M':
          if (v8)
          {
            double v7 = v7 + v16 * 60.0;
            char v8 = 1;
            goto LABEL_25;
          }
          char v8 = 0;
          break;
      }
      char v6 = 1;
LABEL_25:
      [v4 setScanLocation:v9 + 1];
      if ([v4 isAtEnd] & 1) != 0 || (v6) {
        goto LABEL_27;
      }
    }
    if (v10 == 83)
    {
      double v7 = v7 + v16;
      goto LABEL_25;
    }
    if (v10 != 87)
    {
      if (v10 == 84) {
        char v6 = v8;
      }
      else {
        char v6 = 1;
      }
      if (v10 == 84) {
        char v8 = 1;
      }
      goto LABEL_25;
    }
    double v11 = v16 * 7.0;
    goto LABEL_21;
  }
LABEL_27:
  if (v6)
  {
    v13 = 0;
  }
  else
  {
    double v14 = -v7;
    if (!v5) {
      double v14 = v7;
    }
    v13 = [NSNumber numberWithDouble:v14];
  }

  return v13;
}

- (id)stringFromValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 longLongValue];
    int v5 = [MEMORY[0x263F089D8] string];
    char v6 = v5;
    if ((v4 & 0x8000000000000000) != 0)
    {
      [v5 appendString:@"-"];
      unint64_t v4 = -(uint64_t)v4;
    }
    unsigned int v7 = v4 % 0x93A80;
    [v6 appendString:@"P"];
    if (v4 >= 0x93A80) {
      objc_msgSend(v6, "appendFormat:", @"%llu%C", v4 / 0x93A80, 87);
    }
    unint64_t v8 = v4 % 0x15180;
    if (v7 >= 0x15180) {
      objc_msgSend(v6, "appendFormat:", @"%llu%C", v7 / 0x15180uLL, 68);
    }
    unint64_t v9 = v4 % 0x3C;
    if (v8 <= 0xE0F && (v4 % 0xE10 <= 0x3B ? (BOOL v10 = v9 == 0) : (BOOL v10 = 0), v10))
    {
      if (!v4) {
        [v6 appendString:@"T0S"];
      }
    }
    else
    {
      objc_msgSend(v6, "appendFormat:", @"%C", 84);
      if (v8 >= 0xE10) {
        objc_msgSend(v6, "appendFormat:", @"%llu%C", v8 / 0xE10uLL, 72);
      }
      if ((unsigned __int16)(v4 % 0xE10) >= 0x3Cu) {
        objc_msgSend(v6, "appendFormat:", @"%llu%C", v4 % 0xE10 / 0x3C, 77);
      }
      if (v9) {
        objc_msgSend(v6, "appendFormat:", @"%llu%C", v9, 83);
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end