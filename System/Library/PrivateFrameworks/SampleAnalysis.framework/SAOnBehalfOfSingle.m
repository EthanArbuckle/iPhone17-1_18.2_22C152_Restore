@interface SAOnBehalfOfSingle
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation SAOnBehalfOfSingle

- (BOOL)isEqual:(id)a3
{
  v4 = (SAOnBehalfOfSingle *)a3;
  if (v4 == self)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v7 = v5;
      if (self)
      {
        int proximatePid = self->_proximatePid;
        if (v5)
        {
LABEL_5:
          int v9 = v5->_proximatePid;
          goto LABEL_6;
        }
      }
      else
      {
        int proximatePid = 0;
        if (v5) {
          goto LABEL_5;
        }
      }
      int v9 = 0;
LABEL_6:
      if (proximatePid != v9) {
        goto LABEL_23;
      }
      if (self)
      {
        int originPid = self->_originPid;
        if (v5)
        {
LABEL_9:
          int v11 = v5->_originPid;
          goto LABEL_10;
        }
      }
      else
      {
        int originPid = 0;
        if (v5) {
          goto LABEL_9;
        }
      }
      int v11 = 0;
LABEL_10:
      if (originPid == v11)
      {
        if (self) {
          id Property = objc_getProperty(self, v6, 16, 1);
        }
        else {
          id Property = 0;
        }
        id v14 = Property;
        if (v7) {
          id v15 = objc_getProperty(v7, v13, 16, 1);
        }
        else {
          id v15 = 0;
        }
        if ([v14 isEqualToString:v15])
        {
          if (self) {
            id v17 = objc_getProperty(self, v16, 24, 1);
          }
          else {
            id v17 = 0;
          }
          id v19 = v17;
          if (v7) {
            id v20 = objc_getProperty(v7, v18, 24, 1);
          }
          else {
            id v20 = 0;
          }
          char v21 = [v19 isEqualToString:v20];
        }
        else
        {
          char v21 = 0;
        }

        goto LABEL_26;
      }
LABEL_23:
      char v21 = 0;
LABEL_26:

      goto LABEL_27;
    }
    char v21 = 0;
  }
LABEL_27:

  return v21;
}

- (unint64_t)hash
{
  if (self) {
    return *(int *)(self + 8) | ((unint64_t)*(unsigned int *)(self + 12) << 32);
  }
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_proximateName, 0);
}

@end