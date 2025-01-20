@interface _RKResponse
- (BOOL)isEqual:(id)a3;
- (NSString)headword;
- (NSString)speechAct;
- (NSString)text;
- (_RKResponse)init;
- (_RKResponse)initWithSpeechAct:(id)a3 headword:(id)a4 text:(id)a5;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation _RKResponse

- (_RKResponse)init
{
  return self;
}

- (_RKResponse)initWithSpeechAct:(id)a3 headword:(id)a4 text:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_RKResponse;
  v12 = [(_RKResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_speechAct, a3);
    objc_storeStrong((id *)&v13->_headword, a4);
    objc_storeStrong((id *)&v13->_text, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_RKResponse *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(_RKResponse *)self text];
      v7 = [(_RKResponse *)v5 text];
      if ([v6 isEqualToString:v7])
      {
        unint64_t v8 = [(_RKResponse *)self type];
        BOOL v9 = v8 == [(_RKResponse *)v5 type];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(_RKResponse *)self text];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(_RKResponse *)self type] ^ v4;

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(_RKResponse *)self text];
  unint64_t v5 = [v3 stringWithFormat:@"{'%@', %lu}", v4, -[_RKResponse type](self, "type")];

  return v5;
}

- (unint64_t)type
{
  if (type_onceToken != -1) {
    dispatch_once(&type_onceToken, &__block_literal_global);
  }
  v3 = (void *)type_sSpeechActResponseType;
  uint64_t v4 = [(_RKResponse *)self speechAct];
  unint64_t v5 = [v3 objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (NSString)speechAct
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)headword
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_headword, 0);

  objc_storeStrong((id *)&self->_speechAct, 0);
}

@end