@interface _UIWTCProofreadingSuggestionInfo
- (NSAttributedString)attributedString;
- (NSUUID)identifier;
- (_NSRange)originalRange;
- (_UIWTCProofreadingSuggestionInfo)initWithProofreadingSuggestionInfo:(id)a3 state:(int64_t)a4;
- (_UIWTCProofreadingSuggestionInfo)initWithWTTextSuggestion:(id)a3 withOffset:(unint64_t)a4 inAttributedString:(id)a5;
- (id)description;
- (int64_t)state;
@end

@implementation _UIWTCProofreadingSuggestionInfo

- (_UIWTCProofreadingSuggestionInfo)initWithWTTextSuggestion:(id)a3 withOffset:(unint64_t)a4 inAttributedString:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIWTCProofreadingSuggestionInfo;
  v10 = [(_UIWTCProofreadingSuggestionInfo *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [v8 uuid];
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    v10->_originalRange.location = [v8 originalRange] - a4;
    v10->_originalRange.length = v13;
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    v15 = [v8 replacement];
    v16 = [v9 attributesAtIndex:v10->_originalRange.location effectiveRange:0];
    uint64_t v17 = [v14 initWithString:v15 attributes:v16];
    attributedString = v10->_attributedString;
    v10->_attributedString = (NSAttributedString *)v17;

    v10->_state = [v8 state];
  }

  return v10;
}

- (_UIWTCProofreadingSuggestionInfo)initWithProofreadingSuggestionInfo:(id)a3 state:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIWTCProofreadingSuggestionInfo;
  v7 = [(_UIWTCProofreadingSuggestionInfo *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 identifier];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    uint64_t v10 = [v6 attributedString];
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSAttributedString *)v10;

    v7->_originalRange.location = [v6 originalRange];
    v7->_originalRange.length = v12;
    v7->_state = a4;
  }

  return v7;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)_UIWTCProofreadingSuggestionInfo;
  v3 = [(_UIWTCProofreadingSuggestionInfo *)&v11 description];
  unint64_t state = self->_state;
  if (state > 4) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E52DF8E8[state];
  }
  NSUInteger location = self->_originalRange.location;
  NSUInteger length = self->_originalRange.length;
  uint64_t v8 = [(NSAttributedString *)self->_attributedString string];
  id v9 = [v3 stringByAppendingFormat:@" state=%@ range={%lu, %lu} replacement=%@", v5, location, length, v8];

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (_NSRange)originalRange
{
  NSUInteger length = self->_originalRange.length;
  NSUInteger location = self->_originalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end