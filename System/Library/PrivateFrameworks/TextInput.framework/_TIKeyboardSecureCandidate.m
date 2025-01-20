@interface _TIKeyboardSecureCandidate
- (BOOL)isEqual:(id)a3;
- (NSString)input;
- (NSString)secureContent;
- (NSString)secureFormattedContent;
- (NSString)secureHeader;
- (NSString)truncationSentinel;
- (_TIKeyboardSecureCandidate)initWithSecureHeader:(id)a3 secureContent:(id)a4 secureFormattedContent:(id)a5 input:(id)a6 truncationSentinel:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)candidateHash;
- (unint64_t)hash;
@end

@implementation _TIKeyboardSecureCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationSentinel, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_secureFormattedContent, 0);
  objc_storeStrong((id *)&self->_secureContent, 0);

  objc_storeStrong((id *)&self->_secureHeader, 0);
}

- (NSString)truncationSentinel
{
  return self->_truncationSentinel;
}

- (NSString)input
{
  return self->_input;
}

- (NSString)secureFormattedContent
{
  return self->_secureFormattedContent;
}

- (NSString)secureContent
{
  return self->_secureContent;
}

- (NSString)secureHeader
{
  return self->_secureHeader;
}

- (unint64_t)hash
{
  unint64_t v3 = 257 * [(_TIKeyboardSecureCandidate *)self candidateHash];
  NSUInteger v4 = 257 * ([(NSString *)self->_input hash] + v3);
  return v4 + [(NSString *)self->_truncationSentinel hash];
}

- (unint64_t)candidateHash
{
  NSUInteger v3 = 257 * [(NSString *)self->_secureHeader hash];
  NSUInteger v4 = 257 * ([(NSString *)self->_secureContent hash] + v3);
  return v4 + [(NSString *)self->_secureFormattedContent hash];
}

- (id)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = [(_TIKeyboardSecureCandidate *)self secureHeader];
  v5 = [v3 stringWithFormat:@"secureHeader(%@)", v4];

  v6 = [(_TIKeyboardSecureCandidate *)self secureContent];
  v7 = [v5 stringByAppendingFormat:@";secureContent(%@)", v6];

  v8 = [(_TIKeyboardSecureCandidate *)self secureFormattedContent];
  v9 = [v7 stringByAppendingFormat:@";secureFormattedContent(%@)", v8];

  v10 = [(_TIKeyboardSecureCandidate *)self input];
  v11 = [v9 stringByAppendingFormat:@";input(%@)", v10];

  v12 = [(_TIKeyboardSecureCandidate *)self truncationSentinel];
  v13 = [v11 stringByAppendingFormat:@";truncationSentinel(%@)", v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(_TIKeyboardSecureCandidate *)self secureHeader];
    uint64_t v7 = [v5 secureHeader];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(_TIKeyboardSecureCandidate *)self secureHeader];
      v10 = [v5 secureHeader];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(_TIKeyboardSecureCandidate *)self secureContent];
    uint64_t v14 = [v5 secureContent];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(_TIKeyboardSecureCandidate *)self secureContent];
      v17 = [v5 secureContent];
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(_TIKeyboardSecureCandidate *)self secureFormattedContent];
    uint64_t v20 = [v5 secureFormattedContent];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(_TIKeyboardSecureCandidate *)self secureFormattedContent];
      v23 = [v5 secureFormattedContent];
      int v24 = [v22 isEqualToString:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(_TIKeyboardSecureCandidate *)self input];
    uint64_t v26 = [v5 input];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(_TIKeyboardSecureCandidate *)self input];
      v29 = [v5 input];
      int v30 = [v28 isEqualToString:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(_TIKeyboardSecureCandidate *)self truncationSentinel];
    v32 = [v5 truncationSentinel];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(_TIKeyboardSecureCandidate *)self truncationSentinel];
      v34 = [v5 truncationSentinel];
      char v12 = [v33 isEqualToString:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_secureHeader);
    objc_storeStrong(v5 + 2, self->_secureContent);
    objc_storeStrong(v5 + 3, self->_secureFormattedContent);
    objc_storeStrong(v5 + 4, self->_input);
    objc_storeStrong(v5 + 5, self->_truncationSentinel);
  }
  return v5;
}

- (_TIKeyboardSecureCandidate)initWithSecureHeader:(id)a3 secureContent:(id)a4 secureFormattedContent:(id)a5 input:(id)a6 truncationSentinel:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_TIKeyboardSecureCandidate;
  v17 = [(_TIKeyboardSecureCandidate *)&v21 init];
  int v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_secureHeader, a3);
    objc_storeStrong((id *)&v18->_secureContent, a4);
    objc_storeStrong((id *)&v18->_secureFormattedContent, a5);
    objc_storeStrong((id *)&v18->_input, a6);
    objc_storeStrong((id *)&v18->_truncationSentinel, a7);
  }

  return v18;
}

@end