@interface TUIRenderModelSpinner
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
- (TUIRenderModelSpinner)initWithReuseIdentifier:(id)a3 identifier:(id)a4;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4;
- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelSpinner

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModel)submodel
{
  return 0;
}

- (NSArray)debugContainedSubmodels
{
  return (NSArray *)&__NSArray0__struct;
}

- (TUIRenderModelSpinner)initWithReuseIdentifier:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelSpinner;
  v8 = [(TUIRenderModelSpinner *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    reuseIdentifier = v8->_reuseIdentifier;
    v8->_reuseIdentifier = v9;

    v11 = (TUIIdentifier *)[v7 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v11;
  }
  return v8;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = TUIDynamicCast(v5, v4);

  if (TUIRenderModelIsEqualToRenderModel(self, v6))
  {
    id v7 = [(TUIRenderModelSpinner *)self reuseIdentifier];
    v8 = [v6 reuseIdentifier];
    BOOL v9 = v7 == v8 || [v7 isEqualToString:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  return 0;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithReuseIdentifier:self->_reuseIdentifier identifier:self->_identifier];
  TUIRenderModelCopyProperties(v5, self);
  return v5;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithReuseIdentifier:self->_reuseIdentifier identifier:self->_identifier];
  TUIRenderModelCopyProperties(v6, v5);

  return v6;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelSpinner *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  [(TUIRenderModelSpinner *)self size];
  v11[0] = v7;
  v11[1] = v8;
  BOOL v9 = +[NSValue valueWithBytes:v11 objCType:"{CGSize=dd}"];
  [v6 appendFormat:@" size=%@", v9];

  [v6 appendFormat:@" identifier=%@", self->_identifier];
  [v6 appendFormat:@" reuseIdentifier=%@", self->_reuseIdentifier];
  [v6 appendFormat:@">"];

  return (NSString *)v6;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end