@interface CRLShapeLibraryObject
- (CRLShapeLibraryObject)initWithDictionary:(id)a3;
- (NSDictionary)p_dictionary;
- (id)objectForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)i_removeObjectForKey:(id)a3;
@end

@implementation CRLShapeLibraryObject

- (CRLShapeLibraryObject)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeLibraryObject;
  v6 = [(CRLShapeLibraryObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeLibraryObject *)self p_dictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)valueForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeLibraryObject *)self p_dictionary];
  v6 = [v5 valueForKeyPath:v4];

  return v6;
}

- (void)i_removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLShapeLibraryObject *)self p_dictionary];
  v6 = (NSDictionary *)[v5 mutableCopy];

  [(NSDictionary *)v6 removeObjectForKey:v4];
  dictionary = self->_dictionary;
  self->_dictionary = v6;
}

- (NSDictionary)p_dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end