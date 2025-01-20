@interface POXSChoiceDefinition
- (NSArray)elements;
- (POXSChoiceDefinition)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elementForValue:(id)a3;
- (void)setName:(id)a3 namespaceURI:(id)a4 forType:(Class)a5;
@end

@implementation POXSChoiceDefinition

- (POXSChoiceDefinition)init
{
  v6.receiver = self;
  v6.super_class = (Class)POXSChoiceDefinition;
  v2 = [(POXSDefinition *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    elements = v2->_elements;
    v2->_elements = (NSMapTable *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POXSChoiceDefinition;
  v5 = -[POXSDefinition copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSMapTable *)self->_elements copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (id)elementForValue:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_elements objectForKey:objc_opt_class()];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(NSMapTable *)self->_elements objectForKey:objc_opt_class()];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSArray)elements
{
  v2 = [(NSMapTable *)self->_elements objectEnumerator];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)setName:(id)a3 namespaceURI:(id)a4 forType:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[POXSElement alloc] initWithElementName:v9 namespaceURI:v8 type:a5];

  [(NSMapTable *)self->_elements setObject:v10 forKey:a5];
  [(POXSDefinition *)self setType:a5 forName:v9];
}

- (void).cxx_destruct
{
}

@end