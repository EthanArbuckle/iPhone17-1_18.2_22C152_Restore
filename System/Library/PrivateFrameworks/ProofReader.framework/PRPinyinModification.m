@interface PRPinyinModification
+ (id)finalModificationsForInputString:(id)a3;
+ (id)modificationsForInputString:(id)a3;
- (BOOL)_shouldAppendLetter:(unsigned __int8)a3 romanization:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporary;
- (BOOL)producesPartialSyllable;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11 isTemporary:(BOOL)a12;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 isTemporary:(BOOL)a8;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10;
- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10 isTemporary:(BOOL)a11;
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

@implementation PRPinyinModification

+ (id)modificationsForInputString:(id)a3
{
  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return [(AppleSpell *)v4 spellServer:0 modificationsForPinyinInputString:a3];
}

+ (id)finalModificationsForInputString:(id)a3
{
  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return [(AppleSpell *)v4 spellServer:0 finalModificationsForPinyinInputString:a3];
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11 isTemporary:(BOOL)a12
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v17 = a3.length;
  NSUInteger v18 = a3.location;
  uint64_t v24 = [a4 length];
  v25.receiver = self;
  v25.super_class = (Class)PRPinyinModification;
  v20 = [(PRPinyinModification *)&v25 init];
  v20->_range.NSUInteger location = v18;
  v20->_range.NSUInteger length = v17;
  v20->_replacementString = (NSString *)[a4 copy];
  v20->_modificationType = a5;
  v20->_syllableRange.NSUInteger location = location;
  v20->_syllableRange.NSUInteger length = length;
  v20->_additionalSyllableRange = a7;
  v20->_modificationScore = a8;
  letters = v20->_letters;
  v20->_syllableCountScore = a9;
  if (a5 != 5)
  {
    if (a10)
    {
      size_t v22 = length - v17 + v24;
      if (v22 <= 6)
      {
        memmove(v20->_letters, a10, v22);
        letters += v22;
      }
    }
  }
  unsigned __int8 *letters = 0;
  v20->_producesPartialSyllable = a11;
  v20->_isTemporary = a12;
  return v20;
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11
{
  LOWORD(v12) = a11;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a8, a7.location, a7.length, a9, a10, v12);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8
{
  LOWORD(v9) = 0;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a8, a7.location, a7.length, 0, 0, v9);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10 isTemporary:(BOOL)a11
{
  LOWORD(v12) = __PAIR16__(a11, a10);
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, a8, a9, v12);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10
{
  LOWORD(v11) = a10;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, a8, a9, v11);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 isTemporary:(BOOL)a8
{
  BYTE1(v9) = a8;
  LOBYTE(v9) = 0;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, v9);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7
{
  LOWORD(v8) = 0;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, v8);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRPinyinModification;
  [(PRPinyinModification *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    uint64_t v25 = v9;
    uint64_t v26 = v5;
    uint64_t v27 = v4;
    uint64_t v28 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_20:
      LOBYTE(v13) = 0;
      return v13;
    }
    int v13 = -[NSString isEqualToString:](self->_replacementString, "isEqualToString:", [a3 replacementString]);
    if (v13)
    {
      if (self->_range.location != [a3 range] || self->_range.length != v14) {
        goto LABEL_20;
      }
      unint64_t modificationType = self->_modificationType;
      if (modificationType != [a3 modificationType]) {
        goto LABEL_20;
      }
      double modificationScore = self->_modificationScore;
      [a3 modificationScore];
      if (modificationScore != v18) {
        goto LABEL_20;
      }
      unint64_t syllableCountScore = self->_syllableCountScore;
      if (syllableCountScore != [a3 syllableCountScore]) {
        goto LABEL_20;
      }
      uint64_t v21 = [a3 syllableRange];
      LOBYTE(v13) = 0;
      if (self->_syllableRange.location == v21 && self->_syllableRange.length == v20)
      {
        uint64_t v23 = [a3 additionalSyllableRange];
        LOBYTE(v13) = 0;
        if (self->_additionalSyllableRange.location == v23 && self->_additionalSyllableRange.length == v22)
        {
          if (!self->_isTemporary) {
            goto LABEL_19;
          }
          int v13 = [a3 isTemporary];
          if (!v13) {
            return v13;
          }
          if (!self->_isTemporary)
          {
LABEL_19:
            if (objc_msgSend(a3, "isTemporary", v10, v25, v6, v26, v27, v28, v7, v8)) {
              goto LABEL_20;
            }
          }
          LOBYTE(v13) = 1;
        }
      }
    }
  }
  return v13;
}

- (unint64_t)hash
{
  return self->_range.location ^ self->_range.length ^ [(NSString *)self->_replacementString hash];
}

- (id)description
{
  id v30 = [(PRPinyinModification *)self replacementString];
  unint64_t v29 = [(PRPinyinModification *)self modificationType];
  NSUInteger v3 = [(PRPinyinModification *)self range];
  NSUInteger v5 = v4;
  NSUInteger v6 = [(PRPinyinModification *)self syllableRange];
  NSUInteger v8 = v7;
  NSUInteger v9 = [(PRPinyinModification *)self additionalSyllableRange];
  NSUInteger v11 = v10;
  [(PRPinyinModification *)self modificationScore];
  int v13 = v12;
  unint64_t v14 = [(PRPinyinModification *)self syllableCountScore];
  BOOL v15 = [(PRPinyinModification *)self producesPartialSyllable];
  BOOL v16 = [(PRPinyinModification *)self isTemporary];
  NSUInteger v17 = NSString;
  v31.NSUInteger location = v3;
  v31.NSUInteger length = v5;
  double v18 = NSStringFromRange(v31);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL || v11)
  {
    v33.NSUInteger location = v9;
    v33.NSUInteger length = v11;
    uint64_t v20 = NSStringFromRange(v33);
    v34.NSUInteger location = v6;
    v34.NSUInteger length = v8;
    BOOL v27 = v15;
    BOOL v28 = v16;
    unint64_t v26 = v14;
    unint64_t v25 = (unint64_t)v13;
    uint64_t v23 = v20;
    uint64_t v24 = NSStringFromRange(v34);
    unint64_t v22 = v29;
    v19 = @"range %@ -> <%@>, type %lu, syllables %@ %@, score %g, scs %lu, pps %d temp %d";
  }
  else
  {
    v32.NSUInteger location = v6;
    v32.NSUInteger length = v8;
    unint64_t v26 = v15;
    BOOL v27 = v16;
    unint64_t v25 = v14;
    uint64_t v24 = v13;
    unint64_t v22 = v29;
    uint64_t v23 = NSStringFromRange(v32);
    v19 = @"range %@ -> <%@>, type %lu, syllable %@, score %g, scs %lu, pps %d temp %d";
  }
  return (id)objc_msgSend(v17, "stringWithFormat:", v19, v18, v30, v22, v23, v24, v25, v26, v27, v28);
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

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (BOOL)_shouldAppendLetter:(unsigned __int8)a3 romanization:(int)a4
{
  unsigned int v5 = a3;
  letters = self->_letters;
  size_t v8 = strnlen((const char *)self->_letters, 6uLL);
  int v13 = 0;
  if (v5 == 39) {
    return 1;
  }
  unint64_t v10 = v8;
  if (v5 > 0xF7 || v5 - 97 < 0x1A || v5 - 223 < 0x18 || (BOOL result = 0, v5 - 154 <= 4) && ((1 << (v5 + 102)) & 0x15) != 0)
  {
    if (v10 > 5 || self->_modificationType == 5)
    {
      return 0;
    }
    else
    {
      letters[v10] = v5;
      NSUInteger v11 = next_pinyin(letters, v10 + 1, a4, 0, &v13, 0);
      if (v11) {
        BOOL v12 = v13 == &v11[v10 + 1];
      }
      else {
        BOOL v12 = 0;
      }
      BOOL result = v12;
      letters[v10] = 0;
    }
  }
  return result;
}

@end