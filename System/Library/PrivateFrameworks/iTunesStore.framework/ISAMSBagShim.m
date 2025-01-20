@interface ISAMSBagShim
- (BOOL)isExpired;
- (BOOL)isLoaded;
- (ISAMSBagShim)initWithBag:(id)a3;
- (ISAMSBagShim)initWithURLBag:(id)a3;
- (ISURLBag)URLBag;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (SSBag)bag;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)type;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)setBag:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setURLBag:(id)a3;
@end

@implementation ISAMSBagShim

- (ISAMSBagShim)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISAMSBagShim;
  v6 = [(ISAMSBagShim *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    if (v5) {
      v7->_type = 1;
    }
  }

  return v7;
}

- (ISAMSBagShim)initWithURLBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISAMSBagShim;
  v6 = [(ISAMSBagShim *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URLBag, a3);
    if (v5) {
      v7->_type = 2;
    }
  }

  return v7;
}

- (NSDate)expirationDate
{
  return 0;
}

- (BOOL)isExpired
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)profile
{
  return (NSString *)@"ISAMSBagShim";
}

- (NSString)profileVersion
{
  return (NSString *)@"1";
}

- (id)URLForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:5];
}

- (id)arrayForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:0];
}

- (id)BOOLForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:1];
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  AMSError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (id)dictionaryForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:6];
}

- (id)doubleForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:2];
}

- (id)integerForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:3];
}

- (id)stringForKey:(id)a3
{
  return [(ISAMSBagShim *)self _bagValueForKey:a3 valueType:4];
}

- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(ISAMSBagShim *)self bag];

  if (v7)
  {
    switch(a4)
    {
      case 0uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v25 = 0;
        objc_super v9 = [v8 arrayForKey:v6 error:&v25];
        v10 = v25;
        break;
      case 1uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v24 = 0;
        objc_super v9 = [v8 BOOLForKey:v6 error:&v24];
        v10 = v24;
        break;
      case 2uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v23 = 0;
        objc_super v9 = [v8 doubleForKey:v6 error:&v23];
        v10 = v23;
        break;
      case 3uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v22 = 0;
        objc_super v9 = [v8 integerForKey:v6 error:&v22];
        v10 = v22;
        break;
      case 4uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v21 = 0;
        objc_super v9 = [v8 stringForKey:v6 error:&v21];
        v10 = v21;
        break;
      case 5uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v20 = 0;
        objc_super v9 = [v8 URLForKey:v6 error:&v20];
        v10 = v20;
        break;
      case 6uLL:
        v8 = [(ISAMSBagShim *)self bag];
        v19 = 0;
        objc_super v9 = [v8 dictionaryForKey:v6 error:&v19];
        v10 = v19;
        break;
      default:
        BOOL v13 = 0;
        objc_super v9 = 0;
        goto LABEL_11;
    }
    id v14 = v10;
  }
  else
  {
    objc_super v9 = [(ISAMSBagShim *)self URLBag];

    if (!v9)
    {
      BOOL v13 = 0;
LABEL_11:
      id v14 = 0;
      goto LABEL_22;
    }
    v11 = [(ISAMSBagShim *)self URLBag];
    v12 = v11;
    if (a4 == 5) {
      [v11 urlForKey:v6];
    }
    else {
    objc_super v9 = [v11 valueForKey:v6];
    }

    id v14 = 0;
  }
  BOOL v13 = v9 != 0;
  if (!v14 && v9)
  {
    v15 = [MEMORY[0x263F27B48] frozenBagValueWithKey:v6 value:v9 valueType:a4];
    id v14 = 0;
    goto LABEL_26;
  }
LABEL_22:
  if (!v14 && !v13)
  {
    id v17 = v6;
    int64_t v18 = [(ISAMSBagShim *)self type];
    AMSErrorWithFormat();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_msgSend(MEMORY[0x263F27B48], "failingBagValueWithKey:valueType:error:", v6, a4, v14, v17, v18);
LABEL_26:

  return v15;
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (ISURLBag)URLBag
{
  return self->_URLBag;
}

- (void)setURLBag:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLBag, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

@end