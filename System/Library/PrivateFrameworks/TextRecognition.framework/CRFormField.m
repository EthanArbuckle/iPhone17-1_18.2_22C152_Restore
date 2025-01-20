@interface CRFormField
- (BOOL)hasBoundedHeight;
- (BOOL)hasBoundedWidth;
- (BOOL)hasMoved;
- (BOOL)isEqual:(id)a3;
- (CRFormField)initWithQuad:(id)a3 type:(unint64_t)a4 source:(unint64_t)a5 value:(id)a6 contentType:(unint64_t)a7 maxCharacterCount:(unint64_t)a8;
- (CRFormFieldProviding)originalField;
- (CRNormalizedQuad)boundingQuad;
- (CRNormalizedQuad)originalQuad;
- (NSString)fieldValue;
- (double)suggestedLineHeight;
- (unint64_t)fieldSource;
- (unint64_t)fieldType;
- (unint64_t)layoutDirection;
- (unint64_t)maxCharacterCount;
- (unint64_t)textContentType;
- (void)setFieldSource:(unint64_t)a3;
- (void)setFieldType:(unint64_t)a3;
- (void)setFieldValue:(id)a3;
- (void)setHasBoundedHeight:(BOOL)a3;
- (void)setHasBoundedWidth:(BOOL)a3;
- (void)setMaxCharacterCount:(unint64_t)a3;
- (void)setOriginalField:(id)a3;
- (void)setOriginalQuad:(id)a3;
- (void)setSuggestedLineHeight:(double)a3;
- (void)setTextContentType:(unint64_t)a3;
@end

@implementation CRFormField

- (CRFormField)initWithQuad:(id)a3 type:(unint64_t)a4 source:(unint64_t)a5 value:(id)a6 contentType:(unint64_t)a7 maxCharacterCount:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRFormField;
  v17 = [(CRFormField *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_boundingQuad, a3);
    originalQuad = v18->_originalQuad;
    v18->_originalQuad = 0;

    v18->_fieldType = a4;
    v18->_fieldSource = a5;
    objc_storeStrong((id *)&v18->_fieldValue, a6);
    v18->_maxCharacterCount = a8;
    v18->_textContentType = a7;
    originalField = v18->_originalField;
    v18->_suggestedLineHeight = 0.0;
    v18->_originalField = 0;
    *(_WORD *)&v18->_hasBoundedWidth = 0;
  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRFormField *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CRFormField *)self boundingQuad];
      v7 = [(CRFormField *)v5 boundingQuad];
      int v8 = [v6 isEqual:v7];

      if (!v8) {
        goto LABEL_10;
      }
      v9 = [(CRFormField *)self originalQuad];
      v10 = [(CRFormField *)v5 originalQuad];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_10;
      }
      unint64_t v12 = [(CRFormField *)self fieldType];
      if (v12 == [(CRFormField *)v5 fieldType]
        && (unint64_t v13 = [(CRFormField *)self fieldSource], v13 == [(CRFormField *)v5 fieldSource])
        && (unint64_t v14 = [(CRFormField *)self textContentType],
            v14 == [(CRFormField *)v5 textContentType])
        && (unint64_t v15 = [(CRFormField *)self maxCharacterCount],
            v15 == [(CRFormField *)v5 maxCharacterCount])
        && ([(CRFormField *)self suggestedLineHeight],
            double v17 = v16,
            [(CRFormField *)v5 suggestedLineHeight],
            v17 == v18))
      {
        v21 = [(CRFormField *)self fieldValue];
        objc_super v22 = [(CRFormField *)v5 fieldValue];
        char v19 = [v21 isEqualToString:v22];
      }
      else
      {
LABEL_10:
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

- (BOOL)hasMoved
{
  v3 = [(CRFormField *)self originalQuad];
  if (v3)
  {
    v4 = [(CRFormField *)self originalQuad];
    v5 = [(CRFormField *)self boundingQuad];
    int v6 = [v4 isEqual:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)layoutDirection
{
  return self->layoutDirection;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (CRNormalizedQuad)originalQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOriginalQuad:(id)a3
{
}

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (unint64_t)fieldSource
{
  return self->_fieldSource;
}

- (void)setFieldSource:(unint64_t)a3
{
  self->_fieldSource = a3;
}

- (NSString)fieldValue
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFieldValue:(id)a3
{
}

- (unint64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (void)setMaxCharacterCount:(unint64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (unint64_t)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(unint64_t)a3
{
  self->_textContentType = a3;
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (BOOL)hasBoundedWidth
{
  return self->_hasBoundedWidth;
}

- (void)setHasBoundedWidth:(BOOL)a3
{
  self->_hasBoundedWidth = a3;
}

- (BOOL)hasBoundedHeight
{
  return self->_hasBoundedHeight;
}

- (void)setHasBoundedHeight:(BOOL)a3
{
  self->_hasBoundedHeight = a3;
}

- (CRFormFieldProviding)originalField
{
  return (CRFormFieldProviding *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOriginalField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalField, 0);
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_originalQuad, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end