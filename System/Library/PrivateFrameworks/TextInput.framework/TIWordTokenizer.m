@interface TIWordTokenizer
- (TIWordTokenizer)init;
- (_NSRange)advanceToNextToken;
- (_NSRange)rangeOfCurrentToken;
- (id)allTokensForString:(id)a3;
- (void)setString:(id)a3 withSearchRange:(_NSRange)a4;
@end

@implementation TIWordTokenizer

- (_NSRange)advanceToNextToken
{
  if (!self->m_string || (NSUInteger location = self->m_searchRange.location, location == 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v4 = 0;
    self->m_tokenRange = (_NSRange)xmmword_18D2C3CE0;
    goto LABEL_69;
  }
  NSUInteger length = self->m_searchRange.length;
  unint64_t m_bufferOffset = self->m_bufferOffset;
  unint64_t v7 = location - m_bufferOffset;
  if (location - m_bufferOffset >= location - m_bufferOffset + length)
  {
    NSUInteger v4 = 0;
    NSUInteger v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_66;
  }
  CFCharacterSetRef Predefined = 0;
  NSUInteger v41 = location - m_bufferOffset + length;
  uint64_t v8 = 0;
  CFCharacterSetRef theSet = 0;
  p_m_inlineBuffer = &self->m_inlineBuffer;
  unint64_t v10 = m_bufferOffset - location;
  unint64_t v11 = v7 + 64;
  v12 = &self->m_inlineBuffer.buffer[location - m_bufferOffset];
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v15 = v7;
  do
  {
    NSUInteger v16 = v14;
    int64_t v17 = v7 + v8;
    if (v15 >= 4) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = v15;
    }
    if (v17 < 0 || (int64_t v19 = self->m_inlineBuffer.rangeToBuffer.length, v19 <= v17))
    {
      UniChar v21 = 0;
LABEL_14:
      uint64_t v22 = wordRangeInRange_simpleTokenCategories[v21];
      if (v22 == 50) {
        goto LABEL_37;
      }
      if (v22 == 49) {
        goto LABEL_51;
      }
      if (v22 != 48) {
        goto LABEL_41;
      }
      goto LABEL_30;
    }
    directUniCharBuffer = self->m_inlineBuffer.directUniCharBuffer;
    if (directUniCharBuffer)
    {
      UniChar v21 = directUniCharBuffer[v7 + v8 + self->m_inlineBuffer.rangeToBuffer.location];
    }
    else
    {
      directCStringBuffer = self->m_inlineBuffer.directCStringBuffer;
      if (directCStringBuffer)
      {
        UniChar v21 = directCStringBuffer[self->m_inlineBuffer.rangeToBuffer.location + v7 + v8];
      }
      else
      {
        if (self->m_inlineBuffer.bufferedRangeEnd <= v17
          || (int64_t bufferedRangeStart = self->m_inlineBuffer.bufferedRangeStart, bufferedRangeStart > v17))
        {
          unint64_t v25 = v18 + v10;
          int64_t v26 = v11 - v18;
          v43 = v12;
          NSUInteger v45 = length;
          uint64_t v27 = -v18;
          int64_t v28 = v8 + v7 - v18;
          int64_t v29 = v28 + 64;
          if (v28 + 64 >= v19) {
            int64_t v29 = self->m_inlineBuffer.rangeToBuffer.length;
          }
          self->m_inlineBuffer.int64_t bufferedRangeStart = v28;
          self->m_inlineBuffer.bufferedRangeEnd = v29;
          if (v19 >= v26) {
            int64_t v19 = v26;
          }
          v48.NSUInteger length = v19 + v25;
          v30 = p_m_inlineBuffer;
          v48.NSUInteger location = v7 + v8 + v27 + self->m_inlineBuffer.rangeToBuffer.location;
          CFStringGetCharacters(self->m_inlineBuffer.theString, v48, p_m_inlineBuffer->buffer);
          v12 = v43;
          NSUInteger length = v45;
          p_m_inlineBuffer = v30;
          int64_t bufferedRangeStart = self->m_inlineBuffer.bufferedRangeStart;
        }
        UniChar v21 = v12[v8 - bufferedRangeStart];
      }
    }
    if (v21 < 0x100u) {
      goto LABEL_14;
    }
    if ((unsigned __int16)(v21 >> 3) <= 0x404u)
    {
      unsigned int v31 = v21 - 8216;
      BOOL v32 = v31 > 0xF;
      int v33 = (1 << v31) & 0x9003;
      if (!v32 && v33 != 0)
      {
LABEL_37:
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_62:
          NSUInteger v4 = v13 - v16;
          goto LABEL_66;
        }
        if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v13 = v7 + v8;
        }
LABEL_41:
        uint64_t v14 = v16;
        goto LABEL_54;
      }
      if ((unsigned __int16)(v21 - 1024) < 0x82u || (unsigned __int16)(v21 - 1162) < 0x76u) {
        goto LABEL_51;
      }
      if ((unsigned __int16)(v21 - 1155) < 7u) {
        goto LABEL_41;
      }
      v44 = v12;
      NSUInteger v46 = length;
      v39 = p_m_inlineBuffer;
      if (!theSet) {
        CFCharacterSetRef theSet = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      }
      if (!Predefined) {
        CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
      }
      if (CFCharacterSetIsCharacterMember(theSet, v21))
      {
        v12 = v44;
        NSUInteger length = v46;
        p_m_inlineBuffer = v39;
LABEL_51:
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v14 = v7 + v8;
        }
        else {
          uint64_t v14 = v16;
        }
        goto LABEL_54;
      }
      int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v21);
      v12 = v44;
      NSUInteger length = v46;
      p_m_inlineBuffer = v39;
      if (IsCharacterMember) {
        goto LABEL_41;
      }
    }
LABEL_30:
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_62;
    }
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v4 = v17 - v16;
      goto LABEL_66;
    }
LABEL_54:
    ++v15;
    ++v8;
    --v10;
    ++v11;
  }
  while (length != v8);
  NSUInteger v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v4 = 0;
      goto LABEL_66;
    }
    NSUInteger v4 = v41 - v14;
  }
  else
  {
    NSUInteger v4 = v13 - v14;
  }
  NSUInteger v16 = v14;
LABEL_66:
  self->m_tokenRange.NSUInteger location = v16;
  self->m_tokenRange.NSUInteger length = v4;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL
    || (v36 = self->m_bufferOffset + v16, self->m_tokenRange.NSUInteger location = v36, v36 == 0x7FFFFFFFFFFFFFFFLL))
  {
    self->m_searchRange = (_NSRange)xmmword_18D2C3CE0;
LABEL_69:
    NSUInteger v36 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v37 = self->m_searchRange.length + self->m_searchRange.location;
    BOOL v32 = v37 > v36 + v4;
    NSUInteger v38 = v37 - (v36 + v4);
    if (v32)
    {
      self->m_searchRange.NSUInteger location = v36 + v4;
      self->m_searchRange.NSUInteger length = v38;
    }
    else
    {
      self->m_searchRange = (_NSRange)xmmword_18D2C3CE0;
    }
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = v36;
  return result;
}

- (void)setString:(id)a3 withSearchRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  unint64_t location = a4.location;
  id v17 = a3;
  if (!v17)
  {
    m_string = self->m_string;
    self->m_string = 0;

    _NSRange v12 = (_NSRange)xmmword_18D2C3CE0;
    self->m_tokenRange = (_NSRange)xmmword_18D2C3CE0;
LABEL_7:
    self->m_searchRange = v12;
    goto LABEL_8;
  }
  unint64_t v7 = (NSString *)[[NSString alloc] initWithString:v17];
  uint64_t v8 = self->m_string;
  self->m_string = v7;

  self->m_tokenRange = (_NSRange)xmmword_18D2C3CE0;
  if (location >= [v17 length])
  {
    _NSRange v12 = (_NSRange)xmmword_18D2C3CE0;
    goto LABEL_7;
  }
  self->m_searchRange.unint64_t location = location;
  self->m_searchRange.NSUInteger length = length;
  if (location + length <= [v17 length])
  {
    NSUInteger v10 = self->m_searchRange.location;
  }
  else
  {
    uint64_t v9 = [v17 length];
    NSUInteger v10 = self->m_searchRange.location;
    self->m_searchRange.NSUInteger length = v9 - v10;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = (__CFString *)self->m_string;
    NSUInteger v14 = self->m_searchRange.length;
    self->m_inlineBuffer.theString = v13;
    self->m_inlineBuffer.rangeToBuffer.unint64_t location = v10;
    self->m_inlineBuffer.rangeToBuffer.NSUInteger length = v14;
    CharactersPtr = (unsigned __int16 *)CFStringGetCharactersPtr(v13);
    self->m_inlineBuffer.directUniCharBuffer = CharactersPtr;
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = (char *)CFStringGetCStringPtr(v13, 0x600u);
    }
    self->m_inlineBuffer.directCStringBuffer = CStringPtr;
    self->m_inlineBuffer.int64_t bufferedRangeStart = 0;
    self->m_inlineBuffer.bufferedRangeEnd = 0;
    self->unint64_t m_bufferOffset = self->m_searchRange.location;
  }
LABEL_8:

  MEMORY[0x1F41817F8]();
}

- (TIWordTokenizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIWordTokenizer;
  v2 = [(TIWordTokenizer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    m_string = v2->m_string;
    v2->m_string = 0;

    v3->m_tokenRange = (_NSRange)xmmword_18D2C3CE0;
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (id)allTokensForString:(id)a3
{
  id v4 = a3;
  -[TIWordTokenizer setString:withSearchRange:](self, "setString:withSearchRange:", v4, 0, [v4 length]);
  v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(TIWordTokenizer *)self advanceToNextToken];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [(TIWordTokenizer *)self advanceToNextToken])
    {
      uint64_t v9 = objc_msgSend(v4, "substringWithRange:", i, v7);
      [v5 addObject:v9];
    }
  }

  return v5;
}

- (_NSRange)rangeOfCurrentToken
{
  NSUInteger length = self->m_tokenRange.length;
  NSUInteger location = self->m_tokenRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end