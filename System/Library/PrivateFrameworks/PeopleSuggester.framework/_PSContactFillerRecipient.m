@interface _PSContactFillerRecipient
- (NSString)ID;
- (_CDInteraction)interaction;
- (_PSContactFillerRecipient)init;
- (void)setID:(id)a3;
- (void)setInteraction:(id)a3;
@end

@implementation _PSContactFillerRecipient

- (_PSContactFillerRecipient)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PSContactFillerRecipient;
  return [(_PSContactFillerRecipient *)&v3 init];
}

- (NSString)ID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setID:(id)a3
{
}

- (_CDInteraction)interaction
{
  return (_CDInteraction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end