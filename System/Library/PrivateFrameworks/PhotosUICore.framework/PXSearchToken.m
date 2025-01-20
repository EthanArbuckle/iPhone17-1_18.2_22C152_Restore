@interface PXSearchToken
- (NSAttributedString)attributedText;
- (NSString)text;
- (PXSearchToken)initWithAttributedText:(id)a3 searchObject:(id)a4 representedObject:(id)a5;
- (PXSearchToken)initWithText:(id)a3 image:(id)a4 representedObject:(id)a5;
- (PXSearchToken)initWithText:(id)a3 searchObject:(id)a4 representedObject:(id)a5;
- (PXSearchTokenRepresentedObject)representedObject;
- (UIImage)image;
- (UISearchToken)searchObject;
- (id)textValue;
- (void)setAttributedText:(id)a3;
- (void)setImage:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setSearchObject:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PXSearchToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_searchObject, 0);
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setRepresentedObject:(id)a3
{
}

- (PXSearchTokenRepresentedObject)representedObject
{
  return self->_representedObject;
}

- (void)setSearchObject:(id)a3
{
}

- (UISearchToken)searchObject
{
  return self->_searchObject;
}

- (id)textValue
{
  v3 = [(PXSearchToken *)self attributedText];
  v4 = [v3 string];
  if ([v4 length])
  {
    v5 = [(PXSearchToken *)self attributedText];
    v6 = [v5 string];
  }
  else
  {
    v6 = [(PXSearchToken *)self text];
  }

  if (![v6 length]) {
    PXAssertGetLog();
  }
  return v6;
}

- (PXSearchToken)initWithText:(id)a3 searchObject:(id)a4 representedObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchToken;
  v11 = [(PXSearchToken *)&v15 init];
  if (v11)
  {
    v12 = [MEMORY[0x1E4FB1C08] tokenWithIcon:0 text:v8];
    [(PXSearchToken *)v11 setSearchObject:v12];

    v13 = [(PXSearchToken *)v11 searchObject];
    [v13 setRepresentedObject:v10];

    [(PXSearchToken *)v11 setText:v8];
    [(PXSearchToken *)v11 setSearchObject:v9];
    [(PXSearchToken *)v11 setRepresentedObject:v10];
  }

  return v11;
}

- (PXSearchToken)initWithAttributedText:(id)a3 searchObject:(id)a4 representedObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchToken;
  v11 = [(PXSearchToken *)&v17 init];
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4FB1C08];
    v13 = [v8 string];
    v14 = [v12 tokenWithIcon:0 text:v13];
    [(PXSearchToken *)v11 setSearchObject:v14];

    objc_super v15 = [(PXSearchToken *)v11 searchObject];
    [v15 setRepresentedObject:v10];

    [(PXSearchToken *)v11 setAttributedText:v8];
    [(PXSearchToken *)v11 setSearchObject:v9];
    [(PXSearchToken *)v11 setRepresentedObject:v10];
  }

  return v11;
}

- (PXSearchToken)initWithText:(id)a3 image:(id)a4 representedObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchToken;
  v11 = [(PXSearchToken *)&v15 init];
  if (v11)
  {
    v12 = [MEMORY[0x1E4FB1C08] tokenWithIcon:v9 text:v8];
    [(PXSearchToken *)v11 setSearchObject:v12];

    v13 = [(PXSearchToken *)v11 searchObject];
    [v13 setRepresentedObject:v10];

    [(PXSearchToken *)v11 setRepresentedObject:v10];
    [(PXSearchToken *)v11 setText:v8];
    [(PXSearchToken *)v11 setImage:v9];
  }

  return v11;
}

@end