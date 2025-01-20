@interface MatchedTokenAttribute
- (NSArray)matchedTypes;
- (NSArray)queryPositions;
- (SSTokenizedString)token;
- (id)initMatchedToken:(id)a3 query:(id)a4 matchedType:(id)a5;
- (unint64_t)tokenLength;
- (unint64_t)tokenNum;
- (void)setMatchedTypes:(id)a3;
- (void)setQueryPositions:(id)a3;
- (void)setToken:(id)a3;
- (void)setTokenLength:(unint64_t)a3;
- (void)setTokenNum:(unint64_t)a3;
@end

@implementation MatchedTokenAttribute

- (id)initMatchedToken:(id)a3 query:(id)a4 matchedType:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MatchedTokenAttribute;
  v11 = [(MatchedTokenAttribute *)&v19 init];
  v12 = v11;
  if (v11)
  {
    [(MatchedTokenAttribute *)v11 setToken:v8];
    v13 = [v8 tokens];
    -[MatchedTokenAttribute setTokenNum:](v12, "setTokenNum:", [v13 count]);

    v14 = [v8 original];
    -[MatchedTokenAttribute setTokenLength:](v12, "setTokenLength:", [v14 length]);

    v15 = [v9 tokenMatchForMatchInfoToken:v8];
    v16 = [v15 indexes];
    [(MatchedTokenAttribute *)v12 setQueryPositions:v16];

    v20[0] = v10;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(MatchedTokenAttribute *)v12 setMatchedTypes:v17];
  }
  return v12;
}

- (SSTokenizedString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unint64_t)tokenNum
{
  return self->_tokenNum;
}

- (void)setTokenNum:(unint64_t)a3
{
  self->_tokenNum = a3;
}

- (unint64_t)tokenLength
{
  return self->_tokenLength;
}

- (void)setTokenLength:(unint64_t)a3
{
  self->_tokenLength = a3;
}

- (NSArray)queryPositions
{
  return self->_queryPositions;
}

- (void)setQueryPositions:(id)a3
{
}

- (NSArray)matchedTypes
{
  return self->_matchedTypes;
}

- (void)setMatchedTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedTypes, 0);
  objc_storeStrong((id *)&self->_queryPositions, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end