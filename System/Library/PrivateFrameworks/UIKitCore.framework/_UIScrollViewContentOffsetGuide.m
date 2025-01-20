@interface _UIScrollViewContentOffsetGuide
- (BOOL)_uili_requiresObservationForVariable:(id)a3;
- (id)_boundsHeightVariable;
- (id)_boundsWidthVariable;
- (id)_minXVariable;
- (id)_minYVariable;
- (id)nsli_boundsHeightVariable;
- (id)nsli_boundsWidthVariable;
- (id)nsli_minXVariable;
- (id)nsli_minYVariable;
- (void)_setOwningView:(id)a3;
@end

@implementation _UIScrollViewContentOffsetGuide

- (void)_setOwningView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewContentOffsetGuide;
  [(UILayoutGuide *)&v3 _setOwningView:a3];
}

- (id)nsli_boundsWidthVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = objc_msgSend(v2, "nsli_contentXOffsetVariable");

  return v3;
}

- (id)nsli_boundsHeightVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = objc_msgSend(v2, "nsli_contentYOffsetVariable");

  return v3;
}

- (id)_minXVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = [v2 _minXVariable];

  return v3;
}

- (id)_minYVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = [v2 _minYVariable];

  return v3;
}

- (id)_boundsWidthVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = objc_msgSend(v2, "nsli_contentXOffsetVariable");

  return v3;
}

- (id)_boundsHeightVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = objc_msgSend(v2, "nsli_contentYOffsetVariable");

  return v3;
}

- (id)nsli_minXVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = objc_msgSend(v2, "nsli_minXVariable");

  return v3;
}

- (id)nsli_minYVariable
{
  v2 = [(UILayoutGuide *)self owningView];
  objc_super v3 = objc_msgSend(v2, "nsli_minYVariable");

  return v3;
}

- (BOOL)_uili_requiresObservationForVariable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIScrollViewContentOffsetGuide *)self _minXVariable];
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  id v7 = [(_UIScrollViewContentOffsetGuide *)self _minYVariable];

  if (v7 == v4)
  {
LABEL_5:
    v9 = [(UILayoutGuide *)self owningView];
    char v8 = objc_msgSend(v9, "_uili_requiresObservationForVariable:", v4);

    goto LABEL_6;
  }
  char v8 = 0;
LABEL_6:

  return v8;
}

@end