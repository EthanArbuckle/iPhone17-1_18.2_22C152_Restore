@interface NSString
- (BOOL)isNumeric;
- (NSString)encodedDialerString;
- (NSString)sanitizedString;
- (NSString)unformattedNumber;
- (NSString)unformattedNumberInLatin;
- (_NSRange)rangeToHighlightText:(id)a3;
- (id)_encodedDialerStringSkippingUnmappedCharacters:(BOOL)a3;
- (id)attributedStringToHighlightText:(id)a3;
- (id)attributedStringToHighlightText:(id)a3 primaryColour:(id)a4 secondaryColour:(id)a5;
- (id)attributedStringToHighlightText:(id)a3 primaryColour:(id)a4 secondaryColour:(id)a5 style:(unint64_t)a6;
- (id)attributedStringToHighlightText:(id)a3 style:(unint64_t)a4;
- (id)indexSetToHighlightDigitsInText:(id)a3;
- (id)processNumberInLatin:(BOOL)a3;
- (id)stringByRemovingDiatrics;
@end

@implementation NSString

- (NSString)encodedDialerString
{
  return (NSString *)[(NSString *)self _encodedDialerStringSkippingUnmappedCharacters:1];
}

- (id)_encodedDialerStringSkippingUnmappedCharacters:(BOOL)a3
{
  BOOL v3 = a3;
  CFIndex Length = CFStringGetLength((CFStringRef)self);
  CFStringRef v41 = (CFStringRef)self;
  uint64_t v44 = 0;
  CFIndex v45 = Length;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v42 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v34 = 0u;
  v43 = CStringPtr;
  int64_t v46 = 0;
  int64_t v47 = 0;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Length >= 1)
  {
    uint64_t v9 = 0;
    int64_t v10 = 0;
    uint64_t v11 = 64;
    do
    {
      UniChar v12 = 0;
      if ((unint64_t)v10 >= 4) {
        uint64_t v13 = 4;
      }
      else {
        uint64_t v13 = v10;
      }
      UniChar chars = 0;
      CFIndex v14 = v45;
      if (v45 > v10)
      {
        if (v42)
        {
          UniChar v12 = v42[v10 + v44];
        }
        else if (v43)
        {
          UniChar v12 = v43[v44 + v10];
        }
        else
        {
          int64_t v15 = v46;
          BOOL v16 = v47 > v10 && v46 <= v10;
          if (!v16)
          {
            uint64_t v17 = -v13;
            uint64_t v18 = v13 + v9;
            uint64_t v19 = v11 - v13;
            int64_t v20 = v10 + v17;
            CFIndex v21 = v20 + 64;
            if (v20 + 64 >= v45) {
              CFIndex v21 = v45;
            }
            int64_t v46 = v20;
            int64_t v47 = v21;
            if (v45 >= v19) {
              CFIndex v14 = v19;
            }
            v49.length = v14 + v18;
            v49.location = v20 + v44;
            CFStringGetCharacters(v41, v49, buffer);
            int64_t v15 = v46;
          }
          UniChar v12 = buffer[v10 - v15];
        }
      }
      UniChar chars = v12;
      double NumericValue = u_getNumericValue(v12);
      if (NumericValue <= 9.0
        && ((double v23 = ceil(NumericValue), NumericValue >= 0.0) ? (v24 = NumericValue == v23) : (v24 = 0), v24))
      {
        unsigned int v25 = (int)NumericValue + 48;
        UniChar chars = (int)NumericValue + 48;
      }
      else
      {
        LOWORD(v25) = chars;
      }
      int v26 = (unsigned __int16)v25;
      if ((unsigned __int16)(v25 - 65) > 0x19u)
      {
        if ((unsigned __int16)(v25 - 97) > 0x19u)
        {
          if ((unsigned __int16)(v25 + 223) > 0x19u)
          {
            if ((unsigned __int16)(v25 + 191) > 0x19u)
            {
              if ((unsigned __int16)(v25 + 240) > 9u)
              {
                switch((unsigned __int16)v25)
                {
                  case 0xFF03u:
                    LOWORD(v25) = 35;
                    goto LABEL_41;
                  case 0xFF04u:
                  case 0xFF05u:
                  case 0xFF06u:
                  case 0xFF07u:
                  case 0xFF08u:
                  case 0xFF09u:
                    goto LABEL_42;
                  case 0xFF0Au:
                    LOWORD(v25) = 42;
                    goto LABEL_41;
                  case 0xFF0Bu:
                    LOWORD(v25) = 43;
                    goto LABEL_41;
                  case 0xFF0Cu:
                    LOWORD(v25) = 44;
                    goto LABEL_41;
                  default:
                    if ((unsigned __int16)v25 != 65307) {
                      goto LABEL_42;
                    }
                    LOWORD(v25) = 59;
                    break;
                }
              }
              else
              {
                LOWORD(v25) = v25 + 288;
              }
              goto LABEL_41;
            }
            int v27 = -65345;
          }
          else
          {
            int v27 = -65313;
          }
          unsigned int v25 = v26 + v27;
        }
        else
        {
          unsigned int v25 = (unsigned __int16)v25 - 97;
        }
      }
      else
      {
        unsigned int v25 = (unsigned __int16)v25 - 65;
      }
      LOWORD(v25) = word_10007DC58[v25] + 48;
LABEL_41:
      UniChar chars = v25;
LABEL_42:
      if (!v3
        || (unsigned __int16)(v25 - 48) < 0xAu
        || ((BOOL v16 = (unsigned __int16)v25 > 0x3Bu, v28 = (1 << v25) & 0x8001C0800000000, !v16)
          ? (BOOL v29 = v28 == 0)
          : (BOOL v29 = 1),
            !v29))
      {
        CFStringAppendCharacters(Mutable, &chars, 1);
      }
      ++v10;
      --v9;
      ++v11;
    }
    while (Length != v10);
  }
  v30 = Mutable;
  CFRelease(v30);

  return v30;
}

- (NSString)unformattedNumber
{
  return (NSString *)[(NSString *)self processNumberInLatin:0];
}

- (NSString)unformattedNumberInLatin
{
  return (NSString *)[(NSString *)self processNumberInLatin:1];
}

- (id)processNumberInLatin:(BOOL)a3
{
  BOOL v3 = a3;
  CFIndex Length = CFStringGetLength((CFStringRef)self);
  CFStringRef v36 = (CFStringRef)self;
  uint64_t v39 = 0;
  CFIndex v40 = Length;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  long long v37 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v29 = 0u;
  long long v38 = CStringPtr;
  int64_t v41 = 0;
  int64_t v42 = 0;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Length >= 1)
  {
    uint64_t v9 = 0;
    int64_t v10 = 0;
    uint64_t v11 = 64;
    do
    {
      UniChar v12 = 0;
      if ((unint64_t)v10 >= 4) {
        uint64_t v13 = 4;
      }
      else {
        uint64_t v13 = v10;
      }
      UniChar chars = 0;
      CFIndex v14 = v40;
      if (v40 > v10)
      {
        if (v37)
        {
          UniChar v12 = v37[v10 + v39];
        }
        else if (v38)
        {
          UniChar v12 = v38[v39 + v10];
        }
        else
        {
          int64_t v15 = v41;
          if (v42 <= v10 || v41 > v10)
          {
            uint64_t v17 = -v13;
            uint64_t v18 = v13 + v9;
            uint64_t v19 = v11 - v13;
            int64_t v20 = v10 + v17;
            CFIndex v21 = v20 + 64;
            if (v20 + 64 >= v40) {
              CFIndex v21 = v40;
            }
            int64_t v41 = v20;
            int64_t v42 = v21;
            if (v40 >= v19) {
              CFIndex v14 = v19;
            }
            v44.length = v14 + v18;
            v44.location = v20 + v39;
            CFStringGetCharacters(v36, v44, buffer);
            int64_t v15 = v41;
          }
          UniChar v12 = buffer[v10 - v15];
        }
      }
      UniChar chars = v12;
      double NumericValue = u_getNumericValue(v12);
      if (NumericValue <= 9.0)
      {
        double v23 = ceil(NumericValue);
        if (NumericValue >= 0.0 && NumericValue == v23)
        {
          if (v3) {
            UniChar chars = (int)NumericValue + 48;
          }
          CFStringAppendCharacters(Mutable, &chars, 1);
        }
      }
      ++v10;
      --v9;
      ++v11;
    }
    while (Length != v10);
  }
  unsigned int v25 = Mutable;
  CFRelease(v25);

  return v25;
}

- (id)attributedStringToHighlightText:(id)a3
{
  id v4 = a3;
  v5 = +[UIColor secondaryLabelColor];
  v6 = +[UIColor labelColor];
  v7 = [(NSString *)self attributedStringToHighlightText:v4 primaryColour:v5 secondaryColour:v6];

  return v7;
}

- (id)attributedStringToHighlightText:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[UIColor secondaryLabelColor];
  v8 = +[UIColor labelColor];
  uint64_t v9 = [(NSString *)self attributedStringToHighlightText:v6 primaryColour:v7 secondaryColour:v8 style:a4];

  return v9;
}

- (id)attributedStringToHighlightText:(id)a3 primaryColour:(id)a4 secondaryColour:(id)a5
{
  return [(NSString *)self attributedStringToHighlightText:a3 primaryColour:a4 secondaryColour:a5 style:0];
}

- (id)attributedStringToHighlightText:(id)a3 primaryColour:(id)a4 secondaryColour:(id)a5 style:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:self];
  if ([(NSString *)self length])
  {
    NSAttributedStringKey v14 = NSForegroundColorAttributeName;
    [v13 addAttribute:NSForegroundColorAttributeName value:v11 range:0, -[NSString length](self, "length")];
    int64_t v15 = self;
    id v16 = v10;
    unint64_t v17 = a6 - 1;
    if (!v17)
    {
      id v32 = v12;
      id v33 = v10;
      uint64_t v18 = [(NSString *)v15 componentsSeparatedByString:@" "];
      uint64_t v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v20 = v18;
      id v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(v20);
            }
            unsigned int v25 = [*(id *)(*((void *)&v37 + 1) + 8 * i) _encodedDialerStringSkippingUnmappedCharacters:0];
            [v19 addObject:v25];
          }
          id v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v22);
      }

      uint64_t v26 = [v19 componentsJoinedByString:@" "];

      uint64_t v27 = [v16 unformattedNumberInLatin];

      id v16 = (id)v27;
      int64_t v15 = (NSString *)v26;
      id v12 = v32;
      id v10 = v33;
      unint64_t v17 = 0;
      NSAttributedStringKey v14 = NSForegroundColorAttributeName;
    }
    id v28 = [(NSString *)v15 rangeToHighlightText:v16];
    if (v29)
    {
      [v13 addAttribute:v14 value:v12 range:v28];
    }
    else if (v17 < 2 || [v16 isNumeric] && -[NSString isNumeric](v15, "isNumeric"))
    {
      long long v30 = [(NSString *)v15 indexSetToHighlightDigitsInText:v16];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10004A144;
      v34[3] = &unk_1000A28F0;
      id v35 = v13;
      id v36 = v12;
      [v30 enumerateRangesUsingBlock:v34];
    }
  }

  return v13;
}

- (_NSRange)rangeToHighlightText:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    v5 = [(NSString *)self sanitizedString];
    id v6 = [v5 stringByRemovingDiatrics];

    v7 = [v4 sanitizedString];
    v8 = [v7 stringByRemovingDiatrics];

    uint64_t v9 = +[NSRegularExpression escapedPatternForString:v8];
    id v10 = +[NSString stringWithFormat:@"(?:(?<![^\\W_])|(?=[\\W_]))%@", v9];

    if ([v4 length])
    {
      id v11 = [v6 rangeOfString:v10 options:1025];
      NSUInteger v13 = v12;
    }
    else
    {
      NSUInteger v13 = 0;
      id v11 = 0;
    }
  }
  else
  {
    NSUInteger v13 = 0;
    id v11 = 0;
  }

  NSUInteger v14 = (NSUInteger)v11;
  NSUInteger v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (id)indexSetToHighlightDigitsInText:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableIndexSet);
  CFStringRef theString = (CFStringRef)self;
  uint64_t v57 = 0;
  CFIndex Length = CFStringGetLength((CFStringRef)self);
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v55 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  int64_t v59 = 0;
  int64_t v60 = 0;
  v56 = CStringPtr;
  v8 = [v4 unformattedNumber];
  id v9 = (id)CFStringGetLength(v8);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  CFStringRef v39 = v8;
  uint64_t v42 = 0;
  uint64_t v43 = (uint64_t)v9;
  id v10 = CFStringGetCharactersPtr(v8);
  id v11 = 0;
  long long v40 = v10;
  if (!v10) {
    id v11 = CFStringGetCStringPtr(v8, 0x600u);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v47 = 0u;
  int64_t v44 = 0;
  int64_t v45 = 0;
  int64_t v41 = v11;
  if ([(NSString *)self length])
  {
    int64_t v12 = 0;
    char v13 = 0;
    do
    {
      if (v12 < 0 || (CFIndex v14 = Length, Length <= v12))
      {
        UniChar v15 = 0;
      }
      else if (v55)
      {
        UniChar v15 = v55[v57 + v12];
      }
      else if (v56)
      {
        UniChar v15 = v56[v57 + v12];
      }
      else
      {
        if (v60 <= v12 || (int64_t v25 = v59, v59 > v12))
        {
          int64_t v26 = v12 - 4;
          if ((unint64_t)v12 < 4) {
            int64_t v26 = 0;
          }
          if (v26 + 64 < Length) {
            CFIndex v14 = v26 + 64;
          }
          int64_t v59 = v26;
          int64_t v60 = v14;
          v62.location = v57 + v26;
          v62.length = v14 - v26;
          CFStringGetCharacters(theString, v62, buffer);
          int64_t v25 = v59;
        }
        UniChar v15 = buffer[v12 - v25];
      }
      double NumericValue = u_getNumericValue(v15);
      if (NumericValue > 9.0
        || ((double v17 = ceil(NumericValue), NumericValue >= 0.0) ? (v18 = NumericValue == v17) : (v18 = 0), !v18))
      {
        char v13 = 0;
        goto LABEL_32;
      }
      int64_t v19 = (int64_t)[v5 count];
      int64_t v20 = v19;
      if (v19 < 0 || (int64_t v21 = v43, v43 <= v19))
      {
        unsigned __int16 v24 = 0;
      }
      else
      {
        id v22 = v40;
        if (v40)
        {
          int64_t v23 = v42 + v19;
        }
        else
        {
          if (v41)
          {
            unsigned __int16 v24 = v41[v42 + v19];
            goto LABEL_25;
          }
          if (v45 <= v19 || (int64_t v27 = v44, v44 > v19))
          {
            int64_t v28 = v19 - 4;
            if ((unint64_t)v19 < 4) {
              int64_t v28 = 0;
            }
            if (v28 + 64 < v43) {
              int64_t v21 = v28 + 64;
            }
            int64_t v44 = v28;
            int64_t v45 = v21;
            v63.location = v42 + v28;
            v63.length = v21 - v28;
            CFStringGetCharacters(v39, v63, (UniChar *)&v31);
            int64_t v27 = v44;
          }
          int64_t v23 = v20 - v27;
          id v22 = (const UniChar *)&v31;
        }
        unsigned __int16 v24 = v22[v23];
      }
LABEL_25:
      if (v15 == v24)
      {
        if (((v20 == 0) & v13) == 0)
        {
          [v5 addIndex:v12];
          if ([v5 count] == v9)
          {
            id v30 = [v5 copy];
            goto LABEL_55;
          }
        }
LABEL_31:
        char v13 = 1;
        goto LABEL_32;
      }
      if (!v20) {
        goto LABEL_31;
      }
      int64_t v12 = (int64_t)[v5 firstIndex];
      [v5 removeAllIndexes];
LABEL_32:
      ++v12;
    }
    while (v12 < [(NSString *)self length]);
  }
  id v30 = 0;
LABEL_55:

  return v30;
}

- (NSString)sanitizedString
{
  return [(NSString *)self stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
}

- (id)stringByRemovingDiatrics
{
  return [(NSString *)self stringByApplyingTransform:NSStringTransformStripDiacritics reverse:0];
}

- (BOOL)isNumeric
{
  return [(NSString *)self rangeOfString:@"^[\\d\\s\\(\\)\\-\\+]+$" options:1024] != (id)0x7FFFFFFFFFFFFFFFLL;
}

@end