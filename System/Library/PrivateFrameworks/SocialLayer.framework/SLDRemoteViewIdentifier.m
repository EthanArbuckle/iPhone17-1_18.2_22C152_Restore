@interface SLDRemoteViewIdentifier
+ (id)identifierForStyle:(id)a3 tag:(id)a4;
- (BOOL)isEqual:(id)a3;
- (SLDRemoteViewIdentifier)initWithStyle:(id)a3 tag:(id)a4;
- (SLDSlotTag)tag;
- (UISSlotStyle)style;
- (id)description;
- (unint64_t)hash;
- (void)setStyle:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation SLDRemoteViewIdentifier

+ (id)identifierForStyle:(id)a3 tag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SLDRemoteViewIdentifier alloc] initWithStyle:v6 tag:v5];

  return v7;
}

- (SLDRemoteViewIdentifier)initWithStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLDRemoteViewIdentifier;
  v9 = [(SLDRemoteViewIdentifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SLDRemoteViewIdentifier *)self style];
  id v5 = [(SLDRemoteViewIdentifier *)self tag];
  id v6 = [v3 stringWithFormat:@"<SLDRemoteViewIdentifier: %p> style:[%@] tag:[%@]", self, v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (SLDRemoteViewIdentifier *)v4;
    id v6 = v5;
    if (v5 == self)
    {
      char v11 = 1;
    }
    else
    {
      id v7 = [(SLDRemoteViewIdentifier *)v5 style];
      id v8 = [(SLDRemoteViewIdentifier *)self style];
      if ([v7 isEqual:v8])
      {
        v9 = [(SLDRemoteViewIdentifier *)v6 tag];
        v10 = [(SLDRemoteViewIdentifier *)self tag];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SLDRemoteViewIdentifier *)self style];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLDRemoteViewIdentifier *)self tag];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (SLDSlotTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end