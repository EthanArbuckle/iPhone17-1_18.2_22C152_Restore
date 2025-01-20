@interface VUIAppDocumentPurchaseEvent
- (NSString)canonicalID;
- (VUIAppDocumentPurchaseEvent)initWithDescriptor:(id)a3;
- (VUIAppDocumentPurchaseEvent)initWithPurchaseEventDescriptor:(id)a3;
- (id)dictionaryRepresentation;
- (void)setCanonicalID:(id)a3;
@end

@implementation VUIAppDocumentPurchaseEvent

- (VUIAppDocumentPurchaseEvent)initWithDescriptor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIAppDocumentPurchaseEvent)initWithPurchaseEventDescriptor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAppDocumentPurchaseEvent;
  return [(VUIAppDocumentUpdateEvent *)&v4 initWithDescriptor:a3];
}

- (id)dictionaryRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentPurchaseEvent;
  v3 = [(VUIAppDocumentUpdateEvent *)&v9 dictionaryRepresentation];
  objc_super v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(VUIAppDocumentPurchaseEvent *)self _purchaseEventDescriptor];
  v6 = [v5 canonicalID];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v6, @"canonicalId");

  v7 = (void *)[v4 copy];
  return v7;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end