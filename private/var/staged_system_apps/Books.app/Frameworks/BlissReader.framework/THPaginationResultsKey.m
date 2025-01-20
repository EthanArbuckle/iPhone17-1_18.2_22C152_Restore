@interface THPaginationResultsKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)contentNodeGUID;
- (THPaginationResultsKey)initWithCoder:(id)a3;
- (THPaginationResultsKey)initWithContentNode:(id)a3 presentationType:(id)a4;
- (THPaginationResultsKey)initWithContentNodeGUID:(id)a3 presentationType:(id)a4;
- (THPresentationType)presentationType;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContentNodeGUID:(id)a3;
- (void)setPresentationType:(id)a3;
@end

@implementation THPaginationResultsKey

- (THPaginationResultsKey)initWithContentNodeGUID:(id)a3 presentationType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THPaginationResultsKey;
  v6 = [(THPaginationResultsKey *)&v8 init];
  if (v6)
  {
    v6->_contentNodeGUID = (NSString *)[a3 copy];
    v6->_presentationType = (THPresentationType *)[a4 copyFixingSize];
  }
  return v6;
}

- (THPaginationResultsKey)initWithContentNode:(id)a3 presentationType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THPaginationResultsKey;
  v6 = [(THPaginationResultsKey *)&v8 init];
  if (v6)
  {
    v6->_contentNodeGUID = (NSString *)objc_msgSend(objc_msgSend(a3, "nodeGUID"), "copy");
    v6->_presentationType = (THPresentationType *)[a4 copyFixingSize];
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THPaginationResultsKey)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THPaginationResultsKey;
  v4 = [(THPaginationResultsKey *)&v6 init];
  if (v4)
  {
    v4->_contentNodeGUID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"contentNodeGUID"), "copy");
    v4->_presentationType = (THPresentationType *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"presentationTypeGUID"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:[self contentNodeGUID] forKey:@"contentNodeGUID"];
  v5 = [(THPaginationResultsKey *)self presentationType];

  [a3 encodeObject:v5 forKey:@"presentationTypeGUID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  contentNodeGUID = self->_contentNodeGUID;
  presentationType = self->_presentationType;

  return [v4 initWithContentNodeGUID:contentNodeGUID presentationType:presentationType];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(THPaginationResultsKey *)self contentNodeGUID] hash];
  return [(THPresentationType *)[(THPaginationResultsKey *)self presentationType] hashIncludingSize]+ v3;
}

- (void)dealloc
{
  self->_contentNodeGUID = 0;
  self->_presentationType = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPaginationResultsKey;
  [(THPaginationResultsKey *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  unsigned int v5 = -[NSString isEqualToString:](-[THPaginationResultsKey contentNodeGUID](self, "contentNodeGUID"), "isEqualToString:", [v4 contentNodeGUID]);
  if (v5)
  {
    objc_super v6 = [(THPaginationResultsKey *)self presentationType];
    id v7 = [v4 presentationType];
    LOBYTE(v5) = [(THPresentationType *)v6 isEqualIncludingSize:v7];
  }
  return v5;
}

- (NSString)contentNodeGUID
{
  return self->_contentNodeGUID;
}

- (void)setContentNodeGUID:(id)a3
{
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
}

@end