@interface _PSMessagesPinningSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)chatGuid;
- (_PSMessagesPinningSuggestion)initWithChatGuid:(id)a3;
- (_PSMessagesPinningSuggestion)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSMessagesPinningSuggestion

- (_PSMessagesPinningSuggestion)initWithChatGuid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSMessagesPinningSuggestion;
  v6 = [(_PSMessagesPinningSuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_chatGuid, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_PSMessagesPinningSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSMessagesPinningSuggestion;
  id v5 = [(_PSMessagesPinningSuggestion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chatGuid"];
    chatGuid = v5->_chatGuid;
    v5->_chatGuid = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_chatGuid hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_PSMessagesPinningSuggestion *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(_PSMessagesPinningSuggestion *)self chatGuid];
    if (v7
      && (v8 = (void *)v7,
          [(_PSMessagesPinningSuggestion *)v6 chatGuid],
          objc_super v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      v10 = [(_PSMessagesPinningSuggestion *)self chatGuid];
      v11 = [(_PSMessagesPinningSuggestion *)v6 chatGuid];
      char v12 = [v10 isEqualToString:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_PSMessagesPinningSuggestion *)self chatGuid];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p> chatGuid: %@", v4, self, v5];

  return v6;
}

- (NSString)chatGuid
{
  return self->_chatGuid;
}

- (void).cxx_destruct
{
}

@end