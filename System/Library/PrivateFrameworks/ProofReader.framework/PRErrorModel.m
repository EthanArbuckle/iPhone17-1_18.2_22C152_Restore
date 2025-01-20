@interface PRErrorModel
- (BOOL)hasCustomInsertionErrorScores;
- (BOOL)hasCustomOmissionErrorScores;
- (BOOL)hasCustomReplacementErrorScores;
- (BOOL)hasCustomTranspositionErrorScores;
- (PRErrorModel)initWithCustomErrorModel:(id)a3;
- (double)errorScoreForType:(unint64_t)a3;
- (double)insertionErrorScoreForIntendedPrecedingCharacter:(unsigned __int16)a3 insertedCharacter:(unsigned __int16)a4 intendedFollowingCharacter:(unsigned __int16)a5;
- (double)omissionErrorScoreForIntendedPrecedingCharacter:(unsigned __int16)a3 omittedCharacter:(unsigned __int16)a4 intendedFollowingCharacter:(unsigned __int16)a5;
- (double)replacementErrorScoreForIntendedCharacter:(unsigned __int16)a3 actualCharacter:(unsigned __int16)a4;
- (double)transpositionErrorScoreForIntendedFirstCharacter:(unsigned __int16)a3 intendedSecondCharacter:(unsigned __int16)a4;
- (void)dealloc;
@end

@implementation PRErrorModel

- (PRErrorModel)initWithCustomErrorModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PRErrorModel;
  v4 = [(PRErrorModel *)&v6 init];
  if (v4) {
    v4->_customErrorModel = (PRErrorModeling *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRErrorModel;
  [(PRErrorModel *)&v3 dealloc];
}

- (double)errorScoreForType:(unint64_t)a3
{
  double result = -5.0;
  if (a3 <= 0xD) {
    return errorScoreForType__errorScores[a3];
  }
  return result;
}

- (BOOL)hasCustomReplacementErrorScores
{
  customErrorModel = self->_customErrorModel;
  if (customErrorModel) {
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  }
  return customErrorModel & 1;
}

- (BOOL)hasCustomTranspositionErrorScores
{
  customErrorModel = self->_customErrorModel;
  if (customErrorModel) {
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  }
  return customErrorModel & 1;
}

- (BOOL)hasCustomInsertionErrorScores
{
  customErrorModel = self->_customErrorModel;
  if (customErrorModel) {
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  }
  return customErrorModel & 1;
}

- (BOOL)hasCustomOmissionErrorScores
{
  customErrorModel = self->_customErrorModel;
  if (customErrorModel) {
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  }
  return customErrorModel & 1;
}

- (double)replacementErrorScoreForIntendedCharacter:(unsigned __int16)a3 actualCharacter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  [(PRErrorModel *)self errorScoreForType:8];
  double v8 = v7;
  if (![(PRErrorModel *)self hasCustomReplacementErrorScores])
  {
    if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
    {
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      if ((v5 - 216) < 7)
      {
LABEL_8:
        LODWORD(v5) = v5 + 32;
        goto LABEL_17;
      }
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      {
LABEL_17:
        if ((v4 - 65) < 0x1A || (v4 - 192) < 0x17)
        {
          if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0) {
            goto LABEL_20;
          }
        }
        else
        {
          if ((v4 - 216) < 7)
          {
LABEL_20:
            LODWORD(v4) = v4 + 32;
            goto LABEL_21;
          }
          if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0)
          {
LABEL_21:
            if ((v5 - 97) <= 0x19 && v4 >= 0x61 && v4 <= 0x7A)
            {
              unint64_t v11 = replacementScores[26 * (v4 - 97) + (v5 - 97)];
              if (v11 >= 2) {
                return v8 + log10((double)v11);
              }
            }
          }
        }
        return v8;
      }
    }
    if (v5 == 159) {
      LODWORD(v5) = 255;
    }
    else {
      LODWORD(v5) = v5 + 16;
    }
    goto LABEL_17;
  }
  customErrorModel = self->_customErrorModel;
  [(PRErrorModeling *)customErrorModel replacementErrorScoreForIntendedCharacter:v5 actualCharacter:v4];
  return result;
}

- (double)transpositionErrorScoreForIntendedFirstCharacter:(unsigned __int16)a3 intendedSecondCharacter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  [(PRErrorModel *)self errorScoreForType:9];
  double v8 = v7;
  if (![(PRErrorModel *)self hasCustomTranspositionErrorScores])
  {
    if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
    {
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      if ((v5 - 216) < 7)
      {
LABEL_8:
        LODWORD(v5) = v5 + 32;
        goto LABEL_17;
      }
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      {
LABEL_17:
        if ((v4 - 65) < 0x1A || (v4 - 192) < 0x17)
        {
          if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0) {
            goto LABEL_20;
          }
        }
        else
        {
          if ((v4 - 216) < 7)
          {
LABEL_20:
            LODWORD(v4) = v4 + 32;
            goto LABEL_21;
          }
          if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0)
          {
LABEL_21:
            if ((v5 - 97) <= 0x19 && v4 >= 0x61 && v4 <= 0x7A)
            {
              unint64_t v11 = transpositionScores[26 * (v4 - 97) + (v5 - 97)];
              if (v11 >= 2) {
                return v8 + log10((double)v11);
              }
            }
          }
        }
        return v8;
      }
    }
    if (v5 == 159) {
      LODWORD(v5) = 255;
    }
    else {
      LODWORD(v5) = v5 + 16;
    }
    goto LABEL_17;
  }
  customErrorModel = self->_customErrorModel;
  [(PRErrorModeling *)customErrorModel transpositionErrorScoreForIntendedFirstCharacter:v5 intendedSecondCharacter:v4];
  return result;
}

- (double)insertionErrorScoreForIntendedPrecedingCharacter:(unsigned __int16)a3 insertedCharacter:(unsigned __int16)a4 intendedFollowingCharacter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  [(PRErrorModel *)self errorScoreForType:11];
  double v10 = v9;
  if (![(PRErrorModel *)self hasCustomInsertionErrorScores]) {
    return v10;
  }
  customErrorModel = self->_customErrorModel;
  [(PRErrorModeling *)customErrorModel insertionErrorScoreForIntendedPrecedingCharacter:v7 insertedCharacter:v6 intendedFollowingCharacter:v5];
  return result;
}

- (double)omissionErrorScoreForIntendedPrecedingCharacter:(unsigned __int16)a3 omittedCharacter:(unsigned __int16)a4 intendedFollowingCharacter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  [(PRErrorModel *)self errorScoreForType:10];
  double v10 = v9;
  if (![(PRErrorModel *)self hasCustomOmissionErrorScores]) {
    return v10;
  }
  customErrorModel = self->_customErrorModel;
  [(PRErrorModeling *)customErrorModel omissionErrorScoreForIntendedPrecedingCharacter:v7 omittedCharacter:v6 intendedFollowingCharacter:v5];
  return result;
}

@end