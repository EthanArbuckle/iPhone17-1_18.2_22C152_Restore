@interface SXSmartFieldFactory
- (SXActionProvider)actionProvider;
- (SXActionSerializer)actionSerializer;
- (SXSmartFieldFactory)initWithActionProvider:(id)a3 actionSerializer:(id)a4;
- (id)smartFieldForAddition:(id)a3 withContext:(id)a4;
@end

@implementation SXSmartFieldFactory

- (SXSmartFieldFactory)initWithActionProvider:(id)a3 actionSerializer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXSmartFieldFactory;
  v9 = [(SXSmartFieldFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionProvider, a3);
    objc_storeStrong((id *)&v10->_actionSerializer, a4);
  }

  return v10;
}

- (id)smartFieldForAddition:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SXSmartFieldFactory *)self actionProvider];
  v9 = [v8 actionForAddition:v7];

  if (v9)
  {
    v10 = [(SXSmartFieldFactory *)self actionSerializer];
    v11 = [v10 URLForAction:v9 type:1];

    objc_super v12 = [[SXSmartField alloc] initWithContext:v6 URL:v11 action:v9];
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (SXActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SXActionSerializer)actionSerializer
{
  return self->_actionSerializer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSerializer, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
}

@end