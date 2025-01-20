@interface NSString(SCROBrailleAdditions)
- (id)_illegalCharacterSet;
- (id)_legalWhiteSpaceSet;
- (uint64_t)_rangeIsolatingIllegalCharacters:()SCROBrailleAdditions forwards:;
- (uint64_t)rangeOfWordAfterWordAtIndex:()SCROBrailleAdditions;
- (uint64_t)rangeOfWordBeforeWordAtIndex:()SCROBrailleAdditions;
- (uint64_t)rangeOfWordContainingIndex:()SCROBrailleAdditions;
@end

@implementation NSString(SCROBrailleAdditions)

- (id)_illegalCharacterSet
{
  if (_illegalCharacterSet_onceToken != -1) {
    dispatch_once(&_illegalCharacterSet_onceToken, &__block_literal_global);
  }
  v0 = (void *)_illegalCharacterSet___illegalCharacterSet;

  return v0;
}

- (id)_legalWhiteSpaceSet
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NSString_SCROBrailleAdditions___legalWhiteSpaceSet__block_invoke;
  block[3] = &unk_264414590;
  block[4] = a1;
  if (_legalWhiteSpaceSet_onceToken != -1) {
    dispatch_once(&_legalWhiteSpaceSet_onceToken, block);
  }
  return (id)_legalWhiteSpaceSet___legalWhiteSpaceSet;
}

- (uint64_t)_rangeIsolatingIllegalCharacters:()SCROBrailleAdditions forwards:
{
  uint64_t v6 = a3;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
  {
    v10 = [a1 _illegalCharacterSet];
    if (a5) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 4;
    }
    uint64_t v12 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v10, v11, v6, a4);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
      return v12;
    }
  }
  return v6;
}

- (uint64_t)rangeOfWordContainingIndex:()SCROBrailleAdditions
{
  unint64_t v5 = [a1 length];
  if (v5)
  {
    uint64_t v6 = [a1 _legalWhiteSpaceSet];
    uint64_t v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a3, v5 - a3);
    uint64_t v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 4, 0, a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v8 + v9;
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v11 = v5;
    }
    else {
      unint64_t v11 = v7;
    }
    if (v7 == a3)
    {
      if (a3 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = a3;
      }
      uint64_t v13 = v12 - 1;
      if (v10 >= v13) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = v10;
      }
      if (a3 != v14 || v14 >= v5) {
        a3 = objc_msgSend(a1, "_rangeIsolatingIllegalCharacters:forwards:");
      }
      goto LABEL_38;
    }
    if (v10 == v11 && v10 >= 1)
    {
      a3 = v10 - 1;
LABEL_38:

      return a3;
    }
    v16 = [a1 _illegalCharacterSet];
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != a3)
    {
      uint64_t v18 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v16, 0, a3, v11 - a3);
      uint64_t v17 = a3;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18 == a3)
        {
LABEL_37:

          goto LABEL_38;
        }
        uint64_t v17 = a3;
      }
    }
    if (a3 == v10
      || (uint64_t v19 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v16, 4, v10, a3 - v10),
          v19 != 0x7FFFFFFFFFFFFFFFLL)
      && (uint64_t v10 = v19 + v20, a3 == v19 + v20))
    {
      a3 = v17;
    }
    else if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = v17;
    }
    else
    {
      a3 = v10;
    }
    goto LABEL_37;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)rangeOfWordBeforeWordAtIndex:()SCROBrailleAdditions
{
  if (![(__CFString *)a1 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v6 = [(__CFString *)a1 _legalWhiteSpaceSet];
  CFIndex v7 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && Length >= a3)
  {
    uint64_t v9 = -[__CFString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v6, 4, 0, a3);
    uint64_t v11 = v9 + v10;
    CFIndex v12 = a3 - (v9 + v10);
    if (a3 == v9 + v10)
    {
      CFIndex v12 = v10;
      uint64_t v11 = v9;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      CFIndex v7 = a3;
    }
    else {
      CFIndex v7 = v12;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v11;
    }
  }
  uint64_t v13 = -[__CFString _rangeIsolatingIllegalCharacters:forwards:](a1, "_rangeIsolatingIllegalCharacters:forwards:", v8, v7, 0);

  return v13;
}

- (uint64_t)rangeOfWordAfterWordAtIndex:()SCROBrailleAdditions
{
  if ([(__CFString *)a1 length] <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v6 = [(__CFString *)a1 _legalWhiteSpaceSet];
  unint64_t v7 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && Length >= (uint64_t)a3)
  {
    uint64_t v9 = -[__CFString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a3, [(__CFString *)a1 length] - a3);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = [(__CFString *)a1 length] - a3;
    }
    else if (v9 == a3)
    {
      unint64_t v7 = v10;
    }
    else
    {
      unint64_t v7 = v9 - a3;
    }
    uint64_t v8 = a3;
  }
  uint64_t v12 = -[__CFString _rangeIsolatingIllegalCharacters:forwards:](a1, "_rangeIsolatingIllegalCharacters:forwards:", v8, v7, 1);

  return v12;
}

@end