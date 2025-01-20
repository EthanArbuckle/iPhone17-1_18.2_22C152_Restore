@interface CRFormTextFieldOutputRegion
- (BOOL)autofillNewContextStart;
- (BOOL)isEqual:(id)a3;
- (CRFormTextFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CRFormTextFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 contentType:(unint64_t)a6 source:(unint64_t)a7;
- (CRFormTextFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 contentType:(unint64_t)a6 source:(unint64_t)a7 hasBoundedWidth:(BOOL)a8 hasBoundedHeight:(BOOL)a9;
- (NSString)textContentTypeString;
- (double)suggestedLineHeight;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (unint64_t)fieldType;
- (unint64_t)maxCharacterCount;
- (unint64_t)textContentType;
- (void)setAutofillNewContextStart:(BOOL)a3;
- (void)setMaxCharacterCount:(unint64_t)a3;
- (void)setSuggestedLineHeight:(double)a3;
- (void)setTextContentType:(unint64_t)a3;
@end

@implementation CRFormTextFieldOutputRegion

- (CRFormTextFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 contentType:(unint64_t)a6 source:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  LOBYTE(v17) = 0;
  v15 = [[CRFormTextFieldOutputRegion alloc] initWithQuad:v14 labelRegion:v13 subFields:v12 contentType:a6 source:a7 hasBoundedWidth:0 hasBoundedHeight:v17];

  return v15;
}

- (CRFormTextFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 contentType:(unint64_t)a6 source:(unint64_t)a7 hasBoundedWidth:(BOOL)a8 hasBoundedHeight:(BOOL)a9
{
  BOOL v9 = a8;
  v14.receiver = self;
  v14.super_class = (Class)CRFormTextFieldOutputRegion;
  v11 = [(CRFormFieldOutputRegion *)&v14 initWithQuad:a3 labelRegion:a4 subFields:a5 source:a7];
  id v12 = v11;
  if (v11)
  {
    v11->_maxCharacterCount = -1;
    v11->_textContentType = a6;
    v11->_suggestedLineHeight = 0.0;
    [(CRFormFieldOutputRegion *)v11 setHasBoundedWidth:v9];
    [(CRFormFieldOutputRegion *)v12 setHasBoundedHeight:a9];
    v12->_autofillNewContextStart = 1;
  }
  return v12;
}

- (unint64_t)fieldType
{
  return 1;
}

- (NSString)textContentTypeString
{
  unint64_t v2 = [(CRFormTextFieldOutputRegion *)self textContentType];
  return (NSString *)+[CRFormContentTypeUtilities stringFromContentType:v2];
}

- (void)setMaxCharacterCount:(unint64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (void)setTextContentType:(unint64_t)a3
{
  self->_textContentType = a3;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (void)setAutofillNewContextStart:(BOOL)a3
{
  self->_autofillNewContextStart = a3;
}

- (CRFormTextFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRFormTextFieldOutputRegion;
  BOOL v9 = [(CRFormFieldOutputRegion *)&v14 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    unint64_t v10 = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
    if (v10)
    {
      unint64_t v11 = v10;
      v9->_maxCharacterCount = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
      v9->_textContentType = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
      if (v11 != 1)
      {
        +[CRCodingUtilities cgFloatFromEncodingData:v8 offset:a5];
        v9->_suggestedLineHeight = v12;
        if (v11 >= 3)
        {
          v9->_autofillNewContextStart = +[CRCodingUtilities BOOLFromEncodingData:v8 offset:a5];
          if (v11 != 3)
          {
            [(CRFormFieldOutputRegion *)v9 setHasBoundedWidth:+[CRCodingUtilities BOOLFromEncodingData:v8 offset:a5]];
            [(CRFormFieldOutputRegion *)v9 setHasBoundedHeight:+[CRCodingUtilities BOOLFromEncodingData:v8 offset:a5]];
          }
        }
      }
    }
  }

  return v9;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v7.receiver = self;
  v7.super_class = (Class)CRFormTextFieldOutputRegion;
  v4 = [(CRFormFieldOutputRegion *)&v7 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendUInteger:4 toData:v5];
  +[CRCodingUtilities appendUInteger:self->_maxCharacterCount toData:v5];
  +[CRCodingUtilities appendUInteger:self->_textContentType toData:v5];
  +[CRCodingUtilities appendCGFloat:v5 toData:self->_suggestedLineHeight];
  +[CRCodingUtilities appendBool:self->_autofillNewContextStart toData:v5];
  +[CRCodingUtilities appendBool:[(CRFormFieldOutputRegion *)self hasBoundedWidth] toData:v5];
  +[CRCodingUtilities appendBool:[(CRFormFieldOutputRegion *)self hasBoundedHeight] toData:v5];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)CRFormTextFieldOutputRegion;
  id v7 = [(CRFormFieldOutputRegion *)&v9 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  objc_msgSend(v7, "setMaxCharacterCount:", -[CRFormTextFieldOutputRegion maxCharacterCount](self, "maxCharacterCount"));
  objc_msgSend(v7, "setTextContentType:", -[CRFormTextFieldOutputRegion textContentType](self, "textContentType"));
  [(CRFormTextFieldOutputRegion *)self suggestedLineHeight];
  objc_msgSend(v7, "setSuggestedLineHeight:");
  objc_msgSend(v7, "setAutofillNewContextStart:", -[CRFormTextFieldOutputRegion autofillNewContextStart](self, "autofillNewContextStart"));
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRFormTextFieldOutputRegion;
  if ([(CRFormFieldOutputRegion *)&v14 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t v6 = [(CRFormTextFieldOutputRegion *)self textContentType];
    if (v6 == [v5 textContentType]
      && (unint64_t v7 = [(CRFormTextFieldOutputRegion *)self maxCharacterCount],
          v7 == [v5 maxCharacterCount])
      && ([(CRFormTextFieldOutputRegion *)self suggestedLineHeight],
          double v9 = v8,
          [v5 suggestedLineHeight],
          v9 == v10))
    {
      BOOL v13 = [(CRFormTextFieldOutputRegion *)self autofillNewContextStart];
      int v11 = v13 ^ [v5 autofillNewContextStart] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (unint64_t)textContentType
{
  return self->_textContentType;
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (BOOL)autofillNewContextStart
{
  return self->_autofillNewContextStart;
}

@end