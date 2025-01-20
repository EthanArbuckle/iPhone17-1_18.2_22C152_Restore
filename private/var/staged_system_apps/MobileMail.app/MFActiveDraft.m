@interface MFActiveDraft
- (EMObjectID)originalMessageIdentifier;
- (MFActiveDraft)initWithIdentifier:(id)a3 andOriginalMessageIdentifier:(id)a4;
- (NSString)ef_publicDescription;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
- (void)setOriginalMessageIdentifier:(id)a3;
@end

@implementation MFActiveDraft

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessageIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)ef_publicDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MFActiveDraft *)self identifier];
  v6 = [(MFActiveDraft *)self originalMessageIdentifier];
  v7 = [v6 stringHash];
  v8 = [v7 ef_publicDescription];
  v9 = +[NSString stringWithFormat:@"<%@: %p>\n\tidentifier:%@\n\toriginalMessageIdentifier:%@\n", v4, self, v5, v8];

  return (NSString *)v9;
}

- (MFActiveDraft)initWithIdentifier:(id)a3 andOriginalMessageIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFActiveDraft;
  v8 = [(MFActiveDraft *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_originalMessageIdentifier, a4);
  }

  return v8;
}

- (EMObjectID)originalMessageIdentifier
{
  return self->_originalMessageIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setOriginalMessageIdentifier:(id)a3
{
}

@end