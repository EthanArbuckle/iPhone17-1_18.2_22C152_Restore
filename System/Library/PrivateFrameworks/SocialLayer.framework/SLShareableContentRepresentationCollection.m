@interface SLShareableContentRepresentationCollection
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSArray)representations;
- (NSString)suggestedFileName;
- (SLShareableContentRepresentationCollection)initWithBSXPCCoder:(id)a3;
- (SLShareableContentRepresentationCollection)initWithCoder:(id)a3;
- (SLShareableContentRepresentationCollection)initWithRepresentations:(id)a3 suggestedFileName:(id)a4;
- (id)description;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLShareableContentRepresentationCollection

- (SLShareableContentRepresentationCollection)initWithRepresentations:(id)a3 suggestedFileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLShareableContentRepresentationCollection;
  v8 = [(SLShareableContentRepresentationCollection *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    representations = v8->_representations;
    v8->_representations = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    suggestedFileName = v8->_suggestedFileName;
    v8->_suggestedFileName = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = [(SLShareableContentRepresentationCollection *)self suggestedFileName];
  uint64_t v4 = [v3 length];

  v5 = NSString;
  if (v4)
  {
    id v6 = [(SLShareableContentRepresentationCollection *)self suggestedFileName];
    id v7 = [(SLShareableContentRepresentationCollection *)self representations];
    v8 = [v5 stringWithFormat:@"%@: %@", v6, v7];
  }
  else
  {
    id v6 = [(SLShareableContentRepresentationCollection *)self representations];
    v8 = [v5 stringWithFormat:@"%@", v6];
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentationCollection)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(sel_representations);
  v8 = [v4 decodeCollectionOfClass:v5 containingClass:v6 forKey:v7];

  uint64_t v9 = objc_opt_class();
  v10 = NSStringFromSelector(sel_suggestedFileName);
  uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];

  v12 = [(SLShareableContentRepresentationCollection *)self initWithRepresentations:v8 suggestedFileName:v11];
  return v12;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentRepresentationCollection *)self representations];
  uint64_t v6 = NSStringFromSelector(sel_representations);
  [v4 encodeCollection:v5 forKey:v6];

  id v8 = [(SLShareableContentRepresentationCollection *)self suggestedFileName];
  id v7 = NSStringFromSelector(sel_suggestedFileName);
  [v4 encodeObject:v8 forKey:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentationCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_representations);
  id v7 = [v4 decodeArrayOfObjectsOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(sel_suggestedFileName);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = [(SLShareableContentRepresentationCollection *)self initWithRepresentations:v7 suggestedFileName:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentRepresentationCollection *)self representations];
  uint64_t v6 = NSStringFromSelector(sel_representations);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(SLShareableContentRepresentationCollection *)self suggestedFileName];
  id v7 = NSStringFromSelector(sel_suggestedFileName);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSArray)representations
{
  return self->_representations;
}

- (NSString)suggestedFileName
{
  return self->_suggestedFileName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedFileName, 0);
  objc_storeStrong((id *)&self->_representations, 0);
}

@end