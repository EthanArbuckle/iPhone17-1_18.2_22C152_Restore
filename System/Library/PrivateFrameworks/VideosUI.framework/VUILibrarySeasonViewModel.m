@interface VUILibrarySeasonViewModel
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (VUILibrarySeasonViewModel)initWithSeasonIdentifier:(id)a3 type:(unint64_t)a4;
- (VUIMediaEntityIdentifier)seasonIdentifier;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation VUILibrarySeasonViewModel

- (VUILibrarySeasonViewModel)initWithSeasonIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUILibrarySeasonViewModel;
  v8 = [(VUILibrarySeasonViewModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_seasonIdentifier, a3);
    v9->_type = a4;
  }

  return v9;
}

- (NSString)identifier
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F28ED0];
  v5 = [(VUILibrarySeasonViewModel *)self seasonIdentifier];
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
  id v7 = [v3 stringWithFormat:@"%@-%lu", v6, -[VUILibrarySeasonViewModel type](self, "type")];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUILibrarySeasonViewModel *)self type];
  v4 = [(VUILibrarySeasonViewModel *)self seasonIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUILibrarySeasonViewModel *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        id v7 = [(VUILibrarySeasonViewModel *)self seasonIdentifier];
        v8 = [(VUILibrarySeasonViewModel *)v6 seasonIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          objc_super v11 = v10;
          if (!v9 || !v10)
          {

LABEL_14:
            BOOL v13 = 0;
            goto LABEL_15;
          }
          char v12 = [v9 isEqual:v10];

          if ((v12 & 1) == 0) {
            goto LABEL_14;
          }
        }
        unint64_t v14 = [(VUILibrarySeasonViewModel *)self type];
        BOOL v13 = v14 == [(VUILibrarySeasonViewModel *)v6 type];
LABEL_15:

        goto LABEL_16;
      }
    }
    BOOL v13 = 0;
  }
LABEL_16:

  return v13;
}

- (VUIMediaEntityIdentifier)seasonIdentifier
{
  return self->_seasonIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end