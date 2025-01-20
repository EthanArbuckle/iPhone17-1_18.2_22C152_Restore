@interface PRZhuyinModification
- (BOOL)_shouldAppendLetter:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)producesPartialSyllable;
- (PRZhuyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11;
- (PRZhuyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10;
- (_NSRange)additionalSyllableRange;
- (_NSRange)combinedSyllableRange;
- (_NSRange)range;
- (_NSRange)syllableRange;
- (double)modificationScore;
- (id)description;
- (id)replacementString;
- (unint64_t)hash;
- (unint64_t)modificationType;
- (unint64_t)syllableCountScore;
- (void)dealloc;
@end

@implementation PRZhuyinModification

- (PRZhuyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v16 = a3.length;
  NSUInteger v17 = a3.location;
  uint64_t v23 = [a4 length];
  v24.receiver = self;
  v24.super_class = (Class)PRZhuyinModification;
  v19 = [(PRZhuyinModification *)&v24 init];
  v19->_range.NSUInteger location = v17;
  v19->_range.NSUInteger length = v16;
  v19->_replacementString = (NSString *)[a4 copy];
  v19->_modificationType = a5;
  v19->_syllableRange.NSUInteger location = location;
  v19->_syllableRange.NSUInteger length = length;
  v19->_additionalSyllableRange = a7;
  v19->_modificationScore = a8;
  letters = v19->_letters;
  v19->_syllableCountScore = a9;
  if (a10)
  {
    size_t v21 = length - v16 + v23;
    if (v21 <= 4)
    {
      memmove(v19->_letters, a10, v21);
      letters += v21;
    }
  }
  unsigned __int8 *letters = 0;
  v19->_producesPartialSyllable = a11;
  return v19;
}

- (PRZhuyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10
{
  LOBYTE(v11) = a10;
  return -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, a8, a9, v11);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRZhuyinModification;
  [(PRZhuyinModification *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    BOOL v5 = -[NSString isEqualToString:](self->_replacementString, "isEqualToString:", [a3 replacementString]);
    if (!v5) {
      return v5;
    }
    BOOL v7 = self->_range.location == [a3 range] && self->_range.length == v6;
    if (!v7
      || (unint64_t modificationType = self->_modificationType, modificationType != [a3 modificationType])
      || (double modificationScore = self->_modificationScore, [a3 modificationScore], modificationScore != v10)
      || (unint64_t syllableCountScore = self->_syllableCountScore, syllableCountScore != [a3 syllableCountScore]))
    {
LABEL_20:
      LOBYTE(v5) = 0;
      return v5;
    }
    uint64_t v13 = [a3 syllableRange];
    LOBYTE(v5) = 0;
    if (self->_syllableRange.location == v13 && self->_syllableRange.length == v12)
    {
      p_additionalSyllableRange = &self->_additionalSyllableRange;
      LOBYTE(v5) = p_additionalSyllableRange->location == [a3 additionalSyllableRange]
                && p_additionalSyllableRange->length == v15;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_range.location ^ self->_range.length ^ [(NSString *)self->_replacementString hash];
}

- (id)description
{
  id v28 = [(PRZhuyinModification *)self replacementString];
  unint64_t v3 = [(PRZhuyinModification *)self modificationType];
  NSUInteger v4 = [(PRZhuyinModification *)self range];
  NSUInteger v6 = v5;
  NSUInteger v7 = [(PRZhuyinModification *)self syllableRange];
  NSUInteger v9 = v8;
  NSUInteger v10 = [(PRZhuyinModification *)self additionalSyllableRange];
  NSUInteger v12 = v11;
  [(PRZhuyinModification *)self modificationScore];
  v14 = v13;
  unint64_t v15 = [(PRZhuyinModification *)self syllableCountScore];
  BOOL v16 = [(PRZhuyinModification *)self producesPartialSyllable];
  NSUInteger v17 = NSString;
  v29.NSUInteger location = v4;
  v29.NSUInteger length = v6;
  v18 = NSStringFromRange(v29);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL || v12)
  {
    v31.NSUInteger location = v10;
    v31.NSUInteger length = v12;
    v20 = NSStringFromRange(v31);
    v32.NSUInteger location = v7;
    v32.NSUInteger length = v9;
    unint64_t v26 = v15;
    BOOL v27 = v16;
    unint64_t v25 = (unint64_t)v14;
    uint64_t v23 = v20;
    objc_super v24 = NSStringFromRange(v32);
    unint64_t v22 = v3;
    v19 = @"range %@ -> <%@>, type %lu, syllables %@ %@, score %g, scs %lu, pps %d";
  }
  else
  {
    v30.NSUInteger location = v7;
    v30.NSUInteger length = v9;
    unint64_t v25 = v15;
    unint64_t v26 = v16;
    objc_super v24 = v14;
    unint64_t v22 = v3;
    uint64_t v23 = NSStringFromRange(v30);
    v19 = @"range %@ -> <%@>, type %lu, syllable %@, score %g, scs %lu, pps %d";
  }
  return (id)objc_msgSend(v17, "stringWithFormat:", v19, v18, v28, v22, v23, v24, v25, v26, v27);
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)replacementString
{
  return self->_replacementString;
}

- (unint64_t)modificationType
{
  return self->_modificationType;
}

- (_NSRange)syllableRange
{
  p_syllableRange = &self->_syllableRange;
  NSUInteger location = self->_syllableRange.location;
  NSUInteger length = p_syllableRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)additionalSyllableRange
{
  p_additionalSyllableRange = &self->_additionalSyllableRange;
  NSUInteger location = self->_additionalSyllableRange.location;
  NSUInteger length = p_additionalSyllableRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)combinedSyllableRange
{
  NSRange additionalSyllableRange = self->_additionalSyllableRange;
  BOOL v3 = additionalSyllableRange.location == 0x7FFFFFFFFFFFFFFFLL && additionalSyllableRange.length == 0;
  NSRange syllableRange = self->_syllableRange;
  if (!v3) {
    return NSUnionRange(syllableRange, additionalSyllableRange);
  }
  return syllableRange;
}

- (double)modificationScore
{
  return self->_modificationScore;
}

- (unint64_t)syllableCountScore
{
  return self->_syllableCountScore;
}

- (BOOL)producesPartialSyllable
{
  return self->_producesPartialSyllable;
}

- (BOOL)_shouldAppendLetter:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  letters = self->_letters;
  size_t v5 = strnlen((const char *)self->_letters, 4uLL);
  NSUInteger v10 = 0;
  if (v3 == 39) {
    return 1;
  }
  unint64_t v7 = v5;
  if (v3 > 0xF7 || v3 - 97 < 0x1A || v3 - 223 < 0x18 || (BOOL result = 0, v3 - 154 <= 4) && ((1 << (v3 + 102)) & 0x15) != 0)
  {
    if (v7 > 3)
    {
      return 0;
    }
    else
    {
      letters[v7] = v3;
      NSUInteger v8 = next_zhuyin(letters, v7 + 1, 0, 1, &v10, 0);
      if (v8) {
        BOOL v9 = v10 == &v8[v7 + 1];
      }
      else {
        BOOL v9 = 0;
      }
      BOOL result = v9;
      letters[v7] = 0;
    }
  }
  return result;
}

@end