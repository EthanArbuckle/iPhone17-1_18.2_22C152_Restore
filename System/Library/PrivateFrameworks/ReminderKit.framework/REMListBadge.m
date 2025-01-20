@interface REMListBadge
- (BOOL)_isJSONString:(id)a3;
- (BOOL)_isSingleCharacterEmoji:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)emblem;
- (NSString)emoji;
- (NSString)rawValue;
- (REMListBadge)initWithEmblem:(id)a3;
- (REMListBadge)initWithEmoji:(id)a3;
- (REMListBadge)initWithRawValue:(id)a3;
- (id)_emojiFromRawString:(id)a3;
- (void)setEmblem:(id)a3;
- (void)setEmoji:(id)a3;
@end

@implementation REMListBadge

- (REMListBadge)initWithEmblem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMListBadge;
  v5 = [(REMListBadge *)&v8 init];
  v6 = v5;
  if (v5) {
    [(REMListBadge *)v5 setEmblem:v4];
  }

  return v6;
}

- (REMListBadge)initWithEmoji:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMListBadge;
  v5 = [(REMListBadge *)&v8 init];
  v6 = v5;
  if (v5) {
    [(REMListBadge *)v5 setEmoji:v4];
  }

  return v6;
}

- (REMListBadge)initWithRawValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListBadge;
  v5 = [(REMListBadge *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if ([(REMListBadge *)v5 _isJSONString:v4])
    {
      v7 = [(REMListBadge *)v6 _emojiFromRawString:v4];
      [(REMListBadge *)v6 setEmoji:v7];
    }
    else
    {
      [(REMListBadge *)v6 setEmblem:v4];
    }
  }

  return v6;
}

- (NSString)rawValue
{
  v3 = [(REMListBadge *)self emblem];

  if (v3)
  {
    id v4 = [(REMListBadge *)self emblem];
  }
  else
  {
    v5 = NSString;
    v6 = [(REMListBadge *)self emoji];
    id v4 = [v5 stringWithFormat:@"{\"%@\" : \"%@\"}", @"Emoji", v6];
  }

  return (NSString *)v4;
}

- (BOOL)_isSingleCharacterEmoji:(id)a3
{
  return CEMStringIsSingleEmoji() != 0;
}

- (id)_emojiFromRawString:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  uint64_t v9 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v9];
  uint64_t v5 = objc_opt_class();
  v6 = REMDynamicCast(v5, (uint64_t)v4);
  v7 = [v6 objectForKey:@"Emoji"];

  return v7;
}

- (BOOL)_isJSONString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    BOOL v4 = [v3 characterAtIndex:0] == 123;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v5 = [(REMListBadge *)self emblem];
  uint64_t v6 = [v4 emblem];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    objc_super v8 = [(REMListBadge *)self emblem];
    uint64_t v9 = [v4 emblem];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = [(REMListBadge *)self emoji];
  uint64_t v13 = [v4 emoji];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMListBadge *)self emoji];
    v16 = [v4 emoji];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (NSString)emblem
{
  return self->emblem;
}

- (void)setEmblem:(id)a3
{
}

- (NSString)emoji
{
  return self->emoji;
}

- (void)setEmoji:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->emoji, 0);

  objc_storeStrong((id *)&self->emblem, 0);
}

@end