@interface WBSWindowEntity
- (BOOL)isPrivate;
- (NSString)identifier;
- (NSString)title;
- (WBSWindowEntity)initWithIdentifier:(id)a3 title:(id)a4 isPrivate:(BOOL)a5;
@end

@implementation WBSWindowEntity

- (WBSWindowEntity)initWithIdentifier:(id)a3 title:(id)a4 isPrivate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(WBSWindowEntity *)self init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v10->_isPrivate = a5;
    v15 = v10;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end