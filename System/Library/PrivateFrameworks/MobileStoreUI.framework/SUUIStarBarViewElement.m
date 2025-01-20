@interface SUUIStarBarViewElement
- (SUUIStarBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (float)value;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)numberOfRatings;
- (int64_t)numberOfStars;
@end

@implementation SUUIStarBarViewElement

- (SUUIStarBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIStarBarViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"count"];
    v9->_numberOfRatings = [v10 integerValue];

    v11 = [v8 getAttribute:@"numStars"];
    v9->_numberOfStars = [v11 integerValue];

    v12 = [v8 getAttribute:@"value"];
    [v12 floatValue];
    v9->_value = v13;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIStarBarViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIStarBarViewElement;
  v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_numberOfRatings = [(SUUIStarBarViewElement *)v4 numberOfRatings];
    self->_numberOfStars = [(SUUIStarBarViewElement *)v4 numberOfStars];
    [(SUUIStarBarViewElement *)v4 value];
    self->_value = v7;
  }

  return v6;
}

- (int64_t)numberOfRatings
{
  return self->_numberOfRatings;
}

- (int64_t)numberOfStars
{
  return self->_numberOfStars;
}

- (float)value
{
  return self->_value;
}

@end