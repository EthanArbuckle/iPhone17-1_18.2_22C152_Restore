@interface ICFallbackSystemTextAttachment
- (ICFallbackSystemTextAttachment)initWithData:(id)a3 type:(id)a4 contentIdentifier:(id)a5 systemClassName:(id)a6;
- (NSString)contentIdentifier;
- (NSString)systemClassName;
@end

@implementation ICFallbackSystemTextAttachment

- (ICFallbackSystemTextAttachment)initWithData:(id)a3 type:(id)a4 contentIdentifier:(id)a5 systemClassName:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ICFallbackSystemTextAttachment;
  v13 = [(ICFallbackSystemTextAttachment *)&v16 initWithData:a3 ofType:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentIdentifier, a5);
    objc_storeStrong((id *)&v14->_systemClassName, a6);
  }

  return v14;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)systemClassName
{
  return self->_systemClassName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemClassName, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

@end