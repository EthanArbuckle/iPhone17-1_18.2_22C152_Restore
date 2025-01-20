@interface TUIImpressionData
+ (id)newImpressionWithUUID:(id)a3 identifier:(id)a4 data:(id)a5;
- (TUIIdentifier)identifier;
- (TUIImpressionData)initWithUUID:(id)a3 identifier:(id)a4 data:(id)a5;
- (id)data;
@end

@implementation TUIImpressionData

- (TUIImpressionData)initWithUUID:(id)a3 identifier:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIImpressionData;
  v11 = [(TUIImpressionData *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v9 tui_identifierByPrependingUUID:v8];
    identifier = v11->_identifier;
    v11->_identifier = (TUIIdentifier *)v12;

    objc_storeStrong(&v11->_data, a5);
  }

  return v11;
}

+ (id)newImpressionWithUUID:(id)a3 identifier:(id)a4 data:(id)a5
{
  if (!a3 || !a4 || !a5) {
    return 0;
  }
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithUUID:v10 identifier:v9 data:v8];

  return v11;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (id)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end