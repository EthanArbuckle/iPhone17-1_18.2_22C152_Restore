@interface MFMessageInfoItem
- (ECEmailAddressConvertible)emailAddress;
- (ECSubject)subject;
- (EMAttachmentData)attachment;
- (MFMessageInfoItem)initWithAttachment:(id)a3;
- (MFMessageInfoItem)initWithEmail:(id)a3;
- (MFMessageInfoItem)initWithRichLink:(id)a3;
- (MFMessageInfoItem)initWithSubject:(id)a3;
- (NSURL)richLink;
@end

@implementation MFMessageInfoItem

- (MFMessageInfoItem)initWithEmail:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageInfoItem;
  v6 = [(MFMessageInfoItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_emailAddress, a3);
  }

  return v7;
}

- (MFMessageInfoItem)initWithSubject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageInfoItem;
  v6 = [(MFMessageInfoItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subject, a3);
  }

  return v7;
}

- (MFMessageInfoItem)initWithAttachment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageInfoItem;
  v6 = [(MFMessageInfoItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attachment, a3);
  }

  return v7;
}

- (MFMessageInfoItem)initWithRichLink:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageInfoItem;
  v6 = [(MFMessageInfoItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_richLink, a3);
  }

  return v7;
}

- (ECEmailAddressConvertible)emailAddress
{
  return self->_emailAddress;
}

- (ECSubject)subject
{
  return self->_subject;
}

- (EMAttachmentData)attachment
{
  return self->_attachment;
}

- (NSURL)richLink
{
  return self->_richLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLink, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end