@interface TUIHostingProperties
- (BOOL)isEqual:(id)a3;
- (NSString)designatedIdentifier;
- (NSString)groupIdentifier;
- (TUIHostingProperties)initWithPresentation:(unint64_t)a3 flags:(unint64_t)a4 arrowDirection:(unint64_t)a5 groupIdentifier:(id)a6 groupPriority:(unint64_t)a7 designatedIdentifier:(id)a8;
- (unint64_t)arrowDirection;
- (unint64_t)flags;
- (unint64_t)groupPriority;
- (unint64_t)hash;
- (unint64_t)presentation;
@end

@implementation TUIHostingProperties

- (TUIHostingProperties)initWithPresentation:(unint64_t)a3 flags:(unint64_t)a4 arrowDirection:(unint64_t)a5 groupIdentifier:(id)a6 groupPriority:(unint64_t)a7 designatedIdentifier:(id)a8
{
  id v15 = a6;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)TUIHostingProperties;
  v17 = [(TUIHostingProperties *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_presentation = a3;
    v17->_flags = a4;
    objc_storeStrong((id *)&v17->_groupIdentifier, a6);
    v18->_groupPriority = a7;
    v18->_arrowDirection = a5;
    objc_storeStrong((id *)&v18->_designatedIdentifier, a8);
  }

  return v18;
}

- (unint64_t)hash
{
  return self->_flags ^ self->_presentation ^ self->_arrowDirection;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    BOOL v6 = self->_presentation == v7[1]
      && self->_arrowDirection == v7[2]
      && self->_flags == v7[3]
      && self->_designatedIdentifier == (NSString *)v7[4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)presentation
{
  return self->_presentation;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSString)designatedIdentifier
{
  return self->_designatedIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)groupPriority
{
  return self->_groupPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_designatedIdentifier, 0);
}

@end