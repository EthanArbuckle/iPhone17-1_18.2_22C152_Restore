@interface REScriptTokenizer
- (BOOL)_hasChar;
- (BOOL)_matchTokenStart:(void *)a3 body:(void *)a4 value:(id *)a5;
- (BOOL)isEmpty;
- (REScriptToken)currentToken;
- (REScriptTokenizer)initWithScriptBuffer:(id)a3;
- (REScriptTokenizerDelegate)delegate;
- (id)_readMultilineComment;
- (id)_readSingleComment;
- (id)_readString;
- (unsigned)_peekChar;
- (void)_consumeWhitespace;
- (void)_popChar;
- (void)_validateToken;
- (void)next;
- (void)setDelegate:(id)a3;
@end

@implementation REScriptTokenizer

- (REScriptTokenizer)initWithScriptBuffer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REScriptTokenizer;
  v6 = [(REScriptTokenizer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buffer, a3);
    currentToken = v7->_currentToken;
    v7->_currentToken = 0;

    [(REScriptTokenizer *)v7 _consumeWhitespace];
    [(REScriptTokenizer *)v7 next];
  }

  return v7;
}

- (REScriptToken)currentToken
{
  return self->_currentToken;
}

- (BOOL)isEmpty
{
  return ![(REScriptTokenizer *)self _hasChar] && [(REScriptToken *)self->_currentToken type] == 0;
}

- (void)next
{
  unint64_t line = self->_line;
  unint64_t column = self->_column;
  uint64_t v48 = 0;
  v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  v53 = &stru_26CFA57D0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __25__REScriptTokenizer_next__block_invoke;
  v43[3] = &unk_2644BD380;
  v43[4] = &v48;
  v43[5] = &v44;
  id v5 = (void (**)(void))MEMORY[0x223C31700](v43, a2);
  if ([(REScriptTokenizer *)self _hasChar])
  {
    v6 = v49;
    id obj = v49[5];
    BOOL v7 = [(REScriptTokenizer *)self _matchTokenStart:REIsPreprocessStartCharacter body:REIsAlphaCharacter value:&obj];
    objc_storeStrong(v6 + 5, obj);
    if (v7)
    {
      v8 = v45;
      uint64_t v9 = 2;
LABEL_4:
      v8[3] = v9;
      goto LABEL_34;
    }
    objc_super v10 = v49;
    id v41 = v49[5];
    BOOL v11 = [(REScriptTokenizer *)self _matchTokenStart:REIsIdentifierStartCharacter body:REIsIdentifierCharacter value:&v41];
    objc_storeStrong(v10 + 5, v41);
    if (v11)
    {
      v45[3] = 6;
      v12 = (__CFString *)v49[5];
      if (REKeywordTokenForString_onceToken != -1) {
        dispatch_once(&REKeywordTokenForString_onceToken, &__block_literal_global_145);
      }
      v13 = [(id)REKeywordTokenForString_KeywordTokenMap objectForKeyedSubscript:v12];
      v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 unsignedIntegerValue];
LABEL_10:
        uint64_t v16 = v15;

        v45[3] = v16;
        goto LABEL_34;
      }
LABEL_20:

      goto LABEL_34;
    }
    if ([(REScriptTokenizer *)self _peekChar] == 47)
    {
      [(REScriptTokenizer *)self _popChar];
      if ([(REScriptTokenizer *)self _hasChar])
      {
        if ([(REScriptTokenizer *)self _peekChar] == 47)
        {
          v45[3] = 7;
          [(REScriptTokenizer *)self _popChar];
          uint64_t v17 = [(REScriptTokenizer *)self _readSingleComment];
          goto LABEL_32;
        }
        if ([(REScriptTokenizer *)self _peekChar] == 42)
        {
          v45[3] = 8;
          [(REScriptTokenizer *)self _popChar];
          uint64_t v17 = [(REScriptTokenizer *)self _readMultilineComment];
          goto LABEL_32;
        }
      }
      id v30 = v49[5];
      v49[5] = @"/";

      v5[2](v5);
      goto LABEL_34;
    }
    v18 = v49;
    id v40 = v49[5];
    BOOL v19 = [(REScriptTokenizer *)self _matchTokenStart:REIsNumericCharacter body:REIsNumericCharacter value:&v40];
    objc_storeStrong(v18 + 5, v40);
    if (!v19)
    {
      if ([(REScriptTokenizer *)self _peekChar] != 34)
      {
        uint64_t v25 = [(REScriptTokenizer *)self _peekChar];
        if (RELoadControlCharacterMap_onceToken != -1) {
          dispatch_once(&RELoadControlCharacterMap_onceToken, &__block_literal_global_178);
        }
        if ([(id)REControlCharacterSet characterIsMember:v25])
        {
          uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%c", -[REScriptTokenizer _peekChar](self, "_peekChar"));
          id v27 = v49[5];
          v49[5] = (id)v26;

          [(REScriptTokenizer *)self _popChar];
          v12 = (__CFString *)v49[5];
          if (RELoadControlCharacterMap_onceToken != -1) {
            dispatch_once(&RELoadControlCharacterMap_onceToken, &__block_literal_global_178);
          }
          v28 = [(id)REControlTokenMap objectForKeyedSubscript:v12];
          v14 = v28;
          if (v28)
          {
            uint64_t v15 = [v28 unsignedIntegerValue];
            goto LABEL_10;
          }
        }
        else
        {
          v34 = v49;
          id v38 = v49[5];
          BOOL v35 = [(REScriptTokenizer *)self _matchTokenStart:REIsOperatorCharacter body:REIsOperatorCharacter value:&v38];
          objc_storeStrong(v34 + 5, v38);
          if (v35)
          {
            v5[2](v5);
            goto LABEL_34;
          }
          uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"%c", -[REScriptTokenizer _peekChar](self, "_peekChar"));
          id v37 = v49[5];
          v49[5] = (id)v36;

          [(REScriptTokenizer *)self _popChar];
        }
        v8 = v45;
        uint64_t v9 = 1;
        goto LABEL_4;
      }
      v45[3] = 5;
      [(REScriptTokenizer *)self _popChar];
      uint64_t v17 = [(REScriptTokenizer *)self _readString];
LABEL_32:
      id v29 = v49[5];
      v49[5] = (id)v17;

      goto LABEL_34;
    }
    v45[3] = 3;
    if ([(REScriptTokenizer *)self _hasChar] && [(REScriptTokenizer *)self _peekChar] == 46)
    {
      v45[3] = 4;
      [(REScriptTokenizer *)self _popChar];
      uint64_t v20 = [v49[5] stringByAppendingString:@"."];
      id v21 = v49[5];
      v49[5] = (id)v20;

      v39 = &stru_26CFA57D0;
      BOOL v22 = [(REScriptTokenizer *)self _matchTokenStart:REIsNumericCharacter body:REIsNumericCharacter value:&v39];
      v12 = v39;
      if (v22)
      {
        uint64_t v23 = [v49[5] stringByAppendingString:v12];
        id v24 = v49[5];
        v49[5] = (id)v23;
      }
      goto LABEL_20;
    }
  }
LABEL_34:
  v31 = [REScriptToken alloc];
  v32 = [(REScriptToken *)v31 initWithValue:v49[5] type:v45[3] line:line column:column];
  currentToken = self->_currentToken;
  self->_currentToken = v32;

  [(REScriptTokenizer *)self _validateToken];
  [(REScriptTokenizer *)self _consumeWhitespace];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

void __25__REScriptTokenizer_next__block_invoke(uint64_t a1)
{
  uint64_t v2 = RELoadOperatorCharacterMap_onceToken;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2 != -1) {
    dispatch_once(&RELoadOperatorCharacterMap_onceToken, &__block_literal_global_13);
  }
  v4 = [(id)REOperatorTokenMap objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    uint64_t v5 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (id)_readSingleComment
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:@"//"];
  if ([(REScriptTokenizer *)self _hasChar])
  {
    do
    {
      int v4 = [(REScriptTokenizer *)self _peekChar];
      if (v4 == 10) {
        break;
      }
      if (v4 == 13) {
        break;
      }
      objc_msgSend(v3, "appendFormat:", @"%c", -[REScriptTokenizer _peekChar](self, "_peekChar"));
      [(REScriptTokenizer *)self _popChar];
    }
    while ([(REScriptTokenizer *)self _hasChar]);
  }
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (id)_readMultilineComment
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:@"/*"];
  char v4 = 0;
  do
  {
    if (![(REScriptTokenizer *)self _hasChar]) {
      break;
    }
    int v5 = [(REScriptTokenizer *)self _peekChar];
    int v6 = v5 << 24;
    objc_msgSend(v3, "appendFormat:", @"%c", (char)v5);
    [(REScriptTokenizer *)self _popChar];
    char v7 = (v6 != 788529152) | ~v4;
    char v4 = v6 == 704643072;
  }
  while ((v7 & 1) != 0);
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)_readString
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:@"\""];
  BOOL v4 = 0;
  do
  {
    if (![(REScriptTokenizer *)self _hasChar]) {
      break;
    }
    int v5 = [(REScriptTokenizer *)self _peekChar];
    int v6 = v5 << 24;
    id v7 = (id)objc_msgSend(v3, "stringByAppendingFormat:", @"%c", (char)v5);
    [(REScriptTokenizer *)self _popChar];
    BOOL v8 = v4 || v6 != 570425344;
    BOOL v4 = v6 == 1543503872;
  }
  while (v8);
  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (void)_validateToken
{
  v25[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(REScriptToken *)self->_currentToken type];
  if (v3 == 1)
  {
    id v7 = [(REScriptToken *)self->_currentToken value];
    if ([v7 length])
    {
      uint64_t v8 = 0;
      uint64_t v9 = @"Invalid operator \"%@\"";
      uint64_t v10 = 202;
      while (1)
      {
        uint64_t v11 = [v7 characterAtIndex:v8];
        if (RELoadOperatorCharacterMap_onceToken != -1) {
          dispatch_once(&RELoadOperatorCharacterMap_onceToken, &__block_literal_global_13);
        }
        if (([(id)REOperatorCharacterSet characterIsMember:v11] & 1) == 0) {
          break;
        }
        if (++v8 >= (unint64_t)[v7 length]) {
          goto LABEL_20;
        }
      }
      uint64_t v9 = @"Unrecognzied character \"%@\"";
      uint64_t v10 = 203;
    }
    else
    {
      uint64_t v9 = @"Invalid operator \"%@\"";
      uint64_t v10 = 202;
    }
LABEL_20:
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", v9, v7);
    currentToken = self->_currentToken;
    uint64_t v20 = @"REErrorTokenKey";
    id v21 = currentToken;
    v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v15 = RECreateErrorWithCodeMessageAndUseInfo(v10, v16, v18);
  }
  else
  {
    if (v3 == 5)
    {
      v12 = self->_currentToken;
      BOOL v22 = @"REErrorTokenKey";
      uint64_t v23 = v12;
      id v7 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v13 = 201;
    }
    else
    {
      if (v3 != 8) {
        return;
      }
      BOOL v4 = [(REScriptToken *)self->_currentToken value];
      if ([v4 hasPrefix:@"/*"])
      {
        int v5 = [(REScriptToken *)self->_currentToken value];
        char v6 = [v5 hasSuffix:@"*/"];

        if (v6) {
          return;
        }
      }
      else
      {
      }
      v14 = self->_currentToken;
      id v24 = @"REErrorTokenKey";
      v25[0] = v14;
      id v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v13 = 200;
    }
    uint64_t v15 = RECreateErrorWithCodeAndUseInfo(v13, v7);
  }

  if (v15)
  {
    BOOL v19 = [(REScriptTokenizer *)self delegate];
    [v19 tokenizer:self didEncouterTokenError:v15];
  }
}

- (void)_consumeWhitespace
{
  if ([(REScriptTokenizer *)self _hasChar])
  {
    do
    {
      int v3 = [(REScriptTokenizer *)self _peekChar];
      if ((v3 - 9) >= 5 && v3 != 32) {
        break;
      }
      [(REScriptTokenizer *)self _popChar];
    }
    while ([(REScriptTokenizer *)self _hasChar]);
  }
}

- (BOOL)_hasChar
{
  return [(REScriptBuffer *)self->_buffer isEmpty] ^ 1;
}

- (unsigned)_peekChar
{
  return [(REScriptBuffer *)self->_buffer current];
}

- (void)_popChar
{
  ++self->_column;
  int v3 = [(REScriptTokenizer *)self _peekChar];
  int v4 = v3;
  if (v3 == 10 || v3 == 13)
  {
    buffer = self->_buffer;
    p_buffer = &self->_buffer;
    p_buffer[2] = (REScriptBuffer *)((char *)p_buffer[2] + 1);
    p_buffer[3] = 0;
    [(REScriptBuffer *)buffer next];
    if (v4 != 13 || [(REScriptBuffer *)*p_buffer current] != 10) {
      return;
    }
  }
  else
  {
    p_buffer = &self->_buffer;
  }
  id v7 = *p_buffer;
  [(REScriptBuffer *)v7 next];
}

- (BOOL)_matchTokenStart:(void *)a3 body:(void *)a4 value:(id *)a5
{
  BOOL v9 = [(REScriptTokenizer *)self _hasChar];
  LOBYTE(v10) = 0;
  if (a4)
  {
    if (a3)
    {
      if (v9)
      {
        unsigned int v11 = [(REScriptTokenizer *)self _peekChar];
        int v10 = ((uint64_t (*)(void))a3)();
        if (v10)
        {
          v12 = [MEMORY[0x263F089D8] string];
          objc_msgSend(v12, "appendFormat:", @"%c", v11);
          [(REScriptTokenizer *)self _popChar];
          if ([(REScriptTokenizer *)self _hasChar])
          {
            unsigned __int16 v13 = [(REScriptTokenizer *)self _peekChar];
            if (((unsigned int (*)(void))a4)())
            {
              do
              {
                objc_msgSend(v12, "appendFormat:", @"%c", v13);
                [(REScriptTokenizer *)self _popChar];
                if (![(REScriptTokenizer *)self _hasChar]) {
                  break;
                }
                unsigned __int16 v13 = [(REScriptTokenizer *)self _peekChar];
              }
              while ((((uint64_t (*)(void))a4)() & 1) != 0);
            }
          }
          if (a5) {
            *a5 = (id)[v12 copy];
          }

          LOBYTE(v10) = 1;
        }
      }
    }
  }
  return v10;
}

- (REScriptTokenizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REScriptTokenizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end