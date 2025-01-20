@interface SXImageRecordValueTransformer
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXImageRecordValueTransformer)initWithDOMObjectProvider:(id)a3;
- (id)transformValueForRecord:(id)a3 descriptor:(id)a4;
@end

@implementation SXImageRecordValueTransformer

- (SXImageRecordValueTransformer)initWithDOMObjectProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXImageRecordValueTransformer;
  v6 = [(SXImageRecordValueTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_DOMObjectProvider, a3);
  }

  return v7;
}

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  v7 = [a3 jsonDictionary];
  v8 = [v6 key];

  objc_super v9 = [v7 objectForKey:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 objectForKey:@"imageIdentifier"];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  v11 = v10;
  if (v10)
  {
    v12 = [(SXImageRecordValueTransformer *)self DOMObjectProvider];
    v13 = [v12 imageResourceForIdentifier:v11];

    goto LABEL_9;
  }
LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
}

@end