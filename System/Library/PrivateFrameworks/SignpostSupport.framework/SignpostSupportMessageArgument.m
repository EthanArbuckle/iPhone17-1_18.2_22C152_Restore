@interface SignpostSupportMessageArgument
- (BOOL)isEqual:(id)a3;
- (NSObject)argumentObject;
- (SignpostSupportMessageArgument)initWithArgumentObject:(id)a3 privacy:(id)a4;
- (unsigned)privacyLevel;
- (unsigned)type;
@end

@implementation SignpostSupportMessageArgument

- (void).cxx_destruct
{
}

- (unsigned)type
{
  return self->_type;
}

- (SignpostSupportMessageArgument)initWithArgumentObject:(id)a3 privacy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SignpostSupportMessageArgument;
  v9 = [(SignpostSupportMessageArgument *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_argumentObject, a3);
    id v11 = v8;
    v12 = v11;
    if (v11)
    {
      unint64_t v13 = [v11 unsignedLongLongValue];
      if (v13 <= 2) {
        unsigned __int8 v14 = v13 + 1;
      }
      else {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }

    v10->_privacyLevel = v14;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v15 = 1;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v15 = 3;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = 0;
            goto LABEL_17;
          }
          char v15 = 2;
        }
      }
    }
    else
    {
      char v15 = 0;
    }
    v10->_type = v15;
  }
  v16 = v10;
LABEL_17:

  return v16;
}

- (NSObject)argumentObject
{
  return self->_argumentObject;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SignpostSupportMessageArgument *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      id v7 = [(SignpostSupportMessageArgument *)self argumentObject];
      if (v7
        || ([(SignpostSupportMessageArgument *)v6 argumentObject],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v8 = [(SignpostSupportMessageArgument *)self argumentObject];
        v9 = [(SignpostSupportMessageArgument *)v6 argumentObject];
        if (v8 == v9)
        {
          char v12 = 1;
        }
        else
        {
          v10 = [(SignpostSupportMessageArgument *)self argumentObject];
          id v11 = [(SignpostSupportMessageArgument *)v6 argumentObject];
          char v12 = [v10 isEqual:v11];
        }
        if (v7) {
          goto LABEL_14;
        }
      }
      else
      {
        char v12 = 1;
      }

LABEL_14:
      goto LABEL_15;
    }
    char v12 = 0;
  }
LABEL_15:

  return v12;
}

- (unsigned)privacyLevel
{
  return self->_privacyLevel;
}

@end