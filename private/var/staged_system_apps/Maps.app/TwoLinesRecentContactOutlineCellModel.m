@interface TwoLinesRecentContactOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (CRRecentContact)recentContact;
- (TwoLinesRecentContactOutlineCellModel)initWithRecentContact:(id)a3 backgroundModel:(id)a4;
- (unint64_t)hash;
@end

@implementation TwoLinesRecentContactOutlineCellModel

- (TwoLinesRecentContactOutlineCellModel)initWithRecentContact:(id)a3 backgroundModel:(id)a4
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100D345A8;
  v12[3] = &unk_1013228B0;
  id v7 = a3;
  id v13 = v7;
  v11.receiver = self;
  v11.super_class = (Class)TwoLinesRecentContactOutlineCellModel;
  v8 = [(TwoLinesBasicOutlineCellModel *)&v11 initWithBackgroundModel:a4 contentModelBlock:v12];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_recentContact, a3);
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)[(CRRecentContact *)self->_recentContact hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesRecentContactOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)TwoLinesRecentContactOutlineCellModel;
    if ([(TwoLinesBasicOutlineCellModel *)&v11 isEqual:v6])
    {
      id v7 = [(TwoLinesRecentContactOutlineCellModel *)v6 recentContact];
      v8 = v7;
      if (v7 == self->_recentContact) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = -[CRRecentContact isEqual:](v7, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (CRRecentContact)recentContact
{
  return self->_recentContact;
}

- (void).cxx_destruct
{
}

@end