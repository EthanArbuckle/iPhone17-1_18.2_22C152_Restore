@interface TUIRenderModelView
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSString)description;
- (NSString)reuseIdentifier;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModel)submodel;
- (TUIRenderModelView)initWithReuseIdentifier:(id)a3 identifier:(id)a4 submodel:(id)a5;
- (TUIRenderModelView)initWithReuseIdentifier:(id)a3 identifier:(id)a4 submodel:(id)a5 style:(id)a6;
- (TUIRenderStyling)style;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4;
- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)prepare;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)teardown;
@end

@implementation TUIRenderModelView

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModelView)initWithReuseIdentifier:(id)a3 identifier:(id)a4 submodel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIRenderModelView;
  v11 = [(TUIRenderModelView *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    reuseIdentifier = v11->_reuseIdentifier;
    v11->_reuseIdentifier = v12;

    objc_storeStrong((id *)&v11->_submodel, a5);
    v14 = (TUIIdentifier *)[v9 copyWithZone:0];
    identifier = v11->_identifier;
    v11->_identifier = v14;
  }
  return v11;
}

- (TUIRenderModelView)initWithReuseIdentifier:(id)a3 identifier:(id)a4 submodel:(id)a5 style:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TUIRenderModelView;
  v14 = [(TUIRenderModelView *)&v20 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    reuseIdentifier = v14->_reuseIdentifier;
    v14->_reuseIdentifier = v15;

    objc_storeStrong((id *)&v14->_submodel, a5);
    objc_storeStrong((id *)&v14->_style, a6);
    objc_super v17 = (TUIIdentifier *)[v11 copyWithZone:0];
    identifier = v14->_identifier;
    v14->_identifier = v17;
  }
  return v14;
}

- (CGSize)size
{
  submodel = self->_submodel;
  if (submodel)
  {
    [(TUIRenderModel *)submodel size];
  }
  else
  {
    double width = self->_size.width;
    double height = self->_size.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  if (self->_submodel) {
    -[TUIRenderModel setSize:](self->_submodel, "setSize:", a3.width, a3.height);
  }
  else {
    self->_size = a3;
  }
}

- (void)prepare
{
}

- (void)teardown
{
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  submodel = self->_submodel;
  long long v5 = *(_OWORD *)&a4->c;
  v6[0] = *(_OWORD *)&a4->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->tx;
  [(TUIRenderModel *)submodel appendResourcesToCollector:a3 transform:v6];
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  submodel = self->_submodel;
  long long v7 = *(_OWORD *)&a4->c;
  v8[0] = *(_OWORD *)&a4->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a4->tx;
  [(TUIRenderModel *)submodel appendReferencesToCollector:a3 transform:v8 query:a5 liveTransformResolver:a6];
}

- (NSArray)debugContainedSubmodels
{
  if (self->_submodel)
  {
    submodel = self->_submodel;
    v2 = +[NSArray arrayWithObjects:&submodel count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  reuseIdentifier = self->_reuseIdentifier;
  identifier = self->_identifier;
  id v8 = [(TUIRenderModel *)self->_submodel copyForInitialAppearanceWithFlags:a3];
  id v9 = [v5 initWithReuseIdentifier:reuseIdentifier identifier:identifier submodel:v8 style:self->_style];

  TUIRenderModelCopyProperties(v9, self);
  return v9;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  reuseIdentifier = self->_reuseIdentifier;
  identifier = self->_identifier;
  id v8 = [(TUIRenderModel *)self->_submodel copyForFinalAppearanceWithFlags:a3];
  id v9 = [v5 initWithReuseIdentifier:reuseIdentifier identifier:identifier submodel:v8 style:self->_style];

  TUIRenderModelCopyProperties(v9, self);
  return v9;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  reuseIdentifier = self->_reuseIdentifier;
  v14 = [v11 reuseIdentifier];
  if (![(NSString *)reuseIdentifier isEqualToString:v14])
  {
    objc_super v17 = 0;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v15 = objc_opt_class();
  v16 = [v11 submodel];
  if (v15 != objc_opt_class())
  {
    objc_super v17 = 0;
LABEL_7:

    goto LABEL_8;
  }
  unsigned int v18 = [(TUIRenderModel *)self->_submodel conformsToProtocol:&OBJC_PROTOCOL___TUIRenderModelContaining];

  if (v18)
  {
    submodel = self->_submodel;
    v14 = [v10 submodel];
    v16 = [v11 submodel];
    objc_super v17 = [(TUIRenderModel *)submodel computeContainerUpdateCurrent:v14 from:v16 tracker:v12 flags:a6];
    goto LABEL_7;
  }
  objc_super v17 = 0;
LABEL_9:

  return v17;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  id v5 = [(TUIRenderModel *)self->_submodel newToContainerPlusDeletesWithUpdate:a3 interests:a4];
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithReuseIdentifier:self->_reuseIdentifier identifier:self->_identifier submodel:v5 style:self->_style];
  TUIRenderModelCopyProperties(v6, self);

  return v6;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  submodel = self->_submodel;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 submodel];
  id v10 = [(TUIRenderModel *)submodel newCurrentContainerPlusInsertsWithCurrent:v9 update:v7];

  id v11 = [objc_alloc((Class)objc_opt_class()) initWithReuseIdentifier:self->_reuseIdentifier identifier:self->_identifier submodel:v10 style:self->_style];
  TUIRenderModelCopyProperties(v11, v8);

  return v11;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = v4;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      TUIDynamicCast(v6, v4);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v7;
    if (TUIRenderModelIsEqualToRenderModel(self, v7))
    {
      id v10 = [(TUIRenderModelView *)self reuseIdentifier];
      id v11 = [v9 reuseIdentifier];
      if (v10 == v11 || [v10 isEqualToString:v11])
      {
        style = self->_style;
        id v13 = [v9 style];
        if (style == v13)
        {
          submodel = self->_submodel;
          uint64_t v15 = [v9 submodel];
          if (submodel == v15)
          {
            unsigned __int8 v8 = 1;
          }
          else
          {
            v16 = self->_submodel;
            objc_super v17 = [v9 submodel];
            unsigned __int8 v8 = [(TUIRenderModel *)v16 isEqualToRenderModel:v17];
          }
        }
        else
        {
          unsigned __int8 v8 = 0;
        }
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return [(TUIRenderModel *)self->_submodel handlesAlphaForInitialAppearance];
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return [(TUIRenderModel *)self->_submodel handlesAlphaForFinalAppearance];
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelView *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  [(TUIRenderModelView *)self size];
  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSValue valueWithBytes:v12 objCType:"{CGSize=dd}"];
  [v6 appendFormat:@" size=%@", v9];

  [v6 appendFormat:@" identifier=%@", self->_identifier];
  [v6 appendFormat:@" reuseIdentifier=%@", self->_reuseIdentifier];
  [v6 appendFormat:@" submodel=%@", self->_submodel];
  [v6 appendFormat:@">"];
  id v10 = [v6 copy];

  return (NSString *)v10;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (TUIRenderModel)submodel
{
  return self->_submodel;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (TUIRenderStyling)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_submodel, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end