@interface TIKeyboardInteractionProtocolEventContextDidChange
+ (BOOL)supportsSecureCoding;
- (BOOL)cursorMoved;
- (BOOL)extendsPriorWord;
- (BOOL)wordDelete;
- (NSString)description;
- (NSString)word;
- (TIDocumentState)documentState;
- (TIKeyboardInteractionProtocolEventContextDidChange)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolEventContextDidChange)initWithContext:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10;
- (_NSRange)inWordRange;
- (unint64_t)selectionLocation;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventContextDidChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_word, 0);

  objc_storeStrong((id *)&self->_documentState, 0);
}

- (unint64_t)selectionLocation
{
  return self->_selectionLocation;
}

- (_NSRange)inWordRange
{
  p_inWordRange = &self->_inWordRange;
  NSUInteger location = self->_inWordRange.location;
  NSUInteger length = p_inWordRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)word
{
  return self->_word;
}

- (BOOL)extendsPriorWord
{
  return self->_extendsPriorWord;
}

- (BOOL)cursorMoved
{
  return self->_cursorMoved;
}

- (BOOL)wordDelete
{
  return self->_wordDelete;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(TIDocumentState *)self->_documentState contextAfterInput];
  v4 = [v2 stringWithFormat:@"<ContextDidChange: before=[%@], todo...>", v3];

  return (NSString *)v4;
}

- (void)sendTo:(id)a3
{
  documentState = self->_documentState;
  BOOL wordDelete = self->_wordDelete;
  BOOL cursorMoved = self->_cursorMoved;
  BOOL extendsPriorWord = self->_extendsPriorWord;
  word = self->_word;
  p_inWordRange = &self->_inWordRange;
  unint64_t selectionLocation = self->_selectionLocation;
  id v11 = a3;
  id v12 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  objc_msgSend(v11, "contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", documentState, wordDelete, cursorMoved, extendsPriorWord, word, p_inWordRange->location, p_inWordRange->length, selectionLocation, v12);
}

- (TIKeyboardInteractionProtocolEventContextDidChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInteractionProtocolEventContextDidChange;
  v5 = [(TIKeyboardInteractionProtocolBase *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wordDelete"];
    v5->_BOOL wordDelete = [v8 BOOLValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cursorMoved"];
    v5->_BOOL cursorMoved = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendsPriorWord"];
    v5->_BOOL extendsPriorWord = [v10 BOOLValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"word"];
    word = v5->_word;
    v5->_word = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inWordRange"];
    v5->_inWordRange.NSUInteger location = [v13 rangeValue];
    v5->_inWordRange.NSUInteger length = v14;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectionLocation"];
    v5->_unint64_t selectionLocation = [v15 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInteractionProtocolEventContextDidChange;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v10 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentState, @"documentState", v10.receiver, v10.super_class);
  v5 = [NSNumber numberWithBool:self->_wordDelete];
  [v4 encodeObject:v5 forKey:@"wordDelete"];

  uint64_t v6 = [NSNumber numberWithBool:self->_cursorMoved];
  [v4 encodeObject:v6 forKey:@"cursorMoved"];

  v7 = [NSNumber numberWithBool:self->_extendsPriorWord];
  [v4 encodeObject:v7 forKey:@"extendsPriorWord"];

  [v4 encodeObject:self->_word forKey:@"word"];
  v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_inWordRange.location, self->_inWordRange.length);
  [v4 encodeObject:v8 forKey:@"inWordRange"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_selectionLocation];
  [v4 encodeObject:v9 forKey:@"selectionLocation"];
}

- (TIKeyboardInteractionProtocolEventContextDidChange)initWithContext:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInteractionProtocolEventContextDidChange;
  v18 = [(TIKeyboardInteractionProtocolBase *)&v21 initWithKeyboardState:a10];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_documentState, a3);
    v19->_BOOL wordDelete = a4;
    v19->_BOOL cursorMoved = a5;
    v19->_BOOL extendsPriorWord = a6;
    objc_storeStrong((id *)&v19->_word, a7);
    v19->_inWordRange = a8;
    v19->_unint64_t selectionLocation = a9;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end