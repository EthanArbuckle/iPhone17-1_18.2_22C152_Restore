@interface _TUIRenderUpdateCollectionSectionChanges
- (NSArray)sectionUpdates;
- (NSString)description;
- (TUIRenderModelCollection)model;
- (_TUIRenderUpdateCollectionSectionChanges)initWithSectionUpdates:(id)a3 model:(id)a4;
- (void)applyToContext:(id)a3;
@end

@implementation _TUIRenderUpdateCollectionSectionChanges

- (_TUIRenderUpdateCollectionSectionChanges)initWithSectionUpdates:(id)a3 model:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIRenderUpdateCollectionSectionChanges;
  v8 = [(_TUIRenderUpdateCollectionSectionChanges *)&v12 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    sectionUpdates = v8->_sectionUpdates;
    v8->_sectionUpdates = v9;

    objc_storeStrong((id *)&v8->_model, a4);
  }

  return v8;
}

- (void)applyToContext:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_sectionUpdates;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) applyToContext:v4 v9];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" sectionUpdates=%@", self->_sectionUpdates];
  [v6 appendFormat:@" model=%@", self->_model];
  [v6 appendFormat:@">"];
  id v7 = [v6 copy];

  return (NSString *)v7;
}

- (TUIRenderModelCollection)model
{
  return self->_model;
}

- (NSArray)sectionUpdates
{
  return self->_sectionUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionUpdates, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end