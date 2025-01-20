@interface PKActivityItemProvider
- (PKActivityItemProvider)initWithPass:(id)a3 passView:(id)a4 linkedApp:(id)a5 sharingMethod:(int64_t)a6;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation PKActivityItemProvider

- (PKActivityItemProvider)initWithPass:(id)a3 passView:(id)a4 linkedApp:(id)a5 sharingMethod:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6 == -1)
  {
    v16 = 0;
  }
  else
  {
    v14 = [MEMORY[0x1E4F1C9B8] data];
    v18.receiver = self;
    v18.super_class = (Class)PKActivityItemProvider;
    v15 = [(UIActivityItemProvider *)&v18 initWithPlaceholderItem:v14];

    if (v15)
    {
      objc_storeStrong((id *)&v15->_pass, a3);
      objc_storeStrong((id *)&v15->_passView, a4);
      objc_storeStrong((id *)&v15->_linkedApp, a5);
      v15->_sharingMethod = a6;
    }
    self = v15;
    v16 = self;
  }

  return v16;
}

- (id)item
{
  int64_t sharingMethod = self->_sharingMethod;
  pass = self->_pass;
  if (sharingMethod == 1) {
    [(PKPass *)pass sharingText];
  }
  else {
  v4 = [(PKPass *)pass archiveData];
  }

  return v4;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x1E4F874F8];
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  unint64_t v8 = [(PKPassView *)self->_passView suppressedContent];
  [(PKPassView *)self->_passView setSuppressedContent:70];
  v9 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](self->_passView, "snapshotOfFrontFaceWithRequestedSize:", width, height);
  [(PKPassView *)self->_passView setSuppressedContent:v8];

  return v9;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  return [(PKPass *)self->_pass organizationName];
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  v4 = [(PKLinkedApplication *)self->_linkedApp iconImage];
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E4FB1818];
    v6 = [(PKPass *)self->_pass iconImage];
    v4 = [v5 imageWithPKImage:v6];

    if (!v4)
    {
      v7 = (void *)MEMORY[0x1E4FB1818];
      unint64_t v8 = PKPassKitCoreBundle();
      v4 = [v7 imageNamed:@"GenericIcon" inBundle:v8];
    }
  }
  id v9 = objc_alloc(MEMORY[0x1E4F30A40]);
  v10 = UIImagePNGRepresentation(v4);
  id v11 = (void *)[v9 initWithData:v10 MIMEType:@"image/png"];

  id v12 = objc_alloc_init(MEMORY[0x1E4F30A70]);
  [v12 setIcon:v11];
  id v13 = objc_alloc_init(MEMORY[0x1E4F30AF0]);
  v14 = [(PKPass *)self->_pass localizedDescription];
  [v13 setName:v14];

  objc_msgSend(v13, "setStyle:", -[PKPass style](self->_pass, "style"));
  v15 = (void *)MEMORY[0x1E4F848B0];
  v16 = [(PKPass *)self->_pass relevantDates];
  v17 = [v15 findDateFromDates:v16 option:0];
  [v13 setEventDate:v17];

  objc_super v18 = [(PKPass *)self->_pass expirationDate];
  [v13 setExpirationDate:v18];

  [v12 setSpecialization:v13];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApp, 0);
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end