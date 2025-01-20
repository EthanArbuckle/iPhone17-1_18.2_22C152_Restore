@interface SLDCollaborationFooterSlotTag
+ (id)tagForTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (SLDCollaborationFooterSlotTag)initWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5;
- (double)maxWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SLDCollaborationFooterSlotTag

+ (id)tagForTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[SLDCollaborationFooterSlotTag alloc] initWithTitle:v8 subtitle:v7 maxWidth:a5];

  return v9;
}

- (SLDCollaborationFooterSlotTag)initWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SLDCollaborationFooterSlotTag;
  v10 = [(SLDCollaborationFooterSlotTag *)&v17 init];
  if (v10)
  {
    if ((!v8 || [v8 isEqualToString:&stru_1EEC19158])
      && (!v9 || [v9 isEqualToString:&stru_1EEC19158]))
    {
      v11 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:](v11);
      }
    }
    uint64_t v12 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    subtitle = v10->_subtitle;
    v10->_subtitle = (NSString *)v14;

    v10->_maxWidth = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SLDCollaborationFooterSlotTag alloc];
  v5 = [(SLDCollaborationFooterSlotTag *)self title];
  v6 = [(SLDCollaborationFooterSlotTag *)self subtitle];
  [(SLDCollaborationFooterSlotTag *)self maxWidth];
  id v7 = -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:](v4, "initWithTitle:subtitle:maxWidth:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (SLDCollaborationFooterSlotTag *)v4;
    v6 = v5;
    if (v5 == self)
    {
      char v14 = 1;
    }
    else
    {
      [(SLDCollaborationFooterSlotTag *)v5 maxWidth];
      double v8 = v7;
      [(SLDCollaborationFooterSlotTag *)self maxWidth];
      if (SL_CGFloatApproximatelyEqualToFloat(v8, v9))
      {
        v10 = [(SLDCollaborationFooterSlotTag *)v6 title];
        v11 = [(SLDCollaborationFooterSlotTag *)self title];
        if ([v10 isEqualToString:v11])
        {
          uint64_t v12 = [(SLDCollaborationFooterSlotTag *)v6 subtitle];
          v13 = [(SLDCollaborationFooterSlotTag *)self subtitle];
          char v14 = [v12 isEqualToString:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(SLDCollaborationFooterSlotTag *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(SLDCollaborationFooterSlotTag *)self subtitle];
  uint64_t v6 = [v5 hash] ^ v4;
  [(SLDCollaborationFooterSlotTag *)self maxWidth];
  unint64_t v8 = v6 ^ (unint64_t)v7;

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:(os_log_t)log subtitle:maxWidth:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "SLDCollaborationFooterSlotTag initialized with nil title and subtitle", v1, 2u);
}

@end