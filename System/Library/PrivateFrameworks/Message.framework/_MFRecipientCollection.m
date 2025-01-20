@interface _MFRecipientCollection
- (NSArray)bccRecipientStrings;
- (NSArray)bccRecipients;
- (NSArray)ccRecipientStrings;
- (NSArray)ccRecipients;
- (NSArray)toRecipientStrings;
- (NSArray)toRecipients;
- (_MFRecipientCollection)init;
- (void)addBCCRecipient:(id)a3;
- (void)addBCCRecipientWithAddress:(id)a3 displayName:(id)a4;
- (void)addCCRecipient:(id)a3;
- (void)addCCRecipientWithAddress:(id)a3 displayName:(id)a4;
- (void)addToRecipient:(id)a3;
- (void)addToRecipientWithAddress:(id)a3 displayName:(id)a4;
@end

@implementation _MFRecipientCollection

- (NSArray)toRecipientStrings
{
  return (NSArray *)[(NSMutableArray *)self->_to valueForKey:@"fullAddress"];
}

- (NSArray)ccRecipientStrings
{
  return (NSArray *)[(NSMutableArray *)self->_cc valueForKey:@"fullAddress"];
}

- (NSArray)bccRecipientStrings
{
  return (NSArray *)[(NSMutableArray *)self->_bcc valueForKey:@"fullAddress"];
}

- (void)addToRecipient:(id)a3
{
}

- (_MFRecipientCollection)init
{
  v10.receiver = self;
  v10.super_class = (Class)_MFRecipientCollection;
  v2 = [(_MFRecipientCollection *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    to = v2->_to;
    v2->_to = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cc = v2->_cc;
    v2->_cc = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bcc = v2->_bcc;
    v2->_bcc = v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
}

- (NSArray)toRecipients
{
  return (NSArray *)self->_to;
}

- (void)addToRecipientWithAddress:(id)a3 displayName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [[_MFEmailAddress alloc] initWithAddress:v8 displayName:v6];
  [(_MFRecipientCollection *)self addToRecipient:v7];
}

- (NSArray)ccRecipients
{
  return (NSArray *)self->_cc;
}

- (void)addCCRecipient:(id)a3
{
}

- (void)addCCRecipientWithAddress:(id)a3 displayName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [[_MFEmailAddress alloc] initWithAddress:v8 displayName:v6];
  [(_MFRecipientCollection *)self addCCRecipient:v7];
}

- (NSArray)bccRecipients
{
  return (NSArray *)self->_bcc;
}

- (void)addBCCRecipient:(id)a3
{
}

- (void)addBCCRecipientWithAddress:(id)a3 displayName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [[_MFEmailAddress alloc] initWithAddress:v8 displayName:v6];
  [(_MFRecipientCollection *)self addBCCRecipient:v7];
}

@end