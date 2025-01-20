@interface _PSContact
- (BOOL)isChild;
- (CNContact)cnContact;
- (_PSContact)initWithCNContact:(id)a3 isChild:(BOOL)a4;
- (void)setCnContact:(id)a3;
- (void)setIsChild:(BOOL)a3;
@end

@implementation _PSContact

- (_PSContact)initWithCNContact:(id)a3 isChild:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSContact;
  v8 = [(_PSContact *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cnContact, a3);
    v9->_isChild = a4;
  }

  return v9;
}

- (CNContact)cnContact
{
  return self->_cnContact;
}

- (void)setCnContact:(id)a3
{
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (void)setIsChild:(BOOL)a3
{
  self->_isChild = a3;
}

- (void).cxx_destruct
{
}

@end