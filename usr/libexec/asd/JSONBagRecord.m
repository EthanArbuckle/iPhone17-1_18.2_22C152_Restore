@interface JSONBagRecord
- (JSONBagRecord)initWithObject:(id)a3;
- (NSData)bag;
- (NSDate)updated;
- (NSUUID)id;
- (void)setBag:(id)a3;
- (void)setId:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation JSONBagRecord

- (JSONBagRecord)initWithObject:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JSONBagRecord;
  v5 = [(JSONBagRecord *)&v17 init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 id];
  if (v6)
  {
    uint64_t v7 = [v4 bag];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [v4 updated];

      if (v9)
      {
        uint64_t v10 = [v4 id];
        id = v5->_id;
        v5->_id = (NSUUID *)v10;

        uint64_t v12 = [v4 bag];
        bag = v5->_bag;
        v5->_bag = (NSData *)v12;

        uint64_t v14 = [v4 updated];
        updated = v5->_updated;
        v5->_updated = (NSDate *)v14;

        v6 = v5;
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_7:
    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSData)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSDate)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_bag, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end