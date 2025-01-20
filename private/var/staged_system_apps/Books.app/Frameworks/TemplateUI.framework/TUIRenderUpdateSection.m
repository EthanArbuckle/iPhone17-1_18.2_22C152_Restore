@interface TUIRenderUpdateSection
- (BOOL)hasChangesToApply;
- (BOOL)hasInvalidationsToApply;
- (NSIndexSet)viewUpdates;
- (TUIRenderModelSection)from;
- (TUIRenderModelSection)to;
- (TUIRenderUpdateSection)initWithFrom:(id)a3 to:(id)a4;
- (id)description;
- (void)_computeViewUpdate;
- (void)applyToContext:(id)a3;
- (void)debugViewIdentifiersWithPackage:(id)a3;
@end

@implementation TUIRenderUpdateSection

- (TUIRenderUpdateSection)initWithFrom:(id)a3 to:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIRenderUpdateSection;
  v9 = [(TUIRenderUpdateSection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_from, a3);
    objc_storeStrong((id *)&v10->_to, a4);
    [(TUIRenderUpdateSection *)v10 _computeViewUpdate];
  }

  return v10;
}

- (void)_computeViewUpdate
{
  location = (char *)[(TUIRenderModelSection *)self->_from viewRange];
  NSUInteger length = v4;
  v6 = (char *)[(TUIRenderModelSection *)self->_to viewRange];
  v8.location = (NSUInteger)v6;
  v8.NSUInteger length = v7;
  if (location == (char *)0x7FFFFFFFFFFFFFFFLL || v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (location == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      location = v6;
      NSUInteger length = v7;
      BOOL v10 = v6 == (char *)0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      BOOL v10 = 0;
    }
    if (v10) {
      goto LABEL_49;
    }
  }
  else
  {
    v35.location = (NSUInteger)location;
    v35.NSUInteger length = length;
    NSRange v11 = NSUnionRange(v35, v8);
    location = (char *)v11.location;
    NSUInteger length = v11.length;
  }
  if (location != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    from = self->_from;
    if (from)
    {
      [(TUIRenderModelSection *)from config];
      int v13 = v34;
    }
    else
    {
      int v13 = 0;
    }
    to = self->_to;
    if (to)
    {
      [(TUIRenderModelSection *)to config];
      int v15 = v33;
    }
    else
    {
      int v15 = 0;
    }
    if (v13 == v15)
    {
      v16 = self->_from;
      if (v16)
      {
        [(TUIRenderModelSection *)v16 config];
        if (v32)
        {
          v17 = self->_from;
          if (v17)
          {
            [(TUIRenderModelSection *)v17 config];
            double v18 = v31;
          }
          else
          {
            double v18 = 0.0;
          }
          v20 = self->_to;
          if (v20)
          {
            [(TUIRenderModelSection *)v20 config];
            double v21 = v30;
          }
          else
          {
            double v21 = 0.0;
          }
          BOOL v19 = v18 == v21;
        }
        else
        {
          BOOL v19 = 1;
        }
      }
      else
      {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
    if (location >= &location[length])
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      do
      {
        v23 = [(TUIRenderModelSection *)self->_from viewModelWithIndex:location];
        uint64_t v24 = [(TUIRenderModelSection *)self->_to viewModelWithIndex:location];
        v25 = (void *)v24;
        if (v23) {
          BOOL v26 = v19;
        }
        else {
          BOOL v26 = 0;
        }
        BOOL v27 = !v26 || v24 == 0;
        if (v27 || ([v23 isEqualToRenderModel:v24] & 1) == 0)
        {
          if (!v22) {
            v22 = objc_opt_new();
          }
          [v22 addIndex:location];
        }

        ++location;
        --length;
      }
      while (length);
    }
    v28 = (NSIndexSet *)[v22 copy];
    viewUpdates = self->_viewUpdates;
    self->_viewUpdates = v28;
  }
LABEL_49:
  self->_hasInvalidationsToApply = [(NSIndexSet *)self->_viewUpdates count] != 0;
}

- (void)debugViewIdentifiersWithPackage:(id)a3
{
  id v4 = a3;
  viewUpdates = self->_viewUpdates;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_16937C;
  v7[3] = &unk_253470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSIndexSet *)viewUpdates enumerateIndexesUsingBlock:v7];
}

- (void)applyToContext:(id)a3
{
  id v4 = a3;
  if ([(NSIndexSet *)self->_viewUpdates count])
  {
    unint64_t v5 = [(TUIRenderModelSection *)self->_to section];
    id v6 = objc_opt_new();
    viewUpdates = self->_viewUpdates;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    NSRange v11 = sub_1695DC;
    objc_super v12 = &unk_256EB8;
    id v13 = v6;
    unint64_t v14 = v5;
    id v8 = v6;
    [(NSIndexSet *)viewUpdates enumerateIndexesUsingBlock:&v9];
    [v4 invalidateIndexPaths:v8, v9, v10, v11, v12];
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" from=%@", self->_from];
  [v6 appendFormat:@" to=%@", self->_to];
  [v6 appendFormat:@" viewUpdates=%@", self->_viewUpdates];
  [v6 appendFormat:@">"];
  id v7 = [v6 copy];

  return v7;
}

- (TUIRenderModelSection)from
{
  return self->_from;
}

- (TUIRenderModelSection)to
{
  return self->_to;
}

- (BOOL)hasChangesToApply
{
  return self->_hasChangesToApply;
}

- (BOOL)hasInvalidationsToApply
{
  return self->_hasInvalidationsToApply;
}

- (NSIndexSet)viewUpdates
{
  return self->_viewUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewUpdates, 0);
  objc_storeStrong((id *)&self->_to, 0);

  objc_storeStrong((id *)&self->_from, 0);
}

@end