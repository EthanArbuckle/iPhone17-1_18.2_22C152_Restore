@interface SXPastBodyComponentInsertionCondition
- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5;
- (CGPoint)firstBodyComponentThreshold;
- (SXComponent)firstBodyComponent;
- (id)findFirstBodyComponentInComponents:(id)a3;
- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5;
- (void)setFirstBodyComponent:(id)a3;
- (void)setFirstBodyComponentThreshold:(CGPoint)a3;
@end

@implementation SXPastBodyComponentInsertionCondition

- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  id v8 = a4;
  v7 = [(SXPastBodyComponentInsertionCondition *)self findFirstBodyComponentInComponents:a3];
  if (v7)
  {
    [v8 frameForComponent:v7];
    -[SXPastBodyComponentInsertionCondition setFirstBodyComponentThreshold:](self, "setFirstBodyComponentThreshold:", 0.0, CGRectGetMaxY(v10));
    [(SXPastBodyComponentInsertionCondition *)self setFirstBodyComponent:v7];
  }
}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v6 = a3;
  [v6 approximateLocation];
  double v8 = v7;
  [(SXPastBodyComponentInsertionCondition *)self firstBodyComponentThreshold];
  if (v8 >= v9)
  {
    char v14 = 1;
  }
  else
  {
    CGRect v10 = [v6 componentAnchor];
    v11 = [v10 targetComponentIdentifier];
    v12 = [(SXPastBodyComponentInsertionCondition *)self firstBodyComponent];
    v13 = [v12 identifier];
    char v14 = [v11 isEqualToString:v13];
  }
  return v14;
}

- (id)findFirstBodyComponentInComponents:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      double v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      if ([v8 role] == 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v8;
        v13 = [v12 components];
        char v14 = [v13 NSArray];
        id v9 = [(SXPastBodyComponentInsertionCondition *)self findFirstBodyComponentInComponents:v14];

        if (v9)
        {

          goto LABEL_17;
        }
        goto LABEL_12;
      }
LABEL_13:
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    id v9 = v8;
    CGRect v10 = [v9 text];
    unint64_t v11 = [v10 length];

    if (v11 >= 0x65) {
      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_15:
  id v9 = 0;
LABEL_17:

  return v9;
}

- (SXComponent)firstBodyComponent
{
  return self->_firstBodyComponent;
}

- (void)setFirstBodyComponent:(id)a3
{
}

- (CGPoint)firstBodyComponentThreshold
{
  double x = self->_firstBodyComponentThreshold.x;
  double y = self->_firstBodyComponentThreshold.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFirstBodyComponentThreshold:(CGPoint)a3
{
  self->_firstBodyComponentThreshold = a3;
}

- (void).cxx_destruct
{
}

@end