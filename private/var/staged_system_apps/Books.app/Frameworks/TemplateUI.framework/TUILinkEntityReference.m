@interface TUILinkEntityReference
- (NSSet)actions;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (NSString)type;
- (TUIIdentifier)renderIdentifier;
- (TUILinkEntityModel)model;
- (TUILinkEntityReference)initWithModel:(id)a3 path:(id)a4 renderIdentifier:(id)a5;
- (_TUILinkEntityReferencePath)path;
- (id)resolvePath;
@end

@implementation TUILinkEntityReference

- (TUILinkEntityReference)initWithModel:(id)a3 path:(id)a4 renderIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUILinkEntityReference;
  v12 = [(TUILinkEntityReference *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    objc_storeStrong((id *)&v13->_renderIdentifier, a5);
  }

  return v13;
}

- (NSString)type
{
  return [(TUILinkEntityModel *)self->_model type];
}

- (NSString)identifier
{
  return [(TUILinkEntityModel *)self->_model identifier];
}

- (NSString)title
{
  return [(TUILinkEntityModel *)self->_model title];
}

- (NSSet)actions
{
  return [(TUILinkEntityModel *)self->_model actions];
}

- (id)resolvePath
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v4 = self->_path;
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = [v5 identifier];
      [v3 insertObject:v6 atIndex:0];

      uint64_t v7 = [v5 parent];

      v5 = (void *)v7;
    }
    while (v7);
  }
  [v3 addObject:self->_renderIdentifier];
  id v8 = [v3 copy];

  return v8;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(TUILinkEntityModel *)self->_model type];
  v6 = [(TUILinkEntityModel *)self->_model identifier];
  uint64_t v7 = [(TUILinkEntityModel *)self->_model title];
  id v8 = +[NSString stringWithFormat:@"<%@ type=%@ identifier=%@ title='%@'>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (TUILinkEntityModel)model
{
  return self->_model;
}

- (_TUILinkEntityReferencePath)path
{
  return self->_path;
}

- (TUIIdentifier)renderIdentifier
{
  return self->_renderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderIdentifier, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end