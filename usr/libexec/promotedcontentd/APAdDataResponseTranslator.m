@interface APAdDataResponseTranslator
- (APAdDataResponseTranslator)initWithResponse:(id)a3 forRequester:(id)a4 contentIdentifier:(id)a5 withContext:(id)a6 placement:(int64_t)a7;
- (APContext)context;
- (NSString)contentIdentifier;
- (id)translate:(id *)a3;
- (int64_t)placement;
- (void)setContentIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setPlacement:(int64_t)a3;
@end

@implementation APAdDataResponseTranslator

- (APAdDataResponseTranslator)initWithResponse:(id)a3 forRequester:(id)a4 contentIdentifier:(id)a5 withContext:(id)a6 placement:(int64_t)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)APAdDataResponseTranslator;
  v15 = [(APResponseDataTranslator *)&v18 initWithResponse:a3 forRequester:a4];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contentIdentifier, a5);
    objc_storeStrong((id *)&v16->_context, a6);
    v16->_placement = a7;
  }

  return v16;
}

- (id)translate:(id *)a3
{
  v5 = [(APResponseDataTranslator *)self requester];
  v6 = [(APResponseDataTranslator *)self response];
  v7 = [v6 adOriginalRequesterId];
  v8 = [v5 requestFromRequestID:v7];

  if (v8)
  {
    v9 = [APContentDataInternal alloc];
    v10 = [(APResponseDataTranslator *)self response];
    v11 = [(APAdDataResponseTranslator *)self contentIdentifier];
    v12 = [(APAdDataResponseTranslator *)self context];
    id v13 = [v12 identifier];
    int64_t v14 = [(APAdDataResponseTranslator *)self placement];
    v15 = [(APAdDataResponseTranslator *)self context];
    [v15 maxSize];
    v16 = -[APContentDataInternal initWithAdData:identifier:contextIdentifier:placementType:maxSize:](v9, "initWithAdData:identifier:contextIdentifier:placementType:maxSize:", v10, v11, v13, v14);

    v17 = [(APContentDataInternal *)v16 content];
    *a3 = [v17 error];
  }
  else
  {
    v17 = [(APResponseDataTranslator *)self response];
    objc_super v18 = [v17 adDataResponseIdentifier];
    v19 = [(APResponseDataTranslator *)self response];
    v20 = [v19 adOriginalRequesterId];
    v21 = [(APResponseDataTranslator *)self requester];
    v22 = [v21 requestIdentifier];
    v23 = +[NSString stringWithFormat:@"Ad %@ with original requester id (%@) was returned to wrong requester (%@)", v18, v20, v22];
    *a3 = +[APLegacyInterfaceError validationErrorWithCode:4506 andReason:v23];

    v16 = 0;
  }

  return v16;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)setContentIdentifier:(id)a3
{
}

- (APContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (int64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(int64_t)a3
{
  self->_placement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

@end