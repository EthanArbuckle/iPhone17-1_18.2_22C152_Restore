@interface SXFirstViewportComponentInsertionCondition
- (BOOL)allowFirstViewportException;
- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5;
- (SXFirstViewportComponentInsertionCondition)init;
- (SXFirstViewportComponentInsertionCondition)initWithAllowFirstViewportException:(BOOL)a3;
- (void)setAllowFirstViewportException:(BOOL)a3;
@end

@implementation SXFirstViewportComponentInsertionCondition

- (SXFirstViewportComponentInsertionCondition)init
{
  return [(SXFirstViewportComponentInsertionCondition *)self initWithAllowFirstViewportException:1];
}

- (SXFirstViewportComponentInsertionCondition)initWithAllowFirstViewportException:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXFirstViewportComponentInsertionCondition;
  result = [(SXFirstViewportComponentInsertionCondition *)&v5 init];
  if (result) {
    result->_allowFirstViewportException = a3;
  }
  return result;
}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v7 approximateLocation];
  double v10 = v9;
  [v8 viewportSize];
  double v12 = v11;
  v13 = [v7 trailingComponent];
  if (v13)
  {
    BOOL v14 = 0;
  }
  else
  {
    v15 = [v7 path];
    BOOL v14 = [v15 count] == 0;
  }
  [v8 documentSize];
  double v17 = v16;
  [v8 viewportSize];
  if (v10 >= v12)
  {
    char v22 = 1;
  }
  else
  {
    double v19 = v18;
    BOOL v20 = [(SXFirstViewportComponentInsertionCondition *)self allowFirstViewportException];
    BOOL v21 = v17 <= v19 && v20;
    char v22 = v21 && v14;
  }

  return v22;
}

- (BOOL)allowFirstViewportException
{
  return self->_allowFirstViewportException;
}

- (void)setAllowFirstViewportException:(BOOL)a3
{
  self->_allowFirstViewportException = a3;
}

@end