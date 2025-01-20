@interface MCSyntheticInput
- (BOOL)includeSuffixAsSearchString;
- (BOOL)useSubInputsAsSearchString;
- (MCSyntheticInput)init;
- (MCSyntheticInput)initWithCommittedText:(id)a3 syllables:(id)a4;
- (MCSyntheticInput)initWithCommittedText:(id)a3 syllables:(id)a4 useSubInputsAsSearchString:(BOOL)a5;
- (MCSyntheticInput)syntheticInputWithCommittedText:(id)a3 syllables:(id)a4;
- (MCSyntheticInput)syntheticInputWithCursorIndex:(unint64_t)a3;
- (NSArray)syllables;
- (NSString)committedText;
- (NSString)text;
- (NSString)uncommittedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)externalSuffix:(id)a3;
- (id)shortDescriptionExcludingSubInputs;
- (int)syllableIndex:(int *)a3;
- (unint64_t)cursorIndex;
- (void)setIncludeSuffixAsSearchString:(BOOL)a3;
- (void)setUseSubInputsAsSearchString:(BOOL)a3;
@end

@implementation MCSyntheticInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syllables, 0);

  objc_storeStrong((id *)&self->_committedText, 0);
}

- (void)setUseSubInputsAsSearchString:(BOOL)a3
{
  self->_useSubInputsAsSearchString = a3;
}

- (BOOL)useSubInputsAsSearchString
{
  return self->_useSubInputsAsSearchString;
}

- (void)setIncludeSuffixAsSearchString:(BOOL)a3
{
  self->_includeSuffixAsSearchString = a3;
}

- (BOOL)includeSuffixAsSearchString
{
  return self->_includeSuffixAsSearchString;
}

- (unint64_t)cursorIndex
{
  return self->_cursorIndex;
}

- (NSArray)syllables
{
  return self->_syllables;
}

- (NSString)committedText
{
  return self->_committedText;
}

- (id)externalSuffix:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  int v29 = 0;
  unint64_t v6 = [(MCSyntheticInput *)self cursorIndex];
  v7 = [(MCSyntheticInput *)self committedText];
  unint64_t v8 = [v7 length];

  if (v6 <= v8)
  {
    v10 = [(MCSyntheticInput *)self committedText];
    v11 = objc_msgSend(v10, "substringFromIndex:", -[MCSyntheticInput cursorIndex](self, "cursorIndex"));

    [v5 appendString:v11];
    unsigned int v9 = 0;
  }
  else
  {
    unsigned int v9 = [(MCSyntheticInput *)self syllableIndex:&v29];
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_15;
    }
  }
  v12 = [(MCSyntheticInput *)self syllables];
  unint64_t v13 = [v12 count];

  if (v13 > v9)
  {
    unint64_t v14 = v9;
    v15 = [(MCSyntheticInput *)self syllables];
    unint64_t v16 = [v15 count];

    if (v16 > v14)
    {
      unint64_t v17 = v14;
      do
      {
        if ((uint64_t)v17 > (uint64_t)v14) {
          [v5 appendString:v4];
        }
        unint64_t v18 = v29;
        if (v29 >= 1
          && ([(MCSyntheticInput *)self syllables],
              v19 = objc_claimAutoreleasedReturnValue(),
              [v19 objectAtIndexedSubscript:v17],
              v20 = objc_claimAutoreleasedReturnValue(),
              unint64_t v21 = [v20 length],
              v20,
              v19,
              v21 >= v18))
        {
          v24 = [(MCSyntheticInput *)self syllables];
          v25 = [v24 objectAtIndexedSubscript:v17];
          v22 = [v25 substringFromIndex:v29];

          [v5 appendString:v22];
          int v29 = 0;
        }
        else
        {
          v22 = [(MCSyntheticInput *)self syllables];
          v23 = [v22 objectAtIndexedSubscript:v17];
          [v5 appendString:v23];
        }
        ++v17;
        v26 = [(MCSyntheticInput *)self syllables];
        unint64_t v27 = [v26 count];
      }
      while (v27 > v17);
    }
  }
LABEL_15:

  return v5;
}

- (int)syllableIndex:(int *)a3
{
  unint64_t v5 = [(MCSyntheticInput *)self cursorIndex];
  unint64_t v6 = [(MCSyntheticInput *)self committedText];
  unint64_t v7 = [v6 length];

  if (v5 <= v7) {
    goto LABEL_6;
  }
  unint64_t v8 = [(MCSyntheticInput *)self committedText];
  int v9 = [v8 length];

  v10 = [(MCSyntheticInput *)self syllables];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    while (1)
    {
      unint64_t v13 = [(MCSyntheticInput *)self syllables];
      unint64_t v14 = [v13 objectAtIndexedSubscript:v12];
      unint64_t v15 = [v14 length] + v9;
      unint64_t v16 = [(MCSyntheticInput *)self cursorIndex];

      if (v15 >= v16) {
        break;
      }
      unint64_t v17 = [(MCSyntheticInput *)self syllables];
      unint64_t v18 = [v17 objectAtIndexedSubscript:v12];
      v9 += [v18 length];

      ++v12;
      v19 = [(MCSyntheticInput *)self syllables];
      unint64_t v20 = [v19 count];

      if (v20 <= v12) {
        goto LABEL_6;
      }
    }
    if (!a3 || [(MCSyntheticInput *)self cursorIndex] <= v9) {
      return v12;
    }
    int result = [(MCSyntheticInput *)self cursorIndex] - v9;
  }
  else
  {
LABEL_6:
    int result = -1;
    LODWORD(v12) = -1;
    if (!a3) {
      return result;
    }
  }
  *a3 = result;
  return v12;
}

- (NSString)text
{
  v3 = [(MCSyntheticInput *)self committedText];
  id v4 = [(MCSyntheticInput *)self uncommittedText];
  unint64_t v5 = [v3 stringByAppendingString:v4];

  return (NSString *)v5;
}

- (NSString)uncommittedText
{
  v2 = [(MCSyntheticInput *)self syllables];
  v3 = [v2 componentsJoinedByString:&stru_1F3F7A998];

  return (NSString *)v3;
}

- (MCSyntheticInput)syntheticInputWithCursorIndex:(unint64_t)a3
{
  unint64_t v5 = [(MCSyntheticInput *)self text];
  unint64_t v6 = [v5 length];

  unint64_t v7 = (void *)[(MCSyntheticInput *)self copy];
  unint64_t v8 = v7;
  if (v7)
  {
    if (v6 >= a3) {
      unint64_t v9 = a3;
    }
    else {
      unint64_t v9 = v6;
    }
    v7[7] = v9;
    v10 = v7;
  }
  else
  {
    v10 = objc_alloc_init(MCSyntheticInput);
  }
  uint64_t v11 = v10;

  return v11;
}

- (MCSyntheticInput)syntheticInputWithCommittedText:(id)a3 syllables:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)[(MCSyntheticInput *)self copy];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[5];
    v8[5] = v9;

    uint64_t v11 = [v7 copy];
    unint64_t v12 = (void *)v8[6];
    v8[6] = v11;

    unint64_t v13 = [v8 text];
    v8[7] = [v13 length];

    unint64_t v14 = v8;
  }
  else
  {
    unint64_t v14 = objc_alloc_init(MCSyntheticInput);
  }
  unint64_t v15 = v14;

  return v15;
}

- (id)shortDescriptionExcludingSubInputs
{
  v3 = NSString;
  id v4 = [(MCSyntheticInput *)self text];
  unint64_t v5 = [v3 stringWithFormat:@"\"%@\" inputIndex=%lu", v4, -[MCSyntheticInput cursorIndex](self, "cursorIndex")];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MCSyntheticInput;
  unint64_t v5 = -[MCKeyboardInput copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_committedText copyWithZone:a3];
    id v7 = (void *)v5[5];
    v5[5] = v6;

    uint64_t v8 = [(NSArray *)self->_syllables copyWithZone:a3];
    uint64_t v9 = (void *)v5[6];
    v5[6] = v8;

    v5[7] = self->_cursorIndex;
    *((unsigned char *)v5 + 32) = self->_includeSuffixAsSearchString;
    *((unsigned char *)v5 + 33) = self->_useSubInputsAsSearchString;
  }
  return v5;
}

- (MCSyntheticInput)initWithCommittedText:(id)a3 syllables:(id)a4 useSubInputsAsSearchString:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCSyntheticInput;
  v10 = [(MCKeyboardInput *)&v15 init];
  if (v10)
  {
    if (v8) {
      objc_super v11 = (__CFString *)[v8 copy];
    }
    else {
      objc_super v11 = &stru_1F3F7A998;
    }
    objc_storeStrong((id *)&v10->_committedText, v11);
    if (v8) {

    }
    if (v9) {
      unint64_t v12 = (void *)[v9 copy];
    }
    else {
      unint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v10->_syllables, v12);
    if (v9) {

    }
    unint64_t v13 = [(MCSyntheticInput *)v10 text];
    v10->_cursorIndex = [v13 length];

    v10->_includeSuffixAsSearchString = 0;
    v10->_useSubInputsAsSearchString = a5;
  }

  return v10;
}

- (MCSyntheticInput)initWithCommittedText:(id)a3 syllables:(id)a4
{
  return [(MCSyntheticInput *)self initWithCommittedText:a3 syllables:a4 useSubInputsAsSearchString:0];
}

- (MCSyntheticInput)init
{
  return [(MCSyntheticInput *)self initWithCommittedText:&stru_1F3F7A998 syllables:MEMORY[0x1E4F1CBF0]];
}

@end