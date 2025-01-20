@interface OADGenericTextField
- (BOOL)isSimilarToTextRun:(id)a3;
- (NSString)guid;
- (NSString)type;
- (OADGenericTextField)initWithGuid:(id)a3 type:(id)a4;
- (void)setGuid:(id)a3;
- (void)setType:(id)a3;
@end

@implementation OADGenericTextField

- (OADGenericTextField)initWithGuid:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OADGenericTextField;
  v8 = [(OADTextField *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    guid = v8->_guid;
    v8->_guid = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    type = v8->_type;
    v8->_type = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADGenericTextField;
  if ([(OADTextRun *)&v11 isSimilarToTextRun:v4])
  {
    v5 = [(OADGenericTextField *)self guid];
    id v6 = [v4 guid];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [(OADGenericTextField *)self type];
      v8 = [v4 type];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end