@interface CRFormAnnotatedField
- (CRFormAnnotatedField)initWithQuad:(id)a3 type:(unint64_t)a4 source:(unint64_t)a5 value:(id)a6 contentType:(unint64_t)a7 maxCharacterCount:(unint64_t)a8;
- (CRNormalizedQuad)boundingQuad;
- (CRNormalizedQuad)originalQuad;
- (NSString)fieldValue;
- (double)suggestedLineHeight;
- (unint64_t)fieldSource;
- (unint64_t)fieldType;
- (unint64_t)layoutDirection;
- (unint64_t)maxCharacterCount;
- (unint64_t)textContentType;
- (void)setBoundingQuad:(id)a3;
- (void)setFieldSource:(unint64_t)a3;
- (void)setFieldType:(unint64_t)a3;
- (void)setFieldValue:(id)a3;
- (void)setMaxCharacterCount:(unint64_t)a3;
- (void)setOriginalQuad:(id)a3;
- (void)setSuggestedLineHeight:(double)a3;
- (void)setTextContentType:(unint64_t)a3;
@end

@implementation CRFormAnnotatedField

- (CRFormAnnotatedField)initWithQuad:(id)a3 type:(unint64_t)a4 source:(unint64_t)a5 value:(id)a6 contentType:(unint64_t)a7 maxCharacterCount:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRFormAnnotatedField;
  v17 = [(CRFormAnnotatedField *)&v21 init];
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
    v18->_suggestedLineHeight = 0.0;
  }

  return v18;
}

- (unint64_t)layoutDirection
{
  return self->layoutDirection;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBoundingQuad:(id)a3
{
}

- (CRNormalizedQuad)originalQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
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
  return (NSString *)objc_getProperty(self, a2, 48, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_originalQuad, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end