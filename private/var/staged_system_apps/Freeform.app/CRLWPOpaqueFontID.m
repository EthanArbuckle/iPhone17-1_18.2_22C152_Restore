@interface CRLWPOpaqueFontID
- (BOOL)isEqual:(id)a3;
- (CRLWPOpaqueFontID)initWithFont:(id)a3;
- (CRLWPOpaqueFontID)initWithPostScriptName:(id)a3 familyName:(id)a4;
- (NSString)desiredPostScriptName;
- (NSString)familyName;
- (id)description;
- (unint64_t)hash;
- (void)setDesiredPostScriptName:(id)a3;
- (void)setFamilyName:(id)a3;
@end

@implementation CRLWPOpaqueFontID

- (CRLWPOpaqueFontID)initWithPostScriptName:(id)a3 familyName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLWPOpaqueFontID;
  v9 = [(CRLWPOpaqueFontID *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_desiredPostScriptName, a3);
    objc_storeStrong((id *)&v10->_familyName, a4);
  }

  return v10;
}

- (CRLWPOpaqueFontID)initWithFont:(id)a3
{
  id v4 = a3;
  if ([v4 isRequestedFont])
  {
    v5 = [v4 familyName];
  }
  else
  {
    v5 = 0;
  }
  v6 = [v4 desiredPostScriptName];
  id v7 = [(CRLWPOpaqueFontID *)self initWithPostScriptName:v6 familyName:v5];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = sub_1002469D0(v5, v4);

    if (v6)
    {
      uint64_t v7 = [(CRLWPOpaqueFontID *)self familyName];
      if (v7)
      {
        id v8 = (void *)v7;
        uint64_t v9 = [v6 familyName];
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [(CRLWPOpaqueFontID *)self familyName];
          objc_super v12 = [v6 familyName];
          unsigned __int8 v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_10;
          }
        }
        else
        {
        }
      }
      v15 = [(CRLWPOpaqueFontID *)self desiredPostScriptName];
      v16 = [v6 desiredPostScriptName];
      unsigned __int8 v17 = [v15 isEqual:v16];

      if (v17)
      {
LABEL_10:
        BOOL v14 = 1;
LABEL_12:

        return v14;
      }
    }
    BOOL v14 = 0;
    goto LABEL_12;
  }
  return 1;
}

- (unint64_t)hash
{
  v3 = [(CRLWPOpaqueFontID *)self desiredPostScriptName];
  id v4 = [(CRLWPOpaqueFontID *)self familyName];
  uint64_t v5 = +[NSString stringWithFormat:@"%@%@", v3, v4];

  id v6 = [v5 hash];
  return (unint64_t)v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(CRLWPOpaqueFontID *)self desiredPostScriptName];
  id v6 = [(CRLWPOpaqueFontID *)self familyName];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: <%p> Desired PostScript Name: %@; Family Name: %@",
    v4,
    self,
    v5,
  uint64_t v7 = v6);

  return v7;
}

- (NSString)desiredPostScriptName
{
  return self->_desiredPostScriptName;
}

- (void)setDesiredPostScriptName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyName, 0);

  objc_storeStrong((id *)&self->_desiredPostScriptName, 0);
}

@end